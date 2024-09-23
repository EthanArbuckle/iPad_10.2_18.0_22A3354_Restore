@implementation CUShutterButton

+ (CUShutterButton)shutterButtonWithLayoutStyle:(int64_t)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _OWORD v11[2];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  CAMShutterButtonSpecForLayoutStyle(a3, (uint64_t)&v13);
  v5 = objc_alloc((Class)a1);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11[0] = v13;
  v11[1] = v14;
  v12 = v15;
  return (CUShutterButton *)(id)objc_msgSend(v5, "initWithFrame:layoutStyle:spec:", a3, v11, v6, v7, v8, v9);
}

- (CUShutterButton)initWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4 spec:(CAMShutterButtonSpec *)a5
{
  CUShutterButton *v7;
  CUShutterButton *v8;
  __int128 v9;
  _OWORD v11[2];
  double interRingSpacing;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CUShutterButton;
  v7 = -[CUShutterButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v9 = *(_OWORD *)&a5->stopSquareSideLength;
    v11[0] = *(_OWORD *)&a5->outerRingDiameter;
    v11[1] = v9;
    interRingSpacing = a5->interRingSpacing;
    -[CUShutterButton _commonCAMShutterButtonInitializationWithLayoutStyle:spec:](v7, "_commonCAMShutterButtonInitializationWithLayoutStyle:spec:", a4, v11);
  }
  return v8;
}

- (void)_commonCAMShutterButtonInitializationWithLayoutStyle:(int64_t)a3 spec:(CAMShutterButtonSpec *)a4
{
  CAMShutterButtonSpec *p_spec;
  __int128 v6;
  __int128 v7;
  UIColor *v8;
  UIColor *contentColor;
  CAMShutterButtonRingView *v10;
  __int128 v11;
  CAMShutterButtonRingView *v12;
  CAMShutterButtonRingView *outerView;
  id v14;
  UIView *v15;
  UIView *innerView;
  _OWORD v17[2];
  double interRingSpacing;

  self->_mode = 0;
  p_spec = &self->_spec;
  v6 = *(_OWORD *)&a4->outerRingDiameter;
  v7 = *(_OWORD *)&a4->stopSquareSideLength;
  self->_spec.interRingSpacing = a4->interRingSpacing;
  *(_OWORD *)&self->_spec.outerRingDiameter = v6;
  *(_OWORD *)&self->_spec.stopSquareSideLength = v7;
  self->_layoutStyle = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  contentColor = self->_contentColor;
  self->_contentColor = v8;

  v10 = [CAMShutterButtonRingView alloc];
  v11 = *(_OWORD *)&p_spec->stopSquareSideLength;
  v17[0] = *(_OWORD *)&p_spec->outerRingDiameter;
  v17[1] = v11;
  interRingSpacing = p_spec->interRingSpacing;
  v12 = -[CAMShutterButtonRingView initWithSpec:](v10, "initWithSpec:", v17);
  outerView = self->__outerView;
  self->__outerView = v12;

  v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v15 = (UIView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  innerView = self->__innerView;
  self->__innerView = v15;

  -[CAMShutterButtonRingView setUserInteractionEnabled:](self->__outerView, "setUserInteractionEnabled:", 0);
  -[UIView setUserInteractionEnabled:](self->__innerView, "setUserInteractionEnabled:", 0);
  -[CUShutterButton addSubview:](self, "addSubview:", self->__outerView);
  -[CUShutterButton addSubview:](self, "addSubview:", self->__innerView);
  -[CUShutterButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  -[CUShutterButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", 0);
  -[CUShutterButton setShowsTouchWhenHighlighted:](self, "setShowsTouchWhenHighlighted:", 0);
  -[CUShutterButton _updateOuterAndInnerLayers](self, "_updateOuterAndInnerLayers");
}

- (void)_updateOuterAndInnerLayers
{
  int64_t v3;
  _BOOL4 v4;
  void *v5;
  id v6;
  UIImageView *v7;
  UIImageView *outerImageView;
  void *v9;
  CAMTimelapseShutterRingView *v10;
  CAMTimelapseShutterRingView *v11;
  CAMTimelapseShutterRingView *timelapseOuterView;
  id v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  id v20;
  UIView *innerViewContrastView;
  CAMShutterButtonContrastBackground *v22;
  UIView *v23;
  double v24;
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;

  v3 = -[CUShutterButton mode](self, "mode");
  v4 = +[CAMShutterUtilities shouldUseImageViewForMode:](CAMShutterUtilities, "shouldUseImageViewForMode:", v3);
  -[CUShutterButton _innerView](self, "_innerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!self->__outerImageView)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3890]);
      -[CAMShutterButtonRingView frame](self->__outerView, "frame");
      v7 = (UIImageView *)objc_msgSend(v6, "initWithFrame:");
      outerImageView = self->__outerImageView;
      self->__outerImageView = v7;

      -[CUShutterButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->__outerImageView, self->__outerView);
    }
    -[CUShutterButton _outerImageForMode:layoutStyle:](self, "_outerImageForMode:layoutStyle:", v3, self->_layoutStyle);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->__outerImageView, "setImage:", v9);

  }
  if (+[CAMShutterUtilities shouldUseTimelapseOuterViewForMode:](CAMShutterUtilities, "shouldUseTimelapseOuterViewForMode:", v3)&& !self->__timelapseOuterView)
  {
    v26 = 0u;
    v27 = 0u;
    -[CUShutterButton _timelapseRingSpecForLayoutStyle:](self, "_timelapseRingSpecForLayoutStyle:", self->_layoutStyle);
    v10 = [CAMTimelapseShutterRingView alloc];
    -[CAMShutterButtonRingView frame](self->__outerView, "frame");
    v25[0] = v26;
    v25[1] = v27;
    v11 = -[CAMTimelapseShutterRingView initWithFrame:spec:](v10, "initWithFrame:spec:", v25);
    timelapseOuterView = self->__timelapseOuterView;
    self->__timelapseOuterView = v11;

    -[CUShutterButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->__timelapseOuterView, self->__outerView);
  }
  if (-[CUShutterButton _shouldShowBackgroundViewForMode:](self, "_shouldShowBackgroundViewForMode:", v3))
  {
    -[CUShutterButton _stopModeBackground](self, "_stopModeBackground");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v13, "setUserInteractionEnabled:", 0);
      -[CUShutterButton set_stopModeBackground:](self, "set_stopModeBackground:", v13);
      -[CUShutterButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v13, v5);
    }
    -[CUShutterButton stopModeBackgroundColor](self, "stopModeBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

  }
  v15 = -[CUShutterButton _shouldShowContrastBorderForMode:layoutStyle:](self, "_shouldShowContrastBorderForMode:layoutStyle:", v3, self->_layoutStyle);
  -[CUShutterButton _outerView](self, "_outerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShowContrastBorder:", v15);
  -[CUShutterButton _contentColor](self, "_contentColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setColor:", v17);

  v18 = -[CUShutterButton isSpinning](self, "isSpinning");
  objc_msgSend(v5, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUShutterButton _innerCircleColorForMode:spinning:](self, "_innerCircleColorForMode:spinning:", v3, v18);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "setBackgroundColor:", objc_msgSend(v20, "CGColor"));

  innerViewContrastView = self->__innerViewContrastView;
  if (v15)
  {
    if (!innerViewContrastView)
    {
      v22 = objc_alloc_init(CAMShutterButtonContrastBackground);
      v23 = self->__innerViewContrastView;
      self->__innerViewContrastView = &v22->super;

      -[UIView setUserInteractionEnabled:](self->__innerViewContrastView, "setUserInteractionEnabled:", 0);
      -[CUShutterButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->__innerViewContrastView, self->__innerView);
      innerViewContrastView = self->__innerViewContrastView;
    }
    v24 = 1.0;
  }
  else
  {
    v24 = 0.0;
  }
  -[UIView setAlpha:](innerViewContrastView, "setAlpha:", v24);

}

