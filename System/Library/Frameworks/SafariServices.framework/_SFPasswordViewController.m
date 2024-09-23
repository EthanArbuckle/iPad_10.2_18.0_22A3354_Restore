@implementation _SFPasswordViewController

- (_SFPasswordViewController)init
{
  _SFPasswordViewController *v2;
  _SFPasswordViewController *v3;
  _SFPasswordViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFPasswordViewController;
  v2 = -[_SFPasswordViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_SFPasswordViewController _setUpServiceProxyIfNeeded](v2, "_setUpServiceProxyIfNeeded");
    -[_SFPasswordViewController _connectToService](v3, "_connectToService");
    v4 = v3;
  }

  return v3;
}

- (void)_addRemoteViewAsChild
{
  id v3;

  -[_SFPasswordViewController _addRemoteView](self, "_addRemoteView");
  -[_SFPasswordViewController _remoteViewController](self, "_remoteViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFPasswordViewController addChildViewController:](self, "addChildViewController:", v3);

}

- (void)_addRemoteView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_SFPasswordViewController _remoteViewController](self, "_remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    v4 = -[_SFPasswordViewController isViewLoaded](self, "isViewLoaded");
    v3 = v8;
    if (v4)
    {
      objc_msgSend(v8, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPasswordViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v5);

      -[_SFPasswordViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      objc_msgSend(v5, "setFrame:");

      objc_msgSend(v5, "setAutoresizingMask:", 18);
      v3 = v8;
    }
  }

}

- (id)_remoteViewController
{
  return 0;
}

- (id)_connectToServiceWithCompletion:(id)a3
{
  return 0;
}

- (void)_connectToService
{
  id v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *cancelViewServiceRequest;
  _QWORD v6[5];

  v3 = (id)-[_UIAsyncInvocation invoke](self->_cancelViewServiceRequest, "invoke");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46___SFPasswordViewController__connectToService__block_invoke;
  v6[3] = &unk_1E4ABFE00;
  v6[4] = self;
  -[_SFPasswordViewController _connectToServiceWithCompletion:](self, "_connectToServiceWithCompletion:", v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;

}

- (void)_dismissPasswordViewController
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59___SFPasswordViewController__dismissPasswordViewController__block_invoke;
  v4[3] = &unk_1E4ABFE00;
  v4[4] = self;
  v3 = (void *)MEMORY[0x1A8598C40](v4, a2);
  -[_SFPasswordViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);

}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest)
    -[_SFPasswordViewController _connectToService](self, "_connectToService", a3);
}

- (_SFPasswordViewControllerDelegate)delegate
{
  return (_SFPasswordViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
}

@end
