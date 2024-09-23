@implementation _SFExternalPasswordCredentialViewController

- (void)autoFillWithExternalCredential:(id)a3
{
  -[_SFExternalPasswordCredentialViewController _autoFillWithExternalCredential:pageID:frameID:](self, "_autoFillWithExternalCredential:pageID:frameID:", a3, 0, 0);
}

- (void)_autoFillWithExternalCredential:(id)a3 pageID:(id)a4 frameID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SFExternalPasswordCredentialServiceViewControllerProtocol *serviceProxy;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "externalCredential");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_SFExternalPasswordCredentialViewController _setUpServiceProxyIfNeeded](self, "_setUpServiceProxyIfNeeded");
    serviceProxy = self->_serviceProxy;
    if (v8 && v9)
      -[SFExternalPasswordCredentialServiceViewControllerProtocol autoFillWithCredentialIdentity:pageID:frameID:](serviceProxy, "autoFillWithCredentialIdentity:pageID:frameID:", v10, v8, v9);
    else
      -[SFExternalPasswordCredentialServiceViewControllerProtocol autoFillWithCredentialIdentity:](serviceProxy, "autoFillWithCredentialIdentity:", v10);
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_SFExternalPasswordCredentialViewController _autoFillWithExternalCredential:pageID:frameID:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

}

- (void)getCredentialForExternalCredential:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(a3, "externalCredential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFExternalPasswordCredentialViewController _setUpServiceProxyIfNeeded](self, "_setUpServiceProxyIfNeeded");
      -[SFExternalPasswordCredentialServiceViewControllerProtocol getCredentialForCredentialIdentity:completion:](self->_serviceProxy, "getCredentialForCredentialIdentity:completion:", v7, v6);
    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_SFExternalPasswordCredentialViewController getCredentialForExternalCredential:completion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C92588], 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v16);

    }
  }

}

- (_SFExternalPasswordCredentialViewController)init
{
  _SFExternalPasswordCredentialViewController *v2;
  _SFExternalPasswordCredentialViewController *v3;
  _SFExternalPasswordCredentialViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFExternalPasswordCredentialViewController;
  v2 = -[_SFPasswordViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_SFExternalPasswordCredentialViewController setModalTransitionStyle:](v2, "setModalTransitionStyle:", 12);
    -[_SFExternalPasswordCredentialViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 6);
    v4 = v3;
  }

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFExternalPasswordCredentialViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      -[_SFPasswordViewController remoteViewControllerWillDismiss:](self, "remoteViewControllerWillDismiss:", self->_remoteViewController);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SFExternalPasswordCredentialViewController;
  -[_SFExternalPasswordCredentialViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFExternalPasswordCredentialViewController;
  -[_SFExternalPasswordCredentialViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);

  if (self->_remoteViewController)
    -[_SFPasswordViewController _addRemoteViewAsChild](self, "_addRemoteViewAsChild");
}

- (void)presentExternalPasswordCredentialRemoteViewController:(id)a3
{
  id v4;

  -[_SFPasswordViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "presentExternalPasswordCredentialViewController:", self);

}

- (id)_remoteViewController
{
  return self->_remoteViewController;
}

- (void)_setUpServiceProxyIfNeeded
{
  SFQueueingServiceViewControllerProxy *v3;
  SFExternalPasswordCredentialServiceViewControllerProtocol *serviceProxy;

  if (!self->_serviceProxy)
  {
    v3 = -[SFQueueingServiceViewControllerProxy initWithProtocol:]([SFQueueingServiceViewControllerProxy alloc], "initWithProtocol:", &unk_1EE7828B0);
    serviceProxy = self->_serviceProxy;
    self->_serviceProxy = (SFExternalPasswordCredentialServiceViewControllerProtocol *)v3;

    -[SFExternalPasswordCredentialServiceViewControllerProtocol setDelegate:](self->_serviceProxy, "setDelegate:", self);
  }
}

- (id)_connectToServiceWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79___SFExternalPasswordCredentialViewController__connectToServiceWithCompletion___block_invoke;
  v8[3] = &unk_1E4AC0D40;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[SFPasswordRemoteViewController requestViewControllerWithConnectionHandler:](SFExternalPasswordCredentialRemoteViewController, "requestViewControllerWithConnectionHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

- (void)_autoFillWithExternalCredential:(uint64_t)a3 pageID:(uint64_t)a4 frameID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "AutoFill was requested for a credential that is not external. Ignoring the request", a5, a6, a7, a8, 0);
}

- (void)getCredentialForExternalCredential:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Full credential was requested for a credential that is not external. Ignoring the request", a5, a6, a7, a8, 0);
}

@end
