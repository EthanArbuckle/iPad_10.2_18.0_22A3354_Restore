@implementation FaceIdToastViewController

- (FaceIdToastViewController)initWithGlyph:(id)a3 title:(id)a4 lightweightUIMode:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  FaceIdToastViewController *v11;
  void *v12;
  FaceIdToastViewController *v13;
  uint64_t v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  self->_iPad = objc_msgSend(v10, "userInterfaceIdiom") == (id)1;

  v16.receiver = self;
  v16.super_class = (Class)FaceIdToastViewController;
  v11 = -[FaceIdToastViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  if (v11)
  {
    v11->_instanceId = +[FaceIdToastViewController newInstanceId](FaceIdToastViewController, "newInstanceId");
    v11->_lightweightUIMode = a5;
    -[PresentationViewController setGlyphView:](v11, "setGlyphView:", v8);
    objc_storeStrong((id *)&v11->_titleText, a4);
    -[FaceIdToastViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController presentationController](v11, "presentationController"));
    objc_msgSend(v12, "_setContainerIgnoresDirectTouchEvents:", 1);

    v13 = v11;
    if (-[FaceIdToastViewController lightweightUI](v13, "lightweightUI"))
      v14 = 0x404C000000000000;
    else
      v14 = qword_10005FE00[!v13->_iPad];
    *(_QWORD *)&v11->_toastViewSize.width = v14;
    *(_QWORD *)&v11->_toastViewSize.height = v14;

  }
  return v11;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%u]"), v5, -[FaceIdToastViewController instanceId](self, "instanceId")));

  return v6;
}

+ (unsigned)newInstanceId
{
  return ++dword_1000921F8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FaceIdToastViewController;
  -[PresentationViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[FaceIdToastViewController _setupSubviews](self, "_setupSubviews");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id buf[2];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FaceIdToastViewController;
  -[FaceIdToastViewController viewDidAppear:](&v13, "viewDidAppear:", a3);
  v4 = -[PresentationViewController isDynamicIslandAvailable](self, "isDynamicIslandAvailable");
  if (!v4)
  {
    v5 = LACLogFaceIDUI(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Face ID glyph will appear", (uint8_t *)buf, 2u);
    }

    if (self->_iPad && !-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController glyphView](self, "glyphView"));
      objc_msgSend(v7, "setState:animated:", 1, 1);

    }
    else
    {
      objc_initWeak(buf, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10001D050;
      v10[3] = &unk_100079B80;
      objc_copyWeak(&v11, buf);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10001D084;
      v8[3] = &unk_10007A398;
      objc_copyWeak(&v9, buf);
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v10, v8, 0.2, 0.0);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_toastAnimationFadeIn:(BOOL)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *glyphWrapper;
  double v13;
  int v14;
  FaceIdToastViewController *v15;
  __int16 v16;
  const __CFString *v17;

  v4 = a3;
  if (a4)
  {
    v6 = LACLogFaceIDUI(self);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("fade-out");
      if (v4)
        v8 = CFSTR("fade-in");
      v14 = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ has finished %{public}@ animation", (uint8_t *)&v14, 0x16u);
    }

    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController glyphView](self, "glyphView"));
      v10 = objc_msgSend(v9, "state");

      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController glyphView](self, "glyphView"));
        objc_msgSend(v11, "setState:animated:", 1, 1);

      }
    }
  }
  else
  {
    if (a3)
    {
      -[FaceIdToastViewController _setTransformScale:](self, "_setTransformScale:", 0);
      -[UIView setAlpha:](self->_toastView, "setAlpha:", 1.0);
      glyphWrapper = self->_glyphWrapper;
      v13 = 1.0;
    }
    else
    {
      -[FaceIdToastViewController _setTransformScale:](self, "_setTransformScale:", 1);
      glyphWrapper = self->_toastView;
      v13 = 0.0;
    }
    objc_msgSend(glyphWrapper, "setAlpha:", v13);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id buf[2];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FaceIdToastViewController;
  -[FaceIdToastViewController viewWillDisappear:](&v12, "viewWillDisappear:", a3);
  v4 = -[PresentationViewController isDynamicIslandAvailable](self, "isDynamicIslandAvailable");
  if (!v4)
  {
    v5 = LACLogFaceIDUI(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Face ID glyph will disappear", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001D3E4;
    v9[3] = &unk_100079B80;
    objc_copyWeak(&v10, buf);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001D418;
    v7[3] = &unk_10007A398;
    objc_copyWeak(&v8, buf);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v9, v7, 0.2, 0.0);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FaceIdToastViewController;
  -[FaceIdToastViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[FaceIdToastViewController _adjustToastSizeForAccessibilityIfNeeded](self, "_adjustToastSizeForAccessibilityIfNeeded");
}

- (void)setTitleText:(id)a3
{
  -[UILabel setText:](self->_glyphLabel, "setText:", a3);
}

- (void)dismissWithDelay:(double)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  dispatch_time_t v7;
  id *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  void (**v17)(_QWORD);
  id v18;
  id location;

  v6 = (void (**)(_QWORD))a4;
  objc_initWeak(&location, self);
  if (-[PresentationViewController isDynamicIslandAvailable](self, "isDynamicIslandAvailable"))
  {
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D6B8;
    block[3] = &unk_100079DA0;
    v8 = &v18;
    objc_copyWeak(&v18, &location);
    v17 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

LABEL_6:
    objc_destroyWeak(v8);
    goto LABEL_9;
  }
  if (-[FaceIdToastViewController isViewLoaded](self, "isViewLoaded"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

    if (v10)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10001D6F4;
      v14[3] = &unk_100079B80;
      v8 = &v15;
      objc_copyWeak(&v15, &location);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001D790;
      v11[3] = &unk_10007A3C0;
      objc_copyWeak(&v13, &location);
      v12 = v6;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v14, v11, 0.2, a3);

      objc_destroyWeak(&v13);
      goto LABEL_6;
    }
  }
  if (v6)
    v6[2](v6);
LABEL_9:
  objc_destroyWeak(&location);

}

