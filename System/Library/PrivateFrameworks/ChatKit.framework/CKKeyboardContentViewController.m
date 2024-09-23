@implementation CKKeyboardContentViewController

- (CKKeyboardContentViewController)initWithViewController:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  CKKeyboardContentViewController *v8;
  CKKeyboardContentViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKKeyboardContentViewController;
  v8 = -[UIInputViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[CKKeyboardContentViewController setIdentifier:](v8, "setIdentifier:", v7);
    -[CKKeyboardContentViewController setViewController:](v9, "setViewController:", v6);
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D375E0]))
      -[UIInputViewController _setAutosizeToCurrentKeyboard:](v9, "_setAutosizeToCurrentKeyboard:", 1);
  }

  return v9;
}

- (void)loadView
{
  void *v3;
  char v4;
  id v5;
  CKInputView *v6;
  CKInputView *v7;

  -[CKKeyboardContentViewController identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D375E0]);

  if ((v4 & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA678]);
    v7 = (CKInputView *)objc_msgSend(v5, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  else
  {
    v6 = [CKInputView alloc];
    v7 = -[UIInputView initWithFrame:inputViewStyle:](v6, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIInputView setAllowsSelfSizing:](v7, "setAllowsSelfSizing:", 1);
  }
  -[CKInputView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKInputView setBackgroundColor:](v7, "setBackgroundColor:", 0);
  -[UIInputViewController setView:](self, "setView:", v7);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKKeyboardContentViewController;
  -[UIInputViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[CKKeyboardContentViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKKeyboardContentViewController viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKeyboardContentViewController addChildViewController:](self, "addChildViewController:", v4);

    -[CKKeyboardContentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKeyboardContentViewController viewController](self, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v7);

    -[CKKeyboardContentViewController viewController](self, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKeyboardContentViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "setBounds:");

    -[CKKeyboardContentViewController viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didMoveToParentViewController:", self);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKKeyboardContentViewController;
  -[CKKeyboardContentViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[CKKeyboardContentViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyboardContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKKeyboardContentViewController;
  -[CKKeyboardContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[CKKeyboardContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateIntrinsicContentSize");

}

- (void)setViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_viewController;
  UIViewController *viewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIViewController *v13;

  v5 = (UIViewController *)a3;
  p_viewController = &self->_viewController;
  viewController = self->_viewController;
  v13 = v5;
  if (viewController != v5)
  {
    -[UIViewController removeFromParentViewController](viewController, "removeFromParentViewController");
    -[UIViewController view](*p_viewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIViewController didMoveToParentViewController:](*p_viewController, "didMoveToParentViewController:", 0);
    objc_storeStrong((id *)&self->_viewController, a3);
    if (*p_viewController)
    {
      -[CKKeyboardContentViewController addChildViewController:](self, "addChildViewController:");
      -[CKKeyboardContentViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](*p_viewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

      -[UIViewController didMoveToParentViewController:](*p_viewController, "didMoveToParentViewController:", self);
      -[UIViewController view](*p_viewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKKeyboardContentViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      objc_msgSend(v11, "setFrame:");

    }
  }

}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
