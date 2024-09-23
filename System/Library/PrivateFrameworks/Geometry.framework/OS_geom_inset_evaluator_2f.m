@implementation OS_geom_inset_evaluator_2f

- (OS_geom_inset_evaluator_2f)init
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

  geom::straight_skeleton_evaluator<float>::~straight_skeleton_evaluator((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_inset_evaluator_2f;
  -[OS_geom_inset_evaluator_2f dealloc](&v3, sel_dealloc);
}

@end
