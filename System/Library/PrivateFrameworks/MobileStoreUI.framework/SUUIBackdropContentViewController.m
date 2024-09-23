@implementation SUUIBackdropContentViewController

- (SUUIBackdropContentViewController)initWithContentViewController:(id)a3
{
  id v4;
  SUUIBackdropContentViewController *v5;
  SUUIBackdropContentViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIBackdropContentViewController;
  v5 = -[SUUIBackdropContentViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_backdropViewPrivateStyle = 10060;
    -[SUUIBackdropContentViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 17);
    -[SUUIBackdropContentViewController setContentViewController:](v6, "setContentViewController:", v4);
  }

  return v6;
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIBackdropContentViewController;
  -[SUUIBackdropContentViewController loadView](&v6, sel_loadView);
  -[SUUIBackdropContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEBDB78]);
  objc_msgSend(v3, "bounds");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:privateStyle:", self->_backdropViewPrivateStyle);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v5);

}

- (void)setBackdropViewPrivateStyle:(int64_t)a3
{
  id v5;

  if (self->_backdropViewPrivateStyle != a3)
  {
    self->_backdropViewPrivateStyle = a3;
    if (-[SUUIBackdropContentViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUIBackdropContentViewController view](self, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transitionToPrivateStyle:", a3);

    }
  }
}

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_contentViewController;
  SUUIBackdropContentViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    v11 = v5;
    -[UIViewController parentViewController](v5, "parentViewController");
    v7 = (SUUIBackdropContentViewController *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      -[UIViewController willMoveToParentViewController:](v11, "willMoveToParentViewController:", 0);
      -[UIViewController view](v11, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](v11, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    v5 = v11;
    if (*p_contentViewController)
    {
      -[SUUIBackdropContentViewController addChildViewController:](self, "addChildViewController:");
      -[SUUIBackdropContentViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](*p_contentViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      objc_msgSend(v10, "setFrame:");
      objc_msgSend(v10, "setAutoresizingMask:", 18);
      objc_msgSend(v9, "addSubview:", v10);
      -[UIViewController didMoveToParentViewController:](*p_contentViewController, "didMoveToParentViewController:", self);

      v5 = v11;
    }
  }

}

- (int64_t)backdropViewPrivateStyle
{
  return self->_backdropViewPrivateStyle;
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
