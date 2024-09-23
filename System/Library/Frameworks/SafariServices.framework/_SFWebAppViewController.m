@implementation _SFWebAppViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("_SFWebAppServiceViewController"), CFSTR("com.apple.SafariViewService"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE756508);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE769FB8);
}

- (void)loadWebAppWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadWebAppWithIdentifier:", v4);

}

- (void)processWebPushForWebAppWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processWebPushForWebAppWithIdentifier:", v4);

}

- (void)handlePushNotificationActivation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlePushNotificationActivation:", v4);

}

- (_SFWebAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _SFWebAppViewController *v4;
  void *v5;
  _SFWebAppViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFWebAppViewController;
  v4 = -[_SFWebAppViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__sf_sceneWillEnterForeground_, *MEMORY[0x1E0DC5338], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__sf_sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__sf_sceneDidBecomeActive_, *MEMORY[0x1E0DC5308], 0);
    MEMORY[0x1A8597E9C](objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__sf_sceneWillResignActive_, *MEMORY[0x1E0DC5330], 0));
    v6 = v4;

  }
  return v4;
}

- (void)didChangeLoadingState:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[_SFWebAppViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "webAppViewController:didChangeLoadingState:", self, v3);

}

- (void)didFinishInitialLoad:(BOOL)a3
{
  id v4;

  -[_SFWebAppViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "webAppViewControllerDidFinishInitialLoad:", self);

}

- (void)fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4
{
  id v4;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFetchCustomActivities:excludedActivityTypes:", 0, 0);

}

- (void)suspendApplication
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3720]), "initWithInfo:responder:", 0, 0);
  -[_SFWebAppViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendActions:", v7);

}

- (void)destroyScene
{
  void *v2;
  void *v3;
  id v4;

  -[_SFWebAppViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sf_destroyScene");

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFWebAppViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "webAppViewController:viewServiceDidTerminateWithError:", self, v5);

}

- (void)_sf_sceneWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_SFWebAppViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginDigitalHealthTracking");

  }
}

- (void)_sf_sceneDidEnterBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_SFWebAppViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopDigitalHealthTrackingWithCompletionHandler:", &__block_literal_global_33);

  }
}

- (void)_sf_sceneDidBecomeActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_SFWebAppViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webAppDidBecomeActive");

  }
}

- (void)_sf_sceneWillResignActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_SFWebAppViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webAppWillResignActive");

  }
}

- (_SFWebAppViewControllerDelegate)delegate
{
  return (_SFWebAppViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
