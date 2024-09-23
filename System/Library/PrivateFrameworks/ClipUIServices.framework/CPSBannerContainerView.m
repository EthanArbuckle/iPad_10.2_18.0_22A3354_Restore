@implementation CPSBannerContainerView

- (CPSBannerContainerView)initWithBannerView:(id)a3
{
  id v5;
  void *v6;
  CPSBannerContainerView *v7;
  CPSBannerContainerView *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v10.receiver = self;
  v10.super_class = (Class)CPSBannerContainerView;
  v7 = -[CPSBannerContainerView initWithFrame:](&v10, sel_initWithFrame_);

  if (v7)
  {
    -[CPSBannerContainerView _commonInit](v7, "_commonInit");
    objc_storeStrong((id *)&v7->_bannerView, a3);
    -[CPSBannerContainerView _installBannerViewIfNeeded](v7, "_installBannerViewIfNeeded");
    v8 = v7;
  }

  return v7;
}

- (CPSBannerContainerView)initWithFrame:(CGRect)a3
{
  return -[CPSBannerContainerView initWithBannerView:](self, "initWithBannerView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CPSBannerContainerView)initWithCoder:(id)a3
{
  CPSBannerContainerView *v3;
  CPSBannerContainerView *v4;
  CPSBannerContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSBannerContainerView;
  v3 = -[CPSBannerContainerView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CPSBannerContainerView _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *dismissGesture;

  self->_bannerHidden = 1;
  v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__dismissGestureRecognized_);
  dismissGesture = self->_dismissGesture;
  self->_dismissGesture = v3;

  -[UIPanGestureRecognizer setAllowedScrollTypesMask:](self->_dismissGesture, "setAllowedScrollTypesMask:", 2);
  -[UIPanGestureRecognizer setDelegate:](self->_dismissGesture, "setDelegate:", self);
  -[CPSBannerContainerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_dismissGesture);
}

- (void)updateConstraints
{
  _BOOL8 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSBannerContainerView;
  -[CPSBannerContainerView updateConstraints](&v4, sel_updateConstraints);
  v3 = self->_bannerHidden && !self->_bannerCrossFading;
  objc_msgSend(MEMORY[0x1E0CB3718], "cps_if:thenActivate:elseActivate:", v3, self->_verticalPositionConstraintWhenHidden, self->_verticalPositionConstraintWhenVisible);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CPSBannerContainerView *v5;
  CPSBannerContainerView *v6;
  CPSBannerContainerView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPSBannerContainerView;
  -[CPSBannerContainerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CPSBannerContainerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_bannerHasAccessibilityFocus)
    -[CPSBannerContainerView setBannerHasAccessibilityFocus:](self, "setBannerHasAccessibilityFocus:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__accessibilityElementFocusDidChange_, *MEMORY[0x1E0CEAFF8], 0);
  else
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEAFF8], 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSBannerContainerView;
  -[CPSBannerContainerView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CPSBannerContainerView _updateBannerContentSizeCategory](self, "_updateBannerContentSizeCategory");
}

- (void)setBannerView:(id)a3
{
  UIView *v5;
  UIView *bannerView;
  UIView *v7;

  v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](bannerView, "removeFromSuperview");
    -[UIView _setLocalOverrideTraitCollection:](self->_bannerView, "_setLocalOverrideTraitCollection:", 0);
    objc_storeStrong((id *)&self->_bannerView, a3);
    -[CPSBannerContainerView _installBannerViewIfNeeded](self, "_installBannerViewIfNeeded");
    v5 = v7;
  }

}

- (void)setBannerHidden:(BOOL)a3 animated:(BOOL)a4 animationCompletion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void (**v8)(_QWORD);
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD v15[5];
  _QWORD v16[5];
  void (**v17)(_QWORD);
  _QWORD v18[5];
  BOOL v19;

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (self->_bannerHidden != v6)
  {
    if (v5)
    {
      -[CPSBannerContainerView _removeBannerAnimationsIfNeeded](self, "_removeBannerAnimationsIfNeeded");
      -[CPSBannerContainerView layoutIfNeeded](self, "layoutIfNeeded");
      -[CPSBannerContainerView setBannerHidden:](self, "setBannerHidden:", v6);
      -[CPSBannerContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      if (UIAccessibilityPrefersCrossFadeTransitions())
      {
        self->_bannerCrossFading = 1;
        v9 = 0.0;
        if (v6)
          v9 = 1.0;
        -[UIView setAlpha:](self->_bannerView, "setAlpha:", v9);
        v10 = (void *)MEMORY[0x1E0CEABB0];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke;
        v18[3] = &unk_1E8E8B0B8;
        v18[4] = self;
        v19 = v6;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_2;
        v16[3] = &unk_1E8E8B110;
        v16[4] = self;
        v17 = v8;
        objc_msgSend(v10, "animateWithDuration:animations:completion:", v18, v16, 0.2);
        v11 = v17;
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CEABB0];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_3;
        v15[3] = &unk_1E8E8AE88;
        v15[4] = self;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_4;
        v13[3] = &unk_1E8E8B138;
        v14 = v8;
        objc_msgSend(v12, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v15, v13, 1.0, 0.5, 0.0, 0.0, 0.0, 0.998);
        v11 = v14;
      }

      goto LABEL_12;
    }
    -[CPSBannerContainerView setBannerHidden:](self, "setBannerHidden:", v6);
    -[CPSBannerContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  if (v8)
    v8[2](v8);
LABEL_12:

}

uint64_t __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", v1);
}