- (void)_setTransformScale:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v3 = a3;
  if (!-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
  {
    v5 = 0.88;
    if (!v3)
      v5 = 1.0;
    CGAffineTransformMakeScale(&v8, v5, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
    v7 = v8;
    objc_msgSend(v6, "setTransform:", &v7);

  }
}

- (void)_shrinkAndRevokeWithCompletion:(id)a3
{
  id v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;
  _QWORD v10[5];

  v4 = a3;
  if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
  {
    self->_collapsingFromExpansion = -[FaceIdToastViewController _lightweightJindoExpansion](self, "_lightweightJindoExpansion");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001D9A0;
    v10[3] = &unk_100079A08;
    v10[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.1);
    -[FaceIdToastViewController _updateLightweightConstraintsWithCoordinatedAnimations](self, "_updateLightweightConstraintsWithCoordinatedAnimations");
    objc_initWeak(&location, self);
    v5 = dispatch_time(0, 200000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001D9E8;
    v6[3] = &unk_100079DA0;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PresentationViewController revokePresentableWithCompletionHandler:](self, "revokePresentableWithCompletionHandler:", v4);
  }

}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_setupSubviews
{
  if (-[PresentationViewController isDynamicIslandAvailable](self, "isDynamicIslandAvailable"))
  {
    if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
      -[FaceIdToastViewController _setupLightweightViews](self, "_setupLightweightViews");
    else
      -[FaceIdToastViewController _setupGlyphWrapper:](self, "_setupGlyphWrapper:", 1);
  }
  else
  {
    -[FaceIdToastViewController _setupToastView](self, "_setupToastView");
    -[FaceIdToastViewController _setupGlyphWrapper:](self, "_setupGlyphWrapper:", 0);
    -[FaceIdToastViewController _setupGlyphLabel](self, "_setupGlyphLabel");
  }
}

- (void)_setupToastView
{
  UIView *v3;
  UIView *toastView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  v3 = (UIView *)objc_alloc_init((Class)UIView);
  toastView = self->_toastView;
  self->_toastView = v3;

  -[UIView setOpaque:](self->_toastView, "setOpaque:", 0);
  -[UIView setClipsToBounds:](self->_toastView, "setClipsToBounds:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_toastView, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 9.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_toastView, "layer"));
  objc_msgSend(v6, "setCornerCurve:", kCACornerCurveContinuous);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_toastView);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_toastView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _toastViewContraints](self, "_toastViewContraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

  v9 = 1.0;
  if (!self->_iPad)
  {
    -[FaceIdToastViewController _setTransformScale:](self, "_setTransformScale:", 1, 1.0);
    v9 = 0.0;
  }
  -[UIView setAlpha:](self->_toastView, "setAlpha:", v9);
  -[FaceIdToastViewController _setupToastBackdropAndVibrancyView](self, "_setupToastBackdropAndVibrancyView");
}

- (id)_toastViewContraints
{
  uint64_t v2;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *toastViewWidthAnchor;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *toastViewHeightAnchor;
  double v10;
  NSLayoutConstraint *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  UIView *toastView;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_toastView, "widthAnchor"));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", self->_toastViewSize.width));
  toastViewWidthAnchor = self->_toastViewWidthAnchor;
  self->_toastViewWidthAnchor = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_toastView, "heightAnchor"));
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", self->_toastViewSize.height));
  toastViewHeightAnchor = self->_toastViewHeightAnchor;
  self->_toastViewHeightAnchor = v8;

  LODWORD(v10) = 1132068864;
  -[NSLayoutConstraint setPriority:](self->_toastViewHeightAnchor, "setPriority:", v10);
  v11 = self->_toastViewHeightAnchor;
  v26[0] = self->_toastViewWidthAnchor;
  v26[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_toastView, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v25 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v26[2] = v15;
  v16 = -[FaceIdToastViewController lightweightUI](self, "lightweightUI");
  toastView = self->_toastView;
  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](toastView, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "safeAreaLayoutGuide"));
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v21 = 5.0;
    if (!self->_iPad)
      v21 = -5.0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v2, v21));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](toastView, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
  }
  v26[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
  if (v16)
  {

    v22 = (void *)v2;
  }

  return v23;
}

