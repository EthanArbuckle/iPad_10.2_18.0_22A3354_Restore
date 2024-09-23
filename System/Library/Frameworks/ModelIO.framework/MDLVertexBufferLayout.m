@implementation MDLVertexBufferLayout

- (void)setStride:(NSUInteger)stride
{
  self->_stride = stride;
}

- (NSUInteger)stride
{
  return self->_stride;
}

- (BOOL)isEqual:(id)a3
{
  MDLVertexBufferLayout *v4;
  BOOL v5;

  v4 = (MDLVertexBufferLayout *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_stride == v4->_stride;
  }

  return v5;
}

- (MDLVertexBufferLayout)initWithStride:(NSUInteger)stride
{
  MDLVertexBufferLayout *v4;
  MDLVertexBufferLayout *v5;
  MDLVertexBufferLayout *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDLVertexBufferLayout;
  v4 = -[MDLVertexBufferLayout init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_stride = stride;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend_allocWithZone_(MDLVertexBufferLayout, a2, (uint64_t)a3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithStride_, self->_stride);
}

- (unint64_t)hash
{
  return self->_stride;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v7 = objc_msgSend_stride(self, v5, v6);
  return (id)objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: %p stride=%lu>"), v4, self, v7);
}

@end
