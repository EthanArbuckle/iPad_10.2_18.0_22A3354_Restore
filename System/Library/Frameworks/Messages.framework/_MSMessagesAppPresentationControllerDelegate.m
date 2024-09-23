@implementation _MSMessagesAppPresentationControllerDelegate

- (_MSMessagesAppPresentationControllerDelegate)initWithMessagesAppViewController:(id)a3
{
  id v4;
  _MSMessagesAppPresentationControllerDelegate *v5;
  _MSMessagesAppPresentationControllerDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MSMessagesAppPresentationControllerDelegate;
  v5 = -[_MSMessagesAppPresentationControllerDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_appViewController, v4);

  return v6;
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  void *v4;
  int v5;
  MSMessagesAppViewController **p_appViewController;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  objc_msgSend(a3, "selectedDetentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEBBB0]);

  p_appViewController = &self->_appViewController;
  WeakRetained = objc_loadWeakRetained((id *)p_appViewController);
  v8 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "willTransitionToPresentationStyle:", 1);

    v9 = objc_loadWeakRetained((id *)p_appViewController);
    objc_msgSend(v9, "_setAppPresentationStyle:", 1);

    v10 = objc_loadWeakRetained((id *)p_appViewController);
    v13 = v10;
    v11 = 1;
  }
  else
  {
    objc_msgSend(WeakRetained, "willTransitionToPresentationStyle:", 0);

    v12 = objc_loadWeakRetained((id *)p_appViewController);
    objc_msgSend(v12, "_setAppPresentationStyle:", 0);

    v10 = objc_loadWeakRetained((id *)p_appViewController);
    v13 = v10;
    v11 = 0;
  }
  objc_msgSend(v10, "didTransitionToPresentationStyle:", v11);

}

- (MSMessagesAppViewController)appViewController
{
  return (MSMessagesAppViewController *)objc_loadWeakRetained((id *)&self->_appViewController);
}

- (void)setAppViewController:(id)a3
{
  objc_storeWeak((id *)&self->_appViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appViewController);
}

@end
