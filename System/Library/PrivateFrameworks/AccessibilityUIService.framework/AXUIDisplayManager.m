@implementation AXUIDisplayManager

void __45__AXUIDisplayManager_initWithServiceManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[11];

  if (a2 == 13)
  {
    v10[9] = v3;
    v10[10] = v4;
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE003C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(*(id *)(a1 + 32), "setUserInterfaceStyle:", v7);
    v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__AXUIDisplayManager_initWithServiceManager___block_invoke_2;
    v10[3] = &__block_descriptor_40_e55_v32__0__NSString_8__UIWindow_AXUIWindowProtocol__16_B24l;
    v10[4] = v7;
    objc_msgSend(v8, "_enumerateWindowsUsingBlock:", v10);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("AXUIServerModifiedWindowInterfaceStyle"), *(_QWORD *)(a1 + 32));

  }
}

+ (id)sharedDisplayManager
{
  void *v2;
  void *v3;

  +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AXUIDisplayManager)init
{
  return -[AXUIDisplayManager initWithServiceManager:](self, "initWithServiceManager:", 0);
}

- (AXUIDisplayManager)initWithServiceManager:(id)a3
{
  id v4;
  AXUIDisplayManager *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *mainScenes;
  uint64_t v15;
  NSMutableDictionary *externalScenes;
  uint64_t v17;
  NSMutableDictionary *addContentViewControllerBlocks;
  uint64_t v19;
  void *sceneClients;
  id v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v23;
  AXUIDisplayManager *v24;
  _QWORD block[4];
  AXUIDisplayManager *v27;
  _QWORD v28[4];
  AXUIDisplayManager *v29;
  _QWORD v30[4];
  AXUIDisplayManager *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AXUIDisplayManager;
  v5 = -[AXUIDisplayManager init](&v32, sel_init);
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v7 = objc_opt_new();
    v8 = (void *)v7;
    if (v4 && v7)
    {
      -[AXUIDisplayManager setDefaultAlertStyleProvider:](v5, "setDefaultAlertStyleProvider:", v7);
      -[AXUIDisplayManager setServiceManager:](v5, "setServiceManager:", v4);
      -[AXUIDisplayManager _attemptToInitializeActiveInterfaceOrientation](v5, "_attemptToInitializeActiveInterfaceOrientation");
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__didReceiveMemoryWarning_, *MEMORY[0x24BDF7538], 0);

      if (objc_msgSend(MEMORY[0x24BE006E8], "isAvailable"))
      {
        objc_msgSend(MEMORY[0x24BE006E8], "server");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isDarkModeActive");
        v12 = 1;
        if (v11)
          v12 = 2;
        v5->_userInterfaceStyle = v12;
        v30[0] = v6;
        v30[1] = 3221225472;
        v30[2] = __45__AXUIDisplayManager_initWithServiceManager___block_invoke;
        v30[3] = &unk_24D49C968;
        v31 = v5;
        v28[0] = v6;
        v28[1] = 3221225472;
        v28[2] = __45__AXUIDisplayManager_initWithServiceManager___block_invoke_3;
        v28[3] = &unk_24D49C990;
        v29 = v31;
        objc_msgSend(v10, "registerSpringBoardActionHandler:withIdentifierCallback:", v30, v28);

      }
      v13 = objc_opt_new();
      mainScenes = v5->_mainScenes;
      v5->_mainScenes = (NSMutableDictionary *)v13;

      v15 = objc_opt_new();
      externalScenes = v5->_externalScenes;
      v5->_externalScenes = (NSMutableDictionary *)v15;

      v17 = objc_opt_new();
      addContentViewControllerBlocks = v5->_addContentViewControllerBlocks;
      v5->_addContentViewControllerBlocks = (NSMutableDictionary *)v17;

      v19 = objc_opt_new();
      sceneClients = v5->_sceneClients;
      v5->_sceneClients = (NSMutableDictionary *)v19;
    }
    else
    {
      sceneClients = v5;
      v5 = 0;
    }

    v21 = objc_alloc_init(MEMORY[0x24BEB0A08]);
    -[AXUIDisplayManager setWindowHostingController:](v5, "setWindowHostingController:", v21);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)systemAppServerReady, (CFStringRef)*MEMORY[0x24BE00418], 0, CFNotificationSuspensionBehaviorCoalesce);
    -[AXUIDisplayManager systemAppServerReady](v5, "systemAppServerReady");

  }
  dispatch_get_global_queue(0, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __45__AXUIDisplayManager_initWithServiceManager___block_invoke_4;
  block[3] = &unk_24D49C910;
  v24 = v5;
  v27 = v24;
  dispatch_async(v23, block);

  return v24;
}

void __45__AXUIDisplayManager_initWithServiceManager___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "shouldRespondToDarkModeChanges"))
    objc_msgSend(v4, "setOverrideUserInterfaceStyle:", *(_QWORD *)(a1 + 32));

}

uint64_t __45__AXUIDisplayManager_initWithServiceManager___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSystemServerActionHandlerIdentifier:", a2);
}

void __45__AXUIDisplayManager_initWithServiceManager___block_invoke_4(uint64_t a1)
{
  id v2;

  if (AXDeviceHasJindo())
  {
    v2 = *(id *)(a1 + 32);
    AXPerformBlockAsynchronouslyOnMainThread();

  }
}

double __45__AXUIDisplayManager_initWithServiceManager___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double result;

  v2 = objc_alloc_init(MEMORY[0x24BEB0B48]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:");
  v5 = *(_QWORD *)(a1 + 32);
  result = 0.0;
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[AXUIDisplayManager systemServerActionHandlerIdentifier](self, "systemServerActionHandlerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE006E8], "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeActionHandler:", v3);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);

  -[AXUIDisplayManager setDefaultAlertStyleProvider:](self, "setDefaultAlertStyleProvider:", 0);
  -[AXUIDisplayManager setAlertQueues:](self, "setAlertQueues:", 0);
  -[AXUIDisplayManager setVisibleAlertContexts:](self, "setVisibleAlertContexts:", 0);
  -[AXUIDisplayManager setActiveWindows:](self, "setActiveWindows:", 0);
  -[AXUIDisplayManager setPassiveWindows:](self, "setPassiveWindows:", 0);
  -[AXUIDisplayManager setActiveContentViewControllers:](self, "setActiveContentViewControllers:", 0);
  -[AXUIDisplayManager setPassiveContentViewControllers:](self, "setPassiveContentViewControllers:", 0);
  -[AXUIDisplayManager setNubbitContexts:](self, "setNubbitContexts:", 0);
  -[AXUIDisplayManager setSystemServerActionHandlerIdentifier:](self, "setSystemServerActionHandlerIdentifier:", 0);

  v6.receiver = self;
  v6.super_class = (Class)AXUIDisplayManager;
  -[AXUIDisplayManager dealloc](&v6, sel_dealloc);
}

- (id)contentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4
{
  void *v4;
  void *v5;

  -[AXUIDisplayManager _contentViewControllersWithUserInteractionEnabled:forService:createIfNeeded:](self, "_contentViewControllersWithUserInteractionEnabled:forService:createIfNeeded:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:context:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:context:completion:", a3, a4, a5, 0, 0);
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:", a3, a4, a5, a6, 0, 0, 0, 0);
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:context:userInterfaceStyle:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:context:userInterfaceStyle:completion:", a3, a4, a5, a6, 0, a7);
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 completion:(id)a8
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:context:userInterfaceStyle:forWindowScene:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:context:userInterfaceStyle:forWindowScene:completion:", a3, a4, a5, a6, a7, 0, a8);
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 forWindowScene:(id)a8 completion:(id)a9
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:", a3, a4, a5, 0, a6, a7, a8, a9);
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 userInterfaceStyle:(int64_t)a7 allowSystemAppHosting:(BOOL)a8 forWindowScene:(id)a9 completion:(id)a10
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:", a3, a4, a5, 0, a6, a7);
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 allowSystemAppHosting:(BOOL)a9 forWindowScene:(id)a10 completion:(id)a11
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 allowSystemAppHosting:(BOOL)a6
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:context:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:context:completion:", a3, a4, a5, 0, 0);
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 completion:(id)a10
{
  -[AXUIDisplayManager addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:spatialConfiguration:completion:](self, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:spatialConfiguration:completion:", a3, a4, a5, a6, a7, a8, a9, 0, a10);
}

- (BOOL)_platformShouldUseScenes
{
  if (_platformShouldUseScenes_onceToken != -1)
    dispatch_once(&_platformShouldUseScenes_onceToken, &__block_literal_global);
  return _platformShouldUseScenes__UseScenes;
}

void __46__AXUIDisplayManager__platformShouldUseScenes__block_invoke()
{
  NSObject *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  _platformShouldUseScenes__UseScenes = 1;
  AXLogUI();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_215E2A000, v0, OS_LOG_TYPE_DEFAULT, "AXUIServer will request scenes for its UI: %@", (uint8_t *)&v2, 0xCu);

  }
}

- (void)addContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 spatialConfiguration:(id)a10 completion:(id)a11
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, uint64_t);
  void *v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  char v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  objc_class *v29;
  void *v30;
  id v31;
  void *v33;
  _BOOL4 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v35 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v18 = a10;
  v19 = (void (**)(id, uint64_t))a11;
  +[AXUIAssertionManager sharedInstance](AXUIAssertionManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "acquireAssertionUIIfNeeded");

  v21 = -[AXUIDisplayManager _platformShouldUseScenes](self, "_platformShouldUseScenes");
  if (!v21)
  {

    v16 = 0;
  }
  -[AXUIDisplayManager windowSceneForSceneClientIdentifier:external:](self, "windowSceneForSceneClientIdentifier:external:", v16, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogUI();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219266;
    v37 = v14;
    v38 = 2112;
    v39 = objc_opt_class();
    v40 = 2112;
    v41 = v15;
    v42 = 2112;
    v43 = v16;
    v44 = 2048;
    v45 = v17;
    v46 = 2048;
    v47 = v22;
    _os_log_impl(&dword_215E2A000, v23, OS_LOG_TYPE_INFO, "Adding contentVC=%p %@ service=%@ sceneClientIdentifier:%@ windowScene=%p, savedWindowScene=%p", buf, 0x3Eu);
  }

  if (v15 && v16)
    -[NSMutableDictionary setObject:forKey:](self->_sceneClients, "setObject:forKey:", v15, v16);
  v24 = !v21;
  if (v17)
    v24 = 1;
  if ((v24 & 1) != 0 || v22)
  {
    -[AXUIDisplayManager _contentViewControllersWithUserInteractionEnabled:forService:createIfNeeded:](self, "_contentViewControllersWithUserInteractionEnabled:forService:createIfNeeded:", v35, v15, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v14 && (objc_msgSend(v25, "containsObject:", v14) & 1) == 0)
    {
      v31 = v18;
      objc_msgSend(v26, "addObject:", v14);
      -[AXUIDisplayManager desiredWindowLevelForService:forContentViewController:userInteractionEnabled:](self, "desiredWindowLevelForService:forContentViewController:userInteractionEnabled:", v15, v14, v35);
      v28 = v27;
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIDisplayManager _windowWithUserInteractionEnabled:windowLevel:createIfNeeded:purposeIdentifier:userInterfaceStyle:windowScene:savedWindowScene:](self, "_windowWithUserInteractionEnabled:windowLevel:createIfNeeded:purposeIdentifier:userInterfaceStyle:windowScene:savedWindowScene:", v35, 1, v30, a8, v17, v22, v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        objc_msgSend(v33, "makeKeyAndVisible");
      else
        objc_msgSend(v33, "setHidden:", 0);
      -[AXUIDisplayManager _addContentViewController:toWindow:forService:context:completion:](self, "_addContentViewController:toWindow:forService:context:completion:", v14, v33, v15, a7, v19);

      v18 = v31;
    }
    else if (v19)
    {
      v19[2](v19, 1);
    }

  }
  else
  {
    -[AXUIDisplayManager waitForSceneAddContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:spatialConfiguration:completion:](self, "waitForSceneAddContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:spatialConfiguration:completion:", v14, v35, v15, v16, a7, a8, 0, v18, v19);
  }

}

