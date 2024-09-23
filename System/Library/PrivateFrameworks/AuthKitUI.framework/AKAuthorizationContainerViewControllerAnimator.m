@implementation AKAuthorizationContainerViewControllerAnimator

- (AKAuthorizationContainerViewControllerAnimator)init
{
  return -[AKAuthorizationContainerViewControllerAnimator initWithPresenting:](self, "initWithPresenting:", 1);
}

- (AKAuthorizationContainerViewControllerAnimator)initWithPresenting:(BOOL)a3
{
  AKAuthorizationContainerViewControllerAnimator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationContainerViewControllerAnimator;
  result = -[AKAuthorizationContainerViewControllerAnimator init](&v5, sel_init);
  if (result)
    result->_presenting = a3;
  return result;
}

- (id)_viewControllerForTransitionContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  _QWORD *v6;
  void *v7;

  v4 = a3;
  v5 = -[AKAuthorizationContainerViewControllerAnimator isPresenting](self, "isPresenting");
  v6 = (_QWORD *)MEMORY[0x1E0CEBDB8];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x1E0CEBDA8];
  objc_msgSend(v4, "viewControllerForKey:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)animateTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  -[AKAuthorizationContainerViewControllerAnimator _viewControllerForTransitionContext:](self, "_viewControllerForTransitionContext:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v22;
  objc_msgSend(v4, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v6;
  objc_msgSend(v4, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v9;
  objc_msgSend(v4, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v13);

  v14 = MEMORY[0x1E0C809B0];
  v15 = (void *)MEMORY[0x1E0CEABB0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__AKAuthorizationContainerViewControllerAnimator_animateTransition___block_invoke;
  v29[3] = &unk_1E76789A0;
  v30 = v4;
  v16 = v4;
  objc_msgSend(v15, "performWithoutAnimation:", v29);
  v17 = (void *)MEMORY[0x1E0CEABB0];
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __68__AKAuthorizationContainerViewControllerAnimator_animateTransition___block_invoke_3;
  v27[3] = &unk_1E7678C38;
  v28 = v25;
  v18 = v25;
  objc_msgSend(v17, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, &__block_literal_global_1, v27);

}

uint64_t __68__AKAuthorizationContainerViewControllerAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __68__AKAuthorizationContainerViewControllerAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
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