uint64_t __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateConstraintsIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isTrackingBannerDismissGesture
{
  return -[NSLayoutConstraint isActive](self->_verticalPositionConstraintForDismissGesture, "isActive");
}

- (void)_accessibilityElementFocusDidChange:(id)a3
{
  UIView *bannerView;
  void *v5;
  void *v6;
  uint64_t v7;

  bannerView = self->_bannerView;
  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB000]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = viewContainsAccessibilityElement(bannerView, v6);

  if (self->_bannerHasAccessibilityFocus != (_DWORD)v7)
    -[CPSBannerContainerView setBannerHasAccessibilityFocus:](self, "setBannerHasAccessibilityFocus:", v7);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v3;
  UIView *bannerView;
  void *v5;
  objc_super v7;

  if (self->_dismissGesture == a3)
  {
    bannerView = self->_bannerView;
    objc_msgSend(a3, "locationInView:", bannerView);
    -[UIView hitTest:withEvent:](bannerView, "hitTest:withEvent:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 != 0;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CPSBannerContainerView;
    return -[CPSBannerContainerView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_);
  }
  return v3;
}

- (void)_dismissGestureRecognized:(id)a3
{
  UIPanGestureRecognizer *dismissGesture;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  double verticalPositionOffsetForDismissGesture;
  UIView *v13;
  double v14;
  double v15;
  _QWORD v16[7];
  CGRect v17;
  CGRect v18;

  dismissGesture = self->_dismissGesture;
  v5 = a3;
  -[UIPanGestureRecognizer translationInView:](dismissGesture, "translationInView:", self);
  v7 = v6;
  -[UIPanGestureRecognizer velocityInView:](self->_dismissGesture, "velocityInView:", self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__CPSBannerContainerView__dismissGestureRecognized___block_invoke;
  v16[3] = &unk_1E8E8B160;
  v16[4] = self;
  *(double *)&v16[5] = v7;
  v16[6] = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E1B78](v16);
  v10 = objc_msgSend(v5, "state");

  switch(v10)
  {
    case 1:
      -[UIPanGestureRecognizer setTranslation:inView:](self->_dismissGesture, "setTranslation:inView:", self, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      -[UIView frame](self->_bannerView, "frame");
      self->_verticalPositionOffsetForDismissGesture = CGRectGetMinY(v17);
      -[NSLayoutConstraint setConstant:](self->_verticalPositionConstraintForDismissGesture, "setConstant:");
      -[CPSBannerContainerView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("trackingBannerDismissGesture"));
      -[NSLayoutConstraint setActive:](self->_verticalPositionConstraintForDismissGesture, "setActive:", 1);
      -[CPSBannerContainerView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("trackingBannerDismissGesture"));
      break;
    case 2:
      verticalPositionOffsetForDismissGesture = self->_verticalPositionOffsetForDismissGesture;
      v13 = self->_bannerView;
      -[UIView bounds](v13, "bounds");
      CGRectGetHeight(v18);
      BSUIConstrainValueWithRubberBand();
      -[UIView contentScaleFactor](v13, "contentScaleFactor");

      UIPointRoundToScale();
      v15 = verticalPositionOffsetForDismissGesture + v14;
      if (v7 >= 0.0 || v15 <= self->_verticalPositionOffsetForDismissGesture)
        -[NSLayoutConstraint setConstant:](self->_verticalPositionConstraintForDismissGesture, "setConstant:", v15);
      break;
    case 3:
      v9[2](v9, 0);
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_bannerHidden);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v11);

      break;
    default:
      break;
  }

}

void __52__CPSBannerContainerView__dismissGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double Height;
  double v12;
  double v13;
  unsigned __int8 *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
    v6 = 0;
    v7 = *(double *)(a1 + 40);
  }
  else
  {
    v8 = -*(double *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "frame");
    v5 = CGRectGetMaxY(v24) * 0.5 < v8 || *(double *)(a1 + 48) < -100.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "constant");
    v10 = v9;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "frame");
    if (v10 < -CGRectGetHeight(v25))
      v6 = v5;
    else
      v6 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "frame");
    Height = CGRectGetHeight(v26);
    objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
    v13 = -(Height + v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "frame");
    v7 = v13 - CGRectGetMinY(v27);
  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("trackingBannerDismissGesture"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("trackingBannerDismissGesture"));
  v14 = *(unsigned __int8 **)(a1 + 32);
  if (v14[472] != (_DWORD)v5)
  {
    objc_msgSend(v14, "setBannerHidden:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2848], "animation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStiffness:", 194.955149);
    objc_msgSend(v15, "stiffness");
    objc_msgSend(v15, "setDamping:", sqrt(v16) * 1.7);
    if (v7 == 0.0)
      v17 = 0.0;
    else
      v17 = *(double *)(a1 + 48) / v7;
    objc_msgSend(v15, "setInitialVelocity:", v17);
    v18 = objc_alloc(MEMORY[0x1E0CEA9D8]);
    objc_msgSend(v15, "initialVelocity");
    v20 = (void *)objc_msgSend(v18, "initWithDampingRatio:initialVelocity:", 0.85, 0.0, v19);
    v21 = objc_alloc(MEMORY[0x1E0CEABC8]);
    objc_msgSend(v15, "settlingDuration");
    v22 = (void *)objc_msgSend(v21, "initWithDuration:timingParameters:", v20);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__CPSBannerContainerView__dismissGestureRecognized___block_invoke_2;
    v23[3] = &unk_1E8E8AE88;
    v23[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v22, "addAnimations:", v23);
    objc_msgSend(v22, "startAnimation");

  }
}

