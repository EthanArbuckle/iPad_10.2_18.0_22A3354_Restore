@implementation MTLVertexDescriptor

+ (MTLVertexDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLVertexDescriptor *)+[MTLVertexDescriptor allocWithZone:](MTLVertexDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLVertexDescriptor;
  return (MTLVertexDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (MTLVertexDescriptor)vertexDescriptor
{
  return (MTLVertexDescriptor *)objc_alloc_init(MTLVertexDescriptorInternal);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  return 0;
}

@end
