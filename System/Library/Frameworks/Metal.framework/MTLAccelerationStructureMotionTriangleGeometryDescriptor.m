@implementation MTLAccelerationStructureMotionTriangleGeometryDescriptor

+ (MTLAccelerationStructureMotionTriangleGeometryDescriptor)descriptor
{
  return objc_alloc_init(MTLAccelerationStructureMotionTriangleGeometryDescriptor);
}

- (MTLAccelerationStructureMotionTriangleGeometryDescriptor)init
{
  MTLAccelerationStructureMotionTriangleGeometryDescriptor *v2;
  MTLAccelerationStructureMotionTriangleGeometryDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
  v2 = -[MTLAccelerationStructureGeometryDescriptor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_indexType = 1;
    v2->_vertexFormat = 30;
    v2->_vertexStride = 0;
    v2->_transformationMatrixLayout = 0;
    v2->_vertexBuffers = (NSArray *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
  -[MTLAccelerationStructureGeometryDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
  v4 = -[MTLAccelerationStructureGeometryDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setVertexBuffers:", self->_vertexBuffers);
  objc_msgSend(v4, "setVertexStride:", self->_vertexStride);
  objc_msgSend(v4, "setIndexBuffer:", self->_indexBuffer);
  objc_msgSend(v4, "setIndexBufferOffset:", self->_indexBufferOffset);
  objc_msgSend(v4, "setIndexType:", self->_indexType);
  objc_msgSend(v4, "setTriangleCount:", self->_triangleCount);
  objc_msgSend(v4, "setVertexFormat:", self->_vertexFormat);
  objc_msgSend(v4, "setTransformationMatrixBuffer:", self->_transformationMatrixBuffer);
  objc_msgSend(v4, "setTransformationMatrixBufferOffset:", self->_transformationMatrixBufferOffset);
  objc_msgSend(v4, "setTransformationMatrixLayout:", self->_transformationMatrixLayout);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *Class;
  _BOOL4 v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  id v14;
  NSUInteger v15;
  MTLIndexType v16;
  NSUInteger v17;
  MTLAttributeFormat v18;
  id v19;
  NSUInteger v20;
  int64_t v21;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v24 = v3;
    v25 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
      goto LABEL_3;
    v23.receiver = self;
    v23.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
    v8 = -[MTLAccelerationStructureGeometryDescriptor isEqual:](&v23, sel_isEqual_, a3);
    if (!v8)
      return v8;
    v9 = -[NSArray count](-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers](self, "vertexBuffers"), "count");
    if (v9 != objc_msgSend((id)objc_msgSend(a3, "vertexBuffers"), "count"))
      goto LABEL_3;
    if (-[NSArray count](-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers](self, "vertexBuffers"), "count"))
    {
      v10 = 0;
      do
      {
        v11 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers](self, "vertexBuffers"), "objectAtIndexedSubscript:", v10), "buffer");
        if (v11 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "vertexBuffers"), "objectAtIndexedSubscript:", v10), "buffer"))goto LABEL_3;
        v12 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers](self, "vertexBuffers"), "objectAtIndexedSubscript:", v10), "offset");
        if (v12 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "vertexBuffers"), "objectAtIndexedSubscript:", v10), "offset"))goto LABEL_3;
      }
      while (-[NSArray count](-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers](self, "vertexBuffers"), "count") > ++v10);
    }
    v13 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexStride](self, "vertexStride");
    if (v13 != objc_msgSend(a3, "vertexStride")
      || (v14 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexBuffer](self, "indexBuffer"),
          v14 != (id)objc_msgSend(a3, "indexBuffer"))
      || (v15 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexBufferOffset](self, "indexBufferOffset"),
          v15 != objc_msgSend(a3, "indexBufferOffset"))
      || (v16 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexType](self, "indexType"),
          v16 != objc_msgSend(a3, "indexType"))
      || (v17 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor triangleCount](self, "triangleCount"),
          v17 != objc_msgSend(a3, "triangleCount"))
      || (v18 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexFormat](self, "vertexFormat"),
          v18 != objc_msgSend(a3, "vertexFormat"))
      || (v19 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBuffer](self, "transformationMatrixBuffer"), v19 != (id)objc_msgSend(a3, "transformationMatrixBuffer"))|| (v20 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBufferOffset](self, "transformationMatrixBufferOffset"), v20 != objc_msgSend(a3, "transformationMatrixBufferOffset")))
    {
LABEL_3:
      LOBYTE(v8) = 0;
      return v8;
    }
    v21 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixLayout](self, "transformationMatrixLayout");
    LOBYTE(v8) = v21 == objc_msgSend(a3, "transformationMatrixLayout");
  }
  return v8;
}

