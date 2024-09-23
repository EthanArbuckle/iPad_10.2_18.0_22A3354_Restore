@implementation AVMobileChromelessVolumeControlsView

- (AVMobileChromelessVolumeControlsView)init
{
  AVMobileChromelessVolumeControlsView *v2;
  uint64_t v3;
  UIBlurEffect *enabledFilledBarViewEffect;
  uint64_t v5;
  UIBlurEffect *enabledUnfilledBarViewEffect;
  UIView *v7;
  UIView *volumeControls;
  AVMobileVolumeChromelessButtonControl *v9;
  AVMobileVolumeChromelessButtonControl *volumeButton;
  AVMobileVolumeChromelessButtonControl *v11;
  void *v12;
  void *v13;
  AVMobileChromelessFluidSlider *v14;
  AVMobileChromelessSlider *volumeSlider;
  AVMobileChromelessFluidSlider *v16;
  AVMobileChromelessSlider *v17;
  AVMobileChromelessSlider *v18;
  AVMobileChromelessSlider *v19;
  void *v20;
  double v21;
  double v22;
  CGSize v23;
  CGPoint v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)AVMobileChromelessVolumeControlsView;
  v2 = -[AVView init](&v26, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 14);
    v3 = objc_claimAutoreleasedReturnValue();
    enabledFilledBarViewEffect = v2->_enabledFilledBarViewEffect;
    v2->_enabledFilledBarViewEffect = (UIBlurEffect *)v3;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 11);
    v5 = objc_claimAutoreleasedReturnValue();
    enabledUnfilledBarViewEffect = v2->_enabledUnfilledBarViewEffect;
    v2->_enabledUnfilledBarViewEffect = (UIBlurEffect *)v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    volumeControls = v2->_volumeControls;
    v2->_volumeControls = v7;

    -[UIView setAutoresizingMask:](v2->_volumeControls, "setAutoresizingMask:", 0);
    v9 = objc_alloc_init(AVMobileVolumeChromelessButtonControl);
    volumeButton = v2->_volumeButton;
    v2->_volumeButton = v9;

    -[AVMobileVolumeChromelessButtonControl setAccessibilityIdentifier:](v2->_volumeButton, "setAccessibilityIdentifier:", CFSTR("Mute/Unmute"));
    v11 = v2->_volumeButton;
    AVLocalizedString(CFSTR("Mute"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileVolumeChromelessButtonControl setAccessibilityLabel:](v11, "setAccessibilityLabel:", v12);

    -[AVMobileVolumeChromelessButtonControl setIsAccessibilityElement:](v2->_volumeButton, "setIsAccessibilityElement:", 1);
    -[AVMobileVolumeChromelessButtonControl setAutoresizingMask:](v2->_volumeButton, "setAutoresizingMask:", 0);
    -[AVMobileVolumeChromelessButtonControl setHidden:](v2->_volumeButton, "setHidden:", 1);
    -[AVMobileVolumeChromelessButtonControl setDelegate:](v2->_volumeButton, "setDelegate:", v2);
    -[AVMobileVolumeChromelessButtonControl addTarget:action:forControlEvents:](v2->_volumeButton, "addTarget:action:forControlEvents:", v2, sel__handleVolumeControlButtonTap, 0x400000);
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v13, "fluidSliderEnabled");

    if ((_DWORD)v12)
    {
      v14 = objc_alloc_init(AVMobileChromelessFluidSlider);
      -[AVMobileChromelessFluidSlider setUsesVolumeStyle:](v14, "setUsesVolumeStyle:", 1);
      -[AVMobileChromelessFluidSlider setMaximumValueView:](v14, "setMaximumValueView:", v2->_volumeButton);
      -[AVMobileChromelessFluidSlider setStretchLimit:](v14, "setStretchLimit:", 10.0);
      volumeSlider = v2->_volumeSlider;
      v2->_volumeSlider = (AVMobileChromelessSlider *)v14;
      v16 = v14;

      -[AVMobileVolumeChromelessButtonControl setHidden:](v2->_volumeButton, "setHidden:", 0);
      -[AVMobileChromelessSlider setHidden:](v2->_volumeSlider, "setHidden:", 0);

    }
    else
    {
      v17 = objc_alloc_init(AVMobileChromelessSlider);
      v18 = v2->_volumeSlider;
      v2->_volumeSlider = v17;

      -[UIView addSubview:](v2->_volumeControls, "addSubview:", v2->_volumeButton);
    }
    -[AVMobileChromelessSlider setAccessibilityIdentifier:](v2->_volumeSlider, "setAccessibilityIdentifier:", CFSTR("Volume Slider"));
    v19 = v2->_volumeSlider;
    AVLocalizedString(CFSTR("Volume Slider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessSlider setAccessibilityLabel:](v19, "setAccessibilityLabel:", v20);

    -[AVMobileChromelessSlider setIsAccessibilityElement:](v2->_volumeSlider, "setIsAccessibilityElement:", 1);
    -[AVMobileChromelessSlider setAutoresizingMask:](v2->_volumeSlider, "setAutoresizingMask:", 0);
    -[AVMobileChromelessSlider setHidden:](v2->_volumeSlider, "setHidden:", 0);
    -[AVMobileChromelessSlider setDelegate:](v2->_volumeSlider, "setDelegate:", v2);
    LODWORD(v21) = 0;
    -[AVMobileChromelessSlider setMinimumValue:](v2->_volumeSlider, "setMinimumValue:", v21);
    LODWORD(v22) = 1.0;
    -[AVMobileChromelessSlider setMaximumValue:](v2->_volumeSlider, "setMaximumValue:", v22);
    -[AVMobileChromelessSlider setBarHeight:](v2->_volumeSlider, "setBarHeight:", 7.5);
    -[AVMobileChromelessSlider addTarget:action:forControlEvents:](v2->_volumeSlider, "addTarget:action:forControlEvents:", v2, sel__volumeSliderValueDidChange, 4096);
    -[UIView addSubview:](v2->_volumeControls, "addSubview:", v2->_volumeSlider);
    -[AVMobileChromelessVolumeControlsView addSubview:](v2, "addSubview:", v2->_volumeControls);
    *(_WORD *)&v2->_prefersVolumeSliderIncluded = 1;
    v2->_volumeSliderHidesWithAlphaChange = 1;
    v2->_mute = 0;
    v24 = (CGPoint)*MEMORY[0x1E0C9D628];
    v23 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v2->_sliderShadowPathRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v2->_sliderShadowPathRect.size = v23;
    v2->_buttonShadowPathRect.origin = v24;
    v2->_buttonShadowPathRect.size = v23;
    -[AVView setIgnoresTouches:](v2, "setIgnoresTouches:", 1);
  }
  return v2;
}

