@implementation FBAPartialPresentationController

- (FBAPartialPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBAPartialPresentationController;
  return -[FBAPartialPresentationController initWithPresentedViewController:presentingViewController:](&v5, "initWithPresentedViewController:presentingViewController:", a3, a4);
}

- (void)containerViewWillLayoutSubviews
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FBAPartialPresentationController;
  -[FBAPartialPresentationController containerViewWillLayoutSubviews](&v17, "containerViewWillLayoutSubviews");
  -[FBAPartialPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController presentedViewController](self, "presentedViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController presentedView](self, "presentedView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  objc_msgSend(v14, "setCornerRadius:", 7.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController presentedView](self, "presentedView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  objc_msgSend(v16, "setMasksToBounds:", 1);

}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController dimmingView](self, "dimmingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController containerView](self, "containerView"));
  objc_msgSend(v4, "addSubview:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 8, 0, v4, 8, 1.0, 0.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 7, 0, v4, 7, 1.0, 0.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 9, 0, v4, 9, 1.0, 0.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 10, 0, v4, 10, 1.0, 0.0));
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v7;
  v15[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 4));
  objc_msgSend(v4, "addConstraints:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController presentingViewController](self, "presentingViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transitionCoordinator"));

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000280F8;
  v12[3] = &unk_1000E6FD0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v11, "animateAlongsideTransition:completion:", v12, 0);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController presentingViewController](self, "presentingViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028214;
  v5[3] = &unk_1000E6FD0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController dimmingView](self, "dimmingView", a3));
  objc_msgSend(v3, "removeFromSuperview");

}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[FBAPartialPresentationController height](self, "height");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[FBAPartialPresentationController height](self, "height");
  v8 = 150.0;
  if (v9 >= 150.0)
  {
    v8 = v4;
    if (-[FBAPartialPresentationController isPresentingFullScreen](self, "isPresentingFullScreen"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windows"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
      objc_msgSend(v12, "safeAreaInsets");
      v8 = v7 - v13;

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController containerView](self, "containerView"));
  objc_msgSend(v14, "bounds");
  v16 = v15 - v8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController containerView](self, "containerView"));
  objc_msgSend(v17, "bounds");
  v19 = v18;

  v20 = 0.0;
  v21 = v16;
  v22 = v19;
  v23 = v8;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (UIView)dimmingView
{
  UIView *dimmingView;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  id v12;

  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    v4 = objc_alloc((Class)UIView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController containerView](self, "containerView"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController containerView](self, "containerView"));
    objc_msgSend(v8, "bounds");
    v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v7);
    v10 = self->_dimmingView;
    self->_dimmingView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor"));
    -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v11);

    -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "dismissPresentation:");
    objc_msgSend(v12, "setNumberOfTouchesRequired:", 1);
    -[UIView addGestureRecognizer:](self->_dimmingView, "addGestureRecognizer:", v12);

    dimmingView = self->_dimmingView;
  }
  return dimmingView;
}

- (void)dismissPresentation:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FBAPartialPresentationController presentedViewController](self, "presentedViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)isPresentingFullScreen
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[FBAPartialPresentationController height](self, "height");
  return v6 > v5 * 0.9;
}

- (int64_t)adaptivePresentationStyle
{
  if (-[FBAPartialPresentationController isPresentingFullScreen](self, "isPresentingFullScreen"))
    return 5;
  else
    return -2;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
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