- (void)_setupToastBackdropAndVibrancyView
{
  UIBlurEffect *v3;
  UIBlurEffect *blurEffect;
  UIVisualEffectView *v5;
  UIVisualEffectView *backdropView;
  UIVibrancyEffect *v7;
  UIVibrancyEffect *vibrancyEffect;
  UIVisualEffectView *v9;
  UIVisualEffectView *overlayEffectView;
  void *v11;
  int64_t v12;
  _BOOL8 v13;
  int64_t v14;
  UIView *v15;
  UIView *glyphWrapperParent;

  v3 = (UIBlurEffect *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200));
  blurEffect = self->_blurEffect;
  self->_blurEffect = v3;

  v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", self->_blurEffect);
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  -[UIView addSubview:](self->_toastView, "addSubview:", self->_backdropView);
  -[FaceIdToastViewController _anchorToastViewToView:](self, "_anchorToastViewToView:", self->_backdropView);
  v7 = (UIVibrancyEffect *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:", self->_blurEffect, 101));
  vibrancyEffect = self->_vibrancyEffect;
  self->_vibrancyEffect = v7;

  v9 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", self->_vibrancyEffect);
  overlayEffectView = self->_overlayEffectView;
  self->_overlayEffectView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_backdropView, "contentView"));
  objc_msgSend(v11, "addSubview:", self->_overlayEffectView);

  -[FaceIdToastViewController _anchorToastViewToView:](self, "_anchorToastViewToView:", self->_overlayEffectView);
  v12 = -[FaceIdToastViewController lightweightUIMode](self, "lightweightUIMode");
  if (v12 == LACLightweightUIModeNone)
  {
    v13 = 1;
  }
  else
  {
    v14 = -[FaceIdToastViewController lightweightUIMode](self, "lightweightUIMode");
    v13 = v14 == LACLightweightUIModeOverContent;
  }
  -[FaceIdToastViewController _setBackdropEnabled:animated:](self, "_setBackdropEnabled:animated:", v13, 0);
  v15 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_overlayEffectView, "contentView"));
  glyphWrapperParent = self->_glyphWrapperParent;
  self->_glyphWrapperParent = v15;

}

- (id)_backdropRenderingHintColor
{
  double v2;
  double v3;
  double v4;

  if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
  {
    v2 = 1.0;
    v3 = 1.0;
    v4 = 1.0;
  }
  else
  {
    v2 = 0.168627451;
    v3 = 0.231372549;
    v4 = 0.321568627;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v2, v3, v4, 0.12));
}

- (void)_anchorToastViewToView:(id)a3
{
  id v4;
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
  _QWORD v18[4];

  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_toastView, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v18[0] = v15;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_toastView, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v18[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_toastView, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v18[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_toastView, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v18[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)_setupGlyphWrapper:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  LAUIPearlGlyphViewAutoLayoutWrapper *v7;
  LAUIPearlGlyphViewAutoLayoutWrapper *glyphWrapper;
  UIView *glyphWrapperParent;
  UIView *v10;
  UIView *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  NSArray *glyphConstraints;
  unsigned int v21;
  LAUIPearlGlyphViewAutoLayoutWrapper *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  _QWORD v39[4];
  _QWORD v40[2];

  v3 = a3;
  v5 = objc_alloc((Class)LAUIPearlGlyphViewAutoLayoutWrapper);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController glyphView](self, "glyphView"));
  v7 = (LAUIPearlGlyphViewAutoLayoutWrapper *)objc_msgSend(v5, "initWithGlyphView:", v6);
  glyphWrapper = self->_glyphWrapper;
  self->_glyphWrapper = v7;

  glyphWrapperParent = self->_glyphWrapperParent;
  if (glyphWrapperParent)
    v10 = glyphWrapperParent;
  else
    v10 = (UIView *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v11 = v10;
  -[UIView addSubview:](v10, "addSubview:", self->_glyphWrapper);
  v12 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_dispatchTapBlock:");
  -[UIView addGestureRecognizer:](v11, "addGestureRecognizer:", v12);

  -[LAUIPearlGlyphViewAutoLayoutWrapper setTranslatesAutoresizingMaskIntoConstraints:](self->_glyphWrapper, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (v3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper widthAnchor](self->_glyphWrapper, "widthAnchor"));
    if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
      v14 = 20.0;
    else
      v14 = 69.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", v14));
    v40[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper heightAnchor](self->_glyphWrapper, "heightAnchor"));
    if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
      v17 = 20.0;
    else
      v17 = 69.0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", v17));
    v40[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

    glyphConstraints = self->_glyphConstraints;
    self->_glyphConstraints = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    v21 = -[FaceIdToastViewController lightweightUI](self, "lightweightUI");
    v22 = self->_glyphWrapper;
    v38 = v21;
    if (v21)
    {
      glyphConstraints = (NSArray *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper centerYAnchor](v22, "centerYAnchor"));
      v36 = objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v11, "centerYAnchor"));
      v23 = objc_claimAutoreleasedReturnValue(-[NSArray constraintEqualToAnchor:](glyphConstraints, "constraintEqualToAnchor:"));
    }
    else
    {
      glyphConstraints = (NSArray *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper topAnchor](v22, "topAnchor"));
      v35 = objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v11, "topAnchor"));
      v23 = objc_claimAutoreleasedReturnValue(-[NSArray constraintEqualToAnchor:constant:](glyphConstraints, "constraintEqualToAnchor:constant:", 28.0));
    }
    v37 = (void *)v23;
    v39[0] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper centerXAnchor](self->_glyphWrapper, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v11, "centerXAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v39[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper widthAnchor](self->_glyphWrapper, "widthAnchor"));
    if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
      v28 = 36.0;
    else
      v28 = 70.0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", v28));
    v39[2] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper heightAnchor](self->_glyphWrapper, "heightAnchor"));
    if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
      v31 = 36.0;
    else
      v31 = 70.0;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:", v31));
    v39[3] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

    if ((v38 & 1) != 0)
      v34 = (void *)v36;
    else
      v34 = (void *)v35;

  }
}