- (void)waitForSceneAddContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 forSceneClientIdentifier:(id)a6 context:(void *)a7 userInterfaceStyle:(int64_t)a8 forWindowScene:(id)a9 spatialConfiguration:(id)a10 completion:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id *v37;
  id v38;
  _BOOL4 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47[3];
  BOOL v48;
  id location;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v39 = a4;
  v52 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __196__AXUIDisplayManager_waitForSceneAddContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_spatialConfiguration_completion___block_invoke;
  v40[3] = &unk_24D49C9F8;
  v37 = v47;
  objc_copyWeak(v47, &location);
  v22 = v16;
  v41 = v22;
  v48 = v39;
  v38 = v17;
  v42 = v38;
  v23 = v18;
  v43 = v23;
  v47[1] = a7;
  v47[2] = (id)a8;
  v24 = v19;
  v44 = v24;
  v25 = v20;
  v45 = v25;
  v26 = v21;
  v46 = v26;
  v27 = (void *)MEMORY[0x2199F2788](v40);
  v28 = -[AXUIDisplayManager sceneRequestedForSceneClientIdentifier:](self, "sceneRequestedForSceneClientIdentifier:", v23);
  -[AXUIDisplayManager saveAddContentViewControllerBlock:forObjectKey:forSceneClientIdentifier:](self, "saveAddContentViewControllerBlock:forObjectKey:forSceneClientIdentifier:", v27, v22, v23);
  AXLogUI();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v22;
    _os_log_impl(&dword_215E2A000, v29, OS_LOG_TYPE_INFO, "Tried to add %@ before a scene was connected, queuing for later.", buf, 0xCu);
  }

  if (!v28)
  {
    +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager", v47);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_respondsToSelector();

    if ((v32 & 1) != 0)
    {
      -[AXUIDisplayManager desiredWindowLevelForService:forContentViewController:userInteractionEnabled:](self, "desiredWindowLevelForService:forContentViewController:userInteractionEnabled:", v38, v22, v39);
      v34 = v33;
      +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "requestSceneForSceneClientIdentifier:scenePreferredLevel:spatialConfiguration:", v23, v25, v34);

    }
  }

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);

}

void __196__AXUIDisplayManager_waitForSceneAddContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_spatialConfiguration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:spatialConfiguration:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 104), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (void)removeContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5
{
  -[AXUIDisplayManager removeContentViewController:withUserInteractionEnabled:forService:context:completion:](self, "removeContentViewController:withUserInteractionEnabled:forService:context:completion:", a3, a4, a5, 0, 0);
}

- (void)removeContentViewController:(id)a3 withUserInteractionEnabled:(BOOL)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  -[AXUIDisplayManager removeAddContentViewControllerBlockForObjectKey:](self, "removeAddContentViewControllerBlockForObjectKey:", v12);
  -[AXUIDisplayManager _contentViewControllersWithUserInteractionEnabled:forService:createIfNeeded:](self, "_contentViewControllersWithUserInteractionEnabled:forService:createIfNeeded:", v10, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || v12 && objc_msgSend(v15, "containsObject:", v12))
  {
    objc_msgSend(v16, "removeObject:", v12);
    if (!objc_msgSend(v16, "count"))
      -[AXUIDisplayManager _disposeOfContentViewControllersWithUserInteractionEnabled:forService:](self, "_disposeOfContentViewControllersWithUserInteractionEnabled:forService:", v10, v13);
    if (objc_msgSend(v12, "conformsToProtocol:", &unk_254E24890)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __107__AXUIDisplayManager_removeContentViewController_withUserInteractionEnabled_forService_context_completion___block_invoke;
      v17[3] = &unk_24D49CA20;
      v17[4] = self;
      v18 = v12;
      v19 = v13;
      v20 = v14;
      objc_msgSend(v18, "transitionOutWithContext:completion:", a6, v17);

    }
    else
    {
      -[AXUIDisplayManager _removeContentViewController:forService:completion:](self, "_removeContentViewController:forService:completion:", v12, v13, v14);
    }
  }
  else if (v14)
  {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }

}

uint64_t __107__AXUIDisplayManager_removeContentViewController_withUserInteractionEnabled_forService_context_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeContentViewController:forService:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 forService:(id)a7
{
  double v7;

  v7 = 3.0;
  if (!a6)
    v7 = 1.5;
  return -[AXUIDisplayManager showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:](self, "showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:", a3, a4, a5, v7);
}

- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 priority:(unint64_t)a7 duration:(double)a8 forService:(id)a9
{
  return -[AXUIDisplayManager showAlertWithText:subtitleText:iconImage:type:priority:duration:userInfo:forService:](self, "showAlertWithText:subtitleText:iconImage:type:priority:duration:userInfo:forService:", a3, a4, a5, a6, a7, MEMORY[0x24BDBD1B8], a8, a9);
}

- (id)showAlertWithText:(id)a3 subtitleText:(id)a4 iconImage:(id)a5 type:(unint64_t)a6 priority:(unint64_t)a7 duration:(double)a8 userInfo:(id)a9 forService:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a9;
  v21 = a10;
  if (!objc_msgSend(v17, "length"))
  {
    AXLogUI();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "Cannot show alert. Text was empty";
      v30 = v26;
      v31 = 2;
LABEL_8:
      _os_log_impl(&dword_215E2A000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    }
LABEL_9:
    v24 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v21, "conformsToProtocol:", &unk_254E248F0) & 1) == 0)
  {
    AXLogUI();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      v29 = "Cannot show alert service does not conform to AXUIService: %@";
      v30 = v26;
      v31 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  +[AXUIAssertionManager sharedInstance](AXUIAssertionManager, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "acquireAssertionUIIfNeeded");

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setIdentifier:", v24);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v25, "setCreationTimeInterval:");
  objc_msgSend(v25, "setService:", v21);
  objc_msgSend(v25, "setPriority:", a7);
  objc_msgSend(v25, "setDuration:", a8);
  objc_msgSend(v25, "setText:", v17);
  objc_msgSend(v25, "setSubtitleText:", v18);
  objc_msgSend(v25, "setIconImage:", v19);
  objc_msgSend(v25, "setType:", a6);
  objc_msgSend(v25, "setUserInfo:", v20);
  -[AXUIDisplayManager _transactionIdentifierForDisplayingAlertWithContext:service:](self, "_transactionIdentifierForDisplayingAlertWithContext:service:", v25, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager serviceManager](self, "serviceManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "beginTransactionWithIdentifier:forService:", v26, v21);

  v28 = v25;
  AXPerformBlockAsynchronouslyOnMainThread();

LABEL_10:
  return v24;
}

uint64_t __106__AXUIDisplayManager_showAlertWithText_subtitleText_iconImage_type_priority_duration_userInfo_forService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showOrEnqueueAlertWithContext:", *(_QWORD *)(a1 + 40));
}

- (void)hideAlertWithIdentifier:(id)a3 forService:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  AXUIDisplayManager *v13;

  v10 = a3;
  -[AXUIDisplayManager visibleAlertContexts](self, "visibleAlertContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "showOrHideTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

    objc_msgSend(v7, "setShowOrHideTimer:", 0);
    -[AXUIDisplayManager _hideAlertWithContext:notifyDelegate:](self, "_hideAlertWithContext:notifyDelegate:", v7, 0);
  }
  else
  {
    -[AXUIDisplayManager alertQueues](self, "alertQueues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__AXUIDisplayManager_hideAlertWithIdentifier_forService___block_invoke;
    v11[3] = &unk_24D49CA98;
    v12 = v10;
    v13 = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
}

void __57__AXUIDisplayManager_hideAlertWithIdentifier_forService___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__AXUIDisplayManager_hideAlertWithIdentifier_forService___block_invoke_2;
  v10[3] = &unk_24D49CA70;
  v11 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v9, "indexOfObjectPassingTest:", v10);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    objc_msgSend(v9, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", v7);
    objc_msgSend(*(id *)(a1 + 40), "_didHideOrDequeueAlertWithContext:", v8);
    *a4 = 1;

  }
}

