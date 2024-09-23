@implementation MTLBVHBoundingBoxGeometryDescriptor

- (unint64_t)primitiveType
{
  return 1;
}

- (NSArray)boundingBoxBuffers
{
  return (NSArray *)objc_loadWeak((id *)&self->_boundingBoxBuffers);
}

- (void)setBoundingBoxBuffers:(id)a3
{
  objc_storeWeak((id *)&self->_boundingBoxBuffers, a3);
}

- (unint64_t)boundingBoxStride
{
  return self->_boundingBoxStride;
}

- (void)setBoundingBoxStride:(unint64_t)a3
{
  self->_boundingBoxStride = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_boundingBoxBuffers);
}

@end
