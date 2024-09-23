@implementation SCNLookAtConstraint

- (SCNLookAtConstraint)initWithTarget:(id)a3
{
  char *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNLookAtConstraint;
  v4 = -[SCNConstraint init](&v7, sel_init);
  if (v4)
  {
    v5 = a3;
    *((_QWORD *)v4 + 7) = v5;
    if (v5)
      v5 = (id)objc_msgSend(v5, "nodeRef");
    v4[64] = 0;
    *((_DWORD *)v4 + 19) = 0;
    *(_QWORD *)(v4 + 68) = 0;
    *(_QWORD *)(v4 + 92) = 0;
    *((_DWORD *)v4 + 25) = -1082130432;
    *((_QWORD *)v4 + 10) = 0x3F80000000000000;
    *((_DWORD *)v4 + 22) = 0;
    *((_QWORD *)v4 + 1) = C3DConstraintCreateLookAt(v5);
  }
  return (SCNLookAtConstraint *)v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNLookAtConstraint;
  -[SCNConstraint dealloc](&v3, sel_dealloc);
}

+ (SCNLookAtConstraint)lookAtConstraintWithTarget:(SCNNode *)target
{
  return -[SCNLookAtConstraint initWithTarget:]([SCNLookAtConstraint alloc], "initWithTarget:", target);
}

- (BOOL)gimbalLockEnabled
{
  return self->_gimbalLockEnabled;
}

- (void)setGimbalLockEnabled:(BOOL)gimbalLockEnabled
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_gimbalLockEnabled = gimbalLockEnabled;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SCNLookAtConstraint_setGimbalLockEnabled___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = gimbalLockEnabled;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __44__SCNLookAtConstraint_setGimbalLockEnabled___block_invoke(uint64_t a1)
{
  C3DConstraintLookAtSetGimbalLockEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (SCNNode)target
{
  return self->_target;
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
  v8[2] = __33__SCNLookAtConstraint_setTarget___block_invoke;
  v8[3] = &unk_1EA59E450;
  v8[4] = self;
  v8[5] = v6;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
}

CFTypeRef __33__SCNLookAtConstraint_setTarget___block_invoke(uint64_t a1)
{
  return C3DConstraintAvoidOccluderSetTarget(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (SCNVector3)targetOffset
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_targetOffset.x;
  y = self->_targetOffset.y;
  z = self->_targetOffset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetOffset:(SCNVector3)targetOffset
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = targetOffset.z;
  y = targetOffset.y;
  x = targetOffset.x;
  self->_targetOffset = targetOffset;
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SCNLookAtConstraint_setTargetOffset___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("targetOffset"), v8);
}

double __39__SCNLookAtConstraint_setTargetOffset___block_invoke(uint64_t a1, __n128 a2)
{
  double result;

  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  *(_QWORD *)&result = C3DConstraintLookAtSetTargetOffset((__n128 *)*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2).n128_u64[0];
  return result;
}

- (SCNVector3)worldUp
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_upVector.x;
  y = self->_upVector.y;
  z = self->_upVector.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setWorldUp:(SCNVector3)worldUp
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = worldUp.z;
  y = worldUp.y;
  x = worldUp.x;
  self->_upVector = worldUp;
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__SCNLookAtConstraint_setWorldUp___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("worldUp"), v8);
}

double __34__SCNLookAtConstraint_setWorldUp___block_invoke(uint64_t a1, __n128 a2)
{
  double result;

  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  *(_QWORD *)&result = C3DConstraintLookAtSetUpVector((__n128 *)*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2).n128_u64[0];
  return result;
}

- (SCNVector3)localFront
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_localFront.x;
  y = self->_localFront.y;
  z = self->_localFront.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocalFront:(SCNVector3)localFront
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = localFront.z;
  y = localFront.y;
  x = localFront.x;
  self->_localFront = localFront;
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SCNLookAtConstraint_setLocalFront___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("localFront"), v8);
}

void __37__SCNLookAtConstraint_setLocalFront___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintLookAtSetLocalFront(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTarget:", self->_target);
  objc_msgSend(v4, "setGimbalLockEnabled:", -[SCNLookAtConstraint gimbalLockEnabled](self, "gimbalLockEnabled"));
  -[SCNLookAtConstraint targetOffset](self, "targetOffset");
  objc_msgSend(v4, "setTargetOffset:");
  -[SCNLookAtConstraint upVector](self, "upVector");
  objc_msgSend(v4, "setUpVector:");
  -[SCNLookAtConstraint localFront](self, "localFront");
  objc_msgSend(v4, "setLocalFront:");
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  return v4;
}

