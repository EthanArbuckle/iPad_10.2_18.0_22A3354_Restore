@implementation SCNConstantScaleConstraint

- (SCNConstantScaleConstraint)init
{
  SCNConstantScaleConstraint *v2;
  uint64_t ConstantScale;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNConstantScaleConstraint;
  v2 = -[SCNConstraint init](&v5, sel_init);
  if (v2)
  {
    ConstantScale = C3DConstraintCreateConstantScale();
    v2->_scale = 1.0;
    v2->super._constraintRef = (__C3DConstraint *)ConstantScale;
    v2->_screenSpace = 1;
  }
  return v2;
}

+ (id)constantScaleConstraint
{
  return objc_alloc_init(SCNConstantScaleConstraint);
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  __C3DScene *v5;
  _QWORD v6[5];
  float v7;

  self->_scale = a3;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SCNConstantScaleConstraint_setScale___block_invoke;
  v6[3] = &unk_1EA5A2D30;
  v6[4] = self;
  v7 = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __39__SCNConstantScaleConstraint_setScale___block_invoke(uint64_t a1)
{
  return C3DConstraintConstantScaleSetScale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (BOOL)screenSpace
{
  return self->_screenSpace;
}

- (void)setScreenSpace:(BOOL)a3
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_screenSpace = a3;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SCNConstantScaleConstraint_setScreenSpace___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __45__SCNConstantScaleConstraint_setScreenSpace___block_invoke(uint64_t a1)
{
  return C3DConstraintBillboardSetPreserveScale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  v4[14] = LODWORD(self->_scale);
  *((_BYTE *)v4 + 60) = self->_screenSpace;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNConstantScaleConstraint;
  -[SCNConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeBool:forKey:", self->_screenSpace, CFSTR("screenSpace"));
  *(float *)&v5 = self->_scale;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("scale"), v5);
}

- (SCNConstantScaleConstraint)initWithCoder:(id)a3
{
  SCNConstantScaleConstraint *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNConstantScaleConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateConstantScale();
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNConstantScaleConstraint setScreenSpace:](v4, "setScreenSpace:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("screenSpace")));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("scale"));
    -[SCNConstantScaleConstraint setScale:](v4, "setScale:");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
