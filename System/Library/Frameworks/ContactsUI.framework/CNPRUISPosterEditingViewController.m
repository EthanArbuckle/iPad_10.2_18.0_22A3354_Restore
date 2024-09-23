@implementation CNPRUISPosterEditingViewController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (CNPRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNPRUISPosterEditingViewController *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PRUISPosterEditingViewController *wrappedPosterEditingViewController;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNPRUISPosterEditingViewController;
  v11 = -[CNPRUISPosterEditingViewController init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_alloc((Class)getPRUISPosterEditingViewControllerClass[0]());
    objc_msgSend(v9, "wrappedMutablePosterConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wrappedIncomingCallPosterContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithExtensionIdentifier:configuration:context:", v8, v13, v14);
    wrappedPosterEditingViewController = v11->_wrappedPosterEditingViewController;
    v11->_wrappedPosterEditingViewController = (PRUISPosterEditingViewController *)v15;

    -[PRUISPosterEditingViewController setDelegate:](v11->_wrappedPosterEditingViewController, "setDelegate:", v11);
    -[CNPRUISPosterEditingViewController addChildViewController:](v11, "addChildViewController:", v11->_wrappedPosterEditingViewController);
    -[CNPRUISPosterEditingViewController view](v11, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISPosterEditingViewController view](v11->_wrappedPosterEditingViewController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    -[PRUISPosterEditingViewController didMoveToParentViewController:](v11->_wrappedPosterEditingViewController, "didMoveToParentViewController:", v11);
  }

  return v11;
}

- (CNPRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  CNPRUISPosterEditingViewController *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PRUISPosterEditingViewController *wrappedPosterEditingViewController;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNPRUISPosterEditingViewController;
  v8 = -[CNPRUISPosterEditingViewController init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_alloc((Class)getPRUISPosterEditingViewControllerClass[0]());
    objc_msgSend(v6, "wrappedPosterConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wrappedIncomingCallPosterContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithExistingConfiguration:context:", v10, v11);
    wrappedPosterEditingViewController = v8->_wrappedPosterEditingViewController;
    v8->_wrappedPosterEditingViewController = (PRUISPosterEditingViewController *)v12;

    -[PRUISPosterEditingViewController setDelegate:](v8->_wrappedPosterEditingViewController, "setDelegate:", v8);
    -[CNPRUISPosterEditingViewController addChildViewController:](v8, "addChildViewController:", v8->_wrappedPosterEditingViewController);
    -[CNPRUISPosterEditingViewController view](v8, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISPosterEditingViewController view](v8->_wrappedPosterEditingViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[PRUISPosterEditingViewController didMoveToParentViewController:](v8->_wrappedPosterEditingViewController, "didMoveToParentViewController:", v8);
  }

  return v8;
}

- (void)setShowsContentWhenReady:(BOOL)a3
{
  -[PRUISPosterEditingViewController setShowsContentWhenReady:](self->_wrappedPosterEditingViewController, "setShowsContentWhenReady:", a3);
}

- (BOOL)showsContentWhenReady
{
  return -[PRUISPosterEditingViewController showsContentWhenReady](self->_wrappedPosterEditingViewController, "showsContentWhenReady");
}

- (void)presentationDidFinishAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PRUISPosterEditingViewController presentationDidFinishAnimated:](self->_wrappedPosterEditingViewController, "presentationDidFinishAnimated:", v3);
}

- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4
{
  CNPRSPosterConfiguration *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (v7)
  {
    v5 = -[CNPRSPosterConfiguration initWithPosterConfiguration:]([CNPRSPosterConfiguration alloc], "initWithPosterConfiguration:", v7);
    -[CNPRUISPosterEditingViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editingViewController:didFinishWithConfiguration:", self, v5);

  }
  else
  {
    -[CNPRUISPosterEditingViewController delegate](self, "delegate");
    v5 = (CNPRSPosterConfiguration *)objc_claimAutoreleasedReturnValue();
    -[CNPRSPosterConfiguration editingViewController:didFinishWithConfiguration:](v5, "editingViewController:didFinishWithConfiguration:", self, 0);
  }

}

- (void)editingViewControllerDidFinishShowingContent:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNPRUISPosterEditingViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNPRUISPosterEditingViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editingViewControllerDidFinishShowingContent:", self);

  }
}

- (CNPRUISPosterEditingViewControllerDelegate)delegate
{
  return (CNPRUISPosterEditingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wrappedPosterEditingViewController, 0);
}

@end
