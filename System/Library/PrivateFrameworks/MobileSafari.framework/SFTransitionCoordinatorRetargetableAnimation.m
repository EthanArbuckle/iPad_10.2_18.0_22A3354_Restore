@implementation SFTransitionCoordinatorRetargetableAnimation

- (void)invokeInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  SFTransitionCoordinatorRetargetableAnimation *v9;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0DC3F10], "_isInRetargetableAnimationBlock") & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)SFTransitionCoordinatorRetargetableAnimation;
    -[SFTransitionCoordinatorBasicAnimation invokeInContext:](&v6, sel_invokeInContext_, v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__SFTransitionCoordinatorRetargetableAnimation_invokeInContext___block_invoke;
    v7[3] = &unk_1E21E2258;
    v8 = v4;
    v9 = self;
    objc_msgSend(v5, "_performWithoutRetargetingAnimations:", v7);

  }
}

id __64__SFTransitionCoordinatorRetargetableAnimation_invokeInContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SFTransitionCoordinatorRetargetableAnimation;
  return objc_msgSendSuper2(&v3, sel_invokeInContext_, v1);
}

@end