- (void)setEmphasized:(BOOL)a3
{
  UIViewPropertyAnimator *emphasizedAnimator;
  double v5;
  double v6;
  UIViewPropertyAnimator *v7;
  id v8;
  double v9;
  UIViewPropertyAnimator *v10;
  UIViewPropertyAnimator *v11;
  UIViewPropertyAnimator *v12;
  double v13;
  double v14;
  UIViewPropertyAnimator *v15;
  id v16;
  double v17;
  UIViewPropertyAnimator *v18;
  UIViewPropertyAnimator *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  if (self->_emphasized != a3)
  {
    self->_emphasized = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      emphasizedAnimator = self->_emphasizedAnimator;
      v5 = 1.0;
      if (emphasizedAnimator
        && -[UIViewPropertyAnimator isRunning](emphasizedAnimator, "isRunning")
        && -[UIViewPropertyAnimator isInterruptible](self->_emphasizedAnimator, "isInterruptible"))
      {
        -[UIViewPropertyAnimator fractionComplete](self->_emphasizedAnimator, "fractionComplete");
        v5 = v6;
        -[UIViewPropertyAnimator stopAnimation:](self->_emphasizedAnimator, "stopAnimation:", 1);
        -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_emphasizedAnimator, "finishAnimationAtPosition:", 2);
        v7 = self->_emphasizedAnimator;
        self->_emphasizedAnimator = 0;

      }
      objc_initWeak(&location, self);
      v8 = objc_alloc(MEMORY[0x1E0DC3F38]);
      if (v5 <= 1.0)
        v9 = v5 * 0.2;
      else
        v9 = 0.2;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __79__AVMobileChromelessVolumeControlsView__updateVolumeFluidSliderEmphasizedScale__block_invoke;
      v23 = &unk_1E5BB4A40;
      objc_copyWeak(&v24, &location);
      v10 = (UIViewPropertyAnimator *)objc_msgSend(v8, "initWithDuration:curve:animations:", 3, &v20, v9);
      v11 = self->_emphasizedAnimator;
      self->_emphasizedAnimator = v10;

      -[UIViewPropertyAnimator startAnimation](self->_emphasizedAnimator, "startAnimation", v20, v21, v22, v23);
    }
    else
    {
      v12 = self->_emphasizedAnimator;
      v13 = 1.0;
      if (v12
        && -[UIViewPropertyAnimator isRunning](v12, "isRunning")
        && -[UIViewPropertyAnimator isInterruptible](self->_emphasizedAnimator, "isInterruptible"))
      {
        -[UIViewPropertyAnimator fractionComplete](self->_emphasizedAnimator, "fractionComplete");
        v13 = v14;
        -[UIViewPropertyAnimator stopAnimation:](self->_emphasizedAnimator, "stopAnimation:", 1);
        -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_emphasizedAnimator, "finishAnimationAtPosition:", 2);
        v15 = self->_emphasizedAnimator;
        self->_emphasizedAnimator = 0;

      }
      objc_initWeak(&location, self);
      v16 = objc_alloc(MEMORY[0x1E0DC3F38]);
      if (v13 <= 1.0)
        v17 = v13 * 0.2;
      else
        v17 = 0.2;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __74__AVMobileChromelessVolumeControlsView__updateVolumeSliderEmphasizedScale__block_invoke;
      v23 = &unk_1E5BB4A40;
      objc_copyWeak(&v24, &location);
      v18 = (UIViewPropertyAnimator *)objc_msgSend(v16, "initWithDuration:curve:animations:", 3, &v20, v17);
      v19 = self->_emphasizedAnimator;
      self->_emphasizedAnimator = v18;

      -[UIViewPropertyAnimator startAnimation](self->_emphasizedAnimator, "startAnimation", v20, v21, v22, v23);
    }
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isTracking
{
  if ((-[AVMobileChromelessSlider isTracking](self->_volumeSlider, "isTracking") & 1) != 0)
    return 1;
  else
    return -[AVMobileVolumeChromelessButtonControl isTracking](self->_volumeButton, "isTracking");
}

