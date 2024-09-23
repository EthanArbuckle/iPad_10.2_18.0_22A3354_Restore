@implementation SCNReplicatorConstraint

- (SCNReplicatorConstraint)init
{
  char *v2;
  uint64_t Replicator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNReplicatorConstraint;
  v2 = -[SCNConstraint init](&v10, sel_init);
  if (v2)
  {
    Replicator = C3DConstraintCreateReplicator();
    v2[64] = 1;
    v2[65] = 1;
    *((_QWORD *)v2 + 1) = Replicator;
    v2[66] = 1;
    *(_OWORD *)(v2 + 68) = xmmword_1DD007610;
    *(_QWORD *)(v2 + 84) = 0;
    *((_DWORD *)v2 + 23) = 0;
    __asm { FMOV            V0.2S, #1.0 }
    *((_QWORD *)v2 + 12) = _D0;
    *((_DWORD *)v2 + 26) = 1065353216;
  }
  return (SCNReplicatorConstraint *)v2;
}

+ (id)replicatorConstraint
{
  return objc_alloc_init(SCNReplicatorConstraint);
}

+ (SCNReplicatorConstraint)replicatorConstraintWithTarget:(SCNNode *)target
{
  SCNReplicatorConstraint *v4;

  v4 = (SCNReplicatorConstraint *)objc_msgSend(a1, "replicatorConstraint");
  -[SCNReplicatorConstraint setTarget:](v4, "setTarget:", target);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTarget:", -[SCNReplicatorConstraint target](self, "target"));
  objc_msgSend(v4, "setReplicatesOrientation:", -[SCNReplicatorConstraint replicatesOrientation](self, "replicatesOrientation"));
  objc_msgSend(v4, "setReplicatesPosition:", -[SCNReplicatorConstraint replicatesPosition](self, "replicatesPosition"));
  objc_msgSend(v4, "setReplicatesScale:", -[SCNReplicatorConstraint replicatesScale](self, "replicatesScale"));
  -[SCNReplicatorConstraint orientationOffset](self, "orientationOffset");
  objc_msgSend(v4, "setOrientationOffset:");
  -[SCNReplicatorConstraint positionOffset](self, "positionOffset");
  objc_msgSend(v4, "setPositionOffset:");
  -[SCNReplicatorConstraint scaleOffset](self, "scaleOffset");
  objc_msgSend(v4, "setScaleOffset:");
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  return v4;
}

- (void)setTarget:(SCNNode *)target
{
  SCNNode *v5;
  uint64_t v6;
  __C3DScene *v7;
  _QWORD v8[6];

  v5 = target;
  self->_target = v5;
  if (v5)
    v6 = -[SCNNode nodeRef](v5, "nodeRef");
  else
    v6 = 0;
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SCNReplicatorConstraint_setTarget___block_invoke;
  v8[3] = &unk_1EA59E450;
  v8[4] = self;
  v8[5] = v6;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
}

CFTypeRef __37__SCNReplicatorConstraint_setTarget___block_invoke(uint64_t a1)
{
  return C3DConstraintAvoidOccluderSetTarget(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (SCNNode)target
{
  return self->_target;
}

- (void)setReplicatesOrientation:(BOOL)replicatesOrientation
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_replicateOrientation = replicatesOrientation;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SCNReplicatorConstraint_setReplicatesOrientation___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = replicatesOrientation;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __52__SCNReplicatorConstraint_setReplicatesOrientation___block_invoke(uint64_t a1)
{
  C3DConstraintReplicatorSetOrientationEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)replicatesOrientation
{
  return self->_replicateOrientation;
}

- (void)setReplicatesPosition:(BOOL)replicatesPosition
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_replicatePosition = replicatesPosition;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SCNReplicatorConstraint_setReplicatesPosition___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = replicatesPosition;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __49__SCNReplicatorConstraint_setReplicatesPosition___block_invoke(uint64_t a1)
{
  C3DConstraintReplicatorSetPositionEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (BOOL)replicatesPosition
{
  return self->_replicatePosition;
}

- (void)setReplicatesScale:(BOOL)replicatesScale
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_replicateScale = replicatesScale;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SCNReplicatorConstraint_setReplicatesScale___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = replicatesScale;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __46__SCNReplicatorConstraint_setReplicatesScale___block_invoke(uint64_t a1)
{
  C3DConstraintReplicatorSetScaleEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)replicatesScale
{
  return self->_replicateScale;
}

- (void)setOrientationOffset:(SCNQuaternion)orientationOffset
{
  float w;
  float z;
  float y;
  float x;
  __C3DScene *v8;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;
  float v13;

  w = orientationOffset.w;
  z = orientationOffset.z;
  y = orientationOffset.y;
  x = orientationOffset.x;
  self->_orientationOffset = orientationOffset;
  v8 = -[SCNConstraint sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__SCNReplicatorConstraint_setOrientationOffset___block_invoke;
  v9[3] = &unk_1EA5A15E8;
  v9[4] = self;
  v10 = x;
  v11 = y;
  v12 = z;
  v13 = w;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v8, self, CFSTR("orientationOffset"), v9);
}

void __48__SCNReplicatorConstraint_setOrientationOffset___block_invoke(uint64_t a1)
{
  C3DConstraintLookAtSetLocalFront(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), *(__n128 *)(a1 + 40));
}

- (SCNQuaternion)orientationOffset
{
  float x;
  float y;
  float z;
  float w;
  SCNQuaternion result;

  x = self->_orientationOffset.x;
  y = self->_orientationOffset.y;
  z = self->_orientationOffset.z;
  w = self->_orientationOffset.w;
  result.w = w;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPositionOffset:(SCNVector3)positionOffset
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = positionOffset.z;
  y = positionOffset.y;
  x = positionOffset.x;
  self->_positionOffset = positionOffset;
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SCNReplicatorConstraint_setPositionOffset___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("positionOffset"), v8);
}

void __45__SCNReplicatorConstraint_setPositionOffset___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintReplicatorSetPositionOffset(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (SCNVector3)positionOffset
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_positionOffset.x;
  y = self->_positionOffset.y;
  z = self->_positionOffset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScaleOffset:(SCNVector3)scaleOffset
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = scaleOffset.z;
  y = scaleOffset.y;
  x = scaleOffset.x;
  self->_scaleOffset = scaleOffset;
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SCNReplicatorConstraint_setScaleOffset___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("scaleOffset"), v8);
}

void __42__SCNReplicatorConstraint_setScaleOffset___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintDistanceSetTargetDirection(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (SCNVector3)scaleOffset
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_scaleOffset.x;
  y = self->_scaleOffset.y;
  z = self->_scaleOffset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_customEncodingOfSCNReplicatorConstraint:(id)a3
{
  SCNNode *target;

  target = self->_target;
  if (target)
    objc_msgSend(a3, "encodeObject:forKey:", target, CFSTR("target"));
}

- (void)_customDecodingOfSCNReplicatorConstraint:(id)a3
{
  self->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateReplicator();
  -[SCNReplicatorConstraint setTarget:](self, "setTarget:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target")));
  -[SCNConstraint finalizeDecodeConstraint:](self, "finalizeDecodeConstraint:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNReplicatorConstraint;
  -[SCNConstraint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  -[SCNReplicatorConstraint _customEncodingOfSCNReplicatorConstraint:](self, "_customEncodingOfSCNReplicatorConstraint:", a3);
  objc_msgSend(a3, "encodeBool:forKey:", self->_replicateOrientation, CFSTR("replicatesOrientation"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_replicateScale, CFSTR("replicatesScale"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_replicatePosition, CFSTR("replicatesPosition"));
  SCNEncodeVector4(a3, (uint64_t)CFSTR("orientationOffset"), self->_orientationOffset.x, self->_orientationOffset.y, self->_orientationOffset.z, self->_orientationOffset.w);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("positionOffset"), self->_positionOffset.x, self->_positionOffset.y, self->_positionOffset.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("scaleOffset"), self->_scaleOffset.x, self->_scaleOffset.y, self->_scaleOffset.z);
}

- (SCNReplicatorConstraint)initWithCoder:(id)a3
{
  SCNReplicatorConstraint *v4;
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNReplicatorConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNReplicatorConstraint _customDecodingOfSCNReplicatorConstraint:](v4, "_customDecodingOfSCNReplicatorConstraint:", a3);
    -[SCNReplicatorConstraint setReplicatesOrientation:](v4, "setReplicatesOrientation:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("replicatesOrientation")));
    -[SCNReplicatorConstraint setReplicatesScale:](v4, "setReplicatesScale:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("replicatesScale")));
    -[SCNReplicatorConstraint setReplicatesPosition:](v4, "setReplicatesPosition:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("replicatesPosition")));
    *(float *)&v6 = SCNDecodeVector4(a3, (uint64_t)CFSTR("orientationOffset"));
    -[SCNReplicatorConstraint setOrientationOffset:](v4, "setOrientationOffset:", v6);
    *(float *)&v7 = SCNDecodeVector3(a3, (uint64_t)CFSTR("positionOffset"));
    -[SCNReplicatorConstraint setPositionOffset:](v4, "setPositionOffset:", v7);
    *(float *)&v8 = SCNDecodeVector3(a3, (uint64_t)CFSTR("scaleOffset"));
    -[SCNReplicatorConstraint setScaleOffset:](v4, "setScaleOffset:", v8);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
