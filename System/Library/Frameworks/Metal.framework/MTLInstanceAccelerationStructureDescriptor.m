@implementation MTLInstanceAccelerationStructureDescriptor

- (NSUInteger)instanceDescriptorStride
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_overriddenInstanceDescriptorStride)
    return self->_instanceDescriptorStride;
  else
    return MTLAccelerationStructureInstanceDescriptorSize((MTLAccelerationStructureInstanceDescriptorType)self->_instanceDescriptorType, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (void)setInstanceDescriptorStride:(NSUInteger)instanceDescriptorStride
{
  self->_instanceDescriptorStride = instanceDescriptorStride;
  self->_overriddenInstanceDescriptorStride = 1;
}

+ (MTLInstanceAccelerationStructureDescriptor)descriptor
{
  return objc_alloc_init(MTLInstanceAccelerationStructureDescriptor);
}

- (MTLInstanceAccelerationStructureDescriptor)init
{
  MTLInstanceAccelerationStructureDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
  result = -[MTLInstanceAccelerationStructureDescriptor init](&v3, sel_init);
  if (result)
    result->_instanceTransformationMatrixLayout = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
  -[MTLInstanceAccelerationStructureDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSArray *instancedAccelerationStructures;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
  v4 = -[MTLAccelerationStructureDescriptor copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setInstanceDescriptorBuffer:", self->_instanceDescriptorBuffer);
  objc_msgSend(v4, "setInstanceDescriptorBufferOffset:", self->_instanceDescriptorBufferOffset);
  *((_BYTE *)v4 + 16) = self->_overriddenInstanceDescriptorStride;
  *((_QWORD *)v4 + 3) = self->_instanceDescriptorStride;
  objc_msgSend(v4, "setInstanceDescriptorType:", self->_instanceDescriptorType);
  objc_msgSend(v4, "setInstanceCount:", self->_instanceCount);
  instancedAccelerationStructures = self->_instancedAccelerationStructures;
  if (instancedAccelerationStructures)
    instancedAccelerationStructures = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
  objc_msgSend(v4, "setInstancedAccelerationStructures:", instancedAccelerationStructures);
  objc_msgSend(v4, "setMotionTransformBuffer:", self->_motionTransformBuffer);
  objc_msgSend(v4, "setMotionTransformBufferOffset:", self->_motionTransformBufferOffset);
  objc_msgSend(v4, "setMotionTransformCount:", self->_motionTransformCount);
  objc_msgSend(v4, "setInstanceTransformationMatrixLayout:", self->_instanceTransformationMatrixLayout);
  objc_msgSend(v4, "setMotionTransformType:", self->_motionTransformType);
  objc_msgSend(v4, "setMotionTransformStride:", self->_motionTransformStride);
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
  MTLAccelerationStructureInstanceDescriptorType v12;
  NSUInteger v13;
  int v14;
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v23 = v3;
    v24 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
      goto LABEL_3;
    v22.receiver = self;
    v22.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
    v8 = -[MTLAccelerationStructureDescriptor isEqual:](&v22, sel_isEqual_, a3);
    if (!v8)
      return v8;
    v9 = -[MTLInstanceAccelerationStructureDescriptor instanceDescriptorBuffer](self, "instanceDescriptorBuffer");
    if (v9 != (id)objc_msgSend(a3, "instanceDescriptorBuffer"))
      goto LABEL_3;
    v10 = -[MTLInstanceAccelerationStructureDescriptor instanceDescriptorBufferOffset](self, "instanceDescriptorBufferOffset");
    if (v10 != objc_msgSend(a3, "instanceDescriptorBufferOffset"))
      goto LABEL_3;
    v11 = -[MTLInstanceAccelerationStructureDescriptor instanceDescriptorStride](self, "instanceDescriptorStride");
    if (v11 != objc_msgSend(a3, "instanceDescriptorStride"))
      goto LABEL_3;
    v12 = -[MTLInstanceAccelerationStructureDescriptor instanceDescriptorType](self, "instanceDescriptorType");
    if (v12 != objc_msgSend(a3, "instanceDescriptorType"))
      goto LABEL_3;
    v13 = -[MTLInstanceAccelerationStructureDescriptor instanceCount](self, "instanceCount");
    if (v13 != objc_msgSend(a3, "instanceCount"))
      goto LABEL_3;
    v14 = MTLCompareArray(-[MTLInstanceAccelerationStructureDescriptor instancedAccelerationStructures](self, "instancedAccelerationStructures"), (void *)objc_msgSend(a3, "instancedAccelerationStructures"), 1, 0);
    LOBYTE(v8) = 0;
    if (!v14)
      return v8;
    v15 = -[MTLInstanceAccelerationStructureDescriptor motionTransformBuffer](self, "motionTransformBuffer");
    if (v15 == (id)objc_msgSend(a3, "motionTransformBuffer")
      && (v16 = -[MTLInstanceAccelerationStructureDescriptor motionTransformBufferOffset](self, "motionTransformBufferOffset"), v16 == objc_msgSend(a3, "motionTransformBufferOffset"))&& (v17 = -[MTLInstanceAccelerationStructureDescriptor motionTransformCount](self, "motionTransformCount"), v17 == objc_msgSend(a3, "motionTransformCount"))&& (v18 = -[MTLInstanceAccelerationStructureDescriptor instanceTransformationMatrixLayout](self, "instanceTransformationMatrixLayout"), v18 == objc_msgSend(a3, "instanceTransformationMatrixLayout"))&& (v19 = -[MTLInstanceAccelerationStructureDescriptor motionTransformType](self, "motionTransformType"), v19 == objc_msgSend(a3, "motionTransformType")))
    {
      v20 = -[MTLInstanceAccelerationStructureDescriptor motionTransformStride](self, "motionTransformStride");
      LOBYTE(v8) = v20 == objc_msgSend(a3, "motionTransformStride");
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
  _QWORD v5[13];

  bzero(v5, 0x68uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
  v5[0] = -[MTLAccelerationStructureDescriptor hash](&v4, sel_hash);
  v5[1] = objc_msgSend(-[MTLInstanceAccelerationStructureDescriptor instanceDescriptorBuffer](self, "instanceDescriptorBuffer"), "hash");
  v5[2] = -[MTLInstanceAccelerationStructureDescriptor instanceDescriptorBufferOffset](self, "instanceDescriptorBufferOffset");
  v5[3] = -[MTLInstanceAccelerationStructureDescriptor instanceDescriptorStride](self, "instanceDescriptorStride");
  v5[4] = -[MTLInstanceAccelerationStructureDescriptor instanceDescriptorType](self, "instanceDescriptorType");
  v5[5] = -[MTLInstanceAccelerationStructureDescriptor instanceCount](self, "instanceCount");
  v5[6] = MTLHashArray(-[MTLInstanceAccelerationStructureDescriptor instancedAccelerationStructures](self, "instancedAccelerationStructures"), 1, 0);
  v5[7] = objc_msgSend(-[MTLInstanceAccelerationStructureDescriptor motionTransformBuffer](self, "motionTransformBuffer"), "hash");
  v5[8] = -[MTLInstanceAccelerationStructureDescriptor motionTransformBufferOffset](self, "motionTransformBufferOffset");
  v5[9] = -[MTLInstanceAccelerationStructureDescriptor motionTransformCount](self, "motionTransformCount");
  v5[10] = -[MTLInstanceAccelerationStructureDescriptor instanceTransformationMatrixLayout](self, "instanceTransformationMatrixLayout");
  v5[11] = -[MTLInstanceAccelerationStructureDescriptor motionTransformType](self, "motionTransformType");
  v5[12] = -[MTLInstanceAccelerationStructureDescriptor motionTransformStride](self, "motionTransformStride");
  return _MTLHashState((int *)v5, 0x68uLL);
}

- (BOOL)isInstanceDescriptor
{
  return 1;
}

- (id)instanceDescriptorBuffer
{
  return self->_instanceDescriptorBuffer;
}

- (void)setInstanceDescriptorBuffer:(id)instanceDescriptorBuffer
{
  objc_setProperty_nonatomic(self, a2, instanceDescriptorBuffer, 32);
}

- (NSUInteger)instanceDescriptorBufferOffset
{
  return self->_instanceDescriptorBufferOffset;
}

- (void)setInstanceDescriptorBufferOffset:(NSUInteger)instanceDescriptorBufferOffset
{
  self->_instanceDescriptorBufferOffset = instanceDescriptorBufferOffset;
}

- (NSUInteger)instanceCount
{
  return self->_instanceCount;
}

- (void)setInstanceCount:(NSUInteger)instanceCount
{
  self->_instanceCount = instanceCount;
}

- (NSArray)instancedAccelerationStructures
{
  return self->_instancedAccelerationStructures;
}

- (void)setInstancedAccelerationStructures:(NSArray *)instancedAccelerationStructures
{
  objc_setProperty_nonatomic(self, a2, instancedAccelerationStructures, 56);
}

- (id)motionTransformBuffer
{
  return self->_motionTransformBuffer;
}

- (void)setMotionTransformBuffer:(id)motionTransformBuffer
{
  objc_setProperty_nonatomic(self, a2, motionTransformBuffer, 64);
}

- (NSUInteger)motionTransformBufferOffset
{
  return self->_motionTransformBufferOffset;
}

- (void)setMotionTransformBufferOffset:(NSUInteger)motionTransformBufferOffset
{
  self->_motionTransformBufferOffset = motionTransformBufferOffset;
}

- (NSUInteger)motionTransformCount
{
  return self->_motionTransformCount;
}

- (void)setMotionTransformCount:(NSUInteger)motionTransformCount
{
  self->_motionTransformCount = motionTransformCount;
}

- (int64_t)instanceTransformationMatrixLayout
{
  return self->_instanceTransformationMatrixLayout;
}

- (void)setInstanceTransformationMatrixLayout:(int64_t)a3
{
  self->_instanceTransformationMatrixLayout = a3;
}

- (int64_t)motionTransformType
{
  return self->_motionTransformType;
}

- (void)setMotionTransformType:(int64_t)a3
{
  self->_motionTransformType = a3;
}

- (unint64_t)motionTransformStride
{
  return self->_motionTransformStride;
}

- (void)setMotionTransformStride:(unint64_t)a3
{
  self->_motionTransformStride = a3;
}

- (MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType
{
  return self->_instanceDescriptorType;
}

- (void)setInstanceDescriptorType:(MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType
{
  self->_instanceDescriptorType = instanceDescriptorType;
}

@end
