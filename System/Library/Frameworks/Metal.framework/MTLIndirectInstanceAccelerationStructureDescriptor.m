@implementation MTLIndirectInstanceAccelerationStructureDescriptor

+ (MTLIndirectInstanceAccelerationStructureDescriptor)descriptor
{
  return objc_alloc_init(MTLIndirectInstanceAccelerationStructureDescriptor);
}

- (MTLIndirectInstanceAccelerationStructureDescriptor)init
{
  MTLIndirectInstanceAccelerationStructureDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
  result = -[MTLIndirectInstanceAccelerationStructureDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_instanceDescriptorType = 3;
    result->_instanceTransformationMatrixLayout = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
  -[MTLIndirectInstanceAccelerationStructureDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
  v4 = -[MTLAccelerationStructureDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setInstanceDescriptorBuffer:", self->_instanceDescriptorBuffer);
  objc_msgSend(v4, "setInstanceDescriptorBufferOffset:", self->_instanceDescriptorBufferOffset);
  objc_msgSend(v4, "setMaxInstanceCount:", self->_maxInstanceCount);
  objc_msgSend(v4, "setInstanceCountBuffer:", self->_instanceCountBuffer);
  objc_msgSend(v4, "setInstanceCountBufferOffset:", self->_instanceCountBufferOffset);
  objc_msgSend(v4, "setInstanceDescriptorType:", self->_instanceDescriptorType);
  objc_msgSend(v4, "setMotionTransformBuffer:", self->_motionTransformBuffer);
  objc_msgSend(v4, "setMotionTransformBufferOffset:", self->_motionTransformBufferOffset);
  objc_msgSend(v4, "setMaxMotionTransformCount:", self->_maxMotionTransformCount);
  objc_msgSend(v4, "setMotionTransformType:", self->_motionTransformType);
  objc_msgSend(v4, "setMotionTransformStride:", self->_motionTransformStride);
  objc_msgSend(v4, "setMotionTransformCountBuffer:", self->_motionTransformCountBuffer);
  objc_msgSend(v4, "setMotionTransformCountBufferOffset:", self->_motionTransformCountBufferOffset);
  objc_msgSend(v4, "setInstanceTransformationMatrixLayout:", self->_instanceTransformationMatrixLayout);
  *((_BYTE *)v4 + 16) = self->_overriddenInstanceDescriptorStride;
  *((_QWORD *)v4 + 3) = self->_instanceDescriptorStride;
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
  id v13;
  NSUInteger v14;
  MTLAccelerationStructureInstanceDescriptorType v15;
  id v16;
  NSUInteger v17;
  NSUInteger v18;
  int64_t v19;
  unint64_t v20;
  id v21;
  NSUInteger v22;
  int64_t v23;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v26 = v3;
    v27 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
      goto LABEL_3;
    v25.receiver = self;
    v25.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
    v8 = -[MTLAccelerationStructureDescriptor isEqual:](&v25, sel_isEqual_, a3);
    if (!v8)
      return v8;
    v9 = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorBuffer](self, "instanceDescriptorBuffer");
    if (v9 != (id)objc_msgSend(a3, "instanceDescriptorBuffer"))
      goto LABEL_3;
    v10 = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorBufferOffset](self, "instanceDescriptorBufferOffset");
    if (v10 != objc_msgSend(a3, "instanceDescriptorBufferOffset"))
      goto LABEL_3;
    v11 = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorStride](self, "instanceDescriptorStride");
    if (v11 != objc_msgSend(a3, "instanceDescriptorStride"))
      goto LABEL_3;
    v12 = -[MTLIndirectInstanceAccelerationStructureDescriptor maxInstanceCount](self, "maxInstanceCount");
    if (v12 != objc_msgSend(a3, "maxInstanceCount"))
      goto LABEL_3;
    v13 = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceCountBuffer](self, "instanceCountBuffer");
    if (v13 != (id)objc_msgSend(a3, "instanceCountBuffer"))
      goto LABEL_3;
    v14 = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceCountBufferOffset](self, "instanceCountBufferOffset");
    if (v14 != objc_msgSend(a3, "instanceCountBufferOffset"))
      goto LABEL_3;
    v15 = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorType](self, "instanceDescriptorType");
    if (v15 != objc_msgSend(a3, "instanceDescriptorType"))
      goto LABEL_3;
    v16 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformBuffer](self, "motionTransformBuffer");
    if (v16 == (id)objc_msgSend(a3, "motionTransformBuffer")
      && (v17 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformBufferOffset](self, "motionTransformBufferOffset"), v17 == objc_msgSend(a3, "motionTransformBufferOffset"))&& (v18 = -[MTLIndirectInstanceAccelerationStructureDescriptor maxMotionTransformCount](self, "maxMotionTransformCount"), v18 == objc_msgSend(a3, "maxMotionTransformCount"))&& (v19 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformType](self, "motionTransformType"), v19 == objc_msgSend(a3, "motionTransformType"))&& (v20 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformStride](self, "motionTransformStride"), v20 == objc_msgSend(a3, "motionTransformStride"))&& (v21 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformCountBuffer](self, "motionTransformCountBuffer"), v21 == (id)objc_msgSend(a3, "motionTransformCountBuffer"))&& (v22 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformCountBufferOffset](self,
                  "motionTransformCountBufferOffset"),
          v22 == objc_msgSend(a3, "motionTransformCountBufferOffset")))
    {
      v23 = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceTransformationMatrixLayout](self, "instanceTransformationMatrixLayout");
      LOBYTE(v8) = v23 == objc_msgSend(a3, "instanceTransformationMatrixLayout");
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
  _QWORD v5[16];

  bzero(v5, 0x80uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
  v5[0] = -[MTLAccelerationStructureDescriptor hash](&v4, sel_hash);
  v5[1] = objc_msgSend(-[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorBuffer](self, "instanceDescriptorBuffer"), "hash");
  v5[2] = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorBufferOffset](self, "instanceDescriptorBufferOffset");
  v5[3] = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorStride](self, "instanceDescriptorStride");
  v5[4] = -[MTLIndirectInstanceAccelerationStructureDescriptor maxInstanceCount](self, "maxInstanceCount");
  v5[5] = objc_msgSend(-[MTLIndirectInstanceAccelerationStructureDescriptor instanceCountBuffer](self, "instanceCountBuffer"), "hash");
  v5[6] = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceCountBufferOffset](self, "instanceCountBufferOffset");
  v5[7] = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorType](self, "instanceDescriptorType");
  v5[8] = objc_msgSend(-[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformBuffer](self, "motionTransformBuffer"), "hash");
  v5[9] = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformBufferOffset](self, "motionTransformBufferOffset");
  v5[10] = -[MTLIndirectInstanceAccelerationStructureDescriptor maxMotionTransformCount](self, "maxMotionTransformCount");
  v5[11] = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformType](self, "motionTransformType");
  v5[12] = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformStride](self, "motionTransformStride");
  v5[13] = objc_msgSend(-[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformCountBuffer](self, "motionTransformCountBuffer"), "hash");
  v5[14] = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformCountBufferOffset](self, "motionTransformCountBufferOffset");
  v5[15] = -[MTLIndirectInstanceAccelerationStructureDescriptor instanceTransformationMatrixLayout](self, "instanceTransformationMatrixLayout");
  return _MTLHashState((int *)v5, 0x80uLL);
}

