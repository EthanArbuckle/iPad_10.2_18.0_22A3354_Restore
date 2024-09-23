@implementation CKSendMenuPresentationPopoverView

- (CKSendMenuPresentationPopoverView)init
{
  CKSendMenuPresentationPopoverView *v2;
  void *v3;
  CKSendMenuPresentationPopoverBackdropView *v4;
  CKSendMenuPresentationPopoverBackdropView *backdropView;
  CKEntryViewPlusButton *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  CKEntryViewPlusButton *plusButton;
  void *v14;
  void *v15;
  UIVisualEffectView *v16;
  UIVisualEffectView *blurBackgroundView;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKSendMenuPresentationPopoverView;
  v2 = -[CKSendMenuPresentationPopoverView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSendMenuPresentationPopoverView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[CKSendMenuPresentationPopoverView setAlpha:](v2, "setAlpha:", 1.0);
    v2->_layoutSubviewsEnabled = 0;
    v4 = objc_alloc_init(CKSendMenuPresentationPopoverBackdropView);
    backdropView = v2->_backdropView;
    v2->_backdropView = v4;

    v6 = [CKEntryViewPlusButton alloc];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entryViewPlusButtonSize");
    v9 = v8;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entryViewPlusButtonSize");
    v12 = -[CKEntryViewPlusButton initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, v9, v11);
    plusButton = v2->_plusButton;
    v2->_plusButton = (CKEntryViewPlusButton *)v12;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSendMenuPresentationPopoverBackdropView setBackgroundColor:](v2->_backdropView, "setBackgroundColor:", v14);

    -[CKSendMenuPresentationPopoverBackdropView setClipsToBounds:](v2->_backdropView, "setClipsToBounds:", 1);
    -[CKSendMenuPresentationPopoverBackdropView layer](v2->_backdropView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    v16 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0CEABE8]);
    blurBackgroundView = v2->_blurBackgroundView;
    v2->_blurBackgroundView = v16;

    -[UIVisualEffectView layer](v2->_blurBackgroundView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMasksToBounds:", 1);

    -[UIVisualEffectView contentView](v2->_blurBackgroundView, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v2->_plusButton);

    -[CKSendMenuPresentationPopoverView addSubview:](v2, "addSubview:", v2->_backdropView);
    -[CKSendMenuPresentationPopoverView addSubview:](v2, "addSubview:", v2->_blurBackgroundView);
  }
  return v2;
}

- (BOOL)isLayoutSubviewsEnabled
{
  return self->_layoutSubviewsEnabled;
}

- (void)setLayoutSubviewsEnabled:(BOOL)a3
{
  if (self->_layoutSubviewsEnabled != a3)
    self->_layoutSubviewsEnabled = a3;
}

- (UIView)appView
{
  return self->_appView;
}

