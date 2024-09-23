@implementation AVMobileVolumeChromelessButtonControl

- (AVMobileVolumeChromelessButtonControl)init
{
  AVMobileVolumeChromelessButtonControl *v2;
  id v3;
  uint64_t v4;
  UIImageView *imageView;
  id v6;
  uint64_t v7;
  UIView *micaPackageContainerView;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  v2 = -[AVMobileVolumeChromelessButtonControl initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[AVMobileVolumeChromelessButtonControl bounds](v2, "bounds");
    v4 = objc_msgSend(v3, "initWithFrame:");
    imageView = v2->_imageView;
    v2->_imageView = (UIImageView *)v4;

    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[AVMobileVolumeChromelessButtonControl bounds](v2, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    micaPackageContainerView = v2->_micaPackageContainerView;
    v2->_micaPackageContainerView = (UIView *)v7;

    -[UIView setUserInteractionEnabled:](v2->_micaPackageContainerView, "setUserInteractionEnabled:", 0);
    -[UIView layer](v2->_micaPackageContainerView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    v10 = -[AVMobileVolumeChromelessButtonControl effectiveUserInterfaceLayoutDirection](v2, "effectiveUserInterfaceLayoutDirection");
    objc_initWeak(&location, v2);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__AVMobileVolumeChromelessButtonControl_init__block_invoke;
    v12[3] = &unk_1E5BB3EF0;
    objc_copyWeak(&v13, &location);
    +[AVMicaPackage asynchronouslyPrepareMicaPackageWithName:layoutDirection:completion:](AVMicaPackage, "asynchronouslyPrepareMicaPackageWithName:layoutDirection:completion:", CFSTR("VolumeGlyph"), v10, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setMicaPackage:(id)a3
{
  AVMicaPackage *v5;
  AVMicaPackage *v6;

  v5 = (AVMicaPackage *)a3;
  if (self->_micaPackage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_micaPackage, a3);
    v5 = v6;
    if (v6)
    {
      -[AVMobileVolumeChromelessButtonControl _updateMicaPackage:](self, "_updateMicaPackage:", v6);
      v5 = v6;
    }
  }

}

- (void)setVolumeIconState:(id)a3
{
  NSString *v4;
  NSString *volumeIconState;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_volumeIconState, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    volumeIconState = self->_volumeIconState;
    self->_volumeIconState = v4;

    -[AVMobileVolumeChromelessButtonControl micaPackage](self, "micaPackage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileVolumeChromelessButtonControl _updateMicaPackage:](self, "_updateMicaPackage:", v6);

  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  AVMobileVolumeChromelessButtonControl *v5;
  CGPoint *p_startPoint;
  id v7;
  id v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v12;

  v5 = self;
  p_startPoint = &self->_startPoint;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "preciseLocationInView:", v5);
  p_startPoint->x = v9;
  p_startPoint->y = v10;
  v12.receiver = v5;
  v12.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  LOBYTE(v5) = -[AVMobileVolumeChromelessButtonControl beginTrackingWithTouch:withEvent:](&v12, sel_beginTrackingWithTouch_withEvent_, v8, v7);

  return (char)v5;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  char v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "preciseLocationInView:", self);
  *(float *)&v8 = self->_startPoint.x - v8;
  *(float *)&v9 = self->_startPoint.y - v9;
  v10 = sqrt((float)(*(float *)&v8 * *(float *)&v8) + (float)(*(float *)&v9 * *(float *)&v9));
  -[AVMobileVolumeChromelessButtonControl delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AVMobileVolumeChromelessButtonControl delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "volumeControlButtonCanBeginPanning:", self);

    v15 = v14 ^ 1;
  }
  else
  {
    v15 = 0;
  }
  if (v10 > 15.0)
  {
    if (self->_hasStartedPanning)
      v15 = 1;
    if ((v15 & 1) == 0)
    {
      self->_hasStartedPanning = 1;
      -[AVMobileVolumeChromelessButtonControl _volumeControlButtonDidBeginPanning](self, "_volumeControlButtonDidBeginPanning");
    }
  }
  if (self->_hasStartedPanning)
  {
    objc_msgSend(v6, "preciseLocationInView:", self);
    v17 = v16;
    objc_msgSend(v6, "precisePreviousLocationInView:", self);
    -[AVMobileVolumeChromelessButtonControl _volumeControlButtonPanningDidContinueWithXDelta:](self, "_volumeControlButtonPanningDidContinueWithXDelta:", v17 - v18);
  }
  v21.receiver = self;
  v21.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  v19 = -[AVMobileVolumeChromelessButtonControl continueTrackingWithTouch:withEvent:](&v21, sel_continueTrackingWithTouch_withEvent_, v6, v7);

  return v19;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  -[AVMobileVolumeChromelessButtonControl endTrackingWithTouch:withEvent:](&v5, sel_endTrackingWithTouch_withEvent_, a3, a4);
  if (self->_hasStartedPanning)
  {
    -[AVMobileVolumeChromelessButtonControl setTracking:](self, "setTracking:", 0);
    -[AVMobileVolumeChromelessButtonControl _volumeControlButtonDidEndPanning](self, "_volumeControlButtonDidEndPanning");
  }
  else
  {
    -[AVMobileVolumeChromelessButtonControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x400000);
  }
  self->_hasStartedPanning = 0;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  _BOOL4 hasStartedPanning;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  -[AVMobileVolumeChromelessButtonControl cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, a3);
  hasStartedPanning = self->_hasStartedPanning;
  self->_hasStartedPanning = 0;
  -[AVMobileVolumeChromelessButtonControl setTracking:](self, "setTracking:", 0);
  if (hasStartedPanning)
    -[AVMobileVolumeChromelessButtonControl _volumeControlButtonDidEndPanning](self, "_volumeControlButtonDidEndPanning");
}

- (void)didMoveToWindow
{
  UIPointerInteraction *v3;
  UIPointerInteraction *micaPackageContainerPointerInteraction;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  -[AVMobileVolumeChromelessButtonControl didMoveToWindow](&v5, sel_didMoveToWindow);
  if (self)
  {
    v3 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
    micaPackageContainerPointerInteraction = self->_micaPackageContainerPointerInteraction;
    self->_micaPackageContainerPointerInteraction = v3;

    -[AVMobileVolumeChromelessButtonControl addInteraction:](self, "addInteraction:", self->_micaPackageContainerPointerInteraction);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isDescendantOfView:", self);

  return (char)self;
}

- (CGRect)hitRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  v10.receiver = self;
  v10.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  -[AVMobileVolumeChromelessButtonControl hitRect](&v10, sel_hitRect);
  v3 = v2 + -25.0;
  v5 = v4 + -25.0;
  v7 = v6 + 50.0;
  v9 = v8 + 50.0;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v5;
  result.origin.x = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 26.0;
  v3 = 26.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  -[AVMobileVolumeChromelessButtonControl layoutSubviews](&v6, sel_layoutSubviews);
  -[AVMobileVolumeChromelessButtonControl micaPackageContainerView](self, "micaPackageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileVolumeChromelessButtonControl bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVMobileVolumeChromelessButtonControl micaPackage](self, "micaPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileVolumeChromelessButtonControl bounds](self, "bounds");
  UIRectGetCenter();
  objc_msgSend(v5, "setPosition:");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[AVMobileVolumeChromelessButtonControl hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", v7 + -5.0, v9 + -5.0, v11 + 10.0, v13 + 10.0, 6.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0DC3D90]);
  objc_msgSend(v4, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithView:", v16);
  objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v18, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (void)_volumeControlButtonDidBeginPanning
{
  void *v3;
  char v4;
  id v5;

  -[AVMobileVolumeChromelessButtonControl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVMobileVolumeChromelessButtonControl delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "volumeControlButtonDidBeginPanning:", self);

  }
}

- (void)_volumeControlButtonPanningDidContinueWithXDelta:(double)a3
{
  void *v5;
  char v6;
  id v7;

  -[AVMobileVolumeChromelessButtonControl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVMobileVolumeChromelessButtonControl delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "volumeControlButton:didContinuePanningWithXDelta:", self, a3);

  }
}

- (void)_volumeControlButtonDidEndPanning
{
  void *v3;
  char v4;
  id v5;

  -[AVMobileVolumeChromelessButtonControl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVMobileVolumeChromelessButtonControl delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "volumeControlButtonDidEndPanning:", self);

  }
}

- (id)_imageNameForMicaPackageState
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  if (_imageNameForMicaPackageState_onceToken != -1)
    dispatch_once(&_imageNameForMicaPackageState_onceToken, &__block_literal_global_3044);
  v3 = (void *)_imageNameForMicaPackageState_imageNamesForStates;
  -[AVMobileVolumeChromelessButtonControl volumeIconState](self, "volumeIconState");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("half");
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateMicaPackage:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
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
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(id *, void *);
  void *v39;
  id v40;
  id location;

  v4 = a3;
  if (v4)
  {
    v5 = -[UIView avkit_isBeingScrolled](self, "avkit_isBeingScrolled");
    -[AVMobileVolumeChromelessButtonControl volumeIconState](self, "volumeIconState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setState:color:", v6, 0);

    objc_msgSend(v4, "rootLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setOpacity:", v8);

    if (v5)
    {
      objc_initWeak(&location, self);
      v9 = (void *)MEMORY[0x1E0DC3870];
      -[AVMobileVolumeChromelessButtonControl _imageNameForMicaPackageState](self, "_imageNameForMicaPackageState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = MEMORY[0x1E0C809B0];
      v37 = 3221225472;
      v38 = __60__AVMobileVolumeChromelessButtonControl__updateMicaPackage___block_invoke;
      v39 = &unk_1E5BB2390;
      objc_copyWeak(&v40, &location);
      objc_msgSend(v9, "avkit_imageNamed:completion:", v10, &v36);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
  }
  else
  {
    -[AVMobileVolumeChromelessButtonControl volumeIconState](self, "volumeIconState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "setState:color:", v11, 0);

    objc_msgSend(0, "rootLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1.0;
    objc_msgSend(v12, "setOpacity:", v13);

  }
  objc_msgSend(v4, "rootLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileVolumeChromelessButtonControl micaPackageContainerView](self, "micaPackageContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v17)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVMobileVolumeChromelessButtonControl micaPackageContainerView](self, "micaPackageContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileVolumeChromelessButtonControl addSubview:](self, "addSubview:", v18);

    -[AVMobileVolumeChromelessButtonControl layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompositingFilter:", 0);

    -[AVMobileVolumeChromelessButtonControl micaPackageContainerView](self, "micaPackageContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCompositingFilter:", 0);

    -[AVMobileVolumeChromelessButtonControl micaPackageContainerView](self, "micaPackageContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSublayer:", v24);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  objc_msgSend(v4, "setTargetSize:", 26.0, 26.0);
  -[AVMobileVolumeChromelessButtonControl bounds](self, "bounds");
  UIRectGetCenter();
  v26 = v25;
  v28 = v27;
  objc_msgSend(v4, "rootLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "position");
  v31 = v30;
  v33 = v32;

  if (v26 != v31 || v28 != v33)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(v4, "rootLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileVolumeChromelessButtonControl bounds](self, "bounds");
    UIRectGetCenter();
    objc_msgSend(v34, "setPosition:");

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  -[AVMobileVolumeChromelessButtonControl imageView](self, "imageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeFromSuperview");

LABEL_11:
  -[UIPointerInteraction invalidate](self->_micaPackageContainerPointerInteraction, "invalidate", v36, v37, v38, v39);

}

- (NSString)volumeIconState
{
  return self->_volumeIconState;
}

- (AVMobileVolumeChromlesButtonControlDelegate)delegate
{
  return (AVMobileVolumeChromlesButtonControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVMicaPackage)micaPackage
{
  return self->_micaPackage;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)micaPackageContainerView
{
  return self->_micaPackageContainerView;
}

- (void)setMicaPackageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_micaPackageContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaPackageContainerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_micaPackage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeIconState, 0);
  objc_storeStrong((id *)&self->_micaPackageContainerPointerInteraction, 0);
}

uint64_t __60__AVMobileVolumeChromelessButtonControl__updateMicaPackage___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;

  v3 = (void *)MEMORY[0x1E0CD28B0];
  v4 = a2;
  objc_msgSend(v3, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "micaPackage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperlayer");

  v8 = objc_loadWeakRetained(a1);
  objc_msgSend(v8, "avkit_makeSubtreeDisallowGroupBlending");

  v9 = objc_loadWeakRetained(a1);
  objc_msgSend(v9, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);

  v12 = objc_loadWeakRetained(a1);
  objc_msgSend(v12, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v14);

  v15 = objc_loadWeakRetained(a1);
  objc_msgSend(v15, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v4);

  v17 = objc_loadWeakRetained(a1);
  objc_msgSend(v17, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_loadWeakRetained(a1);
  objc_msgSend(v19, "bounds");
  objc_msgSend(v18, "setFrame:");

  v20 = objc_loadWeakRetained(a1);
  objc_msgSend(v20, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentMode:", 4);

  v22 = objc_loadWeakRetained(a1);
  objc_msgSend(v22, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __70__AVMobileVolumeChromelessButtonControl__imageNameForMicaPackageState__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("mute");
  v2[1] = CFSTR("off");
  v3[0] = CFSTR("VolumeMuted");
  v3[1] = CFSTR("VolumeZero");
  v2[2] = CFSTR("min");
  v2[3] = CFSTR("half");
  v3[2] = CFSTR("VolumeLow");
  v3[3] = CFSTR("VolumeMedium");
  v2[4] = CFSTR("full");
  v3[4] = CFSTR("VolumeHigh");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_imageNameForMicaPackageState_imageNamesForStates;
  _imageNameForMicaPackageState_imageNamesForStates = v0;

}

void __45__AVMobileVolumeChromelessButtonControl_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateMicaPackage:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setMicaPackage:", v3);

}

@end
