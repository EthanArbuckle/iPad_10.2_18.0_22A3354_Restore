@implementation LPPlayButtonControl

- (LPPlayButtonControl)initWithStyle:(id)a3 theme:(id)a4
{
  id v7;
  id v8;
  LPPlayButtonControl *v9;
  LPPlayButtonControl *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  LPPlayButtonControl *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LPPlayButtonControl;
  v9 = -[LPPlayButtonControl init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_theme, a4);
    -[UIView _lp_setBackgroundColor:](v10, "_lp_setBackgroundColor:", 0);
    -[LPPlayButtonControl layer](v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    -[LPPlayButtonControl layer](v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    -[LPPlayButtonControl layer](v10, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 0);

    -[LPPlayButtonControl _createBackgroundView](v10, "_createBackgroundView");
    -[LPPlayButtonControl _createImageView](v10, "_createImageView");
    -[LPPlayButtonControl _createBorderView](v10, "_createBorderView");
    -[LPPlayButtonControl _createOuterProgressView](v10, "_createOuterProgressView");
    -[LPPlayButtonControl _createInnerProgressView](v10, "_createInnerProgressView");
    -[LPPlayButtonControl _createHighlightLayer](v10, "_createHighlightLayer");
    -[LPPlayButtonControl setShowOuterBorder:](v10, "setShowOuterBorder:", 0);
    -[LPPlayButtonControl setShowBorder:](v10, "setShowBorder:", 0);
    -[LPPlayButtonControl setPlayButtonState:](v10, "setPlayButtonState:", 0);
    -[LPPlayButtonControl hideProgressAnimated:](v10, "hideProgressAnimated:", 0);
    -[LPPlayButtonControl showPlayIndicator:](v10, "showPlayIndicator:", 1);
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[LPPlayButtonControl registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v14, sel__traitAffectingColorAppearanceDidChange_);

    v16 = v10;
  }

  return v10;
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)setPlayButtonState:(unint64_t)a3
{
  BOOL v4;
  LPAudioPlayButtonTheme *theme;
  void *v6;
  void *v7;
  UIView *backgroundView;
  _BOOL4 v9;
  LPAudioPlayButtonTheme *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  if (a3 == 1)
  {
    -[LPAudioPlayButtonTheme keyColor](self->_theme, "keyColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    if (!v6)
    {
      -[UIView _lp_tintColor](self, "_lp_tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v6);
    v7 = v12;
    if (!v12)
    {

      v7 = 0;
    }

    backgroundView = self->_backgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView _lp_setBackgroundColor:](backgroundView, "_lp_setBackgroundColor:");

    -[LPPlayButtonControl setShowOuterBorder:](self, "setShowOuterBorder:", 1);
  }
  else if (!a3)
  {
    v4 = -[LPAudioPlayButtonTheme useInvertedInactiveState](self->_theme, "useInvertedInactiveState");
    theme = self->_theme;
    if (v4)
      -[LPAudioPlayButtonTheme keyColor](theme, "keyColor");
    else
      -[LPAudioPlayButtonTheme secondaryColor](theme, "secondaryColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v9 = -[LPAudioPlayButtonTheme useInvertedInactiveState](self->_theme, "useInvertedInactiveState");
    v10 = self->_theme;
    if (v9)
      -[LPAudioPlayButtonTheme secondaryColor](v10, "secondaryColor");
    else
      -[LPAudioPlayButtonTheme keyColor](v10, "keyColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v14);
    -[UIView _lp_setBackgroundColor:](self->_backgroundView, "_lp_setBackgroundColor:", v11);
    -[LPPlayButtonControl setShowOuterBorder:](self, "setShowOuterBorder:", 0);

  }
}

- (id)playImage
{
  void *v2;
  void *v3;

  +[LPResources playButton](LPResources, "playButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platformImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pauseImage
{
  void *v2;
  void *v3;

  +[LPResources pauseButton](LPResources, "pauseButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platformImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)outerBorderColor
{
  return -[LPAudioPlayButtonTheme outerBorderColor](self->_theme, "outerBorderColor");
}

- (id)defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.933333333, 0.933333333, 0.909803922, 1.0);
}

- (CGSize)buttonSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[LPAudioPlayButtonStyle size](self->_style, "size");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (float)buttonCornerRadius
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;

  -[LPAudioPlayButtonStyle size](self->_style, "size");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "width");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = v5;
  -[LPAudioPlayButtonStyle size](self->_style, "size");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "height");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  *(float *)&v6 = fmin(v6, v9) * 0.5;

  return *(float *)&v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LPPlayButtonControl;
  -[LPPlayButtonControl layoutSubviews](&v3, sel_layoutSubviews);
  -[LPPlayButtonControl layoutPlayButton](self, "layoutPlayButton");
}

- (void)layoutPlayButton
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[LPPlayButtonControl buttonSize](self, "buttonSize");
  v4 = v3;
  v6 = v5;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v3, v5);
  -[UIView setFrame:](self->_backgroundView, "setFrame:", 0.0, 0.0, v4, v6);
}

- (void)installRecognizersOnView:(id)a3
{
  void *v4;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *highlightRecognizer;
  id v7;

  v7 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_buttonPressed_);
  objc_msgSend(v7, "addGestureRecognizer:", v4);
  v5 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__highlightLongPressRecognized_);
  highlightRecognizer = self->_highlightRecognizer;
  self->_highlightRecognizer = v5;

  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_highlightRecognizer, "setMinimumPressDuration:", 0.001);
  -[UILongPressGestureRecognizer setDelegate:](self->_highlightRecognizer, "setDelegate:", self);
  objc_msgSend(v7, "addGestureRecognizer:", self->_highlightRecognizer);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(CFSTR("_UIPreviewGestureRecognizer"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_didScroll
{
  -[UILongPressGestureRecognizer setEnabled:](self->_highlightRecognizer, "setEnabled:", 0);
  -[UILongPressGestureRecognizer setEnabled:](self->_highlightRecognizer, "setEnabled:", 1);
}

- (void)_highlightLongPressRecognized:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1)
    {
      LODWORD(v5) = 1.0;
      -[CAShapeLayer setOpacity:](self->_highlightLayer, "setOpacity:", v5);
    }
  }
  else
  {
    -[LPPlayButtonControl _hideTapHighlight](self, "_hideTapHighlight");
  }

}

