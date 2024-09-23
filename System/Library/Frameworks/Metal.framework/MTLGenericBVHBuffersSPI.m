@implementation MTLGenericBVHBuffersSPI

- (MTLGenericBVHBuffersSPI)init
{
  return -[MTLGenericBVHBuffersSPI initWithVersion:](self, "initWithVersion:", 256);
}

- (MTLGenericBVHBuffersSPI)initWithVersion:(unint64_t)a3
{
  MTLGenericBVHBuffersSPI *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLGenericBVHBuffersSPI;
  result = -[MTLGenericBVHBuffersSPI init](&v5, sel_init);
  if (result)
  {
    result->_version = a3;
    *(_OWORD *)&result->_headerBuffer = 0u;
    *(_OWORD *)&result->_innerNodeBuffer = 0u;
    *(_OWORD *)&result->_leafNodeBuffer = 0u;
    *(_OWORD *)&result->_primitiveBuffer = 0u;
    *(_OWORD *)&result->_geometryBuffer = 0u;
    *(_OWORD *)&result->_instanceTransformBuffer = 0u;
    *(_OWORD *)&result->_perPrimitiveDataBuffer = 0u;
    *(_OWORD *)&result->_controlPointBuffer = 0u;
  }
  return result;
}

- (unint64_t)version
{
  return self->_version;
}

- (MTLBuffer)headerBuffer
{
  return self->_headerBuffer;
}

- (void)setHeaderBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)headerBufferOffset
{
  return self->_headerBufferOffset;
}

- (void)setHeaderBufferOffset:(unint64_t)a3
{
  self->_headerBufferOffset = a3;
}

- (MTLBuffer)innerNodeBuffer
{
  return self->_innerNodeBuffer;
}

- (void)setInnerNodeBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)innerNodeBufferOffset
{
  return self->_innerNodeBufferOffset;
}

- (void)setInnerNodeBufferOffset:(unint64_t)a3
{
  self->_innerNodeBufferOffset = a3;
}

- (MTLBuffer)leafNodeBuffer
{
  return self->_leafNodeBuffer;
}

- (void)setLeafNodeBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)leafNodeBufferOffset
{
  return self->_leafNodeBufferOffset;
}

- (void)setLeafNodeBufferOffset:(unint64_t)a3
{
  self->_leafNodeBufferOffset = a3;
}

- (MTLBuffer)primitiveBuffer
{
  return self->_primitiveBuffer;
}

- (void)setPrimitiveBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unint64_t)primitiveBufferOffset
{
  return self->_primitiveBufferOffset;
}

- (void)setPrimitiveBufferOffset:(unint64_t)a3
{
  self->_primitiveBufferOffset = a3;
}

- (MTLBuffer)geometryBuffer
{
  return self->_geometryBuffer;
}

- (void)setGeometryBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (unint64_t)geometryBufferOffset
{
  return self->_geometryBufferOffset;
}

- (void)setGeometryBufferOffset:(unint64_t)a3
{
  self->_geometryBufferOffset = a3;
}

- (MTLBuffer)instanceTransformBuffer
{
  return self->_instanceTransformBuffer;
}

- (void)setInstanceTransformBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (unint64_t)instanceTransformBufferOffset
{
  return self->_instanceTransformBufferOffset;
}

- (void)setInstanceTransformBufferOffset:(unint64_t)a3
{
  self->_instanceTransformBufferOffset = a3;
}

- (MTLBuffer)perPrimitiveDataBuffer
{
  return self->_perPrimitiveDataBuffer;
}

- (void)setPerPrimitiveDataBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (unint64_t)perPrimitiveDataBufferOffset
{
  return self->_perPrimitiveDataBufferOffset;
}

- (void)setPerPrimitiveDataBufferOffset:(unint64_t)a3
{
  self->_perPrimitiveDataBufferOffset = a3;
}

- (MTLBuffer)controlPointBuffer
{
  return self->_controlPointBuffer;
}

- (void)setControlPointBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (unint64_t)controlPointBufferOffset
{
  return self->_controlPointBufferOffset;
}

- (void)setControlPointBufferOffset:(unint64_t)a3
{
  self->_controlPointBufferOffset = a3;
}

@end
