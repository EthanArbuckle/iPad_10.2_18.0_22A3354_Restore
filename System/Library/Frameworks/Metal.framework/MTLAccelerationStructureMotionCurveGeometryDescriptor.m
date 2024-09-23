@implementation MTLAccelerationStructureMotionCurveGeometryDescriptor

- (int64_t)endCaps
{
  return self->_endCaps;
}

- (void)setEndCaps:(int64_t)a3
{
  self->_endCaps = a3;
}

+ (MTLAccelerationStructureMotionCurveGeometryDescriptor)descriptor
{
  return objc_alloc_init(MTLAccelerationStructureMotionCurveGeometryDescriptor);
}

- (MTLAccelerationStructureMotionCurveGeometryDescriptor)init
{
  MTLAccelerationStructureMotionCurveGeometryDescriptor *v2;
  MTLAccelerationStructureMotionCurveGeometryDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
  v2 = -[MTLAccelerationStructureGeometryDescriptor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_controlPointFormat = 30;
    v2->_radiusFormat = 28;
    v2->_indexType = 1;
    v2->_curveType = 0;
    v2->_curveBasis = 0;
    v2->_endCaps = 0;
    v2->_controlPointBuffers = (NSArray *)objc_opt_new();
    v3->_radiusBuffers = (NSArray *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
  -[MTLAccelerationStructureGeometryDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
  v4 = -[MTLAccelerationStructureGeometryDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setControlPointBuffers:", self->_controlPointBuffers);
  objc_msgSend(v4, "setControlPointCount:", self->_controlPointCount);
  objc_msgSend(v4, "setControlPointStride:", self->_controlPointStride);
  objc_msgSend(v4, "setControlPointFormat:", self->_controlPointFormat);
  objc_msgSend(v4, "setRadiusBuffers:", self->_radiusBuffers);
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
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  MTLAttributeFormat v19;
  MTLAttributeFormat v20;
  NSUInteger v21;
  id v22;
  NSUInteger v23;
  MTLIndexType v24;
  NSUInteger v25;
  NSUInteger v26;
  MTLCurveType v27;
  MTLCurveBasis v28;
  int64_t v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v32 = v3;
    v33 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
      goto LABEL_3;
    v31.receiver = self;
    v31.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
    v8 = -[MTLAccelerationStructureGeometryDescriptor isEqual:](&v31, sel_isEqual_, a3);
    if (!v8)
      return v8;
    v9 = -[NSArray count](-[MTLAccelerationStructureMotionCurveGeometryDescriptor controlPointBuffers](self, "controlPointBuffers"), "count");
    if (v9 != objc_msgSend((id)objc_msgSend(a3, "controlPointBuffers"), "count"))
      goto LABEL_3;
    v10 = -[NSArray count](-[MTLAccelerationStructureMotionCurveGeometryDescriptor radiusBuffers](self, "radiusBuffers"), "count");
    if (v10 != objc_msgSend((id)objc_msgSend(a3, "radiusBuffers"), "count"))
      goto LABEL_3;
    if (-[NSArray count](self->_controlPointBuffers, "count"))
    {
      v11 = 0;
      do
      {
        v12 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionCurveGeometryDescriptor controlPointBuffers](self, "controlPointBuffers"), "objectAtIndexedSubscript:", v11), "buffer");
        if (v12 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "controlPointBuffers"), "objectAtIndexedSubscript:", v11), "buffer"))goto LABEL_3;
        v13 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionCurveGeometryDescriptor controlPointBuffers](self, "controlPointBuffers"), "objectAtIndexedSubscript:", v11), "offset");
        if (v13 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "controlPointBuffers"), "objectAtIndexedSubscript:", v11), "offset"))goto LABEL_3;
      }
      while (++v11 < -[NSArray count](self->_controlPointBuffers, "count"));
    }
    if (-[NSArray count](self->_radiusBuffers, "count"))
    {
      v14 = 0;
      do
      {
        v15 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionCurveGeometryDescriptor radiusBuffers](self, "radiusBuffers"), "objectAtIndexedSubscript:", v14), "buffer");
        if (v15 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "radiusBuffers"), "objectAtIndexedSubscript:", v14), "buffer"))goto LABEL_3;
        v16 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionCurveGeometryDescriptor radiusBuffers](self, "radiusBuffers"), "objectAtIndexedSubscript:", v14), "offset");
        if (v16 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "radiusBuffers"), "objectAtIndexedSubscript:", v14), "offset"))goto LABEL_3;
      }
      while (++v14 < -[NSArray count](self->_radiusBuffers, "count"));
    }
    v17 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor controlPointCount](self, "controlPointCount");
    if (v17 != objc_msgSend(a3, "controlPointCount"))
      goto LABEL_3;
    v18 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor controlPointStride](self, "controlPointStride");
    if (v18 != objc_msgSend(a3, "controlPointStride"))
      goto LABEL_3;
    v19 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor controlPointFormat](self, "controlPointFormat");
    if (v19 != objc_msgSend(a3, "controlPointFormat"))
      goto LABEL_3;
    v20 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor radiusFormat](self, "radiusFormat");
    if (v20 != objc_msgSend(a3, "radiusFormat"))
      goto LABEL_3;
    v21 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor radiusStride](self, "radiusStride");
    if (v21 != objc_msgSend(a3, "radiusStride")
      || (v22 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor indexBuffer](self, "indexBuffer"),
          v22 != (id)objc_msgSend(a3, "indexBuffer"))
      || (v23 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor indexBufferOffset](self, "indexBufferOffset"),
          v23 != objc_msgSend(a3, "indexBufferOffset"))
      || (v24 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor indexType](self, "indexType"),
          v24 != objc_msgSend(a3, "indexType"))
      || (v25 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor segmentCount](self, "segmentCount"),
          v25 != objc_msgSend(a3, "segmentCount"))
      || (v26 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor segmentControlPointCount](self, "segmentControlPointCount"), v26 != objc_msgSend(a3, "segmentControlPointCount"))|| (v27 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor curveType](self, "curveType"), v27 != objc_msgSend(a3, "curveType"))|| (v28 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor curveBasis](self, "curveBasis"), v28 != objc_msgSend(a3, "curveBasis")))
    {
LABEL_3:
      LOBYTE(v8) = 0;
      return v8;
    }
    v29 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor endCaps](self, "endCaps");
    LOBYTE(v8) = v29 == objc_msgSend(a3, "endCaps");
  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t controlPointCount;
  unint64_t controlPointFormat;
  uint64_t v6;
  unint64_t radiusFormat;
  unint64_t radiusStride;
  uint64_t v9;
  unint64_t indexBufferOffset;
  unint64_t segmentCount;
  int64_t curveType;
  int64_t endCaps;
  objc_super v15;
  _QWORD v16[16];

  bzero(v16, 0x80uLL);
  v15.receiver = self;
  v15.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
  v16[0] = -[MTLAccelerationStructureGeometryDescriptor hash](&v15, sel_hash);
  v3 = MTLHashArray(self->_controlPointBuffers, 0, 1);
  controlPointCount = self->_controlPointCount;
  v16[1] = v3;
  v16[2] = controlPointCount;
  controlPointFormat = self->_controlPointFormat;
  v16[3] = self->_controlPointStride;
  v16[4] = controlPointFormat;
  v6 = MTLHashArray(self->_radiusBuffers, 0, 1);
  radiusFormat = self->_radiusFormat;
  radiusStride = self->_radiusStride;
  v16[5] = v6;
  v16[6] = radiusFormat;
  v16[7] = radiusStride;
  v9 = -[MTLBuffer hash](self->_indexBuffer, "hash");
  indexBufferOffset = self->_indexBufferOffset;
  v16[8] = v9;
  v16[9] = indexBufferOffset;
  segmentCount = self->_segmentCount;
  v16[10] = self->_indexType;
  v16[11] = segmentCount;
  curveType = self->_curveType;
  v16[12] = self->_segmentControlPointCount;
  v16[13] = curveType;
  endCaps = self->_endCaps;
  v16[14] = self->_curveBasis;
  v16[15] = endCaps;
  return _MTLHashState((int *)v16, 0x80uLL);
}

- (void)setControlPointBuffers:(NSArray *)controlPointBuffers
{
  NSArray *v3;

  v3 = self->_controlPointBuffers;
  if (v3 != controlPointBuffers)
  {

    self->_controlPointBuffers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", controlPointBuffers, 1);
  }
}

- (void)setRadiusBuffers:(NSArray *)radiusBuffers
{
  NSArray *v3;

  v3 = self->_radiusBuffers;
  if (v3 != radiusBuffers)
  {

    self->_radiusBuffers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", radiusBuffers, 1);
  }
}

- (NSArray)controlPointBuffers
{
  return self->_controlPointBuffers;
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

- (NSArray)radiusBuffers
{
  return self->_radiusBuffers;
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
  objc_setProperty_nonatomic(self, a2, indexBuffer, 120);
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
