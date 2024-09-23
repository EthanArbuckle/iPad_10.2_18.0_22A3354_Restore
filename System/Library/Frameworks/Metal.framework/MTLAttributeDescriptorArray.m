@implementation MTLAttributeDescriptorArray

+ (MTLAttributeDescriptorArray)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLAttributeDescriptorArray *)+[MTLAttributeDescriptorArray allocWithZone:](MTLAttributeDescriptorArrayInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLAttributeDescriptorArray;
  return (MTLAttributeDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLAttributeDescriptor)objectAtIndexedSubscript:(NSUInteger)index
{
  return 0;
}

@end
