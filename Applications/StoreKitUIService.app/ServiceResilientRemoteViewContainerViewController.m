@implementation ServiceResilientRemoteViewContainerViewController

- (id)containedViewController
{
  return self->_otherContainedViewController;
}

- (void)setContainedViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *otherContainedViewController;
  UIViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  UIViewController *v22;

  v4 = (UIViewController *)a3;
  otherContainedViewController = self->_otherContainedViewController;
  self->_otherContainedViewController = v4;
  v22 = v4;
  v6 = otherContainedViewController;

  -[UIViewController preferredContentSize](self->_otherContainedViewController, "preferredContentSize");
  -[ServiceResilientRemoteViewContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[ServiceResilientRemoteViewContainerViewController addChildViewController:](self, "addChildViewController:", self->_otherContainedViewController);
  -[UIViewController willMoveToParentViewController:](v6, "willMoveToParentViewController:", 0);
  -[UIViewController removeFromParentViewController](v6, "removeFromParentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceResilientRemoteViewContainerViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_otherContainedViewController, "view"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_otherContainedViewController, "view"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_otherContainedViewController, "view"));
  objc_msgSend(v10, "setAutoresizingMask:", 18);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceResilientRemoteViewContainerViewController view](self, "view"));
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_otherContainedViewController, "view"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v6, "view"));
  objc_msgSend(v21, "removeFromSuperview");

  -[UIViewController didMoveToParentViewController:](self->_otherContainedViewController, "didMoveToParentViewController:", self);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ServiceResilientRemoteViewContainerViewController;
  -[ServiceResilientRemoteViewContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v4, "preferredContentSizeDidChangeForChildContentContainer:", a3);
  -[UIViewController preferredContentSize](self->_otherContainedViewController, "preferredContentSize");
  -[ServiceResilientRemoteViewContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherContainedViewController, 0);
}

@end
