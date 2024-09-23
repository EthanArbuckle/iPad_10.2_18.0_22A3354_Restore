@implementation _UIViewServiceViewController

- (_UIViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  _UIViewServiceViewController *v8;
  _UIPreferredContentSizeRelayingNavigationController *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIViewServiceViewController;
  v8 = -[_UIViewServiceViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v9 = objc_alloc_init(_UIPreferredContentSizeRelayingNavigationController);
    objc_initWeak(&location, v8);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __55___UIViewServiceViewController_initWithNibName_bundle___block_invoke;
    v14 = &unk_24E43AF70;
    objc_copyWeak(&v15, &location);
    -[_UIPreferredContentSizeRelayingNavigationController setPreferredContentSizeDidChange:](v9, "setPreferredContentSizeDidChange:", &v11);
    -[_UIViewServiceViewController setContainedNavController:](v8, "setContainedNavController:", v9, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v8;
}

- (void)setContainedNavController:(id)a3
{
  UINavigationController **p_containedNavController;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_containedNavController = &self->_containedNavController;
  objc_storeStrong((id *)&self->_containedNavController, a3);
  v9 = a3;
  objc_msgSend(v9, "setDelegate:", self);
  -[UINavigationController beginAppearanceTransition:animated:](*p_containedNavController, "beginAppearanceTransition:animated:", 1, 0);
  -[UINavigationController view](*p_containedNavController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  -[_UIViewServiceViewController addChildViewController:](self, "addChildViewController:", *p_containedNavController);
  -[_UIViewServiceViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController view](*p_containedNavController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[UINavigationController didMoveToParentViewController:](*p_containedNavController, "didMoveToParentViewController:", self);
  -[UINavigationController endAppearanceTransition](*p_containedNavController, "endAppearanceTransition");

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIViewServiceViewController;
  -[_UIViewServiceViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  cdui_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_UIViewServiceViewController preferredContentSizeDidChangeForChildContentContainer:].cold.1(v4, v5);

  objc_msgSend(v4, "preferredContentSize");
  -[_UIViewServiceViewController _updatedContentSizeForPreferredContentSize:](self, "_updatedContentSizeForPreferredContentSize:");
  -[_UIViewServiceViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;

  v6 = a3;
  objc_msgSend(a4, "preferredContentSize");
  objc_msgSend(v6, "setPreferredContentSize:");

}

- (id)hostingViewController
{
  return self->_hostingViewController;
}

- (UINavigationController)containedNavController
{
  return self->_containedNavController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containedNavController, 0);
  objc_storeStrong(&self->_hostingViewController, 0);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  CGSize v7;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "preferredContentSize");
  NSStringFromCGSize(v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21F506000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] requesting content size %@", (uint8_t *)&v4, 0xCu);

}

@end
