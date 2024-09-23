@implementation SVSTopAnimator

- (id)animationControllerForDismissedController:(id)a3
{
  SVSTopDismissAnimator *dismissAnimator;
  SVSTopDismissAnimator *v5;
  SVSTopDismissAnimator *v6;

  dismissAnimator = self->_dismissAnimator;
  if (!dismissAnimator)
  {
    v5 = objc_alloc_init(SVSTopDismissAnimator);
    v6 = self->_dismissAnimator;
    self->_dismissAnimator = v5;

    dismissAnimator = self->_dismissAnimator;
  }
  return dismissAnimator;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  PopUpPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PopUpPresentationController initWithPresentedViewController:presentingViewController:]([PopUpPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  -[SVSTopAnimator transitionDuration:](self, "transitionDuration:", v4);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "bounds");
  CGAffineTransformMakeTranslation(&v20, 0.0, -v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v19 = v20;
  objc_msgSend(v11, "setTransform:", &v19);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v5, "addSubview:", v12);

  v16 = v4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100114AEC;
  v17[3] = &unk_10017E1F0;
  v18 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100114B40;
  v15[3] = &unk_10017DF28;
  v13 = v4;
  v14 = v8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, v15, v7);

}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAnimator, 0);
}

@end
