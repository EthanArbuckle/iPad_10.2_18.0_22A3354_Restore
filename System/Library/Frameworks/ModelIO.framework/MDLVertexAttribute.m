@implementation MDLVertexAttribute

- (NSUInteger)offset
{
  return self->_offset;
}

- (vector_float4)initializationValue
{
  return *(vector_float4 *)self->_initializationValue;
}

- (void)setInitializationValue:(vector_float4)initializationValue
{
  *(vector_float4 *)self->_initializationValue = initializationValue;
}

- (MDLVertexFormat)format
{
  return self->_format;
}

- (NSString)name
{
  return self->_name;
}

- (NSTimeInterval)time
{
  return self->_time;
}

- (MDLVertexAttribute)init
{
  MDLVertexAttribute *v2;
  MDLVertexAttribute *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MDLVertexAttribute;
  v2 = -[MDLVertexAttribute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_1EA577998;

    v3->_offset = 0;
    v3->_bufferIndex = 0;
    v3->_format = 0;
    *(_OWORD *)v3->_initializationValue = xmmword_1DCC584A0;
  }
  return v3;
}

- (MDLVertexAttribute)initWithName:(NSString *)name format:(MDLVertexFormat)format offset:(NSUInteger)offset bufferIndex:(NSUInteger)bufferIndex
{
  NSString *v10;
  MDLVertexAttribute *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  NSString *v15;
  objc_super v17;

  v10 = name;
  v17.receiver = self;
  v17.super_class = (Class)MDLVertexAttribute;
  v11 = -[MDLVertexAttribute init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = objc_msgSend_initWithString_(v12, v13, (uint64_t)v10);
    v15 = v11->_name;
    v11->_name = (NSString *)v14;

    v11->_bufferIndex = bufferIndex;
    v11->_format = format;
    v11->_offset = offset;
    *(_OWORD *)v11->_initializationValue = xmmword_1DCC584A0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_allocWithZone_(MDLVertexAttribute, a2, (uint64_t)a3);
  return (id)objc_msgSend_initWithName_format_offset_bufferIndex_(v4, v5, (uint64_t)self->_name, self->_format, self->_offset, self->_bufferIndex);
}

- (NSUInteger)bufferIndex
{
  return self->_bufferIndex;
}

- (BOOL)isEqual:(id)a3
{
  MDLVertexAttribute *v4;
  uint64_t *v5;
  const char *v6;
  BOOL v7;

  v4 = (MDLVertexAttribute *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v7 = objc_msgSend_isEqualToString_(self->_name, v6, v5[1])
        && self->_offset == v5[2]
        && self->_bufferIndex == v5[3]
        && self->_format == v5[4];

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)hash
{
  uint64_t v2;

  return self->_offset + objc_msgSend_hash(self->_name, a2, v2) + 33 * (self->_format + self->_bufferIndex);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_name(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_format(self, v8, v9);
  v11 = sub_1DCBD213C(v10);
  v14 = objc_msgSend_bufferIndex(self, v12, v13);
  v17 = objc_msgSend_offset(self, v15, v16);
  objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)CFSTR("<%@: %p name=%@ format=%s bufferIndex=%lu offset=%lu>"), v4, self, v7, v11, v14, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 8);
}

- (void)setFormat:(MDLVertexFormat)format
{
  self->_format = format;
}

- (void)setOffset:(NSUInteger)offset
{
  self->_offset = offset;
}

- (void)setBufferIndex:(NSUInteger)bufferIndex
{
  self->_bufferIndex = bufferIndex;
}

- (void)setTime:(NSTimeInterval)time
{
  self->_time = time;
}

@end