uint64_t __57__AXUIDisplayManager_hideAlertWithIdentifier_forService___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)registerNubbit:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AXUINubbitContext *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIDisplayManager setNubbitContexts:](self, "setNubbitContexts:", v8);

  }
  -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(AXUINubbitContext);
    -[AXUINubbitContext setNubbit:](v12, "setNubbit:", v18);
    -[AXUINubbitContext setDelegate:](v12, "setDelegate:", v6);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel__handleMoveNubbitGestureRecognizer_);
    objc_msgSend(v18, "addGestureRecognizer:", v13);
    -[AXUINubbitContext setMoveNubbitGestureRecognizer:](v12, "setMoveNubbitGestureRecognizer:", v13);
    v14 = objc_alloc(MEMORY[0x24BDFE490]);
    v15 = (void *)objc_msgSend(v14, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    objc_msgSend(v15, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[AXUINubbitContext setFadeTimer:](v12, "setFadeTimer:", v15);
    objc_msgSend(v18, "alpha");
    -[AXUINubbitContext setOriginalAlpha:](v12, "setOriginalAlpha:");
    -[AXUIDisplayManager _scheduleFadeForNubbitContext:](self, "_scheduleFadeForNubbitContext:", v12);
    -[AXUIDisplayManager _addDynamicAnimationsForNubbitContext:](self, "_addDynamicAnimationsForNubbitContext:", v12);
    -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, v17);

  }
}

- (void)unregisterNubbit:(id)a3
{
  -[AXUIDisplayManager unregisterNubbit:shouldUndoFade:](self, "unregisterNubbit:shouldUndoFade:", a3, 1);
}

- (void)unregisterNubbit:(id)a3 shouldUndoFade:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = a4;
  v14 = a3;
  -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "moveNubbitGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v14, "removeGestureRecognizer:", v9);
    if (v4)
      -[AXUIDisplayManager _undoFadeForNubbitContext:](self, "_undoFadeForNubbitContext:", v8);
    -[AXUIDisplayManager _removeDynamicAnimationsForNubbitContext:](self, "_removeDynamicAnimationsForNubbitContext:", v8);
    objc_msgSend(v8, "fadeTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancel");

    -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v6);

    -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      -[AXUIDisplayManager setNubbitContexts:](self, "setNubbitContexts:", 0);

  }
}

- (BOOL)allWindowsHidden
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__AXUIDisplayManager_allWindowsHidden__block_invoke;
  v4[3] = &unk_24D49CAC0;
  v4[4] = &v5;
  -[AXUIDisplayManager _enumerateWindowsUsingBlock:](self, "_enumerateWindowsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__AXUIDisplayManager_allWindowsHidden__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v7;
  char v8;

  result = objc_msgSend(a3, "isHidden");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = result;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

- (void)_enumerateWindowsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager activeWindows](self, "activeWindows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  -[AXUIDisplayManager passiveWindows](self, "passiveWindows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    v13 = MEMORY[0x24BDAC760];
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __50__AXUIDisplayManager__enumerateWindowsUsingBlock___block_invoke;
      v16[3] = &unk_24D49CAE8;
      v17 = v4;
      v18 = &v23;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v16);
      LOBYTE(v15) = *((_BYTE *)v24 + 24) == 0;

      if ((v15 & 1) == 0)
        break;
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v23, 8);
}

uint64_t __50__AXUIDisplayManager__enumerateWindowsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (id)_windowWithUserInteractionEnabled:(BOOL)a3 windowLevel:(double)a4 createIfNeeded:(BOOL)a5 purposeIdentifier:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;

  v6 = a5;
  v8 = a3;
  v10 = a6;
  -[AXUIDisplayManager windowSceneForSceneClientIdentifier:external:](self, "windowSceneForSceneClientIdentifier:external:", 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _windowWithUserInteractionEnabled:windowLevel:createIfNeeded:purposeIdentifier:userInterfaceStyle:windowScene:savedWindowScene:](self, "_windowWithUserInteractionEnabled:windowLevel:createIfNeeded:purposeIdentifier:userInterfaceStyle:windowScene:savedWindowScene:", v8, v6, v10, 0, 0, v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_windowWithUserInteractionEnabled:(BOOL)a3 windowLevel:(double)a4 createIfNeeded:(BOOL)a5 purposeIdentifier:(id)a6 userInterfaceStyle:(int64_t)a7 windowScene:(id)a8 savedWindowScene:(id)a9
{
  _BOOL4 v12;
  _BOOL4 v14;
  id v16;
  id v17;
  char **v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  NSObject *v31;
  const char *v32;
  id v33;
  void *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v12 = a5;
  v14 = a3;
  v59 = *MEMORY[0x24BDAC8D0];
  v52 = a6;
  v16 = a8;
  v17 = a9;
  v18 = &selRef_activeWindows;
  v19 = round(a4);
  if (!v14)
    v18 = &selRef_passiveWindows;
  NSStringFromSelector(*v18);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f-%ld"), *(_QWORD *)&v19, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v20;
  -[AXUIDisplayManager valueForKey:](self, "valueForKey:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_sceneIdentifier");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    objc_msgSend(v17, "_sceneIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
      v23 = (__CFString *)v24;
    else
      v23 = CFSTR("MAIN-DISPLAY");
  }
  v54 = v17;
  objc_msgSend(v22, "objectForKey:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    v27 = 1;
  else
    v27 = !v12;
  if (v27)
  {
    v28 = v52;
    goto LABEL_35;
  }
  v29 = objc_opt_class();
  v30 = (objc_class *)objc_opt_class();
  if (v14)
    v30 = (objc_class *)v29;
  if (v16)
  {
    v26 = (void *)objc_msgSend([v30 alloc], "initWithWindowScene:", v16);
    AXLogUI();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v56 = v16;
      v57 = 2112;
      v58 = v26;
      v32 = "Made window with external scene: %@ %@";
LABEL_21:
      v35 = v31;
      v36 = 22;
LABEL_22:
      _os_log_impl(&dword_215E2A000, v35, OS_LOG_TYPE_INFO, v32, buf, v36);
    }
  }
  else
  {
    v33 = [v30 alloc];
    v34 = v33;
    if (!v54)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v34, "initWithScreen:", v51);

      AXLogUI();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      *(_DWORD *)buf = 138412290;
      v56 = v26;
      v32 = "Made window for main screen %@";
      v35 = v31;
      v36 = 12;
      goto LABEL_22;
    }
    v26 = (void *)objc_msgSend(v33, "initWithWindowScene:", v54);
    AXLogUI();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v56 = v54;
      v57 = 2112;
      v58 = v26;
      v32 = "Made window with main scene: %@ %@";
      goto LABEL_21;
    }
  }
LABEL_23:

  objc_msgSend(v26, "setWindowLevel:", v19);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v37);

  if (a7)
  {
    objc_msgSend(v26, "setOverrideUserInterfaceStyle:", a7);
  }
  else
  {
    if (objc_msgSend(MEMORY[0x24BE006E8], "isAvailable"))
    {
      objc_msgSend(MEMORY[0x24BE006E8], "server");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isDarkModeActive");

      if (v39)
      {
        if (-[AXUIDisplayManager userInterfaceStyle](self, "userInterfaceStyle") != 2)
          -[AXUIDisplayManager setUserInterfaceStyle:](self, "setUserInterfaceStyle:", 2);
      }
    }
    objc_msgSend(v26, "setOverrideUserInterfaceStyle:", -[AXUIDisplayManager userInterfaceStyle](self, "userInterfaceStyle"));
    objc_msgSend(v26, "setShouldRespondToDarkModeChanges:", 1);
  }
  v28 = v52;
  objc_msgSend(v26, "_setWindowControlsStatusBarOrientation:", 0);
  v40 = (void *)objc_opt_new();
  objc_msgSend(v26, "setRootViewController:", v40);
  objc_msgSend(v26, "setHidden:", 0);
  objc_msgSend(v26, "setHidden:", 1);
  if (!v22)
  {
    v22 = (void *)objc_opt_new();
    -[AXUIDisplayManager setValue:forKey:](self, "setValue:forKey:", v22, v53);
  }
  objc_msgSend(v22, "objectForKey:", v23);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v41, "setObject:forKey:", v26, v21);
  objc_msgSend(v22, "setObject:forKey:", v41, v23);

LABEL_35:
  objc_msgSend(v26, "accessibilityIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (!v42 || objc_msgSend(v42, "rangeOfString:", v28) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v26, "accessibilityIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (v45)
    {
      v46 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v26, "accessibilityIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("%@|%@"), v47, v28);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAccessibilityIdentifier:", v48);

    }
    else
    {
      objc_msgSend(v26, "setAccessibilityIdentifier:", v28);
    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "postNotificationName:object:", CFSTR("AXUIServerModifiedWindowInterfaceStyle"), self);

  return v26;
}

- (double)_originalDurationForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 withAdjustedDuration:(double)result
{
  if (a3 != a4 && (unint64_t)(a3 - 1) < 2 == (unint64_t)(a4 - 1) < 2)
    return result * 0.5;
  return result;
}

- (void)enumerateContentViewControllersUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v45 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[AXUIDisplayManager activeContentViewControllers](self, "activeContentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[AXUIDisplayManager activeContentViewControllers](self, "activeContentViewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v38;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v38 != v16)
                objc_enumerationMutation(v13);
              v4[2](v4, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j), &v45);
              if (v45)
              {
LABEL_32:

                goto LABEL_33;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
            if (v15)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[AXUIDisplayManager passiveContentViewControllers](self, "passiveContentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    while (2)
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v5);
        v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
        -[AXUIDisplayManager passiveContentViewControllers](self, "passiveContentViewControllers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v13 = v24;
        v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v30;
LABEL_23:
          v28 = 0;
          while (1)
          {
            if (*(_QWORD *)v30 != v27)
              objc_enumerationMutation(v13);
            v4[2](v4, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v28), &v45);
            if (v45)
              goto LABEL_32;
            if (v26 == ++v28)
            {
              v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
              if (v26)
                goto LABEL_23;
              break;
            }
          }
        }

      }
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_33:

}

