@implementation SCNSliderConstraint

- (SCNSliderConstraint)init
{
  SCNSliderConstraint *v2;
  uint64_t Slider;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNSliderConstraint;
  v2 = -[SCNConstraint init](&v5, sel_init);
  if (v2)
  {
    Slider = C3DConstraintCreateSlider();
    v2->_categoryBitMask = 0;
    v2->super._constraintRef = (__C3DConstraint *)Slider;
    v2->_radius = 1.0;
  }
  return v2;
}

+ (SCNSliderConstraint)sliderConstraint
{
  return objc_alloc_init(SCNSliderConstraint);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCollisionCategoryBitMask:", -[SCNSliderConstraint collisionCategoryBitMask](self, "collisionCategoryBitMask"));
  -[SCNSliderConstraint offset](self, "offset");
  objc_msgSend(v4, "setOffset:");
  -[SCNSliderConstraint radius](self, "radius");
  objc_msgSend(v4, "setRadius:");
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  return v4;
}

- (NSUInteger)collisionCategoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCollisionCategoryBitMask:(NSUInteger)collisionCategoryBitMask
{
  __C3DScene *v5;
  _QWORD v6[6];

  self->_categoryBitMask = collisionCategoryBitMask;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SCNSliderConstraint_setCollisionCategoryBitMask___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  v6[5] = collisionCategoryBitMask;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __51__SCNSliderConstraint_setCollisionCategoryBitMask___block_invoke(uint64_t a1)
{
  C3DConstaintSliderSetCategoryBitMask(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

- (CGFloat)radius
{
  return self->_radius;
}

- (void)setRadius:(CGFloat)radius
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = radius;
  self->_radius = v5;
  v6 = -[SCNConstraint sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SCNSliderConstraint_setRadius___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = radius;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("radius"), v7);
}

float __33__SCNSliderConstraint_setRadius___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DConstaintSliderSetRadius(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNVector3)offset
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_offset.x;
  y = self->_offset.y;
  z = self->_offset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(SCNVector3)offset
{
  __C3DScene *v4;
  _QWORD v5[5];

  self->_offset = offset;
  v4 = -[SCNConstraint sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SCNSliderConstraint_setOffset___block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v4, self, CFSTR("offset"), v5);
}

double __33__SCNSliderConstraint_setOffset___block_invoke(uint64_t a1, __n128 a2)
{
  unint64_t *v2;
  __n128 *v3;
  double result;

  v2 = *(unint64_t **)(a1 + 32);
  v3 = (__n128 *)v2[1];
  v2 += 8;
  a2.n128_u64[0] = *v2;
  a2.n128_u32[2] = *((_DWORD *)v2 + 2);
  *(_QWORD *)&result = C3DConstaintSliderSetOffset(v3, a2).n128_u64[0];
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNSliderConstraint;
  -[SCNConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_categoryBitMask, CFSTR("collisionCategoryBitMask"));
  *(float *)&v5 = self->_radius;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("radius"), v5);
  SCNEncodeVector3(a3, (uint64_t)CFSTR("offset"), self->_offset.x, self->_offset.y, self->_offset.z);
}

- (SCNSliderConstraint)initWithCoder:(id)a3
{
  SCNSliderConstraint *v4;
  _BOOL8 v5;
  float v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNSliderConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v9, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateSlider();
    -[SCNConstraint finalizeDecodeConstraint:](v4, "finalizeDecodeConstraint:", a3);
    -[SCNSliderConstraint setCollisionCategoryBitMask:](v4, "setCollisionCategoryBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("collisionCategoryBitMask")));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("radius"));
    -[SCNSliderConstraint setRadius:](v4, "setRadius:", v6);
    *(float *)&v7 = SCNDecodeVector3(a3, (uint64_t)CFSTR("offset"));
    -[SCNSliderConstraint setOffset:](v4, "setOffset:", v7);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
