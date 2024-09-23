@implementation SFUnifiedBarItemView

- (SFUnifiedBarItemView)initWithFrame:(CGRect)a3
{
  SFUnifiedBarItemView *v3;
  SFUnifiedBarItemView *v4;
  UIView *v5;
  UIView *contentView;
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
  SFUnifiedBarItemView *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)SFUnifiedBarItemView;
  v3 = -[SFUnifiedBarItemView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_squishTransformFactor = 1.0;
    v3->_barBackgroundAlpha = 1.0;
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v4->_contentView;
    v4->_contentView = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFUnifiedBarItemView addSubview:](v4, "addSubview:", v4->_contentView);
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](v4->_contentView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBarItemView leadingAnchor](v4, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    -[UIView topAnchor](v4->_contentView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBarItemView topAnchor](v4, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v8;
    -[SFUnifiedBarItemView trailingAnchor](v4, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_contentView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v11;
    -[SFUnifiedBarItemView bottomAnchor](v4, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_contentView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v15);

    +[SFUnifiedBarTheme defaultTheme](SFUnifiedBarTheme, "defaultTheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBarItemView setBarTheme:](v4, "setBarTheme:", v16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, sel__buttonShapesEnabledDidChange, *MEMORY[0x1E0DC44E0], 0);

    v18 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUnifiedBarItemView;
  -[SFUnifiedBarItemView layoutSubviews](&v3, sel_layoutSubviews);
  -[SFUnifiedBarItemView updateCornerRadius](self, "updateCornerRadius");
  -[SFUnifiedBarItemView _layOutCutoutBorder](self, "_layOutCutoutBorder");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SFUnifiedBarItemView *v4;
  uint64_t v5;
  void *v6;
  SFUnifiedBarItemView *v7;
  objc_super v9;

  v4 = self;
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedBarItemView;
  -[SFUnifiedBarItemView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((!v5 || !v4->_occluded) && (UIView *)v5 != v4->_contentView)
    v4 = (SFUnifiedBarItemView *)v5;
  v7 = v4;

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SFUnifiedBarItemView;
    v5 = -[SFUnifiedBarItemView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v5;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  if (-[SFUnifiedBarItemView isHighlighted](self, "isHighlighted") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SFUnifiedBarItemView;
    -[SFUnifiedBarItemView setHighlighted:](&v7, sel_setHighlighted_, v3);
    v5 = 0.2;
    if (!v3)
      v5 = 0.5;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__SFUnifiedBarItemView_setHighlighted___block_invoke;
    v6[3] = &unk_1E21E2050;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50659332, v6, 0, v5, 0.0);
  }
}

uint64_t __39__SFUnifiedBarItemView_setHighlighted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateContentAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlatterEffect");
}

- (void)_setShowsPlatter:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  SFUnifiedBarItemPlatterView *v6;
  SFUnifiedBarItemPlatterView *platterView;
  UIVisualEffectView *v8;
  UIVisualEffectView *platterFillView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *platterViewConstraints;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SFUnifiedBarItemPlatterView *v28;
  UIVisualEffectView *v29;
  NSArray *v30;
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
  _QWORD v41[4];
  _QWORD v42[5];

  v42[4] = *MEMORY[0x1E0C80C00];
  if ((((self->_platterView == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:");
    -[SFUnifiedBarItemView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", !v3);

    if (v3)
    {
      v6 = objc_alloc_init(SFUnifiedBarItemPlatterView);
      platterView = self->_platterView;
      self->_platterView = v6;

      -[SFUnifiedBarItemPlatterView setUserInteractionEnabled:](self->_platterView, "setUserInteractionEnabled:", 0);
      -[SFUnifiedBarItemPlatterView setTranslatesAutoresizingMaskIntoConstraints:](self->_platterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v8 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
      platterFillView = self->_platterFillView;
      self->_platterFillView = v8;

      -[UIVisualEffectView setUserInteractionEnabled:](self->_platterFillView, "setUserInteractionEnabled:", 0);
      -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_platterFillView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SFUnifiedBarItemView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_platterView, self->_contentView);
      -[SFUnifiedBarItemView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_platterFillView, self->_contentView);
      -[SFUnifiedBarItemPlatterView leadingAnchor](self->_platterView, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedBarItemView leadingAnchor](self, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v35;
      -[SFUnifiedBarItemPlatterView topAnchor](self->_platterView, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedBarItemView topAnchor](self, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v10;
      -[SFUnifiedBarItemView trailingAnchor](self, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedBarItemPlatterView trailingAnchor](self->_platterView, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v13;
      -[SFUnifiedBarItemView bottomAnchor](self, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedBarItemPlatterView bottomAnchor](self->_platterView, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      platterViewConstraints = self->_platterViewConstraints;
      self->_platterViewConstraints = v17;

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_platterViewConstraints);
      v32 = (void *)MEMORY[0x1E0CB3718];
      -[UIVisualEffectView leadingAnchor](self->_platterFillView, "leadingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedBarItemView leadingAnchor](self, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:", v38);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v36;
      -[UIVisualEffectView topAnchor](self->_platterFillView, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedBarItemView topAnchor](self, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v20;
      -[SFUnifiedBarItemView trailingAnchor](self, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView trailingAnchor](self->_platterFillView, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v23;
      -[SFUnifiedBarItemView bottomAnchor](self, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView bottomAnchor](self->_platterFillView, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41[3] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v27);

    }
    else
    {
      -[SFUnifiedBarItemPlatterView removeFromSuperview](self->_platterView, "removeFromSuperview");
      v28 = self->_platterView;
      self->_platterView = 0;

      -[UIVisualEffectView removeFromSuperview](self->_platterFillView, "removeFromSuperview");
      v29 = self->_platterFillView;
      self->_platterFillView = 0;

      v30 = self->_platterViewConstraints;
      self->_platterViewConstraints = 0;

      -[SFUnifiedBarItemView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 0);
    }
  }
}

- (void)_setShowsCutoutBorderEffects:(BOOL)a3
{
  _UIVisualEffectBackdropView *cutoutBorderCopyView;
  _UIVisualEffectBackdropView *v5;
  _UIVisualEffectBackdropView *v6;
  NSString *cutoutBorderCopyGroupName;
  void *v8;
  SFUnifiedBarItemPlatterView *v9;
  SFUnifiedBarItemPlatterView *cutoutBorderPlatterView;
  SFUnifiedBarItemPlatterView *platterView;
  _UIVisualEffectBackdropView *v12;
  _UIVisualEffectBackdropView *v13;
  SFUnifiedBarItemPlatterView *v14;
  SFUnifiedBarItemPlatterView *v15;

  cutoutBorderCopyView = self->_cutoutBorderCopyView;
  if (a3)
  {
    if (!cutoutBorderCopyView)
    {
      v5 = (_UIVisualEffectBackdropView *)objc_alloc_init(MEMORY[0x1E0DC4498]);
      v6 = self->_cutoutBorderCopyView;
      self->_cutoutBorderCopyView = v5;

      cutoutBorderCopyGroupName = self->_cutoutBorderCopyGroupName;
      -[_UIVisualEffectBackdropView captureGroup](self->_cutoutBorderCopyView, "captureGroup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setGroupName:", cutoutBorderCopyGroupName);

      -[_UIVisualEffectBackdropView setUserInteractionEnabled:](self->_cutoutBorderCopyView, "setUserInteractionEnabled:", 0);
      v9 = objc_alloc_init(SFUnifiedBarItemPlatterView);
      cutoutBorderPlatterView = self->_cutoutBorderPlatterView;
      self->_cutoutBorderPlatterView = v9;

      -[SFUnifiedBarItemPlatterView setUserInteractionEnabled:](self->_cutoutBorderPlatterView, "setUserInteractionEnabled:", 0);
      platterView = self->_platterView;
      if (!platterView)
        platterView = (SFUnifiedBarItemPlatterView *)self->_contentView;
      v12 = self->_cutoutBorderCopyView;
      v15 = platterView;
      -[SFUnifiedBarItemView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v12, v15);
      -[SFUnifiedBarItemView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_cutoutBorderPlatterView, v15);

    }
  }
  else if (cutoutBorderCopyView)
  {
    -[_UIVisualEffectBackdropView removeFromSuperview](cutoutBorderCopyView, "removeFromSuperview");
    v13 = self->_cutoutBorderCopyView;
    self->_cutoutBorderCopyView = 0;

    -[SFUnifiedBarItemPlatterView removeFromSuperview](self->_cutoutBorderPlatterView, "removeFromSuperview");
    v14 = self->_cutoutBorderPlatterView;
    self->_cutoutBorderPlatterView = 0;

  }
}

- (void)_setShowsCutoutBorderEraser:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  UIView *cutoutBorderEraserView;
  UIView *v7;
  UIView *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SFUnifiedBarItemPlatterView *platterView;
  UIView *v13;

  v4 = !a3;
  -[SFUnifiedBarItemView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupBlending:", v4);

  cutoutBorderEraserView = self->_cutoutBorderEraserView;
  if (v4)
  {
    if (cutoutBorderEraserView)
    {
      -[UIView removeFromSuperview](cutoutBorderEraserView, "removeFromSuperview");
      v13 = self->_cutoutBorderEraserView;
      self->_cutoutBorderEraserView = 0;

    }
  }
  else if (!cutoutBorderEraserView)
  {
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v8 = self->_cutoutBorderEraserView;
    self->_cutoutBorderEraserView = v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_cutoutBorderEraserView, "setBackgroundColor:", v9);

    v10 = *MEMORY[0x1E0CD2C50];
    -[UIView layer](self->_cutoutBorderEraserView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompositingFilter:", v10);

    -[UIView setUserInteractionEnabled:](self->_cutoutBorderEraserView, "setUserInteractionEnabled:", 0);
    platterView = self->_platterView;
    if (!platterView)
      platterView = (SFUnifiedBarItemPlatterView *)self->_contentView;
    -[SFUnifiedBarItemView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_cutoutBorderEraserView, platterView);
  }
}

- (void)setBarMetrics:(id)a3
{
  SFUnifiedBarMetrics *v5;
  SFUnifiedBarMetrics *v6;

  v5 = (SFUnifiedBarMetrics *)a3;
  if (self->_barMetrics != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_barMetrics, a3);
    -[SFUnifiedBarItemView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setBarTheme:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    -[SFUnifiedBarItemView _disableVibrancyIfNeededForTheme:](self, "_disableVibrancyIfNeededForTheme:", v5);
    objc_storeStrong((id *)&self->_barTheme, a3);
    -[SFUnifiedBarItemView _updatePlatterEffect](self, "_updatePlatterEffect");
    -[SFUnifiedBarItemView applyTheme](self, "applyTheme");
  }

}

- (void)setPlatterStyle:(int64_t)a3
{
  _BOOL8 v5;
  void *v6;

  if (self->_platterStyle != a3)
  {
    v5 = a3 == 0;
    -[SFUnifiedBarItemView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", v5);

    self->_platterStyle = a3;
    -[SFUnifiedBarItemView _setShowsPlatter:](self, "_setShowsPlatter:", (unint64_t)(a3 - 1) < 5);
    -[SFUnifiedBarItemView _updateShowsCutoutBorder](self, "_updateShowsCutoutBorder");
    -[SFUnifiedBarItemView _updatePlatterEffect](self, "_updatePlatterEffect");
    -[SFUnifiedBarItemView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[SFUnifiedBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setItemsNeedEraserBasedCutoutBorder:(BOOL)a3
{
  if (self->_itemsNeedEraserBasedCutoutBorder != a3)
  {
    self->_itemsNeedEraserBasedCutoutBorder = a3;
    -[SFUnifiedBarItemView _updateShowsCutoutBorder](self, "_updateShowsCutoutBorder");
  }
}

- (void)_updateShowsCutoutBorder
{
  int64_t platterStyle;
  _BOOL8 itemsNeedEraserBasedCutoutBorder;

  platterStyle = self->_platterStyle;
  if (platterStyle && (platterStyle != 5 || UIAccessibilityButtonShapesEnabled()))
  {
    -[SFUnifiedBarItemView _setShowsCutoutBorderEffects:](self, "_setShowsCutoutBorderEffects:", !self->_itemsNeedEraserBasedCutoutBorder);
    itemsNeedEraserBasedCutoutBorder = self->_itemsNeedEraserBasedCutoutBorder;
  }
  else
  {
    -[SFUnifiedBarItemView _setShowsCutoutBorderEffects:](self, "_setShowsCutoutBorderEffects:", 0);
    itemsNeedEraserBasedCutoutBorder = 0;
  }
  -[SFUnifiedBarItemView _setShowsCutoutBorderEraser:](self, "_setShowsCutoutBorderEraser:", itemsNeedEraserBasedCutoutBorder);
}

- (void)_layOutCutoutBorder
{
  double v3;
  double v4;
  double x;
  double y;
  double width;
  double height;
  CGRect v9;
  CGRect v10;

  -[SFUnifiedBarMetrics cutoutBorderWidth](self->_barMetrics, "cutoutBorderWidth");
  v4 = v3;
  -[SFUnifiedBarItemView bounds](self, "bounds");
  v10 = CGRectInset(v9, -v4, -v4);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  -[_UIVisualEffectBackdropView setFrame:](self->_cutoutBorderCopyView, "setFrame:");
  -[SFUnifiedBarItemPlatterView setFrame:](self->_cutoutBorderPlatterView, "setFrame:", x, y, width, height);
  -[UIView setFrame:](self->_cutoutBorderEraserView, "setFrame:", x, y, width, height);
}

- (void)_disableVibrancyIfNeededForTheme:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  -[SFThemeColorBarTheme themeColor](self->_barTheme, "themeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v6, "themeColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57__SFUnifiedBarItemView__disableVibrancyIfNeededForTheme___block_invoke;
      v7[3] = &unk_1E21E2050;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
    }
  }

}

uint64_t __57__SFUnifiedBarItemView__disableVibrancyIfNeededForTheme___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 848);
  v4 = *(void **)(v2 + 840);
  if (*(_BYTE *)(v2 + 810))
    v5 = 1;
  else
    v5 = objc_msgSend((id)v2, "isHighlighted");
  backgroundColorForPlatterStyle(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "setEffect:", 0);
}

- (void)_updatePlatterEffect
{
  void *v3;
  unsigned int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t lastAppliedPlatterStyle;
  int64_t v11;
  BOOL v12;
  void *v13;
  id v14;
  unint64_t platterStyle;
  _QWORD v16[5];
  id v17;
  char v18;
  BOOL v19;
  _QWORD aBlock[5];
  char v21;
  char v22;

  if (self->_platterStyle)
  {
    -[SFThemeColorBarTheme themeColor](self->_barTheme, "themeColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 || -[SFUnifiedBarTheme isPrivate](self->_barTheme, "isPrivate"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      platterStyle = self->_platterStyle;
      if (platterStyle > 8)
        LOBYTE(v4) = 1;
      else
        v4 = (0x16u >> platterStyle) & 1;
    }

    if (self->_hovering)
      v5 = 1;
    else
      v5 = -[SFUnifiedBarItemView isHighlighted](self, "isHighlighted");
    if (-[SFUnifiedBarItemView _shouldEnableCopyCutoutBorder](self, "_shouldEnableCopyCutoutBorder"))
      v6 = 2;
    else
      v6 = 0;
    -[_UIVisualEffectBackdropView setRenderMode:](self->_cutoutBorderCopyView, "setRenderMode:", v6);
    -[SFUnifiedBarItemPlatterView setHidden:](self->_cutoutBorderPlatterView, "setHidden:", -[SFUnifiedBarItemView _shouldEnablePlatterCutoutBorder](self, "_shouldEnablePlatterCutoutBorder") ^ 1);
    -[SFUnifiedBarItemPlatterView setHidden:](self->_platterView, "setHidden:", -[SFUnifiedBarItemView _shouldHidePlatterView](self, "_shouldHidePlatterView"));
    -[SFUnifiedBarItemView _updateOverrideUserInterfaceStyle](self, "_updateOverrideUserInterfaceStyle");
    -[SFUnifiedBarItemView _updateBackgroundAlpha](self, "_updateBackgroundAlpha");
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__SFUnifiedBarItemView__updatePlatterEffect__block_invoke;
    aBlock[3] = &unk_1E21E2078;
    v21 = v4;
    aBlock[4] = self;
    v22 = v5;
    v8 = _Block_copy(aBlock);
    v9 = v8;
    lastAppliedPlatterStyle = self->_lastAppliedPlatterStyle;
    v11 = self->_platterStyle;
    v12 = lastAppliedPlatterStyle == v11;
    if (lastAppliedPlatterStyle == v11)
      (*((void (**)(void *))v8 + 2))(v8);
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __44__SFUnifiedBarItemView__updatePlatterEffect__block_invoke_2;
    v16[3] = &unk_1E21E20A0;
    v18 = v4;
    v19 = v12;
    v16[4] = self;
    v17 = v9;
    v14 = v9;
    objc_msgSend(v13, "performWithoutAnimation:", v16);
    self->_lastAppliedPlatterStyle = self->_platterStyle;

  }
}

void __44__SFUnifiedBarItemView__updatePlatterEffect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 848);
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = *(unsigned __int8 *)(a1 + 41);
    v5 = _SFIsDarkTintStyle(objc_msgSend(*(id *)(v2 + 840), "tintStyle"));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(double *)(v6 + 856);
    objc_msgSend(*(id *)(v6 + 840), "overrideBackdropEffect");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = 0.0;
    switch(v3)
    {
      case 0:
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
        goto LABEL_17;
      case 1:
        if (v8)
          goto LABEL_13;
        v11 = 0.35;
        v12 = 0.25;
        goto LABEL_14;
      case 2:
        if (v5)
        {
          if (v8)
          {
            v12 = 0.6;
            v11 = 0.45;
          }
          else
          {
            v12 = 0.4;
            v11 = 0.7;
          }
        }
        else if (v8)
        {
LABEL_13:
          v11 = 0.35;
          v12 = 0.5;
        }
        else
        {
          v12 = 0.45;
          v11 = 0.5;
        }
LABEL_14:
        v10 = _SFInterpolate(v12, v11, v7);
        goto LABEL_15;
      case 4:
        if (v5)
          v10 = 0.4;
        else
          v10 = 0.2;
        goto LABEL_15;
      default:
LABEL_15:
        if (v4)
          v10 = v10 + 0.2;
LABEL_17:

        v15 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        v16 = (id)v13;
        v14 = v15;
        break;
    }
  }
  else
  {
    backgroundColorForPlatterStyle(*(_QWORD *)(v2 + 848), *(void **)(v2 + 840), *(unsigned __int8 *)(a1 + 41));
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = (id)v13;
    v14 = (void *)v2;
  }
  objc_msgSend(v14, "_applyPlatterColor:", v13);

}

void __44__SFUnifiedBarItemView__updatePlatterEffect__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_applyThemeToPlatterView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 760));
  objc_msgSend(*(id *)(a1 + 32), "_applyThemeToPlatterView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 776));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "tintStyle") != 5)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v3 = (void *)MEMORY[0x1E0DC3F08];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "backdropEffect");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 848);
      if (v4 > 8)
        v5 = 5;
      else
        v5 = qword_18BAD4A90[v4];
      objc_msgSend(v3, "effectForBlurEffect:style:", v2, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "setEffect:", v6);

      goto LABEL_10;
    }
LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "setEffect:", 0);
    goto LABEL_11;
  }
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", 0, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "setEffect:", v2);
LABEL_10:

LABEL_11:
  if (!*(_BYTE *)(a1 + 49))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_applyThemeToPlatterView:(id)a3
{
  id v4;
  SFUnifiedBarTheme *barTheme;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  barTheme = self->_barTheme;
  v10 = v4;
  objc_msgSend(v4, "effectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFThemeColorBarTheme applyBackdropEffectsToView:](barTheme, "applyBackdropEffectsToView:", v6);

  -[SFThemeColorBarTheme themeColor](self->_barTheme, "themeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v10, "effectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", 0);

  }
}

- (void)_applyPlatterColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double barBackgroundAlpha;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;

  v4 = a3;
  -[UIVisualEffectView contentView](self->_platterFillView, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_platterStyle == 3)
  {
    -[SFUnifiedBarItemView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedColorWithTraitCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0.0;
    objc_msgSend(v8, "getRed:green:blue:alpha:", 0, 0, 0, &v16);
    barBackgroundAlpha = 0.0;
    if (!-[SFUnifiedBarTheme isPrivate](self->_barTheme, "isPrivate"))
      barBackgroundAlpha = self->_barBackgroundAlpha;
    if (self->_hovering || -[SFUnifiedBarItemView isHighlighted](self, "isHighlighted"))
    {
      objc_msgSend(v6, "setBackgroundColor:", v4);
    }
    else
    {
      objc_msgSend(v8, "colorWithAlphaComponent:", (1.0 - barBackgroundAlpha) * v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v11);

    }
    objc_msgSend(v8, "colorWithAlphaComponent:", barBackgroundAlpha * v16);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    objc_msgSend(v6, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderColor:", v13);

    objc_msgSend(v6, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBorderWidth:", 1.0);

  }
  else
  {
    objc_msgSend(v5, "setBackgroundColor:", v4);
    objc_msgSend(v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderColor:", 0);

    objc_msgSend(v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderWidth:", 0.0);
  }

}

- (void)_updateOverrideUserInterfaceStyle
{
  uint64_t v3;

  if ((unint64_t)(self->_platterStyle - 1) <= 4)
  {
    if (-[SFUnifiedBarTheme isPrivate](self->_barTheme, "isPrivate"))
      v3 = 2;
    else
      v3 = 0;
    -[SFUnifiedBarItemView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v3);
  }
}

- (void)setCutoutBorderCopyGroupName:(id)a3
{
  NSString *v4;
  NSString *cutoutBorderCopyGroupName;
  void *v6;
  id v7;

  v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    cutoutBorderCopyGroupName = self->_cutoutBorderCopyGroupName;
    self->_cutoutBorderCopyGroupName = v4;

    -[_UIVisualEffectBackdropView captureGroup](self->_cutoutBorderCopyView, "captureGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGroupName:", v7);

  }
}

- (void)setBarBackgroundAlpha:(double)a3
{
  if (self->_barBackgroundAlpha != a3)
  {
    self->_barBackgroundAlpha = a3;
    -[SFUnifiedBarItemView _updatePlatterEffect](self, "_updatePlatterEffect");
  }
}

- (void)setThemeColorVisibility:(double)a3
{
  if (self->_themeColorVisibility != a3)
  {
    self->_themeColorVisibility = a3;
    -[SFUnifiedBarItemView _updateBackgroundAlpha](self, "_updateBackgroundAlpha");
  }
}

- (void)_updateBackgroundAlpha
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  -[SFThemeColorBarTheme themeColor](self->_barTheme, "themeColor");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = SFBarBackgroundAlphaForSquishTransformFactor(self->_squishTransformFactor);
  if (v14)
    v4 = _SFInterpolate(1.0 - 0.85, 0.0, self->_themeColorVisibility);
  else
    v4 = 1.0;
  -[UIVisualEffectView setAlpha:](self->_platterFillView, "setAlpha:", v3);
  -[SFUnifiedBarTheme overridePlatterColor](self->_barTheme, "overridePlatterColor");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5 || (v7 = (void *)v5, (unint64_t)(self->_platterStyle - 1) >= 4))
    v7 = v14;
  v8 = v7;
  objc_msgSend(v8, "colorWithAlphaComponent:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarItemPlatterView setBackgroundColor:](self->_platterView, "setBackgroundColor:", v9);

  -[SFUnifiedBarItemPlatterView effectView](self->_platterView, "effectView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v3 * v4);

  v11 = ceil(v3);
  objc_msgSend(v14, "colorWithAlphaComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFUnifiedBarItemPlatterView setBackgroundColor:](self->_cutoutBorderPlatterView, "setBackgroundColor:", v12);
  -[SFUnifiedBarItemPlatterView effectView](self->_cutoutBorderPlatterView, "effectView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", v11 * v4);

}

- (BOOL)_shouldEnableCopyCutoutBorder
{
  return self->_barBackgroundAlpha < 1.0;
}

- (BOOL)_shouldEnablePlatterCutoutBorder
{
  return !-[SFUnifiedBarItemView _shouldEnableCopyCutoutBorder](self, "_shouldEnableCopyCutoutBorder");
}

- (BOOL)_shouldHidePlatterView
{
  void *v3;
  BOOL v4;

  if (!self->_cutoutBorderPlatterView
    || !-[SFUnifiedBarItemView _shouldEnablePlatterCutoutBorder](self, "_shouldEnablePlatterCutoutBorder"))
  {
    return 0;
  }
  -[SFUnifiedBarTheme overridePlatterColor](self->_barTheme, "overridePlatterColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)setSquishTransformFactor:(double)a3
{
  if (self->_squishTransformFactor != a3)
  {
    self->_squishTransformFactor = a3;
    -[SFUnifiedBarItemView _updateContentAlpha](self, "_updateContentAlpha");
    -[SFUnifiedBarItemView _updateBackgroundAlpha](self, "_updateBackgroundAlpha");
  }
}

- (double)preferredWidth
{
  return 0.0;
}

- (UIDragPreviewParameters)previewParameters
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  v4 = (void *)MEMORY[0x1E0DC3508];
  -[SFUnifiedBarItemView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SFUnifiedBarMetrics itemCornerRadius](self->_barMetrics, "itemCornerRadius");
  objc_msgSend(v4, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVisiblePath:", v14);

  -[SFThemeColorBarTheme themeColor](self->_barTheme, "themeColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v3, "setBackgroundColor:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBarItemView traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resolvedColorWithTraitCollection:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v19);

  }
  return (UIDragPreviewParameters *)v3;
}

- (void)updateCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SFUnifiedBarMetrics itemCornerRadius](self->_barMetrics, "itemCornerRadius");
  v4 = v3;
  -[SFUnifiedBarItemView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", v4);
  if (self->_platterStyle != 5 || (v5 = 0.0, UIAccessibilityButtonShapesEnabled()))
    v5 = v4;
  -[SFUnifiedBarItemPlatterView _setContinuousCornerRadius:](self->_platterView, "_setContinuousCornerRadius:", v5);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_platterFillView, "_setContinuousCornerRadius:", v4);
  -[SFUnifiedBarMetrics cutoutBorderWidth](self->_barMetrics, "cutoutBorderWidth");
  v7 = v4 + v6;
  -[_UIVisualEffectBackdropView _setContinuousCornerRadius:](self->_cutoutBorderCopyView, "_setContinuousCornerRadius:", v7);
  -[SFUnifiedBarItemPlatterView _setContinuousCornerRadius:](self->_cutoutBorderPlatterView, "_setContinuousCornerRadius:", v7);
  -[UIView _setContinuousCornerRadius:](self->_cutoutBorderEraserView, "_setContinuousCornerRadius:", v7);
}

- (void)_updateContentAlpha
{
  double v3;
  id v4;

  v3 = SFBarContentAlphaForSquishTransformFactor(self->_squishTransformFactor);
  if (!self->_platterStyle && -[SFUnifiedBarItemView isHighlighted](self, "isHighlighted"))
    v3 = v3 * dbl_18BAD4AE0[-[SFThemeColorBarTheme userInterfaceStyle](self->_barTheme, "userInterfaceStyle") == 2];
  -[UIView setAlpha:](self->_contentView, "setAlpha:", v3);
  -[SFUnifiedBarItemView _titleView](self, "_titleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)_buttonShapesEnabledDidChange
{
  -[SFUnifiedBarItemView _updateShowsCutoutBorder](self, "_updateShowsCutoutBorder");
  -[SFUnifiedBarItemView _updatePlatterEffect](self, "_updatePlatterEffect");
  -[SFUnifiedBarItemView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[SFUnifiedBarItemView setNeedsLayout](self, "setNeedsLayout");
}

- (SFUnifiedBarItem)item
{
  return (SFUnifiedBarItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (SFUnifiedBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (SFUnifiedBarTheme)barTheme
{
  return self->_barTheme;
}

- (int64_t)platterStyle
{
  return self->_platterStyle;
}

- (double)barBackgroundAlpha
{
  return self->_barBackgroundAlpha;
}

- (double)themeColorVisibility
{
  return self->_themeColorVisibility;
}

- (double)squishTransformFactor
{
  return self->_squishTransformFactor;
}

- (BOOL)isOccluded
{
  return self->_occluded;
}

- (void)setOccluded:(BOOL)a3
{
  self->_occluded = a3;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 880);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isHovering
{
  return self->_hovering;
}

- (void)setHovering:(BOOL)a3
{
  self->_hovering = a3;
}

- (double)squishedInset
{
  return self->_squishedInset;
}

- (void)setSquishedInset:(double)a3
{
  self->_squishedInset = a3;
}

- (NSString)cutoutBorderCopyGroupName
{
  return self->_cutoutBorderCopyGroupName;
}

- (BOOL)itemsNeedEraserBasedCutoutBorder
{
  return self->_itemsNeedEraserBasedCutoutBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cutoutBorderCopyGroupName, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_barTheme, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_platterViewConstraints, 0);
  objc_storeStrong((id *)&self->_platterFillView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_cutoutBorderEraserView, 0);
  objc_storeStrong((id *)&self->_cutoutBorderPlatterView, 0);
  objc_storeStrong((id *)&self->_cutoutBorderCopyView, 0);
}

@end
