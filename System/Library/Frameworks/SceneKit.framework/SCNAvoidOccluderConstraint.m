@implementation SCNAvoidOccluderConstraint

- (SCNAvoidOccluderConstraint)init
{
  SCNAvoidOccluderConstraint *v2;
  uint64_t AvoidOccluder;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNAvoidOccluderConstraint;
  v2 = -[SCNConstraint init](&v5, sel_init);
  if (v2)
  {
    AvoidOccluder = C3DConstraintCreateAvoidOccluder();
    v2->_categoryBitMask = 1;
    v2->super._constraintRef = (__C3DConstraint *)AvoidOccluder;
    v2->_offset = 0.00001;
  }
  return v2;
}

- (void)dealloc
{
  __C3DScene *v3;
  uint64_t v4;
  objc_super v5;

  if (self->_delegate)
  {
    v3 = -[SCNNode sceneRef](self->_target, "sceneRef");
    if (v3)
    {
      v4 = (uint64_t)v3;
      C3DSceneLock((uint64_t)v3);
      C3DConstraintAvoidOccluderSetDelegate((uint64_t)self->super._constraintRef, 0);
      C3DSceneUnlock(v4);
    }
    else
    {
      C3DConstraintAvoidOccluderSetDelegate((uint64_t)self->super._constraintRef, 0);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SCNAvoidOccluderConstraint;
  -[SCNConstraint dealloc](&v5, sel_dealloc);
}

+ (id)avoidOccluderConstraint
{
  return objc_alloc_init(SCNAvoidOccluderConstraint);
}

+ (SCNAvoidOccluderConstraint)avoidOccluderConstraintWithTarget:(SCNNode *)target
{
  SCNAvoidOccluderConstraint *v4;

  v4 = objc_alloc_init(SCNAvoidOccluderConstraint);
  -[SCNAvoidOccluderConstraint setTarget:](v4, "setTarget:", target);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTarget:", -[SCNAvoidOccluderConstraint target](self, "target"));
  objc_msgSend(v4, "setOccluderCategoryBitMask:", -[SCNAvoidOccluderConstraint occluderCategoryBitMask](self, "occluderCategoryBitMask"));
  -[SCNAvoidOccluderConstraint bias](self, "bias");
  objc_msgSend(v4, "setBias:");
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  return v4;
}

- (void)setDelegate:(id)delegate
{
  uint64_t (*v4)(void *, id *, id *);
  uint64_t (*v5)();
  __C3DScene *v6;
  __C3DScene *v7;
  uint64_t v8;
  _QWORD v9[7];

  if (self->_delegate != delegate)
  {
    self->_delegate = delegate;
    if (delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = __C3DAvoidOccluderConstraintDelegateShouldAvoidOccluderCallback;
      else
        v4 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = __C3DAvoidOccluderConstraintDelegateDidAvoidOccluderCallback;
      else
        v5 = 0;
      v6 = -[SCNConstraint sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __42__SCNAvoidOccluderConstraint_setDelegate___block_invoke;
      v9[3] = &unk_1EA5A15E8;
      v9[4] = self;
      v9[5] = v4;
      v9[6] = v5;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v9);
    }
    else
    {
      v7 = -[SCNNode sceneRef](self->_target, "sceneRef");
      if (v7)
      {
        v8 = (uint64_t)v7;
        C3DSceneLock((uint64_t)v7);
        C3DConstraintAvoidOccluderSetDelegate((uint64_t)self->super._constraintRef, 0);
        C3DSceneUnlock(v8);
      }
      else
      {
        C3DConstraintAvoidOccluderSetDelegate((uint64_t)self->super._constraintRef, 0);
      }
    }
  }
}

void __42__SCNAvoidOccluderConstraint_setDelegate___block_invoke(uint64_t *a1)
{
  _QWORD *v2;

  v2 = C3DAvoidOccluderConstraintDelegateCreate(a1[4], a1[5], a1[6]);
  C3DConstraintAvoidOccluderSetDelegate(*(_QWORD *)(a1[4] + 8), v2);
  CFRelease(v2);
}

- (id)delegate
{
  return self->_delegate;
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
  v8[2] = __40__SCNAvoidOccluderConstraint_setTarget___block_invoke;
  v8[3] = &unk_1EA59E450;
  v8[4] = self;
  v8[5] = v6;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
}

CFTypeRef __40__SCNAvoidOccluderConstraint_setTarget___block_invoke(uint64_t a1)
{
  return C3DConstraintAvoidOccluderSetTarget(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (SCNNode)target
{
  return self->_target;
}

- (void)setOccluderCategoryBitMask:(NSUInteger)occluderCategoryBitMask
{
  __C3DScene *v5;
  _QWORD v6[6];

  self->_categoryBitMask = occluderCategoryBitMask;
  v5 = -[SCNConstraint sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SCNAvoidOccluderConstraint_setOccluderCategoryBitMask___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  v6[5] = occluderCategoryBitMask;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __57__SCNAvoidOccluderConstraint_setOccluderCategoryBitMask___block_invoke(uint64_t a1)
{
  C3DConstaintSliderSetCategoryBitMask(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

- (NSUInteger)occluderCategoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setBias:(CGFloat)bias
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = bias;
  self->_offset = v5;
  v6 = -[SCNConstraint sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SCNAvoidOccluderConstraint_setBias___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(CGFloat *)&v7[5] = bias;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

float __38__SCNAvoidOccluderConstraint_setBias___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DConstraintAvoidOccluderSetOffset(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)bias
{
  return self->_offset;
}

- (void)_customEncodingOfSCNAvoidOccluderConstraint:(id)a3
{
  SCNNode *target;

  target = self->_target;
  if (target)
    objc_msgSend(a3, "encodeObject:forKey:", target, CFSTR("target"));
}

- (void)_customDecodingOfSCNAvoidOccluderConstraint:(id)a3
{
  __C3DConstraint *AvoidOccluder;

  self->_target = (SCNNode *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
  AvoidOccluder = (__C3DConstraint *)C3DConstraintCreateAvoidOccluder();
  self->super._constraintRef = AvoidOccluder;
  C3DConstraintAvoidOccluderSetTarget((uint64_t)AvoidOccluder, -[SCNNode nodeRef](self->_target, "nodeRef"));
  -[SCNConstraint finalizeDecodeConstraint:](self, "finalizeDecodeConstraint:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNAvoidOccluderConstraint;
  -[SCNConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  -[SCNAvoidOccluderConstraint _customEncodingOfSCNAvoidOccluderConstraint:](self, "_customEncodingOfSCNAvoidOccluderConstraint:", a3);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_categoryBitMask, CFSTR("categoryBitMask"));
  *(float *)&v5 = self->_offset;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("bias"), v5);
}

- (SCNAvoidOccluderConstraint)initWithCoder:(id)a3
{
  SCNAvoidOccluderConstraint *v4;
  _BOOL8 v5;
  float v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNAvoidOccluderConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNAvoidOccluderConstraint _customDecodingOfSCNAvoidOccluderConstraint:](v4, "_customDecodingOfSCNAvoidOccluderConstraint:", a3);
    -[SCNAvoidOccluderConstraint setOccluderCategoryBitMask:](v4, "setOccluderCategoryBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("categoryBitMask")));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("bias"));
    -[SCNAvoidOccluderConstraint setBias:](v4, "setBias:", v6);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