- (void)setMute:(BOOL)a3
{
  if (self->_mute != a3)
  {
    self->_mute = a3;
    -[AVMobileChromelessVolumeControlsView _updateVolumeButtonIconState](self, "_updateVolumeButtonIconState");
  }
}

- (void)setPrefersVolumeSliderIncluded:(BOOL)a3
{
  void *v4;
  double v5;

  if (self->_prefersVolumeSliderIncluded != a3)
  {
    self->_prefersVolumeSliderIncluded = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVMobileChromelessSlider setPrefersSliderTrackHidden:](self->_volumeSlider, "setPrefersSliderTrackHidden:", !self->_prefersVolumeSliderIncluded);
      -[AVMobileChromelessVolumeControlsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[AVMobileChromelessVolumeControlsView superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

      -[AVMobileChromelessVolumeControlsView setNeedsLayout](self, "setNeedsLayout");
    }
    else if (self->_volumeSliderHidesWithAlphaChange)
    {
      v5 = 1.0;
      if (!self->_prefersVolumeSliderIncluded)
        v5 = 0.0;
      -[AVMobileChromelessSlider setAlpha:](self->_volumeSlider, "setAlpha:", v5);
    }
    else
    {
      -[AVMobileChromelessVolumeControlsView setNeedsLayout](self, "setNeedsLayout");
      -[AVMobileChromelessVolumeControlsView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)setAllowsVolumeAdjustment:(BOOL)a3
{
  _BOOL8 allowsVolumeAdjustment;

  if (self->_allowsVolumeAdjustment != a3)
  {
    self->_allowsVolumeAdjustment = a3;
    if (-[AVMobileChromelessVolumeControlsView isUserInteractionEnabled](self, "isUserInteractionEnabled"))allowsVolumeAdjustment = self->_allowsVolumeAdjustment;
    else
      allowsVolumeAdjustment = 0;
    -[AVMobileChromelessSlider setEnabled:](self->_volumeSlider, "setEnabled:", allowsVolumeAdjustment);
  }
}

- (void)didMoveToWindow
{
  double volume;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessVolumeControlsView;
  -[AVMobileChromelessVolumeControlsView didMoveToWindow](&v6, sel_didMoveToWindow);
  volume = self->_volume;
  *(float *)&volume = volume;
  -[AVMobileChromelessSlider setValue:](self->_volumeSlider, "setValue:", volume);
  -[AVMobileChromelessSlider layer](self->_volumeSlider, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileVolumeChromelessButtonControl layer](self->_volumeButton, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowOffset:", 0.0, 6.0);
  objc_msgSend(v4, "setShadowRadius:", 10.0);
  objc_msgSend(v5, "setShadowOffset:", 0.0, 6.0);
  objc_msgSend(v5, "setShadowRadius:", 10.0);
  -[AVMobileChromelessVolumeControlsView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);

  -[AVMobileChromelessVolumeControlsView _updateVolumeButtonIconState](self, "_updateVolumeButtonIconState");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isDescendantOfView:", self);

  return (char)self;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id *p_volumeButton;
  AVMobileVolumeChromelessButtonControl *volumeButton;
  AVMobileChromelessSlider *volumeSlider;
  id v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVMobileChromelessVolumeControlsView;
  -[AVView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVMobileChromelessVolumeControlsView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    p_volumeButton = (id *)&self->_volumeButton;
    volumeButton = self->_volumeButton;
    -[AVMobileVolumeChromelessButtonControl convertPoint:fromView:](volumeButton, "convertPoint:fromView:", self, x, y);
    if (-[AVMobileVolumeChromelessButtonControl pointInside:withEvent:](volumeButton, "pointInside:withEvent:", v7)
      || (p_volumeButton = (id *)&self->_volumeSlider,
          volumeSlider = self->_volumeSlider,
          -[AVMobileChromelessSlider convertPoint:fromView:](volumeSlider, "convertPoint:fromView:", self, x, y),
          -[AVMobileChromelessSlider pointInside:withEvent:](volumeSlider, "pointInside:withEvent:", v7)))
    {
      v12 = *p_volumeButton;

      v8 = v12;
    }
  }

  return v8;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[AVMobileVolumeChromelessButtonControl intrinsicContentSize](self->_volumeButton, "intrinsicContentSize");
  v5 = 26.0;
  if (v4 >= 26.0)
    v5 = v4;
  if (self->_prefersVolumeSliderIncluded)
  {
    v4 = v5;
    v3 = v3 + 152.0;
  }
  v6 = v4 + -10.0;
  result.height = v6;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  double v16;
  AVMobileChromelessSlider *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  double v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)AVMobileChromelessVolumeControlsView;
  -[AVView layoutSubviews](&v35, sel_layoutSubviews);
  -[AVMobileChromelessVolumeControlsView _layoutVolumeControlView](self, "_layoutVolumeControlView");
  if (-[AVMobileChromelessVolumeControlsView _isFluidSlider]((uint64_t)self))
  {
    if (self)
    {
      -[UIView bounds](self->_volumeControls, "bounds");
      v4 = v3;
      v6 = v5;
      v7 = -[AVMobileChromelessVolumeControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      -[AVMobileVolumeChromelessButtonControl intrinsicContentSize](self->_volumeButton, "intrinsicContentSize");
      v9 = v8;
      -[AVMobileChromelessSlider intrinsicContentSize](self->_volumeSlider, "intrinsicContentSize");
      v11 = v10;
      v12 = v9 + 140.0;
      v13 = v4 - v9;
      if (v9 >= v4 - v9)
        v13 = v9;
      v14 = v4 <= v12;
      if (v4 <= v12)
        v12 = v13;
      if (v4 * 0.5 < v9 + 179.2 || !self->_emphasized)
        v16 = v12;
      else
        v16 = v9 + 179.2;
      -[AVMobileVolumeChromelessButtonControl frame](self->_volumeButton, "frame");
      -[AVMobileVolumeChromelessButtonControl setFrame:](self->_volumeButton, "setFrame:");
      v17 = self->_volumeSlider;
      -[AVMobileChromelessSlider setBarWidth:](v17, "setBarWidth:", v16 - v9 + -12.0);
      -[UIView avkit_setFrame:inLayoutDirection:](self->_volumeSlider, "avkit_setFrame:inLayoutDirection:", v7, v4 - v16, (v6 - v11 * 0.5) * 0.5, v16, v11);
      -[AVMobileChromelessSlider setPrefersSliderTrackHidden:](v17, "setPrefersSliderTrackHidden:", v14);

    }
  }
  else if (self)
  {
    -[UIView bounds](self->_volumeControls, "bounds");
    v19 = v18;
    v21 = v20;
    v22 = -[AVMobileChromelessVolumeControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    -[AVMobileVolumeChromelessButtonControl intrinsicContentSize](self->_volumeButton, "intrinsicContentSize");
    v24 = v23;
    v26 = v25;
    -[AVMobileChromelessSlider intrinsicContentSize](self->_volumeSlider, "intrinsicContentSize");
    v28 = v27;
    v29 = v24 + 12.0;
    if (v19 < v24)
      v29 = 0.0;
    v30 = v19 - v29;
    if (v19 >= v24)
      -[UIView avkit_setFrame:inLayoutDirection:](self->_volumeButton, "avkit_setFrame:inLayoutDirection:", v22, v19 - v24, (v21 - v26) * 0.5, v24, v26);
    v31 = 179.2;
    if (v30 * 0.5 < 179.2 || !self->_emphasized)
      v31 = 140.0;
    v33 = v19 - v24 - v31 + -12.0;
    if (!self->_volumeSliderHidesWithAlphaChange)
    {
      v34 = -0.0;
      if (!self->_prefersVolumeSliderIncluded)
        v34 = v31;
      v33 = v33 + v34;
      if (!self->_prefersVolumeSliderIncluded)
        v31 = 0.0;
    }
    -[UIView avkit_setFrame:inLayoutDirection:](self->_volumeSlider, "avkit_setFrame:inLayoutDirection:", v22, v33, (v21 - v28) * 0.5, v31, v28);
    -[AVMobileVolumeChromelessButtonControl setHidden:](self->_volumeButton, "setHidden:", v19 < v24);
    -[AVMobileChromelessSlider setHidden:](self->_volumeSlider, "setHidden:", v30 < 140.0);
  }
  -[AVMobileChromelessVolumeControlsView _updateShadowPathIfNeeded]((uint64_t)self);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  AVMobileChromelessVolumeControlsView *v6;
  id v7;
  unsigned __int8 v8;
  AVMobileVolumeChromelessButtonControl *volumeButton;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v6 = self;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessVolumeControlsView;
  v7 = a4;
  v8 = -[AVMobileChromelessVolumeControlsView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  volumeButton = v6->_volumeButton;
  -[AVMobileVolumeChromelessButtonControl convertPoint:fromView:](volumeButton, "convertPoint:fromView:", v6, x, y, v11.receiver, v11.super_class);
  LOBYTE(v6) = -[AVMobileVolumeChromelessButtonControl pointInside:withEvent:](volumeButton, "pointInside:withEvent:", v7);

  return v8 | v6;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 allowsVolumeAdjustment;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessVolumeControlsView;
  -[AVMobileChromelessVolumeControlsView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_, a3);
  if (self)
  {
    if (-[AVMobileChromelessVolumeControlsView isUserInteractionEnabled](self, "isUserInteractionEnabled"))allowsVolumeAdjustment = self->_allowsVolumeAdjustment;
    else
      allowsVolumeAdjustment = 0;
    -[AVMobileChromelessSlider setEnabled:](self->_volumeSlider, "setEnabled:", allowsVolumeAdjustment);
  }
}

- (void)setDrawsShadow:(BOOL)a3
{
  if (self->_drawsShadow != a3)
  {
    self->_drawsShadow = a3;
    -[AVMobileChromelessVolumeControlsView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);
  }
}

- (BOOL)volumeControlButtonCanBeginPanning:(id)a3
{
  return self->_allowsVolumeAdjustment;
}

- (void)volumeControlButtonDidBeginPanning:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVMobileChromelessVolumeControlsView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessVolumeControlsView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volumeControlsViewInteractionDidBegin:", self);

  }
}

- (void)volumeControlButtonDidEndPanning:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVMobileChromelessVolumeControlsView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessVolumeControlsView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volumeControlsViewInteractionDidEnd:", self);

  }
}

- (void)volumeControlButton:(id)a3 didContinuePanningWithXDelta:(double)a4
{
  double Width;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  double v11;
  double v12;
  CGRect v13;

  -[AVMobileChromelessSlider frame](self->_volumeSlider, "frame", a3);
  Width = CGRectGetWidth(v13);
  v7 = -[AVMobileChromelessVolumeControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (Width > 0.0)
  {
    v8 = v7;
    -[AVMobileChromelessSlider value](self->_volumeSlider, "value");
    v10 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = a4 / Width;
      if (v8 == 1)
        v11 = -(a4 / Width);
      v12 = fmin(fmax(v11 + v10, 0.0), 1.0);
      -[AVMobileChromelessVolumeControlsView setVolume:forUpdateReason:](self, "setVolume:forUpdateReason:", 0, v12);
      -[AVMobileChromelessVolumeControlsView _updateVolumeButtonIconState](self, "_updateVolumeButtonIconState");
      -[AVMobileChromelessVolumeControlsView _notifyDelegateVolumeSliderValueDidChangeTo:]((id *)&self->super.super.super.super.isa, v12);
    }
  }
}

- (void)sliderDidBeginTracking:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVMobileChromelessVolumeControlsView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessVolumeControlsView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volumeControlsViewInteractionDidBegin:", self);

  }
}

