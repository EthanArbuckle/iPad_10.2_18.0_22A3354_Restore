@implementation SKStoreRemoteViewController

+ (id)exportedInterface
{
  return +[SKStoreExtension clientInterface](SKStoreExtension, "clientInterface");
}

+ (id)serviceViewControllerInterface
{
  return +[SKStoreExtension serviceInterface](SKStoreExtension, "serviceInterface");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SKStoreRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SKStoreRemoteViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storeRemoteViewControllerTerminatedWithError:", v7);

  }
}

- (void)setNeedsTabSelection
{
  id v3;

  -[SKStoreRemoteViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeRemoteViewControllerNeedsTabSelection:", self);

}

- (void)presentRequestedViewControllerWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKStoreRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeRemoteViewController:presentRequestedViewControllerWithIdentifier:", self, v4);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD aBlock[5];
  id v11;

  v4 = a3;
  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__SKStoreRemoteViewController_dismissViewControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E5B26970;
  aBlock[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9.receiver = self;
  v9.super_class = (Class)SKStoreRemoteViewController;
  -[SKStoreRemoteViewController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v4, v8);

}

void __72__SKStoreRemoteViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeRemoteViewControllerDidDismiss");

  }
}

- (SKStoreRemoteViewControllerDelegate)delegate
{
  return (SKStoreRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
