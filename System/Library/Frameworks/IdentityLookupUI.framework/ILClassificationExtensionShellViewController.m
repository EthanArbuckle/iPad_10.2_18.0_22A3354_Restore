@implementation ILClassificationExtensionShellViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ILClassificationExtensionShellViewController;
  -[ILClassificationExtensionShellViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_userDidFinish);
  -[ILClassificationExtensionShellViewController setDoneButton:](self, "setDoneButton:", v3);

  -[ILClassificationExtensionShellViewController doneButton](self, "doneButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_userDidCancel);
  -[ILClassificationExtensionShellViewController doneButton](self, "doneButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationExtensionShellViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  -[ILClassificationExtensionShellViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v5);

}

- (void)setEnableFinishOption:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ILClassificationExtensionShellViewController doneButton](self, "doneButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)displayExtensionViewController:(id)a3 forExtension:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a4;
  v22 = a3;
  -[ILClassificationExtensionShellViewController setExtensionViewController:](self, "setExtensionViewController:", v22);
  objc_msgSend(v6, "_plugIn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedContainingName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationExtensionShellViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  -[ILClassificationExtensionShellViewController addChildViewController:](self, "addChildViewController:", v22);
  -[ILClassificationExtensionShellViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v22, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[ILClassificationExtensionShellViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  objc_msgSend(v22, "didMoveToParentViewController:", self);
}

- (void)userDidFinish
{
  id v3;

  -[ILClassificationExtensionShellViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidFinishForExtensionShellViewController:", self);

}

- (void)userDidCancel
{
  id v3;

  -[ILClassificationExtensionShellViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidCancelForExtensionShellViewController:", self);

}

- (ILClassificationExtensionShellViewControllerDelegate)delegate
{
  return (ILClassificationExtensionShellViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enableFinishOption
{
  return self->_enableFinishOption;
}

- (UIViewController)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extensionViewController, a3);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