- (void)sliderWillEndTracking:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVMobileChromelessVolumeControlsView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVMobileChromelessVolumeControlsView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volumeControlsViewInteractionDidEnd:", self);

  }
}

- (void)_handleVolumeControlButtonTap
{
  void *v3;
  char v4;
  id v5;

  -[AVMobileChromelessVolumeControlsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVMobileChromelessVolumeControlsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "volumeControlsViewButtonWasTapped:", self);

  }
}

- (void)_layoutVolumeControlView
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;

  -[AVMobileChromelessVolumeControlsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[AVMobileChromelessVolumeControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v4 >= v4 / 1.28)
    v8 = v4;
  else
    v8 = v4 / 1.28;
  -[UIView avkit_setFrame:inLayoutDirection:](self->_volumeControls, "avkit_setFrame:inLayoutDirection:", v7, v4 - v8, 0.0, v8, v6);
}

- (void)_setSliderValue:(double)a3 forUpdateReason:(unint64_t)a4
{
  int isFluid;
  AVMobileChromelessSlider *volumeSlider;
  AVMobileChromelessSlider *v8;
  uint64_t v9;
  double volume;
  double v11;

  isFluid = -[AVMobileChromelessVolumeControlsView _isFluidSlider]((uint64_t)self);
  volumeSlider = self->_volumeSlider;
  if (isFluid)
  {
    v8 = volumeSlider;
    v9 = -[AVMobileChromelessSlider _fluidUpdateSource](v8, "_fluidUpdateSource");
    if (a4 == 1 || v9 != 10)
    {
      volume = self->_volume;
      *(float *)&volume = volume;
      -[AVMobileChromelessSlider setValue:animated:](v8, "setValue:animated:", 1, volume);
    }

  }
  else
  {
    v11 = self->_volume;
    *(float *)&v11 = v11;
    -[AVMobileChromelessSlider setValue:](volumeSlider, "setValue:", v11);
  }
  -[AVMobileChromelessVolumeControlsView _updateVolumeButtonIconState](self, "_updateVolumeButtonIconState");
}

