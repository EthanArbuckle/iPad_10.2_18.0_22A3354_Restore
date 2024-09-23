@implementation SCNPhysicsNoiseField

- (SCNPhysicsNoiseField)init
{
  SCNPhysicsNoiseField *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsNoiseField;
  result = -[SCNPhysicsField init](&v3, sel_init);
  if (result)
  {
    result->_smoothness = 0.0;
    result->_animationSpeed = 1.0;
  }
  return result;
}

- (c3dPhysicsField)_createField
{
  float *v3;
  float strength;
  float smoothness;
  float animationSpeed;

  v3 = (float *)operator new();
  c3dPhysicsFieldNoise::c3dPhysicsFieldNoise((c3dPhysicsFieldNoise *)v3);
  strength = self->super._strength;
  v3[40] = strength;
  smoothness = self->_smoothness;
  animationSpeed = self->_animationSpeed;
  v3[60] = smoothness;
  v3[61] = animationSpeed;
  return (c3dPhysicsField *)v3;
}

- (double)smoothness
{
  return self->_smoothness;
}

- (void)setSmoothness:(double)a3
{
  void *v5;
  _QWORD v6[6];

  self->_smoothness = a3;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->super._node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsNoiseField_setSmoothness___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

float __38__SCNPhysicsNoiseField_setSmoothness___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 240) = result;
  }
  return result;
}

- (double)animationSpeed
{
  return self->_animationSpeed;
}

- (void)setAnimationSpeed:(double)a3
{
  void *v5;
  _QWORD v6[6];

  self->_animationSpeed = a3;
  v5 = (void *)objc_msgSend(-[SCNNode scene](self->super._node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SCNPhysicsNoiseField_setAnimationSpeed___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  objc_msgSend(v5, "_postCommandWithBlock:", v6);
}

float __42__SCNPhysicsNoiseField_setAnimationSpeed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(float *)(v1 + 244) = result;
  }
  return result;
}

- (BOOL)supportsOffset
{
  return 0;
}

- (BOOL)supportsDirection
{
  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_super v8;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("smoothness")))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = 128;
    return (id)objc_msgSend(v5, "numberWithDouble:", *(double *)((char *)&self->super.super.isa + v6));
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("animationSpeed")))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = 136;
    return (id)objc_msgSend(v5, "numberWithDouble:", *(double *)((char *)&self->super.super.isa + v6));
  }
  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsNoiseField;
  return -[SCNPhysicsNoiseField valueForUndefinedKey:](&v8, sel_valueForUndefinedKey_, a3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  objc_super v7;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("smoothness")))
  {
    objc_msgSend(a3, "doubleValue");
    -[SCNPhysicsNoiseField setSmoothness:](self, "setSmoothness:");
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("animationSpeed")))
  {
    objc_msgSend(a3, "doubleValue");
    -[SCNPhysicsNoiseField setAnimationSpeed:](self, "setAnimationSpeed:");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNPhysicsNoiseField;
    -[SCNPhysicsNoiseField setValue:forUndefinedKey:](&v7, sel_setValue_forUndefinedKey_, a3, a4);
  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNPhysicsNoiseField;
  -[SCNPhysicsField encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("smoothness"), self->_smoothness);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("animationSpeed"), self->_animationSpeed);
}

- (SCNPhysicsNoiseField)initWithCoder:(id)a3
{
  SCNPhysicsNoiseField *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsNoiseField;
  v4 = -[SCNPhysicsField initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("smoothness"));
    -[SCNPhysicsNoiseField setSmoothness:](v4, "setSmoothness:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("animationSpeed"));
    -[SCNPhysicsNoiseField setAnimationSpeed:](v4, "setAnimationSpeed:");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