- (void)_setupGlyphLabel
{
  UILabel *v3;
  UILabel *glyphLabel;
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
  void *v20;
  void *v21;
  id v22;

  if (self->_titleText)
  {
    if (!-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
    {
      v3 = (UILabel *)objc_alloc_init((Class)UILabel);
      glyphLabel = self->_glyphLabel;
      self->_glyphLabel = v3;

      -[UILabel setText:](self->_glyphLabel, "setText:", self->_titleText);
      -[UILabel setNumberOfLines:](self->_glyphLabel, "setNumberOfLines:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
      -[UILabel setFont:](self->_glyphLabel, "setFont:", v5);

      -[UILabel setTextAlignment:](self->_glyphLabel, "setTextAlignment:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      -[UILabel setTextColor:](self->_glyphLabel, "setTextColor:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_overlayEffectView, "contentView"));
      objc_msgSend(v7, "addSubview:", self->_glyphLabel);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_glyphLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_glyphLabel, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper bottomAnchor](self->_glyphWrapper, "bottomAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 20.0));
      objc_msgSend(v10, "setActive:", 1);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_glyphLabel, "leadingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_overlayEffectView, "contentView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 20.0));
      objc_msgSend(v14, "setActive:", 1);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_glyphLabel, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_overlayEffectView, "contentView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -20.0));
      objc_msgSend(v18, "setActive:", 1);

      v22 = (id)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_glyphLabel, "bottomAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_overlayEffectView, "contentView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:constant:", v20, -20.0));
      objc_msgSend(v21, "setActive:", 1);

    }
  }
}

- (void)_setupLightweightViews
{
  void *v3;
  FaceIdLightweightLeadingView *v4;
  FaceIdLightweightLeadingView *lightweightLeadingView;
  void *v6;
  FaceIdLightweightTrailingView *v7;
  FaceIdLightweightTrailingView *lightweightTrailingView;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = objc_opt_new(FaceIdLightweightLeadingView);
  lightweightLeadingView = self->_lightweightLeadingView;
  self->_lightweightLeadingView = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_lightweightLeadingView);

  -[FaceIdLightweightLeadingView setTranslatesAutoresizingMaskIntoConstraints:](self->_lightweightLeadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = objc_opt_new(FaceIdLightweightTrailingView);
  lightweightTrailingView = self->_lightweightTrailingView;
  self->_lightweightTrailingView = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_lightweightTrailingView);

  -[FaceIdLightweightTrailingView setTranslatesAutoresizingMaskIntoConstraints:](self->_lightweightTrailingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (CGSize)_lightweightJindoContainerSize
{
  unint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (unint64_t)-[FaceIdToastViewController _lightweightJindoExpansion](self, "_lightweightJindoExpansion") - 1;
  if (v2 > 2)
  {
    v4 = 36.0;
    v3 = 160.0;
  }
  else
  {
    v3 = dbl_10005FE70[v2];
    v4 = dbl_10005FE88[v2];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_lightweightJindoContentSizeForExpansion:(int64_t)a3
{
  BOOL v3;
  uint64_t v4;
  double v5;
  double v6;
  CGSize result;

  if (a3 == 1)
  {
    v3 = !-[FaceIdToastViewController _isEarlyExpansion](self, "_isEarlyExpansion");
    v4 = 0x4044000000000000;
  }
  else
  {
    v3 = a3 == 2;
    v4 = 0x4040000000000000;
  }
  v5 = *(double *)&v4;
  if (!v3)
    v5 = 16.0;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)_isEarlyExpansion
{
  double v2;

  -[NSDate timeIntervalSinceNow](self->_timeAppeared, "timeIntervalSinceNow");
  return v2 > -0.2;
}

- (BOOL)_isCollapsingFromFullExpansion
{
  return self->_collapsingFromExpansion == 1;
}

- (CGVector)_lightweightJindoContentShiftOnLeading:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  double v6;
  double v7;
  unsigned int v8;
  double v9;
  unsigned int v10;
  CGVector result;

  v3 = a3;
  v5 = -[FaceIdToastViewController _lightweightJindoExpansion](self, "_lightweightJindoExpansion");
  if (v5 == 1)
  {
    v8 = -[FaceIdToastViewController _isEarlyExpansion](self, "_isEarlyExpansion");
    v7 = 7.0;
    v9 = 8.0;
    if (v3)
      v7 = 8.0;
    else
      v9 = 20.0;
    if (v8)
    {
      v7 = v9;
      v6 = -5.0;
    }
    else
    {
      v6 = 0.0;
    }
  }
  else if (v5 == 3)
  {
    v10 = -[FaceIdToastViewController _isCollapsingFromFullExpansion](self, "_isCollapsingFromFullExpansion");
    v6 = 18.0;
    if (!v10)
      v6 = 10.0;
    v7 = 0.0;
  }
  else
  {
    v6 = 0.0;
    v7 = 2.0;
    if (v3)
      v7 = 5.0;
    if (v5 != 2)
      v7 = 0.0;
  }
  result.dy = v6;
  result.dx = v7;
  return result;
}

- (void)_updateLightweightConstraintsWithCoordinatedAnimations
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI")
    && self->_lightweightViewWidthAnchor
    && self->_lightweightViewHeightAnchor)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController systemApertureElementContext](self, "systemApertureElementContext"));

    if (v3)
    {
      objc_initWeak(&location, self);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController systemApertureElementContext](self, "systemApertureElementContext"));
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10001EB88;
      v5[3] = &unk_100079B80;
      objc_copyWeak(&v6, &location);
      objc_msgSend(v4, "setElementNeedsUpdateWithCoordinatedAnimations:", v5);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      -[FaceIdToastViewController _updateLightweightConstraints](self, "_updateLightweightConstraints");
    }
  }
}

