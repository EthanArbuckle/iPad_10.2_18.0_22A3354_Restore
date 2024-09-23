@implementation ASOOverlayManager

- (ASOOverlayManager)initWithScene:(id)a3
{
  id v4;
  ASOOverlayManager *v5;
  ASOOverlayManager *v6;
  id v7;
  char isKindOfClass;
  ASOOverlayWindow *v9;
  ASOOverlayWindow *window;
  uint8_t v12[16];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASOOverlayManager;
  v5 = -[ASOOverlayManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_scene, v4);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v9 = -[ASOOverlayWindow initWithWindowScene:]([ASOOverlayWindow alloc], "initWithWindowScene:", v4);
      window = v6->_window;
      v6->_window = v9;

      -[ASOOverlayWindow setHidden:](v6->_window, "setHidden:", 0);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Attempted to create overlay manager without a window scene", v12, 2u);
    }
  }

  return v6;
}

- (ASOOverlayManager)initWithWindowScene:(id)a3
{
  id v4;
  ASOOverlayManager *v5;
  ASOOverlayManager *v6;
  ASOOverlayWindow *v7;
  ASOOverlayWindow *window;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASOOverlayManager;
  v5 = -[ASOOverlayManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = -[ASOOverlayWindow initWithWindowScene:]([ASOOverlayWindow alloc], "initWithWindowScene:", v4);
    window = v6->_window;
    v6->_window = v7;

  }
  return v6;
}

- (void)presentOverlay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Overlay manager received present overlay call: %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 6
    || (-[ASOOverlayManager window](self, "window"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__ASOOverlayManager_presentOverlay___block_invoke;
    v8[3] = &unk_24C7D7F08;
    v8[4] = self;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

void __36__ASOOverlayManager_presentOverlay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "makeViewControllerIfNeeded");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverlayManager:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "overlayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdditionalValue:forKey:", v4, CFSTR("ASOOverlayConfigurationParameterHostBundleID"));

  objc_msgSend(*(id *)(a1 + 40), "overlayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditionalValue:forKey:", v7, CFSTR("ASOOverlayConfigurationParameterHostSceneIdentifier"));

  objc_msgSend(v8, "presentOverlay:", *(_QWORD *)(a1 + 40));
}

- (void)dismissOverlay
{
  _QWORD block[5];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Overlay manager received dismiss overlay call", buf, 2u);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ASOOverlayManager_dismissOverlay__block_invoke;
  block[3] = &unk_24C7D7E08;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __35__ASOOverlayManager_dismissOverlay__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissOverlay");

  }
}

- (void)willStartPresentingOverlay
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 6)
  {
    -[ASOOverlayManager window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[ASOOverlayManager window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASOOverlayManager viewController](self, "viewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRootViewController:", v8);

    }
    -[ASOOverlayManager window](self, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

  }
}

- (void)didFinishDismissingOverlay
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ASOOverlayManager_didFinishDismissingOverlay__block_invoke;
  block[3] = &unk_24C7D7E08;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __47__ASOOverlayManager_didFinishDismissingOverlay__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 != 6)
  {
    objc_msgSend(*(id *)(a1 + 32), "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "window");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRootViewController:", 0);

  }
}

- (id)makeViewControllerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[ASOOverlayManager viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[ASOOverlayManager setViewController:](self, "setViewController:", v4);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 != 6)
    {
      -[ASOOverlayManager window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASOOverlayManager viewController](self, "viewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRootViewController:", v8);

    }
    -[ASOOverlayManager viewController](self, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadViewIfNeeded");

  }
  return -[ASOOverlayManager viewController](self, "viewController");
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (ASOOverlayWindow)window
{
  return self->_window;
}

- (ASOOverlayViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end
