@implementation PKPaletteView

+ (id)makeBackgroundView
{
  PKPaletteBackgroundViewFactory *v2;
  void *v3;

  v2 = objc_alloc_init(PKPaletteBackgroundViewFactory);
  -[PKPaletteBackgroundViewFactory makeBackgroundViewWithName:backgroundColor:]((uint64_t)v2, CFSTR("com.apple.pencilkit.pktoolpickerbackground"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_makeScaleFactorPolicy
{
  return objc_alloc_init(PKPaletteScaleFactorPolicy);
}

- (PKPaletteView)initWithFrame:(CGRect)a3
{
  PKPaletteView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  PKPaletteScaleFactorPolicy *paletteScaleFactorPolicy;
  double v16;
  __int128 v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKPaletteView;
  v3 = -[PKPaletteView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PKPaletteView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInheritsTiming:", 0);

    -[PKPaletteView traitCollection](v3, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "layoutDirection");
    v8 = 4;
    if (v7 == 1)
      v8 = 8;
    v3->_autoHideCorner = v8;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v3->_adjustedWindowSceneBounds.origin.x = v10;
    v3->_adjustedWindowSceneBounds.origin.y = v11;
    v3->_adjustedWindowSceneBounds.size.width = v12;
    v3->_adjustedWindowSceneBounds.size.height = v13;

    +[PKPaletteView _makeScaleFactorPolicy](PKPaletteView, "_makeScaleFactorPolicy");
    v14 = objc_claimAutoreleasedReturnValue();
    paletteScaleFactorPolicy = v3->_paletteScaleFactorPolicy;
    v3->_paletteScaleFactorPolicy = (PKPaletteScaleFactorPolicy *)v14;

    -[PKPaletteScaleFactorPolicy scaleFactorForWindowBounds:](v3->_paletteScaleFactorPolicy, "scaleFactorForWindowBounds:", v3->_adjustedWindowSceneBounds.origin.x, v3->_adjustedWindowSceneBounds.origin.y, v3->_adjustedWindowSceneBounds.size.width, v3->_adjustedWindowSceneBounds.size.height);
    v3->_paletteScaleFactor = v16;
    v3->_palettePosition = 0;
    v3->_shouldExpandFromCorner = 1;
    v3->_shadowOpacity = 0.0;
    v3->_shadowRadius = 0.0;
    v3->_shouldAdjustShadowRadiusForMinimized = 0;
    v3->_compactPaletteHeight = 0.0;
    v3->_ignoresSafeAreaInsetsInCompactSize = 0;
    v17 = *(_OWORD *)(MEMORY[0x1E0DC3298] + 16);
    *(_OWORD *)&v3->_edgeInsetsInCompactSize.top = *MEMORY[0x1E0DC3298];
    *(_OWORD *)&v3->_edgeInsetsInCompactSize.bottom = v17;
    v3->_draggingEnabled = !PKIsVisionDevice();
    -[PKPaletteView _installClippingViewInView:](v3, "_installClippingViewInView:", v3);
    -[PKPaletteView _installBackgroundViewInView:](v3, "_installBackgroundViewInView:", v3->_clippingView);
    -[PKPaletteView _installContainerViewInView:](v3, "_installContainerViewInView:", v3->_clippingView);
    -[PKPaletteView layer](v3, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShadowPathIsBounds:", 1);

    -[PKPaletteView _loadOptions](v3, "_loadOptions");
    _PKPaletteViewUpdateUI(v3, 0);
  }
  return v3;
}

- (void)setIgnoresSafeAreaInsetsInCompactSize:(BOOL)a3
{
  id v4;

  if (self->_ignoresSafeAreaInsetsInCompactSize != a3)
  {
    self->_ignoresSafeAreaInsetsInCompactSize = a3;
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewStateDidChange:", self);

  }
}

- (void)setEdgeInsetsInCompactSize:(NSDirectionalEdgeInsets)a3
{
  id v7;

  if (self->_edgeInsetsInCompactSize.leading != a3.leading
    || self->_edgeInsetsInCompactSize.top != a3.top
    || self->_edgeInsetsInCompactSize.trailing != a3.trailing
    || self->_edgeInsetsInCompactSize.bottom != a3.bottom)
  {
    self->_edgeInsetsInCompactSize = a3;
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paletteViewStateDidChange:", self);

  }
}

- (void)_installClippingViewInView:(id)a3
{
  objc_class *v4;
  id v5;
  UIView *v6;
  UIView *clippingView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3F10];
  v5 = a3;
  v6 = (UIView *)objc_alloc_init(v4);
  clippingView = self->_clippingView;
  self->_clippingView = v6;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_clippingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", self->_clippingView);
  v18 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_clippingView, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  -[UIView bottomAnchor](self->_clippingView, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  -[UIView leftAnchor](self->_clippingView, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  -[UIView rightAnchor](self->_clippingView, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

}

- (void)_installBackgroundViewInView:(id)a3
{
  UIView *v4;
  UIView *backgroundMaterialView;
  id v6;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "makeBackgroundView");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v6, "addSubview:", v4);
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v4;

}

- (void)_installContainerViewInView:(id)a3
{
  id v4;
  PKPaletteContainerView *v5;
  PKPaletteContainerView *containerView;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];

  v49[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(PKPaletteContainerView);
  containerView = self->_containerView;
  self->_containerView = v5;

  -[PKPaletteView containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteView containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v8);

  -[PKPaletteView paletteSizeForEdge:](self, "paletteSizeForEdge:", 4);
  v10 = v9;
  v12 = v11;
  -[PKPaletteView containerView](self, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setPaletteContainerWidthConstraint:](self, "setPaletteContainerWidthConstraint:", v15);

  -[PKPaletteView containerView](self, "containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setPaletteContainerHeightConstraint:](self, "setPaletteContainerHeightConstraint:", v18);

  -[PKPaletteView containerView](self, "containerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setPaletteContainerCenterXConstraint:](self, "setPaletteContainerCenterXConstraint:", v22);

  -[PKPaletteView containerView](self, "containerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setPaletteContainerCenterYConstraint:](self, "setPaletteContainerCenterYConstraint:", v26);

  -[PKPaletteView containerView](self, "containerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setPaletteContainerCompactTopConstraint:](self, "setPaletteContainerCompactTopConstraint:", v30);

  -[PKPaletteView containerView](self, "containerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setPaletteContainerCompactBottomConstraint:](self, "setPaletteContainerCompactBottomConstraint:", v34);

  -[PKPaletteView containerView](self, "containerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leftAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setPaletteContainerCompactLeftConstraint:](self, "setPaletteContainerCompactLeftConstraint:", v38);

  -[PKPaletteView containerView](self, "containerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setPaletteContainerCompactRightConstraint:](self, "setPaletteContainerCompactRightConstraint:", v42);

  v43 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteView paletteContainerCenterXConstraint](self, "paletteContainerCenterXConstraint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v44;
  -[PKPaletteView paletteContainerCenterYConstraint](self, "paletteContainerCenterYConstraint");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v45;
  -[PKPaletteView paletteContainerWidthConstraint](self, "paletteContainerWidthConstraint");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v46;
  -[PKPaletteView paletteContainerHeightConstraint](self, "paletteContainerHeightConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "activateConstraints:", v48);

}

- (void)_installToolPreviewInView:(id)a3
{
  id v4;
  PKPaletteToolPreview *v5;
  PKPaletteToolPreview *toolPreview;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(PKPaletteToolPreview);
  toolPreview = self->_toolPreview;
  self->_toolPreview = v5;

  -[PKPaletteView toolPreview](self, "toolPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteView toolPreview](self, "toolPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v8);

  -[PKPaletteView toolPreview](self, "toolPreview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setToolPreviewWidthConstraint:](self, "setToolPreviewWidthConstraint:", v12);

  -[PKPaletteView toolPreview](self, "toolPreview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setToolPreviewHeightConstraint:](self, "setToolPreviewHeightConstraint:", v16);

  v17 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteView toolPreviewWidthConstraint](self, "toolPreviewWidthConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v18;
  -[PKPaletteView toolPreviewHeightConstraint](self, "toolPreviewHeightConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v20);

  -[PKPaletteView toolPreview](self, "toolPreview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView containerView](self, "containerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setToolPreviewCenterXConstraint:](self, "setToolPreviewCenterXConstraint:", v25);

  -[PKPaletteView toolPreview](self, "toolPreview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView containerView](self, "containerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView setToolPreviewCenterYConstraint:](self, "setToolPreviewCenterYConstraint:", v30);

  v31 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteView toolPreviewCenterXConstraint](self, "toolPreviewCenterXConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v32;
  -[PKPaletteView toolPreviewCenterYConstraint](self, "toolPreviewCenterYConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v34);

  -[PKPaletteView _updateToolPreviewScalingAnimated:](self, "_updateToolPreviewScalingAnimated:", 0);
}

- (void)_uninstallToolPreview
{
  void *v3;
  PKPaletteToolPreview *toolPreview;

  -[PKPaletteView toolPreview](self, "toolPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  toolPreview = self->_toolPreview;
  self->_toolPreview = 0;

}

- (BOOL)isToolPreviewInstalled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKPaletteView toolPreview](self, "toolPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)wantsToolPreviewForTraitCollection:(id)a3
{
  return objc_msgSend(a3, "userInterfaceIdiom") != 0;
}

- (BOOL)useCompactSize
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaletteView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (void)setAutoHideEnabled:(BOOL)a3
{
  if (self->_autoHideEnabled != a3)
  {
    self->_autoHideEnabled = a3;
    -[PKPaletteView _didChangeAutoHideEnabled](self, "_didChangeAutoHideEnabled");
  }
}

- (void)_didChangeAutoHideEnabled
{
  void *v3;
  id v4;

  -[PKPaletteView internalDelegate](self, "internalDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteViewStateDidChangeAutoHide:", self);

  +[PKStatisticsManager sharedStatisticsManager]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordAutoMinimizeEnabledDidChange:type:]((uint64_t)v4, -[PKPaletteView isAutoHideEnabled](self, "isAutoHideEnabled"), -[PKPaletteView paletteViewType](self, "paletteViewType"));

}

- (BOOL)isVisible
{
  void *v2;
  char v3;

  -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaletteVisible");

  return v3;
}

- (double)paletteContentAlpha
{
  void *v2;
  double v3;
  double v4;

  -[PKPaletteView containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setPaletteContentAlpha:(double)a3
{
  void *v5;

  -[PKPaletteView containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[PKPaletteView _updateToolPreviewVisibility](self, "_updateToolPreviewVisibility");
}

- (id)borderColorForTraitCollection:(id)a3
{
  return 0;
}

- (double)borderWidthForTraitCollection:(id)a3
{
  return 0.0;
}

- (void)_updateToolPreviewVisibility
{
  void *v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[PKPaletteView containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (-[PKPaletteView _isPaletteContentViewHidden](self, "_isPaletteContentViewHidden"))
  {
    v6 = v5 * -1.6 + 1.0;
  }
  else
  {
    v7 = -[PKPaletteView toolPreviewMatchesExpandedTool](self, "toolPreviewMatchesExpandedTool");
    v6 = v5 * -2.0 + 1.0;
    if (v7)
      v6 = v5 * -5.0 + 4.5;
  }
  v8 = fmin(v6, 1.0);
  if (v8 >= 0.0)
    v9 = v8;
  else
    v9 = 0.0;
  -[PKPaletteView toolPreview](self, "toolPreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

  -[PKPaletteView toolPreview](self, "toolPreview");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v5 >= 1.0);

}

- (BOOL)_isPaletteContentViewHidden
{
  return 0;
}

- (void)_setCornerRadius:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteView;
  -[PKPaletteView _setCornerRadius:](&v6, sel__setCornerRadius_);
  -[PKPaletteView clippingView](self, "clippingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setCornerRadius:", a3);

}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteView;
  -[PKPaletteView _setContinuousCornerRadius:](&v6, sel__setContinuousCornerRadius_);
  -[PKPaletteView clippingView](self, "clippingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContinuousCornerRadius:", a3);

}

- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  return 0.0;
}

- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  return 0.0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double x;
  double y;
  double width;
  double height;
  void *v16;
  double v17;
  PKPaletteView *v18;
  double MidX;
  double MidY;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v24.receiver = self;
  v24.super_class = (Class)PKPaletteView;
  -[PKPaletteView layoutSubviews](&v24, sel_layoutSubviews);
  -[PKPaletteView clippingView](self, "clippingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v26 = CGRectInset(v25, -6.0, -6.0);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  -[PKPaletteView backgroundMaterialView](self, "backgroundMaterialView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", x, y, width, height);

  if (-[PKPaletteView useCompactSize](self, "useCompactSize"))
  {
    v17 = 0.0;
    v18 = self;
LABEL_6:
    -[PKPaletteView _setCornerRadius:](v18, "_setCornerRadius:", v17);
    return;
  }
  -[PKPaletteView bounds](self, "bounds");
  MidX = CGRectGetMidX(v27);
  -[PKPaletteView bounds](self, "bounds");
  MidY = CGRectGetMidY(v28);
  if (MidX >= MidY)
    MidX = MidY;
  -[PKPaletteView bounds](self, "bounds");
  v22 = v21;
  -[PKPaletteView bounds](self, "bounds");
  v18 = self;
  v17 = MidX;
  if (v22 == v23)
    goto LABEL_6;
  -[PKPaletteView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", MidX);
}

- (void)_updateContainerSizeConstraints
{
  unint64_t v3;

  v3 = -[PKPaletteView palettePosition](self, "palettePosition") - 1;
  if (v3 <= 3)
    -[PKPaletteView _updateContainerSizeConstraintsForEdge:](self, "_updateContainerSizeConstraintsForEdge:", qword_1BE4FC318[v3]);
}

- (void)_updateContainerSizeConstraintsForEdge:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  -[PKPaletteView paletteSizeForEdge:](self, "paletteSizeForEdge:");
  v6 = v5;
  v8 = v7;
  -[PKPaletteView paletteContainerWidthConstraint](self, "paletteContainerWidthConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", v6);

  -[PKPaletteView paletteContainerHeightConstraint](self, "paletteContainerHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v8);

  if (-[PKPaletteView isToolPreviewInstalled](self, "isToolPreviewInstalled"))
  {
    v11 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteView toolPreviewWidthConstraint](self, "toolPreviewWidthConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v12;
    -[PKPaletteView toolPreviewHeightConstraint](self, "toolPreviewHeightConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deactivateConstraints:", v14);

    switch(a3)
    {
      case 1uLL:
      case 4uLL:
        -[PKPaletteView toolPreview](self, "toolPreview");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "widthAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteView heightAnchor](self, "heightAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToAnchor:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteView setToolPreviewWidthConstraint:](self, "setToolPreviewWidthConstraint:", v18);

        -[PKPaletteView toolPreview](self, "toolPreview");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "heightAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteView heightAnchor](self, "heightAnchor");
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      case 2uLL:
      case 8uLL:
        -[PKPaletteView toolPreview](self, "toolPreview");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "widthAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteView widthAnchor](self, "widthAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteView setToolPreviewWidthConstraint:](self, "setToolPreviewWidthConstraint:", v25);

        -[PKPaletteView toolPreview](self, "toolPreview");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "heightAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteView widthAnchor](self, "widthAnchor");
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_5:
        v26 = (void *)v21;
        objc_msgSend(v20, "constraintEqualToAnchor:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteView setToolPreviewHeightConstraint:](self, "setToolPreviewHeightConstraint:", v27);

        break;
      default:
        break;
    }
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteView toolPreviewWidthConstraint](self, "toolPreviewWidthConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v29;
    -[PKPaletteView toolPreviewHeightConstraint](self, "toolPreviewHeightConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v31);

  }
}

- (void)hostView:(id)a3 willDockPaletteToPosition:(int64_t)a4 prepareForExpansion:(BOOL)a5
{
  _BOOL8 v5;
  int v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  _BOOL4 v13;

  v5 = a5;
  -[PKPaletteView _updateContainerViewConstraints](self, "_updateContainerViewConstraints", a3);
  v8 = 0;
  v9 = 1;
  v10 = a4;
  switch(a4)
  {
    case 1:
      goto LABEL_5;
    case 2:
      v8 = 1;
      v10 = 8;
      goto LABEL_5;
    case 3:
      v8 = 0;
      v10 = 4;
      goto LABEL_5;
    case 4:
      v8 = 1;
      v10 = 2;
LABEL_5:
      v11 = -[PKPaletteView lastPaletteEdgePositionWhileDragging](self, "lastPaletteEdgePositionWhileDragging", 1);
      v13 = v11 == 2 || v11 == 8;
      -[PKPaletteView _willDockPaletteToEdge:prepareForExpansion:isPaletteChangingOrientation:](self, "_willDockPaletteToEdge:prepareForExpansion:isPaletteChangingOrientation:", v10, v5, v8 ^ v13);
      break;
    case 5:
      goto LABEL_15;
    case 6:
      v9 = 2;
      goto LABEL_15;
    case 7:
      v9 = 8;
      goto LABEL_15;
    case 8:
      v9 = 4;
LABEL_15:
      -[PKPaletteView _willDockPaletteToCorner:](self, "_willDockPaletteToCorner:", v9);
      break;
    default:
      break;
  }
  -[PKPaletteView setPalettePosition:](self, "setPalettePosition:", a4);
}

- (void)_willDockPaletteToEdge:(unint64_t)a3 prepareForExpansion:(BOOL)a4 isPaletteChangingOrientation:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;

  v5 = a4;
  self->_lastPaletteEdgePositionWhileDragging = a3;
  -[PKPaletteView toolPreview](self, "toolPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissPalettePopoverWithCompletion:", 0);

  -[PKPaletteView containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEdgeLocation:", a3);

  -[PKPaletteView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = PKUseCompactSize(v10, v12);

  if (!v13)
    -[PKPaletteView _updateContainerSizeConstraintsForEdge:](self, "_updateContainerSizeConstraintsForEdge:", a3);
  if (v5)
  {
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notifyLanguageDidChange");

  }
}

- (void)hostView:(id)a3 didDockPaletteToPosition:(int64_t)a4
{
  -[PKPaletteView setPalettePosition:](self, "setPalettePosition:", a4);
  if ((unint64_t)(a4 - 1) <= 3)
    self->_lastPaletteEdgePositionWhileDragging = qword_1BE4FC318[a4 - 1];
}

- (void)_updateContainerViewConstraints
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[9];

  v25[8] = *MEMORY[0x1E0C80C00];
  v22 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteView paletteContainerWidthConstraint](self, "paletteContainerWidthConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  -[PKPaletteView paletteContainerHeightConstraint](self, "paletteContainerHeightConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v4;
  -[PKPaletteView paletteContainerCenterXConstraint](self, "paletteContainerCenterXConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v5;
  -[PKPaletteView paletteContainerCenterYConstraint](self, "paletteContainerCenterYConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v6;
  -[PKPaletteView paletteContainerCompactTopConstraint](self, "paletteContainerCompactTopConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v7;
  -[PKPaletteView paletteContainerCompactBottomConstraint](self, "paletteContainerCompactBottomConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v8;
  -[PKPaletteView paletteContainerCompactLeftConstraint](self, "paletteContainerCompactLeftConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v9;
  -[PKPaletteView paletteContainerCompactRightConstraint](self, "paletteContainerCompactRightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "deactivateConstraints:", v11);

  -[PKPaletteView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteView window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "windowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = PKUseCompactSize(v12, v14);

  v15 = (void *)MEMORY[0x1E0CB3718];
  if ((_DWORD)v6)
  {
    -[PKPaletteView paletteContainerCompactTopConstraint](self, "paletteContainerCompactTopConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    -[PKPaletteView paletteContainerCompactBottomConstraint](self, "paletteContainerCompactBottomConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    -[PKPaletteView paletteContainerCompactLeftConstraint](self, "paletteContainerCompactLeftConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v18;
    -[PKPaletteView paletteContainerCompactRightConstraint](self, "paletteContainerCompactRightConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v19;
    v20 = v24;
  }
  else
  {
    -[PKPaletteView paletteContainerWidthConstraint](self, "paletteContainerWidthConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    -[PKPaletteView paletteContainerHeightConstraint](self, "paletteContainerHeightConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v17;
    -[PKPaletteView paletteContainerCenterXConstraint](self, "paletteContainerCenterXConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v18;
    -[PKPaletteView paletteContainerCenterYConstraint](self, "paletteContainerCenterYConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v19;
    v20 = v23;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v21);

}

- (void)paletteHostingWindowSceneDidChangeBounds:(id)a3
{
  objc_msgSend(a3, "paletteHostingWindowSceneBounds");
  -[PKPaletteView setAdjustedWindowSceneBounds:](self, "setAdjustedWindowSceneBounds:");
}

- (void)setAdjustedWindowSceneBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_adjustedWindowSceneBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_adjustedWindowSceneBounds = &self->_adjustedWindowSceneBounds;
  if (!CGRectEqualToRect(self->_adjustedWindowSceneBounds, a3))
  {
    p_adjustedWindowSceneBounds->origin.x = x;
    p_adjustedWindowSceneBounds->origin.y = y;
    p_adjustedWindowSceneBounds->size.width = width;
    p_adjustedWindowSceneBounds->size.height = height;
    _PKPaletteViewUpdateUI(self, 1);
    -[PKPaletteView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
  }
}

- (void)setPaletteScaleFactor:(double)a3
{
  -[PKPaletteView _setPaletteScaleFactor:notifyDidChange:](self, "_setPaletteScaleFactor:notifyDidChange:", 1, a3);
}

- (void)_setPaletteScaleFactor:(double)a3 notifyDidChange:(BOOL)a4
{
  double paletteScaleFactor;

  paletteScaleFactor = self->_paletteScaleFactor;
  if (paletteScaleFactor != a3 && vabdd_f64(paletteScaleFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_paletteScaleFactor = a3;
    if (a4)
      -[PKPaletteView didChangePaletteScaleFactor](self, "didChangePaletteScaleFactor");
  }
}

- (void)didChangePaletteScaleFactor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[PKPaletteView _updateContainerSizeConstraints](self, "_updateContainerSizeConstraints");
  -[PKPaletteView internalDelegate](self, "internalDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteViewStateDidChangeScaleFactor:", self);

  -[PKPaletteView _updateToolPreviewScalingAnimated:](self, "_updateToolPreviewScalingAnimated:", 0);
  -[PKPaletteView delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PKPaletteView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PKPaletteView delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "paletteViewDidChangeScaleFactor:", self);

    }
  }
}

- (unint64_t)paletteViewType
{
  return 0;
}

- (void)setPalettePosition:(int64_t)a3
{
  unint64_t v5;
  int64_t palettePosition;
  unint64_t v7;

  if (self->_palettePosition != a3)
  {
    v5 = -[PKPaletteView palettePosition](self, "palettePosition") - 1;
    if (v5 <= 3)
      -[PKPaletteView setLastEdgeLocation:](self, "setLastEdgeLocation:", qword_1BE4FC318[v5]);
    palettePosition = self->_palettePosition;
    self->_palettePosition = a3;
    -[PKPaletteView didChangePalettePositionFromPosition:toPosition:](self, "didChangePalettePositionFromPosition:toPosition:", palettePosition, a3);
    v7 = -[PKPaletteView _nextAutoHideCorner](self, "_nextAutoHideCorner");
    if (v7 != -1)
      self->_autoHideCorner = v7;
    -[PKPaletteView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)didChangePalettePositionFromPosition:(int64_t)a3 toPosition:(int64_t)a4
{
  void *v7;
  char v8;
  id v9;

  -[PKPaletteView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paletteViewDidChangePosition:fromPosition:toPosition:", self, a3, a4);

  }
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[PKPaletteView isPalettePresentingPopover](self, "isPalettePresentingPopover"))
  {
    -[PKPaletteView toolPreview](self, "toolPreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PKPaletteView toolPreview](self, "toolPreview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dismissPalettePopoverWithCompletion:", v7);

LABEL_6:
      v6 = v7;
      goto LABEL_7;
    }
  }
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    goto LABEL_6;
  }
LABEL_7:

}

- (unint64_t)_nextAutoHideCorner
{
  int64_t v3;
  unint64_t result;
  unint64_t v5;
  unint64_t v7;

  v3 = -[PKPaletteView palettePosition](self, "palettePosition") - 1;
  result = 1;
  switch(v3)
  {
    case 0:
      v5 = -[PKPaletteView autoHideCorner](self, "autoHideCorner");
      if (v5 == 8 || v5 == 2)
        result = 2;
      else
        result = 1;
      break;
    case 1:
      if (-[PKPaletteView autoHideCorner](self, "autoHideCorner") - 1 >= 2)
        result = 8;
      else
        result = 2;
      break;
    case 2:
      v7 = -[PKPaletteView autoHideCorner](self, "autoHideCorner");
      if (v7 == 8 || v7 == 2)
        result = 8;
      else
        result = 4;
      break;
    case 3:
      if (-[PKPaletteView autoHideCorner](self, "autoHideCorner") - 1 < 2)
        result = 1;
      else
        result = 4;
      break;
    case 4:
      return result;
    case 5:
      result = 2;
      break;
    case 6:
      result = 8;
      break;
    case 7:
      result = 4;
      break;
    default:
      result = -1;
      break;
  }
  return result;
}

- (BOOL)isPalettePresentingPopover
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;

  -[PKPaletteView palettePopoverPresentingController](self, "palettePopoverPresentingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.PaperKit"));

  if (v4 == v5)
    v8 = 1;
  else
    v8 = v7;
  if (v3 && (v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v3, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.PaperKit"));

    if (v12 == v13)
      v16 = 1;
    else
      v16 = v15;
    if (v12)
      v9 = v16;
    else
      v9 = 0;

  }
  return v9;
}

- (BOOL)shouldPalettePresentPopover
{
  void *v2;
  char v3;

  -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaletteDragging") ^ 1;

  return v3;
}

- (id)palettePopoverPassthroughViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)palettePopoverPermittedArrowDirections
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  -[PKPaletteView _paletteViewHoverView](self, "_paletteViewHoverView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaletteView wantsCustomPalettePopoverPresentationSource](self, "wantsCustomPalettePopoverPresentationSource")
    && v3)
  {
    v4 = 0;
  }
  else if (-[PKPaletteView wantsCustomPalettePopoverPresentationSource](self, "wantsCustomPalettePopoverPresentationSource")&& (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "bundleIdentifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilenotes")), v6, v5, v7))
  {
    if (-[PKPaletteView useCompactSize](self, "useCompactSize"))
      v4 = 15;
    else
      v4 = 1;
  }
  else if (-[PKPaletteView useCompactSize](self, "useCompactSize"))
  {
    v4 = 2;
  }
  else
  {
    v8 = -[PKPaletteView palettePosition](self, "palettePosition") - 1;
    if (v8 > 3)
      v9 = 0;
    else
      v9 = qword_1BE4FC318[v8];
    v4 = PKUIPopoverPermittedArrowDirectionsForEdge(v9);
  }

  return v4;
}

- (void)setPalettePopoverLayoutSceneMargins:(UIEdgeInsets)a3
{
  if (self->_palettePopoverLayoutSceneMargins.left != a3.left
    || self->_palettePopoverLayoutSceneMargins.top != a3.top
    || self->_palettePopoverLayoutSceneMargins.right != a3.right
    || self->_palettePopoverLayoutSceneMargins.bottom != a3.bottom)
  {
    self->_palettePopoverLayoutSceneMargins = a3;
    -[PKPaletteView updatePopoverUI](self, "updatePopoverUI");
  }
}

- (BOOL)_isCompactInSmallestQuickNoteWindowScene
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PKPaletteView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKIsSmallestQuickNoteWindowScene(v4) && -[PKPaletteView useCompactSize](self, "useCompactSize");

  return v5;
}

- (id)_paletteViewHoverView
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  uint64_t v10;

  -[PKPaletteView hoverDelegate](self, "hoverDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPaletteView hoverDelegate](self, "hoverDelegate");
    v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewHoverView:", self);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[PKPaletteView _shouldTrackHoverLocationForPencilTapActions](self, "_shouldTrackHoverLocationForPencilTapActions"))
    {
      v6 = 0;
      return v6;
    }
    -[PKPaletteView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v9);
    v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (!v4 || (v10 = v4[8]) == 0 || !*(_BYTE *)(v10 + 56))
    {
      v6 = 0;
      goto LABEL_4;
    }
    objc_msgSend(v4, "view");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_4:

  return v6;
}

- (CGPoint)_paletteViewHoverLocation
{
  void *v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  CGPoint result;

  -[PKPaletteView hoverDelegate](self, "hoverDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPaletteView hoverDelegate](self, "hoverDelegate");
    v4 = (double *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewHoverLocation:", self);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[PKPaletteView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v10);
    v4 = (double *)objc_claimAutoreleasedReturnValue();

    if (v4 && (v11 = *((_QWORD *)v4 + 8)) != 0 && *(_BYTE *)(v11 + 56))
    {
      v6 = v4[15];
      v8 = v4[16];
    }
    else
    {
      v6 = *MEMORY[0x1E0C9D538];
      v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
  }

  v12 = v6;
  v13 = v8;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)wantsCustomPalettePopoverPresentationSource
{
  void *v3;
  int v4;
  void *v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  if (-[PKPaletteView _isCompactInSmallestQuickNoteWindowScene](self, "_isCompactInSmallestQuickNoteWindowScene"))
  {
    -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPaletteVisible") ^ 1;
  }
  else
  {
    -[PKPaletteView _paletteViewHoverView](self, "_paletteViewHoverView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isPaletteVisible") & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

      if ((v9 & 1) != 0)
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v4) = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.freeform"));

      }
    }
  }

  return v4;
}

- (CGRect)palettePopoverSourceRectToPresentViewController:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double MidX;
  double MidY;
  double MaxX;
  double MaxY;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect result;

  v4 = a3;
  if (v4 && -[PKPaletteView _isCompactInSmallestQuickNoteWindowScene](self, "_isCompactInSmallestQuickNoteWindowScene"))
  {
    -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isPaletteVisible"))
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[PKPaletteView _palettePopoverSourceRect](self, "_palettePopoverSourceRect");
        x = v38.origin.x;
        y = v38.origin.y;
        width = v38.size.width;
        height = v38.size.height;
        if (!CGRectIsNull(v38))
          goto LABEL_26;
      }
    }
  }
  -[PKPaletteView _paletteViewHoverView](self, "_paletteViewHoverView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PKPaletteView _paletteViewHoverLocation](self, "_paletteViewHoverLocation");
    v13 = v12;
    v15 = v14;
    -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hostingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    x = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v17, v13, v15, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    y = v18;

    height = 0.0;
LABEL_9:
    width = 0.0;
  }
  else
  {
    -[PKPaletteView _palettePopoverSourceRect](self, "_palettePopoverSourceRect");
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    if (CGRectIsNull(v39))
    {
      v19 = -[PKPaletteView palettePosition](self, "palettePosition");
      -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hostingView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "safeAreaLayoutGuide");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "layoutFrame");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      y = v29;

      height = 0.0;
      switch(v19)
      {
        case 0:
        case 5:
        case 9:
          x = *MEMORY[0x1E0C9D538];
          y = *(double *)(MEMORY[0x1E0C9D538] + 8);
          goto LABEL_9;
        case 1:
          v40.origin.x = v24;
          v40.origin.y = v26;
          v40.size.width = v28;
          v40.size.height = y;
          MidX = CGRectGetMidX(v40);
          goto LABEL_19;
        case 2:
          v41.origin.x = v24;
          v41.origin.y = v26;
          v41.size.width = v28;
          v41.size.height = y;
          x = CGRectGetMaxX(v41);
          v42.origin.x = v24;
          v42.origin.y = v26;
          v42.size.width = v28;
          v42.size.height = y;
          MidY = CGRectGetMidY(v42);
          goto LABEL_22;
        case 3:
          v43.origin.x = v24;
          v43.origin.y = v26;
          v43.size.width = v28;
          v43.size.height = y;
          MaxX = CGRectGetMidX(v43);
          goto LABEL_21;
        case 4:
          v44.origin.x = v24;
          v44.origin.y = v26;
          v44.size.width = v28;
          v44.size.height = y;
          MaxY = CGRectGetMidY(v44);
          goto LABEL_24;
        case 6:
          v45.origin.x = v24;
          v45.origin.y = v26;
          v45.size.width = v28;
          v45.size.height = y;
          MidX = CGRectGetMaxX(v45);
LABEL_19:
          x = MidX;
          width = 0.0;
          y = 0.0;
          break;
        case 7:
          v46.origin.x = v24;
          v46.origin.y = v26;
          v46.size.width = v28;
          v46.size.height = y;
          MaxX = CGRectGetMaxX(v46);
LABEL_21:
          x = MaxX;
          v47.origin.x = v24;
          v47.origin.y = v26;
          v47.size.width = v28;
          v47.size.height = y;
          MidY = CGRectGetMaxY(v47);
LABEL_22:
          y = MidY;
          goto LABEL_9;
        case 8:
          v48.origin.x = v24;
          v48.origin.y = v26;
          v48.size.width = v28;
          v48.size.height = y;
          MaxY = CGRectGetMaxY(v48);
LABEL_24:
          y = MaxY;
          width = 0.0;
          x = 0.0;
          break;
        default:
          width = 0.0;
          break;
      }
    }
  }

LABEL_26:
  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)_palettePopoverSourceRect
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  -[PKPaletteView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  -[PKPaletteView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
LABEL_5:
    v18 = *MEMORY[0x1E0C9D628];
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_6;
  }
  -[PKPaletteView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paletteViewColorPickerPopoverPresentationSourceView:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paletteViewColorPickerPopoverPresentationSourceRect:", self);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[PKPaletteView palettePopoverSourceView](self, "palettePopoverSourceView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v7, v17, v10, v12, v14, v16);
  v20 = v19;
  v22 = v21;
  v24 = v23;

LABEL_6:
  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)palettePopoverSourceView
{
  void *v2;
  void *v3;

  -[PKPaletteView paletteViewHosting](self, "paletteViewHosting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updatePalettePopover:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v4 = a3;
  if (v4)
  {
    v27 = v4;
    -[PKPaletteView palettePopoverLayoutMargins](self, "palettePopoverLayoutMargins");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v27, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPopoverLayoutMargins:", v6, v8, v10, v12);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

    if ((v16 & 1) != 0 || _UIApplicationIsExtension())
    {
      -[PKPaletteView palettePopoverSourceView](self, "palettePopoverSourceView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "userInterfaceStyle");

      objc_msgSend(v27, "popoverPresentationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentedView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setOverrideUserInterfaceStyle:", v19);

      objc_msgSend(v27, "setOverrideUserInterfaceStyle:", v19);
    }
    objc_msgSend(v27, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userInterfaceStyle");
    -[PKPaletteView traitCollection](self, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceStyle");

    v4 = v27;
    if (v23 != v25)
    {
      -[PKPaletteView traitCollection](self, "traitCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setOverrideUserInterfaceStyle:", objc_msgSend(v26, "userInterfaceStyle"));

      v4 = v27;
    }
  }

}

- (void)setToolPreviewMinimized:(BOOL)a3
{
  -[PKPaletteView setToolPreviewMinimized:animated:](self, "setToolPreviewMinimized:animated:", a3, 0);
}

- (void)setToolPreviewMinimized:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_toolPreviewMinimized != a3)
  {
    self->_toolPreviewMinimized = a3;
    -[PKPaletteView _updateToolPreviewScalingAnimated:](self, "_updateToolPreviewScalingAnimated:", a4);
  }
}

- (void)_updateToolPreviewScalingAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  _QWORD v12[6];

  v3 = a3;
  -[PKPaletteView paletteScaleFactor](self, "paletteScaleFactor");
  v6 = v5;
  if (-[PKPaletteView isToolPreviewMinimized](self, "isToolPreviewMinimized"))
    v6 = v6 * 0.8;
  -[PKPaletteView toolPreview](self, "toolPreview");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scalingFactor");
  if (v6 == v7)
    goto LABEL_4;
  v8 = fabs(v7 * 0.000000999999997);
  v9 = vabdd_f64(v6, v7);

  if (v9 >= v8)
  {
    -[PKPaletteView toolPreview](self, "toolPreview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v3)
    {
      objc_msgSend(v10, "setScalingFactor:", v6);
LABEL_4:

      return;
    }
    objc_msgSend(v10, "layoutIfNeeded");

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__PKPaletteView__updateToolPreviewScalingAnimated___block_invoke;
    v12[3] = &unk_1E7778048;
    v12[4] = self;
    *(double *)&v12[5] = v6;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v12, 0, 0.845, 0.531, 0.0, 0.0, 0.0, 0.0);
  }
}

void __51__PKPaletteView__updateToolPreviewScalingAnimated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "toolPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScalingFactor:", v2);

  objc_msgSend(*(id *)(a1 + 32), "toolPreview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (BOOL)toolPreviewMatchesExpandedTool
{
  return 1;
}

- (void)willStartAppearanceAnimation:(BOOL)a3
{
  id v3;

  if (a3)
  {
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notifyLanguageDidChange");

  }
}

- (CGSize)minimizedPaletteSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PKPaletteView paletteScaleFactor](self, "paletteScaleFactor");
  v4 = v3 * 80.0;
  -[PKPaletteView paletteScaleFactor](self, "paletteScaleFactor");
  v6 = v5 * 80.0;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)paletteSizeForEdge:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteView;
  -[PKPaletteView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "horizontalSizeClass");
  -[PKPaletteView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != objc_msgSend(v6, "horizontalSizeClass"))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v4, "verticalSizeClass");
  -[PKPaletteView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verticalSizeClass");

  if (v7 != v9)
LABEL_5:
    -[PKPaletteView _updateContainerViewConstraints](self, "_updateContainerViewConstraints");
  _PKPaletteViewUpdateUI(self, 1);
  -[PKPaletteView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[PKPaletteView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paletteView:didChangeTraitCollection:", self, v4);

  }
}

- (unint64_t)edgeLocationToDockFromCorner:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  unint64_t v11;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;

  v4 = a3 - 1;
  if (a3 - 1 > 7)
    v5 = 0;
  else
    v5 = (void *)qword_1E7778BB0[v4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    return -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation");
  switch(v4)
  {
    case 0uLL:
      v8 = -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation");
      if (v8 == 8 || v8 == 2)
        return 2;
      else
        return 1;
    case 1uLL:
      v11 = -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation");
      if (v11 == 8 || v11 == 2)
        return 8;
      else
        return 1;
    case 3uLL:
      v13 = -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation");
      v14 = v13 == 8 || v13 == 2;
      v15 = 2;
      goto LABEL_27;
    case 7uLL:
      v16 = -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation");
      v14 = v16 == 8 || v16 == 2;
      v15 = 8;
LABEL_27:
      if (v14)
        result = v15;
      else
        result = 4;
      break;
    default:
      return -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation");
  }
  return result;
}

- (BOOL)_loadOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("PKPaletteDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKPalettePosition"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKPaletteLastEdge"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKPaletteAutoHideEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKPaletteAutoHideCorner"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((int)objc_msgSend(v5, "intValue") < 1 || (int)objc_msgSend(v5, "intValue") >= 9)
        {

          v5 = &unk_1E77EB9E8;
        }
        if (!v6
          || objc_msgSend(v6, "unsignedIntegerValue") != 1
          && objc_msgSend(v6, "unsignedIntegerValue") != 4
          && objc_msgSend(v6, "unsignedIntegerValue") != 2
          && objc_msgSend(v6, "unsignedIntegerValue") != 8)
        {

          v6 = &unk_1E77EBA00;
        }
        self->_palettePosition = (int)objc_msgSend(v5, "intValue");
        self->_lastEdgeLocation = objc_msgSend(v6, "unsignedIntegerValue");
        if (v7)
          self->_autoHideEnabled = objc_msgSend(v7, "BOOLValue");
        if (v8)
          self->_autoHideCorner = objc_msgSend(v8, "unsignedIntegerValue");
      }
    }

  }
  return 1;
}

- (void)_saveOptions
{
  void *v3;
  id v4;

  -[PKPaletteView _stateDictionary](self, "_stateDictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PKPaletteDefaults"));
  objc_storeWeak(&PKLastSavedPalette, self);

}

- (void)saveOptionsIfNecessary
{
  PKPaletteView *WeakRetained;

  WeakRetained = (PKPaletteView *)objc_loadWeakRetained(&PKLastSavedPalette);

  if (WeakRetained != self)
    -[PKPaletteView _saveOptions](self, "_saveOptions");
}

- (id)_stateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKPaletteView palettePosition](self, "palettePosition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PKPalettePosition"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPaletteView lastEdgeLocation](self, "lastEdgeLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("PKPaletteLastEdge"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPaletteView autoHideCorner](self, "autoHideCorner"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("PKPaletteAutoHideCorner"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPaletteView isAutoHideEnabled](self, "isAutoHideEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("PKPaletteAutoHideEnabled"));

  return v3;
}

- (UIViewController)palettePopoverPresentingController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_palettePopoverPresentingController);
}

- (void)setPalettePopoverPresentingController:(id)a3
{
  objc_storeWeak((id *)&self->_palettePopoverPresentingController, a3);
}

- (PKPaletteViewDelegate)delegate
{
  return (PKPaletteViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)palettePosition
{
  return self->_palettePosition;
}

- (double)paletteScaleFactor
{
  return self->_paletteScaleFactor;
}

- (UIViewController)presentationController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentationController);
}

- (void)setPresentationController:(id)a3
{
  objc_storeWeak((id *)&self->_presentationController, a3);
}

- (UIView)backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (UIEdgeInsets)palettePopoverLayoutSceneMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_palettePopoverLayoutSceneMargins.top;
  left = self->_palettePopoverLayoutSceneMargins.left;
  bottom = self->_palettePopoverLayoutSceneMargins.bottom;
  right = self->_palettePopoverLayoutSceneMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)compactPaletteHeight
{
  return self->_compactPaletteHeight;
}

- (CGRect)adjustedWindowSceneBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_adjustedWindowSceneBounds.origin.x;
  y = self->_adjustedWindowSceneBounds.origin.y;
  width = self->_adjustedWindowSceneBounds.size.width;
  height = self->_adjustedWindowSceneBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PKPaletteScaleFactorPolicy)paletteScaleFactorPolicy
{
  return self->_paletteScaleFactorPolicy;
}

- (BOOL)isAutoHideEnabled
{
  return self->_autoHideEnabled;
}

- (BOOL)shouldStartUpMinimized
{
  return self->_shouldStartUpMinimized;
}

- (BOOL)shouldExpandFromCorner
{
  return self->_shouldExpandFromCorner;
}

- (BOOL)shadowVisible
{
  return self->_shadowVisible;
}

- (void)setShadowVisible:(BOOL)a3
{
  self->_shadowVisible = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (BOOL)shouldAdjustShadowRadiusForMinimized
{
  return self->_shouldAdjustShadowRadiusForMinimized;
}

- (BOOL)ignoresSafeAreaInsetsInCompactSize
{
  return self->_ignoresSafeAreaInsetsInCompactSize;
}

- (NSDirectionalEdgeInsets)edgeInsetsInCompactSize
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_edgeInsetsInCompactSize.top;
  leading = self->_edgeInsetsInCompactSize.leading;
  bottom = self->_edgeInsetsInCompactSize.bottom;
  trailing = self->_edgeInsetsInCompactSize.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (UIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (BOOL)draggingEnabled
{
  return self->_draggingEnabled;
}

- (void)setDraggingEnabled:(BOOL)a3
{
  self->_draggingEnabled = a3;
}

- (unint64_t)lastEdgeLocation
{
  return self->_lastEdgeLocation;
}

- (void)setLastEdgeLocation:(unint64_t)a3
{
  self->_lastEdgeLocation = a3;
}

- (PKPaletteViewHosting)paletteViewHosting
{
  return (PKPaletteViewHosting *)objc_loadWeakRetained((id *)&self->_paletteViewHosting);
}

- (void)setPaletteViewHosting:(id)a3
{
  objc_storeWeak((id *)&self->_paletteViewHosting, a3);
}

- (PKPaletteViewInternalDelegate)internalDelegate
{
  return (PKPaletteViewInternalDelegate *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
}

- (PKPaletteViewHoverDelegate)hoverDelegate
{
  return (PKPaletteViewHoverDelegate *)objc_loadWeakRetained((id *)&self->_hoverDelegate);
}

- (void)setHoverDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hoverDelegate, a3);
}

- (BOOL)_shouldTrackHoverLocationForPencilTapActions
{
  return self->__shouldTrackHoverLocationForPencilTapActions;
}

- (void)_setShouldTrackHoverLocationForPencilTapActions:(BOOL)a3
{
  self->__shouldTrackHoverLocationForPencilTapActions = a3;
}

- (unint64_t)autoHideCorner
{
  return self->_autoHideCorner;
}

- (void)setAutoHideCorner:(unint64_t)a3
{
  self->_autoHideCorner = a3;
}

- (BOOL)isToolPreviewMinimized
{
  return self->_toolPreviewMinimized;
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (PKPaletteContainerView)containerView
{
  return self->_containerView;
}

- (NSLayoutConstraint)paletteContainerWidthConstraint
{
  return self->_paletteContainerWidthConstraint;
}

- (void)setPaletteContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteContainerWidthConstraint, a3);
}

- (NSLayoutConstraint)paletteContainerHeightConstraint
{
  return self->_paletteContainerHeightConstraint;
}

- (void)setPaletteContainerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteContainerHeightConstraint, a3);
}

- (NSLayoutConstraint)paletteContainerCenterXConstraint
{
  return self->_paletteContainerCenterXConstraint;
}

- (void)setPaletteContainerCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteContainerCenterXConstraint, a3);
}

- (NSLayoutConstraint)paletteContainerCenterYConstraint
{
  return self->_paletteContainerCenterYConstraint;
}

- (void)setPaletteContainerCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteContainerCenterYConstraint, a3);
}

