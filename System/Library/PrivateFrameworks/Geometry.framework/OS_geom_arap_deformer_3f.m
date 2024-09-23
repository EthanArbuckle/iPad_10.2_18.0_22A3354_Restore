@implementation OS_geom_arap_deformer_3f

- (OS_geom_arap_deformer_3f)init
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

  geom::arap_deformer<float>::~arap_deformer((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_arap_deformer_3f;
  -[OS_geom_arap_deformer_3f dealloc](&v3, sel_dealloc);
}

@end
