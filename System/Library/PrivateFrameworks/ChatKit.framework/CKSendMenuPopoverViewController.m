@implementation CKSendMenuPopoverViewController

- (CKSendMenuPopoverViewController)init
{
  CKSendMenuPopoverViewController *v2;
  CKSendMenuPopoverViewController *v3;
  UIViewController *appContainerViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSendMenuPopoverViewController;
  v2 = -[CKSendMenuPopoverViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2)
  {
    appContainerViewController = v2->_appContainerViewController;
    v2->_appContainerViewController = 0;

  }
  return v3;
}

- (void)loadView
{
  CKSendMenuPresentationPopoverView *v3;

  v3 = objc_alloc_init(CKSendMenuPresentationPopoverView);
  -[CKSendMenuPopoverViewController setView:](self, "setView:", v3);

}

- (UIViewController)sendMenuViewController
{
  return self->_sendMenuViewController;
}

- (void)setSendMenuViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_sendMenuViewController;
  UIViewController *sendMenuViewController;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  p_sendMenuViewController = &self->_sendMenuViewController;
  sendMenuViewController = self->_sendMenuViewController;
  v11 = v5;
  if (sendMenuViewController != v5)
  {
    if (sendMenuViewController)
    {
      -[UIViewController willMoveToParentViewController:](sendMenuViewController, "willMoveToParentViewController:", 0);
      -[UIViewController view](*p_sendMenuViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](*p_sendMenuViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_sendMenuViewController, a3);
    if (*p_sendMenuViewController)
    {
      -[CKSendMenuPopoverViewController addChildViewController:](self, "addChildViewController:");
      -[UIViewController view](*p_sendMenuViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSendMenuPopoverViewController popoverView](self, "popoverView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSendMenuView:", v9);

      -[UIViewController didMoveToParentViewController:](*p_sendMenuViewController, "didMoveToParentViewController:", self);
    }
  }

}

- (void)setAppContainerViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_appContainerViewController;
  UIViewController *appContainerViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewController *v12;

  v5 = (UIViewController *)a3;
  p_appContainerViewController = &self->_appContainerViewController;
  appContainerViewController = self->_appContainerViewController;
  v12 = v5;
  if (appContainerViewController != v5)
  {
    if (appContainerViewController)
    {
      -[UIViewController willMoveToParentViewController:](appContainerViewController, "willMoveToParentViewController:", 0);
      -[UIViewController view](*p_appContainerViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](*p_appContainerViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_appContainerViewController, a3);
    if (*p_appContainerViewController)
    {
      -[CKSendMenuPopoverViewController addChildViewController:](self, "addChildViewController:");
      -[UIViewController view](*p_appContainerViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSendMenuPopoverViewController popoverView](self, "popoverView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAppView:", v9);

      -[UIViewController didMoveToParentViewController:](*p_appContainerViewController, "didMoveToParentViewController:", self);
      -[CKSendMenuPopoverViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appCardDidAppearInSendMenuPopoverViewController:", self);

    }
  }

}

- (UIViewController)appContainerViewController
{
  return self->_appContainerViewController;
}

- (void)anchorViewDidMove
{
  id v2;

  -[CKSendMenuPopoverViewController presentationController](self, "presentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorViewDidMove");

}

- (id)animationForPresentingInitialViewControllerWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4
{
  double y;
  double x;
  double height;
  double width;
  double v8;
  double v9;
  void *v10;
  void *v11;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  -[CKSendMenuPopoverViewController popoverView](self, "popoverView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "animationForPresentingInitialViewWithFinalBounds:finalCenter:", v9, v8, width, height, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)animationForDismissingWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4 finalAlpha:(double)a5
{
  double y;
  double x;
  double height;
  double width;
  double v10;
  double v11;
  void *v12;
  void *v13;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  -[CKSendMenuPopoverViewController popoverView](self, "popoverView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animationForDismissingWithFinalBounds:finalCenter:finalAlpha:", v11, v10, width, height, x, y, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)animationForTransitioningToAppContainerViewControllerWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4
{
  double y;
  double x;
  double height;
  double width;
  double v8;
  double v9;
  void *v10;
  void *v11;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  -[CKSendMenuPopoverViewController popoverView](self, "popoverView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "animationForTransitioningToAppViewWithFinalBounds:finalCenter:", v9, v8, width, height, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CKSendMenuPopoverViewControllerDelegate)delegate
{
  return (CKSendMenuPopoverViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appContainerViewController, 0);
  objc_storeStrong((id *)&self->_sendMenuViewController, 0);
}

@end
