
class Pkg
  @x
  @y
  @z
  @params # len_x, len_y, len_z
  def initialize(x,y,z,params)
    @x = x
    @y = y
    @z = z
    @params = params
    create()
  end # initialize
  
  def create()
	# add basis cube
    if (defined? $gp_pkg).nil? or $gp_pkg.deleted?
      $gp_pkg = Sketchup.active_model.entities.add_group
    end
    ents = $gp_pkg.entities
    
    len_x = @params[0]
    len_y = @params[1]
    #len_y = @params[0]
    #len_x = @params[1]
    len_z = @params[2]
	
    face = ents.add_face [@x,@y,@z], 
      [@x + len_x, @y, @z],
      [@x + len_x, @y + len_y, @z],
      [@x, @y + len_y, @z]
      #[@x,@y,@z]
    #socket_face.reverse! # unsafe
    path = ents.add_line [@x,@y,@z], [@x,@y, @z + len_z]
    face.followme path
    
  end # create
end
