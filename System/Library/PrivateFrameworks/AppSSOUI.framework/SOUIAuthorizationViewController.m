@implementation SOUIAuthorizationViewController

- (SOUIAuthorizationViewController)initWithExtensionViewController:(id)a3 hints:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  SOUIAuthorizationViewController *v10;
  SOUIAuthorizationViewController *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  SOUIAuthorizationViewController *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  SO_LOG_SOUIAuthorizationViewController();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v23 = "-[SOUIAuthorizationViewController initWithExtensionViewController:hints:]";
    v24 = 2114;
    v25 = v7;
    v26 = 2113;
    v27 = v8;
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_2218ED000, v9, OS_LOG_TYPE_DEFAULT, "%s extensionViewController = %{public}@, hints = %{private}@ on %@", buf, 0x2Au);
  }

  v21.receiver = self;
  v21.super_class = (Class)SOUIAuthorizationViewController;
  v10 = -[SOUIAuthorizationViewController init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_extensionViewController, a3);
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24E75C1C0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "integerValue");
      v14 = v13;
      v15 = v13 + 2;
      if ((unint64_t)(v13 + 2) < 0xB && ((0x7FDu >> v15) & 1) != 0)
      {
        v17 = qword_2218EF010[v15];
        goto LABEL_11;
      }
      SO_LOG_SOUIAuthorizationViewController();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v14;
        _os_log_impl(&dword_2218ED000, v16, OS_LOG_TYPE_INFO, "unsupported UIModalPresentationStyle (%d) specified, using default", buf, 8u);
      }

    }
    v17 = 2;
LABEL_11:
    -[SOUIAuthorizationViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", v17);
    objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_rootSheetPresentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setShouldScaleDownBehindDescendantSheets:", 0);

  }
  return v11;
}

- (void)loadView
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  SOUIAuthorizationViewController *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOUIAuthorizationViewController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136315394;
    v31 = "-[SOUIAuthorizationViewController loadView]";
    v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_2218ED000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v30, 0x16u);
  }

  v4 = (void *)objc_opt_new();
  -[SOUIAuthorizationViewController setView:](self, "setView:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOUIAuthorizationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[SOUIAuthorizationViewController addChildViewController:](self, "addChildViewController:", self->_extensionViewController);
  -[SOUIAuthorizationViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_extensionViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[UIViewController view](self->_extensionViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self->_extensionViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOUIAuthorizationViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[UIViewController view](self->_extensionViewController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOUIAuthorizationViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[UIViewController view](self->_extensionViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOUIAuthorizationViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[UIViewController view](self->_extensionViewController, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOUIAuthorizationViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[UIViewController didMoveToParentViewController:](self->_extensionViewController, "didMoveToParentViewController:", self);
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  SOUIAuthorizationViewController *v8;
  id v9;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __76__SOUIAuthorizationViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_24E75BA28;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  v7[0] = MEMORY[0x24BDAC760];
  v5 = v9;
  -[SOUIAuthorizationViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

uint64_t __76__SOUIAuthorizationViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void (**v4)(void);
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dismissCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    SO_LOG_SOUIAuthorizationViewController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __76__SOUIAuthorizationViewController_dismissViewControllerAnimated_completion___block_invoke_cold_1(v3);

    objc_msgSend(*(id *)(a1 + 32), "dismissCompletionHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    objc_msgSend(*(id *)(a1 + 32), "setDismissCompletionHandler:", 0);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  SOUIAuthorizationViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOUIAuthorizationViewController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[SOUIAuthorizationViewController viewDidLoad]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_2218ED000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  -[SOUIAuthorizationViewController viewDidLoad](&v6, sel_viewDidLoad);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDelegate:", self);
  -[SOUIAuthorizationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  SOUIAuthorizationViewController *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOUIAuthorizationViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[SOUIAuthorizationViewController viewWillAppear:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_2218ED000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  -[SOUIAuthorizationViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  SOUIAuthorizationViewController *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOUIAuthorizationViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[SOUIAuthorizationViewController viewDidAppear:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_2218ED000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  -[SOUIAuthorizationViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  SOUIAuthorizationViewController *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOUIAuthorizationViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[SOUIAuthorizationViewController viewWillDisappear:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_2218ED000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  -[SOUIAuthorizationViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  SOUIAuthorizationViewController *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOUIAuthorizationViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[SOUIAuthorizationViewController viewDidDisappear:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_2218ED000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIAuthorizationViewController;
  -[SOUIAuthorizationViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  -[SOUIAuthorizationViewController _cancel](self, "_cancel");
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  -[SOUIAuthorizationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  return 1;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_extensionViewController;
}

- (void)_cancel
{
  SOUIAuthorizationViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_storeWeak((id *)p_delegate, 0);
      objc_msgSend(v7, "viewControllerDidCancel:", self);
      v5 = v7;
    }
  }

}

- (SOUIAuthorizationViewControllerDelegate)delegate
{
  return (SOUIAuthorizationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
}

void __76__SOUIAuthorizationViewController_dismissViewControllerAnimated_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2218ED000, log, OS_LOG_TYPE_DEBUG, "dismissing _UIFallbackPresentationViewController", v1, 2u);
}

@end
