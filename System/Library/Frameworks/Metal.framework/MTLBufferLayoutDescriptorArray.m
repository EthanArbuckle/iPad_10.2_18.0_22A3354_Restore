@implementation MTLBufferLayoutDescriptorArray

+ (MTLBufferLayoutDescriptorArray)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLBufferLayoutDescriptorArray *)+[MTLBufferLayoutDescriptorArray allocWithZone:](MTLBufferLayoutDescriptorArrayInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLBufferLayoutDescriptorArray;
  return (MTLBufferLayoutDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLBufferLayoutDescriptor)objectAtIndexedSubscript:(NSUInteger)index
{
  return 0;
}

@end
