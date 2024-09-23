@implementation SKProductPageRemoteViewController

+ (id)exportedInterface
{
  return +[SKProductPageExtension clientInterface](SKProductPageExtension, "clientInterface");
}

+ (id)serviceViewControllerInterface
{
  return +[SKProductPageExtension serviceInterface](SKProductPageExtension, "serviceInterface");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "productPageRemoteViewController:didTerminateWithError:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController delegate](self, "delegate"));
    objc_msgSend(v6, "productPageRemoteViewController:didTerminateWithError:", self, v7);

  }
}

- (void)finishWithResult:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController delegate](self, "delegate"));
  objc_msgSend(v7, "productPageRemoteViewController:finishWithResult:completion:", self, a3, v6);

}

- (void)loadDidFinish
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController delegate](self, "delegate"));
  objc_msgSend(v3, "productPageRemoteViewControllerLoadDidFinish:", self);

}

- (void)userDidInteractWithProduct:(unint64_t)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController delegate](self, "delegate"));
  objc_msgSend(v5, "productPageRemoteViewController:userDidInteractWithProduct:", self, a3);

}

- (void)setShowsStoreButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v4, "_setShowsStoreButton:", v3);

}

- (void)setCancelButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v5, "_setCancelButtonTitle:", v4);

}

- (void)setRightBarButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v5, "_setRightBarButtonTitle:", v4);

}

- (void)setShowsRightBarButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v4, "_setShowsRightBarButton:", v3);

}

- (void)setPromptString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v5, "_setPromptString:", v4);

}

- (void)setAskToBuy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v4, "_setAskToBuy:", v3);

}

- (void)setUsageContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v5, "_setUsageContext:", v4);

}

- (void)setVisibleInClientWindow:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v5, "setVisibleInClientWindow:", v4);

}

- (void)finishImmediately
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController delegate](self, "delegate"));
  objc_msgSend(v3, "productPageRemoteViewController:finishWithResult:completion:", self, 0, 0);

}

- (void)setPreview:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v5, "setPreview:", v4);

}

- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SKProductPageRemoteViewController extensionProxy](self, "extensionProxy"));
  objc_msgSend(v7, "_setupWithClientBundleID:bagType:", v6, a4);

}

- (SKProductPageRemoteViewControllerDelegate)delegate
{
  return (SKProductPageRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
