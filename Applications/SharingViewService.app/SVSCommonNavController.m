@implementation SVSCommonNavController

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  PopUpPresentationController *v9;
  UIView *v10;
  UIView *dimmingView;

  v7 = a4;
  v8 = a3;
  v9 = -[PopUpPresentationController initWithPresentedViewController:presentingViewController:]([PopUpPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  v10 = (UIView *)objc_claimAutoreleasedReturnValue(-[PopUpPresentationController dimmingView](v9, "dimmingView"));
  dimmingView = self->_dimmingView;
  self->_dimmingView = v10;

  return v9;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)cancelProxCardDraggingWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController topViewController](self, "topViewController"));
  v6 = objc_opt_class(SVSBaseViewController, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCommonNavController topViewController](self, "topViewController"));
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "cancelProxCardDraggingWithCompletion:", v10);
    else
      v10[2]();

  }
  else
  {
    v10[2]();
  }

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SVSCommonNavController *v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001158F8;
  v11[3] = &unk_10017DEB0;
  v15 = a4;
  v13 = self;
  v14 = a5;
  v12 = v8;
  v9 = v14;
  v10 = v8;
  -[SVSCommonNavController cancelProxCardDraggingWithCompletion:](self, "cancelProxCardDraggingWithCompletion:", v11);

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  SVSCommonNavController *v8;
  BOOL v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001158BC;
  v6[3] = &unk_10017DED8;
  v9 = a4;
  v7 = a3;
  v8 = self;
  v5 = v7;
  -[SVSCommonNavController cancelProxCardDraggingWithCompletion:](self, "cancelProxCardDraggingWithCompletion:", v6);

}

- (void)pushViewController:(id)a3 transition:(int)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  SVSCommonNavController *v8;
  int v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100115880;
  v6[3] = &unk_10017DE38;
  v9 = a4;
  v7 = a3;
  v8 = self;
  v5 = v7;
  -[SVSCommonNavController cancelProxCardDraggingWithCompletion:](self, "cancelProxCardDraggingWithCompletion:", v6);

}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (UIViewControllerAnimatedTransitioning)transitionAnimator
{
  return self->_transitionAnimator;
}

- (void)setTransitionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_transitionAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end
