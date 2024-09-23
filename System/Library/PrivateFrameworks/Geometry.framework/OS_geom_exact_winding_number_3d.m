@implementation OS_geom_exact_winding_number_3d

- (OS_geom_exact_winding_number_3d)init
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

  geom_exact_winding_number_3d_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_exact_winding_number_3d;
  -[OS_geom_exact_winding_number_3d dealloc](&v3, sel_dealloc);
}

@end