- (void)_windowSceneConnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  NSObject *v14;
  int v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  AXLogUI();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v15 = 134218242;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_215E2A000, v8, OS_LOG_TYPE_INFO, "New window scene connected: %p for scene client: %@. Adding queued content view controllers", (uint8_t *)&v15, 0x16u);
  }

  -[AXUIDisplayManager saveWindowScene:forSceneClientIdentifier:external:](self, "saveWindowScene:forSceneClientIdentifier:external:", v6, v7, 0);
  v9 = CFSTR("AXUIServerDefaultSceneClientIdentifier");
  if (v7)
    v9 = v7;
  v10 = v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_addContentViewControllerBlocks, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_309);
  -[NSMutableDictionary removeObjectForKey:](self->_addContentViewControllerBlocks, "removeObjectForKey:", v10);
  -[AXUIDisplayManager sceneClients](self, "sceneClients");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "objectForKeyedSubscript:", v10);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v12) = objc_opt_respondsToSelector();
  if ((v12 & 1) != 0)
  {
    AXLogUI();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_215E2A000, v14, OS_LOG_TYPE_INFO, "Main display scene connected for Service: %@. windowScene: %@", (uint8_t *)&v15, 0x16u);
    }

    -[__CFString mainDisplaySceneConnected:](v13, "mainDisplaySceneConnected:", v6);
  }

}

uint64_t __69__AXUIDisplayManager__windowSceneConnected_forSceneClientIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

- (void)_windowSceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogUI();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 134218242;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_215E2A000, v8, OS_LOG_TYPE_INFO, "Window scene disconnected: %p, for scene client:%@", (uint8_t *)&v10, 0x16u);
  }

  -[AXUIDisplayManager removeWindowSceneForSceneClientIdentifier:external:](self, "removeWindowSceneForSceneClientIdentifier:external:", v7, 0);
  objc_msgSend(v6, "_sceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _cleanupWindowsFromSceneDisconnection:](self, "_cleanupWindowsFromSceneDisconnection:", v9);

}

- (void)_externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BDFFA98], "usesScenes"))
  {
    AXLogUI();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_215E2A000, v8, OS_LOG_TYPE_INFO, "New external window scene connected: %p for scene client: %@. Notifying services.", buf, 0x16u);
    }

    -[AXUIDisplayManager saveWindowScene:forSceneClientIdentifier:external:](self, "saveWindowScene:forSceneClientIdentifier:external:", v6, v7, 1);
    v9 = v7;
    v10 = v6;
    AXPerformBlockOnMainThread();

  }
}

void __78__AXUIDisplayManager__externalDisplaySceneConnected_forSceneClientIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "sceneClients");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      AXLogUI();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v19 = v3;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_215E2A000, v4, OS_LOG_TYPE_INFO, "External display scene connected for Service: %@, sceneClientIdentifier: %@", buf, 0x16u);
      }

      objc_msgSend(v3, "externalDisplaySceneConnected:forSceneClientIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "serviceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_services");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            AXLogUI();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v11;
              _os_log_impl(&dword_215E2A000, v12, OS_LOG_TYPE_INFO, "External display scene connected for Service: %@", buf, 0xCu);
            }

            objc_msgSend(v11, "externalDisplaySceneConnected:", *(_QWORD *)(a1 + 48));
          }
        }
        v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }

}

- (void)_externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BDFFA98], "usesScenes"))
  {
    AXLogUI();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_215E2A000, v8, OS_LOG_TYPE_INFO, "Disconnecting external scene: %@", buf, 0xCu);
    }

    -[AXUIDisplayManager removeWindowSceneForSceneClientIdentifier:external:](self, "removeWindowSceneForSceneClientIdentifier:external:", v7, 1);
    objc_msgSend(v6, "_sceneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIDisplayManager _cleanupWindowsFromSceneDisconnection:](self, "_cleanupWindowsFromSceneDisconnection:", v9);

    v10 = v7;
    v11 = v6;
    AXPerformBlockOnMainThread();

  }
}

void __81__AXUIDisplayManager__externalDisplaySceneDisconnected_forSceneClientIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "sceneClients");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      AXLogUI();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v19 = v3;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_215E2A000, v4, OS_LOG_TYPE_INFO, "External display scene disconnected for Service: %@, sceneClientIdentifier: %@", buf, 0x16u);
      }

      objc_msgSend(v3, "externalDisplaySceneDisconnected:forSceneClientIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "serviceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_services");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            AXLogUI();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v11;
              _os_log_impl(&dword_215E2A000, v12, OS_LOG_TYPE_INFO, "External display scene disconnected for Service: %@", buf, 0xCu);
            }

            objc_msgSend(v11, "externalDisplaySceneDisconnected:", *(_QWORD *)(a1 + 48));
          }
        }
        v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }

}

- (void)_cleanupWindowsFromSceneDisconnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activeWindows, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v7);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_passiveWindows, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v9);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        -[AXUIDisplayManager windowHostingController](self, "windowHostingController", (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "unregisterWindowWithContextID:", objc_msgSend(v15, "_contextId"));

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeWindows, "setObject:forKeyedSubscript:", 0, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_passiveWindows, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)saveWindowScene:(id)a3 forSceneClientIdentifier:(id)a4 external:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  id v11;

  v6 = 144;
  if (a5)
    v6 = 152;
  v7 = *(Class *)((char *)&self->super.isa + v6);
  v8 = CFSTR("AXUIServerDefaultSceneClientIdentifier");
  if (a4)
    v8 = (__CFString *)a4;
  v9 = v8;
  v10 = v7;
  v11 = a3;
  objc_msgSend(v10, "setObject:forKey:", v11, v9);

}

- (BOOL)destroyWindowSceneIfNeeded:(id)a3 discardableWindow:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_16;
  AXLogUI();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "windows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v29 = v5;
    v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_INFO, "checking scene: %p, windows: %@", buf, 0x16u);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "windows", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v15 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 += (v15 != v6) & ~objc_msgSend(v15, "isHidden");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);

    if (v12)
      goto LABEL_16;
  }
  else
  {

  }
  +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) == 0)
  {
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "destroyScene:", v5);

LABEL_17:
  return v21;
}

- (void)removeWindowSceneForSceneClientIdentifier:(id)a3 external:(BOOL)a4
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;

  v4 = 144;
  if (a4)
    v4 = 152;
  v5 = *(Class *)((char *)&self->super.isa + v4);
  v6 = CFSTR("AXUIServerDefaultSceneClientIdentifier");
  if (a3)
    v6 = (__CFString *)a3;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v8, "removeObjectForKey:", v7);

}

- (id)windowSceneForSceneClientIdentifier:(id)a3 external:(BOOL)a4
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;

  v4 = 144;
  if (a4)
    v4 = 152;
  v5 = *(Class *)((char *)&self->super.isa + v4);
  v6 = CFSTR("AXUIServerDefaultSceneClientIdentifier");
  if (a3)
    v6 = (__CFString *)a3;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)saveAddContentViewControllerBlock:(id)a3 forObjectKey:(id)a4 forSceneClientIdentifier:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v11 = v10;
  if (v8 && v9)
  {
    v12 = CFSTR("AXUIServerDefaultSceneClientIdentifier");
    if (v10)
      v12 = v10;
    v13 = v12;

    -[NSMutableDictionary objectForKeyedSubscript:](self->_addContentViewControllerBlocks, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      v14 = (void *)objc_opt_new();
    v15 = (void *)MEMORY[0x2199F2788](v8);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, v16);

    AXLogUI();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_215E2A000, v17, OS_LOG_TYPE_DEFAULT, "Save block for objectKey: %@", buf, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_addContentViewControllerBlocks, "setObject:forKeyedSubscript:", v14, v13);
  }
  else
  {
    v13 = v10;
  }

}

- (void)removeAddContentViewControllerBlockForObjectKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *addContentViewControllerBlocks;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    addContentViewControllerBlocks = self->_addContentViewControllerBlocks;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__AXUIDisplayManager_removeAddContentViewControllerBlockForObjectKey___block_invoke;
    v10[3] = &unk_24D49CB78;
    v7 = v5;
    v11 = v7;
    v12 = &v13;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](addContentViewControllerBlocks, "enumerateKeysAndObjectsUsingBlock:", v10);
    if (v14[5])
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_addContentViewControllerBlocks, "objectForKeyedSubscript:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v7);
      AXLogUI();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_215E2A000, v9, OS_LOG_TYPE_DEFAULT, "Remove block for objectKey: %@", buf, 0xCu);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_addContentViewControllerBlocks, "setObject:forKeyedSubscript:", v8, v14[5]);
    }

    _Block_object_dispose(&v13, 8);
  }

}

void __70__AXUIDisplayManager_removeAddContentViewControllerBlockForObjectKey___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)sceneRequestedForSceneClientIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v4 = CFSTR("AXUIServerDefaultSceneClientIdentifier");
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_addContentViewControllerBlocks, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "count") != 0;
  return (char)v5;
}

- (double)desiredWindowLevelForService:(id)a3 forContentViewController:(id)a4 userInteractionEnabled:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_254E24950))
  {
    v9 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "desiredWindowLevelForContentViewController:userInteractionEnabled:", v8, v5);
      v11 = v10;
    }
    else
    {
      v11 = 10000002.0;
    }

  }
  else
  {
    v11 = 10000002.0;
  }

  return v11;
}

- (void)serviceDidConnect:(id)a3 clientWithIdentifier:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDFFA98], "usesScenes"))
  {
    v5 = v4;
    AXPerformBlockOnMainThread();

  }
}

void __61__AXUIDisplayManager_serviceDidConnect_clientWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "windowSceneForSceneClientIdentifier:external:", 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    AXLogUI();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215E2A000, v3, OS_LOG_TYPE_INFO, "External display scene connected for Service: %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "externalDisplaySceneConnected:", v2);
  }

}

