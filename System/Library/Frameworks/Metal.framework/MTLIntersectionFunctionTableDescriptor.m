@implementation MTLIntersectionFunctionTableDescriptor

+ (MTLIntersectionFunctionTableDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLIntersectionFunctionTableDescriptor *)+[MTLIntersectionFunctionTableDescriptorInternal allocWithZone:](MTLIntersectionFunctionTableDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLIntersectionFunctionTableDescriptor;
  return (MTLIntersectionFunctionTableDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLIntersectionFunctionTableDescriptor)intersectionFunctionTableDescriptor
{
  return (MTLIntersectionFunctionTableDescriptor *)objc_alloc_init(MTLIntersectionFunctionTableDescriptorInternal);
}

@end
