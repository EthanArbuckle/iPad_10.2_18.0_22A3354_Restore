@implementation MTLAccelerationStructureCurveGeometryDescriptor

- (int64_t)endCaps
{
  return self->_endCaps;
}

- (void)setEndCaps:(int64_t)a3
{
  self->_endCaps = a3;
}

+ (MTLAccelerationStructureCurveGeometryDescriptor)descriptor
{
  return objc_alloc_init(MTLAccelerationStructureCurveGeometryDescriptor);
}

- (MTLAccelerationStructureCurveGeometryDescriptor)init
{
  MTLAccelerationStructureCurveGeometryDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
  result = -[MTLAccelerationStructureGeometryDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_controlPointFormat = 30;
    result->_radiusFormat = 28;
    result->_indexType = 1;
    result->_curveType = 0;
    result->_curveBasis = 0;
    result->_endCaps = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
  -[MTLAccelerationStructureGeometryDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
  v4 = -[MTLAccelerationStructureGeometryDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setControlPointBuffer:", self->_controlPointBuffer);
  objc_msgSend(v4, "setControlPointBufferOffset:", self->_controlPointBufferOffset);
  objc_msgSend(v4, "setControlPointCount:", self->_controlPointCount);
  objc_msgSend(v4, "setControlPointStride:", self->_controlPointStride);
  objc_msgSend(v4, "setControlPointFormat:", self->_controlPointFormat);
  objc_msgSend(v4, "setRadiusBuffer:", self->_radiusBuffer);
  objc_msgSend(v4, "setRadiusBufferOffset:", self->_radiusBufferOffset);
  objc_msgSend(v4, "setRadiusFormat:", self->_radiusFormat);
  objc_msgSend(v4, "setRadiusStride:", self->_radiusStride);
  objc_msgSend(v4, "setIndexBuffer:", self->_indexBuffer);
  objc_msgSend(v4, "setIndexBufferOffset:", self->_indexBufferOffset);
  objc_msgSend(v4, "setIndexType:", self->_indexType);
  objc_msgSend(v4, "setSegmentCount:", self->_segmentCount);
  objc_msgSend(v4, "setSegmentControlPointCount:", self->_segmentControlPointCount);
  objc_msgSend(v4, "setCurveType:", self->_curveType);
  objc_msgSend(v4, "setCurveBasis:", self->_curveBasis);
  objc_msgSend(v4, "setEndCaps:", self->_endCaps);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *Class;
  _BOOL4 v8;
  id v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  MTLAttributeFormat v13;
  id v14;
  NSUInteger v15;
  MTLAttributeFormat v16;
  NSUInteger v17;
  id v18;
  NSUInteger v19;
  MTLIndexType v20;
  NSUInteger v21;
  NSUInteger v22;
  MTLCurveType v23;
  MTLCurveBasis v24;
  int64_t v25;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v28 = v3;
    v29 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
      goto LABEL_3;
    v27.receiver = self;
    v27.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
    v8 = -[MTLAccelerationStructureGeometryDescriptor isEqual:](&v27, sel_isEqual_, a3);
    if (!v8)
      return v8;
    v9 = -[MTLAccelerationStructureCurveGeometryDescriptor controlPointBuffer](self, "controlPointBuffer");
    if (v9 != (id)objc_msgSend(a3, "controlPointBuffer"))
      goto LABEL_3;
    v10 = -[MTLAccelerationStructureCurveGeometryDescriptor controlPointBufferOffset](self, "controlPointBufferOffset");
    if (v10 != objc_msgSend(a3, "controlPointBufferOffset"))
      goto LABEL_3;
    v11 = -[MTLAccelerationStructureCurveGeometryDescriptor controlPointCount](self, "controlPointCount");
    if (v11 != objc_msgSend(a3, "controlPointCount"))
      goto LABEL_3;
    v12 = -[MTLAccelerationStructureCurveGeometryDescriptor controlPointStride](self, "controlPointStride");
    if (v12 != objc_msgSend(a3, "controlPointStride"))
      goto LABEL_3;
    v13 = -[MTLAccelerationStructureCurveGeometryDescriptor controlPointFormat](self, "controlPointFormat");
    if (v13 != objc_msgSend(a3, "controlPointFormat"))
      goto LABEL_3;
    v14 = -[MTLAccelerationStructureCurveGeometryDescriptor radiusBuffer](self, "radiusBuffer");
    if (v14 != (id)objc_msgSend(a3, "radiusBuffer"))
      goto LABEL_3;
    v15 = -[MTLAccelerationStructureCurveGeometryDescriptor radiusBufferOffset](self, "radiusBufferOffset");
    if (v15 != objc_msgSend(a3, "radiusBufferOffset"))
      goto LABEL_3;
    v16 = -[MTLAccelerationStructureCurveGeometryDescriptor radiusFormat](self, "radiusFormat");
    if (v16 != objc_msgSend(a3, "radiusFormat"))
      goto LABEL_3;
    v17 = -[MTLAccelerationStructureCurveGeometryDescriptor radiusStride](self, "radiusStride");
    if (v17 != objc_msgSend(a3, "radiusStride"))
      goto LABEL_3;
    v18 = -[MTLAccelerationStructureCurveGeometryDescriptor indexBuffer](self, "indexBuffer");
    if (v18 == (id)objc_msgSend(a3, "indexBuffer")
      && (v19 = -[MTLAccelerationStructureCurveGeometryDescriptor indexBufferOffset](self, "indexBufferOffset"),
          v19 == objc_msgSend(a3, "indexBufferOffset"))
      && (v20 = -[MTLAccelerationStructureCurveGeometryDescriptor indexType](self, "indexType"),
          v20 == objc_msgSend(a3, "indexType"))
      && (v21 = -[MTLAccelerationStructureCurveGeometryDescriptor segmentCount](self, "segmentCount"),
          v21 == objc_msgSend(a3, "segmentCount"))
      && (v22 = -[MTLAccelerationStructureCurveGeometryDescriptor segmentControlPointCount](self, "segmentControlPointCount"), v22 == objc_msgSend(a3, "segmentControlPointCount"))&& (v23 = -[MTLAccelerationStructureCurveGeometryDescriptor curveType](self, "curveType"), v23 == objc_msgSend(a3, "curveType"))&& (v24 = -[MTLAccelerationStructureCurveGeometryDescriptor curveBasis](self, "curveBasis"), v24 == objc_msgSend(a3, "curveBasis")))
    {
      v25 = -[MTLAccelerationStructureCurveGeometryDescriptor endCaps](self, "endCaps");
      LOBYTE(v8) = v25 == objc_msgSend(a3, "endCaps");
    }
    else
    {
LABEL_3:
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t controlPointBufferOffset;
  unint64_t controlPointCount;
  unint64_t controlPointStride;
  unint64_t controlPointFormat;
  uint64_t v8;
  unint64_t radiusBufferOffset;
  unint64_t radiusStride;
  uint64_t v11;
  unint64_t indexBufferOffset;
  unint64_t segmentCount;
  int64_t curveType;
  int64_t endCaps;
  objc_super v17;
  _QWORD v18[18];

  bzero(v18, 0x90uLL);
  v17.receiver = self;
  v17.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
  v18[0] = -[MTLAccelerationStructureGeometryDescriptor hash](&v17, sel_hash);
  v3 = -[MTLBuffer hash](self->_controlPointBuffer, "hash");
  controlPointBufferOffset = self->_controlPointBufferOffset;
  controlPointCount = self->_controlPointCount;
  controlPointStride = self->_controlPointStride;
  v18[1] = v3;
  v18[2] = controlPointBufferOffset;
  controlPointFormat = self->_controlPointFormat;
  v18[3] = controlPointCount;
  v18[4] = controlPointStride;
  v18[5] = controlPointFormat;
  v8 = -[MTLBuffer hash](self->_radiusBuffer, "hash");
  radiusBufferOffset = self->_radiusBufferOffset;
  v18[6] = v8;
  v18[7] = radiusBufferOffset;
  radiusStride = self->_radiusStride;
  v18[8] = self->_radiusFormat;
  v18[9] = radiusStride;
  v11 = -[MTLBuffer hash](self->_indexBuffer, "hash");
  indexBufferOffset = self->_indexBufferOffset;
  v18[10] = v11;
  v18[11] = indexBufferOffset;
  segmentCount = self->_segmentCount;
  v18[12] = self->_indexType;
  v18[13] = segmentCount;
  curveType = self->_curveType;
  v18[14] = self->_segmentControlPointCount;
  v18[15] = curveType;
  endCaps = self->_endCaps;
  v18[16] = self->_curveBasis;
  v18[17] = endCaps;
  return _MTLHashState((int *)v18, 0x90uLL);
}

- (id)controlPointBuffer
{
  return self->_controlPointBuffer;
}

- (void)setControlPointBuffer:(id)controlPointBuffer
{
  objc_setProperty_nonatomic(self, a2, controlPointBuffer, 64);
}

- (NSUInteger)controlPointBufferOffset
{
  return self->_controlPointBufferOffset;
}

- (void)setControlPointBufferOffset:(NSUInteger)controlPointBufferOffset
{
  self->_controlPointBufferOffset = controlPointBufferOffset;
}

- (NSUInteger)controlPointCount
{
  return self->_controlPointCount;
}

- (void)setControlPointCount:(NSUInteger)controlPointCount
{
  self->_controlPointCount = controlPointCount;
}

- (NSUInteger)controlPointStride
{
  return self->_controlPointStride;
}

- (void)setControlPointStride:(NSUInteger)controlPointStride
{
  self->_controlPointStride = controlPointStride;
}

- (MTLAttributeFormat)controlPointFormat
{
  return self->_controlPointFormat;
}

- (void)setControlPointFormat:(MTLAttributeFormat)controlPointFormat
{
  self->_controlPointFormat = controlPointFormat;
}

- (id)radiusBuffer
{
  return self->_radiusBuffer;
}

- (void)setRadiusBuffer:(id)radiusBuffer
{
  objc_setProperty_nonatomic(self, a2, radiusBuffer, 104);
}

- (NSUInteger)radiusBufferOffset
{
  return self->_radiusBufferOffset;
}

- (void)setRadiusBufferOffset:(NSUInteger)radiusBufferOffset
{
  self->_radiusBufferOffset = radiusBufferOffset;
}

- (MTLAttributeFormat)radiusFormat
{
  return self->_radiusFormat;
}

- (void)setRadiusFormat:(MTLAttributeFormat)radiusFormat
{
  self->_radiusFormat = radiusFormat;
}

- (NSUInteger)radiusStride
{
  return self->_radiusStride;
}

- (void)setRadiusStride:(NSUInteger)radiusStride
{
  self->_radiusStride = radiusStride;
}

- (id)indexBuffer
{
  return self->_indexBuffer;
}

- (void)setIndexBuffer:(id)indexBuffer
{
  objc_setProperty_nonatomic(self, a2, indexBuffer, 136);
}

- (NSUInteger)indexBufferOffset
{
  return self->_indexBufferOffset;
}

- (void)setIndexBufferOffset:(NSUInteger)indexBufferOffset
{
  self->_indexBufferOffset = indexBufferOffset;
}

- (MTLIndexType)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(MTLIndexType)indexType
{
  self->_indexType = indexType;
}

- (NSUInteger)segmentCount
{
  return self->_segmentCount;
}

- (void)setSegmentCount:(NSUInteger)segmentCount
{
  self->_segmentCount = segmentCount;
}

- (NSUInteger)segmentControlPointCount
{
  return self->_segmentControlPointCount;
}

- (void)setSegmentControlPointCount:(NSUInteger)segmentControlPointCount
{
  self->_segmentControlPointCount = segmentControlPointCount;
}

- (MTLCurveBasis)curveBasis
{
  return self->_curveBasis;
}

- (void)setCurveBasis:(MTLCurveBasis)curveBasis
{
  self->_curveBasis = curveBasis;
}

- (MTLCurveType)curveType
{
  return self->_curveType;
}

- (void)setCurveType:(MTLCurveType)curveType
{
  self->_curveType = curveType;
}

- (MTLCurveEndCaps)curveEndCaps
{
  return self->_endCaps;
}

- (void)setCurveEndCaps:(MTLCurveEndCaps)curveEndCaps
{
  self->_endCaps = curveEndCaps;
}

@end
