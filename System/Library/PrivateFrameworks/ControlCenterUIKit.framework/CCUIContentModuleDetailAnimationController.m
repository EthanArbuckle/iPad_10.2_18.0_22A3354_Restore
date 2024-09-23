@implementation CCUIContentModuleDetailAnimationController

- (id)initForPresenting:(BOOL)a3 anchoringViewController:(id)a4
{
  id v7;
  CCUIContentModuleDetailAnimationController *v8;
  CCUIContentModuleDetailAnimationController *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CCUIContentModuleDetailAnimationController;
  v8 = -[CCUIContentModuleDetailAnimationController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_presenting = a3;
    objc_storeStrong((id *)&v8->_anchoringViewController, a4);
  }

  return v9;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  UIViewPropertyAnimator *propertyAnimator;
  UIViewPropertyAnimator *v4;
  UIViewPropertyAnimator *v5;

  propertyAnimator = self->_propertyAnimator;
  if (!propertyAnimator)
  {
    v4 = -[CCUIContentModuleDetailAnimationController _newPropertyAnimator](self, "_newPropertyAnimator");
    v5 = self->_propertyAnimator;
    self->_propertyAnimator = v4;

    propertyAnimator = self->_propertyAnimator;
  }
  return propertyAnimator;
}

- (void)performTransition:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  __int128 v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  CGAffineTransform v20;
  _OWORD v21[3];
  _QWORD v22[4];
  id v23;
  id v24;

  v4 = a3;
  -[CCUIContentModuleDetailAnimationController _contentModuleContainingViewController](self, "_contentModuleContainingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)MEMORY[0x1E0DC55B8];
  if (self->_presenting)
    v6 = (_QWORD *)MEMORY[0x1E0DC55C8];
  objc_msgSend(v4, "viewControllerForKey:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_presenting)
    objc_msgSend(v5, "contentContainerView");
  else
    objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_presenting)
    objc_msgSend(v8, "view");
  else
    objc_msgSend(v5, "contentContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__CCUIContentModuleDetailAnimationController_performTransition___block_invoke;
  v22[3] = &unk_1E8E20708;
  v13 = v10;
  v23 = v13;
  v14 = v9;
  v24 = v14;
  objc_msgSend(v11, "performWithoutAnimation:", v22);
  if ((objc_msgSend(v5, "isExpanded") & 1) == 0)
  {
    if (self->_presenting)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "willPresentViewController:", v8);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "willDismissViewController:", v8);
    }
  }
  objc_msgSend(v13, "setAlpha:", 1.0);
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v21[0] = *MEMORY[0x1E0C9BAA8];
  v21[1] = v15;
  v21[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v13, "setTransform:", v21);
  objc_msgSend(v14, "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v20, 0.8, 0.8);
  objc_msgSend(v14, "setTransform:", &v20);
  if (self->_presenting)
  {
    -[CCUIContentModuleDetailAnimationController propertyAnimator](self, "propertyAnimator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __64__CCUIContentModuleDetailAnimationController_performTransition___block_invoke_2;
    v18[3] = &unk_1E8E20820;
    v19 = v14;
    objc_msgSend(v16, "addCompletion:", v18);

    v17 = v19;
  }
  else
  {
    objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeFromSuperview");
  }

}

uint64_t __64__CCUIContentModuleDetailAnimationController_performTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v6[3];
  CGAffineTransform v7;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v7, 0.8, 0.8);
  objc_msgSend(v2, "setTransform:", &v7);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  v3 = *(void **)(a1 + 40);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v3, "setTransform:", v6);
}

uint64_t __64__CCUIContentModuleDetailAnimationController_performTransition___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "isAnimated"))
  {
    -[CCUIContentModuleDetailAnimationController propertyAnimator](self, "propertyAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__CCUIContentModuleDetailAnimationController_animateTransition___block_invoke;
    v10[3] = &unk_1E8E20708;
    v10[4] = self;
    v7 = v4;
    v11 = v7;
    objc_msgSend(v5, "addAnimations:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __64__CCUIContentModuleDetailAnimationController_animateTransition___block_invoke_2;
    v8[3] = &unk_1E8E20820;
    v9 = v7;
    objc_msgSend(v5, "addCompletion:", v8);
    objc_msgSend(v5, "startAnimation");

  }
  else
  {
    objc_msgSend(v4, "completeTransition:", 1);
  }

}

uint64_t __64__CCUIContentModuleDetailAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTransition:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__CCUIContentModuleDetailAnimationController_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2 == 0);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animationEnded:(BOOL)a3
{
  UIViewPropertyAnimator *propertyAnimator;

  propertyAnimator = self->_propertyAnimator;
  self->_propertyAnimator = 0;

}

- (id)_newPropertyAnimator
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:dampingRatio:animations:", 0, 0.5, 0.65);
}

- (id)_contentModuleContainingViewController
{
  UIViewController *v2;
  uint64_t v3;

  v2 = self->_anchoringViewController;
  if (v2)
  {
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (-[UIViewController definesContentModuleContainer](v2, "definesContentModuleContainer") & 1) != 0)
      {
        break;
      }
      -[UIViewController parentViewController](v2, "parentViewController");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (UIViewController *)v3;
    }
    while (v3);
  }
  return v2;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_anchoringViewController, 0);
}

@end
