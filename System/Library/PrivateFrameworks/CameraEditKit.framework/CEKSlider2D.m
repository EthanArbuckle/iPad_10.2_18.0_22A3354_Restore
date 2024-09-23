@implementation CEKSlider2D

- (CEKSlider2D)initWithFrame:(CGRect)a3
{
  CEKSlider2D *v3;
  uint64_t v4;
  UIImageView *gridView;
  UIView *v6;
  UIView *defaultValueIndicator;
  void *v8;
  UIView *v9;
  UIView *valueIndicator;
  void *v11;
  uint64_t v12;
  UILongPressGestureRecognizer *pressGestureRecognizer;
  void *v14;
  void *v15;
  CEKSelectionFeedbackGenerator *v16;
  CEKSelectionFeedbackGenerator *selectionFeedbackGenerator;
  CEKSlider2D *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CEKSlider2D;
  v3 = -[CEKSlider2D initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    gridView = v3->__gridView;
    v3->__gridView = (UIImageView *)v4;

    -[CEKSlider2D addSubview:](v3, "addSubview:", v3->__gridView);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    defaultValueIndicator = v3->__defaultValueIndicator;
    v3->__defaultValueIndicator = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->__defaultValueIndicator, "setBackgroundColor:", v8);

    -[CEKSlider2D addSubview:](v3, "addSubview:", v3->__defaultValueIndicator);
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    valueIndicator = v3->__valueIndicator;
    v3->__valueIndicator = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->__valueIndicator, "setBackgroundColor:", v11);

    -[CEKSlider2D addSubview:](v3, "addSubview:", v3->__valueIndicator);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v3, sel__handlePressGesture_);
    pressGestureRecognizer = v3->__pressGestureRecognizer;
    v3->__pressGestureRecognizer = (UILongPressGestureRecognizer *)v12;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v3->__pressGestureRecognizer, "setMinimumPressDuration:", 0.0);
    -[CEKSlider2D addGestureRecognizer:](v3, "addGestureRecognizer:", v3->__pressGestureRecognizer);
    v3->_cornerRadius = 22.0;
    -[CEKSlider2D layer](v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 22.0);

    -[CEKSlider2D layer](v3, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    v3->_snapTouchesToDefaultValue = 1;
    if (CEKHapticsAllowed())
    {
      v16 = objc_alloc_init(CEKSelectionFeedbackGenerator);
      selectionFeedbackGenerator = v3->__selectionFeedbackGenerator;
      v3->__selectionFeedbackGenerator = v16;

    }
    v18 = v3;
  }

  return v3;
}

- (void)setValue:(CGPoint)a3
{
  -[CEKSlider2D _setValue:shouldNotify:animated:](self, "_setValue:shouldNotify:animated:", 0, 0, a3.x, a3.y);
}

- (void)setValue:(CGPoint)a3 animated:(BOOL)a4
{
  -[CEKSlider2D _setValue:shouldNotify:animated:](self, "_setValue:shouldNotify:animated:", 0, a4, a3.x, a3.y);
}

- (void)setBackgroundImage:(id)a3
{
  UIImage *v5;
  UIImageView *v6;
  UIImageView *backgroundImageView;
  void *v8;
  UIImage *v9;

  v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    if (!self->__backgroundImageView)
    {
      v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
      backgroundImageView = self->__backgroundImageView;
      self->__backgroundImageView = v6;

      -[CEKSlider2D insertSubview:atIndex:](self, "insertSubview:atIndex:", self->__backgroundImageView, 0);
    }
    -[CEKSlider2D _backgroundImageView](self, "_backgroundImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v9);

    v5 = v9;
  }

}