- (id)_contentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char **v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  void *v19;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x2199F262C]();
  -[AXUIDisplayManager serviceManager](self, "serviceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_uniqueIdentifierForService:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v12 = &selRef_activeContentViewControllers;
  if (!v6)
    v12 = &selRef_passiveContentViewControllers;
  NSStringFromSelector(*v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager valueForKey:](self, "valueForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = 1;
  else
    v15 = !v5;
  if (!v15)
  {
    v14 = (void *)objc_opt_new();
    -[AXUIDisplayManager setValue:forKey:](self, "setValue:forKey:", v14, v13);
  }
  objc_msgSend(v14, "objectForKey:", v11);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = 1;
  else
    v17 = v11 == 0;
  v18 = v17 || !v5;
  if (v17)
    v19 = (void *)v16;
  else
    v19 = 0;
  if ((v18 & 1) == 0)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v14, "setObject:forKey:", v19, v11);
  }

  return v19;
}

- (void)_disposeOfContentViewControllersWithUserInteractionEnabled:(BOOL)a3 forService:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  char **v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = a4;
  v6 = (void *)MEMORY[0x2199F262C]();
  -[AXUIDisplayManager serviceManager](self, "serviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_uniqueIdentifierForService:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  v9 = &selRef_activeContentViewControllers;
  if (!v4)
    v9 = &selRef_passiveContentViewControllers;
  NSStringFromSelector(*v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager valueForKey:](self, "valueForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    objc_msgSend(v11, "removeObjectForKey:", v8);
  if (!objc_msgSend(v12, "count"))
    -[AXUIDisplayManager setValue:forKey:](self, "setValue:forKey:", 0, v10);

}

- (void)_addContentViewController:(id)a3 toWindow:(id)a4 forService:(id)a5 context:(void *)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend(v13, "rootViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v12)
  {
    -[AXUIDisplayManager _transactionIdentifierForDisplayingContentViewController:service:](self, "_transactionIdentifierForDisplayingContentViewController:service:", v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIDisplayManager serviceManager](self, "serviceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "beginTransactionWithIdentifier:forService:", v18, v14);

    objc_msgSend(v17, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperview");
    objc_msgSend(v20, "bounds");
    objc_msgSend(v21, "setFrame:");
    objc_msgSend(v21, "setAutoresizingMask:", 18);
    objc_msgSend(v17, "addChildViewController:", v12);
    objc_msgSend(v20, "addSubview:", v21);
    objc_msgSend(v12, "didMoveToParentViewController:", v17);
    if (objc_msgSend(v12, "conformsToProtocol:", &unk_254E24890)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __87__AXUIDisplayManager__addContentViewController_toWindow_forService_context_completion___block_invoke;
      v27[3] = &unk_24D49CBA0;
      v28 = v15;
      objc_msgSend(v12, "transitionInWithContext:completion:", a6, v27);

      v22 = 0;
    }
    else
    {
      v22 = 1;
    }

    if (!v15)
      goto LABEL_15;
LABEL_13:
    if (v22)
      (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
    goto LABEL_15;
  }
  objc_msgSend(v16, "childViewControllers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  if (v24 || (objc_msgSend(v17, "isViewLoaded") & 1) == 0)
  {
    objc_msgSend(v13, "setHidden:", v24 == 0);
  }
  else
  {
    objc_msgSend(v17, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "subviews");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", objc_msgSend(v26, "count") == 0);

  }
  -[AXUIDisplayManager _reapHiddenWindows](self, "_reapHiddenWindows");
  v22 = 1;
  if (v15)
    goto LABEL_13;
LABEL_15:

}

uint64_t __87__AXUIDisplayManager__addContentViewController_toWindow_forService_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_removeContentViewController:(id)a3 forService:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    AXLogUI();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      objc_msgSend(v8, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "windowScene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v12;
      v22 = 2112;
      v23 = v9;
      v24 = 2048;
      v25 = v15;
      _os_log_impl(&dword_215E2A000, v11, OS_LOG_TYPE_DEFAULT, "remove contentViewController: %@, service: %@ scene: %p", buf, 0x20u);

    }
    v18 = v8;
    v19 = v10;
    AXPerformBlockAsynchronouslyOnMainThread();
    -[AXUIDisplayManager _transactionIdentifierForDisplayingContentViewController:service:](self, "_transactionIdentifierForDisplayingContentViewController:service:", v18, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIDisplayManager serviceManager](self, "serviceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endTransactionWithIdentifier:forService:", v16, v9);

  }
}

uint64_t __73__AXUIDisplayManager__removeContentViewController_forService_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
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
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t result;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v2, "childViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == *(void **)(a1 + 32))
    {
      objc_msgSend(v2, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subviews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v2, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "subviews");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 1)
        {
          objc_msgSend(v2, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "subviews");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "firstObject");
          v27 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v11 == v12;

          v9 = v27;
        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 1;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(v2, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 40);
  objc_msgSend(v14, "windowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v17 = v14;
  else
    v17 = 0;
  v18 = objc_msgSend(v15, "destroyWindowSceneIfNeeded:discardableWindow:", v16, v17);

  if ((v18 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
    if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
    {
      objc_msgSend(*(id *)(a1 + 32), "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeFromSuperview");

    }
    objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
    objc_msgSend(v2, "childViewControllers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v14, "setHidden:", 0);
    }
    else
    {
      objc_msgSend(v2, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "subviews");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", objc_msgSend(v22, "count") == 0);

    }
    objc_msgSend(*(id *)(a1 + 40), "_reapHiddenWindows");
  }

  +[AXUIAssertionManager sharedInstance](AXUIAssertionManager, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "invalidateAssertionUIIfNeeded");

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (id)_transactionIdentifierForDisplayingContentViewController:(id)a3 service:(id)a4
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_hasVisibleAlertWithType:(unint64_t)a3
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[AXUIDisplayManager visibleAlertContexts](self, "visibleAlertContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__AXUIDisplayManager__hasVisibleAlertWithType___block_invoke;
  v6[3] = &unk_24D49CBF0;
  v6[4] = &v7;
  v6[5] = a3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  LOBYTE(a3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __47__AXUIDisplayManager__hasVisibleAlertWithType___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "type");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_showAlertWithContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  _BOOL4 IsVoiceOverRunning;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[5];
  id v59;
  uint8_t v60[16];
  _QWORD v61[4];
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[AXUIDisplayManager _platformShouldUseScenes](self, "_platformShouldUseScenes");
  -[AXUIDisplayManager windowSceneForSceneClientIdentifier:external:](self, "windowSceneForSceneClientIdentifier:external:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogUI();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v67 = v6;
    v68 = 2112;
    v69 = v4;
    _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_INFO, "showAlert savedWindowScene:%p, context:%@", buf, 0x16u);
  }

  if (v6)
    v8 = 0;
  else
    v8 = v5;
  if (v8)
  {
    objc_initWeak((id *)buf, self);
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __44__AXUIDisplayManager__showAlertWithContext___block_invoke;
    v61[3] = &unk_24D49CC18;
    objc_copyWeak(&v63, (id *)buf);
    v9 = v4;
    v62 = v9;
    v10 = (void *)MEMORY[0x2199F2788](v61);
    v11 = -[AXUIDisplayManager sceneRequestedForSceneClientIdentifier:](self, "sceneRequestedForSceneClientIdentifier:", 0);
    -[AXUIDisplayManager saveAddContentViewControllerBlock:forObjectKey:forSceneClientIdentifier:](self, "saveAddContentViewControllerBlock:forObjectKey:forSceneClientIdentifier:", v10, v9, 0);
    AXLogUI();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v60 = 0;
      _os_log_impl(&dword_215E2A000, v12, OS_LOG_TYPE_DEFAULT, "Need to request scene, queue alert request", v60, 2u);
    }

    if (!v11)
    {
      +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "requestSceneForSceneClientIdentifier:scenePreferredLevel:spatialConfiguration:", 0, 0, 0.0);

      }
    }

    objc_destroyWeak(&v63);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(v4, "service");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v49, "conformsToProtocol:", &unk_254E249B0);
    v19 = v49;
    if (!v18)
      v19 = 0;
    v52 = v19;
    objc_msgSend(v4, "identifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v52, "styleProviderForAlertWithIdentifier:", v50),
          (v51 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[AXUIDisplayManager defaultAlertStyleProvider](self, "defaultAlertStyleProvider");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v4, "type");
    objc_msgSend(v4, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitleText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXUIAlert alertWithType:text:subtitleText:iconImage:styleProvider:userInfo:](AXUIAlert, "alertWithType:text:subtitleText:iconImage:styleProvider:userInfo:", v20, v21, v22, v23, v51, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setContext:", v4);
    objc_msgSend(v25, "setAlpha:", 0.0);
    if (v25)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v52, "desiredWindowLevelForAlertWithIdentifier:", v50);
      else
        v26 = 10000002.0;
      -[AXUIDisplayManager _windowWithUserInteractionEnabled:windowLevel:createIfNeeded:purposeIdentifier:userInterfaceStyle:windowScene:savedWindowScene:](self, "_windowWithUserInteractionEnabled:windowLevel:createIfNeeded:purposeIdentifier:userInterfaceStyle:windowScene:savedWindowScene:", v20 == 3, 1, CFSTR("AXUIAlert"), 0, 0, v6, v26);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setHidden:", 0);
      objc_msgSend(v48, "rootViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addToContainerView:", v28);

      objc_msgSend(v4, "setAlertView:", v25);
      objc_msgSend(v51, "alertFadeAnimationDurationForType:", v20);
      v30 = v29;
      objc_msgSend(v4, "setFadeAnimationDuration:");
      objc_msgSend(v4, "duration");
      v32 = v31;
      v33 = MEMORY[0x24BDAC760];
      if (v31 < 1.79769313e308)
      {
        objc_msgSend(v4, "showOrHideTimer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "cancel");

        v35 = objc_alloc(MEMORY[0x24BDFE490]);
        v36 = (void *)objc_msgSend(v35, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
        v58[0] = v33;
        v58[1] = 3221225472;
        v58[2] = __44__AXUIDisplayManager__showAlertWithContext___block_invoke_361;
        v58[3] = &unk_24D49CA48;
        v58[4] = self;
        v37 = v4;
        v59 = v37;
        objc_msgSend(v36, "afterDelay:processBlock:", v58, v30 + v32);
        objc_msgSend(v37, "setShowOrHideTimer:", v36);

      }
      -[AXUIDisplayManager visibleAlertContexts](self, "visibleAlertContexts");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        v38 = (void *)objc_opt_new();
        -[AXUIDisplayManager setVisibleAlertContexts:](self, "setVisibleAlertContexts:", v38);
      }
      objc_msgSend(v38, "setObject:forKey:", v4, v50);
      IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
      if (v20 != 4 && IsVoiceOverRunning)
      {
        v41 = objc_alloc(MEMORY[0x24BDD1458]);
        objc_msgSend(v4, "text");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "subtitleText");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        __AXStringForVariables();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = *MEMORY[0x24BDFEAD8];
        v65 = &unk_24D4A1F40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1, v43, CFSTR("__AXStringForVariablesSentinel"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v41, "initWithString:attributes:", v44, v45);

        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v46);
      }
      v47 = (void *)MEMORY[0x24BDF6F90];
      v56[0] = v33;
      v56[1] = 3221225472;
      v56[2] = __44__AXUIDisplayManager__showAlertWithContext___block_invoke_368;
      v56[3] = &unk_24D49C910;
      v57 = v25;
      v53[0] = v33;
      v53[1] = 3221225472;
      v53[2] = __44__AXUIDisplayManager__showAlertWithContext___block_invoke_2;
      v53[3] = &unk_24D49CC40;
      v54 = v52;
      v55 = v50;
      objc_msgSend(v47, "animateWithDuration:animations:completion:", v56, v53, v30);

    }
  }

}

