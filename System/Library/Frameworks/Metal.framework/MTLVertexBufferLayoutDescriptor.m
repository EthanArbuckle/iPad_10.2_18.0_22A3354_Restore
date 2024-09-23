@implementation MTLVertexBufferLayoutDescriptor

+ (MTLVertexBufferLayoutDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLVertexBufferLayoutDescriptor *)+[MTLVertexBufferLayoutDescriptor allocWithZone:](MTLVertexBufferLayoutDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLVertexBufferLayoutDescriptor;
  return (MTLVertexBufferLayoutDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  NSUInteger v6;
  MTLVertexStepFunction v7;
  NSUInteger v8;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v6 = -[MTLVertexBufferLayoutDescriptor stride](self, "stride");
  if (v6 != objc_msgSend(a3, "stride"))
    return 0;
  v7 = -[MTLVertexBufferLayoutDescriptor stepFunction](self, "stepFunction");
  if (v7 != objc_msgSend(a3, "stepFunction"))
    return 0;
  v8 = -[MTLVertexBufferLayoutDescriptor stepRate](self, "stepRate");
  return v8 == objc_msgSend(a3, "stepRate");
}

- (unint64_t)hash
{
  _QWORD v4[3];

  bzero(v4, 0x18uLL);
  v4[0] = -[MTLVertexBufferLayoutDescriptor stride](self, "stride");
  v4[1] = -[MTLVertexBufferLayoutDescriptor stepFunction](self, "stepFunction");
  v4[2] = -[MTLVertexBufferLayoutDescriptor stepRate](self, "stepRate");
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (BOOL)isStrideDynamic
{
  return -[MTLVertexBufferLayoutDescriptor stride](self, "stride") == -1;
}

@end