- (void)_setVolume:(double)a3 forUpdateReason:(unint64_t)a4
{
  if (self->_volume != a3)
  {
    self->_volume = fmin(fmax(a3, 0.0), 1.0);
    -[AVMobileChromelessVolumeControlsView _setSliderValue:forUpdateReason:](self, "_setSliderValue:forUpdateReason:", a4);
  }
}

- (void)_updateVolumeButtonIconState
{
  __CFString *v3;
  AVMobileVolumeChromelessButtonControl *volumeButton;
  __CFString *v5;
  double v6;
  __CFString **v7;
  void *v8;
  __CFString *v9;

  if (-[AVMobileChromelessVolumeControlsView isMuted](self, "isMuted"))
  {
    v9 = CFSTR("mute");
    v3 = CFSTR("mute");
    volumeButton = self->_volumeButton;
    v5 = CFSTR("Unmute");
  }
  else
  {
    -[AVMobileChromelessVolumeControlsView volume](self, "volume");
    if (v6 <= 0.0)
    {
      v7 = AVVolumeGlyphStateNameMuted;
    }
    else if (v6 >= 0.33)
    {
      if (v6 >= 0.66)
      {
        v7 = &AVVolumeGlyphStateNameMax;
        if (v6 < 0.95)
          v7 = AVVolumeGlyphStateNameHigh;
      }
      else
      {
        v7 = AVVolumeGlyphStateNameMedium;
      }
    }
    else
    {
      v7 = AVVolumeGlyphStateNameLow;
    }
    v9 = *v7;
    volumeButton = self->_volumeButton;
    v5 = CFSTR("Mute");
  }
  AVLocalizedString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileVolumeChromelessButtonControl setAccessibilityLabel:](volumeButton, "setAccessibilityLabel:", v8);

  -[AVMobileVolumeChromelessButtonControl setVolumeIconState:](self->_volumeButton, "setVolumeIconState:", v9);
}