- (unint64_t)hash
{
  objc_super v4;
  _QWORD v5[11];

  bzero(v5, 0x58uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
  v5[0] = -[MTLAccelerationStructureGeometryDescriptor hash](&v4, sel_hash);
  v5[1] = MTLHashArray(-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers](self, "vertexBuffers"), 0, 1);
  v5[2] = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexStride](self, "vertexStride");
  v5[3] = objc_msgSend(-[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexBuffer](self, "indexBuffer"), "hash");
  v5[4] = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexBufferOffset](self, "indexBufferOffset");
  v5[5] = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexType](self, "indexType");
  v5[6] = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor triangleCount](self, "triangleCount");
  v5[7] = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexFormat](self, "vertexFormat");
  v5[8] = objc_msgSend(-[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBuffer](self, "transformationMatrixBuffer"), "hash");
  v5[9] = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBufferOffset](self, "transformationMatrixBufferOffset");
  v5[10] = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixLayout](self, "transformationMatrixLayout");
  return _MTLHashState((int *)v5, 0x58uLL);
}

- (void)setVertexBuffers:(NSArray *)vertexBuffers
{
  NSArray *v3;

  v3 = self->_vertexBuffers;
  if (v3 != vertexBuffers)
  {

    self->_vertexBuffers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", vertexBuffers, 1);
  }
}

- (NSArray)vertexBuffers
{
  return self->_vertexBuffers;
}

- (id)indexBuffer
{
  return self->_indexBuffer;
}

- (void)setIndexBuffer:(id)indexBuffer
{
  objc_setProperty_nonatomic(self, a2, indexBuffer, 72);
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

- (NSUInteger)triangleCount
{
  return self->_triangleCount;
}

- (void)setTriangleCount:(NSUInteger)triangleCount
{
  self->_triangleCount = triangleCount;
}

- (NSUInteger)vertexStride
{
  return self->_vertexStride;
}

- (void)setVertexStride:(NSUInteger)vertexStride
{
  self->_vertexStride = vertexStride;
}

- (MTLAttributeFormat)vertexFormat
{
  return self->_vertexFormat;
}

- (void)setVertexFormat:(MTLAttributeFormat)vertexFormat
{
  self->_vertexFormat = vertexFormat;
}

- (id)transformationMatrixBuffer
{
  return self->_transformationMatrixBuffer;
}

- (void)setTransformationMatrixBuffer:(id)transformationMatrixBuffer
{
  objc_setProperty_nonatomic(self, a2, transformationMatrixBuffer, 120);
}

- (NSUInteger)transformationMatrixBufferOffset
{
  return self->_transformationMatrixBufferOffset;
}

- (void)setTransformationMatrixBufferOffset:(NSUInteger)transformationMatrixBufferOffset
{
  self->_transformationMatrixBufferOffset = transformationMatrixBufferOffset;
}

- (int64_t)transformationMatrixLayout
{
  return self->_transformationMatrixLayout;
}

- (void)setTransformationMatrixLayout:(int64_t)a3
{
  self->_transformationMatrixLayout = a3;
}

@end
