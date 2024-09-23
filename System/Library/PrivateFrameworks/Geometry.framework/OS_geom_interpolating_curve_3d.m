@implementation OS_geom_interpolating_curve_3d

- (OS_geom_interpolating_curve_3d)init
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

  geom::interpolating_curve<double>::~interpolating_curve((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_interpolating_curve_3d;
  -[OS_geom_interpolating_curve_3d dealloc](&v3, sel_dealloc);
}

@end
