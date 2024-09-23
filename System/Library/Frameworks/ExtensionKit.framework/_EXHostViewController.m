@implementation _EXHostViewController

- (_EXHostViewController)init
{
  _EXHostViewController *v2;
  _EXHostSessionDriver *v3;
  _EXHostSessionDriver *sessionDriver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_EXHostViewController;
  v2 = -[_EXHostViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_EXHostSessionDriver initWithHostViewController:]([_EXHostSessionDriver alloc], "initWithHostViewController:", v2);
    sessionDriver = v2->_sessionDriver;
    v2->_sessionDriver = v3;

  }
  return v2;
}

- (_EXHostViewController)initWithConfiguration:(id)a3
{
  id v4;
  _EXHostViewController *v5;
  _EXHostViewController *v6;

  v4 = a3;
  v5 = -[_EXHostViewController init](self, "init");
  v6 = v5;
  if (v5)
    -[_EXHostViewController setConfiguration:](v5, "setConfiguration:", v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_EXHostSessionDriver setSession:](self->_sessionDriver, "setSession:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_EXHostViewController;
  -[_EXHostViewController dealloc](&v3, sel_dealloc);
}

- (_EXHostViewControllerConfiguration)configuration
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_EXHostSessionDriver session](self->_sessionDriver, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (_EXHostViewControllerConfiguration *)v5;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  APBaseExtensionShieldView *v13;
  APBaseExtensionShieldView *shieldView;
  id v15;

  v15 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v15)
  {
    v4 = objc_alloc(MEMORY[0x24BDC79D8]);
    objc_msgSend(v15, "extensionIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "instanceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithExtensionIdentity:instanceIdentifier:", v5, v6);

    -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:](self->_sessionDriver, "startSessionWithProcessConfiguration:configuration:", v7, v15);
    objc_msgSend(v15, "extensionIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    appProtectionEffectiveContainerFor(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc((Class)getAPBaseExtensionShieldViewClass());
    objc_msgSend(v9, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    iconImageFor(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (APBaseExtensionShieldView *)objc_msgSend(v10, "initWithLocalizedApplicationName:iconImage:", v11, v12);
    shieldView = self->_shieldView;
    self->_shieldView = v13;

    -[APBaseExtensionShieldView setDelegate:](self->_shieldView, "setDelegate:", self);
  }
  else
  {
    -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:](self->_sessionDriver, "startSessionWithProcessConfiguration:configuration:", 0, 0);
  }

}

- (_EXHostViewControllerSession)session
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  return -[_EXHostSessionDriver session](self->_sessionDriver, "session");
}

- (void)setSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  APBaseExtensionShieldView *v12;
  APBaseExtensionShieldView *shieldView;
  APBaseExtensionShieldView *v14;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v4)
  {
    if ((objc_msgSend(v4, "detached") & 1) == 0)
    {
      _EXDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[_EXHostViewController setSession:].cold.1(v5);

    }
    -[_EXHostSessionDriver setSession:](self->_sessionDriver, "setSession:", v4);
    objc_msgSend(v4, "processConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    appProtectionEffectiveContainerFor(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc((Class)getAPBaseExtensionShieldViewClass());
    objc_msgSend(v8, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    iconImageFor(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (APBaseExtensionShieldView *)objc_msgSend(v9, "initWithLocalizedApplicationName:iconImage:", v10, v11);
    shieldView = self->_shieldView;
    self->_shieldView = v12;

    -[APBaseExtensionShieldView setDelegate:](self->_shieldView, "setDelegate:", self);
  }
  else
  {
    -[_EXHostSessionDriver setSession:](self->_sessionDriver, "setSession:", 0);
    -[APBaseExtensionShieldView removeFromSuperview](self->_shieldView, "removeFromSuperview");
    v14 = self->_shieldView;
    self->_shieldView = 0;

  }
}

- (void)loadView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[_EXHostViewController setView:](self, "setView:", v3);

  -[_EXHostViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[_EXHostViewController embedPlaceholder](self, "embedPlaceholder");
}

- (void)viewDidLoad
{
  -[_EXHostSessionDriver resume](self->_sessionDriver, "resume");
}

- (UIView)placeholderView
{
  UIView *placeholderView;
  UIView *v4;
  UIView *v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  placeholderView = self->_placeholderView;
  if (!placeholderView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_placeholderView;
    self->_placeholderView = v4;

    placeholderView = self->_placeholderView;
  }
  return placeholderView;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[_EXHostSessionDriver session](self->_sessionDriver, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_EXHostViewController embedViewController:](self, "embedViewController:", v6);
  }
  else
  {
    -[_EXHostSessionDriver session](self->_sessionDriver, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sceneViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_EXHostViewController embedViewController:](self, "embedViewController:", v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)_EXHostViewController;
  -[_EXHostViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXHostViewController;
  -[_EXHostViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)embedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_EXHostViewController embededViewController](self, "embededViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v7)
  {
    if (v4)
    {
      -[_EXHostViewController setEmbededViewController:](self, "setEmbededViewController:", 0);
      objc_msgSend(v4, "removeFromParentViewController");
    }
    if (v7)
    {
      objc_msgSend(v7, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EXHostViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "embedView:", v5);

      -[_EXHostViewController setEmbededViewController:](self, "setEmbededViewController:", v7);
      -[_EXHostViewController addChildViewController:](self, "addChildViewController:", v7);
      objc_msgSend(v7, "didMoveToParentViewController:", self);

    }
    else
    {
      -[_EXHostViewController embedPlaceholder](self, "embedPlaceholder");
    }
  }

}

- (_UIRemoteSheet)_remoteSheet
{
  void *v2;
  void *v3;

  -[_EXHostViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIRemoteSheet *)v3;
}

- (void)embedPlaceholder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_EXHostViewController placeholderViewController](self, "placeholderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_EXHostViewController placeholderViewController](self, "placeholderViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXHostViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "embedView:", v4);

    -[_EXHostViewController setEmbededViewController:](self, "setEmbededViewController:", v6);
    -[_EXHostViewController addChildViewController:](self, "addChildViewController:", v6);
  }
  else
  {
    -[_EXHostViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_EXHostViewController placeholderView](self, "placeholderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embedView:", v4);
  }

}