- (void)_hideTapHighlight
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__LPPlayButtonControl__hideTapHighlight__block_invoke;
  v2[3] = &unk_1E44A7CE8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v2, 0, 0.47, 0.0);
}

uint64_t __40__LPPlayButtonControl__hideTapHighlight__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setOpacity:", a2);
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LPPlayButtonControl;
  -[LPPlayButtonControl setEnabled:](&v4, sel_setEnabled_, a3);
  -[LPPlayButtonControl _updateEnabledState](self, "_updateEnabledState");
}

- (void)beginIndeterminateAnimation
{
  double v2;
  CAShapeLayer *outerProgressLayer;
  void *v5;
  double v6;
  id v7;

  LODWORD(v2) = 0;
  -[LPPlayButtonControl setProgress:animated:](self, "setProgress:animated:", 0, v2);
  outerProgressLayer = self->_outerProgressLayer;
  if (!self->_indeterminate)
  {
    -[CAShapeLayer setStrokeStart:](outerProgressLayer, "setStrokeStart:", 0.12);
    self->_indeterminate = 1;
    goto LABEL_5;
  }
  -[CAShapeLayer animationForKey:](outerProgressLayer, "animationForKey:", CFSTR("spin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_5:
    -[LPPlayButtonControl _updateOuterProgressLayerStroke](self, "_updateOuterProgressLayerStroke");
    -[CAShapeLayer removeAnimationForKey:](self->_outerProgressLayer, "removeAnimationForKey:", CFSTR("spin"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", &unk_1E44EEB70);
    objc_msgSend(v7, "setToValue:", &unk_1E44F0678);
    objc_msgSend(v7, "setDuration:", 1.0);
    objc_msgSend(v7, "setCumulative:", 1);
    LODWORD(v6) = 2139095040;
    objc_msgSend(v7, "setRepeatCount:", v6);
    -[CAShapeLayer addAnimation:forKey:](self->_outerProgressLayer, "addAnimation:forKey:", v7, CFSTR("spin"));

  }
}

- (void)endIndeterminateAnimation
{
  CAShapeLayer *outerProgressLayer;
  CGAffineTransform v4;
  CGAffineTransform v5;

  if (self->_indeterminate)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[CAShapeLayer setStrokeStart:](self->_outerProgressLayer, "setStrokeStart:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    -[CAShapeLayer removeAnimationForKey:](self->_outerProgressLayer, "removeAnimationForKey:", CFSTR("spin"));
    CGAffineTransformMakeRotation(&v5, -1.57079633);
    outerProgressLayer = self->_outerProgressLayer;
    v4 = v5;
    -[CAShapeLayer setAffineTransform:](outerProgressLayer, "setAffineTransform:", &v4);
    self->_indeterminate = 0;
    -[LPPlayButtonControl _updateOuterProgressLayerStroke](self, "_updateOuterProgressLayerStroke");
  }
}

- (void)hideProgressAnimated:(BOOL)a3
{
  if (self->_showingProgress || self->_indeterminate)
  {
    -[LPPlayButtonControl endIndeterminateAnimation](self, "endIndeterminateAnimation", a3);
    -[CAShapeLayer setHidden:](self->_innerProgressLayer, "setHidden:", 1);
    -[UIView setHidden:](self->_backgroundView, "setHidden:", 0);
    -[UIView _lp_setOpacity:](self->_backgroundView, "_lp_setOpacity:", 1.0);
    -[UIImageView _lp_setOpacity:](self->_imageView, "_lp_setOpacity:", 1.0);
    self->_showingProgress = 0;
    -[LPPlayButtonControl _showPlayIndicator:](self, "_showPlayIndicator:", 1);
  }
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  double v7;
  float v8;
  double v9;
  void *v10;
  id v11;

  v7 = a3;
  -[CAShapeLayer setHidden:](self->_innerProgressLayer, "setHidden:", fabs(a3) < 0.00000011920929);
  if (!self->_showingProgress)
    -[LPPlayButtonControl _toggleToPlayState](self, "_toggleToPlayState");
  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921 && self->_indeterminate)
      -[LPPlayButtonControl endIndeterminateAnimation](self, "endIndeterminateAnimation");
    v8 = fmax(fmin(v7, 1.0), 0.0);
    self->_progress = v8;
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDuration:", 0.2);
      objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v11, "setRemovedOnCompletion:", 0);
      *(float *)&v9 = self->_progress;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setToValue:", v10);

      -[CAShapeLayer addAnimation:forKey:](self->_innerProgressLayer, "addAnimation:forKey:", v11, 0);
    }
    else
    {
      -[CAShapeLayer removeAllAnimations](self->_innerProgressLayer, "removeAllAnimations");
      -[CAShapeLayer setStrokeEnd:](self->_innerProgressLayer, "setStrokeEnd:", self->_progress);
    }
  }
}

