@implementation EXHostViewController

- (EXHostViewController)init
{
  EXHostViewController *v2;
  _EXHostSessionDriver *v3;
  _EXHostSessionDriver *sessionDriver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EXHostViewController;
  v2 = -[EXHostViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_EXHostSessionDriver initWithHostViewController:]([_EXHostSessionDriver alloc], "initWithHostViewController:", v2);
    sessionDriver = v2->_sessionDriver;
    v2->_sessionDriver = v3;

  }
  return v2;
}

- (EXHostViewController)initWithConfiguration:(id)a3
{
  id v4;
  EXHostViewController *v5;
  EXHostViewController *v6;

  v4 = a3;
  v5 = -[EXHostViewController init](self, "init");
  v6 = v5;
  if (v5)
    -[EXHostViewController setConfiguration:](v5, "setConfiguration:", v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_EXHostSessionDriver setSession:](self->_sessionDriver, "setSession:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EXHostViewController;
  -[EXHostViewController dealloc](&v3, sel_dealloc);
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
  v4 = objc_alloc(MEMORY[0x24BDC79D8]);
  objc_msgSend(v15, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "instanceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithExtensionIdentity:instanceIdentifier:", v5, v6);

  -[_EXHostSessionDriver startSessionWithProcessConfiguration:configuration:](self->_sessionDriver, "startSessionWithProcessConfiguration:configuration:", v7, v15);
  if (v15)
  {
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
    -[APBaseExtensionShieldView removeFromSuperview](self->_shieldView, "removeFromSuperview");
    v9 = self->_shieldView;
    self->_shieldView = 0;
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_new();
  -[EXHostViewController setView:](self, "setView:", v3);

  -[EXHostViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[EXHostViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[EXHostViewController placeholderView](self, "placeholderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "embedView:", v5);

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
    -[EXHostViewController embedViewController:](self, "embedViewController:", v6);
  }
  else
  {
    -[_EXHostSessionDriver session](self->_sessionDriver, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sceneViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EXHostViewController embedViewController:](self, "embedViewController:", v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)EXHostViewController;
  -[EXHostViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);

}

- (void)embedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EXHostViewController embededViewController](self, "embededViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8)
  {
    if (v4)
    {
      -[EXHostViewController setEmbededViewController:](self, "setEmbededViewController:", 0);
      objc_msgSend(v4, "removeFromParentViewController");
    }
    if (v8)
    {
      objc_msgSend(v8, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EXHostViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "embedView:", v5);

      -[EXHostViewController setEmbededViewController:](self, "setEmbededViewController:", v8);
      -[EXHostViewController addChildViewController:](self, "addChildViewController:", v8);
    }
    else
    {
      -[EXHostViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EXHostViewController placeholderView](self, "placeholderView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "embedView:", v7);

    }
  }

}

- (_UIRemoteSheet)_remoteSheet
{
  void *v2;
  void *v3;

  -[EXHostViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIRemoteSheet *)v3;
}

- (NSXPCConnection)makeXPCConnectionWithError:(NSError *)error
{
  return (NSXPCConnection *)-[_EXHostSessionDriver makeXPCConnectionWithError:](self->_sessionDriver, "makeXPCConnectionWithError:", error);
}

- (id)extensionProcess
{
  return -[_EXHostSessionDriver extensionProcess](self->_sessionDriver, "extensionProcess");
}

- (void)addShieldView
{
  id v2;

  -[EXHostViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addShieldView");

}

- (void)removeShieldView
{
  id v2;

  -[EXHostViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeShieldView");

}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _OWORD v14[2];

  v4 = objc_alloc(MEMORY[0x24BE04300]);
  -[EXHostViewController session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXHostViewController session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v11 = (void *)objc_msgSend(v4, "initWithExtensionIdentity:auditToken:", v7, v14);

  objc_msgSend(MEMORY[0x24BE04318], "sharedGuard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke;
  v13[3] = &unk_24C3E39A8;
  v13[4] = self;
  objc_msgSend(v12, "authenticateForExtension:completion:", v11, v13);

}

void __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2;
  block[3] = &unk_24C3E3980;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (*(_BYTE *)(a1 + 48))
  {
    _EXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "removeShieldView");
  }
  v11 = *(_QWORD *)(a1 + 40);
  v10 = a1 + 40;
  if (v11)
  {
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);

  }
}

- (_EXHostViewControllerSession)session
{
  return self->_session;
}

- (APBaseExtensionShieldView)shieldView
{
  return self->_shieldView;
}

- (void)setShieldView:(id)a3
{
  objc_storeStrong((id *)&self->_shieldView, a3);
}

- (void)setPlaceholderView:(UIView *)placeholderView
{
  objc_storeStrong((id *)&self->_placeholderView, placeholderView);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (_EXHostSessionDriver)sessionDriver
{
  return (_EXHostSessionDriver *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setSessionDriver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (UIViewController)embededViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setEmbededViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embededViewController, 0);
  objc_storeStrong((id *)&self->_sessionDriver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __55___EXHostViewController_shieldViewUnlockButtonPressed___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55___EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2;
  block[3] = &unk_24C3E3980;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __55___EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (*(_BYTE *)(a1 + 48))
  {
    _EXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "removeShieldView");
  }
  v11 = *(_QWORD *)(a1 + 40);
  v10 = a1 + 40;
  if (v11)
  {
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);

  }
}

void __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_20AE73000, a2, a3, "Unlocked failed with error: %@", a5, a6, a7, a8, 2u);
}

void __54__EXHostViewController_shieldViewUnlockButtonPressed___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20AE73000, a1, a3, "Successfully Unlocked", a5, a6, a7, a8, 0);
}

@end