- (NSUInteger)instanceDescriptorStride
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t instanceDescriptorType;
  uint64_t vars0;

  if (self->_overriddenInstanceDescriptorStride)
    return self->_instanceDescriptorStride;
  instanceDescriptorType = self->_instanceDescriptorType;
  if (instanceDescriptorType == 3)
    return 72;
  if (instanceDescriptorType == 4)
    return 48;
  MTLReportFailure(0, "-[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorStride]", 1609, (uint64_t)CFSTR("Invalid instance descriptor type"), v2, v3, v4, v5, vars0);
  return 0;
}

- (void)setInstanceDescriptorStride:(NSUInteger)instanceDescriptorStride
{
  self->_instanceDescriptorStride = instanceDescriptorStride;
  self->_overriddenInstanceDescriptorStride = 1;
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

- (NSUInteger)maxInstanceCount
{
  return self->_maxInstanceCount;
}

- (void)setMaxInstanceCount:(NSUInteger)maxInstanceCount
{
  self->_maxInstanceCount = maxInstanceCount;
}

- (id)instanceCountBuffer
{
  return self->_instanceCountBuffer;
}

- (void)setInstanceCountBuffer:(id)instanceCountBuffer
{
  objc_setProperty_nonatomic(self, a2, instanceCountBuffer, 56);
}

- (NSUInteger)instanceCountBufferOffset
{
  return self->_instanceCountBufferOffset;
}

- (void)setInstanceCountBufferOffset:(NSUInteger)instanceCountBufferOffset
{
  self->_instanceCountBufferOffset = instanceCountBufferOffset;
}

- (MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType
{
  return self->_instanceDescriptorType;
}

- (void)setInstanceDescriptorType:(MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType
{
  self->_instanceDescriptorType = instanceDescriptorType;
}

- (id)motionTransformBuffer
{
  return self->_motionTransformBuffer;
}

- (void)setMotionTransformBuffer:(id)motionTransformBuffer
{
  objc_setProperty_nonatomic(self, a2, motionTransformBuffer, 80);
}

- (NSUInteger)motionTransformBufferOffset
{
  return self->_motionTransformBufferOffset;
}

- (void)setMotionTransformBufferOffset:(NSUInteger)motionTransformBufferOffset
{
  self->_motionTransformBufferOffset = motionTransformBufferOffset;
}

- (NSUInteger)maxMotionTransformCount
{
  return self->_maxMotionTransformCount;
}

- (void)setMaxMotionTransformCount:(NSUInteger)maxMotionTransformCount
{
  self->_maxMotionTransformCount = maxMotionTransformCount;
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

- (id)motionTransformCountBuffer
{
  return self->_motionTransformCountBuffer;
}

- (void)setMotionTransformCountBuffer:(id)motionTransformCountBuffer
{
  objc_setProperty_nonatomic(self, a2, motionTransformCountBuffer, 120);
}

- (NSUInteger)motionTransformCountBufferOffset
{
  return self->_motionTransformCountBufferOffset;
}

- (void)setMotionTransformCountBufferOffset:(NSUInteger)motionTransformCountBufferOffset
{
  self->_motionTransformCountBufferOffset = motionTransformCountBufferOffset;
}

- (int64_t)instanceTransformationMatrixLayout
{
  return self->_instanceTransformationMatrixLayout;
}

- (void)setInstanceTransformationMatrixLayout:(int64_t)a3
{
  self->_instanceTransformationMatrixLayout = a3;
}

@end
