@implementation MTLPrimitiveAccelerationStructureDescriptor

+ (MTLPrimitiveAccelerationStructureDescriptor)descriptor
{
  return objc_alloc_init(MTLPrimitiveAccelerationStructureDescriptor);
}

- (MTLPrimitiveAccelerationStructureDescriptor)init
{
  MTLPrimitiveAccelerationStructureDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  result = -[MTLPrimitiveAccelerationStructureDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_motionStartBorderMode = 0;
    result->_motionEndBorderMode = 0;
    result->_motionStartTime = 0.0;
    result->_motionEndTime = 1.0;
    result->_motionKeyframeCount = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  -[MTLPrimitiveAccelerationStructureDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  v4 = -[MTLAccelerationStructureDescriptor copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_geometryDescriptors, 1);
  objc_msgSend(v4, "setGeometryDescriptors:", v5);

  objc_msgSend(v4, "setMotionStartBorderMode:", self->_motionStartBorderMode);
  objc_msgSend(v4, "setMotionEndBorderMode:", self->_motionEndBorderMode);
  *(float *)&v6 = self->_motionStartTime;
  objc_msgSend(v4, "setMotionStartTime:", v6);
  *(float *)&v7 = self->_motionEndTime;
  objc_msgSend(v4, "setMotionEndTime:", v7);
  objc_msgSend(v4, "setMotionKeyframeCount:", self->_motionKeyframeCount);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *Class;
  _BOOL4 v10;
  int v11;
  MTLMotionBorderMode v12;
  MTLMotionBorderMode v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  NSUInteger v20;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a3 == self)
  {
    LOBYTE(v10) = 1;
    return v10;
  }
  v23 = v6;
  v24 = v5;
  v25 = v3;
  v26 = v4;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    goto LABEL_3;
  v22.receiver = self;
  v22.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  v10 = -[MTLAccelerationStructureDescriptor isEqual:](&v22, sel_isEqual_, a3);
  if (v10)
  {
    v11 = MTLCompareArray(-[MTLPrimitiveAccelerationStructureDescriptor geometryDescriptors](self, "geometryDescriptors"), (void *)objc_msgSend(a3, "geometryDescriptors"), 1, 0);
    LOBYTE(v10) = 0;
    if (v11)
    {
      v12 = -[MTLPrimitiveAccelerationStructureDescriptor motionStartBorderMode](self, "motionStartBorderMode");
      if (v12 == objc_msgSend(a3, "motionStartBorderMode"))
      {
        v13 = -[MTLPrimitiveAccelerationStructureDescriptor motionEndBorderMode](self, "motionEndBorderMode");
        if (v13 == objc_msgSend(a3, "motionEndBorderMode"))
        {
          -[MTLPrimitiveAccelerationStructureDescriptor motionStartTime](self, "motionStartTime");
          v15 = v14;
          objc_msgSend(a3, "motionStartTime");
          if (v15 == v16)
          {
            -[MTLPrimitiveAccelerationStructureDescriptor motionEndTime](self, "motionEndTime");
            v18 = v17;
            objc_msgSend(a3, "motionEndTime");
            if (v18 == v19)
            {
              v20 = -[MTLPrimitiveAccelerationStructureDescriptor motionKeyframeCount](self, "motionKeyframeCount");
              LOBYTE(v10) = v20 == objc_msgSend(a3, "motionKeyframeCount");
              return v10;
            }
          }
        }
      }
LABEL_3:
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t motionStartBorderMode;
  float motionStartTime;
  float motionEndTime;
  objc_super v8;
  _QWORD v9[4];
  float v10;
  float v11;
  unint64_t motionKeyframeCount;

  bzero(v9, 0x30uLL);
  v8.receiver = self;
  v8.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  v9[0] = -[MTLAccelerationStructureDescriptor hash](&v8, sel_hash);
  v3 = MTLHashArray(-[MTLPrimitiveAccelerationStructureDescriptor geometryDescriptors](self, "geometryDescriptors"), 1, 0);
  motionStartBorderMode = self->_motionStartBorderMode;
  v9[1] = v3;
  v9[2] = motionStartBorderMode;
  motionStartTime = self->_motionStartTime;
  v9[3] = self->_motionEndBorderMode;
  motionEndTime = self->_motionEndTime;
  v10 = motionStartTime;
  v11 = motionEndTime;
  motionKeyframeCount = self->_motionKeyframeCount;
  return _MTLHashState((int *)v9, 0x30uLL);
}

- (NSArray)geometryDescriptors
{
  return self->_geometryDescriptors;
}

- (void)setGeometryDescriptors:(NSArray *)geometryDescriptors
{
  objc_setProperty_nonatomic(self, a2, geometryDescriptors, 32);
}

- (MTLMotionBorderMode)motionStartBorderMode
{
  return self->_motionStartBorderMode;
}

- (void)setMotionStartBorderMode:(MTLMotionBorderMode)motionStartBorderMode
{
  self->_motionStartBorderMode = motionStartBorderMode;
}

- (MTLMotionBorderMode)motionEndBorderMode
{
  return self->_motionEndBorderMode;
}

- (void)setMotionEndBorderMode:(MTLMotionBorderMode)motionEndBorderMode
{
  self->_motionEndBorderMode = motionEndBorderMode;
}

- (float)motionStartTime
{
  return self->_motionStartTime;
}

- (void)setMotionStartTime:(float)motionStartTime
{
  self->_motionStartTime = motionStartTime;
}

- (float)motionEndTime
{
  return self->_motionEndTime;
}

- (void)setMotionEndTime:(float)motionEndTime
{
  self->_motionEndTime = motionEndTime;
}

- (NSUInteger)motionKeyframeCount
{
  return self->_motionKeyframeCount;
}

- (void)setMotionKeyframeCount:(NSUInteger)motionKeyframeCount
{
  self->_motionKeyframeCount = motionKeyframeCount;
}

@end
