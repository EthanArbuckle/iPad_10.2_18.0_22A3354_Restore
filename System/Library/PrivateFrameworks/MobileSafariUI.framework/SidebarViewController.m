@implementation SidebarViewController

- (void)viewDidLoad
{
  UIView *v3;
  UIView *verticalSeparator;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SidebarViewController;
  -[SidebarViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  verticalSeparator = self->_verticalSeparator;
  self->_verticalSeparator = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_verticalSeparator, "setBackgroundColor:", v5);

  -[SidebarViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_verticalSeparator);

  -[SidebarViewController traitOverrides](self, "traitOverrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNSIntegerValue:forTrait:", 1, objc_opt_class());

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  char v4;
  double v5;
  double v6;
  void *v7;
  double Width;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)SidebarViewController;
  -[SidebarViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  -[SidebarViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_sf_usesLeftToRightLayout");

  -[SidebarViewController separatorWidth](self, "separatorWidth");
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    -[SidebarViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    Width = CGRectGetWidth(v10);

  }
  else
  {
    Width = -v5;
  }
  -[UIView setFrame:](self->_verticalSeparator, "setFrame:", Width, v6, v6, 100000.0);
}

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_contentViewController;
  UIViewController *contentViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewController *v12;

  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  v12 = v5;
  if (contentViewController != v5)
  {
    -[UIViewController willMoveToParentViewController:](contentViewController, "willMoveToParentViewController:", 0);
    -[UIViewController view](*p_contentViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](*p_contentViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      -[SidebarViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SidebarViewController addChildViewController:](self, "addChildViewController:", *p_contentViewController);
      -[UIViewController view](*p_contentViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Sidebar"));
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

      objc_msgSend(v9, "bounds");
      objc_msgSend(v10, "setFrame:");
      objc_msgSend(v9, "addSubview:", v10);
      -[UIViewController didMoveToParentViewController:](*p_contentViewController, "didMoveToParentViewController:", self);

    }
  }

}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_contentViewController)
  {
    v4[0] = self->_contentViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_verticalSeparator, 0);
}

@end
