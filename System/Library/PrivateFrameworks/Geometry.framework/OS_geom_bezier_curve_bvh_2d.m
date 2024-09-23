@implementation OS_geom_bezier_curve_bvh_2d

- (OS_geom_bezier_curve_bvh_2d)init
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

  geom_bezier_curve_bvh_2d_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_bezier_curve_bvh_2d;
  -[OS_geom_bvh_2d dealloc](&v3, sel_dealloc);
}

@end
