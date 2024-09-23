@implementation PopUpPresentationController

- (UIView)dimmingView
{
  UIView *dimmingView;
  id v4;
  void *v5;
  UIView *v6;
  id v7;
  UIView *v8;

  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    if (self->_blurBackground)
    {
      v4 = objc_alloc((Class)UIVisualEffectView);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
      v6 = (UIView *)objc_msgSend(v4, "initWithEffect:", v5);
    }
    else
    {
      v7 = objc_alloc((Class)UIView);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PopUpPresentationController containerView](self, "containerView"));
      objc_msgSend(v5, "bounds");
      v6 = (UIView *)objc_msgSend(v7, "initWithFrame:");
    }
    v8 = self->_dimmingView;
    self->_dimmingView = v6;

    dimmingView = self->_dimmingView;
  }
  return dimmingView;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PopUpPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v3, "setAlpha:", 0.0);

  if (self->_blurBackground)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.600000024));
  v5 = (void *)v4;
  -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PopUpPresentationController containerView](self, "containerView"));
  objc_msgSend(v6, "addSubview:", self->_dimmingView);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PopUpPresentationController presentedViewController](self, "presentedViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitionCoordinator"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000FC018;
  v9[3] = &unk_10017D6F8;
  v9[4] = self;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v9, 0);

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  UIView *dimmingView;

  if (!a3)
  {
    -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;

  }
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PopUpPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FC000;
  v5[3] = &unk_10017D6F8;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  UIView *dimmingView;

  if (a3)
  {
    -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;

  }
}

- (void)containerViewWillLayoutSubviews
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PopUpPresentationController containerView](self, "containerView"));
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_dimmingView, "setFrame:");

}

- (BOOL)blurBackground
{
  return self->_blurBackground;
}

- (void)setBlurBackground:(BOOL)a3
{
  self->_blurBackground = a3;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end
