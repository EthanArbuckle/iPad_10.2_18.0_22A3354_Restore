@implementation MTLVertexAttributeDescriptorArray

+ (MTLVertexAttributeDescriptorArray)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLVertexAttributeDescriptorArray *)+[MTLVertexAttributeDescriptorArray allocWithZone:](MTLVertexAttributeDescriptorArrayInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLVertexAttributeDescriptorArray;
  return (MTLVertexAttributeDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLVertexAttributeDescriptor)objectAtIndexedSubscript:(NSUInteger)index
{
  return 0;
}

@end