- (void)_volumeSliderValueDidChange
{
  float v3;
  double v4;

  -[AVMobileChromelessSlider value](self->_volumeSlider, "value");
  v4 = v3;
  -[AVMobileChromelessVolumeControlsView _setVolume:forUpdateReason:](self, "_setVolume:forUpdateReason:", 0, v3);
  -[AVMobileChromelessVolumeControlsView _notifyDelegateVolumeSliderValueDidChangeTo:]((id *)&self->super.super.super.super.isa, v4);
}

- (BOOL)isTrackingEnabled
{
  return self->_allowsVolumeAdjustment;
}

- (BOOL)drawsShadow
{
  return self->_drawsShadow;
}

- (AVMobileChromelessVolumeControlsViewDelegate)delegate
{
  return (AVMobileChromelessVolumeControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)prefersVolumeSliderIncluded
{
  return self->_prefersVolumeSliderIncluded;
}

- (BOOL)isEmphasized
{
  return self->_emphasized;
}

- (BOOL)isMuted
{
  return self->_mute;
}

- (double)volume
{
  return self->_volume;
}

- (BOOL)volumeSliderHidesWithAlphaChange
{
  return self->_volumeSliderHidesWithAlphaChange;
}

- (void)setVolumeSliderHidesWithAlphaChange:(BOOL)a3
{
  self->_volumeSliderHidesWithAlphaChange = a3;
}

- (AVMobileVolumeChromelessButtonControl)volumeButton
{
  return self->_volumeButton;
}

- (void)setVolumeButton:(id)a3
{
  objc_storeStrong((id *)&self->_volumeButton, a3);
}

- (AVMobileChromelessSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setVolumeSlider:(id)a3
{
  objc_storeStrong((id *)&self->_volumeSlider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_volumeButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enabledUnfilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_enabledFilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_emphasizedAnimator, 0);
  objc_storeStrong((id *)&self->_volumeControls, 0);
}

- (void)_notifyDelegateVolumeSliderValueDidChangeTo:(id *)a1
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = a1[74];
      v5 = objc_msgSend(v4, "_fluidUpdateSource");
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
        objc_msgSend(v7, "volumeControlsView:volumeDidChangeTo:withUpdateSource:", a1, v5, a2);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "volumeControlsView:volumeDidChangeTo:", a1, a2);
    }

  }
}

