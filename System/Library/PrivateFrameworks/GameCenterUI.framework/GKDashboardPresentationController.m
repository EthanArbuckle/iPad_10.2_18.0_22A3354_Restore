@implementation GKDashboardPresentationController

- (GKDashboardPresentationController)init
{
  GKDashboardPresentationController *v2;
  GKDashboardPresentationController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardPresentationController;
  v2 = -[GKDashboardPresentationController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GKDashboardPresentationController setTransitionDuration:](v2, "setTransitionDuration:", 0.5);
  return v3;
}

+ (void)presentViewController:(id)a3 presentingViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  GKDashboardPresentationController *v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v10 = objc_alloc_init(GKDashboardPresentationController);
  objc_msgSend(v7, "setTransitioningDelegate:", v10);
  objc_msgSend(v7, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pushViewController:animated:", v8, v5);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  -[GKDashboardPresentationController setPresenting:](self, "setPresenting:", 1, a4, a5);
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  -[GKDashboardPresentationController setPresenting:](self, "setPresenting:", 0);
  return self;
}

- (void)animationEnded:(BOOL)a3
{
  -[GKDashboardPresentationController setPresenting:](self, "setPresenting:", 0);
}

- (void)animateTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKDashboardPresentationController presenting](self, "presenting"))
  {
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v5, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    objc_msgSend(v5, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAutoresizingMask:", 18);

    objc_msgSend(v5, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v18);

    objc_msgSend(v5, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutIfNeeded");

    objc_msgSend(v4, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutIfNeeded");

    objc_msgSend(v23, "completeTransition:", 1);
  }
  else
  {
    objc_msgSend(v23, "completeTransition:", 1);
    objc_msgSend(v4, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperview");

    objc_msgSend(v5, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutIfNeeded");

  }
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

@end