- (void)setBackgroundAsSnapshotOfView:(id)a3
{
  id v4;
  UIView *backgroundSnapshotView1;
  UIView *backgroundSnapshotView2;
  id v7;
  UIView *v8;
  UIView *backgroundSnapshotContainerView;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *v14;
  UIView *v15;
  UIView *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView removeFromSuperview](self->__backgroundSnapshotView1, "removeFromSuperview");
  -[UIView removeFromSuperview](self->__backgroundSnapshotView2, "removeFromSuperview");
  backgroundSnapshotView1 = self->__backgroundSnapshotView1;
  self->__backgroundSnapshotView1 = 0;

  backgroundSnapshotView2 = self->__backgroundSnapshotView2;
  self->__backgroundSnapshotView2 = 0;

  if (v4)
  {
    if (!self->__backgroundSnapshotContainerView)
    {
      v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      backgroundSnapshotContainerView = self->__backgroundSnapshotContainerView;
      self->__backgroundSnapshotContainerView = v8;

      -[CEKSlider2D _blurFilter](self, "_blurFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->__backgroundSnapshotContainerView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFilters:", v11);

      -[CEKSlider2D insertSubview:atIndex:](self, "insertSubview:atIndex:", self->__backgroundSnapshotContainerView, 0);
    }
    objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0);
    v13 = (UIView *)objc_claimAutoreleasedReturnValue();
    v14 = self->__backgroundSnapshotView1;
    self->__backgroundSnapshotView1 = v13;

    objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0);
    v15 = (UIView *)objc_claimAutoreleasedReturnValue();
    v16 = self->__backgroundSnapshotView2;
    self->__backgroundSnapshotView2 = v15;

    v17 = *MEMORY[0x1E0CD2EB0];
    -[UIView layer](self->__backgroundSnapshotView2, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompositingFilter:", v17);

    -[UIView addSubview:](self->__backgroundSnapshotContainerView, "addSubview:", self->__backgroundSnapshotView1);
    -[UIView addSubview:](self->__backgroundSnapshotContainerView, "addSubview:", self->__backgroundSnapshotView2);
    -[CEKSlider2D setNeedsLayout](self, "setNeedsLayout");
  }
  -[CEKSlider2D _updateGradientViews](self, "_updateGradientViews");

}

