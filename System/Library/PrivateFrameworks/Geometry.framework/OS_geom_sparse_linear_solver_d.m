@implementation OS_geom_sparse_linear_solver_d

- (OS_geom_sparse_linear_solver_d)init
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

  std::__destroy_at[abi:nn180100]<geom::sparse_linear_solver<float>,0>((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_sparse_linear_solver_d;
  -[OS_geom_sparse_linear_solver_d dealloc](&v3, sel_dealloc);
}

@end