- (NSLayoutConstraint)paletteContainerCompactTopConstraint
{
  return self->_paletteContainerCompactTopConstraint;
}

- (void)setPaletteContainerCompactTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteContainerCompactTopConstraint, a3);
}

- (NSLayoutConstraint)paletteContainerCompactBottomConstraint
{
  return self->_paletteContainerCompactBottomConstraint;
}

- (void)setPaletteContainerCompactBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteContainerCompactBottomConstraint, a3);
}

- (NSLayoutConstraint)paletteContainerCompactLeftConstraint
{
  return self->_paletteContainerCompactLeftConstraint;
}

- (void)setPaletteContainerCompactLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteContainerCompactLeftConstraint, a3);
}

- (NSLayoutConstraint)paletteContainerCompactRightConstraint
{
  return self->_paletteContainerCompactRightConstraint;
}

- (void)setPaletteContainerCompactRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteContainerCompactRightConstraint, a3);
}

- (PKPaletteToolPreview)toolPreview
{
  return self->_toolPreview;
}

- (NSLayoutConstraint)toolPreviewCenterXConstraint
{
  return self->_toolPreviewCenterXConstraint;
}

- (void)setToolPreviewCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPreviewCenterXConstraint, a3);
}

- (NSLayoutConstraint)toolPreviewCenterYConstraint
{
  return self->_toolPreviewCenterYConstraint;
}

- (void)setToolPreviewCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPreviewCenterYConstraint, a3);
}

- (NSLayoutConstraint)toolPreviewWidthConstraint
{
  return self->_toolPreviewWidthConstraint;
}

- (void)setToolPreviewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPreviewWidthConstraint, a3);
}

- (NSLayoutConstraint)toolPreviewHeightConstraint
{
  return self->_toolPreviewHeightConstraint;
}

- (void)setToolPreviewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolPreviewHeightConstraint, a3);
}

- (unint64_t)lastPaletteEdgePositionWhileDragging
{
  return self->_lastPaletteEdgePositionWhileDragging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolPreviewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolPreviewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toolPreviewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_toolPreviewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_toolPreview, 0);
  objc_storeStrong((id *)&self->_paletteContainerCompactRightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCompactLeftConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCompactBottomConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCompactTopConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_destroyWeak((id *)&self->_hoverDelegate);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_destroyWeak((id *)&self->_paletteViewHosting);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_paletteScaleFactorPolicy, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_destroyWeak((id *)&self->_presentationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_palettePopoverPresentingController);
}

@end
