@implementation OS_geom_refine_triangle_mesh_opt_3f

- (OS_geom_refine_triangle_mesh_opt_3f)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  std::__destroy_at[abi:nn180100]<geom::simplify_triangle_mesh_options<float>,0>((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_refine_triangle_mesh_opt_3f;
  -[OS_geom_refine_triangle_mesh_opt_3f dealloc](&v3, sel_dealloc);
}

@end
