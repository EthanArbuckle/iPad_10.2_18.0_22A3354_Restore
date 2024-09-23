@implementation SCNAccelerationConstraint

- (SCNAccelerationConstraint)init
{
  SCNAccelerationConstraint *v2;
  uint64_t Acceleration;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNAccelerationConstraint;
  v2 = -[SCNConstraint init](&v5, sel_init);
  if (v2)
  {
    Acceleration = C3DConstraintCreateAcceleration();
    v2->_maximumLinearAcceleration = 3.4028e38;
    v2->_maximumLinearVelocity = 3.4028e38;
    v2->super._constraintRef = (__C3DConstraint *)Acceleration;
    v2->_damping = 0.1;
  }
  return v2;
}

+ (SCNAccelerationConstraint)accelerationConstraint
{
  return objc_alloc_init(SCNAccelerationConstraint);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SCNAccelerationConstraint maximumLinearVelocity](self, "maximumLinearVelocity");
  objc_msgSend(v4, "setMaximumLinearVelocity:");
  -[SCNAccelerationConstraint maximumLinearAcceleration](self, "maximumLinearAcceleration");
  objc_msgSend(v4, "setMaximumLinearAcceleration:");
  -[SCNAccelerationConstraint decelerationDistance](self, "decelerationDistance");
  objc_msgSend(v4, "setDecelerationDistance:");
  -[SCNAccelerationConstraint damping](self, "damping");
  objc_msgSend(v4, "setDamping:");
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  return v4;
}

- (CGFloat)maximumLinearVelocity
{
  return self->_maximumLinearVelocity;
}

- (void)setMaximumLinearVelocity:(CGFloat)maximumLinearVelocity
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = maximumLinearVelocity;
  self->_maximumLinearVelocity = v5;
  v6 = -[SCNConstraint sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SCNAccelerationConstraint_setMaximumLinearVelocity___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = maximumLinearVelocity;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("maximumLinearVelocity"), v7);
}

float __54__SCNAccelerationConstraint_setMaximumLinearVelocity___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DConstraintAccelerationSetMaximumPositionVelocity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)maximumLinearAcceleration
{
  return self->_maximumLinearAcceleration;
}

- (void)setMaximumLinearAcceleration:(CGFloat)maximumLinearAcceleration
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = maximumLinearAcceleration;
  self->_maximumLinearAcceleration = v5;
  v6 = -[SCNConstraint sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SCNAccelerationConstraint_setMaximumLinearAcceleration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = maximumLinearAcceleration;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("maximumLinearAcceleration"), v7);
}

float __58__SCNAccelerationConstraint_setMaximumLinearAcceleration___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DConstraintAccelerationSetMaximumPositionAcceleration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (void)setDecelerationDistance:(CGFloat)decelerationDistance
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = decelerationDistance;
  self->_decelerationDistance = v5;
  v6 = -[SCNConstraint sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SCNAccelerationConstraint_setDecelerationDistance___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = decelerationDistance;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("decelerationDistance"), v7);
}

float __53__SCNAccelerationConstraint_setDecelerationDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DConstraintDistanceSetMinimumDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)decelerationDistance
{
  return self->_decelerationDistance;
}

- (CGFloat)damping
{
  return self->_damping;
}

- (void)setDamping:(CGFloat)damping
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = damping;
  self->_damping = v5;
  v6 = -[SCNConstraint sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SCNAccelerationConstraint_setDamping___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = damping;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("damping"), v7);
}

float __40__SCNAccelerationConstraint_setDamping___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DConstraintDistanceSetMaximumDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNAccelerationConstraint;
  -[SCNConstraint encodeWithCoder:](&v9, sel_encodeWithCoder_);
  *(float *)&v5 = self->_maximumLinearVelocity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maximumLinearVelocity"), v5);
  *(float *)&v6 = self->_maximumLinearAcceleration;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maximumLinearAcceleration"), v6);
  *(float *)&v7 = self->_decelerationDistance;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("decelerationDistance"), v7);
  *(float *)&v8 = self->_damping;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("damping"), v8);
}

- (SCNAccelerationConstraint)initWithCoder:(id)a3
{
  SCNAccelerationConstraint *v4;
  _BOOL8 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNAccelerationConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateAcceleration();
    -[SCNConstraint finalizeDecodeConstraint:](v4, "finalizeDecodeConstraint:", a3);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maximumLinearVelocity"));
    -[SCNAccelerationConstraint setMaximumLinearVelocity:](v4, "setMaximumLinearVelocity:", v6);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maximumLinearAcceleration"));
    -[SCNAccelerationConstraint setMaximumLinearAcceleration:](v4, "setMaximumLinearAcceleration:", v7);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("decelerationDistance"));
    -[SCNAccelerationConstraint setDecelerationDistance:](v4, "setDecelerationDistance:", v8);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("damping"));
    -[SCNAccelerationConstraint setDamping:](v4, "setDamping:", v9);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