- (void)setShowBorder:(BOOL)a3
{
  -[CAShapeLayer setHidden:](self->_borderLayer, "setHidden:", !a3);
}

- (void)setShowOuterBorder:(BOOL)a3
{
  -[CAShapeLayer setHidden:](self->_outerProgressLayer, "setHidden:", !a3);
  -[LPPlayButtonControl _updateOuterProgressLayerStroke](self, "_updateOuterProgressLayerStroke");
}

- (void)_updateOuterProgressLayerStroke
{
  id v3;

  -[LPPlayButtonControl outerBorderColor](self, "outerBorderColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_outerProgressLayer, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

}

- (id)_createProgressIndicatorLayerWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  const CGPath *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v15 = CGRectInset(v14, a4 * 0.5, a4 * 0.5);
  objc_msgSend(v9, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  CGAffineTransformMakeRotation(&v13, -1.57079633);
  v12 = v13;
  objc_msgSend(v9, "setAffineTransform:", &v12);
  objc_msgSend(v9, "setLineWidth:", a4);
  objc_msgSend(v9, "bounds");
  v10 = CGPathCreateWithEllipseInRect(v16, 0);
  objc_msgSend(v9, "setPath:", v10);
  objc_msgSend(v9, "setLineCap:", *MEMORY[0x1E0CD3010]);
  CGPathRelease(v10);
  return v9;
}

- (void)_createBorderView
{
  double v3;
  double v4;
  double v5;
  double v6;
  CAShapeLayer *v7;
  CAShapeLayer *borderLayer;
  id v9;
  id v10;
  id v11;
  id v12;

  -[UIView _lp_backingScaleFactor](self, "_lp_backingScaleFactor");
  v4 = 1.0 / v3;
  -[LPPlayButtonControl buttonSize](self, "buttonSize");
  -[LPPlayButtonControl _createProgressIndicatorLayerWithBounds:lineWidth:](self, "_createProgressIndicatorLayerWithBounds:lineWidth:", -v4, -v4, v5 + v4 * 2.0, v6 + v4 * 2.0, v4);
  v7 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  borderLayer = self->_borderLayer;
  self->_borderLayer = v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setBackgroundColor:](self->_borderLayer, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_borderLayer, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_borderLayer, "setFillColor:", objc_msgSend(v11, "CGColor"));

  -[LPPlayButtonControl layer](self, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", self->_borderLayer);

}

- (void)_createBackgroundView
{
  id v3;
  UIView *v4;
  UIView *backgroundView;
  UIView *v6;
  float v7;
  UIView *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
  v6 = self->_backgroundView;
  -[LPPlayButtonControl buttonCornerRadius](self, "buttonCornerRadius");
  -[UIView _lp_setCornerRadius:continuous:](v6, "_lp_setCornerRadius:continuous:", 0, v7);
  v8 = self->_backgroundView;
  -[LPPlayButtonControl defaultBackgroundColor](self, "defaultBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _lp_setBackgroundColor:](v8, "_lp_setBackgroundColor:", v9);

  -[UIView _lp_setHoverEffectEnabled:](self->_backgroundView, "_lp_setHoverEffectEnabled:", 1);
  -[LPPlayButtonControl addSubview:](self, "addSubview:", self->_backgroundView);
}

- (void)_createImageView
{
  id v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  imageView = self->_imageView;
  self->_imageView = v4;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 4);
  -[UIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 0);
  -[UIImageView setOpaque:](self->_imageView, "setOpaque:", 0);
  v6 = (void *)MEMORY[0x1E0DC3888];
  -[LPAudioPlayButtonStyle glyphSize](self->_style, "glyphSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  objc_msgSend(v6, "configurationWithPointSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v8);

  -[UIImageView _lp_setBackgroundColor:](self->_imageView, "_lp_setBackgroundColor:", 0);
  -[LPPlayButtonControl addSubview:](self, "addSubview:", self->_imageView);
}

- (void)_createInnerProgressView
{
  double v3;
  double v4;
  CAShapeLayer *v5;
  CAShapeLayer *innerProgressLayer;
  id v7;
  id v8;
  void *v9;

  -[LPPlayButtonControl buttonSize](self, "buttonSize");
  -[LPPlayButtonControl _createProgressIndicatorLayerWithBounds:lineWidth:](self, "_createProgressIndicatorLayerWithBounds:lineWidth:", 0.0, 0.0, v3, v4, 2.0);
  v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  innerProgressLayer = self->_innerProgressLayer;
  self->_innerProgressLayer = v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setBackgroundColor:](self->_innerProgressLayer, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_innerProgressLayer, "setFillColor:", objc_msgSend(v8, "CGColor"));

  -[CAShapeLayer setStrokeEnd:](self->_innerProgressLayer, "setStrokeEnd:", 0.0);
  -[LPPlayButtonControl layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", self->_innerProgressLayer);

  -[LPPlayButtonControl _updateInnerProgressLayerStroke](self, "_updateInnerProgressLayerStroke");
}

- (void)_createOuterProgressView
{
  double v3;
  double v4;
  CAShapeLayer *v5;
  CAShapeLayer *outerProgressLayer;
  id v7;
  id v8;
  void *v9;

  -[LPPlayButtonControl buttonSize](self, "buttonSize");
  -[LPPlayButtonControl _createProgressIndicatorLayerWithBounds:lineWidth:](self, "_createProgressIndicatorLayerWithBounds:lineWidth:", 0.0, 0.0, v3, v4, 2.0);
  v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  outerProgressLayer = self->_outerProgressLayer;
  self->_outerProgressLayer = v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setBackgroundColor:](self->_outerProgressLayer, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_outerProgressLayer, "setFillColor:", objc_msgSend(v8, "CGColor"));

  -[LPPlayButtonControl layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", self->_outerProgressLayer);

  -[LPPlayButtonControl _updateOuterProgressLayerStroke](self, "_updateOuterProgressLayerStroke");
}

- (void)_createHighlightLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  CAShapeLayer *v7;
  CAShapeLayer *highlightLayer;
  double v9;
  const CGPath *v10;
  id v11;
  id v12;
  CGRect v13;

  -[LPPlayButtonControl buttonSize](self, "buttonSize");
  v4 = v3;
  v6 = v5;
  v7 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  highlightLayer = self->_highlightLayer;
  self->_highlightLayer = v7;

  -[CAShapeLayer setFrame:](self->_highlightLayer, "setFrame:", 0.0, 0.0, v4, v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.16);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_highlightLayer, "setFillColor:", objc_msgSend(v11, "CGColor"));

  LODWORD(v9) = 0;
  -[CAShapeLayer setOpacity:](self->_highlightLayer, "setOpacity:", v9);
  -[CAShapeLayer bounds](self->_highlightLayer, "bounds");
  v10 = CGPathCreateWithEllipseInRect(v13, 0);
  -[CAShapeLayer setPath:](self->_highlightLayer, "setPath:", v10);
  CGPathRelease(v10);
  -[LPPlayButtonControl layer](self, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", self->_highlightLayer);

}