uint64_t __52__CPSBannerContainerView__dismissGestureRecognized___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateConstraintsIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_installBannerViewIfNeeded
{
  UIView *bannerView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *verticalPositionConstraintForDismissGesture;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *verticalPositionConstraintWhenVisible;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *verticalPositionConstraintWhenHidden;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  bannerView = self->_bannerView;
  if (bannerView)
  {
    -[UIView superview](bannerView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_bannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CPSBannerContainerView addSubview:](self, "addSubview:", self->_bannerView);
      -[CPSBannerContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSBannerContainerView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("trackingBannerDismissGesture"));
      -[UIView topAnchor](self->_bannerView, "topAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSBannerContainerView topAnchor](self, "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v7);
      v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      verticalPositionConstraintForDismissGesture = self->_verticalPositionConstraintForDismissGesture;
      self->_verticalPositionConstraintForDismissGesture = v8;

      -[CPSBannerContainerView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("trackingBannerDismissGesture"));
      -[UIView topAnchor](self->_bannerView, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 8.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = 1148829696;
      objc_msgSend(v12, "cps_setPriority:", v13);
      v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      verticalPositionConstraintWhenVisible = self->_verticalPositionConstraintWhenVisible;
      self->_verticalPositionConstraintWhenVisible = v14;

      -[UIView bottomAnchor](self->_bannerView, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSBannerContainerView topAnchor](self, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 1148829696;
      objc_msgSend(v18, "cps_setPriority:", v19);
      v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      verticalPositionConstraintWhenHidden = self->_verticalPositionConstraintWhenHidden;
      self->_verticalPositionConstraintWhenHidden = v20;

      v32 = (void *)MEMORY[0x1E0CB3718];
      -[UIView centerXAnchor](self->_bannerView, "centerXAnchor");
      v33 = v5;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v23;
      -[UIView leadingAnchor](self->_bannerView, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", v25, 8.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v26;
      -[UIView widthAnchor](self->_bannerView, "widthAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToConstant:", 556.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = 1144750080;
      objc_msgSend(v28, "cps_setPriority:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v31);

      -[CPSBannerContainerView _updateBannerContentSizeCategory](self, "_updateBannerContentSizeCategory");
    }
  }
}

- (void)_removeBannerAnimationsIfNeeded
{
  CGFloat Width;
  CGRect v4;

  -[CPSBannerContainerView bounds](self, "bounds");
  Width = CGRectGetWidth(v4);
  if (Width != self->_widthDuringLastBannerAnimation)
    -[UIView _removeAllRetargetableAnimations:](self->_bannerView, "_removeAllRetargetableAnimations:", 0);
  self->_widthDuringLastBannerAnimation = Width;
}

- (void)_updateBannerContentSizeCategory
{
  NSString *v3;
  void *v4;
  NSString *v5;
  NSComparisonResult v6;
  id v7;

  v3 = (NSString *)*MEMORY[0x1E0CEB3F8];
  -[CPSBannerContainerView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = UIContentSizeCategoryCompareToCategory(v3, v5);

  if (v6 == NSOrderedAscending)
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView _setLocalOverrideTraitCollection:](self->_bannerView, "_setLocalOverrideTraitCollection:", v7);

  }
  else
  {
    -[UIView _setLocalOverrideTraitCollection:](self->_bannerView, "_setLocalOverrideTraitCollection:", 0);
  }
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (BOOL)isBannerHidden
{
  return self->_bannerHidden;
}

- (void)setBannerHidden:(BOOL)a3
{
  self->_bannerHidden = a3;
}

- (BOOL)bannerHasAccessibilityFocus
{
  return self->_bannerHasAccessibilityFocus;
}

- (void)setBannerHasAccessibilityFocus:(BOOL)a3
{
  self->_bannerHasAccessibilityFocus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_verticalPositionConstraintWhenHidden, 0);
  objc_storeStrong((id *)&self->_verticalPositionConstraintWhenVisible, 0);
  objc_storeStrong((id *)&self->_verticalPositionConstraintForDismissGesture, 0);
  objc_storeStrong((id *)&self->_dismissGesture, 0);
}

@end