void __44__AXUIDisplayManager__showAlertWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showAlertWithContext:", *(_QWORD *)(a1 + 32));

}

uint64_t __44__AXUIDisplayManager__showAlertWithContext___block_invoke_361(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_hideAlertWithContext:notifyDelegate:", *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 40), "setShowOrHideTimer:", 0);
}

uint64_t __44__AXUIDisplayManager__showAlertWithContext___block_invoke_368(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __44__AXUIDisplayManager__showAlertWithContext___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(v2 + 32), "alertWithIdentifierDidAppear:", *(_QWORD *)(v2 + 40));
  }
  return result;
}

- (void)_hideAlertWithContext:(id)a3 notifyDelegate:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  AXUIDisplayManager *v17;
  id v18;
  BOOL v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v6 = a3;
  -[AXUIDisplayManager removeAddContentViewControllerBlockForObjectKey:](self, "removeAddContentViewControllerBlockForObjectKey:", v6);
  -[AXUIDisplayManager visibleAlertContexts](self, "visibleAlertContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  if (!objc_msgSend(v7, "count"))
    -[AXUIDisplayManager setVisibleAlertContexts:](self, "setVisibleAlertContexts:", 0);
  objc_msgSend(v6, "alertView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alpha");
  if (v10 <= 2.22044605e-16)
  {
    -[AXUIDisplayManager _didHideOrDequeueAlertWithContext:](self, "_didHideOrDequeueAlertWithContext:", v6);
    -[AXUIDisplayManager _handleNextAlertForType:](self, "_handleNextAlertForType:", objc_msgSend(v6, "type"));
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(v6, "fadeAnimationDuration");
    v13 = v12;
    v14 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __59__AXUIDisplayManager__hideAlertWithContext_notifyDelegate___block_invoke;
    v20[3] = &unk_24D49CA48;
    v21 = v6;
    v22 = v9;
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __59__AXUIDisplayManager__hideAlertWithContext_notifyDelegate___block_invoke_2;
    v15[3] = &unk_24D49CC68;
    v16 = v22;
    v17 = self;
    v19 = a4;
    v18 = v21;
    objc_msgSend(v11, "animateWithDuration:animations:completion:", v20, v15, v13);

  }
}

uint64_t __59__AXUIDisplayManager__hideAlertWithContext_notifyDelegate___block_invoke(uint64_t a1)
{
  CGRect v3;

  if (objc_msgSend(*(id *)(a1 + 32), "type") == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "frame");
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", v3.origin.x, -CGRectGetHeight(v3), v3.size.width, v3.size.height);
  }
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __59__AXUIDisplayManager__hideAlertWithContext_notifyDelegate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(v2, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 || (objc_msgSend(v2, "isViewLoaded") & 1) == 0)
  {
    objc_msgSend(v14, "setHidden:", v4 == 0);
  }
  else
  {
    objc_msgSend(v2, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", objc_msgSend(v6, "count") == 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "_reapHiddenWindows");
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_254E249B0))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alertWithIdentifierDidDisappear:", v10);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_didHideOrDequeueAlertWithContext:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_handleNextAlertForType:", objc_msgSend(*(id *)(a1 + 48), "type"));
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v14, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destroyWindowSceneIfNeeded:discardableWindow:", v12, 0);

  +[AXUIAssertionManager sharedInstance](AXUIAssertionManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidateAssertionUIIfNeeded");

}

- (void)_showOrEnqueueAlertWithContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[AXUIDisplayManager _hasVisibleAlertWithType:](self, "_hasVisibleAlertWithType:", objc_msgSend(v12, "type")))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIDisplayManager alertQueues](self, "alertQueues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
    }
    else
    {
      v7 = (void *)objc_opt_new();
      if (!v5)
      {
        v5 = (void *)objc_opt_new();
        -[AXUIDisplayManager setAlertQueues:](self, "setAlertQueues:", v5);
      }
      objc_msgSend(v5, "setObject:forKey:", v7, v4);
    }
    objc_msgSend(v7, "ax_enqueueObject:", v12);
    objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_372);
    objc_msgSend(v12, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_254E249B0))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alertWithIdentifierWasEnqueued:", v11);

    }
  }
  else
  {
    -[AXUIDisplayManager _showAlertWithContext:](self, "_showAlertWithContext:", v12);
  }

}

uint64_t __53__AXUIDisplayManager__showOrEnqueueAlertWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "priority");
  v9 = objc_msgSend(v7, "priority");
  v10 = v8 == v9;
  if (v8 < v9)
    v11 = -1;
  else
    v11 = 1;
  if (v10)
  {
    objc_msgSend(v7, "creationTimeInterval");
    v13 = v12;
    objc_msgSend(v6, "creationTimeInterval");
    v11 = v13 >= v14 ? 1 : -1;
    if (v13 == v14)
    {
      objc_msgSend(v7, "duration");
      v16 = v15;
      objc_msgSend(v6, "duration");
      v18 = -1;
      if (v16 >= v17)
        v18 = 1;
      if (v16 == v17)
        v11 = 0;
      else
        v11 = v18;
    }
  }

  return v11;
}

- (void)_handleNextAlertForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  _QWORD v16[6];
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager alertQueues](self, "alertQueues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__AXUIDisplayManager__handleNextAlertForType___block_invoke;
  v17[3] = &unk_24D49CCD0;
  v17[4] = &v26;
  v17[5] = &v22;
  v17[6] = &v18;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v17);
  if (v19[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "removeObjectAtIndex:");
    if (!objc_msgSend(v6, "count"))
    {
      objc_msgSend(v5, "removeObjectForKey:", v4);
      if (!objc_msgSend(v5, "count"))
        -[AXUIDisplayManager setAlertQueues:](self, "setAlertQueues:", 0);
    }
    -[AXUIDisplayManager visibleAlertContexts](self, "visibleAlertContexts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (void *)objc_opt_new();
      -[AXUIDisplayManager setVisibleAlertContexts:](self, "setVisibleAlertContexts:", v8);
    }
    v9 = (void *)v27[5];
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

    v11 = objc_alloc(MEMORY[0x24BDFE490]);
    v12 = MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC9B8];
    v14 = (void *)objc_msgSend(v11, "initWithTargetSerialQueue:", v12);

    v15 = v23[3];
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __46__AXUIDisplayManager__handleNextAlertForType___block_invoke_2;
    v16[3] = &unk_24D49CCF8;
    v16[4] = self;
    v16[5] = &v26;
    objc_msgSend(v14, "afterDelay:processBlock:", v16, v15);
    objc_msgSend((id)v27[5], "setShowOrHideTimer:", v14);

  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

}

void __46__AXUIDisplayManager__handleNextAlertForType___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_254E249B0))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;
  v11 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v18, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delayForDequeuingAlertWithIdentifier:", v12);
    v11 = v13;

  }
  v14 = *(_QWORD *)(a1[4] + 8);
  v15 = *(void **)(v14 + 40);
  if (v15)
  {
    objc_msgSend(v15, "service");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v16
      || (objc_msgSend(v8, "isEqual:", v16) & 1) != 0
      || (objc_msgSend(v18, "duration"), v11 + v17 >= *(double *)(*(_QWORD *)(a1[5] + 8) + 24)))
    {

      goto LABEL_13;
    }
    *a4 = 1;

    v14 = *(_QWORD *)(a1[4] + 8);
  }
  objc_storeStrong((id *)(v14 + 40), a2);
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v11;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
LABEL_13:

}

uint64_t __46__AXUIDisplayManager__handleNextAlertForType___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_showAlertWithContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setShowOrHideTimer:", 0);
}

- (void)_didHideOrDequeueAlertWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "service");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _transactionIdentifierForDisplayingAlertWithContext:service:](self, "_transactionIdentifierForDisplayingAlertWithContext:service:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXUIDisplayManager serviceManager](self, "serviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endTransactionWithIdentifier:forService:", v5, v7);

}

- (id)_transactionIdentifierForDisplayingAlertWithContext:(id)a3 service:(id)a4
{
  return (id)objc_msgSend(a3, "description");
}

- (id)_nubbitContextKeyForNubbit:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
}

- (id)_boundingViewForNubbit:(id)a3
{
  return (id)objc_msgSend(a3, "superview");
}

- (id)_nubbitContextForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AXLogWithFacility();
    v8 = 0;
  }

  return v8;
}

- (void)_scheduleFadeForNubbitContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v3 = a3;
  objc_initWeak(&location, v3);
  objc_msgSend(v3, "fadeTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__AXUIDisplayManager__scheduleFadeForNubbitContext___block_invoke;
  v6[3] = &unk_24D49CD20;
  v5 = v3;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "afterDelay:processBlock:", v6, 3.0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __52__AXUIDisplayManager__scheduleFadeForNubbitContext___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__AXUIDisplayManager__scheduleFadeForNubbitContext___block_invoke_2;
  v3[3] = &unk_24D49CD20;
  v4 = *(id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.5);
  objc_destroyWeak(&v5);

}

void __52__AXUIDisplayManager__scheduleFadeForNubbitContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nubbit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idleOpacityForNubbit:", v5);
    v7 = v6;

  }
  else
  {
    v7 = 0.35;
  }
  v8 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "originalAlpha");
  v10 = v7 * v9;
  v11 = objc_loadWeakRetained(v8);
  objc_msgSend(v11, "nubbit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v10);

}

- (void)_undoFadeForNubbitContext:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "fadeTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  objc_msgSend(v3, "originalAlpha");
  v6 = v5;
  objc_msgSend(v3, "nubbit");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAlpha:", v6);
}

- (void)_addDynamicAnimationsForNubbitContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "nubbit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDF6A18]);
  -[AXUIDisplayManager _boundingViewForNubbit:](self, "_boundingViewForNubbit:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithReferenceView:", v7);

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v4, "setDynamicAnimator:", v8);
  v9 = objc_alloc(MEMORY[0x24BDF6940]);
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithItems:", v10);

  objc_msgSend(v11, "setCollisionDelegate:", self);
  objc_msgSend(v11, "setTranslatesReferenceBoundsIntoBoundary:", 1);
  objc_msgSend(v8, "addBehavior:", v11);
  objc_msgSend(v4, "setCollisionBehavior:", v11);
  v12 = objc_alloc(MEMORY[0x24BDF6A20]);
  v15 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithItems:", v13);

  objc_msgSend(v14, "setAllowsRotation:", 0);
  objc_msgSend(v14, "setFriction:", 100.0);
  objc_msgSend(v8, "addBehavior:", v14);
  objc_msgSend(v4, "setDynamicItemBehavior:", v14);

}

- (void)_removeDynamicAnimationsForNubbitContext:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "dynamicAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllBehaviors");

  objc_msgSend(v5, "dynamicAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  objc_msgSend(v5, "setDynamicAnimator:", 0);
}

- (void)_beginMoveForNubbitContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "nubbit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "moveNubbitGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _boundingViewForNubbit:](self, "_boundingViewForNubbit:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v26, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v26, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nubbitWillBeginDragging:", v4);

  }
  -[AXUIDisplayManager _undoFadeForNubbitContext:](self, "_undoFadeForNubbitContext:", v26);
  objc_msgSend(v26, "dynamicAnimator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    _AXAssert();
  objc_msgSend(v26, "gravityBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeBehavior:", v14);

  objc_msgSend(v26, "setGravityBehavior:", 0);
  objc_msgSend(v26, "snapToBoundaryBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeBehavior:", v15);

  objc_msgSend(v26, "setSnapToBoundaryBehavior:", 0);
  objc_msgSend(v26, "collisionBehavior");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeBehavior:", v16);

  if (-[AXUIDisplayManager activeInterfaceOrientation](self, "activeInterfaceOrientation") == 1)
  {
    if (AXDeviceHasJindo())
    {
      objc_msgSend(v26, "collisionBehavior");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addBoundaryWithIdentifier:fromPoint:toPoint:", CFSTR("foreheadRect"), 0.0, self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0, self->_foreheadRect.size.width * 5.0, self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0);

      if (-[AXUIDisplayManager _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v8, v10))
        v10 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0;
    }
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6840]), "initWithItem:attachedToAnchor:", v4, v8, v10);
  objc_msgSend(v13, "addBehavior:", v18);
  objc_msgSend(v26, "setFollowPanBehavior:", v18);
  v19 = (void *)MEMORY[0x24BDD17C8];
  -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "disableSystemGesturesAssertion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x24BE005A8], "assertionWithType:identifier:", *MEMORY[0x24BDFFCA0], v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDisableSystemGesturesAssertion:", v23);

  }
  objc_msgSend(v26, "disableDashBoardSystemGesturesAssertion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(MEMORY[0x24BE005A8], "assertionWithType:identifier:", *MEMORY[0x24BDFFC80], v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDisableDashBoardSystemGesturesAssertion:", v25);

  }
}

- (void)_changeNubbitPositionForNubbitContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "moveNubbitGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nubbit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _boundingViewForNubbit:](self, "_boundingViewForNubbit:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  if (-[AXUIDisplayManager _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v8, v10))
  {
    objc_msgSend(v13, "moveNubbitGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setState:", 3);

  }
  objc_msgSend(v13, "followPanBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnchorPoint:", v8, v10);

}

- (void)_endMoveForNubbitContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "nubbit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _boundingViewForNubbit:](self, "_boundingViewForNubbit:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moveNubbitGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "velocityInView:", v5);
  v8 = v7;
  v10 = v9;

  if (-[AXUIDisplayManager _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v8, v10))
    v10 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0;
  objc_msgSend(v16, "dynamicAnimator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "followPanBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeBehavior:", v12);

  objc_msgSend(v16, "setFollowPanBehavior:", 0);
  objc_msgSend(v16, "dynamicItemBehavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addLinearVelocity:forItem:", v4, v8, v10);

  -[AXUIDisplayManager _gravityBehaviorForNubbit:velocity:boundingView:](self, "_gravityBehaviorForNubbit:velocity:boundingView:", v4, v5, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addBehavior:", v14);
  objc_msgSend(v16, "setGravityBehavior:", v14);
  objc_msgSend(v16, "collisionBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addBehavior:", v15);

  -[AXUIDisplayManager _scheduleFadeForNubbitContext:](self, "_scheduleFadeForNubbitContext:", v16);
  objc_msgSend(v16, "setDisableSystemGesturesAssertion:", 0);
  objc_msgSend(v16, "setDisableDashBoardSystemGesturesAssertion:", 0);

}

- (void)pinNubbitToEdge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AXUIDisplayManager _endMoveForNubbitContext:](self, "_endMoveForNubbitContext:", v7);
}

- (id)_gravityBehaviorForNubbit:(id)a3 velocity:(CGPoint)a4 boundingView:(id)a5
{
  double y;
  double x;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat MinY;
  double v19;
  double v20;
  CGFloat MaxY;
  CGFloat MidX;
  _QWORD v24[2];
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  y = a4.y;
  x = a4.x;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (a3)
  {
    v9 = (objc_class *)MEMORY[0x24BDF6AA8];
    v10 = a3;
    v11 = [v9 alloc];
    v24[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = (id)objc_msgSend(v11, "initWithItems:", v12);

    objc_msgSend(v10, "center");
    v14 = v13 + x * 0.22;
    objc_msgSend(v10, "center");
    v16 = v15;

    objc_msgSend(v8, "frame");
    if (v14 <= CGRectGetMinX(v25) + 50.0)
      goto LABEL_6;
    objc_msgSend(v8, "frame");
    if (v14 >= CGRectGetMaxX(v26) + -50.0)
      goto LABEL_6;
    v17 = v16 + y * 0.22;
    objc_msgSend(v8, "frame");
    MinY = CGRectGetMinY(v27);
    v19 = -1.0;
    v20 = 0.0;
    if (v17 >= MinY + 80.0)
    {
      objc_msgSend(v8, "frame");
      MaxY = CGRectGetMaxY(v28);
      v19 = 1.0;
      if (v17 <= MaxY + -80.0)
      {
LABEL_6:
        objc_msgSend(v8, "frame");
        MidX = CGRectGetMidX(v29);
        v19 = 0.0;
        v20 = 1.0;
        if (v14 <= MidX)
          v20 = -1.0;
      }
    }
    objc_msgSend(a3, "setGravityDirection:", v20 * 5.0, v19 * 5.0);
  }

  return a3;
}

- (void)_handleMoveNubbitGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AXUIDisplayManager _nubbitContextForGestureRecognizer:](self, "_nubbitContextForGestureRecognizer:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if ((unint64_t)(v5 - 3) < 2)
  {
    -[AXUIDisplayManager _endMoveForNubbitContext:](self, "_endMoveForNubbitContext:", v7);
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    -[AXUIDisplayManager _changeNubbitPositionForNubbitContext:](self, "_changeNubbitPositionForNubbitContext:", v7);
    goto LABEL_7;
  }
  v6 = v7;
  if (v5 == 1)
  {
    -[AXUIDisplayManager _beginMoveForNubbitContext:](self, "_beginMoveForNubbitContext:", v7);
LABEL_7:
    v6 = v7;
  }

}

- (void)cancelNubbitFade:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXUIDisplayManager _undoFadeForNubbitContext:](self, "_undoFadeForNubbitContext:", v7);
    -[AXUIDisplayManager _scheduleFadeForNubbitContext:](self, "_scheduleFadeForNubbitContext:", v7);
  }

}

- (void)_attemptToInitializeActiveInterfaceOrientation
{
  void *v4;
  _QWORD v5[6];

  objc_msgSend(MEMORY[0x24BE00728], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__AXUIDisplayManager__attemptToInitializeActiveInterfaceOrientation__block_invoke;
  v5[3] = &unk_24D49CD70;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "activeInterfaceOrientation:", v5);

}

uint64_t __68__AXUIDisplayManager__attemptToInitializeActiveInterfaceOrientation__block_invoke()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __68__AXUIDisplayManager__attemptToInitializeActiveInterfaceOrientation__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  unint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "setActiveInterfaceOrientation:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(v2, "setNumberOfAttemptsToInitializeActiveInterfaceOrientation:", 0);
  v4 = objc_msgSend(v2, "numberOfAttemptsToInitializeActiveInterfaceOrientation") + 1;
  result = objc_msgSend(*(id *)(a1 + 32), "setNumberOfAttemptsToInitializeActiveInterfaceOrientation:", v4);
  if (v4 <= 0x1D)
    return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", *(_QWORD *)(a1 + 48), 0, 0.5);
  return result;
}

