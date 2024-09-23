@implementation AVPresentationContainerView

- (BOOL)avkit_isVideoGravityFrozen
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[AVPresentationContainerView willBeginOrientationChange](self, "willBeginOrientationChange");
  if (v3)
  {
    -[AVPresentationContainerView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_windowOwnsInterfaceOrientation");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)willBeginOrientationChange
{
  return self->_willBeginOrientationChange;
}

- (BOOL)isBeingPresented
{
  return self->_beingPresented;
}

- (void)_setCornerRadius:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[AVPresentationContainerView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", a3);

  v6 = *MEMORY[0x1E0CD2A60];
  -[AVPresentationContainerView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerCurve:", v6);

  -[AVPresentationContainerView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appearanceProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "maskedCorners");
  -[AVPresentationContainerView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaskedCorners:", v10);

  if (a3 > 0.0)
    -[AVPresentationContainerView setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[AVPresentationContainerView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", a3);

  v6 = *MEMORY[0x1E0CD2A68];
  -[AVPresentationContainerView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerCurve:", v6);

  -[AVPresentationContainerView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appearanceProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "maskedCorners");
  -[AVPresentationContainerView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaskedCorners:", v10);

  if (a3 > 0.0)
    -[AVPresentationContainerView setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (void)setPresentationContainerContentView:(id)a3
{
  objc_storeWeak((id *)&self->_presentationContainerContentView, a3);
}

- (void)setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVPresentationContainerView;
  -[AVPresentationContainerView setClipsToBounds:](&v8, sel_setClipsToBounds_, -[AVPresentationContainerView wantsAppearanceConfigValues](self, "wantsAppearanceConfigValues") & a3);
  -[AVPresentationContainerView appearanceProxy](self, "appearanceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", v3);

  -[AVPresentationContainerView appearanceProxy](self, "appearanceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actualView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", v3);

}

- (void)setBackgroundColor:(id)a3
{
  void *v3;
  id v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v5 = a3;
  v6 = -[AVPresentationContainerView wantsAppearanceConfigValues](self, "wantsAppearanceConfigValues");
  if (v6)
  {
    -[AVPresentationContainerView appearanceProxy](self, "appearanceProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backgroundColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)AVPresentationContainerView;
  -[AVPresentationContainerView setBackgroundColor:](&v11, sel_setBackgroundColor_, v7);
  if (v6)
  {

    v7 = v3;
  }

  -[AVPresentationContainerView appearanceProxy](self, "appearanceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v5);

  -[AVPresentationContainerView appearanceProxy](self, "appearanceProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actualView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v5);

}

- (AVPresentationContainerViewAppearanceProxy)appearanceProxy
{
  void *v2;
  void *v3;

  -[AVPresentationContainerView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appearanceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPresentationContainerViewAppearanceProxy *)v3;
}

- (BOOL)wantsAppearanceConfigValues
{
  return self->_wantsAppearanceConfigValues;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  void *v3;
  AVPresentationContainerView *v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _OWORD v20[6];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVPresentationContainerView;
  -[AVPresentationContainerView layoutSubviews](&v21, sel_layoutSubviews);
  -[AVPresentationContainerView presentationContainerContentView](self, "presentationContainerContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (AVPresentationContainerView *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[AVPresentationContainerView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AVPresentationContainerView presentationContainerContentView](self, "presentationContainerContentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[AVPresentationContainerView _contentTransform](self, "_contentTransform");
    -[AVPresentationContainerView presentationContainerContentView](self, "presentationContainerContentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v20[3];
    v20[1] = v20[4];
    v20[2] = v20[5];
    objc_msgSend(v14, "setTransform:", v20);

    -[AVPresentationContainerView bounds](self, "bounds");
    UIRectGetCenter();
    v16 = v15;
    v18 = v17;
    -[AVPresentationContainerView presentationContainerContentView](self, "presentationContainerContentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCenter:", v16, v18);

  }
}

- (UIView)presentationContainerContentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_presentationContainerContentView);
}

- (CGAffineTransform)_contentTransform
{
  CGAffineTransform *result;
  CGFloat v6;
  uint64_t v7;
  __int128 v8;
  CGAffineTransform v9;

  result = (CGAffineTransform *)-[AVPresentationContainerView isCounterRotatingContentView](self, "isCounterRotatingContentView");
  if ((_DWORD)result)
  {
    -[AVPresentationContainerView _radiansForCounterRotation](self, "_radiansForCounterRotation");
    CGAffineTransformMakeRotation(&v9, v6);
    return (CGAffineTransform *)UIIntegralTransform();
  }
  else
  {
    v7 = MEMORY[0x1E0C9BAA8];
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  }
  return result;
}

- (BOOL)isCounterRotatingContentView
{
  return self->_counterRotatingContentView;
}

- (void)setWantsAppearanceConfigValues:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  void *v6;
  void *v7;
  objc_super v8;

  if (self->_wantsAppearanceConfigValues != a3)
  {
    v4 = a3;
    self->_wantsAppearanceConfigValues = a3;
    if (a3)
    {
      -[AVPresentationContainerView appearanceProxy](self, "appearanceProxy");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "backgroundColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = self;
    v8.super_class = (Class)AVPresentationContainerView;
    -[AVPresentationContainerView setBackgroundColor:](&v8, sel_setBackgroundColor_, v6);
    if (v4)
    {

      v6 = v3;
    }

    -[AVPresentationContainerView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWantsAppearanceConfigValues:", v4);

  }
}

- (double)_continuousCornerRadius
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;

  -[AVPresentationContainerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerCurve");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if (v4 == (void *)*MEMORY[0x1E0CD2A68])
  {
    -[AVPresentationContainerView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cornerRadius");
    v5 = v7;

  }
  return v5;
}

- (double)_cornerRadius
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;

  -[AVPresentationContainerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerCurve");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if (v4 == (void *)*MEMORY[0x1E0CD2A60])
  {
    -[AVPresentationContainerView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cornerRadius");
    v5 = v7;

  }
  return v5;
}

- (void)willBeginAdjustingOrientation
{
  -[AVPresentationContainerView setWillBeginOrientationChange:](self, "setWillBeginOrientationChange:", 1);
}

- (BOOL)avkit_isCounterRotatedForTransition
{
  _BOOL4 v3;
  int64_t v4;

  if (-[AVPresentationContainerView isBeingDismissed](self, "isBeingDismissed")
    || (v3 = -[AVPresentationContainerView isBeingPresented](self, "isBeingPresented")))
  {
    v4 = -[AVPresentationContainerView fromOrientation](self, "fromOrientation");
    LOBYTE(v3) = v4 != -[AVPresentationContainerView toOrientation](self, "toOrientation");
  }
  return v3;
}

- (UIEdgeInsets)avkit_overrideLayoutMarginsForInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  if ((unint64_t)(a3 - 3) > 1 || v5)
  {

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayCornerRadius");
  v9 = v8;

  if (v9 <= 0.0)
  {
LABEL_6:
    v10 = 2.22507386e-308;
    goto LABEL_7;
  }
  v10 = 27.0;
LABEL_7:
  v11 = v10;
  v12 = v10;
  v13 = v10;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (UIEdgeInsets)avkit_overrideLayoutMarginsForCounterRotation
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  if (!-[AVPresentationContainerView avkit_isCounterRotatedForTransition](self, "avkit_isCounterRotatedForTransition"))
    goto LABEL_7;
  if (!-[AVPresentationContainerView isBeingPresented](self, "isBeingPresented"))
  {
    if (-[AVPresentationContainerView isBeingDismissed](self, "isBeingDismissed"))
    {
      v3 = -[AVPresentationContainerView fromOrientation](self, "fromOrientation");
      goto LABEL_6;
    }
LABEL_7:
    v4 = 2.22507386e-308;
    v5 = 2.22507386e-308;
    v6 = 2.22507386e-308;
    v7 = 2.22507386e-308;
    goto LABEL_8;
  }
  v3 = -[AVPresentationContainerView toOrientation](self, "toOrientation");
LABEL_6:
  -[AVPresentationContainerView avkit_overrideLayoutMarginsForInterfaceOrientation:](self, "avkit_overrideLayoutMarginsForInterfaceOrientation:", v3);
LABEL_8:
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)willStartPresentationTransitionFromInterfaceOrientation:(int64_t)a3 toOrientation:(int64_t)a4 needsCounterRotation:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[AVPresentationContainerView setBeingPresented:](self, "setBeingPresented:", 1);
  -[AVPresentationContainerView setFromOrientation:](self, "setFromOrientation:", a3);
  -[AVPresentationContainerView setToOrientation:](self, "setToOrientation:", a4);
  -[AVPresentationContainerView setCounterRotatingContentView:](self, "setCounterRotatingContentView:", v5);
  -[AVPresentationContainerView setNeedsLayout](self, "setNeedsLayout");
  -[AVPresentationContainerView layoutIfNeeded](self, "layoutIfNeeded");
  -[AVPresentationContainerView setWillBeginOrientationChange:](self, "setWillBeginOrientationChange:", 0);
}

- (void)willStartDismissalTransitionFromInterfaceOrientation:(int64_t)a3 toOrientation:(int64_t)a4 needsCounterRotation:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[AVPresentationContainerView setBeingDismissed:](self, "setBeingDismissed:", 1);
  -[AVPresentationContainerView setFromOrientation:](self, "setFromOrientation:", a3);
  -[AVPresentationContainerView setToOrientation:](self, "setToOrientation:", a4);
  -[AVPresentationContainerView setCounterRotatingContentView:](self, "setCounterRotatingContentView:", v5);
  -[AVPresentationContainerView setNeedsLayout](self, "setNeedsLayout");
  -[AVPresentationContainerView layoutIfNeeded](self, "layoutIfNeeded");
  -[AVPresentationContainerView setWillBeginOrientationChange:](self, "setWillBeginOrientationChange:", 0);
}

- (void)didStopTransition
{
  -[AVPresentationContainerView setBeingDismissed:](self, "setBeingDismissed:", 0);
  -[AVPresentationContainerView setBeingPresented:](self, "setBeingPresented:", 0);
  -[AVPresentationContainerView setFromOrientation:](self, "setFromOrientation:", -[AVPresentationContainerView toOrientation](self, "toOrientation"));
  -[AVPresentationContainerView setCounterRotatingContentView:](self, "setCounterRotatingContentView:", 0);
  -[AVPresentationContainerView setNeedsLayout](self, "setNeedsLayout");
  -[AVPresentationContainerView layoutIfNeeded](self, "layoutIfNeeded");
  -[AVPresentationContainerView setWillBeginOrientationChange:](self, "setWillBeginOrientationChange:", 0);
}

- (double)_radiansForCounterRotation
{
  int v3;
  int v4;

  if (-[AVPresentationContainerView fromOrientation](self, "fromOrientation") == 1)
  {
    v3 = 0;
  }
  else if (-[AVPresentationContainerView fromOrientation](self, "fromOrientation") == 4)
  {
    v3 = 1;
  }
  else if (-[AVPresentationContainerView fromOrientation](self, "fromOrientation") == 3)
  {
    v3 = -1;
  }
  else
  {
    v3 = 2 * (-[AVPresentationContainerView fromOrientation](self, "fromOrientation") == 2);
  }
  if (-[AVPresentationContainerView toOrientation](self, "toOrientation") == 1)
  {
    v4 = 0;
  }
  else if (-[AVPresentationContainerView toOrientation](self, "toOrientation") == 4)
  {
    v4 = -1;
  }
  else if (-[AVPresentationContainerView toOrientation](self, "toOrientation") == 3)
  {
    v4 = 1;
  }
  else if (-[AVPresentationContainerView toOrientation](self, "toOrientation") == 2)
  {
    v4 = -2;
  }
  else
  {
    v4 = 0;
  }
  return (double)(v4 + v3) * 1.57079633;
}

- (void)setCounterRotatingContentView:(BOOL)a3
{
  self->_counterRotatingContentView = a3;
}

- (void)setBeingPresented:(BOOL)a3
{
  self->_beingPresented = a3;
}

- (BOOL)isBeingDismissed
{
  return self->_beingDismissed;
}

- (void)setBeingDismissed:(BOOL)a3
{
  self->_beingDismissed = a3;
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (void)setFromOrientation:(int64_t)a3
{
  self->_fromOrientation = a3;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (void)setToOrientation:(int64_t)a3
{
  self->_toOrientation = a3;
}

- (void)setWillBeginOrientationChange:(BOOL)a3
{
  self->_willBeginOrientationChange = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationContainerContentView);
}

@end
