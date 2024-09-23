@implementation MTLAttributeDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLAttributeDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLAttributeDescriptor *)+[MTLAttributeDescriptor allocWithZone:](MTLAttributeDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLAttributeDescriptor;
  return (MTLAttributeDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  MTLAttributeFormat v6;
  NSUInteger v7;
  NSUInteger v8;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v6 = -[MTLAttributeDescriptor format](self, "format");
  if (v6 != objc_msgSend(a3, "format"))
    return 0;
  v7 = -[MTLAttributeDescriptor offset](self, "offset");
  if (v7 != objc_msgSend(a3, "offset"))
    return 0;
  v8 = -[MTLAttributeDescriptor bufferIndex](self, "bufferIndex");
  return v8 == objc_msgSend(a3, "bufferIndex");
}

- (unint64_t)hash
{
  _QWORD v4[3];

  bzero(v4, 0x18uLL);
  v4[0] = -[MTLAttributeDescriptor format](self, "format");
  v4[1] = -[MTLAttributeDescriptor offset](self, "offset");
  v4[2] = -[MTLAttributeDescriptor bufferIndex](self, "bufferIndex");
  return _MTLHashState((int *)v4, 0x18uLL);
}

@end