- (void)_updateLightweightConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSLayoutConstraint *lightweightViewWidthAnchor;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *lightweightViewHeightAnchor;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSLayoutConstraint *lightweightLeadingLeadingAnchor;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *lightweightLeadingCenterYAnchor;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSLayoutConstraint *lightweightTrailingTrailingAnchor;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *lightweightTrailingCenterYAnchor;
  void *v49;
  void *v50;
  void *v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *v53;
  id v54;

  -[FaceIdToastViewController _lightweightJindoContainerSize](self, "_lightweightJindoContainerSize");
  v4 = v3;
  v6 = v5;
  lightweightViewWidthAnchor = self->_lightweightViewWidthAnchor;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "widthAnchor"));
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightViewWidthAnchor, v8, v10, 0, v4));
  v12 = self->_lightweightViewWidthAnchor;
  self->_lightweightViewWidthAnchor = v11;

  lightweightViewHeightAnchor = self->_lightweightViewHeightAnchor;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightViewHeightAnchor, v14, v16, 0, v6));
  v18 = self->_lightweightViewHeightAnchor;
  self->_lightweightViewHeightAnchor = v17;

  -[FaceIdToastViewController _updateLightweightContentSize](self, "_updateLightweightContentSize");
  -[FaceIdToastViewController _lightweightJindoContentShiftOnLeading:](self, "_lightweightJindoContentShiftOnLeading:", 1);
  v20 = v19;
  v22 = v21;
  lightweightLeadingLeadingAnchor = self->_lightweightLeadingLeadingAnchor;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView leadingAnchor](self->_lightweightLeadingView, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightLeadingLeadingAnchor, v24, v25, v27, v20));
  v29 = self->_lightweightLeadingLeadingAnchor;
  self->_lightweightLeadingLeadingAnchor = v28;

  lightweightLeadingCenterYAnchor = self->_lightweightLeadingCenterYAnchor;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView centerYAnchor](self->_lightweightLeadingView, "centerYAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerYAnchor"));
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightLeadingCenterYAnchor, v31, v32, v34, v22));
  v36 = self->_lightweightLeadingCenterYAnchor;
  self->_lightweightLeadingCenterYAnchor = v35;

  -[FaceIdToastViewController _lightweightJindoContentShiftOnLeading:](self, "_lightweightJindoContentShiftOnLeading:", 0);
  v38 = v37;
  v40 = v39;
  lightweightTrailingTrailingAnchor = self->_lightweightTrailingTrailingAnchor;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView trailingAnchor](self->_lightweightTrailingView, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightTrailingTrailingAnchor, v42, v43, v45, -v38));
  v47 = self->_lightweightTrailingTrailingAnchor;
  self->_lightweightTrailingTrailingAnchor = v46;

  lightweightTrailingCenterYAnchor = self->_lightweightTrailingCenterYAnchor;
  v54 = (id)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView centerYAnchor](self->_lightweightTrailingView, "centerYAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "centerYAnchor"));
  v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightTrailingCenterYAnchor, v54, v49, v51, v40));
  v53 = self->_lightweightTrailingCenterYAnchor;
  self->_lightweightTrailingCenterYAnchor = v52;

}

- (void)_updateLightweightContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSLayoutConstraint *lightweightLeadingWidthAnchor;
  FaceIdLightweightLeadingView *lightweightLeadingView;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *lightweightLeadingHeightAnchor;
  FaceIdLightweightLeadingView *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *lightweightTrailingWidthAnchor;
  FaceIdLightweightTrailingView *lightweightTrailingView;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *lightweightTrailingHeightAnchor;
  FaceIdLightweightTrailingView *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *v25;
  id v26;

  -[FaceIdToastViewController _lightweightJindoContentSizeForExpansion:](self, "_lightweightJindoContentSizeForExpansion:", -[FaceIdToastViewController _lightweightJindoExpansion](self, "_lightweightJindoExpansion"));
  v4 = v3;
  v6 = v5;
  lightweightLeadingWidthAnchor = self->_lightweightLeadingWidthAnchor;
  lightweightLeadingView = self->_lightweightLeadingView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView widthAnchor](lightweightLeadingView, "widthAnchor"));
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightLeadingWidthAnchor, lightweightLeadingView, v9, 0, v4));
  v11 = self->_lightweightLeadingWidthAnchor;
  self->_lightweightLeadingWidthAnchor = v10;

  lightweightLeadingHeightAnchor = self->_lightweightLeadingHeightAnchor;
  v13 = self->_lightweightLeadingView;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView heightAnchor](v13, "heightAnchor"));
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightLeadingHeightAnchor, v13, v14, 0, v6));
  v16 = self->_lightweightLeadingHeightAnchor;
  self->_lightweightLeadingHeightAnchor = v15;

  lightweightTrailingWidthAnchor = self->_lightweightTrailingWidthAnchor;
  lightweightTrailingView = self->_lightweightTrailingView;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView widthAnchor](lightweightTrailingView, "widthAnchor"));
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightTrailingWidthAnchor, lightweightTrailingView, v19, 0, v4));
  v21 = self->_lightweightTrailingWidthAnchor;
  self->_lightweightTrailingWidthAnchor = v20;

  lightweightTrailingHeightAnchor = self->_lightweightTrailingHeightAnchor;
  v23 = self->_lightweightTrailingView;
  v26 = (id)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView heightAnchor](v23, "heightAnchor"));
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _updateConstraint:ofView:anchor1:anchor2:constant:](self, "_updateConstraint:ofView:anchor1:anchor2:constant:", lightweightTrailingHeightAnchor, v23, v26, 0, v6));
  v25 = self->_lightweightTrailingHeightAnchor;
  self->_lightweightTrailingHeightAnchor = v24;

}

