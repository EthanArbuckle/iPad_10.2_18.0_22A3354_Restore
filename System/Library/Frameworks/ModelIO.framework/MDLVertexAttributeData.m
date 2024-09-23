@implementation MDLVertexAttributeData

- (MDLMeshBufferMap)map
{
  return self->_map;
}

- (void)dataStart
{
  return self->_dataStart;
}

- (NSUInteger)stride
{
  return self->_stride;
}

- (MDLVertexFormat)format
{
  return self->_format;
}

- (NSUInteger)bufferSize
{
  return self->_bufferSize;
}

- (MDLVertexAttributeData)init
{
  MDLVertexAttributeData *v2;
  MDLVertexAttributeData *v3;
  MDLVertexAttributeData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MDLVertexAttributeData;
  v2 = -[MDLVertexAttributeData init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)setBufferSize:(NSUInteger)bufferSize
{
  self->_bufferSize = bufferSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

@end