- (void)_customEncodingOfSCNLookAtConstraint:(id)a3
{
  SCNNode *target;

  target = self->_target;
  if (target)
    objc_msgSend(a3, "encodeObject:forKey:", target, CFSTR("target"));
}

- (void)_customDecodingOfSCNLookAtConstraint:(id)a3
{
  SCNNode *v5;

  v5 = (SCNNode *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
  self->_target = v5;
  self->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateLookAt(-[SCNNode nodeRef](v5, "nodeRef"));
  -[SCNConstraint finalizeDecodeConstraint:](self, "finalizeDecodeConstraint:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNLookAtConstraint;
  -[SCNConstraint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  -[SCNLookAtConstraint _customEncodingOfSCNLookAtConstraint:](self, "_customEncodingOfSCNLookAtConstraint:", a3);
  objc_msgSend(a3, "encodeBool:forKey:", self->_gimbalLockEnabled, CFSTR("gimbalLockEnabled"));
  SCNEncodeVector3(a3, (uint64_t)CFSTR("targetOffset"), self->_targetOffset.x, self->_targetOffset.y, self->_targetOffset.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("upVector"), self->_upVector.x, self->_upVector.y, self->_upVector.z);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("localFront"), self->_localFront.x, self->_localFront.y, self->_localFront.z);
}

- (SCNLookAtConstraint)initWithCoder:(id)a3
{
  SCNLookAtConstraint *v4;
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;
  SCNVector3 v22;
  SCNVector3 v23;
  SCNVector3 v24;
  SCNVector3 v25;

  v21.receiver = self;
  v21.super_class = (Class)SCNLookAtConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v21, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNLookAtConstraint _customDecodingOfSCNLookAtConstraint:](v4, "_customDecodingOfSCNLookAtConstraint:", a3);
    -[SCNLookAtConstraint setGimbalLockEnabled:](v4, "setGimbalLockEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("gimbalLockEnabled")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("targetOffset")))
    {
      *(float *)&v6 = SCNDecodeVector3(a3, (uint64_t)CFSTR("targetOffset"));
      -[SCNLookAtConstraint setTargetOffset:](v4, "setTargetOffset:", v6);
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("upVector")))
    {
      *(float *)&v7 = SCNDecodeVector3(a3, (uint64_t)CFSTR("upVector"));
    }
    else
    {
      LODWORD(v7) = 0;
      LODWORD(v8) = 1.0;
      LODWORD(v9) = 0;
    }
    -[SCNLookAtConstraint setUpVector:](v4, "setUpVector:", v7, v8, v9);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("localFront")))
    {
      *(float *)&v13 = SCNDecodeVector3(a3, (uint64_t)CFSTR("localFront"));
      -[SCNLookAtConstraint setLocalFront:](v4, "setLocalFront:", v13);
    }
    else
    {
      LODWORD(v10) = 0;
      LODWORD(v11) = 0;
      LODWORD(v12) = -1.0;
      -[SCNLookAtConstraint setUpVector:](v4, "setUpVector:", v10, v11, v12);
    }
    -[SCNLookAtConstraint upVector](v4, "upVector");
    v24.x = 0.0;
    v24.y = 0.0;
    v24.z = 0.0;
    if (SCNVector3EqualToVector3(v22, v24))
    {
      LODWORD(v14) = 0;
      LODWORD(v15) = 1.0;
      LODWORD(v16) = 0;
      -[SCNLookAtConstraint setUpVector:](v4, "setUpVector:", v14, v15, v16);
    }
    -[SCNLookAtConstraint localFront](v4, "localFront");
    v25.x = 0.0;
    v25.y = 0.0;
    v25.z = 0.0;
    if (SCNVector3EqualToVector3(v23, v25))
    {
      LODWORD(v17) = 0;
      LODWORD(v18) = 0;
      LODWORD(v19) = -1.0;
      -[SCNLookAtConstraint setLocalFront:](v4, "setLocalFront:", v17, v18, v19);
    }
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