- (uint64_t)_isFluidSlider
{
  if (a1)
  {
    objc_opt_class();
    LOBYTE(a1) = objc_opt_isKindOfClass();
  }
  return a1 & 1;
}

- (void)_updateShadowAppearanceState
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  int v6;
  id v7;
  double v8;
  id v9;
  double v10;
  id v11;

  if (a1)
  {
    objc_msgSend(a1[74], "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[73], "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "drawsShadow"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1.0;
      v6 = 1053609165;
    }
    else
    {
      v3 = 0;
      v4 = 0;
      v5 = 0.0;
      v6 = 0;
    }
    v7 = objc_retainAutorelease(v3);
    objc_msgSend(v11, "setShadowColor:", objc_msgSend(v7, "CGColor"));
    *(float *)&v8 = v5;
    objc_msgSend(v11, "setShadowOpacity:", v8);
    v9 = objc_retainAutorelease(v4);
    objc_msgSend(v2, "setShadowColor:", objc_msgSend(v9, "CGColor"));
    LODWORD(v10) = v6;
    objc_msgSend(v2, "setShadowOpacity:", v10);
    -[AVMobileChromelessVolumeControlsView _updateShadowPathIfNeeded]((uint64_t)a1);

  }
}

- (void)_updateShadowPathIfNeeded
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  CGRect v22;
  CGRect v23;

  if (a1 && objc_msgSend((id)a1, "drawsShadow"))
  {
    objc_msgSend(*(id *)(a1 + 592), "layer");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    if (CGRectIsNull(*(CGRect *)(a1 + 496))
      || (v22.origin.x = v3,
          v22.origin.y = v5,
          v22.size.width = v7,
          v22.size.height = v9,
          !CGRectEqualToRect(*(CGRect *)(a1 + 496), v22)))
    {
      *(double *)(a1 + 496) = v3;
      *(double *)(a1 + 504) = v5;
      *(double *)(a1 + 512) = v7;
      *(double *)(a1 + 520) = v9;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v3, v5, v7, v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "setShadowPath:", objc_msgSend(v10, "CGPath"));

    }
    objc_msgSend(*(id *)(a1 + 584), "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16 + 5.0;
    v19 = v18 + -5.0;
    if (CGRectIsNull(*(CGRect *)(a1 + 528))
      || (v23.origin.x = v19,
          v23.origin.y = v13,
          v23.size.width = v17,
          v23.size.height = v15,
          !CGRectEqualToRect(*(CGRect *)(a1 + 528), v23)))
    {
      *(double *)(a1 + 528) = v19;
      *(double *)(a1 + 536) = v13;
      *(double *)(a1 + 544) = v17;
      *(double *)(a1 + 552) = v15;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v19, v13, v17, v15);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v11, "setShadowPath:", objc_msgSend(v20, "CGPath"));

    }
  }
}

