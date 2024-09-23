@implementation AMPPrivacyPresentationController

- (AMPPrivacyPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  AMPPrivacyPresentationController *v4;
  AMPPrivacyPresentationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMPPrivacyPresentationController;
  v4 = -[AMPPrivacyPresentationController initWithPresentedViewController:presentingViewController:](&v7, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v5 = v4;
  if (v4)
    -[AMPPrivacyPresentationController setDelegate:](v4, "setDelegate:", v4);
  return v5;
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[AMPPrivacyPresentationController _prepareDimmingViewIfNecessary](self, "_prepareDimmingViewIfNecessary");
  -[AMPPrivacyPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "_setContinuousCornerRadius:", 16.0);
  -[AMPPrivacyPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[AMPPrivacyPresentationController presentedViewController](self, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSize");
  v15 = v14;
  v17 = v16;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  v18 = CGRectGetWidth(v22) + -40.0;
  if (v18 < v15)
    v15 = v18;
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  v19 = CGRectGetHeight(v23) + -40.0;
  if (v19 < v17)
    v17 = v19;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v20 = CGRectGetMidX(v24) - v15 * 0.5;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  objc_msgSend(v21, "setFrame:", v20, CGRectGetMidY(v25) - v17 * 0.5, v15, v17);

}

- (void)containerViewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMPPrivacyPresentationController;
  -[AMPPrivacyPresentationController containerViewDidLayoutSubviews](&v14, sel_containerViewDidLayoutSubviews);
  -[AMPPrivacyPresentationController dimmingView](self, "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMPPrivacyPresentationController containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AMPPrivacyPresentationController dimmingView](self, "dimmingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "bounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_prepareDimmingViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[AMPPrivacyPresentationController presentedViewController](self, "presentedViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AMPPrivacyPresentationController dimmingView](self, "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (!v3 && v10)
  {
    -[AMPPrivacyPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPPrivacyPresentationController dimmingView](self, "dimmingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    v7 = objc_alloc(MEMORY[0x24BDF6F90]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    -[AMPPrivacyPresentationController setDimmingView:](self, "setDimmingView:", v8);
    objc_msgSend(v5, "insertSubview:atIndex:", v8, 0);
    objc_msgSend(v5, "sendSubviewToBack:", v8);

    v4 = v10;
  }

}

- (void)presentationTransitionWillBegin
{
  void *v3;
  id v4;

  -[AMPPrivacyPresentationController containerView](self, "containerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMPPrivacyPresentationController presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[AMPPrivacyPresentationController _prepareDimmingViewIfNecessary](self, "_prepareDimmingViewIfNecessary");
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
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
