@implementation MTLAccelerationStructureBoundingBoxGeometryDescriptor

+ (MTLAccelerationStructureBoundingBoxGeometryDescriptor)descriptor
{
  return objc_alloc_init(MTLAccelerationStructureBoundingBoxGeometryDescriptor);
}

- (MTLAccelerationStructureBoundingBoxGeometryDescriptor)init
{
  MTLAccelerationStructureBoundingBoxGeometryDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureBoundingBoxGeometryDescriptor;
  result = -[MTLAccelerationStructureGeometryDescriptor init](&v3, sel_init);
  if (result)
    result->_boundingBoxStride = 24;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureBoundingBoxGeometryDescriptor;
  -[MTLAccelerationStructureGeometryDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureBoundingBoxGeometryDescriptor;
  v4 = -[MTLAccelerationStructureGeometryDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setBoundingBoxBuffer:", self->_boundingBoxBuffer);
  objc_msgSend(v4, "setBoundingBoxBufferOffset:", self->_boundingBoxBufferOffset);
  objc_msgSend(v4, "setBoundingBoxStride:", self->_boundingBoxStride);
  objc_msgSend(v4, "setBoundingBoxCount:", self->_boundingBoxCount);
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
  objc_super v14;
  uint64_t v15;
  uint64_t v16;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v15 = v3;
    v16 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
      goto LABEL_3;
    v14.receiver = self;
    v14.super_class = (Class)MTLAccelerationStructureBoundingBoxGeometryDescriptor;
    v8 = -[MTLAccelerationStructureGeometryDescriptor isEqual:](&v14, sel_isEqual_, a3);
    if (!v8)
      return v8;
    v9 = -[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxBuffer](self, "boundingBoxBuffer");
    if (v9 == (id)objc_msgSend(a3, "boundingBoxBuffer")
      && (v10 = -[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxBufferOffset](self, "boundingBoxBufferOffset"), v10 == objc_msgSend(a3, "boundingBoxBufferOffset"))&& (v11 = -[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxStride](self, "boundingBoxStride"), v11 == objc_msgSend(a3, "boundingBoxStride")))
    {
      v12 = -[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxCount](self, "boundingBoxCount");
      LOBYTE(v8) = v12 == objc_msgSend(a3, "boundingBoxCount");
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
  _QWORD v5[5];

  bzero(v5, 0x28uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructureBoundingBoxGeometryDescriptor;
  v5[0] = -[MTLAccelerationStructureGeometryDescriptor hash](&v4, sel_hash);
  v5[1] = objc_msgSend(-[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxBuffer](self, "boundingBoxBuffer"), "hash");
  v5[2] = -[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxBufferOffset](self, "boundingBoxBufferOffset");
  v5[3] = -[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxStride](self, "boundingBoxStride");
  v5[4] = -[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxCount](self, "boundingBoxCount");
  return _MTLHashState((int *)v5, 0x28uLL);
}

- (id)boundingBoxBuffer
{
  return self->_boundingBoxBuffer;
}

- (void)setBoundingBoxBuffer:(id)boundingBoxBuffer
{
  objc_setProperty_nonatomic(self, a2, boundingBoxBuffer, 64);
}

- (NSUInteger)boundingBoxBufferOffset
{
  return self->_boundingBoxBufferOffset;
}

- (void)setBoundingBoxBufferOffset:(NSUInteger)boundingBoxBufferOffset
{
  self->_boundingBoxBufferOffset = boundingBoxBufferOffset;
}

- (NSUInteger)boundingBoxStride
{
  return self->_boundingBoxStride;
}

- (void)setBoundingBoxStride:(NSUInteger)boundingBoxStride
{
  self->_boundingBoxStride = boundingBoxStride;
}

- (NSUInteger)boundingBoxCount
{
  return self->_boundingBoxCount;
}

- (void)setBoundingBoxCount:(NSUInteger)boundingBoxCount
{
  self->_boundingBoxCount = boundingBoxCount;
}

@end