- (int64_t)mode
{
  return self->_mode;
}

- (UIView)_innerView
{
  return self->__innerView;
}

- (BOOL)_shouldShowBackgroundViewForMode:(int64_t)a3
{
  void *v4;
  BOOL v5;

  -[CUShutterButton stopModeBackgroundColor](self, "stopModeBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = +[CAMShutterUtilities isStopMode:](CAMShutterUtilities, "isStopMode:", a3);
  else
    v5 = 0;

  return v5;
}

- (UIColor)stopModeBackgroundColor
{
  return self->_stopModeBackgroundColor;
}

- (BOOL)_shouldShowContrastBorderForMode:(int64_t)a3 layoutStyle:(int64_t)a4
{
  if (a4 == 1)
    return ((unint64_t)a3 < 0xA) & (0x231u >> a3);
  else
    return 0;
}

- (CAMShutterButtonRingView)_outerView
{
  return self->__outerView;
}

- (id)_contentColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[CUShutterButton contentColor](self, "contentColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (BOOL)isSpinning
{
  return self->_spinning;
}

- (id)_innerCircleColorForMode:(int64_t)a3 spinning:(BOOL)a4
{
  double v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  if (a4)
    v6 = 0.2;
  else
    v6 = 1.0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.camera.lockscreen"));
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "featureDevelopmentShowLockIndicator");

  if ((unint64_t)a3 > 9)
  {
    v12 = 0;
  }
  else if (((1 << a3) & 0x1CE) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.961, 0.2, 0.2, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v11 & v9) == 1)
      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    else
      -[CUShutterButton _contentColor](self, "_contentColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)setMode:(int64_t)a3
{
  -[CUShutterButton setMode:animated:](self, "setMode:animated:", a3, 0);
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  int64_t mode;
  _BOOL8 v5;

  mode = self->_mode;
  if (mode != a3)
  {
    v5 = a4;
    self->_mode = a3;
    -[CUShutterButton _updateOuterAndInnerLayers](self, "_updateOuterAndInnerLayers");
    -[CUShutterButton _performModeSwitchAnimationFromMode:toMode:animated:](self, "_performModeSwitchAnimationFromMode:toMode:animated:", mode, self->_mode, v5);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setShowDisabled:(BOOL)a3
{
  if (self->_showDisabled != a3)
  {
    self->_showDisabled = a3;
    -[CUShutterButton _performModeSwitchAnimationFromMode:toMode:animated:](self, "_performModeSwitchAnimationFromMode:toMode:animated:", -[CUShutterButton mode](self, "mode"), -[CUShutterButton mode](self, "mode"), 0);
  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CUShutterButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tappableEdgeInsets.top;
  left = self->_tappableEdgeInsets.left;
  bottom = self->_tappableEdgeInsets.bottom;
  right = self->_tappableEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
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
  int64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;

  v35.receiver = self;
  v35.super_class = (Class)CUShutterButton;
  -[CUShutterButton layoutSubviews](&v35, sel_layoutSubviews);
  -[CUShutterButton bounds](self, "bounds");
  -[CUShutterButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->__outerImageView, "setFrame:");
  -[CAMTimelapseShutterRingView setFrame:](self->__timelapseOuterView, "setFrame:", v4, v6, v8, v10);
  v11 = -[CUShutterButton mode](self, "mode");
  -[CUShutterButton _outerView](self, "_outerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frameForAlignmentRect:", v4, v6, v8, v10);
  objc_msgSend(v12, "setFrame:");
  -[CUShutterButton _innerView](self, "_innerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C9D648];
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[CUShutterButton _sizeForMode:](self, "_sizeForMode:", v11);
  v17 = v16;
  v19 = v18;
  UIRectGetCenter();
  v21 = v20;
  v23 = v22;
  objc_msgSend(v13, "setBounds:", v14, v15, v17, v19);
  objc_msgSend(v13, "setCenter:", v21, v23);
  -[CUShutterButton _innerViewContrastView](self, "_innerViewContrastView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = CAMPixelWidthForView(self);
  UIRectCenteredAboutPointScale();
  v37 = CGRectInset(v36, -v25, -v25);
  objc_msgSend(v24, "frameForAlignmentRect:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
  objc_msgSend(v24, "setBounds:", 0.0, 0.0);
  objc_msgSend(v24, "setCenter:", v21, v23);
  -[CUShutterButton _cornerRadiusForMode:](self, "_cornerRadiusForMode:", v11);
  v27 = v26;
  objc_msgSend(v13, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCornerRadius:", v27);
  if (-[CUShutterButton _shouldShowBackgroundViewForMode:](self, "_shouldShowBackgroundViewForMode:", v11))
  {
    -[CUShutterButton _stopModeBackground](self, "_stopModeBackground");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUShutterButton _sizeForMode:](self, "_sizeForMode:", 0);
    objc_msgSend(v29, "setBounds:", v14, v15, v30, v31);
    objc_msgSend(v29, "setCenter:", v21, v23);
    -[CUShutterButton _cornerRadiusForMode:](self, "_cornerRadiusForMode:", 0);
    v33 = v32;
    objc_msgSend(v29, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCornerRadius:", v33);

  }
}

- (CGSize)_sizeForMode:(int64_t)a3
{
  _BOOL4 v4;
  double v5;
  double v6;
  CGSize result;

  v4 = +[CAMShutterUtilities isStopMode:](CAMShutterUtilities, "isStopMode:", a3);
  -[CUShutterButton spec](self, "spec");
  if (v4)
    v5 = 0.0;
  else
    v5 = (0.0 + 0.0) * -2.0 + 0.0;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CAMShutterButtonSpec)spec
{
  __int128 v3;

  v3 = *(_OWORD *)&self[22].stopSquareCornerRadius;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[22].outerRingStrokeWidth;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[23].outerRingDiameter;
  return self;
}

- (double)_cornerRadiusForMode:(int64_t)a3
{
  _BOOL4 v4;

  v4 = +[CAMShutterUtilities isStopMode:](CAMShutterUtilities, "isStopMode:", a3);
  -[CUShutterButton spec](self, "spec");
  if (v4)
    return 0.0;
  else
    return ceil(((0.0 + 0.0) * -2.0 + 0.0) * 0.5);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if ((-[CUShutterButton isEnabled](self, "isEnabled") & 1) == 0)
  {
    if (-[CUShutterButton pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v10, "shutterButtonTouchAttemptedWhileDisabled:", self);

      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CUShutterButton;
  -[CUShutterButton hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CUShutterButton isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)CUShutterButton;
  -[CUShutterButton setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != v3)
    -[CUShutterButton _performHighlightAnimation](self, "_performHighlightAnimation");
}

- (void)_performHighlightAnimation
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CATransform3D v21;
  CATransform3D v22;
  CATransform3D v23;

  v3 = -[CUShutterButton isHighlighted](self, "isHighlighted");
  -[CUShutterButton _innerView](self, "_innerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUShutterButton _innerViewContrastView](self, "_innerViewContrastView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMass:", 0.8);
  objc_msgSend(v8, "setVelocity:", 0.0);
  if (v3)
    v9 = 0.9;
  else
    v9 = 1.0;
  if (v3)
    v10 = 12.0;
  else
    v10 = 100.0;
  UIAnimationDragCoefficient();
  v12 = v11;
  objc_msgSend(v8, "setDamping:", v10 / v11);
  objc_msgSend(v8, "setStiffness:", 300.0 / (float)(v12 * v12));
  objc_msgSend(v8, "durationForEpsilon:", 0.01);
  objc_msgSend(v8, "setDuration:");
  LODWORD(v13) = 1045220557;
  LODWORD(v14) = 0.5;
  LODWORD(v15) = 1.0;
  LODWORD(v16) = 1045220557;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v13, v16, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v17);

  objc_msgSend(v5, "presentationLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForKeyPath:", CFSTR("transform.scale.xy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v20);

  objc_msgSend(v5, "addAnimation:forKey:", v8, CFSTR("highlightScaleAnimation"));
  objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("highlightScaleAnimation"));
  memset(&v23, 0, sizeof(v23));
  CATransform3DMakeScale(&v23, v9, v9, 1.0);
  v22 = v23;
  objc_msgSend(v5, "setTransform:", &v22);
  v21 = v23;
  objc_msgSend(v7, "setTransform:", &v21);

}

- (void)setSpinning:(BOOL)a3
{
  if (self->_spinning != a3)
  {
    self->_spinning = a3;
    -[CUShutterButton _updateSpinningAnimations](self, "_updateSpinningAnimations");
  }
}

+ (id)smallShutterButton
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cam_initialLayoutStyle");

  return (id)objc_msgSend(a1, "smallShutterButtonWithLayoutStyle:", v4);
}

+ (id)shutterButton
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cam_initialLayoutStyle");

  return (id)objc_msgSend(a1, "shutterButtonWithLayoutStyle:", v4);
}

+ (CUShutterButton)shutterButtonWithSpec:(CAMShutterButtonSpec *)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  _OWORD v14[2];
  double interRingSpacing;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cam_initialLayoutStyle");

  v7 = objc_alloc((Class)a1);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = *(_OWORD *)&a3->stopSquareSideLength;
  v14[0] = *(_OWORD *)&a3->outerRingDiameter;
  v14[1] = v12;
  interRingSpacing = a3->interRingSpacing;
  return (CUShutterButton *)(id)objc_msgSend(v7, "initWithFrame:layoutStyle:spec:", v6, v14, v8, v9, v10, v11);
}

+ (id)smallShutterButtonWithLayoutStyle:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v16[2];
  __int128 v17;
  uint64_t v18;

  if (a3 == 4)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = 1.0 / v6;

    v8 = v7 + 55.0;
    v9 = 5.0 - v7;
  }
  else
  {
    v9 = 5.0;
    v8 = 47.0;
  }
  v10 = objc_alloc((Class)a1);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  *(double *)v16 = v8;
  *(double *)&v16[1] = v9;
  v17 = xmmword_1DB9A6BE0;
  v18 = 0x4000000000000000;
  return (id)objc_msgSend(v10, "initWithFrame:layoutStyle:spec:", a3, v16, v11, v12, v13, v14);
}

- (CUShutterButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  _OWORD v11[2];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cam_initialLayoutStyle");

  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  CAMShutterButtonSpecForLayoutStyle(v9, (uint64_t)&v13);
  v11[0] = v13;
  v11[1] = v14;
  v12 = v15;
  return -[CUShutterButton initWithFrame:layoutStyle:spec:](self, "initWithFrame:layoutStyle:spec:", v9, v11, x, y, width, height);
}

- (CUShutterButton)initWithCoder:(id)a3
{
  CUShutterButton *v3;
  void *v4;
  uint64_t v5;
  CUShutterButton *v6;
  _OWORD v8[2];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CUShutterButton;
  v3 = -[CUShutterButton initWithCoder:](&v13, sel_initWithCoder_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

    v12 = 0;
    v10 = 0u;
    v11 = 0u;
    CAMShutterButtonSpecForLayoutStyle(v5, (uint64_t)&v10);
    v8[0] = v10;
    v8[1] = v11;
    v9 = v12;
    -[CUShutterButton _commonCAMShutterButtonInitializationWithLayoutStyle:spec:](v3, "_commonCAMShutterButtonInitializationWithLayoutStyle:spec:", v5, v8);
    v6 = v3;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  double outerRingDiameter;
  double v3;
  CGSize result;

  outerRingDiameter = self->_spec.outerRingDiameter;
  v3 = outerRingDiameter;
  result.height = v3;
  result.width = outerRingDiameter;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double outerRingDiameter;
  double v4;
  CGSize result;

  outerRingDiameter = self->_spec.outerRingDiameter;
  v4 = outerRingDiameter;
  result.height = v4;
  result.width = outerRingDiameter;
  return result;
}

- (void)setContentColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_contentColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentColor, a3);
    -[CUShutterButton _updateOuterAndInnerLayers](self, "_updateOuterAndInnerLayers");
  }

}

- (void)setStopModeBackgroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_stopModeBackgroundColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_stopModeBackgroundColor, a3);
    -[CUShutterButton _updateOuterAndInnerLayers](self, "_updateOuterAndInnerLayers");
  }

}

- (void)setSpec:(CAMShutterButtonSpec *)a3
{
  double interRingSpacing;
  __int128 v5;
  CAMShutterButtonRingView *outerView;
  __int128 v7;
  _OWORD v8[2];
  double v9;

  interRingSpacing = a3->interRingSpacing;
  v5 = *(_OWORD *)&a3->stopSquareSideLength;
  *(_OWORD *)&self->_spec.outerRingDiameter = *(_OWORD *)&a3->outerRingDiameter;
  *(_OWORD *)&self->_spec.stopSquareSideLength = v5;
  self->_spec.interRingSpacing = interRingSpacing;
  outerView = self->__outerView;
  v7 = *(_OWORD *)&a3->stopSquareSideLength;
  v8[0] = *(_OWORD *)&a3->outerRingDiameter;
  v8[1] = v7;
  v9 = a3->interRingSpacing;
  -[CAMShutterButtonRingView setSpec:](outerView, "setSpec:", v8);
  -[CUShutterButton _updateOuterAndInnerLayers](self, "_updateOuterAndInnerLayers");
}

- (id)_outerImageForMode:(int64_t)a3 layoutStyle:(int64_t)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 == 2 || a3 == 7)
    v5 = CFSTR("CAMShutterButtonSlomo");
  else
    v5 = 0;
  if (a4 == 4)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("Phone"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- ($EA90F2AF3C0DC35AB2D8304CE3BCA89E)_timelapseRingSpecForLayoutStyle:(SEL)a3
{
  $EA90F2AF3C0DC35AB2D8304CE3BCA89E *result;

  retstr->var2 = 0.0;
  retstr->var3 = 0.0;
  *(_OWORD *)&retstr->var0 = xmmword_1DB9A6BF0;
  retstr->var2 = CAMPixelWidthForView(self) + 3.0;
  retstr->var3 = CAMPixelWidthForView(self) + 5.0;
  if (a4 == 4)
  {
    retstr->var2 = 4.0 - CAMPixelWidthForView(self);
    retstr->var3 = 6.0;
  }
  return result;
}

- (void)_performModeSwitchAnimationFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  void *v19;
  int v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  float v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  void *v49;
  _BOOL4 v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  float v57;
  float v58;
  void *v59;
  void *v60;
  uint64_t v61;
  double v62;
  double v63;
  _BOOL4 v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  float v70;
  float v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  BOOL v128;
  uint64_t v129;
  _BOOL4 v130;
  void *v131;
  void *v132;
  void *v133;
  int64_t v134;
  int64_t v135;
  int64_t v136;
  int64_t v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  _BOOL4 v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  _BOOL4 v148;
  void *v149;
  uint64_t v150;
  void *v151;
  id v152;

  v5 = a5;
  -[CUShutterButton _innerView](self, "_innerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v152 = (id)objc_claimAutoreleasedReturnValue();

  -[CUShutterButton _outerView](self, "_outerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = objc_claimAutoreleasedReturnValue();

  -[CUShutterButton _outerImageView](self, "_outerImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUShutterButton _stopModeBackground](self, "_stopModeBackground");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUShutterButton _timelapseOuterView](self, "_timelapseOuterView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[CUShutterButton isSpinning](self, "isSpinning");
  -[CUShutterButton _innerCircleColorForMode:spinning:](self, "_innerCircleColorForMode:spinning:", a4, v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "CGColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v148 = v17;
  v20 = v5 && ~v17;
  HIDWORD(v150) = +[CAMShutterUtilities shouldUseImageViewForMode:](CAMShutterUtilities, "shouldUseImageViewForMode:", a4);
  LODWORD(v150) = +[CAMShutterUtilities shouldUseTimelapseOuterViewForMode:](CAMShutterUtilities, "shouldUseTimelapseOuterViewForMode:", a4);
  v143 = -[CUShutterButton _shouldShowBackgroundViewForMode:](self, "_shouldShowBackgroundViewForMode:", a4);
  if (-[CUShutterButton showDisabled](self, "showDisabled"))
    v21 = 0.4;
  else
    v21 = 1.0;
  v138 = v20;
  v149 = v19;
  if (v20 == 1)
  {
    objc_msgSend(v152, "presentationLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = (void *)v11;
    v134 = a4;
    v136 = a3;
    v132 = v15;
    if (v22)
    {
      objc_msgSend(v152, "presentationLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueForKeyPath:", CFSTR("backgroundColor"));
      v24 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v152, "valueForKeyPath:", CFSTR("backgroundColor"));
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v141 = (void *)v24;

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("backgroundColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFromValue:", v24);
    objc_msgSend(v25, "setToValue:", v19);
    UIAnimationDragCoefficient();
    objc_msgSend(v25, "setDuration:", v26 * 0.25);
    v27 = *MEMORY[0x1E0CD3048];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTimingFunction:", v28);

    v29 = *MEMORY[0x1E0CD2B58];
    objc_msgSend(v25, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v152, "addAnimation:forKey:", v25, CFSTR("backgroundColorAnimation"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[UIView alpha](self->__innerView, "alpha");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFromValue:", v32);

    UIAnimationDragCoefficient();
    objc_msgSend(v30, "setDuration:", v33 * 0.25);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v27);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTimingFunction:", v34);

    objc_msgSend(v30, "setFillMode:", v29);
    objc_msgSend(v152, "addAnimation:forKey:", v30, CFSTR("opacity"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMShutterButtonRingView alpha](self->__outerView, "alpha");
    objc_msgSend(v36, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFromValue:", v37);

    UIAnimationDragCoefficient();
    objc_msgSend(v35, "setDuration:", v38 * 0.25);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v27);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTimingFunction:", v39);

    objc_msgSend(v35, "setFillMode:", v29);
    objc_msgSend(v145, "addAnimation:forKey:", v35, CFSTR("opacity"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[UIImageView alpha](self->__outerImageView, "alpha");
    objc_msgSend(v41, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFromValue:", v42);

    UIAnimationDragCoefficient();
    objc_msgSend(v40, "setDuration:", v43 * 0.25);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v27);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTimingFunction:", v44);

    objc_msgSend(v40, "setFillMode:", v29);
    objc_msgSend(v13, "addAnimation:forKey:", v40, CFSTR("opacity"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMTimelapseShutterRingView alpha](self->__timelapseOuterView, "alpha");
    objc_msgSend(v46, "numberWithDouble:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFromValue:", v47);

    UIAnimationDragCoefficient();
    objc_msgSend(v45, "setDuration:", v48 * 0.25);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v27);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTimingFunction:", v49);

    objc_msgSend(v45, "setFillMode:", v29);
    objc_msgSend(v151, "addAnimation:forKey:", v45, CFSTR("opacity"));

    v19 = v149;
    v11 = (uint64_t)v145;

    a4 = v134;
    a3 = v136;
    v15 = v132;
  }
  v50 = +[CAMShutterUtilities isStopMode:](CAMShutterUtilities, "isStopMode:", a4);
  v51 = +[CAMShutterUtilities isStopMode:](CAMShutterUtilities, "isStopMode:", a3);
  if (v50)
  {
    -[CUShutterButton _sizeForMode:](self, "_sizeForMode:", a4);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)MEMORY[0x1E0CB37E8];
    -[CUShutterButton _cornerRadiusForMode:](self, "_cornerRadiusForMode:", a4);
    objc_msgSend(v52, "numberWithDouble:");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0.0;
    if (v143)
      v54 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)v11;
    if (v138)
    {
      UIAnimationDragCoefficient();
      v58 = v57;
      objc_msgSend(v152, "presentationLayer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = a4;
      v137 = a3;
      v133 = v13;
      v131 = v55;
      if (v59)
      {
        objc_msgSend(v152, "presentationLayer");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "valueForKeyPath:", CFSTR("bounds.size"));
        v61 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v152, "valueForKeyPath:", CFSTR("bounds.size"));
        v61 = objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds.size"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setFromValue:", v61);
      objc_msgSend(v77, "setToValue:", v142);
      objc_msgSend(v77, "setMass:", 0.8);
      v78 = v58;
      objc_msgSend(v77, "setDamping:", 22.0 / v58);
      objc_msgSend(v77, "setStiffness:", 300.0 / (float)(v58 * v58));
      objc_msgSend(v77, "durationForEpsilon:", 0.01);
      objc_msgSend(v77, "setDuration:");
      LODWORD(v79) = 1060320051;
      LODWORD(v80) = 0.25;
      LODWORD(v81) = 1.0;
      LODWORD(v82) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v80, v82, v79, v81);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setTimingFunction:", v83);

      v84 = *MEMORY[0x1E0CD2B58];
      objc_msgSend(v77, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v152, "presentationLayer");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = (void *)v61;
      v73 = v15;
      if (v85)
      {
        objc_msgSend(v152, "presentationLayer");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "valueForKeyPath:", CFSTR("cornerRadius"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v152, "valueForKeyPath:", CFSTR("cornerRadius"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setFromValue:", v87);
      objc_msgSend(v88, "setToValue:", v53);
      objc_msgSend(v88, "setDuration:", v78 * 0.12);
      LODWORD(v89) = 1041865114;
      LODWORD(v90) = 1043207291;
      LODWORD(v91) = 1061997773;
      LODWORD(v92) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v89, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setTimingFunction:", v93);

      objc_msgSend(v88, "setFillMode:", v84);
      objc_msgSend(v152, "addAnimation:forKey:", v77, CFSTR("sizeAnimation"));
      objc_msgSend(v152, "addAnimation:forKey:", v88, CFSTR("cornerRadiusAnimation"));
      if (v143)
      {
        objc_msgSend(v15, "presentationLayer");
        v94 = objc_claimAutoreleasedReturnValue();
        v95 = (void *)v94;
        if (v94)
          v96 = (void *)v94;
        else
          v96 = v15;
        v97 = v96;

        objc_msgSend(v97, "valueForKeyPath:", CFSTR("opacity"));
        v146 = v56;
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setFromValue:", v98);
        objc_msgSend(v99, "setToValue:", v131);
        objc_msgSend(v99, "setDuration:", v78 * 0.25);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setTimingFunction:", v100);

        v73 = v15;
        objc_msgSend(v15, "addAnimation:forKey:", v99, CFSTR("opacityAnimation"));

        v56 = v146;
      }

      v76 = v152;
LABEL_42:
      a4 = v135;
      a3 = v137;
      v13 = v133;
      v15 = v73;
      v55 = v131;
      goto LABEL_43;
    }
  }
  else
  {
    v56 = (void *)v11;
    if (!v51)
      goto LABEL_44;
    -[CUShutterButton _sizeForMode:](self, "_sizeForMode:", a4);
    v63 = v62;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(v63 * 0.5));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[CUShutterButton _shouldShowBackgroundViewForMode:](self, "_shouldShowBackgroundViewForMode:", a3);
    v65 = 0.0;
    if (v143)
      v65 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v65);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v138)
    {
      LODWORD(v67) = 1045220557;
      LODWORD(v68) = 1051931443;
      LODWORD(v66) = 0;
      LODWORD(v69) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v66, v67, v68, v69);
      v144 = objc_claimAutoreleasedReturnValue();
      UIAnimationDragCoefficient();
      v71 = v70;
      objc_msgSend(v152, "presentationLayer");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = a4;
      v137 = a3;
      v133 = v13;
      v131 = v55;
      v130 = v64;
      v73 = v15;
      if (v72)
      {
        objc_msgSend(v152, "presentationLayer");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "valueForKeyPath:", CFSTR("bounds.size"));
        v75 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v152, "valueForKeyPath:", CFSTR("bounds.size"));
        v75 = objc_claimAutoreleasedReturnValue();
      }
      v101 = (void *)v144;

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds.size"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = (void *)v75;
      objc_msgSend(v102, "setFromValue:", v75);
      objc_msgSend(v102, "setToValue:", v142);
      v103 = v71;
      v104 = v71 * 0.25;
      objc_msgSend(v102, "setDuration:", v104);
      objc_msgSend(v102, "setTimingFunction:", v144);
      v105 = *MEMORY[0x1E0CD2B58];
      objc_msgSend(v102, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v152, "presentationLayer");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = v56;
      if (v106)
      {
        objc_msgSend(v152, "presentationLayer");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "valueForKeyPath:", CFSTR("cornerRadius"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v152, "valueForKeyPath:", CFSTR("cornerRadius"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setFromValue:", v108);
      objc_msgSend(v109, "setToValue:", v53);
      objc_msgSend(v109, "setDuration:", v103 * 0.22);
      objc_msgSend(v109, "setTimingFunction:", v144);
      objc_msgSend(v109, "setFillMode:", v105);
      objc_msgSend(v152, "addAnimation:forKey:", v102, CFSTR("sizeAnimation"));
      objc_msgSend(v152, "addAnimation:forKey:", v109, CFSTR("cornerRadiusAnimation"));
      if (v130)
      {
        v110 = v73;
        objc_msgSend(v73, "presentationLayer");
        v111 = objc_claimAutoreleasedReturnValue();
        v112 = (void *)v111;
        if (v111)
          v113 = (void *)v111;
        else
          v113 = v73;
        v114 = v113;

        objc_msgSend(v114, "valueForKeyPath:", CFSTR("opacity"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setFromValue:", v115);
        objc_msgSend(v116, "setToValue:", v131);
        objc_msgSend(v116, "setDuration:", v104);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setTimingFunction:", v117);

        v73 = v110;
        v118 = v110;
        v101 = (void *)v144;
        objc_msgSend(v118, "addAnimation:forKey:", v116, CFSTR("opacityAnimation"));

      }
      v76 = v152;
      v56 = v147;
      goto LABEL_42;
    }
  }
  objc_msgSend(v152, "removeAllAnimations");
  objc_msgSend(v15, "removeAllAnimations");
  v76 = v152;
LABEL_43:
  objc_msgSend(v76, "setValue:forKeyPath:", v142, CFSTR("bounds.size"));
  objc_msgSend(v152, "setValue:forKeyPath:", v53, CFSTR("cornerRadius"));
  objc_msgSend(v15, "setValue:forKey:", v55, CFSTR("opacity"));

  v19 = v149;
LABEL_44:
  if (v148)
  {
    objc_msgSend(v152, "bounds");
    UIRectGetCenter();
    v120 = v119;
    v122 = v121;
    -[CUShutterButton _spinnerView](self, "_spinnerView");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setCenter:", v120, v122);

  }
  objc_msgSend(v152, "setValue:forKeyPath:", v19, CFSTR("backgroundColor"));
  *(float *)&v124 = v21;
  objc_msgSend(v152, "setOpacity:", v124);
  if (v150)
    *(float *)&v125 = 0.0;
  else
    *(float *)&v125 = v21;
  objc_msgSend(v56, "setOpacity:", v125);
  if (HIDWORD(v150))
    *(float *)&v126 = v21;
  else
    *(float *)&v126 = 0.0;
  objc_msgSend(v13, "setOpacity:", v126);
  if ((_DWORD)v150)
    *(float *)&v127 = v21;
  else
    *(float *)&v127 = 0.0;
  objc_msgSend(v151, "setOpacity:", v127);
  v128 = a3 == 3 && a4 == 8;
  v129 = v128;
  if (v128 || a3 == 8)
    -[CAMTimelapseShutterRingView setAnimating:](self->__timelapseOuterView, "setAnimating:", v129);

}

- (BOOL)_isSpinningSupportedForLayoutStyle:(int64_t)a3
{
  return a3 != 2;
}

- (void)_updateSpinningAnimations
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __CFString *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;

  v3 = -[CUShutterButton isSpinning](self, "isSpinning");
  v4 = -[CUShutterButton _isSpinningSupportedForLayoutStyle:](self, "_isSpinningSupportedForLayoutStyle:", -[CUShutterButton layoutStyle](self, "layoutStyle")) & v3;
  -[CUShutterButton _innerView](self, "_innerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUShutterButton _spinnerView](self, "_spinnerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[CAMShutterUtilities spinnerViewForLayoutStyle:](CAMShutterUtilities, "spinnerViewForLayoutStyle:", -[CUShutterButton layoutStyle](self, "layoutStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUShutterButton set_spinnerView:](self, "set_spinnerView:", v6);
  }
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUShutterButton _innerCircleColorForMode:spinning:](self, "_innerCircleColorForMode:spinning:", -[CUShutterButton mode](self, "mode"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "addSubview:", v6);
    objc_msgSend(v5, "bounds");
    UIRectGetCenter();
    objc_msgSend(v6, "setCenter:");
    -[CUShutterButton spec](self, "spec");
    objc_msgSend(v6, "setBounds:", 0.0, 0.0, v22 + (v23 + v24) * -2.0, v22 + (v23 + v24) * -2.0);
    objc_msgSend(v5, "setBackgroundColor:", v8);
    objc_msgSend(v6, "setAlpha:", 1.0);
    objc_msgSend(v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("sizeAnimation"));

    objc_msgSend(v5, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAnimationForKey:", CFSTR("backgroundColorAnimation"));

    +[CAMShutterUtilities spinnerAnimation](CAMShutterUtilities, "spinnerAnimation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v11, CFSTR("spinnerRotation"));
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __44__CUShutterButton__updateSpinningAnimations__block_invoke;
    v18[3] = &unk_1EA329360;
    v19 = v5;
    v20 = v8;
    v21 = v6;
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __44__CUShutterButton__updateSpinningAnimations__block_invoke_2;
    v14[3] = &unk_1EA32C128;
    v14[4] = self;
    v15 = v21;
    v16 = v7;
    v17 = CFSTR("spinnerRotation");
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 327680, v18, v14, 0.3, 0.0);

    v11 = v19;
  }

}

uint64_t __44__CUShutterButton__updateSpinningAnimations__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

uint64_t __44__CUShutterButton__updateSpinningAnimations__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSpinning");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    return objc_msgSend(*(id *)(a1 + 48), "removeAnimationForKey:", *(_QWORD *)(a1 + 56));
  }
  return result;
}

- (void)setLayoutStyle:(int64_t)a3
{
  int64_t layoutStyle;
  _BOOL4 v6;
  _OWORD v7[2];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  layoutStyle = self->_layoutStyle;
  if (layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    CAMShutterButtonSpecForLayoutStyle(a3, (uint64_t)&v9);
    v7[0] = v9;
    v7[1] = v10;
    v8 = v11;
    -[CUShutterButton setSpec:](self, "setSpec:", v7);
    v6 = -[CUShutterButton _isSpinningSupportedForLayoutStyle:](self, "_isSpinningSupportedForLayoutStyle:", layoutStyle);
    if (v6 != -[CUShutterButton _isSpinningSupportedForLayoutStyle:](self, "_isSpinningSupportedForLayoutStyle:", a3))
      -[CUShutterButton _updateSpinningAnimations](self, "_updateSpinningAnimations");
  }
}

- (CAMShutterButtonDelegate)delegate
{
  return (CAMShutterButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (UIImageView)_outerImageView
{
  return self->__outerImageView;
}

- (CAMTimelapseShutterRingView)_timelapseOuterView
{
  return self->__timelapseOuterView;
}

- (UIView)_innerViewContrastView
{
  return self->__innerViewContrastView;
}

- (UIView)_stopModeBackground
{
  return self->__stopModeBackground;
}

- (void)set_stopModeBackground:(id)a3
{
  objc_storeStrong((id *)&self->__stopModeBackground, a3);
}

- (UIView)_spinnerView
{
  return self->__spinnerView;
}

- (void)set_spinnerView:(id)a3
{
  objc_storeStrong((id *)&self->__spinnerView, a3);
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__spinnerView, 0);
  objc_storeStrong((id *)&self->__stopModeBackground, 0);
  objc_storeStrong((id *)&self->__innerViewContrastView, 0);
  objc_storeStrong((id *)&self->__innerView, 0);
  objc_storeStrong((id *)&self->__timelapseOuterView, 0);
  objc_storeStrong((id *)&self->__outerImageView, 0);
  objc_storeStrong((id *)&self->__outerView, 0);
  objc_storeStrong((id *)&self->_stopModeBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
