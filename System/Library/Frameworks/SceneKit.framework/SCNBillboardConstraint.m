@implementation SCNBillboardConstraint

- (SCNBillboardConstraint)init
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNBillboardConstraint;
  v2 = -[SCNConstraint init](&v4, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = C3DConstraintCreateBillboard();
    objc_msgSend(v2, "setFreeAxes:", 7);
    *((_BYTE *)v2 + 64) = C3DConstraintBillboardGetPreserveScale(*((_QWORD *)v2 + 1));
  }
  return (SCNBillboardConstraint *)v2;
}

+ (SCNBillboardConstraint)billboardConstraint
{
  return objc_alloc_init(SCNBillboardConstraint);
}

- (SCNBillboardAxis)freeAxes
{
  return self->_freeAxes;
}

- (void)setFreeAxes:(SCNBillboardAxis)freeAxes
{
  __C3DScene *v5;
  _QWORD v6[6];

  self->_freeAxes = freeAxes;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SCNBillboardConstraint_setFreeAxes___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  v6[5] = freeAxes;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __38__SCNBillboardConstraint_setFreeAxes___block_invoke(uint64_t a1)
{
  return C3DConstraintBillboardSetType(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (void)setPreserveScale:(BOOL)a3
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  self->_preserveScale = a3;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SCNBillboardConstraint_setPreserveScale___block_invoke;
  v6[3] = &unk_1EA59E478;
  v6[4] = self;
  v7 = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __43__SCNBillboardConstraint_setPreserveScale___block_invoke(uint64_t a1)
{
  return C3DConstraintBillboardSetPreserveScale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (BOOL)preserveScale
{
  return self->_preserveScale;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  objc_msgSend(v4, "setFreeAxes:", -[SCNBillboardConstraint freeAxes](self, "freeAxes"));
  objc_msgSend(v4, "setPreserveScale:", -[SCNBillboardConstraint preserveScale](self, "preserveScale"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNBillboardConstraint;
  -[SCNConstraint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_freeAxes, CFSTR("freeAxes"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_preserveScale, CFSTR("preserveScale"));
}

- (SCNBillboardConstraint)initWithCoder:(id)a3
{
  SCNBillboardConstraint *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNBillboardConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateBillboard();
    -[SCNBillboardConstraint setFreeAxes:](v4, "setFreeAxes:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("freeAxes")));
    -[SCNBillboardConstraint setPreserveScale:](v4, "setPreserveScale:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("preserveScale")));
    -[SCNConstraint finalizeDecodeConstraint:](v4, "finalizeDecodeConstraint:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
