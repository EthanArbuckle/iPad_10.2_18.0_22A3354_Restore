@implementation SUUISimpleContainerViewController

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_contentViewController;
  UIViewController *contentViewController;
  void *v8;
  UIViewController *v9;
  void *v10;
  void *v11;
  UIViewController *v12;

  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  v12 = v5;
  if (contentViewController != v5)
  {
    if (-[UIViewController isViewLoaded](contentViewController, "isViewLoaded"))
    {
      -[UIViewController view](*p_contentViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    -[UIViewController removeFromParentViewController](*p_contentViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      -[SUUISimpleContainerViewController addChildViewController:](self, "addChildViewController:");
      v9 = *p_contentViewController;
      -[SUUISimpleContainerViewController preferredContentSize](self, "preferredContentSize");
      -[UIViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
      if (-[SUUISimpleContainerViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[SUUISimpleContainerViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](*p_contentViewController, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAutoresizingMask:", 18);
        objc_msgSend(v10, "bounds");
        objc_msgSend(v11, "setFrame:");
        objc_msgSend(v10, "addSubview:", v11);

      }
    }
  }

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUISimpleContainerViewController;
  -[SUUISimpleContainerViewController loadView](&v5, sel_loadView);
  if (self->_contentViewController)
  {
    -[SUUISimpleContainerViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_contentViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v3, "addSubview:", v4);

  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUISimpleContainerViewController;
  -[SUUISimpleContainerViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[UIViewController setPreferredContentSize:](self->_contentViewController, "setPreferredContentSize:", width, height);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