- (id)_updateConstraint:(id)a3 ofView:(id)a4 anchor1:(id)a5 anchor2:(id)a6 constant:(double)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  double v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v11)
  {
    objc_msgSend(v11, "setConstant:", a7);
    v16 = v11;
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001F1E0;
    v20[3] = &unk_10007A3E8;
    v21 = v14;
    v22 = v13;
    v23 = a7;
    v18 = sub_10001F1E0((uint64_t)v20, v17);
    v16 = (id)objc_claimAutoreleasedReturnValue(v18);
    if (v16)
      objc_msgSend(v12, "addConstraint:", v16);

  }
  return v16;
}

- (int64_t)_lightweightJindoExpansion
{
  if (!self->_timeAppeared)
    return 0;
  if (self->_collapsingFromExpansion)
    return 3;
  return -[FaceIdToastViewController _lightweightJindoExpansionForState:](self, "_lightweightJindoExpansionForState:", self->_glyphState);
}

- (void)_updateGlyphConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *glyphConstraints;
  _QWORD v9[2];

  if (!-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_glyphConstraints);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "SBUISA_systemApertureObstructedAreaLayoutGuide"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _glyphAnchorWithObstructedLayoutGuide:](self, "_glyphAnchorWithObstructedLayoutGuide:", v4));
    v9[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _centeringAnchorWithObstructedLayoutGuide:](self, "_centeringAnchorWithObstructedLayoutGuide:", v4));
    v9[1] = v6;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
    glyphConstraints = self->_glyphConstraints;
    self->_glyphConstraints = v7;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_glyphConstraints);
  }
}

- (void)updateGlyphConstraintsIfOrientationChanged
{
  int64_t interfaceOrientation;
  void *v4;
  void *v5;

  interfaceOrientation = self->_interfaceOrientation;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
  objc_msgSend(v5, "layoutFrame");
  self->_interfaceOrientation = -[FaceIdToastViewController _interfaceOrientationFromObstructedArea:](self, "_interfaceOrientationFromObstructedArea:");

  if (interfaceOrientation != self->_interfaceOrientation)
    -[FaceIdToastViewController _updateGlyphConstraints](self, "_updateGlyphConstraints");
}

- (int64_t)_interfaceOrientationFromObstructedArea:(CGRect)a3
{
  double MaxY;
  void *v5;
  int64_t v6;
  double MaxX;
  CGRect v9;
  CGRect v10;

  if (a3.size.width <= a3.size.height)
  {
    MaxX = CGRectGetMaxX(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    if (MaxX >= CGRectGetMidX(v10))
      v6 = 3;
    else
      v6 = 4;
  }
  else
  {
    MaxY = CGRectGetMaxY(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    if (MaxY < CGRectGetMidY(v9))
      v6 = 1;
    else
      v6 = 2;
  }

  return v6;
}

- (id)_glyphAnchorWithObstructedLayoutGuide:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  switch(self->_interfaceOrientation)
  {
    case 0:
      v6 = LACLogFaceIDUI(v4);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100056550(v7);

      goto LABEL_5;
    case 1:
LABEL_5:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper topAnchor](self->_glyphWrapper, "topAnchor"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
      goto LABEL_9;
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper bottomAnchor](self->_glyphWrapper, "bottomAnchor"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
      goto LABEL_9;
    case 3:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper trailingAnchor](self->_glyphWrapper, "trailingAnchor"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      goto LABEL_9;
    case 4:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper leadingAnchor](self->_glyphWrapper, "leadingAnchor"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
LABEL_9:
      v10 = (void *)v9;
      self = (FaceIdToastViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));

      break;
    default:
      break;
  }

  return self;
}

