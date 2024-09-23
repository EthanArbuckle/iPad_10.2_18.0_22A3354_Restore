@implementation SCNMTLComputePipeline

- (void)setState:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 8);
}

- (void)setComputeFunction:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 16);
}

- (SCNMTLComputePipeline)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLComputePipeline;
  return -[SCNMTLComputePipeline init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLComputePipeline;
  -[SCNMTLComputePipeline dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v4), self);
}

@end
