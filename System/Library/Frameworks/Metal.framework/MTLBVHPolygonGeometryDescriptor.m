@implementation MTLBVHPolygonGeometryDescriptor

- (unint64_t)primitiveType
{
  return 0;
}

- (unint64_t)polygonType
{
  return self->_polygonType;
}

- (void)setPolygonType:(unint64_t)a3
{
  self->_polygonType = a3;
}

- (NSArray)vertexBuffers
{
  return (NSArray *)objc_loadWeak((id *)&self->_vertexBuffers);
}

- (void)setVertexBuffers:(id)a3
{
  objc_storeWeak((id *)&self->_vertexBuffers, a3);
}

- (unint64_t)vertexStride
{
  return self->_vertexStride;
}

- (void)setVertexStride:(unint64_t)a3
{
  self->_vertexStride = a3;
}

- (MTLBuffer)indexBuffer
{
  return (MTLBuffer *)objc_loadWeak((id *)&self->_indexBuffer);
}

- (void)setIndexBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_indexBuffer, a3);
}

- (unint64_t)indexBufferOffset
{
  return self->_indexBufferOffset;
}

- (void)setIndexBufferOffset:(unint64_t)a3
{
  self->_indexBufferOffset = a3;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(unint64_t)a3
{
  self->_indexType = a3;
}

- (unint64_t)vertexFormat
{
  return self->_vertexFormat;
}

- (void)setVertexFormat:(unint64_t)a3
{
  self->_vertexFormat = a3;
}

- (MTLBuffer)transformationMatrixBuffer
{
  return (MTLBuffer *)objc_loadWeak((id *)&self->_transformationMatrixBuffer);
}

- (void)setTransformationMatrixBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_transformationMatrixBuffer, a3);
}

- (unint64_t)transformationMatrixBufferOffset
{
  return self->_transformationMatrixOffsetBuffer;
}

- (void)setTransformationMatrixBufferOffset:(unint64_t)a3
{
  self->_transformationMatrixOffsetBuffer = a3;
}

- (int64_t)transformationMatrixLayout
{
  return self->_transformationMatrixLayout;
}

- (void)setTransformationMatrixLayout:(int64_t)a3
{
  self->_transformationMatrixLayout = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transformationMatrixBuffer);
  objc_destroyWeak((id *)&self->_indexBuffer);
  objc_destroyWeak((id *)&self->_vertexBuffers);
}

@end
