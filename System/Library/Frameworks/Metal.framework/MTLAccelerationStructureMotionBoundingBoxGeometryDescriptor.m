@implementation MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor

+ (MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor)descriptor
{
  return objc_alloc_init(MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor);
}

- (MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor)init
{
  MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor *v2;
  MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor;
  v2 = -[MTLAccelerationStructureGeometryDescriptor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_boundingBoxStride = 24;
    v2->_boundingBoxBuffers = (NSArray *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor;
  -[MTLAccelerationStructureGeometryDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor;
  v4 = -[MTLAccelerationStructureGeometryDescriptor copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_boundingBoxBuffers, 1);
  objc_msgSend(v4, "setBoundingBoxBuffers:", v5);

  objc_msgSend(v4, "setBoundingBoxCount:", self->_boundingBoxCount);
  objc_msgSend(v4, "setBoundingBoxStride:", self->_boundingBoxStride);
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
  NSUInteger v14;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v17 = v3;
    v18 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
      goto LABEL_3;
    v16.receiver = self;
    v16.super_class = (Class)MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor;
    v8 = -[MTLAccelerationStructureGeometryDescriptor isEqual:](&v16, sel_isEqual_, a3);
    if (!v8)
      return v8;
    v9 = -[NSArray count](-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxBuffers](self, "boundingBoxBuffers"), "count");
    if (v9 != objc_msgSend((id)objc_msgSend(a3, "boundingBoxBuffers"), "count"))
      goto LABEL_3;
    if (-[NSArray count](-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxBuffers](self, "boundingBoxBuffers"), "count"))
    {
      v10 = 0;
      do
      {
        v11 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxBuffers](self, "boundingBoxBuffers"), "objectAtIndexedSubscript:", v10), "buffer");
        if (v11 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "boundingBoxBuffers"), "objectAtIndexedSubscript:", v10), "buffer"))goto LABEL_3;
        v12 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxBuffers](self, "boundingBoxBuffers"), "objectAtIndexedSubscript:", v10), "offset");
        if (v12 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "boundingBoxBuffers"), "objectAtIndexedSubscript:", v10), "offset"))goto LABEL_3;
      }
      while (-[NSArray count](-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxBuffers](self, "boundingBoxBuffers"), "count") > ++v10);
    }
    v13 = -[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxStride](self, "boundingBoxStride");
    if (v13 != objc_msgSend(a3, "boundingBoxStride"))
    {
LABEL_3:
      LOBYTE(v8) = 0;
      return v8;
    }
    v14 = -[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxCount](self, "boundingBoxCount");
    LOBYTE(v8) = v14 == objc_msgSend(a3, "boundingBoxCount");
  }
  return v8;
}

- (unint64_t)hash
{
  objc_super v4;
  _QWORD v5[4];

  bzero(v5, 0x20uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor;
  v5[0] = -[MTLAccelerationStructureGeometryDescriptor hash](&v4, sel_hash);
  v5[1] = MTLHashArray(-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxBuffers](self, "boundingBoxBuffers"), 0, 1);
  v5[2] = -[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxStride](self, "boundingBoxStride");
  v5[3] = -[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxCount](self, "boundingBoxCount");
  return _MTLHashState((int *)v5, 0x20uLL);
}

- (NSArray)boundingBoxBuffers
{
  return self->_boundingBoxBuffers;
}

- (void)setBoundingBoxBuffers:(NSArray *)boundingBoxBuffers
{
  objc_setProperty_nonatomic_copy(self, a2, boundingBoxBuffers, 64);
}

- (NSUInteger)boundingBoxCount
{
  return self->_boundingBoxCount;
}

- (void)setBoundingBoxCount:(NSUInteger)boundingBoxCount
{
  self->_boundingBoxCount = boundingBoxCount;
}

- (NSUInteger)boundingBoxStride
{
  return self->_boundingBoxStride;
}

- (void)setBoundingBoxStride:(NSUInteger)boundingBoxStride
{
  self->_boundingBoxStride = boundingBoxStride;
}

@end
