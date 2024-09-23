@implementation AMUIOnboardingContainerView

- (void)performPresentationAnimation
{
  -[AMUIOnboardingContainerView _performPresentationAnimationWithCompletion:](self, "_performPresentationAnimationWithCompletion:", 0);
}

- (void)performDismissalAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__AMUIOnboardingContainerView_performDismissalAnimation__block_invoke;
  v2[3] = &unk_250763388;
  v2[4] = self;
  -[AMUIOnboardingContainerView _performDismissalAnimationWithCompletion:](self, "_performDismissalAnimationWithCompletion:", v2);
}

void __56__AMUIOnboardingContainerView_performDismissalAnimation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingContainerView:requestsDismissalWithUserIntent:", *(_QWORD *)(a1 + 32), 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIOnboardingContainerView;
  -[AMUIOnboardingContainerView layoutSubviews](&v3, sel_layoutSubviews);
  -[AMUIOnboardingContainerView _configureAnimationContainerViewIfNecessary](self, "_configureAnimationContainerViewIfNecessary");
  -[AMUIOnboardingContainerView _configureOnboardingViewIfNecessary](self, "_configureOnboardingViewIfNecessary");
  -[AMUIOnboardingContainerView _layoutOnboardingView](self, "_layoutOnboardingView");
}

- (void)onboardingViewRequestsDismissal:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AMUIOnboardingContainerView ambientDefaults](self, "ambientDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstPresentation:", 0);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__AMUIOnboardingContainerView_onboardingViewRequestsDismissal___block_invoke;
  v5[3] = &unk_250763388;
  v5[4] = self;
  -[AMUIOnboardingContainerView _performDismissalAnimationWithCompletion:](self, "_performDismissalAnimationWithCompletion:", v5);
}

void __63__AMUIOnboardingContainerView_onboardingViewRequestsDismissal___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingContainerView:requestsDismissalWithUserIntent:", *(_QWORD *)(a1 + 32), 1);

}

- (void)_configureAnimationContainerViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *animationContainerView;

  if (!self->_animationContainerView)
  {
    v3 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[AMUIOnboardingContainerView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    animationContainerView = self->_animationContainerView;
    self->_animationContainerView = v4;

    -[UIView setAutoresizingMask:](self->_animationContainerView, "setAutoresizingMask:", 18);
    -[AMUIOnboardingContainerView addSubview:](self, "addSubview:", self->_animationContainerView);
    -[AMUIOnboardingContainerView bringSubviewToFront:](self, "bringSubviewToFront:", self->_animationContainerView);
    -[UIView setAlpha:](self->_animationContainerView, "setAlpha:", 0.0);
  }
}

- (void)_configureOnboardingViewIfNecessary
{
  AMUIOnboardingView *v3;
  AMUIOnboardingView *v4;
  AMUIOnboardingView *onboardingView;

  if (!self->_onboardingView)
  {
    v3 = [AMUIOnboardingView alloc];
    v4 = -[AMUIOnboardingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    onboardingView = self->_onboardingView;
    self->_onboardingView = v4;

    -[AMUIOnboardingView setDelegate:](self->_onboardingView, "setDelegate:", self);
    -[UIView addSubview:](self->_animationContainerView, "addSubview:", self->_onboardingView);
    -[UIView bringSubviewToFront:](self->_animationContainerView, "bringSubviewToFront:", self->_onboardingView);
  }
}

- (id)_newBlurMaterialViewWithInitialWeighting:(double)a3 superview:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v5 = (void *)MEMORY[0x24BE64060];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a4;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("ambientOnboardingOverlayBlur"), v8, 0, 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setGroupNameBase:", CFSTR("AMUIOnboardingViewMaterialGroup"));
  objc_msgSend(v7, "addSubview:", v9);
  objc_msgSend(v7, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  return v9;
}

- (void)_layoutOnboardingView
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  if (self->_onboardingView)
  {
    -[AMUIOnboardingContainerView bounds](self, "bounds");
    x = v7.origin.x;
    y = v7.origin.y;
    width = v7.size.width;
    height = v7.size.height;
    CGRectGetWidth(v7);
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    CGRectGetHeight(v8);
    v9.origin.x = x;
    v9.origin.y = y;
    v9.size.width = width;
    v9.size.height = height;
    CGRectGetWidth(v9);
    UIRectCenteredRect();
    UIRectIntegralWithScale();
    -[AMUIOnboardingView setFrame:](self->_onboardingView, "setFrame:");
  }
}

