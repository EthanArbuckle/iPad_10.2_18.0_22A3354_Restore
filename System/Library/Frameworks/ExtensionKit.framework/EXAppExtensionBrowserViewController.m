@implementation EXAppExtensionBrowserViewController

- (void)loadView
{
  id v3;
  _EXHostViewController *v4;
  _EXHostViewController *hostViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  v4 = objc_alloc_init(_EXHostViewController);
  hostViewController = self->_hostViewController;
  self->_hostViewController = v4;

  -[_EXHostViewController view](self->_hostViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v6);
  v15 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v6, "leftAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(v6, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  objc_msgSend(v6, "rightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  objc_msgSend(v6, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v13);

  -[EXAppExtensionBrowserViewController addChildViewController:](self, "addChildViewController:", self->_hostViewController);
  -[EXAppExtensionBrowserViewController setView:](self, "setView:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[EXAppExtensionBrowserViewController beginHosting](self, "beginHosting");
  v5.receiver = self;
  v5.super_class = (Class)EXAppExtensionBrowserViewController;
  -[EXAppExtensionBrowserViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)beginHosting
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_alloc(MEMORY[0x24BDC79E8]);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithExtensionPointIdentifier:predicate:", CFSTR("com.apple.extensionkit.app-extension-management"), v4);

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BDC79F0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_2;
  v7[3] = &unk_24C3E3958;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "executeQuery:completionHandler:", v5, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

BOOL __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.extensionkit.AppExtensionManagement")))
  {
    objc_msgSend(v2, "entitlementNamed:ofClass:", CFSTR("com.apple.private.extensionkit.extension-management"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_15;
    v8[3] = &unk_24C3E3930;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    v9 = v5;
    v6 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    _EXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_2_cold_1(v7);

    __break(1u);
  }
}

void __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_15(uint64_t a1)
{
  _EXHostViewControllerConfiguration *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = -[_EXHostViewControllerConfiguration initWithExtensionIdentity:]([_EXHostViewControllerConfiguration alloc], "initWithExtensionIdentity:", *(_QWORD *)(a1 + 32));
    -[_EXHostViewControllerConfiguration setSceneIdentifier:](v2, "setSceneIdentifier:", CFSTR("default"));
    objc_msgSend(WeakRetained, "hostViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setConfiguration:", v2);

  }
}

- (_EXHostViewController)hostViewController
{
  return (_EXHostViewController *)objc_getProperty(self, a2, 968, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewController, 0);
}

void __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_2_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = "identity";
  v3 = 2080;
  v1 = 136315650;
  v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/ExtensionManagement/EXAppExtensionBrowserViewController.m";
  v5 = 1024;
  v6 = 70;
  _os_log_fault_impl(&dword_20AE73000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Failed to find management extension.", (uint8_t *)&v1, 0x1Cu);
}

@end