- (BOOL)_serviceWantsToPreventAutorotation:(id)a3
{
  id v3;
  id v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_254E24950))
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v4, "shouldPreventAutorotatingAllContentViewControllers");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dynamicAnimatorDidPause:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "dynamicAnimator");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          objc_msgSend(v11, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_respondsToSelector();

          if ((v14 & 1) != 0)
          {
            objc_msgSend(v11, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "nubbit");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "nubbitDidUpdatePosition:", v16);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)collisionBehavior:(id)a3 beganContactForItem:(id)a4 withBoundaryIdentifier:(id)a5 atPoint:(CGPoint)a6
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  y = a6.y;
  x = a6.x;
  v15 = a4;
  -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager _nubbitContextKeyForNubbit:](self, "_nubbitContextKeyForNubbit:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "snapToBoundaryBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DB0]), "initWithItem:snapToPoint:", v15, x, y);
    objc_msgSend(v11, "setSnapToBoundaryBehavior:", v13);
    objc_msgSend(v11, "dynamicAnimator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addBehavior:", v13);

  }
}

- (void)_resetServiceManager
{
  -[AXUIDisplayManager setServiceManager:](self, "setServiceManager:", 0);
}

- (void)_reapHiddenWindows
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  uint64_t i;
  _QWORD v11[5];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_activeWindows);
  v12[0] = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_passiveWindows);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v12[1] = v3;
  v5 = 1;
  v6 = MEMORY[0x24BDAC760];
  do
  {
    v7 = v5;
    v8 = (id)v12[v4];
    -[AXUIDisplayManager valueForKey:](self, "valueForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __40__AXUIDisplayManager__reapHiddenWindows__block_invoke;
    v11[3] = &unk_24D49CDC0;
    v11[4] = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);
    if (!objc_msgSend(v9, "count"))
      -[AXUIDisplayManager setValue:forKey:](self, "setValue:forKey:", 0, v8);

    v5 = 0;
    v4 = 1;
  }
  while ((v7 & 1) != 0);
  for (i = 1; i != -1; --i)

}

void __40__AXUIDisplayManager__reapHiddenWindows__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v5 = a2;
  v6 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__AXUIDisplayManager__reapHiddenWindows__block_invoke_2;
  v7[3] = &unk_24D49CD98;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = &v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (v9[5])
    objc_msgSend(v6, "removeObjectsForKeys:");
  _Block_object_dispose(&v8, 8);

}

void __40__AXUIDisplayManager__reapHiddenWindows__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isHidden"))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      v7 = objc_opt_new();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 32), "windowHostingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterWindowWithContextID:", objc_msgSend(v5, "_contextId"));

  }
}

- (NSString)debugDescription
{
  AXUIDisplayManager *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  AXUIDisplayManager *v27;
  id obj;
  id obja;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v2 = self;
  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("AXUIDisplayManager<%p>"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIDisplayManager activeWindows](v2, "activeWindows");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "count"))
  {
    v27 = v2;
    objc_msgSend(v3, "appendFormat:", CFSTR("\nActive Windows:\n"));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v32, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v33)
    {
      v30 = *(_QWORD *)v50;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(obj);
          v35 = v4;
          v5 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("  ID: %@\n"), v5);
          objc_msgSend(v32, "objectForKeyedSubscript:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v6, "allKeys");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v46 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
                objc_msgSend(v6, "objectForKeyedSubscript:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("    %@: %@\n"), v12, v13);
                objc_msgSend(v13, "rootViewController");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("      Content: %@\n"), v14);

              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
            }
            while (v9);
          }

          v4 = v35 + 1;
        }
        while (v35 + 1 != v33);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v33);
    }

    v2 = v27;
  }
  -[AXUIDisplayManager passiveWindows](v2, "passiveWindows");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\nPassive Windows:\n"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v15, "allKeys");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v36)
    {
      v31 = *(_QWORD *)v42;
      v34 = v15;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(obja);
          v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v3, "appendFormat:", CFSTR("  ID: %@\n"), v17);
          objc_msgSend(v15, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v18, "allKeys");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v38;
            do
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v38 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
                objc_msgSend(v18, "objectForKeyedSubscript:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR("    %@: %@\n"), v24, v25);

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
            }
            while (v21);
          }

          v15 = v34;
        }
        v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v36);
    }

  }
  return (NSString *)v3;
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    self->_foreheadRect.origin.x = v6;
    self->_foreheadRect.origin.y = v7;
    self->_foreheadRect.size.width = v8;
    self->_foreheadRect.size.height = v9;
  }
  else
  {
    if (objc_msgSend(v4, "count") != 2)
      goto LABEL_6;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CGRectValue");
    v48.origin.x = v19;
    v48.origin.y = v20;
    v48.size.width = v21;
    v48.size.height = v22;
    v47.origin.x = v11;
    v47.origin.y = v13;
    v47.size.width = v15;
    v47.size.height = v17;
    self->_foreheadRect = CGRectUnion(v47, v48);

  }
LABEL_6:
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[AXUIDisplayManager nubbitContexts](self, "nubbitContexts", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v29, "nubbit");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "frame");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;

        if (-[AXUIDisplayManager _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v32, v34)
          && AXDeviceHasJindo())
        {
          v39 = self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0;
          objc_msgSend(v29, "nubbit");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setFrame:", v32, v39, v36, v38);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v26);
  }

}

- (BOOL)_axIsPointInForeheadRect:(CGPoint)a3
{
  double y;

  y = a3.y;
  if (-[AXUIDisplayManager activeInterfaceOrientation](self, "activeInterfaceOrientation", a3.x) == 1
    && self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0 >= y)
  {
    return AXDeviceHasJindo();
  }
  else
  {
    return 0;
  }
}

- (AXUIAlertStyleProvider)defaultAlertStyleProvider
{
  return self->_defaultAlertStyleProvider;
}

- (void)setDefaultAlertStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAlertStyleProvider, a3);
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (void)setActiveInterfaceOrientation:(int64_t)a3
{
  self->_activeInterfaceOrientation = a3;
}

- (unint64_t)numberOfAttemptsToInitializeActiveInterfaceOrientation
{
  return self->_numberOfAttemptsToInitializeActiveInterfaceOrientation;
}

- (void)setNumberOfAttemptsToInitializeActiveInterfaceOrientation:(unint64_t)a3
{
  self->_numberOfAttemptsToInitializeActiveInterfaceOrientation = a3;
}

- (AXUIServiceManager)serviceManager
{
  return (AXUIServiceManager *)objc_loadWeakRetained((id *)&self->_serviceManager);
}

- (void)setServiceManager:(id)a3
{
  objc_storeWeak((id *)&self->_serviceManager, a3);
}

- (NSMutableDictionary)alertQueues
{
  return self->_alertQueues;
}

- (void)setAlertQueues:(id)a3
{
  objc_storeStrong((id *)&self->_alertQueues, a3);
}

- (NSMutableDictionary)visibleAlertContexts
{
  return self->_visibleAlertContexts;
}

- (void)setVisibleAlertContexts:(id)a3
{
  objc_storeStrong((id *)&self->_visibleAlertContexts, a3);
}

- (NSMutableDictionary)activeWindows
{
  return self->_activeWindows;
}

- (void)setActiveWindows:(id)a3
{
  objc_storeStrong((id *)&self->_activeWindows, a3);
}

- (NSMutableDictionary)passiveWindows
{
  return self->_passiveWindows;
}

- (void)setPassiveWindows:(id)a3
{
  objc_storeStrong((id *)&self->_passiveWindows, a3);
}

- (NSMutableDictionary)activeContentViewControllers
{
  return self->_activeContentViewControllers;
}

- (void)setActiveContentViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_activeContentViewControllers, a3);
}

- (NSMutableDictionary)passiveContentViewControllers
{
  return self->_passiveContentViewControllers;
}

- (void)setPassiveContentViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_passiveContentViewControllers, a3);
}

- (NSString)systemServerActionHandlerIdentifier
{
  return self->_systemServerActionHandlerIdentifier;
}

- (void)setSystemServerActionHandlerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSMutableDictionary)mainScenes
{
  return self->_mainScenes;
}

- (void)setMainScenes:(id)a3
{
  objc_storeStrong((id *)&self->_mainScenes, a3);
}

- (NSMutableDictionary)externalScenes
{
  return self->_externalScenes;
}

- (void)setExternalScenes:(id)a3
{
  objc_storeStrong((id *)&self->_externalScenes, a3);
}

- (NSMutableDictionary)sceneClients
{
  return self->_sceneClients;
}

- (void)setSceneClients:(id)a3
{
  objc_storeStrong((id *)&self->_sceneClients, a3);
}

- (NSMutableDictionary)nubbitContexts
{
  return self->_nubbitContexts;
}

- (void)setNubbitContexts:(id)a3
{
  objc_storeStrong((id *)&self->_nubbitContexts, a3);
}

- (SBSAccessibilityWindowHostingController)windowHostingController
{
  return self->_windowHostingController;
}

- (void)setWindowHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_windowHostingController, a3);
}

- (NSMutableDictionary)addContentViewControllerBlocks
{
  return self->_addContentViewControllerBlocks;
}

- (void)setAddContentViewControllerBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_addContentViewControllerBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addContentViewControllerBlocks, 0);
  objc_storeStrong((id *)&self->_windowHostingController, 0);
  objc_storeStrong((id *)&self->_nubbitContexts, 0);
  objc_storeStrong((id *)&self->_sceneClients, 0);
  objc_storeStrong((id *)&self->_externalScenes, 0);
  objc_storeStrong((id *)&self->_mainScenes, 0);
  objc_storeStrong((id *)&self->_systemServerActionHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_passiveContentViewControllers, 0);
  objc_storeStrong((id *)&self->_activeContentViewControllers, 0);
  objc_storeStrong((id *)&self->_passiveWindows, 0);
  objc_storeStrong((id *)&self->_activeWindows, 0);
  objc_storeStrong((id *)&self->_visibleAlertContexts, 0);
  objc_storeStrong((id *)&self->_alertQueues, 0);
  objc_destroyWeak((id *)&self->_serviceManager);
  objc_storeStrong((id *)&self->_defaultAlertStyleProvider, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end
