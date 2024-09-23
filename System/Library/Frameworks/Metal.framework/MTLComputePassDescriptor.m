@implementation MTLComputePassDescriptor

+ (MTLComputePassDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLComputePassDescriptor *)+[MTLComputePassDescriptor allocWithZone:](MTLComputePassDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLComputePassDescriptor;
  return (MTLComputePassDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLComputePassDescriptor)computePassDescriptor
{
  return (MTLComputePassDescriptor *)objc_alloc_init(MTLComputePassDescriptorInternal);
}

@end
