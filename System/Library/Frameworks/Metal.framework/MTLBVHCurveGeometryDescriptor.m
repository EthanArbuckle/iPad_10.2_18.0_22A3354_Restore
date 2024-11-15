@implementation MTLBVHCurveGeometryDescriptor

- (unint64_t)primitiveType
{
  return 2;
}

- (NSArray)controlPointBuffers
{
  return (NSArray *)objc_loadWeak((id *)&self->_controlPointBuffers);
}

- (void)setControlPointBuffers:(id)a3
{
  objc_storeWeak((id *)&self->_controlPointBuffers, a3);
}

- (unint64_t)controlPointStride
{
  return self->_controlPointStride;
}

- (void)setControlPointStride:(unint64_t)a3
{
  self->_controlPointStride = a3;
}

- (NSArray)radiusBuffers
{
  return (NSArray *)objc_loadWeak((id *)&self->_radiusBuffers);
}

- (void)setRadiusBuffers:(id)a3
{
  objc_storeWeak((id *)&self->_radiusBuffers, a3);
}

- (unint64_t)radiusStride
{
  return self->_radiusStride;
}

- (void)setRadiusStride:(unint64_t)a3
{
  self->_radiusStride = a3;
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

- (unint64_t)controlPointFormat
{
  return self->_controlPointFormat;
}

- (void)setControlPointFormat:(unint64_t)a3
{
  self->_controlPointFormat = a3;
}

- (unint64_t)radiusFormat
{
  return self->_radiusFormat;
}

- (void)setRadiusFormat:(unint64_t)a3
{
  self->_radiusFormat = a3;
}

- (unint64_t)segmentControlPointCount
{
  return self->_segmentControlPointCount;
}

- (void)setSegmentControlPointCount:(unint64_t)a3
{
  self->_segmentControlPointCount = a3;
}

- (int64_t)curveType
{
  return self->_curveType;
}

- (void)setCurveType:(int64_t)a3
{
  self->_curveType = a3;
}

- (int64_t)curveBasis
{
  return self->_curveBasis;
}

- (void)setCurveBasis:(int64_t)a3
{
  self->_curveBasis = a3;
}

- (int64_t)curveEndCaps
{
  return self->_curveEndCaps;
}

- (void)setCurveEndCaps:(int64_t)a3
{
  self->_curveEndCaps = a3;
}

- (unint64_t)controlPointCount
{
  return self->_controlPointCount;
}

- (void)setControlPointCount:(unint64_t)a3
{
  self->_controlPointCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_indexBuffer);
  objc_destroyWeak((id *)&self->_radiusBuffers);
  objc_destroyWeak((id *)&self->_controlPointBuffers);
}

@end