- (void)setAppView:(id)a3
{
  UIView *v5;
  UIView **p_appView;
  UIView *appView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_appView = &self->_appView;
  appView = self->_appView;
  v9 = v5;
  if (appView != v5)
  {
    if (appView)
      -[UIView removeFromSuperview](appView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_appView, a3);
    if (*p_appView)
    {
      -[CKSendMenuPresentationPopoverView contentContainerView](self, "contentContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_appView);

    }
  }

}

- (void)setSendMenuView:(id)a3
{
  UIView *v5;
  UIView **p_sendMenuView;
  UIView *sendMenuView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_sendMenuView = &self->_sendMenuView;
  sendMenuView = self->_sendMenuView;
  v9 = v5;
  if (sendMenuView != v5)
  {
    if (sendMenuView)
      -[UIView removeFromSuperview](sendMenuView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_sendMenuView, a3);
    if (*p_sendMenuView)
    {
      -[CKSendMenuPresentationPopoverView contentContainerView](self, "contentContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_sendMenuView);

    }
  }

}

- (id)contentContainerView
{
  return -[UIVisualEffectView contentView](self->_blurBackgroundView, "contentView");
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)CKSendMenuPresentationPopoverView;
  -[CKSendMenuPresentationPopoverView layoutSubviews](&v9, sel_layoutSubviews);
  if (self->_layoutSubviewsEnabled)
  {
    -[CKSendMenuPresentationPopoverView bounds](self, "bounds");
    x = v10.origin.x;
    y = v10.origin.y;
    width = v10.size.width;
    height = v10.size.height;
    MidX = CGRectGetMidX(v10);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    MidY = CGRectGetMidY(v11);
    -[UIVisualEffectView setFrame:](self->_blurBackgroundView, "setFrame:", x, y, width, height);
    -[CKSendMenuPresentationPopoverBackdropView setBounds:](self->_backdropView, "setBounds:", x, y, width, height);
    -[CKSendMenuPresentationPopoverBackdropView setCenter:](self->_backdropView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_sendMenuView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_sendMenuView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_appView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_appView, "setCenter:", MidX, MidY);
  }
}

- (id)animationForDismissingWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4 finalAlpha:(double)a5
{
  UIView *appView;

  appView = self->_appView;
  if (!appView)
    appView = self->_sendMenuView;
  return -[CKSendMenuPresentationPopoverView _animationForDismissingContentView:finalBounds:finalCenter:finalAlpha:](self, "_animationForDismissingContentView:finalBounds:finalCenter:finalAlpha:", appView, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.x, a4.y, a5);
}

- (id)_animationForDismissingContentView:(id)a3 finalBounds:(CGRect)a4 finalCenter:(CGPoint)a5 finalAlpha:(double)a6
{
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  CGFloat v10;
  CGFloat v11;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CKSendMenuPopoverAnimation *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  _QWORD v46[6];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[9];
  _QWORD v51[9];
  _QWORD v52[5];
  id v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  _QWORD v60[5];
  id v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  _QWORD v68[5];
  id v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  _QWORD v75[5];
  id v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  _QWORD v82[13];
  CGRect v83;
  CGRect v84;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v10 = a4.origin.y;
  v11 = a4.origin.x;
  v82[11] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(v13, "bounds");
  v14 = width / CGRectGetWidth(v83);
  objc_msgSend(v13, "bounds");
  v15 = height / CGRectGetHeight(v84);
  if (v14 >= v15)
    v16 = v15;
  else
    v16 = v14;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverWidthAnimator");
  v18 = MEMORY[0x1E0C809B0];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke;
  v75[3] = &unk_1E2755E50;
  v77 = v11;
  v78 = v10;
  v79 = width;
  v80 = height;
  v75[4] = self;
  v19 = v13;
  v76 = v19;
  v81 = v16;
  objc_msgSend(v38, "addAnimations:", v75);
  v37 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverHeightAnimator");
  v68[0] = v18;
  v68[1] = 3221225472;
  v68[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_2;
  v68[3] = &unk_1E2755E50;
  v70 = v11;
  v71 = v10;
  v72 = width;
  v73 = height;
  v68[4] = self;
  v20 = v19;
  v69 = v20;
  v74 = v16;
  objc_msgSend(v37, "addAnimations:", v68);
  v36 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverCenterXAnimator");
  v60[0] = v18;
  v60[1] = 3221225472;
  v60[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_3;
  v60[3] = &unk_1E2755E78;
  v60[4] = self;
  v62 = x;
  v63 = y;
  v64 = v11;
  v65 = v10;
  v66 = width;
  v67 = height;
  v21 = v20;
  v61 = v21;
  objc_msgSend(v36, "addAnimations:", v60);
  v33 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverCenterYAnimator");
  v52[0] = v18;
  v52[1] = 3221225472;
  v52[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_4;
  v52[3] = &unk_1E2755E78;
  v52[4] = self;
  v54 = x;
  v55 = y;
  v56 = v11;
  v57 = v10;
  v58 = width;
  v59 = height;
  v22 = v21;
  v53 = v22;
  objc_msgSend(v33, "addAnimations:", v52);
  v32 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverPlusCenterXAnimator");
  v51[0] = v18;
  v51[1] = 3221225472;
  v51[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_5;
  v51[3] = &unk_1E274B8B8;
  *(CGFloat *)&v51[5] = v11;
  *(CGFloat *)&v51[6] = v10;
  *(double *)&v51[7] = width;
  *(double *)&v51[8] = height;
  v51[4] = self;
  objc_msgSend(v32, "addAnimations:", v51);
  v50[0] = v18;
  v50[1] = 3221225472;
  v50[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_6;
  v50[3] = &unk_1E274B8B8;
  *(CGFloat *)&v50[5] = v11;
  *(CGFloat *)&v50[6] = v10;
  *(double *)&v50[7] = width;
  *(double *)&v50[8] = height;
  v50[4] = self;
  v23 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverPlusCenterYAnimator");
  objc_msgSend(v23, "addAnimations:", v50);
  v49[0] = v18;
  v49[1] = 3221225472;
  v49[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_7;
  v49[3] = &unk_1E274A208;
  v49[4] = self;
  v24 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverPlusIconScaleXAnimator");
  objc_msgSend(v24, "addAnimations:", v49);
  v31 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverPlusIconScaleYAnimator");
  v48[0] = v18;
  v48[1] = 3221225472;
  v48[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_8;
  v48[3] = &unk_1E274A208;
  v48[4] = self;
  objc_msgSend(v31, "addAnimations:", v48);
  v25 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverPlusIconBlurRadiusAnimator");
  v47[0] = v18;
  v47[1] = 3221225472;
  v47[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_9;
  v47[3] = &unk_1E274A208;
  v47[4] = self;
  objc_msgSend(v25, "addAnimations:delayFactor:", v47, 0.185);
  v26 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverPlusIconOpacityAnimator");
  v46[0] = v18;
  v46[1] = 3221225472;
  v46[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_10;
  v46[3] = &unk_1E274C9C0;
  v46[4] = self;
  *(double *)&v46[5] = a6;
  objc_msgSend(v26, "addAnimations:delayFactor:", v46, 0.185);
  v27 = (void *)objc_msgSend(v17, "newSendMenuDismissPopoverAnimator");
  v39[0] = v18;
  v39[1] = 3221225472;
  v39[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_11;
  v39[3] = &unk_1E2755E50;
  v41 = v11;
  v42 = v10;
  v43 = width;
  v44 = height;
  v39[4] = self;
  v40 = v22;
  v45 = a6;
  v35 = v22;
  objc_msgSend(v27, "addAnimations:", v39);
  v82[0] = v37;
  v82[1] = v38;
  v82[2] = v36;
  v82[3] = v33;
  v82[4] = v27;
  v82[5] = v32;
  v82[6] = v23;
  v82[7] = v24;
  v82[8] = v31;
  v82[9] = v26;
  v82[10] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[CKSendMenuPopoverAnimation initWithAnimators:]([CKSendMenuPopoverAnimation alloc], "initWithAnimators:", v28);

  return v30;
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke(uint64_t a1)
{
  double Width;
  void *v3;

  Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsWidth:");
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setBoundsWidth:", Width);

  return objc_msgSend(*(id *)(a1 + 40), "ck_setScaleX:", *(double *)(a1 + 80));
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_2(uint64_t a1)
{
  double Height;
  void *v3;

  Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsHeight:");
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setBoundsHeight:", Height);

  return objc_msgSend(*(id *)(a1 + 40), "ck_setScaleY:", *(double *)(a1 + 80));
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_3(uint64_t a1)
{
  CGFloat v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionX:", *(double *)(a1 + 48));
  v2 = CGRectGetWidth(*(CGRect *)(a1 + 64)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionX:", v2);

  return objc_msgSend(*(id *)(a1 + 40), "ck_setPositionX:", v2);
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_4(uint64_t a1)
{
  CGFloat v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionY:", *(double *)(a1 + 56));
  v2 = CGRectGetHeight(*(CGRect *)(a1 + 64)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionY:", v2);

  return objc_msgSend(*(id *)(a1 + 40), "ck_setPositionY:", v2);
}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_5(uint64_t a1)
{
  CGFloat v2;
  id v3;

  v2 = CGRectGetWidth(*(CGRect *)(a1 + 40)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionX:", v2);

}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_6(uint64_t a1)
{
  CGFloat v2;
  id v3;

  v2 = CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionY:", v2);

}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_7(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ck_setScaleX:", 1.0);

}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_8(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ck_setScaleY:", 1.0);

}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_9(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundBlurRadiusLightMode:", -1.0);

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundBlurRadiusDarkMode:", -1.0);

}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_10(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_11(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;

  v2 = CGRectGetWidth(*(CGRect *)(a1 + 48)) * 0.5;
  if (v2 <= 40.0)
    v3 = v2;
  else
    v3 = 40.0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryViewPlusButtonDefaultBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v3);

  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  v9 = *(double *)(a1 + 48);
  v10 = *(double *)(a1 + 56);
  v11 = *(double *)(a1 + 64);
  v12 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", v9, v10, v11, v12);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEffect:", 0);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMasksToBounds:", 1);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", v3);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClipsToBounds:", 1);

  v20 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", v20);

  v22 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", v22);

  v24 = CGRectGetWidth(*(CGRect *)(a1 + 48)) * 0.5;
  v25 = CGRectGetWidth(*(CGRect *)(a1 + 48)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", v24, v25);

  v27 = *(double *)(a1 + 48);
  v28 = *(double *)(a1 + 56);
  v29 = *(double *)(a1 + 64);
  v30 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBounds:", v27, v28, v29, v30);

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCornerRadius:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "setUserInteractionEnabled:", 1);
}

- (id)animationForPresentingInitialViewWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  void *v11;
  UIView *sendMenuView;
  UIView *v13;
  uint64_t v14;
  UIView *v15;
  UIView *v16;
  void *v17;
  UIView *v18;
  void *v19;
  void *v20;
  UIView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CKSendMenuPopoverAnimation *v28;
  void *v29;
  void *v30;
  id v31;
  UIView *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  UIView *v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[9];
  _QWORD v48[9];
  _QWORD v49[5];
  UIView *v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  _QWORD v57[5];
  UIView *v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  _QWORD v65[5];
  UIView *v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  _QWORD v71[5];
  UIView *v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  _QWORD v77[13];

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  v77[11] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sendMenuView = self->_sendMenuView;
  if (!sendMenuView)
    sendMenuView = self->_appView;
  v13 = sendMenuView;
  v35 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverWidthAnimator");
  v14 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke;
  v71[3] = &unk_1E2755EA0;
  v73 = v9;
  v74 = v8;
  v75 = width;
  v76 = height;
  v71[4] = self;
  v15 = v13;
  v72 = v15;
  objc_msgSend(v35, "addAnimations:delayFactor:", v71, 0.025);
  v34 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverHeightAnimator");
  v65[0] = v14;
  v65[1] = 3221225472;
  v65[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_2;
  v65[3] = &unk_1E2755EA0;
  v65[4] = self;
  v67 = v9;
  v68 = v8;
  v69 = width;
  v70 = height;
  v16 = v15;
  v66 = v16;
  objc_msgSend(v34, "addAnimations:", v65);
  v17 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverCenterXAnimator");
  v57[0] = v14;
  v57[1] = 3221225472;
  v57[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_3;
  v57[3] = &unk_1E2755E78;
  v57[4] = self;
  v59 = x;
  v60 = y;
  v61 = v9;
  v62 = v8;
  v63 = width;
  v64 = height;
  v18 = v16;
  v58 = v18;
  v19 = v17;
  objc_msgSend(v17, "addAnimations:delayFactor:", v57, 0.025);
  v20 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverCenterYAnimator");
  v49[0] = v14;
  v49[1] = 3221225472;
  v49[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_4;
  v49[3] = &unk_1E2755E78;
  v49[4] = self;
  v51 = x;
  v52 = y;
  v53 = v9;
  v54 = v8;
  v55 = width;
  v56 = height;
  v21 = v18;
  v50 = v21;
  objc_msgSend(v20, "addAnimations:", v49);
  v33 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverPlusCenterXAnimator");
  v48[0] = v14;
  v48[1] = 3221225472;
  v48[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_5;
  v48[3] = &unk_1E274B8B8;
  *(CGFloat *)&v48[5] = v9;
  *(CGFloat *)&v48[6] = v8;
  *(CGFloat *)&v48[7] = width;
  *(CGFloat *)&v48[8] = height;
  v48[4] = self;
  objc_msgSend(v33, "addAnimations:delayFactor:", v48, 0.025);
  v30 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverPlusCenterYAnimator");
  v47[0] = v14;
  v47[1] = 3221225472;
  v47[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_6;
  v47[3] = &unk_1E274B8B8;
  *(CGFloat *)&v47[5] = v9;
  *(CGFloat *)&v47[6] = v8;
  *(CGFloat *)&v47[7] = width;
  *(CGFloat *)&v47[8] = height;
  v47[4] = self;
  objc_msgSend(v30, "addAnimations:", v47);
  v29 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverPlusIconScaleXAnimator");
  v46[0] = v14;
  v46[1] = 3221225472;
  v46[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_7;
  v46[3] = &unk_1E274A208;
  v46[4] = self;
  objc_msgSend(v29, "addAnimations:delayFactor:", v46, 0.025);
  v22 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverPlusIconScaleYAnimator");
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_8;
  v45[3] = &unk_1E274A208;
  v45[4] = self;
  objc_msgSend(v22, "addAnimations:", v45);
  v23 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverPlusIconBlurRadiusAnimator");
  v44[0] = v14;
  v44[1] = 3221225472;
  v44[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_9;
  v44[3] = &unk_1E274A208;
  v44[4] = self;
  objc_msgSend(v23, "addAnimations:", v44);
  v24 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverPlusIconOpacityAnimator");
  v43[0] = v14;
  v43[1] = 3221225472;
  v43[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_10;
  v43[3] = &unk_1E274A208;
  v43[4] = self;
  objc_msgSend(v24, "addAnimations:", v43);
  v25 = (void *)objc_msgSend(v11, "newSendMenuPresentPopoverAnimator");
  v36[0] = v14;
  v36[1] = 3221225472;
  v36[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_11;
  v36[3] = &unk_1E274FAF8;
  v39 = v9;
  v40 = v8;
  v41 = width;
  v42 = height;
  v36[4] = self;
  v37 = v11;
  v38 = v21;
  v32 = v21;
  v31 = v11;
  objc_msgSend(v25, "addAnimations:", v36);
  v77[0] = v34;
  v77[1] = v35;
  v77[2] = v19;
  v77[3] = v20;
  v77[4] = v25;
  v77[5] = v33;
  v77[6] = v30;
  v77[7] = v29;
  v77[8] = v22;
  v77[9] = v24;
  v77[10] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[CKSendMenuPopoverAnimation initWithAnimators:]([CKSendMenuPopoverAnimation alloc], "initWithAnimators:", v26);

  return v28;
}

uint64_t __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke(uint64_t a1)
{
  double Width;
  void *v3;
  void *v4;

  Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsWidth:");
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setBoundsWidth:", Width);

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_setBoundsWidth:", Width);

  return objc_msgSend(*(id *)(a1 + 40), "ck_setScaleX:", 1.0);
}

uint64_t __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_2(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsHeight:", *(double *)(a1 + 72));
  v2 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setBoundsHeight:", v2);

  v4 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ck_setBoundsHeight:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "ck_setScaleY:", 1.0);
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_3(uint64_t a1)
{
  CGFloat v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionX:", *(double *)(a1 + 48));
  v2 = CGRectGetWidth(*(CGRect *)(a1 + 64)) * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "ck_setPositionX:", v2);
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionX:", v2);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_setPositionX:", v2);

}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_4(uint64_t a1)
{
  CGFloat v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionY:", *(double *)(a1 + 56));
  v2 = CGRectGetHeight(*(CGRect *)(a1 + 64)) * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "ck_setPositionY:", v2);
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionY:", v2);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_setPositionY:", v2);

}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_5(uint64_t a1)
{
  CGFloat v2;
  id v3;

  v2 = CGRectGetWidth(*(CGRect *)(a1 + 40)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionX:", v2);

}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_6(uint64_t a1)
{
  CGFloat v2;
  id v3;

  v2 = CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionY:", v2);

}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_7(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ck_setScaleX:", 8.1);

}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_8(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ck_setScaleY:", 16.6);

}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_9(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundBlurRadiusLightMode:", 4.0);

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundBlurRadiusDarkMode:", 4.0);

}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_10(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "plusButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_11(uint64_t a1)
{
  double v2;
  double v3;
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
  void *v14;

  v2 = CGRectGetWidth(*(CGRect *)(a1 + 56)) * 0.5;
  if (v2 <= 40.0)
    v3 = v2;
  else
    v3 = 40.0;
  objc_msgSend(*(id *)(a1 + 40), "sendMenuPresentPopoverBackdropViewBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v3);

  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 48), "setUserInteractionEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "sendMenuPresentPopoverEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEffect:", v8);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMasksToBounds:", 1);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", v3);

  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClipsToBounds:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (id)animationForTransitioningToAppViewWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4
{
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v7;
  CGFloat v8;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  CKSendMenuPopoverAnimation *v25;
  CGFloat y;
  _QWORD v28[5];
  id v29;
  _QWORD v30[11];
  _QWORD v31[11];
  _QWORD v32[10];
  _QWORD v33[10];
  _QWORD v34[9];
  _QWORD v35[6];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v7 = a3.origin.y;
  v8 = a3.origin.x;
  v35[5] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36.origin.x = v8;
  v36.origin.y = v7;
  v36.size.width = width;
  v36.size.height = height;
  v11 = CGRectGetWidth(v36);
  -[CKSendMenuPresentationPopoverView sendMenuView](self, "sendMenuView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = v11 / CGRectGetWidth(v37);

  v38.origin.x = v8;
  v38.origin.y = v7;
  v38.size.width = width;
  v38.size.height = height;
  v14 = CGRectGetHeight(v38);
  -[CKSendMenuPresentationPopoverView sendMenuView](self, "sendMenuView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = v14 / CGRectGetHeight(v39);

  v17 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke;
  v34[3] = &unk_1E274B8B8;
  v34[4] = self;
  *(CGFloat *)&v34[5] = v8;
  *(CGFloat *)&v34[6] = v7;
  *(CGFloat *)&v34[7] = width;
  *(CGFloat *)&v34[8] = height;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v34);
  v18 = (void *)objc_msgSend(v10, "newSendMenuPresentAppInPopoverWidthAnimator");
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_2;
  v33[3] = &unk_1E2755EC8;
  *(CGFloat *)&v33[5] = v8;
  *(CGFloat *)&v33[6] = v7;
  *(CGFloat *)&v33[7] = width;
  *(CGFloat *)&v33[8] = height;
  v33[4] = self;
  *(double *)&v33[9] = v13;
  objc_msgSend(v18, "addAnimations:delayFactor:", v33, 0.0);
  v19 = (void *)objc_msgSend(v10, "newSendMenuPresentAppInPopoverHeightAnimator");
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_3;
  v32[3] = &unk_1E2755EC8;
  *(CGFloat *)&v32[5] = v8;
  *(CGFloat *)&v32[6] = v7;
  *(CGFloat *)&v32[7] = width;
  *(CGFloat *)&v32[8] = height;
  v32[4] = self;
  *(double *)&v32[9] = v16;
  objc_msgSend(v19, "addAnimations:", v32);
  v20 = (void *)objc_msgSend(v10, "newSendMenuPresentAppInPopoverCenterXAnimator");
  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_4;
  v31[3] = &unk_1E274BD00;
  v31[4] = self;
  *(CGFloat *)&v31[5] = x;
  *(CGFloat *)&v31[6] = y;
  *(CGFloat *)&v31[7] = v8;
  *(CGFloat *)&v31[8] = v7;
  *(CGFloat *)&v31[9] = width;
  *(CGFloat *)&v31[10] = height;
  objc_msgSend(v20, "addAnimations:delayFactor:", v31, 0.0);
  v21 = (void *)objc_msgSend(v10, "newSendMenuPresentAppInPopoverOpacityAnimator");
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_5;
  v30[3] = &unk_1E274BD00;
  *(CGFloat *)&v30[5] = v8;
  *(CGFloat *)&v30[6] = v7;
  *(CGFloat *)&v30[7] = width;
  *(CGFloat *)&v30[8] = height;
  v30[4] = self;
  *(CGFloat *)&v30[9] = x;
  *(CGFloat *)&v30[10] = y;
  objc_msgSend(v21, "addAnimations:", v30);
  v22 = (void *)objc_msgSend(v10, "newSendMenuPresentAppInPopoverOpacityAnimator");
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_6;
  v28[3] = &unk_1E274A108;
  v28[4] = self;
  v29 = v10;
  v23 = v10;
  objc_msgSend(v22, "addAnimations:", v28);
  v35[0] = v19;
  v35[1] = v18;
  v35[2] = v20;
  v35[3] = v21;
  v35[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[CKSendMenuPopoverAnimation initWithAnimators:]([CKSendMenuPopoverAnimation alloc], "initWithAnimators:", v24);

  return v25;
}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double Width;
  void *v17;
  double v18;
  double Height;
  void *v20;
  double v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "appView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBounds:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "sendMenuView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "appView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v9, v11);

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  Width = CGRectGetWidth(v24);
  objc_msgSend(*(id *)(a1 + 32), "appView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v18 = Width / CGRectGetWidth(v25);

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  Height = CGRectGetHeight(v26);
  objc_msgSend(*(id *)(a1 + 32), "appView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = Height / CGRectGetHeight(v27);

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ck_setScaleX:", v18);

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ck_setScaleY:", v21);

}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_2(uint64_t a1)
{
  double Width;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double Height;
  id v9;

  Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsWidth:");
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setBoundsWidth:", Width);

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_setScaleX:", 1.0);

  v5 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "sendMenuView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ck_setScaleX:", v5);

  v7 = CGRectGetWidth(*(CGRect *)(a1 + 40));
  Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v7, Height);

}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_3(uint64_t a1)
{
  double Height;
  double v3;
  void *v4;
  void *v5;
  id v6;

  Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsHeight:");
  v3 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "sendMenuView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_setScaleY:", v3);

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ck_setScaleY:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ck_setBoundsHeight:", Height);

}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_4(uint64_t a1)
{
  CGFloat v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionX:", *(double *)(a1 + 40));
  v2 = CGRectGetWidth(*(CGRect *)(a1 + 56)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "appView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionX:", v2);

  objc_msgSend(*(id *)(a1 + 32), "sendMenuView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_setPositionX:", v2);

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ck_setPositionX:", v2);

}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_5(uint64_t a1)
{
  CGFloat v2;
  void *v3;
  void *v4;
  id v5;

  v2 = CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionY:", *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_setPositionY:", v2);

  objc_msgSend(*(id *)(a1 + 32), "sendMenuView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_setPositionY:", v2);

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ck_setPositionY:", v2);

}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_6(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 40), "sendMenuPopoverPresentingAppCornerRadius");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v3);

  objc_msgSend(*(id *)(a1 + 40), "sendMenuPopoverPresentingAppCornerRadius");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v7);

  objc_msgSend(*(id *)(a1 + 32), "appView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "sendMenuView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 0.0);

}

- (id)animationForTransitioningToNewSize:(CGSize)a3 center:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v9;
  void *v10;
  void *v11;
  CKSendMenuPopoverAnimation *v12;
  _QWORD v14[9];
  _QWORD v15[2];

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  v15[1] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newSendMenuPresentAppInPopoverOpacityAnimator");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__CKSendMenuPresentationPopoverView_animationForTransitioningToNewSize_center___block_invoke;
  v14[3] = &unk_1E274B8B8;
  v14[4] = self;
  *(CGFloat *)&v14[5] = width;
  *(CGFloat *)&v14[6] = height;
  *(CGFloat *)&v14[7] = x;
  *(CGFloat *)&v14[8] = y;
  objc_msgSend(v10, "addAnimations:", v14);
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CKSendMenuPopoverAnimation initWithAnimators:]([CKSendMenuPopoverAnimation alloc], "initWithAnimators:", v11);

  return v12;
}

uint64_t __79__CKSendMenuPresentationPopoverView_animationForTransitioningToNewSize_center___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)prepareForPresentation
{
  UIView *sendMenuView;
  UIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _OWORD v25[3];
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGRect v30;

  sendMenuView = self->_sendMenuView;
  if (!sendMenuView)
    sendMenuView = self->_appView;
  v4 = sendMenuView;
  -[UIView bounds](v4, "bounds");
  v6 = v5;
  v8 = v7;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v9 = (void *)objc_opt_class();
  -[CKSendMenuPresentationPopoverView bounds](self, "bounds");
  if (v9)
  {
    objc_msgSend(v9, "affineTransformToDownScaleSize:toSize:", v10, v11, v6, v8);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
  }
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  -[UIView setTransform:](v4, "setTransform:", v26);
  -[CKSendMenuPresentationPopoverView bounds](self, "bounds");
  v13 = v12 * 0.5;
  -[CKSendMenuPresentationPopoverView bounds](self, "bounds");
  -[UIView setCenter:](v4, "setCenter:", v13, v14 * 0.5);

  -[CKSendMenuPresentationPopoverView bounds](self, "bounds");
  v15 = CGRectGetWidth(v30) * 0.5;
  -[CKSendMenuPresentationPopoverView backdropView](self, "backdropView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v15);

  -[CKSendMenuPresentationPopoverView plusButton](self, "plusButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v25[0] = *MEMORY[0x1E0C9BAA8];
  v25[1] = v19;
  v25[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v18, "setTransform:", v25);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entryViewPlusButtonDefaultBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendMenuPresentationPopoverView backdropView](self, "backdropView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  -[CKSendMenuPresentationPopoverView backdropView](self, "backdropView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", 0);

  -[CKSendMenuPresentationPopoverView backdropView](self, "backdropView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAlpha:", 1.0);

}

+ (CGAffineTransform)affineTransformToDownScaleSize:(SEL)a3 toSize:(CGSize)a4
{
  double v5;
  double v6;

  v5 = a4.width / a5.width;
  v6 = a4.height / a5.height;
  if (v5 >= v6)
    v5 = v6;
  return CGAffineTransformMakeScale(retstr, v5, v5);
}

- (UIView)sendMenuView
{
  return self->_sendMenuView;
}

- (UIVisualEffectView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_blurBackgroundView, a3);
}

- (CKSendMenuPresentationPopoverBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (CKSendMenuPopoverBlurContentsView)blurContentsView
{
  return self->_blurContentsView;
}

- (CKEntryViewPlusButton)plusButton
{
  return self->_plusButton;
}

- (void)setPlusButton:(id)a3
{
  objc_storeStrong((id *)&self->_plusButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_blurContentsView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_blurBackgroundView, 0);
  objc_storeStrong((id *)&self->_sendMenuView, 0);
  objc_storeStrong((id *)&self->_appView, 0);
}

@end
