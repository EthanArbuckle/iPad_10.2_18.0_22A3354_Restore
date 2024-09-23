@implementation MTLGenericBVHBufferSizesSPI

- (MTLGenericBVHBufferSizesSPI)initWithVersion:(unint64_t)a3
{
  MTLGenericBVHBufferSizesSPI *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLGenericBVHBufferSizesSPI;
  result = -[MTLGenericBVHBufferSizesSPI init](&v5, sel_init);
  if (result)
  {
    result->_version = a3;
    *(_OWORD *)&result->_headerBufferSize = 0u;
    *(_OWORD *)&result->_leafNodeBufferSize = 0u;
    *(_OWORD *)&result->_geometryBufferSize = 0u;
    *(_OWORD *)&result->_perPrimitiveDataBufferSize = 0u;
  }
  return result;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)headerBufferSize
{
  return self->_headerBufferSize;
}

- (void)setHeaderBufferSize:(unint64_t)a3
{
  self->_headerBufferSize = a3;
}

- (unint64_t)innerNodeBufferSize
{
  return self->_innerNodeBufferSize;
}

- (void)setInnerNodeBufferSize:(unint64_t)a3
{
  self->_innerNodeBufferSize = a3;
}

- (unint64_t)leafNodeBufferSize
{
  return self->_leafNodeBufferSize;
}

- (void)setLeafNodeBufferSize:(unint64_t)a3
{
  self->_leafNodeBufferSize = a3;
}

- (unint64_t)primitiveBufferSize
{
  return self->_primitiveBufferSize;
}

- (void)setPrimitiveBufferSize:(unint64_t)a3
{
  self->_primitiveBufferSize = a3;
}

- (unint64_t)geometryBufferSize
{
  return self->_geometryBufferSize;
}

- (void)setGeometryBufferSize:(unint64_t)a3
{
  self->_geometryBufferSize = a3;
}

- (unint64_t)instanceTransformBufferSize
{
  return self->_instanceTransformBufferSize;
}

- (void)setInstanceTransformBufferSize:(unint64_t)a3
{
  self->_instanceTransformBufferSize = a3;
}

- (unint64_t)perPrimitiveDataBufferSize
{
  return self->_perPrimitiveDataBufferSize;
}

- (void)setPerPrimitiveDataBufferSize:(unint64_t)a3
{
  self->_perPrimitiveDataBufferSize = a3;
}

- (unint64_t)controlPointBufferSize
{
  return self->_controlPointBufferSize;
}

- (void)setControlPointBufferSize:(unint64_t)a3
{
  self->_controlPointBufferSize = a3;
}

@end
