@implementation CBRecordingIndicatorViewController

- (id)initForLocation:(unint64_t)a3
{
  CBRecordingIndicatorViewController *v4;
  uint64_t v5;
  void *v6;
  CBRecordingIndicatorView *v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CBRecordingIndicatorViewController;
  v4 = -[CBRecordingIndicatorViewController init](&v12, "init");
  v5 = (uint64_t)v4;
  if (v4)
  {
    v4->_location = a3;
    v4->_activeInterfaceOrientation = 1;
    v4->_indicatorState = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorViewController view](v4, "view"));
    v7 = objc_alloc_init(CBRecordingIndicatorView);
    -[CBRecordingIndicatorView setAutoresizingMask:](v7, "setAutoresizingMask:", 0);
    objc_storeStrong((id *)(v5 + 144), v7);
    if (objc_msgSend((id)v5, "location") == (id)2 || *(_BYTE *)(v5 + 120) && !objc_msgSend((id)v5, "location"))
    {
      v8 = objc_alloc_init((Class)UIView);
      v9 = *(void **)(v5 + 136);
      *(_QWORD *)(v5 + 136) = v8;
      v10 = v8;

      objc_msgSend(v6, "addSubview:", v10);
      objc_msgSend(v10, "addSubview:", v7);

      if (!a3)
      {
LABEL_8:
        sub_10000AC68((id *)v5);
        *(_BYTE *)(v5 + 120) = +[CBRecordingIndicatorManager _supportsSecureIndicator](CBRecordingIndicatorManager, "_supportsSecureIndicator");
      }
    }
    else
    {
      objc_msgSend(v6, "addSubview:", v7);
      if (!a3)
        goto LABEL_8;
    }
    sub_10000AF3C(v5);

  }
  return (id)v5;
}

- (void)setIndicatorColor:(id)a3
{
  UIColor **p_indicatorColor;
  void *v6;
  id v7;

  p_indicatorColor = &self->_indicatorColor;
  objc_storeStrong((id *)&self->_indicatorColor, a3);
  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorViewController indicatorView](self, "indicatorView"));
  objc_msgSend(v6, "setBackgroundColor:", *p_indicatorColor);

  -[CASecureIndicatorLayer setBackgroundColor:](self->_contentLayer, "setBackgroundColor:", -[UIColor cgColor](*p_indicatorColor, "cgColor"));
}

- (void)setActiveInterfaceOrientation:(int64_t)a3 withDuration:(double)a4
{
  sub_10000B664((uint64_t)self, a3, a4);
}

- (void)updateIndicatorType:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  double v13;
  int v14;
  void *v15;

  if (a3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v6 = (void *)v5;
  -[CBRecordingIndicatorViewController setIndicatorColor:](self, "setIndicatorColor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorViewController indicatorView](self, "indicatorView"));
  objc_msgSend(v7, "setIndicatorType:", a3);

  v8 = sub_10001CB30((id)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = CheckerBoardLogHandleForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating secure indicator type for layer-dot to %@", (uint8_t *)&v14, 0xCu);
  }

  -[CASecureIndicatorLayer setPrivacyIndicatorType:](self->_contentLayer, "setPrivacyIndicatorType:", v9);
  v12 = sub_10001CB60(a3);
  v13 = 0.0;
  if (v12)
    v13 = self->_size * 0.5;
  -[CASecureIndicatorLayer setCornerRadius:](self->_contentLayer, "setCornerRadius:", v13);

}

- (void)updateIndicatorVisibility:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _BYTE buf[12];
  __int16 v15;
  __CFString *v16;

  v3 = a3;
  if (!self)
  {
    v5 = CheckerBoardLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v7 = CFSTR("on");
      else
        v7 = CFSTR("off");
      v8 = objc_msgSend(0, "location");
      v9 = CFSTR("Standalone");
      if (v8 == (id)1)
        v9 = CFSTR("StatusBar");
      if (v8 == (id)2)
        v9 = CFSTR("SystemAperture");
      v10 = v9;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      v15 = 2114;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (normal animation)", buf, 0x16u);

    }
    sub_10000C7B0(0);
    *(_QWORD *)buf = 0;
    v11 = objc_alloc((Class)UIViewPropertyAnimator);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000C85C;
    v12[3] = &unk_100075510;
    objc_copyWeak(&v13, (id *)buf);
    objc_msgSend(v11, "initWithDuration:curve:animations:", 0, v12, 0.7);
    __break(1u);
  }
  if ((id)-[CBRecordingIndicatorViewController location](self, "location") == (id)2
    || self->_isSecure && !-[CBRecordingIndicatorViewController location](self, "location"))
  {
    sub_10000C350((uint64_t)self, v3);
  }
  else
  {
    -[CBRecordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:](self, "updateIndicatorVisibilityWithFastFadeAnimation:", v3);
  }
}