- (id)_centeringAnchorWithObstructedLayoutGuide:(id)a3
{
  unint64_t v3;
  LAUIPearlGlyphViewAutoLayoutWrapper *glyphWrapper;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = self->_interfaceOrientation - 3;
  glyphWrapper = self->_glyphWrapper;
  v5 = a3;
  if (v3 >= 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper centerXAnchor](glyphWrapper, "centerXAnchor"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper centerYAnchor](glyphWrapper, "centerYAnchor"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
  }
  v8 = (void *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  return v9;
}

- (void)_dispatchTapBlock:(id)a3
{
  void (**onTap)(void);

  onTap = (void (**)(void))self->_onTap;
  if (onTap)
    onTap[2]();
}

- (void)_adjustToastSizeForAccessibilityIfNeeded
{
  double v3;

  v3 = sub_10001F72C();
  -[NSLayoutConstraint setConstant:](self->_toastViewWidthAnchor, "setConstant:", v3 * self->_toastViewSize.width);
  -[NSLayoutConstraint setConstant:](self->_toastViewHeightAnchor, "setConstant:", v3 * self->_toastViewSize.height);
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  void *v4;
  void *v5;

  if (self->_activeLayoutMode != a3)
  {
    self->_activeLayoutMode = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController systemApertureElementContext](self, "systemApertureElementContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestAlertingAssertion"));
    objc_msgSend(v5, "setAutomaticallyInvalidatable:", 0);

    if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
      -[FaceIdToastViewController _updateLightweightConstraints](self, "_updateLightweightConstraints");
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001F8B8;
  v3[3] = &unk_100079D78;
  v3[4] = self;
  objc_msgSend(a3, "animateAlongsideTransition:completion:", v3, &stru_10007A428);
}

- (int64_t)preferredCustomLayout
{
  return -[FaceIdToastViewController lightweightUI](self, "lightweightUI") ^ 1;
}

- (id)keyColor
{
  void *v2;

  if (-[FaceIdToastViewController _isSuccessfulState:](self, "_isSuccessfulState:", self->_glyphState))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.192, 0.82, 0.345, 1.0));
  else
    v2 = 0;
  return v2;
}

- (int64_t)glyphState
{
  return self->_glyphState;
}

- (BOOL)_isSuccessfulState:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x1EEu >> a3);
}

- (int64_t)_lightweightJindoExpansionForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 2;
  else
    return qword_10005FEA0[a3 - 1];
}

- (id)_descriptionOfGlyphState:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return CFSTR("UNKNOWN");
  else
    return off_10007A448[a3];
}

- (void)setGlyphState:(int64_t)a3 animated:(BOOL)a4
{
  int64_t glyphState;
  _BOOL8 v5;
  unsigned int v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  id v15;

  glyphState = self->_glyphState;
  if (glyphState != a3)
  {
    v5 = a4;
    self->_glyphState = a3;
    if (-[PresentationViewController isDynamicIslandAvailable](self, "isDynamicIslandAvailable"))
    {
      v8 = -[FaceIdToastViewController _isSuccessfulState:](self, "_isSuccessfulState:", glyphState);
      if (v8 != -[FaceIdToastViewController _isSuccessfulState:](self, "_isSuccessfulState:", a3))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController systemApertureElementContext](self, "systemApertureElementContext"));
        objc_msgSend(v9, "setElementNeedsUpdate");

      }
    }
    if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
    {
      -[FaceIdLightweightLeadingView setState:](self->_lightweightLeadingView, "setState:", -[FaceIdToastViewController _leadingViewStateFromGlyphState:](self, "_leadingViewStateFromGlyphState:", a3));
      v10 = -[FaceIdToastViewController _spinnerStateForGlyphState:](self, "_spinnerStateForGlyphState:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView faceIDSpinnerView](self->_lightweightTrailingView, "faceIDSpinnerView"));
      objc_msgSend(v11, "setState:", v10);

      if (a3 == 3 && !-[PresentationViewController isDynamicIslandAvailable](self, "isDynamicIslandAvailable"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController glyphView](self, "glyphView"));
        objc_msgSend(v12, "setStyle:animated:", 2, 1);

        v13 = -[FaceIdToastViewController lightweightUIMode](self, "lightweightUIMode");
        if (v13 == LACLightweightUIModeOverShield)
          -[FaceIdToastViewController _setBackdropEnabled:animated:](self, "_setBackdropEnabled:animated:", 1, 1);
      }
      v14 = -[FaceIdToastViewController _lightweightJindoExpansionForState:](self, "_lightweightJindoExpansionForState:", glyphState);
      if (v14 != (void *)-[FaceIdToastViewController _lightweightJindoExpansionForState:](self, "_lightweightJindoExpansionForState:", a3))-[FaceIdToastViewController _updateLightweightConstraintsWithCoordinatedAnimations](self, "_updateLightweightConstraintsWithCoordinatedAnimations");
    }
    v15 = (id)objc_claimAutoreleasedReturnValue(-[LAUIPearlGlyphViewAutoLayoutWrapper glyphView](self->_glyphWrapper, "glyphView"));
    objc_msgSend(v15, "setState:animated:", a3, v5);

  }
}

- (int64_t)_leadingViewStateFromGlyphState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return qword_10005FEC8[a3];
}

