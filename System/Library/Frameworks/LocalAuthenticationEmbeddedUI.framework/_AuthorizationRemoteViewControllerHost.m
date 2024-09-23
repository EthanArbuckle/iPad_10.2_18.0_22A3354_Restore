@implementation _AuthorizationRemoteViewControllerHost

+ (void)requestViewControllerWithConnectionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FE91000, v6, OS_LOG_TYPE_DEFAULT, "RemoteUI call started", buf, 2u);
  }

  __85___AuthorizationRemoteViewControllerHost_requestViewControllerWithConnectionHandler___block_invoke();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85___AuthorizationRemoteViewControllerHost_requestViewControllerWithConnectionHandler___block_invoke_2;
  v10[3] = &unk_24FDCDA60;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  objc_msgSend(a1, "_requestViewController:connectionHandler:", v7, v10);

}

+ (void)_requestViewController:(id)a3 connectionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  v6 = a3;
  objc_msgSend(v6, "serviceViewControllerClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v7, v8, v10);
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken != -1)
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global_111);
  return (id)exportedInterface_interface;
}

+ (id)serviceViewControllerInterface
{
  if (serviceViewControllerInterface_onceToken != -1)
    dispatch_once(&serviceViewControllerInterface_onceToken, &__block_literal_global_117);
  return (id)serviceViewControllerInterface_interface;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_AuthorizationRemoteViewControllerHost;
  v4 = a3;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v6, sel_viewServiceDidTerminateWithError_, v4);
  -[_AuthorizationRemoteViewControllerHost delegate](self, "delegate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sheetDidFinishWithError:", v4);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  _AuthorizationRemoteViewControllerHost *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  LA_LOG_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_22FE91000, v3, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)_AuthorizationRemoteViewControllerHost;
  -[_UIRemoteViewController dealloc](&v4, sel_dealloc);
}

- (void)authenticatorServiceDidFinishWithError:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  v6 = a3;
  -[_AuthorizationRemoteViewControllerHost delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sheetDidFinishWithError:", v6);

  v8[2]();
}

- (void)authenticatorServiceDidObtainAuthenticationWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_AuthorizationRemoteViewControllerHost delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didProvideAuthorizationRequirementWithReply:", v4);

}

- (void)startWithConfiguration:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71___AuthorizationRemoteViewControllerHost_startWithConfiguration_reply___block_invoke;
  v10[3] = &unk_24FDCD758;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startWithConfiguration:reply:", v8, v7);

}

- (void)stopWithReply:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56___AuthorizationRemoteViewControllerHost_stopWithReply___block_invoke;
  v7[3] = &unk_24FDCD758;
  v8 = v4;
  v5 = v4;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopWithReply:", v5);

}

- (_AuthorizationRemoteViewControllerHostDelegate)delegate
{
  return (_AuthorizationRemoteViewControllerHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