- (id)makeXPCConnectionWithError:(id *)a3
{
  return -[_EXHostSessionDriver makeXPCConnectionWithError:](self->_sessionDriver, "makeXPCConnectionWithError:", a3);
}

- (_EXExtensionProcess)extensionProcess
{
  return (_EXExtensionProcess *)-[_EXHostSessionDriver extensionProcess](self->_sessionDriver, "extensionProcess");
}

- (void)addShieldView
{
  id v2;

  -[_EXHostViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addShieldView");

}

- (void)removeShieldView
{
  id v2;

  -[_EXHostViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeShieldView");

}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _OWORD v16[2];

  -[_EXHostViewController session](self, "session", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE04300]);
    -[_EXHostViewController session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extensionProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXHostViewController session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extensionProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "auditToken");
    else
      memset(v16, 0, sizeof(v16));
    v13 = (void *)objc_msgSend(v6, "initWithExtensionIdentity:auditToken:", v9, v16);

    objc_msgSend(MEMORY[0x24BE04318], "sharedGuard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __55___EXHostViewController_shieldViewUnlockButtonPressed___block_invoke;
    v15[3] = &unk_24C3E39A8;
    v15[4] = self;
    objc_msgSend(v14, "authenticateForExtension:completion:", v13, v15);

  }
}

- (APBaseExtensionShieldView)shieldView
{
  return self->_shieldView;
}

- (void)setShieldView:(id)a3
{
  objc_storeStrong((id *)&self->_shieldView, a3);
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (_EXHostViewControllerDelegate)delegate
{
  return (_EXHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_EXHostViewControllerDelegate)placeholderViewController
{
  return self->_placeholderViewController;
}

- (void)setPlaceholderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderViewController, a3);
}

- (void)setExtensionProcess:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProcess, a3);
}

- (_EXHostSessionDriver)sessionDriver
{
  return (_EXHostSessionDriver *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setSessionDriver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (UIViewController)embededViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setEmbededViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (_EXHostViewControllerConfiguration)innerConfiguration
{
  return self->_innerConfiguration;
}

- (void)setInnerConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerConfiguration, 0);
  objc_storeStrong((id *)&self->_embededViewController, 0);
  objc_storeStrong((id *)&self->_sessionDriver, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
}

- (void)setSession:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = "session == nil || session.detached";
  v3 = 2080;
  v1 = 136315650;
  v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/HostViewController/EXHostViewController.m";
  v5 = 1024;
  v6 = 495;
  _os_log_fault_impl(&dword_20AE73000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Only detached sessions can be set", (uint8_t *)&v1, 0x1Cu);
}

@end