- (void)updateIndicatorVisibilityWithFastFadeAnimation:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  UIViewPropertyAnimator *v11;
  UIViewPropertyAnimator *animatorFastFade;
  UIViewPropertyAnimator *v13;
  unint64_t v14;
  double size;
  double v16;
  UIViewPropertyAnimator *v17;
  UIViewPropertyAnimator *v18;
  UIViewPropertyAnimator *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  __CFString *v29;

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v7 = CFSTR("on");
    else
      v7 = CFSTR("off");
    v8 = -[CBRecordingIndicatorViewController location](self, "location");
    v9 = CFSTR("Standalone");
    if (v8 == 1)
      v9 = CFSTR("StatusBar");
    if (v8 == 2)
      v9 = CFSTR("SystemAperture");
    v10 = v9;
    *(_DWORD *)buf = 138543618;
    v27 = v7;
    v28 = 2114;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (fast fade animation)", buf, 0x16u);

  }
  sub_10000C7B0((id *)&self->super.super.super.isa);
  if (v3)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000CC40;
    v25[3] = &unk_1000753E8;
    v25[4] = self;
    v11 = (UIViewPropertyAnimator *)objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:curve:animations:", 0, v25, 0.2);
    animatorFastFade = self->_animatorFastFade;
    self->_animatorFastFade = v11;

    objc_initWeak((id *)buf, self);
    v13 = self->_animatorFastFade;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000CC8C;
    v23[3] = &unk_100075600;
    objc_copyWeak(&v24, (id *)buf);
    v23[4] = self;
    -[UIViewPropertyAnimator addCompletion:](v13, "addCompletion:", v23);
    sub_10000B554(self, 1);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (self)
    {
      v14 = -[CBRecordingIndicatorViewController location](self, "location");
      if (v14 != 2 && (v14 || !self->_isSecure))
      {
        sub_10000BA28((id *)&self->super.super.super.isa, 0.0, 0.0);
        size = self->_size;
        v16 = 0.8;
        if (self->_isSecure)
          v16 = 1.0;
        else
          size = size * 0.8;
        sub_10000BB10((uint64_t)self, size, v16);
      }
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000CDD4;
    v22[3] = &unk_1000753E8;
    v22[4] = self;
    v17 = (UIViewPropertyAnimator *)objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:curve:animations:", 0, v22, 0.2);
    v18 = self->_animatorFastFade;
    self->_animatorFastFade = v17;

    objc_initWeak((id *)buf, self);
    v19 = self->_animatorFastFade;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000CDE4;
    v20[3] = &unk_1000755D8;
    objc_copyWeak(&v21, (id *)buf);
    -[UIViewPropertyAnimator addCompletion:](v19, "addCompletion:", v20);
    sub_10000B554(self, 3);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  -[UIViewPropertyAnimator startAnimation](self->_animatorFastFade, "startAnimation");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRecordingIndicatorViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "_backlightLuminance");
  if (v5 != objc_msgSend(v6, "_backlightLuminance"))
    sub_10000D204(self, (uint64_t)v5, (uint64_t)objc_msgSend(v6, "_backlightLuminance"));

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (UIView)indicatorContainerView
{
  return self->_indicatorContainerView;
}

- (CBRecordingIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (unint64_t)indicatorState
{
  return self->_indicatorState;
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (CBRecordingIndicatorViewControllerDelegate)delegate
{
  return (CBRecordingIndicatorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indicatorColor, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_animatorSpringToOff, 0);
  objc_storeStrong((id *)&self->_animatorSpringToOn, 0);
  objc_storeStrong((id *)&self->_animatorFastFade, 0);
  objc_storeStrong((id *)&self->_animatorScaleToZero, 0);
  objc_storeStrong((id *)&self->_animatorScaleToRest, 0);
  objc_storeStrong((id *)&self->_animatorScaleToNormal, 0);
  objc_storeStrong((id *)&self->_animatorScaleToOverscale, 0);
}

@end
