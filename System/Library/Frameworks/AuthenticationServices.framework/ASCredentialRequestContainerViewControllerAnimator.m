@implementation ASCredentialRequestContainerViewControllerAnimator

- (ASCredentialRequestContainerViewControllerAnimator)init
{
  return -[ASCredentialRequestContainerViewControllerAnimator initWithPresenting:](self, "initWithPresenting:", 1);
}

- (ASCredentialRequestContainerViewControllerAnimator)initWithPresenting:(BOOL)a3
{
  ASCredentialRequestContainerViewControllerAnimator *v4;
  ASCredentialRequestContainerViewControllerAnimator *v5;
  ASCredentialRequestContainerViewControllerAnimator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCredentialRequestContainerViewControllerAnimator;
  v4 = -[ASCredentialRequestContainerViewControllerAnimator init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_presenting = a3;
    v6 = v4;
  }

  return v5;
}

- (id)_viewControllerForTransitionContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  _QWORD *v6;
  void *v7;

  v4 = a3;
  v5 = -[ASCredentialRequestContainerViewControllerAnimator isPresenting](self, "isPresenting");
  v6 = (_QWORD *)MEMORY[0x24BEBE9B0];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x24BEBE9A0];
  objc_msgSend(v4, "viewControllerForKey:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  -[ASCredentialRequestContainerViewControllerAnimator _viewControllerForTransitionContext:](self, "_viewControllerForTransitionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);
  v8 = (void *)MEMORY[0x24BEBDB00];
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __72__ASCredentialRequestContainerViewControllerAnimator_animateTransition___block_invoke;
  v16[3] = &unk_24C94F5F8;
  v17 = v6;
  v18 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "performWithoutAnimation:", v16);
  v12 = (void *)MEMORY[0x24BEBDB00];
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __72__ASCredentialRequestContainerViewControllerAnimator_animateTransition___block_invoke_3;
  v14[3] = &unk_24C951688;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v12, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, &__block_literal_global_25, v14);

}

uint64_t __72__ASCredentialRequestContainerViewControllerAnimator_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __72__ASCredentialRequestContainerViewControllerAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (double)transitionDuration:(id)a3
{
  return 0.35;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end
