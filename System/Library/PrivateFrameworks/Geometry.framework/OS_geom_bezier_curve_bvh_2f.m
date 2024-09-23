@implementation OS_geom_bezier_curve_bvh_2f

- (OS_geom_bezier_curve_bvh_2f)init
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

  geom_bezier_curve_bvh_2f_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_bezier_curve_bvh_2f;
  -[OS_geom_bvh_2f dealloc](&v3, sel_dealloc);
}

@end
