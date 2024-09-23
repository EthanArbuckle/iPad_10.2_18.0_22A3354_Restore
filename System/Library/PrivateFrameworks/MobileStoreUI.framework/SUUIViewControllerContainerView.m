@implementation SUUIViewControllerContainerView

- (SUUIViewControllerContainerView)initWithFrame:(CGRect)a3
{
  SUUIViewControllerContainerView *v3;
  SUUIViewControllerContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIViewControllerContainerView;
  v3 = -[SUUIViewControllerContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SUUIViewControllerContainerView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIViewControllerContainerView;
  -[SUUIViewControllerContainerView layoutSubviews](&v3, sel_layoutSubviews);
  -[SUUIViewControllerContainerView _updateLayoutOfViewControllerView](self, "_updateLayoutOfViewControllerView");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIViewControllerContainerView;
  -[SUUIViewControllerContainerView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SUUIViewControllerContainerView _updateLayoutOfViewControllerView](self, "_updateLayoutOfViewControllerView");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIViewControllerContainerView;
  -[SUUIViewControllerContainerView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SUUIViewControllerContainerView _updateLayoutOfViewControllerView](self, "_updateLayoutOfViewControllerView");
}

- (void)setViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *viewController;
  UIViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  viewController = self->_viewController;
  v7 = v5;
  v11 = v5;
  if (viewController != v5)
  {
    if (viewController)
    {
      -[UIViewController view](viewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isDescendantOfView:", self))
        objc_msgSend(v8, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_viewController, a3);
    v7 = self->_viewController;
  }
  if (v7)
  {
    -[UIViewController view](v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isDescendantOfView:", self) & 1) == 0)
    {
      objc_msgSend(v10, "removeFromSuperview");
      -[SUUIViewControllerContainerView addSubview:](self, "addSubview:", v10);
      -[SUUIViewControllerContainerView setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

- (void)_updateLayoutOfViewControllerView
{
  id v3;

  -[UIViewController view](self->_viewController, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIViewControllerContainerView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
