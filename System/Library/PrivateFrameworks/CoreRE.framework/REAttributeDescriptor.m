@implementation REAttributeDescriptor

- (REAttributeDescriptor)initWithName:(id)a3 buffer:(const void *)a4 elementSize:(unint64_t)a5 payloadLayout:(void *)a6
{
  id v10;
  REAttributeDescriptor *v11;

  v10 = a3;

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REAttributeDescriptor)initWithName:(id)a3 payloadOffset:(unsigned int)a4 count:(unsigned int)a5 stride:(unsigned int)a6
{
  id v10;
  REAttributeDescriptor *v11;
  uint64_t v12;
  NSString *name;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REAttributeDescriptor;
  v11 = -[REAttributeDescriptor init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v11->_payloadOffset = a4;
    v11->_count = a5;
    v11->_stride = a6;
  }

  return v11;
}

- (REAttributeDescriptor)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  NSString *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSString *v11;
  REAttributeDescriptor *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  v7 = self->_name;
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("payloadOffset"));
  self->_payloadOffset = v8;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
  self->_count = v9;
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stride"));
  self->_stride = v10;
  if (HIDWORD(v10) || HIDWORD(v9) || HIDWORD(v8))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v13);
LABEL_8:

    v12 = 0;
    goto LABEL_9;
  }
  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v13);
    goto LABEL_8;
  }
  v12 = self;
LABEL_9:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_payloadOffset, CFSTR("payloadOffset"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_count, CFSTR("count"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_stride, CFSTR("stride"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (BOOL)validateWithPayloadSize:(unint64_t)a3 error:(id *)a4
{
  unint64_t payloadOffset;
  unint64_t v7;

  payloadOffset = self->_payloadOffset;
  v7 = -[REAttributeDescriptor bufferSize](self, "bufferSize");
  if (v7 && !__CFADD__(payloadOffset, v7) && payloadOffset < a3 && payloadOffset + v7 <= a3)
    return 1;
  return 0;
}

- (unint64_t)bufferSize
{
  return self->_stride * self->_count;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  size_t InstanceSize;
  NSString *name;
  objc_class *v6;
  size_t v7;
  NSString *v8;

  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  name = self->_name;
  if (name)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = class_getInstanceSize(v6);
    v8 = self->_name;
    if (v8)
      name = (NSString *)(-[NSString lengthOfBytesUsingEncoding:](v8, "lengthOfBytesUsingEncoding:", 4) + 1);
    else
      name = 0;
  }
  else
  {
    v7 = 0;
  }
  return (unint64_t)name + v7 + InstanceSize;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)payloadOffset
{
  return self->_payloadOffset;
}

- (unsigned)count
{
  return self->_count;
}

- (unsigned)stride
{
  return self->_stride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
