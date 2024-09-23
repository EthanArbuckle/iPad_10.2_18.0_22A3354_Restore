@implementation SFDefaultBrowserViewController

- (SFDefaultBrowserViewController)initWithViewDidBecomeReady:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SFDefaultBrowserViewController *v8;
  uint64_t v9;
  id viewDidBecomeReady;
  uint64_t v11;
  id completionHandler;
  SFDefaultBrowserViewController *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFDefaultBrowserViewController;
  v8 = -[SFDefaultBrowserViewController init](&v15, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x1A8598C40](v6);
    viewDidBecomeReady = v8->_viewDidBecomeReady;
    v8->_viewDidBecomeReady = (id)v9;

    v11 = MEMORY[0x1A8598C40](v7);
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v11;

    -[SFDefaultBrowserViewController _initializeViewService](v8, "_initializeViewService");
    v13 = v8;
  }

  return v8;
}

- (void)_initializeViewService
{
  SFQueueingServiceViewControllerProxy *v3;
  SFDefaultBrowserServiceProtocol *serviceProxy;

  if (!self->_serviceProxy)
  {
    v3 = -[SFQueueingServiceViewControllerProxy initWithProtocol:]([SFQueueingServiceViewControllerProxy alloc], "initWithProtocol:", &unk_1EE78C200);
    serviceProxy = self->_serviceProxy;
    self->_serviceProxy = (SFDefaultBrowserServiceProtocol *)v3;

    -[SFDefaultBrowserServiceProtocol setDelegate:](self->_serviceProxy, "setDelegate:", self);
    -[SFDefaultBrowserViewController _connectToService](self, "_connectToService");
  }
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
  v6[2] = __51__SFDefaultBrowserViewController__connectToService__block_invoke;
  v6[3] = &unk_1E4AC3A80;
  v6[4] = self;
  +[SFDefaultBrowserRemoteViewController requestViewControllerWithConnectionHandler:](SFDefaultBrowserRemoteViewController, "requestViewControllerWithConnectionHandler:", v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;

}

void __51__SFDefaultBrowserViewController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 976);
  *(_QWORD *)(v7 + 976) = 0;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_didLoadRemoteViewController:", v5);
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __51__SFDefaultBrowserViewController__connectToService__block_invoke_cold_1((uint64_t)v6, v9);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 992) + 16))();
  }

}

- (id)serviceProxy
{
  -[SFDefaultBrowserViewController _initializeViewService](self, "_initializeViewService");
  return self->_serviceProxy;
}

- (void)_didLoadRemoteViewController:(id)a3
{
  SFDefaultBrowserRemoteViewController **p_remoteViewController;
  id v6;
  void *v7;
  SFDefaultBrowserServiceProtocol *serviceProxy;
  _QWORD v9[5];

  p_remoteViewController = &self->_remoteViewController;
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  v6 = a3;
  objc_msgSend(v6, "serviceViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDefaultBrowserServiceProtocol setTarget:](self->_serviceProxy, "setTarget:", v7);

  -[SFDefaultBrowserRemoteViewController setDelegate:](*p_remoteViewController, "setDelegate:", self);
  serviceProxy = self->_serviceProxy;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SFDefaultBrowserViewController__didLoadRemoteViewController___block_invoke;
  v9[3] = &unk_1E4AC05E0;
  v9[4] = self;
  -[SFDefaultBrowserServiceProtocol prepareForDisplayWithCompletionHandler:](serviceProxy, "prepareForDisplayWithCompletionHandler:", v9);

}

uint64_t __63__SFDefaultBrowserViewController__didLoadRemoteViewController___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_addRemoteViewController");
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 992) + 16))();
}

- (void)_addRemoteViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SFDefaultBrowserRemoteViewController view](self->_remoteViewController, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v7, "setFrame:");

  -[SFDefaultBrowserViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDefaultBrowserViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[SFDefaultBrowserViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewController);
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteViewController, "didMoveToParentViewController:", self);

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest)
    -[SFDefaultBrowserViewController _connectToService](self, "_connectToService", a3);
}

- (void)remoteViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  void (**completionHandler)(id, int64_t);

  completionHandler = (void (**)(id, int64_t))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, a4);
}

- (void)remoteViewControllerFailed:(id)a3
{
  (*((void (**)(void))self->_viewDidBecomeReady + 2))();
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_viewDidBecomeReady, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __51__SFDefaultBrowserViewController__connectToService__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "Failed to get remote view controller with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