- (void)_performPresentationAnimationWithCompletion:(id)a3
{
  UIView *v4;
  MTMaterialView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  MTMaterialView *v9;
  void *v10;
  UIView *v11;
  void *v12;
  UIView *v13;
  _QWORD v14[4];
  UIView *v15;
  _QWORD v16[4];
  UIView *v17;
  _QWORD v18[4];
  UIView *v19;
  _QWORD v20[4];
  MTMaterialView *v21;
  _QWORD v22[4];
  MTMaterialView *v23;
  CGAffineTransform v24;

  -[AMUIOnboardingContainerView layoutIfNeeded](self, "layoutIfNeeded", a3);
  -[AMUIOnboardingContainerView _configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:](self, "_configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:", 1.0);
  v4 = self->_animationContainerView;
  v5 = self->_overlayBlurMaterialView;
  -[UIView setAlpha:](v4, "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v24, 1.25, 1.25);
  -[UIView setTransform:](v4, "setTransform:", &v24);
  -[UIView layer](v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", 1);

  v7 = (void *)MEMORY[0x24BDF6F90];
  v8 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke;
  v22[3] = &unk_250763388;
  v23 = v5;
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_2;
  v20[3] = &unk_2507637B0;
  v21 = v23;
  v9 = v23;
  objc_msgSend(v7, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v22, v20, 0.8, 0.195, 2.0, 300.0, 50.0, 0.0);
  v10 = (void *)MEMORY[0x24BDF6F90];
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_3;
  v18[3] = &unk_250763388;
  v11 = v4;
  v19 = v11;
  objc_msgSend(v10, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v18, 0, 2.765, 0.0, 2.0, 30.0, 11.0, 0.0);
  v12 = (void *)MEMORY[0x24BDF6F90];
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_4;
  v16[3] = &unk_250763388;
  v17 = v11;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_5;
  v14[3] = &unk_2507637B0;
  v15 = v17;
  v13 = v17;
  objc_msgSend(v12, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v16, v14, 2.0, 0.2, 1.5, 30.0, 12.0, 0.0);

}

uint64_t __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWeighting:", 0.0);
}

uint64_t __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAllowsGroupOpacity:", 0);

}

- (void)_performDismissalAnimationWithCompletion:(id)a3
{
  id v4;
  UIView *v5;
  AMUIOnboardingView *v6;
  MTMaterialView *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  UIView *v12;
  MTMaterialView *v13;
  AMUIOnboardingView *v14;
  _QWORD v15[4];
  UIView *v16;
  id v17;
  _QWORD v18[4];
  UIView *v19;
  AMUIOnboardingView *v20;
  MTMaterialView *v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  v4 = a3;
  -[AMUIOnboardingContainerView layoutIfNeeded](self, "layoutIfNeeded");
  -[AMUIOnboardingContainerView _configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:](self, "_configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:", 0.0);
  v5 = self->_animationContainerView;
  v6 = self->_onboardingView;
  v7 = self->_overlayBlurMaterialView;
  -[UIView layer](v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsGroupOpacity:", 1);

  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeScale(&v23, 0.8, 0.8);
  v9 = (void *)MEMORY[0x24BDF6F90];
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__AMUIOnboardingContainerView__performDismissalAnimationWithCompletion___block_invoke;
  v18[3] = &unk_2507638C0;
  v19 = v5;
  v20 = v6;
  v22 = v23;
  v21 = v7;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __72__AMUIOnboardingContainerView__performDismissalAnimationWithCompletion___block_invoke_2;
  v15[3] = &unk_2507638E8;
  v16 = v19;
  v17 = v4;
  v11 = v4;
  v12 = v19;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v9, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v18, v15, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);

}

uint64_t __72__AMUIOnboardingContainerView__performDismissalAnimationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 72);
  v5[0] = *(_OWORD *)(a1 + 56);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 88);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 48), "setWeighting:", 1.0);
}

uint64_t __72__AMUIOnboardingContainerView__performDismissalAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:(double)a3
{
  MTMaterialView *v4;
  MTMaterialView *overlayBlurMaterialView;

  v4 = -[AMUIOnboardingContainerView _newBlurMaterialViewWithInitialWeighting:superview:](self, "_newBlurMaterialViewWithInitialWeighting:superview:", self->_animationContainerView, a3);
  overlayBlurMaterialView = self->_overlayBlurMaterialView;
  self->_overlayBlurMaterialView = v4;

  -[UIView bringSubviewToFront:](self->_animationContainerView, "bringSubviewToFront:", self->_overlayBlurMaterialView);
}

- (AMUIOnboardingContainerViewDelegate)delegate
{
  return (AMUIOnboardingContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMAmbientDefaults)ambientDefaults
{
  return (AMAmbientDefaults *)objc_loadWeakRetained((id *)&self->_ambientDefaults);
}

- (void)setAmbientDefaults:(id)a3
{
  objc_storeWeak((id *)&self->_ambientDefaults, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ambientDefaults);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationContainerView, 0);
  objc_storeStrong((id *)&self->_onboardingView, 0);
  objc_storeStrong((id *)&self->_overlayBlurMaterialView, 0);
}

@end
