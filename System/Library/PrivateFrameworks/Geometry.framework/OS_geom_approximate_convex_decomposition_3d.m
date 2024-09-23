@implementation OS_geom_approximate_convex_decomposition_3d

- (OS_geom_approximate_convex_decomposition_3d)init
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

  geom::acd<double>::~acd((uint64_t *)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_approximate_convex_decomposition_3d;
  -[OS_geom_approximate_convex_decomposition_3d dealloc](&v3, sel_dealloc);
}

@end