- (void)setBackgroundFromExistingSlider2D:(id)a3
{
  UIView *backgroundSnapshotContainerView;
  id v5;
  void *v6;
  UIView *v7;
  UIView *v8;

  backgroundSnapshotContainerView = self->__backgroundSnapshotContainerView;
  v5 = a3;
  -[UIView removeFromSuperview](backgroundSnapshotContainerView, "removeFromSuperview");
  objc_msgSend(v5, "_backgroundSnapshotContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  v8 = self->__backgroundSnapshotContainerView;
  self->__backgroundSnapshotContainerView = v7;

  -[CEKSlider2D insertSubview:atIndex:](self, "insertSubview:atIndex:", self->__backgroundSnapshotContainerView, 0);
  -[CEKSlider2D _updateGradientViews](self, "_updateGradientViews");
  -[CEKSlider2D setNeedsLayout](self, "setNeedsLayout");
}

- (id)_blurFilter
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", &unk_1E70B3B70, CFSTR("inputRadius"));
  objc_msgSend(v2, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
  return v2;
}

- (void)_updateGradientViews
{
  if (-[CEKSlider2D _wantsGradientLayers](self, "_wantsGradientLayers"))
    -[CEKSlider2D _createGradientsViewIfNecessary](self, "_createGradientsViewIfNecessary");
  else
    -[CEKSlider2D _destroyGradientsViewIfNecessary](self, "_destroyGradientsViewIfNecessary");
}

- (BOOL)_wantsGradientLayers
{
  return self->__backgroundSnapshotContainerView != 0;
}

- (void)_createGradientsViewIfNecessary
{
  id v3;
  UIView *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  UIView *gradientsView;
  UIView *v25;
  UIView *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  if (!self->__gradientsView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = objc_alloc_init(MEMORY[0x1E0CD2790]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.87, 0.87, 0.87, 1.0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30[0] = objc_msgSend(v6, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.05);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30[1] = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColors:", v9);

    objc_msgSend(v5, "setStartPoint:", 0.13, 0.76);
    objc_msgSend(v5, "setEndPoint:", 0.88, 0.11);
    -[UIView layer](v4, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSublayer:atIndex:", v5, 0);

    v11 = objc_alloc_init(MEMORY[0x1E0CD2790]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.87, 0.87, 0.87, 1.0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29[0] = objc_msgSend(v12, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.0);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29[1] = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setColors:", v15);

    LODWORD(v16) = 1058642330;
    objc_msgSend(v11, "setOpacity:", v16);
    objc_msgSend(v11, "setStartPoint:", 0.0, 0.0);
    objc_msgSend(v11, "setEndPoint:", 0.45, 0.33);
    -[UIView layer](v4, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertSublayer:atIndex:", v11, 1);

    v18 = objc_alloc_init(MEMORY[0x1E0CD2790]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.07, 0.07, 0.11, 1.0);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28[0] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.35, 0.35, 0.35, 0.01);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28[1] = objc_msgSend(v20, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setColors:", v21);

    LODWORD(v22) = *(_DWORD *)"333?";
    objc_msgSend(v18, "setOpacity:", v22);
    objc_msgSend(v18, "setStartPoint:", 0.5, 1.0);
    objc_msgSend(v18, "setEndPoint:", 0.5, -0.1);
    objc_msgSend(v18, "setCompositingFilter:", *MEMORY[0x1E0CD2E28]);
    -[UIView layer](v4, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertSublayer:atIndex:", v18, 2);

    gradientsView = self->__gradientsView;
    self->__gradientsView = v4;
    v25 = v4;

    v26 = self->__gradientsView;
    -[CEKSlider2D _gridView](self, "_gridView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKSlider2D insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v26, v27);

  }
}

- (void)_destroyGradientsViewIfNecessary
{
  UIView *gradientsView;

  -[UIView removeFromSuperview](self->__gradientsView, "removeFromSuperview");
  gradientsView = self->__gradientsView;
  self->__gradientsView = 0;

}

- (void)_setValue:(CGPoint)a3 shouldNotify:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double y;
  double v9;
  double v10;
  _QWORD v12[5];

  v5 = a5;
  v6 = a4;
  y = a3.y;
  v9 = CEKClamp(a3.x, -1.0, 1.0);
  v10 = CEKClamp(y, -1.0, 1.0);
  if (self->_value.x != v9 || self->_value.y != v10)
  {
    self->_value.x = v9;
    self->_value.y = v10;
    -[CEKSlider2D setNeedsLayout](self, "setNeedsLayout");
    if (v5)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__CEKSlider2D__setValue_shouldNotify_animated___block_invoke;
      v12[3] = &unk_1E70A4B18;
      v12[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 131074, v12, 0, 0.25, 0.0);
    }
    if (v6)
      -[CEKSlider2D sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

uint64_t __47__CEKSlider2D__setValue_shouldNotify_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setDefaultValue:(CGPoint)a3
{
  double y;
  double v5;
  double v6;

  y = a3.y;
  v5 = CEKClamp(a3.x, -1.0, 1.0);
  v6 = CEKClamp(y, -1.0, 1.0);
  if (self->_defaultValue.x != v5 || self->_defaultValue.y != v6)
  {
    self->_defaultValue.x = v5;
    self->_defaultValue.y = v6;
    -[CEKSlider2D setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setActive:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  double v18;
  float v19;
  void *v20;
  double v21;
  _QWORD v22[5];

  if (self->__active != a3)
  {
    v4 = a4;
    self->__active = a3;
    -[CEKSlider2D _valueIndicator](self, "_valueIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->__active)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "CGColor");
      objc_msgSend(v6, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShadowColor:", v8);

      objc_msgSend(v6, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShadowRadius:", 6.0);

    }
    objc_msgSend(v6, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowOffset:", 0.0, 0.0);

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOpacity"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDuration:", 0.2);
      if (self->__active)
        v13 = &unk_1E70B3B80;
      else
        v13 = &unk_1E70B3B90;
      objc_msgSend(v12, "setFromValue:", v13);
      if (self->__active)
        v14 = &unk_1E70B3B90;
      else
        v14 = &unk_1E70B3B80;
      objc_msgSend(v12, "setToValue:", v14);
      objc_msgSend(v12, "setRemovedOnCompletion:", 1);
      objc_msgSend(v6, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAnimation:forKey:", v12, CFSTR("shadowOpacity"));

      if (self->__active)
        v16 = 1.0;
      else
        v16 = 0.0;
      objc_msgSend(v6, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v18 = v16;
      objc_msgSend(v17, "setShadowOpacity:", v18);

      -[CEKSlider2D setNeedsLayout](self, "setNeedsLayout");
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __35__CEKSlider2D__setActive_animated___block_invoke;
      v22[3] = &unk_1E70A4B18;
      v22[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v22, 0, 0.2, 0.0);
    }
    else
    {
      if (self->__active)
        v19 = 1.0;
      else
        v19 = 0.0;
      objc_msgSend(v6, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v21 = v19;
      objc_msgSend(v20, "setShadowOpacity:", v21);

      -[CEKSlider2D setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

uint64_t __35__CEKSlider2D__setActive_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[CEKSlider2D layer](self, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", a3);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)CEKSlider2D;
  -[CEKSlider2D layoutSubviews](&v51, sel_layoutSubviews);
  -[CEKSlider2D bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CEKSlider2D _backgroundImageView](self, "_backgroundImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CEKSlider2D _backgroundImageView](self, "_backgroundImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  }
  -[CEKSlider2D _backgroundSnapshotContainerView](self, "_backgroundSnapshotContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  -[CEKSlider2D _backgroundSnapshotView1](self, "_backgroundSnapshotView1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

  -[CEKSlider2D _backgroundSnapshotView2](self, "_backgroundSnapshotView2");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  -[CEKSlider2D _gradientsView](self, "_gradientsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[CEKSlider2D _gradientsView](self, "_gradientsView", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sublayers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v48;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v23++), "setFrame:", v4, v6, v8, v10);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v21);
  }

  -[CEKSlider2D _gridView](self, "_gridView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v4, v6, v8, v10);

  -[CEKSlider2D _gridView](self, "_gridView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "size");
  if (v28 != v8 || v27 != v10)
  {
    -[CEKSlider2D _createGridImageWithSize:](self, "_createGridImageWithSize:", v8, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKSlider2D _gridView](self, "_gridView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setImage:", v29);

  }
  -[CEKSlider2D _valueIndicator](self, "_valueIndicator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider2D _defaultValueIndicator](self, "_defaultValueIndicator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKSlider2D value](self, "value");
  -[CEKSlider2D _normalizedViewValueForValue:](self, "_normalizedViewValueForValue:");
  v34 = v33;
  v36 = v35;
  -[CEKSlider2D defaultValue](self, "defaultValue");
  -[CEKSlider2D _normalizedViewValueForValue:](self, "_normalizedViewValueForValue:");
  v38 = v37;
  v40 = v39;
  CEKExpandNormalizedPoint(v34, v36, v4, v6, v8, v10);
  CEKExpandNormalizedPoint(v38, v40, v4, v6, v8, v10);
  v41 = v8 * 0.085;
  if (self->__active)
    v42 = 30.0;
  else
    v42 = v8 * 0.085;
  objc_msgSend(v31, "setBounds:", CEKRectWithSize());
  objc_msgSend(v31, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setCornerRadius:", v42 * 0.5);

  objc_msgSend(v32, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setCornerRadius:", v41 * 0.5 * 0.5);

  objc_msgSend(v32, "setBounds:", CEKRectWithSize());
  objc_msgSend(v31, "bounds");
  -[CEKSlider2D traitCollection](self, "traitCollection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "displayScale");
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v31, "setCenter:");

  objc_msgSend(v32, "bounds");
  -[CEKSlider2D traitCollection](self, "traitCollection");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "displayScale");
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v32, "setCenter:");

}

- (CGPoint)_normalizedViewValueForValue:(CGPoint)a3
{
  double y;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  v4 = CEKProgress(a3.x, -1.0, 1.0);
  v5 = 1.0 - CEKProgress(y, -1.0, 1.0);
  v6 = v4 * 0.833333333 + 0.0833333333;
  v7 = v5 * 0.833333333 + 0.0833333333;
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)_valueForNormalizedViewValue:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  v3 = 1.0 - (a3.y + -0.0833333333) / 0.833333333;
  v4 = CEKInterpolate(-1.0, 1.0, (a3.x + -0.0833333333) / 0.833333333);
  v5 = CEKInterpolate(-1.0, 1.0, v3);
  v6 = v4;
  result.y = v5;
  result.x = v6;
  return result;
}

- (void)_handlePressGesture:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v30 = a3;
  v4 = objc_msgSend(v30, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 != 2)
    {
      if (v4 != 1)
        goto LABEL_13;
      -[CEKSlider2D _setActive:animated:](self, "_setActive:animated:", 1, 1);
      -[CEKSlider2D _prepareFeedback](self, "_prepareFeedback");
    }
    objc_msgSend(v30, "locationInView:", self);
    v6 = v5;
    v8 = v7;
    -[CEKSlider2D bounds](self, "bounds");
    -[CEKSlider2D _valueForNormalizedViewValue:](self, "_valueForNormalizedViewValue:", CEKNormalizePoint(v6, v8, v9, v10, v11, v12));
    v14 = v13;
    v16 = v15;
    if (-[CEKSlider2D snapTouchesToDefaultValue](self, "snapTouchesToDefaultValue"))
    {
      -[CEKSlider2D defaultValue](self, "defaultValue");
      -[CEKSlider2D _normalizedViewValueForValue:](self, "_normalizedViewValueForValue:");
      v18 = v17;
      v20 = v19;
      -[CEKSlider2D bounds](self, "bounds");
      CEKExpandNormalizedPoint(v18, v20, v21, v22, v23, v24);
      UIDistanceBetweenPoints();
      if (v25 < 10.0)
      {
        -[CEKSlider2D defaultValue](self, "defaultValue");
        v14 = v26;
        v16 = v27;
      }
    }
    -[CEKSlider2D value](self, "value");
    if (v14 * v28 < 0.0 || (-[CEKSlider2D value](self, "value"), v16 * v29 < 0.0))
    {
      -[CEKSlider2D _performFeedback](self, "_performFeedback");
      -[CEKSlider2D _prepareFeedback](self, "_prepareFeedback");
    }
    -[CEKSlider2D _setValue:shouldNotify:animated:](self, "_setValue:shouldNotify:animated:", 1, 0, v14, v16);
  }
  else
  {
    -[CEKSlider2D _setActive:animated:](self, "_setActive:animated:", 0, 1);
  }
LABEL_13:

}

- (id)_createGridImageWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[10];

  height = a3.height;
  width = a3.width;
  if (a3.width == *MEMORY[0x1E0C9D820] && a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v6, width, height);
    v8 = CEKRectWithSize();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__CEKSlider2D__createGridImageWithSize___block_invoke;
    v14[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v14[4] = v8;
    v14[5] = v9;
    v14[6] = v10;
    v14[7] = v11;
    *(double *)&v14[8] = width;
    *(double *)&v14[9] = height;
    objc_msgSend(v7, "imageWithActions:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

void __40__CEKSlider2D__createGridImageWithSize___block_invoke(double *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  unint64_t i;
  double v11;
  void *v12;
  CGContext *v13;
  CGColorSpace *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  const __CFArray *v20;
  CGGradient *v21;
  CGContext *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  const __CFArray *v28;
  CGGradient *v29;
  CGContext *v30;
  __int128 v31;
  _QWORD v32[2];
  CGFloat locations[3];
  _QWORD v34[3];
  CGPoint v35;
  CGPoint v36;
  CGPoint v37;
  CGPoint v38;
  CGRect v39;

  v34[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[6] / 12.0;
  if (a1[8] >= 100.0)
    v5 = 4.0;
  else
    v5 = 2.0;
  v6 = v5 * -0.5;
  v7 = 1;
  v8 = a1[7] / 12.0;
  do
  {
    for (i = 1; i != 12; ++i)
    {
      if (i == 6 || v7 == 6)
        v11 = 1.0;
      else
        v11 = 0.3;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFill");

      v13 = (CGContext *)objc_msgSend(v3, "CGContext");
      v39.origin.x = v6 + (double)v7 * v4;
      v39.origin.y = v6 + (double)i * v8;
      v39.size.width = v5;
      v39.size.height = v5;
      CGContextFillEllipseInRect(v13, v39);
    }
    ++v7;
  }
  while (v7 != 12);
  v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D970]);
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_retainAutorelease(v16);
  v34[0] = objc_msgSend(v18, "CGColor");
  v19 = objc_retainAutorelease(v17);
  v34[1] = objc_msgSend(v19, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v20 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)locations = xmmword_1B98779D0;
  v21 = CGGradientCreateWithColors(v14, v20, locations);
  v22 = (CGContext *)objc_msgSend(v3, "CGContext");
  v37.x = a1[8];
  v35.x = 0.0;
  v35.y = 0.0;
  v37.y = 0.0;
  CGContextDrawLinearGradient(v22, v21, v35, v37, 0);
  CGGradientRelease(v21);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "colorWithAlphaComponent:", 0.6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_retainAutorelease(v24);
  v32[0] = objc_msgSend(v26, "CGColor");
  v27 = objc_retainAutorelease(v25);
  v32[1] = objc_msgSend(v27, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v28 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v31 = xmmword_1B98779E0;
  v29 = CGGradientCreateWithColors(v14, v28, (const CGFloat *)&v31);
  v30 = (CGContext *)objc_msgSend(v3, "CGContext");
  v38.y = a1[9];
  v36.x = 0.0;
  v36.y = 0.0;
  v38.x = 0.0;
  CGContextDrawLinearGradient(v30, v29, v36, v38, 0);
  CGGradientRelease(v29);
  CGColorSpaceRelease(v14);

}

+ (id)backgroundImageWithImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGImage *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C9DD90];
  v4 = a3;
  objc_msgSend(v3, "contextWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithImage:", v4);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorControls"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("inputImage"));
  objc_msgSend(v7, "setValue:forKey:", &unk_1E70B3BA0, CFSTR("inputSaturation"));
  objc_msgSend(v7, "valueForKey:", CFSTR("outputImage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIGaussianBlur"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v8, CFSTR("inputImage"));
  objc_msgSend(v9, "setValue:forKey:", &unk_1E70B3D70, CFSTR("inputRadius"));
  objc_msgSend(v9, "valueForKey:", CFSTR("outputImage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "extent");
  v11 = (CGImage *)objc_msgSend(v5, "createCGImage:fromRect:", v10);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v11);

  return v12;
}

- (void)setPulsingValueIndicator:(BOOL)a3
{
  double v3;

  if (self->_pulsingValueIndicator != a3)
  {
    self->_pulsingValueIndicator = a3;
    if (a3)
    {
      LODWORD(v3) = 2139095040;
      -[CEKSlider2D _startScalingWithScale:duration:repeatCount:timingFunction:](self, "_startScalingWithScale:duration:repeatCount:timingFunction:", 0, 2.0, 0.75, v3);
    }
    else
    {
      -[CEKSlider2D _stopScalingWithDuration:](self, "_stopScalingWithDuration:", 0.25);
    }
  }
}

- (void)_startScalingWithScale:(double)a3 duration:(double)a4 repeatCount:(float)a5 timingFunction:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[8];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v10);
  objc_msgSend(v11, "setDuration:", a4);
  v22[0] = &unk_1E70B3D88;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:", v13);

  *(float *)&v14 = a5;
  objc_msgSend(v11, "setRepeatCount:", v14);
  objc_msgSend(v11, "setAutoreverses:", 1);
  -[CEKSlider2D _valueIndicator](self, "_valueIndicator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAnimation:forKey:", v11, CFSTR("pulsingTransform"));
  v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v21[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v21[5] = v17;
  v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v21[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v21[7] = v18;
  v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v21[0] = *MEMORY[0x1E0CD2610];
  v21[1] = v19;
  v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v21[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v21[3] = v20;
  objc_msgSend(v16, "setTransform:", v21);

}

- (void)_stopScalingWithDuration:(double)a3
{
  void *v4;
  void *v5;
  __int128 *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[8];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  -[CEKSlider2D _valueIndicator](self, "_valueIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (__int128 *)MEMORY[0x1E0CD2610];
  if (a3 > 0.0)
  {
    objc_msgSend(v5, "presentationLayer");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v5;
    v10 = v9;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    if (v10)
      objc_msgSend(v10, "transform");
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDuration:", a3);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimingFunction:", v12);

    v28 = v36;
    v29 = v37;
    v30 = v38;
    v31 = v39;
    v24 = v32;
    v25 = v33;
    v26 = v34;
    v27 = v35;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFromValue:", v13);

    v14 = v6[5];
    v28 = v6[4];
    v29 = v14;
    v15 = v6[7];
    v30 = v6[6];
    v31 = v15;
    v16 = v6[1];
    v24 = *v6;
    v25 = v16;
    v17 = v6[3];
    v26 = v6[2];
    v27 = v17;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToValue:", v18);

    objc_msgSend(v5, "addAnimation:forKey:", v11, CFSTR("stopScalingAnimation"));
  }
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("pulsingTransform"));
  v19 = v6[5];
  v23[4] = v6[4];
  v23[5] = v19;
  v20 = v6[7];
  v23[6] = v6[6];
  v23[7] = v20;
  v21 = v6[1];
  v23[0] = *v6;
  v23[1] = v21;
  v22 = v6[3];
  v23[2] = v6[2];
  v23[3] = v22;
  objc_msgSend(v5, "setTransform:", v23);

}

- (BOOL)_shouldPerformFeedback
{
  return 1;
}

- (void)_prepareFeedback
{
  if (-[CEKSlider2D _shouldPerformFeedback](self, "_shouldPerformFeedback"))
    -[CEKSelectionFeedbackGenerator prepareFeedback](self->__selectionFeedbackGenerator, "prepareFeedback");
}

- (void)_performFeedback
{
  if (-[CEKSlider2D _shouldPerformFeedback](self, "_shouldPerformFeedback"))
    -[CEKSelectionFeedbackGenerator performFeedback](self->__selectionFeedbackGenerator, "performFeedback");
}

- (CGPoint)value
{
  double x;
  double y;
  CGPoint result;

  x = self->_value.x;
  y = self->_value.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)defaultValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_defaultValue.x;
  y = self->_defaultValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)snapTouchesToDefaultValue
{
  return self->_snapTouchesToDefaultValue;
}

- (void)setSnapTouchesToDefaultValue:(BOOL)a3
{
  self->_snapTouchesToDefaultValue = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (BOOL)isPulsingValueIndicator
{
  return self->_pulsingValueIndicator;
}

- (UIView)_backgroundSnapshotView1
{
  return self->__backgroundSnapshotView1;
}

- (UIView)_backgroundSnapshotView2
{
  return self->__backgroundSnapshotView2;
}

- (UIView)_backgroundSnapshotContainerView
{
  return self->__backgroundSnapshotContainerView;
}

- (UIImageView)_backgroundImageView
{
  return self->__backgroundImageView;
}

- (UIView)_gradientsView
{
  return self->__gradientsView;
}

- (UIImageView)_gridView
{
  return self->__gridView;
}

- (UIView)_valueIndicator
{
  return self->__valueIndicator;
}

- (UIView)_defaultValueIndicator
{
  return self->__defaultValueIndicator;
}

- (BOOL)_active
{
  return self->__active;
}

- (void)set_active:(BOOL)a3
{
  self->__active = a3;
}

- (UILongPressGestureRecognizer)_pressGestureRecognizer
{
  return self->__pressGestureRecognizer;
}

- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator
{
  return self->__selectionFeedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__defaultValueIndicator, 0);
  objc_storeStrong((id *)&self->__valueIndicator, 0);
  objc_storeStrong((id *)&self->__gridView, 0);
  objc_storeStrong((id *)&self->__gradientsView, 0);
  objc_storeStrong((id *)&self->__backgroundImageView, 0);
  objc_storeStrong((id *)&self->__backgroundSnapshotContainerView, 0);
  objc_storeStrong((id *)&self->__backgroundSnapshotView2, 0);
  objc_storeStrong((id *)&self->__backgroundSnapshotView1, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

@end