- (int64_t)_spinnerStateForGlyphState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_10005FEF0[a3 - 1];
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(void);
  NSDate *v12;
  NSDate *timeAppeared;
  dispatch_time_t v14;
  _QWORD block[5];
  objc_super v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;

  v4 = a3;
  v5 = LACLogFaceIDUI(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Face ID glyph appeared in %{public}@", buf, 0xCu);
  }

  v17.receiver = self;
  v17.super_class = (Class)FaceIdToastViewController;
  -[PresentationViewController presentableDidAppearAsBanner:](&v17, "presentableDidAppearAsBanner:", v4);
  if (self->_shakeOnAppeared)
  {
    self->_shakeOnAppeared = 0;
    v16.receiver = self;
    v16.super_class = (Class)FaceIdToastViewController;
    -[PresentationViewController shake](&v16, "shake");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController glyphView](self, "glyphView"));
  v8 = objc_msgSend(v7, "state");

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController glyphView](self, "glyphView"));
    objc_msgSend(v9, "setState:animated:", 1, 1);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController onDynamicIslandPresented](self, "onDynamicIslandPresented"));

  if (v10)
  {
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController onDynamicIslandPresented](self, "onDynamicIslandPresented"));
    v11[2]();

  }
  if (-[FaceIdToastViewController lightweightUI](self, "lightweightUI"))
  {
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    timeAppeared = self->_timeAppeared;
    self->_timeAppeared = v12;

    -[FaceIdToastViewController _updateLightweightConstraintsWithCoordinatedAnimations](self, "_updateLightweightConstraintsWithCoordinatedAnimations");
    v14 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001FDDC;
    block[3] = &unk_100079A08;
    block[4] = self;
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FaceIdToastViewController;
  v6 = a4;
  -[PresentationViewController presentableWillDisappearAsBanner:withReason:](&v7, "presentableWillDisappearAsBanner:withReason:", a3, v6);
  LODWORD(a3) = objc_msgSend(v6, "isEqualToString:", CFSTR("removed via pan gesture"), v7.receiver, v7.super_class);

  if ((_DWORD)a3)
    -[FaceIdToastViewController _dispatchTapBlock:](self, "_dispatchTapBlock:", 0);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSDate *timeAppeared;
  objc_super v11;
  uint8_t buf[4];
  id v13;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FaceIdToastViewController;
  v7 = -[PresentationViewController presentableDidDisappearAsBanner:withReason:](&v11, "presentableDidDisappearAsBanner:withReason:", v6, a4);
  v8 = LACLogFaceIDUI(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Face ID glyph disappeared in %{public}@", buf, 0xCu);
  }

  timeAppeared = self->_timeAppeared;
  self->_timeAppeared = 0;

}

- (id)leadingView
{
  return 0;
}

- (id)trailingView
{
  return 0;
}

- (id)minimalView
{
  return 0;
}

- (void)shake
{
  objc_super v3;

  if (-[PresentationViewController isActive](self, "isActive"))
  {
    v3.receiver = self;
    v3.super_class = (Class)FaceIdToastViewController;
    -[PresentationViewController shake](&v3, "shake");
  }
  else
  {
    self->_shakeOnAppeared = 1;
  }
}

- (void)_setBackdropEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  if (a4)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000200B4;
    v5[3] = &unk_100079BA8;
    objc_copyWeak(&v6, &location);
    v7 = a3;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.3);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    -[FaceIdToastViewController _setBackdropEnabled:](self, "_setBackdropEnabled:", a3);
  }
}

- (void)_setBackdropEnabled:(BOOL)a3
{
  UIVisualEffectView **p_backdropView;
  uint64_t v5;
  void *v6;
  id v7;

  p_backdropView = &self->_backdropView;
  if (a3)
  {
    -[UIVisualEffectView setEffect:](self->_backdropView, "setEffect:", self->_blurEffect);
    -[UIVisualEffectView setEffect:](self->_overlayEffectView, "setEffect:", self->_vibrancyEffect);
    v5 = objc_claimAutoreleasedReturnValue(-[FaceIdToastViewController _backdropRenderingHintColor](self, "_backdropRenderingHintColor"));
  }
  else
  {
    -[UIVisualEffectView setEffect:](self->_backdropView, "setEffect:", 0);
    -[UIVisualEffectView setEffect:](self->_overlayEffectView, "setEffect:", 0);
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  }
  v7 = (id)v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](*p_backdropView, "contentView"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (BOOL)lightweightUI
{
  int64_t v2;

  v2 = -[FaceIdToastViewController lightweightUIMode](self, "lightweightUIMode");
  return v2 != LACLightweightUIModeNone;
}

- (id)onTap
{
  return self->_onTap;
}

- (void)setOnTap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (id)onDynamicIslandPresented
{
  return self->_onDynamicIslandPresented;
}

- (void)setOnDynamicIslandPresented:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (int64_t)lightweightUIMode
{
  return self->_lightweightUIMode;
}

- (BOOL)toastBackdropEnabled
{
  return self->_toastBackdropEnabled;
}

- (void)setToastBackdropEnabled:(BOOL)a3
{
  self->_toastBackdropEnabled = a3;
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong(&self->_onDynamicIslandPresented, 0);
  objc_storeStrong(&self->_onTap, 0);
  objc_storeStrong((id *)&self->_timeAppeared, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingView, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingView, 0);
  objc_storeStrong((id *)&self->_glyphConstraints, 0);
  objc_storeStrong((id *)&self->_glyphWrapperParent, 0);
  objc_storeStrong((id *)&self->_glyphWrapper, 0);
  objc_storeStrong((id *)&self->_glyphLabel, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingCenterYAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingTrailingAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingHeightAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingWidthAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingCenterYAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingHeightAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingWidthAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightViewHeightAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightViewWidthAnchor, 0);
  objc_storeStrong((id *)&self->_toastViewHeightAnchor, 0);
  objc_storeStrong((id *)&self->_toastViewWidthAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightBackdropView, 0);
  objc_storeStrong((id *)&self->_overlayEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_toastView, 0);
}

@end
