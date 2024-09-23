@implementation CATransformLayer

- (CATransformLayer)init
{
  CATransformLayer *result;
  unsigned int *v3;
  unsigned int v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CATransformLayer;
  result = -[CALayer init](&v5, sel_init);
  if (result)
  {
    v3 = (unsigned int *)((char *)result->super._attr.layer + 4);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 | 0x10000, v3));
  }
  return result;
}

- (CATransformLayer)initWithLayer:(id)a3
{
  CATransformLayer *result;
  unsigned int *v4;
  unsigned int v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CATransformLayer;
  result = -[CALayer initWithLayer:](&v6, sel_initWithLayer_, a3);
  if (result)
  {
    v4 = (unsigned int *)((char *)result->super._attr.layer + 4);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 | 0x10000, v4));
  }
  return result;
}

@end