- (void)_showPlayIndicator:(BOOL)a3
{
  void *v4;

  self->_isPlaying = !a3;
  if (!a3)
    -[LPPlayButtonControl pauseImage](self, "pauseImage");
  else
    -[LPPlayButtonControl playImage](self, "playImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v4);

  -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
}

- (void)_toggleToPlayState
{
  self->_showingProgress = 1;
  -[LPPlayButtonControl _showPlayIndicator:](self, "_showPlayIndicator:", 0);
  -[CAShapeLayer setHidden:](self->_outerProgressLayer, "setHidden:", 0);
  -[CAShapeLayer setHidden:](self->_innerProgressLayer, "setHidden:", 0);
}

- (void)_updateInnerProgressLayerStroke
{
  id v3;

  -[LPAudioPlayButtonTheme keyColor](self->_theme, "keyColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_innerProgressLayer, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

}

- (void)_updateEnabledState
{
  UIImageView *imageView;
  char v4;
  double v5;

  imageView = self->_imageView;
  v4 = -[LPPlayButtonControl isEnabled](self, "isEnabled");
  v5 = 1.0;
  if ((v4 & 1) == 0)
    +[LPTheme disabledButtonOpacity](LPTheme, "disabledButtonOpacity", 1.0);
  -[UIImageView _lp_setOpacity:](imageView, "_lp_setOpacity:", v5);
  -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
}

- (id)playable
{
  return 0;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_highlightRecognizer, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_outerProgressLayer, 0);
  objc_storeStrong((id *)&self->_innerProgressLayer, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
