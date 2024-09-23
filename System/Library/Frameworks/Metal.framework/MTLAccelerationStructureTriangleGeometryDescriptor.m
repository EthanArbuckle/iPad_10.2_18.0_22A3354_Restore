@implementation MTLAccelerationStructureTriangleGeometryDescriptor

+ (MTLAccelerationStructureTriangleGeometryDescriptor)descriptor
{
  return objc_alloc_init(MTLAccelerationStructureTriangleGeometryDescriptor);
}

- (MTLAccelerationStructureTriangleGeometryDescriptor)init
{
  MTLAccelerationStructureTriangleGeometryDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
  result = -[MTLAccelerationStructureGeometryDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_indexType = 1;
    result->_vertexFormat = 30;
    result->_vertexStride = 0;
    result->_transformationMatrixLayout = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
  -[MTLAccelerationStructureGeometryDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
  v4 = -[MTLAccelerationStructureGeometryDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setVertexBuffer:", self->_vertexBuffer);
  objc_msgSend(v4, "setVertexBufferOffset:", self->_vertexBufferOffset);
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
  id v9;
  NSUInteger v10;
  NSUInteger v11;
  id v12;
  NSUInteger v13;
  MTLIndexType v14;
  NSUInteger v15;
  MTLAttributeFormat v16;
  id v17;
  NSUInteger v18;
  int64_t v19;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v22 = v3;
    v23 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
      goto LABEL_3;
    v21.receiver = self;
    v21.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
    v8 = -[MTLAccelerationStructureGeometryDescriptor isEqual:](&v21, sel_isEqual_, a3);
    if (!v8)
      return v8;
    v9 = -[MTLAccelerationStructureTriangleGeometryDescriptor vertexBuffer](self, "vertexBuffer");
    if (v9 != (id)objc_msgSend(a3, "vertexBuffer"))
      goto LABEL_3;
    v10 = -[MTLAccelerationStructureTriangleGeometryDescriptor vertexBufferOffset](self, "vertexBufferOffset");
    if (v10 != objc_msgSend(a3, "vertexBufferOffset"))
      goto LABEL_3;
    v11 = -[MTLAccelerationStructureTriangleGeometryDescriptor vertexStride](self, "vertexStride");
    if (v11 != objc_msgSend(a3, "vertexStride"))
      goto LABEL_3;
    v12 = -[MTLAccelerationStructureTriangleGeometryDescriptor indexBuffer](self, "indexBuffer");
    if (v12 == (id)objc_msgSend(a3, "indexBuffer")
      && (v13 = -[MTLAccelerationStructureTriangleGeometryDescriptor indexBufferOffset](self, "indexBufferOffset"),
          v13 == objc_msgSend(a3, "indexBufferOffset"))
      && (v14 = -[MTLAccelerationStructureTriangleGeometryDescriptor indexType](self, "indexType"),
          v14 == objc_msgSend(a3, "indexType"))
      && (v15 = -[MTLAccelerationStructureTriangleGeometryDescriptor triangleCount](self, "triangleCount"),
          v15 == objc_msgSend(a3, "triangleCount"))
      && (v16 = -[MTLAccelerationStructureTriangleGeometryDescriptor vertexFormat](self, "vertexFormat"),
          v16 == objc_msgSend(a3, "vertexFormat"))
      && (v17 = -[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBuffer](self, "transformationMatrixBuffer"), v17 == (id)objc_msgSend(a3, "transformationMatrixBuffer"))&& (v18 = -[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBufferOffset](self, "transformationMatrixBufferOffset"), v18 == objc_msgSend(a3, "transformationMatrixBufferOffset")))
    {
      v19 = -[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixLayout](self, "transformationMatrixLayout");
      LOBYTE(v8) = v19 == objc_msgSend(a3, "transformationMatrixLayout");
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
  objc_super v4;
  _QWORD v5[12];

  bzero(v5, 0x60uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
  v5[0] = -[MTLAccelerationStructureGeometryDescriptor hash](&v4, sel_hash);
  v5[1] = objc_msgSend(-[MTLAccelerationStructureTriangleGeometryDescriptor vertexBuffer](self, "vertexBuffer"), "hash");
  v5[2] = -[MTLAccelerationStructureTriangleGeometryDescriptor vertexBufferOffset](self, "vertexBufferOffset");
  v5[3] = -[MTLAccelerationStructureTriangleGeometryDescriptor vertexStride](self, "vertexStride");
  v5[4] = objc_msgSend(-[MTLAccelerationStructureTriangleGeometryDescriptor indexBuffer](self, "indexBuffer"), "hash");
  v5[5] = -[MTLAccelerationStructureTriangleGeometryDescriptor indexBufferOffset](self, "indexBufferOffset");
  v5[6] = -[MTLAccelerationStructureTriangleGeometryDescriptor indexType](self, "indexType");
  v5[7] = -[MTLAccelerationStructureTriangleGeometryDescriptor triangleCount](self, "triangleCount");
  v5[8] = -[MTLAccelerationStructureTriangleGeometryDescriptor vertexFormat](self, "vertexFormat");
  v5[9] = objc_msgSend(-[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBuffer](self, "transformationMatrixBuffer"), "hash");
  v5[10] = -[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBufferOffset](self, "transformationMatrixBufferOffset");
  v5[11] = -[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixLayout](self, "transformationMatrixLayout");
  return _MTLHashState((int *)v5, 0x60uLL);
}

- (id)vertexBuffer
{
  return self->_vertexBuffer;
}

- (void)setVertexBuffer:(id)vertexBuffer
{
  objc_setProperty_nonatomic(self, a2, vertexBuffer, 64);
}

- (NSUInteger)vertexBufferOffset
{
  return self->_vertexBufferOffset;
}

- (void)setVertexBufferOffset:(NSUInteger)vertexBufferOffset
{
  self->_vertexBufferOffset = vertexBufferOffset;
}

- (NSUInteger)vertexStride
{
  return self->_vertexStride;
}

- (void)setVertexStride:(NSUInteger)vertexStride
{
  self->_vertexStride = vertexStride;
}

- (id)indexBuffer
{
  return self->_indexBuffer;
}

- (void)setIndexBuffer:(id)indexBuffer
{
  objc_setProperty_nonatomic(self, a2, indexBuffer, 88);
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
  objc_setProperty_nonatomic(self, a2, transformationMatrixBuffer, 128);
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
