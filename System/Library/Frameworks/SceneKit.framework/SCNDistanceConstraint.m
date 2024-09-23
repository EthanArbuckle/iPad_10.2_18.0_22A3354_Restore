@implementation SCNDistanceConstraint

- (SCNDistanceConstraint)init
{
  SCNDistanceConstraint *v2;
  uint64_t Distance;
  float v4;
  float v5;
  float v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNDistanceConstraint;
  v2 = -[SCNConstraint init](&v8, sel_init);
  if (v2)
  {
    Distance = C3DConstraintCreateDistance();
    v2->_maximumDistance = 3.4028e38;
    v2->_minimumDistance = 0.0;
    v2->_maximumDirectionAngle = 360.0;
    v2->super._constraintRef = (__C3DConstraint *)Distance;
    +[SCNNode localFront](SCNNode, "localFront");
    v2->_targetDirection.x = v4;
    v2->_targetDirection.y = v5;
    v2->_targetDirection.z = v6;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNDistanceConstraint;
  -[SCNConstraint dealloc](&v3, sel_dealloc);
}

+ (id)distanceConstraint
{
  return objc_alloc_init(SCNDistanceConstraint);
}

+ (SCNDistanceConstraint)distanceConstraintWithTarget:(SCNNode *)target
{
  SCNDistanceConstraint *v4;

  v4 = objc_alloc_init(SCNDistanceConstraint);
  -[SCNDistanceConstraint setTarget:](v4, "setTarget:", target);
  return v4;
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
  v8[2] = __35__SCNDistanceConstraint_setTarget___block_invoke;
  v8[3] = &unk_1EA59E450;
  v8[4] = self;
  v8[5] = v6;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
}

CFTypeRef __35__SCNDistanceConstraint_setTarget___block_invoke(uint64_t a1)
{
  return C3DConstraintAvoidOccluderSetTarget(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (SCNVector3)targetDirection
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_targetDirection.x;
  y = self->_targetDirection.y;
  z = self->_targetDirection.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetDirection:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  self->_targetDirection = a3;
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SCNDistanceConstraint_setTargetDirection___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("targetDirection"), v8);
}

void __44__SCNDistanceConstraint_setTargetDirection___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintDistanceSetTargetDirection(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (BOOL)keepTargetDirection
{
  return self->_keepTargetDirection;
}

- (void)setKeepTargetDirection:(BOOL)a3
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_keepTargetDirection = a3;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SCNDistanceConstraint_setKeepTargetDirection___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __48__SCNDistanceConstraint_setKeepTargetDirection___block_invoke(uint64_t a1)
{
  C3DConstraintDistanceSetKeepTargetDirection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (CGFloat)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(CGFloat)minimumDistance
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = minimumDistance;
  self->_minimumDistance = v5;
  v6 = -[SCNConstraint sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SCNDistanceConstraint_setMinimumDistance___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = minimumDistance;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("minimumDistance"), v7);
}

float __44__SCNDistanceConstraint_setMinimumDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DConstraintDistanceSetMinimumDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMaximumDistance:(CGFloat)maximumDistance
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = maximumDistance;
  self->_maximumDistance = v5;
  v6 = -[SCNConstraint sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SCNDistanceConstraint_setMaximumDistance___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = maximumDistance;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("maximumDistance"), v7);
}

float __44__SCNDistanceConstraint_setMaximumDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DConstraintDistanceSetMaximumDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTarget:", -[SCNDistanceConstraint target](self, "target"));
  -[SCNDistanceConstraint maximumDistance](self, "maximumDistance");
  objc_msgSend(v4, "setMaximumDistance:");
  -[SCNDistanceConstraint minimumDistance](self, "minimumDistance");
  objc_msgSend(v4, "setMinimumDistance:");
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  return v4;
}

- (void)_customEncodingOfSCNDistanceConstraint:(id)a3
{
  SCNNode *target;

  target = self->_target;
  if (target)
    objc_msgSend(a3, "encodeObject:forKey:", target, CFSTR("target"));
}

- (void)_customDecodingOfSCNDistanceConstraint:(id)a3
{
  self->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateDistance();
  -[SCNDistanceConstraint setTarget:](self, "setTarget:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target")));
  -[SCNConstraint finalizeDecodeConstraint:](self, "finalizeDecodeConstraint:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNDistanceConstraint;
  -[SCNConstraint encodeWithCoder:](&v7, sel_encodeWithCoder_);
  -[SCNDistanceConstraint _customEncodingOfSCNDistanceConstraint:](self, "_customEncodingOfSCNDistanceConstraint:", a3);
  *(float *)&v5 = self->_minimumDistance;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("minimumDistance"), v5);
  *(float *)&v6 = self->_maximumDistance;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maximumDistance"), v6);
}

- (SCNDistanceConstraint)initWithCoder:(id)a3
{
  SCNDistanceConstraint *v4;
  _BOOL8 v5;
  float v6;
  float v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNDistanceConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v9, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNDistanceConstraint _customDecodingOfSCNDistanceConstraint:](v4, "_customDecodingOfSCNDistanceConstraint:", a3);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("minimumDistance"));
    -[SCNDistanceConstraint setMinimumDistance:](v4, "setMinimumDistance:", v6);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maximumDistance"));
    -[SCNDistanceConstraint setMaximumDistance:](v4, "setMaximumDistance:", v7);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