void __74__AVMobileChromelessVolumeControlsView__updateVolumeSliderEmphasizedScale__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;
  __int128 v9;
  _OWORD v10[3];
  CGAffineTransform v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[74];
    if (*((_BYTE *)v2 + 563))
    {
      objc_msgSend(v3, "setBarHeight:", 9.5);
      objc_msgSend(v2[58], "bounds");
      v5 = v4;
      objc_msgSend(v2[73], "intrinsicContentSize");
      if (v5 - v6 + -12.0 >= 179.2)
      {
        v7 = v2[74];
        CGAffineTransformMakeScale(&v11, 1.28, 1.0);
        objc_msgSend(v7, "setTransform:", &v11);
      }
      objc_msgSend(v2, "layoutIfNeeded");
      objc_msgSend(v2, "setNeedsLayout");
    }
    else
    {
      objc_msgSend(v3, "setBarHeight:", 7.5);
      objc_msgSend(v2, "setNeedsLayout");
      v8 = v2[74];
      v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v10[0] = *MEMORY[0x1E0C9BAA8];
      v10[1] = v9;
      v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v8, "setTransform:", v10);
      objc_msgSend(v2, "layoutIfNeeded");
    }
  }

}

void __79__AVMobileChromelessVolumeControlsView__updateVolumeFluidSliderEmphasizedScale__block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  int v2;
  void *v3;
  double v4;
  unsigned __int8 *v5;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[563];
    v5 = WeakRetained;
    v3 = (void *)*((_QWORD *)WeakRetained + 74);
    v4 = 9.5;
    if (!v2)
      v4 = 7.5;
    objc_msgSend(v3, "setBarHeight:", v4);
    objc_msgSend(v5, "setNeedsLayout");
    objc_msgSend(v5, "layoutIfNeeded");
    WeakRetained = v5;
  }

}

@end
