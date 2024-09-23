@implementation SPRemoteInterface

+ (id)sharedRemoteInterface
{
  return (id)__sharedRemoteInterface;
}

+ (id)startRemoteInterface
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startRemoteInterfaceWithBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)startRemoteInterfaceWithBundle:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  wk_extension_loading_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "+[SPRemoteInterface startRemoteInterfaceWithBundle:]";
    v13 = 1024;
    v14 = 340;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_215918000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: startRemoteInterfaceWithBundle:%{public}@", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SPRemoteInterface_startRemoteInterfaceWithBundle___block_invoke;
  block[3] = &unk_24D3BB2A0;
  v10 = v3;
  v5 = startRemoteInterfaceWithBundle__onceToken;
  v6 = v3;
  if (v5 != -1)
    dispatch_once(&startRemoteInterfaceWithBundle__onceToken, block);
  v7 = (id)__sharedRemoteInterface;

  return v7;
}

void __52__SPRemoteInterface_startRemoteInterfaceWithBundle___block_invoke(uint64_t a1)
{
  SPRemoteInterface *v1;
  void *v2;

  v1 = -[SPRemoteInterface initWithBundle:]([SPRemoteInterface alloc], "initWithBundle:", *(_QWORD *)(a1 + 32));
  v2 = (void *)__sharedRemoteInterface;
  __sharedRemoteInterface = (uint64_t)v1;

}

+ (id)_remoteIdentifier
{
  if (_remoteIdentifier_onceToken != -1)
    dispatch_once(&_remoteIdentifier_onceToken, &__block_literal_global_2);
  return (id)_remoteIdentifier___remoteIdentifier;
}

void __38__SPRemoteInterface__remoteIdentifier__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WKAppBundleIdentifier"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_remoteIdentifier___remoteIdentifier;
  _remoteIdentifier___remoteIdentifier = v4;

  wk_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446722;
    v9 = "+[SPRemoteInterface _remoteIdentifier]_block_invoke";
    v10 = 1024;
    v11 = 371;
    v12 = 2114;
    v13 = _remoteIdentifier___remoteIdentifier;
    _os_log_impl(&dword_215918000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->ComD Gizmo app identifier %{public}@", (uint8_t *)&v8, 0x1Cu);
  }

  if (!_remoteIdentifier___remoteIdentifier)
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __38__SPRemoteInterface__remoteIdentifier__block_invoke_cold_1();

  }
}

+ (id)cacheIdentifier
{
  return +[SPRemoteInterface _remoteIdentifier](SPRemoteInterface, "_remoteIdentifier");
}

- (SPRemoteInterface)initWithBundle:(id)a3
{
  id v5;
  id v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  Class v13;
  Class v14;
  CFRunLoopObserverRef v15;
  void *v16;
  __CFRunLoop *Main;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  dispatch_queue_t v22;
  void *v23;
  _QWORD v25[4];
  NSString *v26;
  id v27;
  Class v28;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SPRemoteInterface;
  v6 = -[SPRemoteInterface init](&v29, sel_init);
  objc_msgSend(v6, "_setupSignalHandlers");
  objc_storeStrong((id *)v6 + 16, a3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_applicationAccessibilityChanged, CFSTR("_AXNotification_GizmoApplicationAccessibilityEnabled"), 0, (CFNotificationSuspensionBehavior)0);
  +[SPRemoteInterface _updateAccessibility](SPRemoteInterface, "_updateAccessibility");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v8;

  objc_msgSend(v5, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_SPDataDelegate"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = NSClassFromString(v11);
    if (v13)
    {
      v14 = v13;
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __36__SPRemoteInterface_initWithBundle___block_invoke;
      v25[3] = &unk_24D3BB2C8;
      v26 = v12;
      v27 = v6;
      v28 = v14;
      spUtils_dispatchAsyncToMainThread(v25);

    }
  }
  v15 = CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 0x7FFFFFFFLL, (CFRunLoopObserverCallBack)_RunLoopHandler, 0);
  v16 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v15;

  Main = CFRunLoopGetMain();
  CFRunLoopAddObserver(Main, *((CFRunLoopObserverRef *)v6 + 3), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v6 + 5);
  *((_QWORD *)v6 + 5) = v20;

  v22 = dispatch_queue_create("com.apple.watchkit.interfaceControllers", MEMORY[0x24BDAC9C0]);
  v23 = (void *)*((_QWORD *)v6 + 7);
  *((_QWORD *)v6 + 7) = v22;

  return (SPRemoteInterface *)v6;
}

void __36__SPRemoteInterface_initWithBundle___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;

  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __36__SPRemoteInterface_initWithBundle___block_invoke_cold_1();

  v3 = objc_alloc_init(*(Class *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setDataDelegate:", v3);

}

- (void)dealloc
{
  void *v3;
  __CFRunLoop *Main;
  __CFRunLoopObserver *v5;
  objc_super v6;

  -[SPRemoteInterface runLoopObserver](self, "runLoopObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    Main = CFRunLoopGetMain();
    -[SPRemoteInterface runLoopObserver](self, "runLoopObserver");
    v5 = (__CFRunLoopObserver *)objc_claimAutoreleasedReturnValue();
    CFRunLoopRemoveObserver(Main, v5, (CFRunLoopMode)*MEMORY[0x24BDBD598]);

    -[SPRemoteInterface setRunLoopObserver:](self, "setRunLoopObserver:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)SPRemoteInterface;
  -[SPRemoteInterface dealloc](&v6, sel_dealloc);
}

+ (void)_updateAccessibility
{
  int AppBooleanValue;
  char v3;
  int v4;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("GizmoApplicationAccessibilityEnabled"), CFSTR("com.apple.Accessibility"), 0);
  v3 = _updateAccessibility___startedAccessibilityServer;
  if ((AppBooleanValue != 0) != _updateAccessibility___startedAccessibilityServer)
  {
    v4 = AppBooleanValue;
    __41__SPRemoteInterface__updateAccessibility__block_invoke();
    if (v4)
    {
      if ((v3 & 1) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(__41__SPRemoteInterface__updateAccessibility__block_invoke(), "_accessibilityReenabled");
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(__41__SPRemoteInterface__updateAccessibility__block_invoke(), "_accessibilityStartServer");
        _updateAccessibility___startedAccessibilityServer = 1;
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(__41__SPRemoteInterface__updateAccessibility__block_invoke(), "_accessibilityStopServer");
    }
  }
}

id __41__SPRemoteInterface__updateAccessibility__block_invoke()
{
  if (__performAfterSendSetViewControllers_block_invoke_onceToken != -1)
    dispatch_once(&__performAfterSendSetViewControllers_block_invoke_onceToken, &__block_literal_global_298);
  return (id)__performAfterSendSetViewControllers_block_invoke___loaderClass;
}

Class __41__SPRemoteInterface__updateAccessibility__block_invoke_2()
{
  void *v0;
  Class result;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/UIAccessibility.framework"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "load");

  result = NSClassFromString(CFSTR("UIAccessibilityLoader"));
  __performAfterSendSetViewControllers_block_invoke___loaderClass = (uint64_t)result;
  return result;
}

- (void)_setupSignalHandlers
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SPRemoteInterface__setupSignalHandlers__block_invoke;
  v4[3] = &unk_24D3BB2A0;
  v4[4] = self;
  -[SPRemoteInterface _setupSignal:handler:](self, "_setupSignal:handler:", 31, v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_setupSignalHandlers__sigUsr2Source;
  _setupSignalHandlers__sigUsr2Source = v2;

}

void __41__SPRemoteInterface__setupSignalHandlers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[SPRemoteInterface _setupSignalHandlers]_block_invoke";
    v9 = 1024;
    v10 = 551;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ======== Companion App Extension", (uint8_t *)&v7, 0x12u);
  }

  wk_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    +[SPRemoteInterface _remoteIdentifier](SPRemoteInterface, "_remoteIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136446722;
    v8 = "-[SPRemoteInterface _setupSignalHandlers]_block_invoke";
    v9 = 1024;
    v10 = 552;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_215918000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Remote Identifier: %{public}@", (uint8_t *)&v7, 0x1Cu);

  }
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[SPRemoteInterface _setupSignalHandlers]_block_invoke";
    v9 = 1024;
    v10 = 553;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: -------- Interface Controllers", (uint8_t *)&v7, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_dumpInterfaceDictionary");
  wk_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[SPRemoteInterface _setupSignalHandlers]_block_invoke";
    v9 = 1024;
    v10 = 555;
    _os_log_impl(&dword_215918000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: --------", (uint8_t *)&v7, 0x12u);
  }

}

- (id)_setupSignal:(int)a3 handler:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD handler[4];
  NSObject *v10;

  v5 = a4;
  v6 = dispatch_source_create(MEMORY[0x24BDACA08], a3, 0, MEMORY[0x24BDAC9B8]);
  if (v6)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __42__SPRemoteInterface__setupSignal_handler___block_invoke;
    handler[3] = &unk_24D3BB310;
    v10 = v5;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    signal(a3, (void (__cdecl *)(int))1);
    v7 = v10;
  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface _setupSignal:handler:].cold.1();
  }

  return v6;
}

uint64_t __42__SPRemoteInterface__setupSignal_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_host
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE72FC0], "defaultService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostPrincipalForPlugInNamed:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sendData:(id)a3 clientIdentifiers:(id)a4
{
  -[SPRemoteInterface sendData:clientIdentifiers:reply:](self, "sendData:clientIdentifiers:reply:", a3, a4, 0);
}

- (void)sendData:(id)a3 clientIdentifiers:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  wk_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SPRemoteInterface sendData:clientIdentifiers:reply:].cold.2();

  -[SPRemoteInterface _host](self, "_host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[SPRemoteInterface _remoteIdentifier](SPRemoteInterface, "_remoteIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v12, "sendData:identifier:clientIdentifiers:reply:", v8, v13, v9, v10);
    else
      objc_msgSend(v12, "sendData:identifier:clientIdentifiers:", v8, v13, v9);
  }
  else
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface sendData:clientIdentifiers:reply:].cold.1();
  }

}

- (void)sendPlist:(id)a3 clientIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;

  v6 = a4;
  +[SPProtoSerializer spPlistWithDictionary:](SPProtoSerializer, "spPlistWithDictionary:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "data");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SPRemoteInterface sendData:clientIdentifiers:](self, "sendData:clientIdentifiers:", v9, v6);
    }
    else
    {
      wk_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SPRemoteInterface sendPlist:clientIdentifiers:].cold.2();

    }
  }
  else
  {
    wk_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface sendPlist:clientIdentifiers:].cold.1();
  }

}

- (void)sendSetViewController:(id)a3 key:(id)a4 property:(id)a5 value:(id)a6 clientIdentifiers:(id)a7
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("V");
  v13[1] = CFSTR("k");
  v14[0] = a3;
  v14[1] = CFSTR("#didActivate");
  v13[2] = CFSTR("v");
  v14[2] = MEMORY[0x24BDBD1C8];
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a7;
  v11 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v12, v10);
}

- (void)sendSetViewController:(id)a3 values:(id)a4 clientIdentifiers:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("V");
  v13[1] = CFSTR("S");
  v14[0] = a3;
  v14[1] = a4;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v12, v9);
}

- (void)_performAfterSendSetViewControllers:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = _performAfterSendSetViewControllers__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_performAfterSendSetViewControllers__onceToken, &__block_literal_global_312);
  v5 = (void *)__performAfterSendSetViewControllers;
  v7 = (id)objc_msgSend(v4, "copy");

  v6 = (void *)MEMORY[0x2199E8B48](v7);
  objc_msgSend(v5, "addObject:", v6);

}

void __57__SPRemoteInterface__performAfterSendSetViewControllers___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__performAfterSendSetViewControllers;
  __performAfterSendSetViewControllers = v0;

}

- (void)_requestTimingData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[SPRemoteInterface _host](self, "_host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[SPRemoteInterface _remoteIdentifier](SPRemoteInterface, "_remoteIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestTimingData:timingMetaData:", v6, v4);
  }
  else
  {
    wk_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface _requestTimingData:].cold.1();
  }

}

- (void)replyWithExtensionTimingData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("V"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".sex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".eex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".idx"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".rs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".bex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = CFSTR(".sex");
  v23[1] = CFSTR(".eex");
  v24[0] = v4;
  v24[1] = v5;
  v23[2] = CFSTR(".bex");
  v23[3] = CFSTR(".idx");
  v24[2] = v9;
  v24[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("V");
  v21[1] = CFSTR("k");
  v22[0] = v16;
  v22[1] = CFSTR(".PolDE");
  v21[2] = CFSTR("v");
  v22[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 1000000 * (v8 / 30) + 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SPRemoteInterface_replyWithExtensionTimingData___block_invoke;
  block[3] = &unk_24D3BB358;
  block[4] = self;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], block);

}

void __50__SPRemoteInterface_replyWithExtensionTimingData___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendPlist:clientIdentifiers:", v2, v3);

}

- (void)replyTimingData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("V"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".scd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".ecd"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".idx"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".rs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR(".bcd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = CFSTR(".scd");
  v23[1] = CFSTR(".ecd");
  v24[0] = v4;
  v24[1] = v5;
  v23[2] = CFSTR(".bcd");
  v23[3] = CFSTR(".idx");
  v24[2] = v9;
  v24[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("V");
  v21[1] = CFSTR("k");
  v22[0] = v16;
  v22[1] = CFSTR(".PolD");
  v21[2] = CFSTR("v");
  v22[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 1000000 * (v8 / 30) + 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SPRemoteInterface_replyTimingData___block_invoke;
  block[3] = &unk_24D3BB358;
  block[4] = self;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], block);

}

void __37__SPRemoteInterface_replyTimingData___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendPlist:clientIdentifiers:", v2, v3);

}

- (void)fetchNotificationForNotificationID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wk_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v21 = "-[SPRemoteInterface fetchNotificationForNotificationID:completion:]";
    v22 = 1024;
    v23 = 1024;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_215918000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->ComD, notificationID=%{public}@", buf, 0x1Cu);
  }

  -[SPRemoteInterface _host](self, "_host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke;
    v16[3] = &unk_24D3BB380;
    v17 = v7;
    objc_msgSend(v9, "fetchNotificationForNotificationID:completion:", v6, v16);
    v10 = v17;
  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface fetchNotificationForNotificationID:completion:].cold.1();

    v12 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SPErrorHostPrincipalForPluginNotFoundMessage"), &stru_24D3BD200, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.watchkit.errors"), 8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v15);

  }
}

void __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = (void *)MEMORY[0x24BDD1620];
    getUNNotificationClass();
    v21 = 0;
    objc_msgSend(v13, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    if (!v14)
    {
      wk_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke_cold_2();

      v14 = 0;
    }
    if (v10)
      goto LABEL_7;
LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v18 = v15;
    goto LABEL_14;
  }
  v14 = 0;
  v15 = 0;
  if (!v10)
    goto LABEL_13;
LABEL_7:
  v20 = v15;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v20;

  if (!v17)
  {
    wk_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_14:
}

- (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 controller:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  wk_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447235;
    v26 = "-[SPRemoteInterface updateUserActivity:userInfo:webpageURL:controller:]";
    v27 = 1024;
    v28 = 1056;
    v29 = 2114;
    v30 = v10;
    v31 = 2113;
    v32 = v11;
    v33 = 2114;
    v34 = v12;
    _os_log_impl(&dword_215918000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:<-Plugin, activity type: %{public}@, userInfo: %{private}@, webpageURL:%{public}@", buf, 0x30u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("uat"));
  if (v11)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("uai"));
  if (v12)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("uau"));
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    ArchiveWithArchiverDelegate(v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("ua");
    v24 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v20 = objc_claimAutoreleasedReturnValue();

    v22 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v20, v21);

  }
  else
  {
    wk_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface updateUserActivity:userInfo:webpageURL:controller:].cold.1();
  }

}

- (void)sendCacheRequestMessage:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;

  +[SPProtoSerializer dataWithObject:](SPProtoSerializer, "dataWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SPRemoteInterface _host](self, "_host");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[SPRemoteInterface _remoteIdentifier](SPRemoteInterface, "_remoteIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject sendCacheRequest:identifier:](v5, "sendCacheRequest:identifier:", v4, v6);
    }
    else
    {
      wk_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SPRemoteInterface sendCacheRequestMessage:].cold.2();
    }

  }
  else
  {
    wk_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface sendCacheRequestMessage:].cold.1();
  }

}

+ (id)SerializablePropertyValue:(id)a3
{
  return SerializablePropertyValue(a3);
}

+ (void)handleEvent:(id)a3
{
  spUtils_dispatchAsyncToMainThread(a3);
}

+ (void)_setupStorageForController:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v3 = a3;
  v4 = (void *)__recordedValues;
  v23 = v3;
  if (!__recordedValues)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__recordedValues;
    __recordedValues = v5;

    v3 = v23;
    v4 = (void *)__recordedValues;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__recordedValues, "setObject:forKeyedSubscript:", v8, v23);

  }
  v9 = (void *)__cachedRunLoopValues;
  if (!__cachedRunLoopValues)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)__cachedRunLoopValues;
    __cachedRunLoopValues = v10;

    v9 = (void *)__cachedRunLoopValues;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__cachedRunLoopValues, "setObject:forKeyedSubscript:", v13, v23);

  }
  v14 = (void *)__cachedActivationValues;
  if (!__cachedActivationValues)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)__cachedActivationValues;
    __cachedActivationValues = v15;

    v14 = (void *)__cachedActivationValues;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__cachedActivationValues, "setObject:forKeyedSubscript:", v18, v23);

  }
  v19 = (void *)__controllerActive;
  if (!__controllerActive)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)__controllerActive;
    __controllerActive = v20;

    v19 = (void *)__controllerActive;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    objc_msgSend((id)__controllerActive, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v23);

}

+ (void)clearStorageForController:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)__cachedActivationValues;
  v4 = a3;
  objc_msgSend(v3, "removeObjectForKey:", v4);
  objc_msgSend((id)__controllerActive, "removeObjectForKey:", v4);

}

+ (void)setControllerActive:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)__controllerActive;
  v7 = v3;
  if (!__controllerActive)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__controllerActive;
    __controllerActive = v5;

    v3 = v7;
    v4 = (void *)__controllerActive;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v3);

}

+ (void)setControllerInactive:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)__controllerActive;
  v7 = v3;
  if (!__controllerActive)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__controllerActive;
    __controllerActive = v5;

    v3 = v7;
    v4 = (void *)__controllerActive;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v3);

}

+ (void)setController:(id)a3 key:(id)a4 property:(id)a5 value:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__SPRemoteInterface_setController_key_property_value___block_invoke;
  v17[3] = &unk_24D3BB3A8;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  spUtils_dispatchAsyncToMainThread(v17);

}

void __54__SPRemoteInterface_setController_key_property_value___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  const __CFString **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  unint64_t v39;
  char v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  __objc2_class *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  unint64_t v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[3];
  _QWORD v73[3];
  const __CFString *v74;
  uint64_t v75;
  _QWORD v76[2];
  _QWORD v77[4];

  v77[2] = *MEMORY[0x24BDAC8D0];
  +[SPRemoteInterface _setupStorageForController:](SPRemoteInterface, "_setupStorageForController:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)__recordedValues, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__cachedRunLoopValues, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__cachedActivationValues, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR(".null")) || !objc_msgSend(v2, "count"))
  {
    v5 = (__CFString *)*(id *)(a1 + 48);
    v58 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("#value"));
    if (v58)
    {

      v5 = 0;
    }
    objc_msgSend((id)__controllerActive, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) == 0)
    {
      +[SPRemoteInterface _logDuplicate:controller:key:property:value:](SPRemoteInterface, "_logDuplicate:controller:key:property:value:", CFSTR("Controller is not active."), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 56));
LABEL_63:

      goto LABEL_64;
    }
    if (*(_QWORD *)(a1 + 56) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      SerializablePropertyValue(*(void **)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[__CFString length](v5, "length");
      v15 = *(_QWORD *)(a1 + 40);
      if (v14)
      {
        v72[0] = CFSTR("k");
        v72[1] = CFSTR("p");
        v73[0] = v15;
        v73[1] = v5;
        v72[2] = CFSTR("v");
        v73[2] = v13;
        v16 = (void *)MEMORY[0x24BDBCE70];
        v17 = v73;
        v18 = v72;
        v19 = 3;
      }
      else
      {
        v70[0] = CFSTR("k");
        v70[1] = CFSTR("v");
        v71[0] = v15;
        v71[1] = v13;
        v16 = (void *)MEMORY[0x24BDBCE70];
        v17 = v71;
        v18 = v70;
        v19 = 2;
      }
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[__CFString length](v5, "length"))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v76[0] = CFSTR("k");
        v76[1] = CFSTR("p");
        v77[0] = v8;
        v77[1] = v5;
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = v77;
        v11 = (const __CFString **)v76;
        v12 = 2;
      }
      else
      {
        v74 = CFSTR("k");
        v75 = *(_QWORD *)(a1 + 40);
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = &v75;
        v11 = &v74;
        v12 = 1;
      }
      objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
    }
    v57 = v13;
    if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("rowTypes")) & 1) != 0
      || (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR(".insert")) & 1) != 0
      || -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR(".remove")))
    {
      v55 = v5;
      v56 = v2;
      objc_msgSend(v4, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v65 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v27, "pathComponents");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "count");

            if (v29 >= 2)
              objc_msgSend(v4, "removeObjectForKey:", v27);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        }
        while (v24);
      }

      objc_msgSend(v3, "allKeys");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "copy");

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v61 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
            objc_msgSend(v37, "pathComponents");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "count");

            if (v39 >= 2)
              objc_msgSend(v3, "removeObjectForKey:", v37);
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        }
        while (v34);
      }

      v5 = v55;
      v2 = v56;
      v13 = v57;
    }
    if (v5 && !-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_24D3BD200)
      || (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("#item")) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR(".null")) & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("#animateBegin")) & 1) != 0)
    {
      v40 = 1;
    }
    else
    {
      v40 = v58 | objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("#animateCommit"));
    }
    if (v5)
      v41 = v5;
    else
      v41 = &stru_24D3BD200;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@|%@"), *(_QWORD *)(a1 + 40), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v40 & 1) != 0)
    {
      v43 = 0;
      goto LABEL_50;
    }
    objc_msgSend(v3, "objectForKey:", v42);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v43 = v47;
      objc_msgSend(v2, "replaceObjectAtIndex:withObject:", objc_msgSend(v47, "unsignedIntegerValue"), v59);
      v48 = SPRemoteInterface;
      v49 = *(_QWORD *)(a1 + 32);
      v50 = *(_QWORD *)(a1 + 40);
      v51 = *(void **)(a1 + 56);
      v52 = CFSTR("Duplicate call within run loop.");
LABEL_55:
      -[__objc2_class _logDuplicate:controller:key:property:value:](v48, "_logDuplicate:controller:key:property:value:", v52, v49, v50, v5, v51);
LABEL_62:

      goto LABEL_63;
    }
    objc_msgSend(v4, "objectForKey:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0x24D3BA000uLL;
    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_opt_class(), v53 = 0x24D3BA000, (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (objc_msgSend(v43, "isEqual:", *(_QWORD *)(a1 + 56)))
        {
          v51 = *(void **)(a1 + 56);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || *(_QWORD *)(a1 + 56))
          {
            v13 = v57;
            goto LABEL_50;
          }
          v51 = 0;
        }
        v13 = v57;
LABEL_68:
        v48 = *(__objc2_class **)(v53 + 2176);
        v49 = *(_QWORD *)(a1 + 32);
        v50 = *(_QWORD *)(a1 + 40);
        v52 = CFSTR("Duplicate call.");
        goto LABEL_55;
      }
      v51 = v43;
      v13 = v57;
      if (v43 == *(void **)(a1 + 56))
        goto LABEL_68;
    }
LABEL_50:
    objc_msgSend(v2, "addObject:", v59);
    v44 = objc_msgSend(v2, "count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v44 - 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, v42);

    if ((v40 & 1) == 0)
    {
      v46 = *(_QWORD *)(a1 + 56);
      if (v46)
      {
        objc_msgSend(v4, "setObject:forKey:", v46, v42);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v54, v42);

      }
    }
    goto LABEL_62;
  }
LABEL_64:

}

+ (void)_logDuplicate:(id)a3 controller:(id)a4 key:(id)a5 property:(id)a6 value:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend((id)__sharedRemoteInterface, "_interfaceControllerWithID:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "length") >= 0x21)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v16, "substringToIndex:", 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@...<truncated>"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
  }
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  NSLog(CFSTR("WatchKit: %@ Discarding call for %@ key=%@ property=%@ value=%@ value class=%@"), v11, v20, v12, v13, v16, v21);
  wk_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_opt_class();
    v24 = v23;
    *(_DWORD *)buf = 136448003;
    v27 = "+[SPRemoteInterface _logDuplicate:controller:key:property:value:]";
    v28 = 1024;
    v29 = 1456;
    v30 = 2114;
    v31 = v11;
    v32 = 2114;
    v33 = v23;
    v34 = 2114;
    v35 = v12;
    v36 = 2114;
    v37 = v13;
    v38 = 2113;
    v39 = v16;
    v40 = 2114;
    v41 = (id)objc_opt_class();
    v25 = v41;
    _os_log_impl(&dword_215918000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: WatchKit: %{public}@ Discarding call for %{public}@ key=%{public}@ property=%{public}@ value=%{private}@ value class=%{public}@", buf, 0x4Eu);

  }
}

+ (void)controller:(id)a3 pushInterfaceController:(id)a4 context:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)__sharedRemoteInterface;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "storeInterfaceCreationContext:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__sharedRemoteInterface, "controller:pushInterfaceController:initializationContextID:", v9, v8, v10);

}

+ (void)controllerPop:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "controllerPop:", a3);
}

+ (void)controllerPopToRoot:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "controllerPopToRoot:", a3);
}

+ (void)reloadRootControllersWithNames:(id)a3 contexts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v8 > 1)
          objc_msgSend((id)__sharedRemoteInterface, "storePageInterfaceCreationContext:", v14, (_QWORD)v18);
        else
          objc_msgSend((id)__sharedRemoteInterface, "storeInterfaceCreationContext:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15, (_QWORD)v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (void *)__sharedRemoteInterface;
  if (objc_msgSend(v7, "count"))
    v17 = v7;
  else
    v17 = 0;
  objc_msgSend(v16, "reloadRootControllersWithNames:initializationContextIDs:pageIndex:verticalPaging:", v5, v17, 0, 0, (_QWORD)v18);

}

+ (void)insertPageControllerAtIndexes:(id)a3 withNames:(id)a4 contexts:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend((id)__sharedRemoteInterface, "storePageInterfaceCreationContext:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = (void *)__sharedRemoteInterface;
  if (objc_msgSend(v10, "count"))
    v18 = v10;
  else
    v18 = 0;
  objc_msgSend(v17, "insertPageControllerAtIndexes:withNames:initializationContextIDs:", v7, v8, v18, (_QWORD)v19);

}

+ (void)movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  objc_msgSend((id)__sharedRemoteInterface, "movePageControllerAtIndex:toIndex:", a3, a4);
}

+ (void)removePageControllerAtIndexes:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "removePageControllerAtIndexes:", a3);
}

+ (void)controllerBecomeCurrentPage:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "controllerBecomeCurrentPage:", a3);
}

+ (void)controller:(id)a3 presentInterfaceController:(id)a4 context:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)__sharedRemoteInterface;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "storeInterfaceCreationContext:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller:presentInterfaceController:initializationContextID:", v9, v8, v10);

}

+ (void)controller:(id)a3 presentInterfaceControllers:(id)a4 contexts:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "count");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v11 > 1)
          objc_msgSend((id)__sharedRemoteInterface, "storePageInterfaceCreationContext:", v17, (_QWORD)v21);
        else
          objc_msgSend((id)__sharedRemoteInterface, "storeInterfaceCreationContext:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18, (_QWORD)v21);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v19 = (void *)__sharedRemoteInterface;
  if (objc_msgSend(v10, "count"))
    v20 = v10;
  else
    v20 = 0;
  objc_msgSend(v19, "controller:presentInterfaceControllers:initializationContextIDs:", v7, v8, v20, (_QWORD)v21);

}

+ (void)controllerDismiss:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "controllerDismiss:", a3);
}

+ (void)controller:(id)a3 presentTextInputControllerWithSuggestions:(id)a4 allowedInputMode:(id)a5 completion:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;

  v9 = (void *)__sharedRemoteInterface;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "setTextInputCompletion:", a6);
  objc_msgSend((id)__sharedRemoteInterface, "setTextInputSuggestions:", 0);
  objc_msgSend((id)__sharedRemoteInterface, "controllerPresentTextInputController:allowedInputMode:suggestions:", v12, v10, v11);

}

+ (void)controller:(id)a3 presentTextInputControllerWithSuggestionsForLanguage:(id)a4 allowedInputMode:(id)a5 completion:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;

  v9 = (void *)__sharedRemoteInterface;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "setTextInputCompletion:", a6);
  objc_msgSend((id)__sharedRemoteInterface, "setTextInputSuggestions:", v11);

  objc_msgSend((id)__sharedRemoteInterface, "controllerPresentTextInputController:allowedInputMode:suggestions:", v12, v10, 0);
}

+ (void)controllerDismissTextInputController:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "controllerDismissTextInputController:", a3);
}

+ (void)openSystemURL:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "openSystemURL:", a3);
}

+ (void)controller:(id)a3 presentAddPassesControllerWithPasses:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;

  v7 = (void *)__sharedRemoteInterface;
  v8 = a5;
  objc_msgSend(v7, "controllerPresentAddPassesController:passes:", a3, a4);
  objc_msgSend((id)__sharedRemoteInterface, "setAddPassesCompletion:", v8);

}

+ (void)controllerDismissAddPassesController:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "controllerDismissAddPassesController:", a3);
}

+ (void)didFinishHandlingActivity:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "didFinishHandlingActivity:", a3);
}

+ (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 interfaceController:(id)a6
{
  objc_msgSend((id)__sharedRemoteInterface, "updateUserActivity:userInfo:webpageURL:controller:", a3, a4, a5, a6);
}

+ (void)sendCacheRequest:(id)a3
{
  NSObject *v3;

  wk_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[SPRemoteInterface sendCacheRequest:].cold.1();

}

+ (void)sendCacheRequestMessage:(id)a3
{
  objc_msgSend((id)__sharedRemoteInterface, "sendCacheRequestMessage:", a3);
}

+ (BOOL)sendDataToApp:(id)a3
{
  return objc_msgSend(a1, "sendDataToApp:reply:", a3, 0);
}

+ (BOOL)sendDataToApp:(id)a3 reply:(id)a4
{
  return objc_msgSend((id)__sharedRemoteInterface, "_sendDataToApp:reply:", a3, a4);
}

- (BOOL)_sendDataToApp:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSString *appClientIdentifier;
  NSString *v9;
  BOOL v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    v9 = appClientIdentifier;
  }
  else
  {
    -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", self->_rootViewControllerID);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_6:
      v10 = 0;
      goto LABEL_7;
    }
  }
  if (!objc_msgSend(v6, "length"))
    goto LABEL_6;
  v13[0] = v9;
  v10 = 1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface sendData:clientIdentifiers:reply:](self, "sendData:clientIdentifiers:reply:", v6, v11, v7);

LABEL_7:
  return v10;
}

+ (void)notificationController:(id)a3 showNotificationInterfaceType:(int64_t)a4
{
  objc_msgSend((id)__sharedRemoteInterface, "notificationController:showNotificationInterfaceType:", a3, a4);
}

- (id)storeInterfaceCreationContext:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    if (!__interfaceCreationContexts)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)__interfaceCreationContexts;
      __interfaceCreationContexts = v4;

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", storeInterfaceCreationContext____contextCounter);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__interfaceCreationContexts, "setObject:forKey:", v3, v6);
    ++storeInterfaceCreationContext____contextCounter;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)interfaceCreationContextForID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)__interfaceCreationContexts, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__interfaceCreationContexts, "removeObjectForKey:", v3);
    v5 = objc_msgSend(v3, "integerValue");
    v6 = v5 - 1;
    if (v5 >= 1)
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)__interfaceCreationContexts, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          break;
        objc_msgSend((id)__interfaceCreationContexts, "removeObjectForKey:", v7);

        if (--v6 == -1)
          goto LABEL_8;
      }

    }
  }
  else
  {
    v4 = 0;
  }
LABEL_8:

  return v4;
}

- (id)storePageInterfaceCreationContext:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    if (!__pageInterfaceCreationContexts)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)__pageInterfaceCreationContexts;
      __pageInterfaceCreationContexts = v4;

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", storePageInterfaceCreationContext____pageContextCounter);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__pageInterfaceCreationContexts, "setObject:forKey:", v3, v6);
    --storePageInterfaceCreationContext____pageContextCounter;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pageInterfaceCreationContextForID:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend((id)__pageInterfaceCreationContexts, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removePageInterfaceCreationContextsForIDs:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SPRemoteInterface_removePageInterfaceCreationContextsForIDs___block_invoke;
  v5[3] = &unk_24D3BB2A0;
  v6 = v3;
  v4 = v3;
  spUtils_dispatchSyncToMainThread(v5);

}

uint64_t __63__SPRemoteInterface_removePageInterfaceCreationContextsForIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)__pageInterfaceCreationContexts, "removeObjectsForKeys:", *(_QWORD *)(a1 + 32));
}

- (void)controller:(id)a3 pushInterfaceController:(id)a4 initializationContextID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SPRemoteInterface setNavigatingViewControllerID:](self, "setNavigatingViewControllerID:", v11);
    v17[0] = CFSTR("V");
    v17[1] = CFSTR("n");
    v18[0] = v11;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");

    if (v10)
      -[NSObject setObject:forKey:](v14, "setObject:forKey:", v10, CFSTR("X"));
    v16 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v14, v15);

  }
  else
  {
    wk_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controller:pushInterfaceController:initializationContextID:].cold.1();
  }

}

- (void)controllerPop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SPRemoteInterface setNavigatingViewControllerID:](self, "setNavigatingViewControllerID:", v5);
    v10[0] = CFSTR("V");
    v10[1] = CFSTR("n");
    v11[0] = v5;
    v11[1] = CFSTR(".pop");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v7, v8);

  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controllerPop:].cold.1();
  }

}

- (void)controllerPopToRoot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SPRemoteInterface setNavigatingViewControllerID:](self, "setNavigatingViewControllerID:", v5);
    v10[0] = CFSTR("V");
    v10[1] = CFSTR("n");
    v11[0] = v5;
    v11[1] = CFSTR(".popR");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v7, v8);

  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controllerPopToRoot:].cold.1();
  }

}

- (void)reloadRootControllersWithNames:(id)a3 initializationContextIDs:(id)a4 pageIndex:(int64_t)a5 verticalPaging:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  __CFString *rootViewControllerID;
  __CFString *v13;
  NSString *appClientIdentifier;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  NSString *v29;
  _QWORD v30[5];
  _QWORD v31[6];

  v6 = a6;
  v31[5] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  rootViewControllerID = (__CFString *)self->_rootViewControllerID;
  if (!rootViewControllerID)
    rootViewControllerID = &stru_24D3BD200;
  v13 = rootViewControllerID;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    v15 = appClientIdentifier;
  }
  else
  {
    -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", self->_rootViewControllerID);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_9;
  }
  v30[0] = CFSTR("V");
  v30[1] = CFSTR("rv");
  v31[0] = v13;
  v31[1] = CFSTR("rvr");
  v31[2] = v10;
  v30[2] = CFSTR("rvna");
  v30[3] = CFSTR("rvpidx");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v16;
  v30[4] = CFSTR("rvv");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (v11)
    objc_msgSend(v19, "setObject:forKey:", v11, CFSTR("X"));
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __102__SPRemoteInterface_reloadRootControllersWithNames_initializationContextIDs_pageIndex_verticalPaging___block_invoke;
  v27[3] = &unk_24D3BB358;
  v27[4] = self;
  v28 = v19;
  v29 = v15;
  v20 = v15;
  v21 = v19;
  v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199E8B48](v27);
  v22[2](v22, v23, v24, v25, v26);

LABEL_9:
}

void __102__SPRemoteInterface_reloadRootControllersWithNames_initializationContextIDs_pageIndex_verticalPaging___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendPlist:clientIdentifiers:", v2, v3);

}

- (void)insertPageControllerAtIndexes:(id)a3 withNames:(id)a4 initializationContextIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  __CFString *rootViewControllerID;
  __CFString *v12;
  NSString *appClientIdentifier;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  rootViewControllerID = (__CFString *)self->_rootViewControllerID;
  if (!rootViewControllerID)
    rootViewControllerID = &stru_24D3BD200;
  v12 = rootViewControllerID;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    v14 = appClientIdentifier;
  }
  else
  {
    -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", self->_rootViewControllerID);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_9;
  }
  v19[0] = CFSTR("V");
  v19[1] = CFSTR("rv");
  v20[0] = v12;
  v20[1] = CFSTR("rvi");
  v19[2] = CFSTR("rvna");
  v19[3] = CFSTR("rvidx");
  v20[2] = v9;
  v20[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v10)
    objc_msgSend(v16, "setObject:forKey:", v10, CFSTR("X"));
  v18 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v16, v17);

LABEL_9:
}

- (void)movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  __CFString *rootViewControllerID;
  __CFString *v8;
  NSString *appClientIdentifier;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  rootViewControllerID = (__CFString *)self->_rootViewControllerID;
  if (!rootViewControllerID)
    rootViewControllerID = &stru_24D3BD200;
  v8 = rootViewControllerID;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    v10 = appClientIdentifier;
LABEL_6:
    v18[0] = CFSTR("V");
    v18[1] = CFSTR("rv");
    v19[0] = v8;
    v19[1] = CFSTR("rvm");
    v18[2] = CFSTR("rvidx");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v14, v15);

    goto LABEL_7;
  }
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", self->_rootViewControllerID);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_6;
LABEL_7:

}

- (void)removePageControllerAtIndexes:(id)a3
{
  id v4;
  __CFString *rootViewControllerID;
  __CFString *v6;
  NSString *appClientIdentifier;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  rootViewControllerID = (__CFString *)self->_rootViewControllerID;
  if (!rootViewControllerID)
    rootViewControllerID = &stru_24D3BD200;
  v6 = rootViewControllerID;
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    v8 = appClientIdentifier;
LABEL_6:
    v12[0] = CFSTR("V");
    v12[1] = CFSTR("rv");
    v13[0] = v6;
    v13[1] = CFSTR("rvd");
    v12[2] = CFSTR("rvidx");
    v13[2] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v9, v10);

    goto LABEL_7;
  }
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", self->_rootViewControllerID);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_6;
LABEL_7:

}

- (void)controllerBecomeCurrentPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v17[0] = CFSTR("V");
    v17[1] = CFSTR("n");
    v18[0] = v5;
    v18[1] = CFSTR(".page");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__SPRemoteInterface_controllerBecomeCurrentPage___block_invoke;
    v14[3] = &unk_24D3BB358;
    v14[4] = self;
    v15 = v7;
    v16 = v6;
    v8 = v7;
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199E8B48](v14);
    v9[2](v9, v10, v11, v12, v13);

  }
  else
  {
    wk_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controllerBecomeCurrentPage:].cold.1();
  }

}

void __49__SPRemoteInterface_controllerBecomeCurrentPage___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendPlist:clientIdentifiers:", v2, v3);

}

- (void)controller:(id)a3 presentInterfaceController:(id)a4 initializationContextID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SPRemoteInterface setNavigatingViewControllerID:](self, "setNavigatingViewControllerID:", v11);
    v17[0] = CFSTR("V");
    v17[1] = CFSTR("nm");
    v18[0] = v11;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");

    if (v10)
      -[NSObject setObject:forKey:](v14, "setObject:forKey:", v10, CFSTR("X"));
    v16 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v14, v15);

  }
  else
  {
    wk_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controller:presentInterfaceController:initializationContextID:].cold.1();
  }

}

- (void)controller:(id)a3 presentInterfaceControllers:(id)a4 initializationContextIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SPRemoteInterface setNavigatingViewControllerID:](self, "setNavigatingViewControllerID:", v11);
    v17[0] = CFSTR("V");
    v17[1] = CFSTR("nm");
    v18[0] = v11;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");

    if (v10)
      -[NSObject setObject:forKey:](v14, "setObject:forKey:", v10, CFSTR("X"));
    v16 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v14, v15);

  }
  else
  {
    wk_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controller:presentInterfaceControllers:initializationContextIDs:].cold.1();
  }

}

- (void)controllerDismiss:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SPRemoteInterface setNavigatingViewControllerID:](self, "setNavigatingViewControllerID:", v5);
    v10[0] = CFSTR("V");
    v10[1] = CFSTR("nm");
    v11[0] = v5;
    v11[1] = CFSTR(".pop");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v7, v8);

  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controllerDismiss:].cold.1();
  }

}

- (void)controllerPresentTextInputController:(id)a3 allowedInputMode:(id)a4 suggestions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (objc_msgSend(v10, "count"))
    {
      v19[0] = CFSTR("V");
      v19[1] = CFSTR("nm");
      v20[0] = v11;
      v20[1] = CFSTR("ti");
      v19[2] = CFSTR("tim");
      v19[3] = CFSTR("tI");
      v20[2] = v9;
      v20[3] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17[0] = CFSTR("V");
      v17[1] = CFSTR("nm");
      v18[0] = v11;
      v18[1] = CFSTR("ti");
      v18[2] = v9;
      v17[2] = CFSTR("tim");
      v17[3] = CFSTR("tL");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_textInputSuggestions != 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[3] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    v16 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v13, v15);

  }
  else
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controllerPresentTextInputController:allowedInputMode:suggestions:].cold.1();
  }

}

- (void)controllerDismissTextInputController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10[0] = CFSTR("V");
    v10[1] = CFSTR("nm");
    v11[0] = v5;
    v11[1] = CFSTR(".pop");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v7, v8);

  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controllerDismissTextInputController:].cold.1();
  }

}

- (void)openSystemURL:(id)a3
{
  NSString *appClientIdentifier;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  appClientIdentifier = self->_appClientIdentifier;
  if (appClientIdentifier)
  {
    v6 = appClientIdentifier;
    spUtils_serializeObject(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("ou");
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v8, v9);

  }
}

- (void)controllerPresentAddPassesController:(id)a3 passes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v10 = objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("V");
    v14[1] = CFSTR("nm");
    v15[0] = v8;
    v15[1] = CFSTR("pka");
    v14[2] = CFSTR("pkp");
    v15[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v11, v12);

  }
  else
  {
    wk_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controllerPresentAddPassesController:passes:].cold.1();
  }

}

- (void)controllerDismissAddPassesController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10[0] = CFSTR("V");
    v10[1] = CFSTR("nm");
    v11[0] = v5;
    v11[1] = CFSTR(".pop");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v7, v8);

  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface controllerDismissAddPassesController:].cold.1();
  }

}

- (void)didFinishHandlingActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10[0] = CFSTR("V");
    v10[1] = CFSTR("har");
    v11[0] = v5;
    v11[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v7, v8);

  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface didFinishHandlingActivity:].cold.1();
  }

}

- (void)notificationController:(id)a3 showNotificationInterfaceType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString **v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        v10 = 0;
        goto LABEL_10;
      }
      v9 = SPApplicationNotificationTypeCustom;
    }
    else
    {
      v9 = SPApplicationNotificationTypeDefault;
    }
    v10 = *v9;
LABEL_10:
    v14[0] = CFSTR("V");
    v14[1] = CFSTR("nt");
    v15[0] = v7;
    v15[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v11, v12);

    goto LABEL_11;
  }
  wk_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SPRemoteInterface notificationController:showNotificationInterfaceType:].cold.1();
LABEL_11:

}

- (void)sendWillActivateReplyForController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerID:](self, "_interfaceControllerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface sendSetViewController:key:property:value:clientIdentifiers:](self, "sendSetViewController:key:property:value:clientIdentifiers:", v5, CFSTR("#didActivate"), 0, 0, v7);

  }
  else
  {
    wk_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446722;
      v9 = "-[SPRemoteInterface sendWillActivateReplyForController:]";
      v10 = 1024;
      v11 = 2311;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_215918000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF: interfaceControllerID for controller:%{public}@ not found. Controller may already have been released.", (uint8_t *)&v8, 0x1Cu);
    }
  }

}

- (void)recoverFromMissingIntefaceControllerWithID:(id)a3
{
  id v4;
  NSObject *interfaceControllersAccessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SPRemoteInterface_recoverFromMissingIntefaceControllerWithID___block_invoke;
  block[3] = &unk_24D3BB3D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(interfaceControllersAccessQueue, block);

}

uint64_t __64__SPRemoteInterface_recoverFromMissingIntefaceControllerWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_recoverFromMissingIntefaceControllerWithID:", *(_QWORD *)(a1 + 40));
}

- (void)_inQueue_recoverFromMissingIntefaceControllerWithID:(id)a3
{
  id v4;
  NSMutableSet *missingInterfaceControllers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  dispatch_time_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  SPRemoteInterface *v14;
  id v15;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_missingInterfaceControllers, "containsObject:", v4) & 1) == 0)
  {
    missingInterfaceControllers = self->_missingInterfaceControllers;
    if (!missingInterfaceControllers)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v7 = self->_missingInterfaceControllers;
      self->_missingInterfaceControllers = v6;

      missingInterfaceControllers = self->_missingInterfaceControllers;
    }
    -[NSMutableSet addObject:](missingInterfaceControllers, "addObject:", v4);
    v8 = dispatch_time(0, 30000000000);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __73__SPRemoteInterface__inQueue_recoverFromMissingIntefaceControllerWithID___block_invoke;
    v13 = &unk_24D3BB3D0;
    v14 = self;
    v9 = v4;
    v15 = v9;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], &v10);

    -[SPRemoteInterface _tellApplicationThatInterfaceControllerCantBeFound:](self, "_tellApplicationThatInterfaceControllerCantBeFound:", v9, v10, v11, v12, v13, v14);
  }

}

void __73__SPRemoteInterface__inQueue_recoverFromMissingIntefaceControllerWithID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 56);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__SPRemoteInterface__inQueue_recoverFromMissingIntefaceControllerWithID___block_invoke_2;
  v4[3] = &unk_24D3BB3D0;
  v4[4] = v1;
  v5 = v2;
  dispatch_barrier_async(v3, v4);

}

uint64_t __73__SPRemoteInterface__inQueue_recoverFromMissingIntefaceControllerWithID___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_tellApplicationThatInterfaceControllerCantBeFound:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE72FC0], "defaultService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostPrincipalForPlugInNamed:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject bundleIdentifier](v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionWithIdentifier:gotUnknownInterfaceController:", v7, v3);

  }
  else
  {
    wk_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface _tellApplicationThatInterfaceControllerCantBeFound:].cold.1();
  }

}

- (id)_interfaceControllerWithID:(id)a3
{
  id v4;
  NSObject *interfaceControllersAccessQueue;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[40];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SPRemoteInterface__interfaceControllerWithID___block_invoke;
  block[3] = &unk_24D3BB3F8;
  v14 = &v15;
  block[4] = self;
  v6 = v4;
  v13 = v6;
  dispatch_sync(interfaceControllersAccessQueue, block);
  v7 = (void *)v16[5];
  if (!v7)
  {
    wk_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_interfaceControllersOwners, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPRemoteInterface _interfaceControllerWithID:].cold.1((uint64_t)v6, v9, (uint64_t)v21);
    }

    -[SPRemoteInterface recoverFromMissingIntefaceControllerWithID:](self, "recoverFromMissingIntefaceControllerWithID:", v6);
    v7 = (void *)v16[5];
  }
  v10 = v7;

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __48__SPRemoteInterface__interfaceControllerWithID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_interfaceControllerWithID:(id)a3 performBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *interfaceControllersAccessQueue;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v7)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
    v9 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SPRemoteInterface__interfaceControllerWithID_performBlock___block_invoke;
    block[3] = &unk_24D3BB3F8;
    v16 = &v17;
    block[4] = self;
    v10 = v6;
    v15 = v10;
    dispatch_sync(interfaceControllersAccessQueue, block);
    if (v18[5])
    {
      v7[2](v7);
    }
    else
    {
      v11 = self->_interfaceControllersAccessQueue;
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __61__SPRemoteInterface__interfaceControllerWithID_performBlock___block_invoke_2;
      v12[3] = &unk_24D3BB3D0;
      v12[4] = self;
      v13 = v10;
      dispatch_async(v11, v12);

    }
    _Block_object_dispose(&v17, 8);

  }
}

void __61__SPRemoteInterface__interfaceControllerWithID_performBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __61__SPRemoteInterface__interfaceControllerWithID_performBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_recoverFromMissingIntefaceControllerWithID:", *(_QWORD *)(a1 + 40));
}

- (id)_interfaceControllerID:(id)a3
{
  id v4;
  NSObject *interfaceControllersAccessQueue;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[40];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SPRemoteInterface__interfaceControllerID___block_invoke;
  block[3] = &unk_24D3BB3F8;
  v14 = &v15;
  block[4] = self;
  v6 = v4;
  v13 = v6;
  dispatch_sync(interfaceControllersAccessQueue, block);
  v7 = (void *)v16[5];
  if (!v7)
  {
    wk_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_interfaceControllersOwners, "objectForKeyedSubscript:", v16[5]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPRemoteInterface _interfaceControllerID:].cold.1((uint64_t)v6, v9, (uint64_t)v21);
    }

    v7 = (void *)v16[5];
  }
  v10 = v7;

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __44__SPRemoteInterface__interfaceControllerID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 32), "allKeysForObject:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_interfaceControllerClientIDForControllerID:(id)a3
{
  id v4;
  NSObject *interfaceControllersAccessQueue;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SPRemoteInterface__interfaceControllerClientIDForControllerID___block_invoke;
  block[3] = &unk_24D3BB3F8;
  v13 = &v14;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  dispatch_sync(interfaceControllersAccessQueue, block);
  v7 = (void *)v15[5];
  if (!v7)
  {
    wk_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface _interfaceControllerClientIDForControllerID:].cold.1();

    v7 = (void *)v15[5];
  }
  v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __65__SPRemoteInterface__interfaceControllerClientIDForControllerID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_interfaceControllerIDsForClientID:(id)a3
{
  id v4;
  NSObject *interfaceControllersAccessQueue;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SPRemoteInterface__interfaceControllerIDsForClientID___block_invoke;
  block[3] = &unk_24D3BB3F8;
  v13 = &v14;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  dispatch_sync(interfaceControllersAccessQueue, block);
  v7 = (void *)v15[5];
  if (!v7)
  {
    wk_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v21 = "-[SPRemoteInterface _interfaceControllerIDsForClientID:]";
      v22 = 1024;
      v23 = 2446;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_215918000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF: interfaceCotrollersIDs for clientIdentifier:%{public}@ not found", buf, 0x1Cu);
    }

    v7 = (void *)v15[5];
  }
  v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __56__SPRemoteInterface__interfaceControllerIDsForClientID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 40), "allKeysForObject:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_registerInterfaceController:(id)a3 interfaceControllerID:(id)a4 interfaceControllerClientID:(id)a5 applicationRootController:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v6 = a6;
  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  wk_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136447234;
    v15 = "-[SPRemoteInterface _registerInterfaceController:interfaceControllerID:interfaceControllerClientID:application"
          "RootController:]";
    v16 = 1024;
    v17 = 2458;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_215918000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: registering controller %{public}@ with id %{public}@ and clientIdentifier %{public}@", (uint8_t *)&v14, 0x30u);
  }

  if (v10)
  {
    -[NSMutableDictionary setObject:forKey:](self->_interfaceControllers, "setObject:forKey:", v10, v11);
    if (v6)
      objc_storeStrong((id *)&self->_rootViewControllerID, a4);
  }
  if (v11)
    -[NSMutableDictionary setObject:forKey:](self->_interfaceControllersOwners, "setObject:forKey:", v12, v11);

}

- (void)_deregisterInterfaceControllerID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *interfaceControllersAccessQueue;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_interfaceControllers, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_interfaceControllersOwners, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136447234;
    v17 = "-[SPRemoteInterface _deregisterInterfaceControllerID:]";
    v18 = 1024;
    v19 = 2501;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v4;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: deregistering controller %{public}@ with id %{public}@ and clientIdentifier %{public}@", buf, 0x30u);

  }
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__SPRemoteInterface__deregisterInterfaceControllerID___block_invoke;
  v14[3] = &unk_24D3BB2A0;
  v9 = v4;
  v15 = v9;
  spUtils_dispatchAsyncToMainThread(v14);
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __54__SPRemoteInterface__deregisterInterfaceControllerID___block_invoke_2;
  block[3] = &unk_24D3BB3D0;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_barrier_async(interfaceControllersAccessQueue, block);

}

uint64_t __54__SPRemoteInterface__deregisterInterfaceControllerID___block_invoke(uint64_t a1)
{
  objc_msgSend((id)__recordedValues, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  return +[SPRemoteInterface clearStorageForController:](SPRemoteInterface, "clearStorageForController:", *(_QWORD *)(a1 + 32));
}

void __54__SPRemoteInterface__deregisterInterfaceControllerID___block_invoke_2(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isEqualToString:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if ((v2 & 1) != 0)
    v4 = 0;
  else
    v4 = *(void **)(v3 + 64);
  objc_storeStrong((id *)(v3 + 64), v4);
}

- (id)_allInterfaceControllers
{
  NSObject *interfaceControllersAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SPRemoteInterface__allInterfaceControllers__block_invoke;
  v5[3] = &unk_24D3BB420;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(interfaceControllersAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__SPRemoteInterface__allInterfaceControllers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "interfaceControllers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_dumpInterfaceDictionary
{
  NSObject *interfaceControllersAccessQueue;
  _QWORD block[5];

  interfaceControllersAccessQueue = self->_interfaceControllersAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke;
  block[3] = &unk_24D3BB2A0;
  block[4] = self;
  dispatch_sync(interfaceControllersAccessQueue, block);
}

void __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v1 = a1 + 32;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  v15 = v1;
  if (v2 != objc_msgSend(*(id *)(*(_QWORD *)v1 + 40), "count"))
  {
    wk_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke_cold_2(v1, v3);

  }
  wk_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke_cold_1(v1, v4);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *(id *)(*(_QWORD *)v1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        wk_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(*(_QWORD *)v15 + 32), "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)v15 + 40), "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136447490;
          v21 = "-[SPRemoteInterface _dumpInterfaceDictionary]_block_invoke";
          v22 = 1024;
          v23 = 2533;
          v24 = 1024;
          v25 = v8;
          v26 = 2114;
          v27 = v11;
          v28 = 2114;
          v29 = v13;
          v30 = 2114;
          v31 = v14;
          _os_log_error_impl(&dword_215918000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%d: #%d key=%{public}@ interfaceController=%{public}@ interfaceControllersOwner=%{public}@", buf, 0x36u);

          ++v8;
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v32, 16);
    }
    while (v7);
  }

}

- (void)removeInterfaceControllersForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  SPRemoteInterface *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPRemoteInterface _interfaceControllerIDsForClientID:](self, "_interfaceControllerIDsForClientID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  wk_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v26 = "-[SPRemoteInterface removeInterfaceControllersForClient:]";
    v27 = 1024;
    v28 = 2558;
    v29 = 2114;
    v30 = v4;
    v31 = 2114;
    v32 = v5;
    _os_log_impl(&dword_215918000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: !!! Release all controllers - clientIdentifier:%{public}@, interfaceControllerIDs:%{public}@", buf, 0x26u);
  }
  v15 = v4;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[SPRemoteInterface _interfaceControllerWithID:](self, "_interfaceControllerWithID:", v12, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __57__SPRemoteInterface_removeInterfaceControllersForClient___block_invoke;
          v16[3] = &unk_24D3BB358;
          v17 = v13;
          v18 = self;
          v19 = v12;
          +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

uint64_t __57__SPRemoteInterface_removeInterfaceControllersForClient___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didDeactivate");
  return objc_msgSend(*(id *)(a1 + 40), "_deregisterInterfaceControllerID:", *(_QWORD *)(a1 + 48));
}

+ (id)controller:(id)a3 setupProperties:(id)a4 viewControllerID:(id)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7 classForType:(void *)a8
{
  NSString *v11;
  id v12;
  uint64_t (*v13)(NSString *);
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  BOOL v24;
  uint64_t v25;
  NSObject *v26;
  SEL v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  NSString *v34;
  NSObject *v35;
  const char *v36;
  uint32_t v37;
  uint64_t v38;
  __int128 v40;
  id v41;
  uint64_t (*v42)(NSString *);
  id v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  NSString *v58;
  __int16 v59;
  NSString *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v11 = (NSString *)a3;
  v12 = a4;
  v45 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (uint64_t (*)(NSString *))SPInterfaceObjectWithType;
  v47 = 0u;
  v48 = 0u;
  if (a8)
    v13 = (uint64_t (*)(NSString *))a8;
  v42 = v13;
  v49 = 0uLL;
  v50 = 0uLL;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v14)
  {
    v16 = v14;
    v17 = 0;
    v18 = *(_QWORD *)v48;
    *(_QWORD *)&v15 = 136447234;
    v40 = v15;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v19);
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("property"), v40);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("type"));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (NSString *)v22;
        if (v21)
          v24 = v22 == 0;
        else
          v24 = 1;
        if (!v24)
        {
          NSSelectorFromString(v21);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            wk_default_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
              v53 = 1024;
              v54 = 2679;
              v55 = 2114;
              v56 = v21;
              v57 = 2114;
              v58 = v11;
              _os_log_error_impl(&dword_215918000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%d: Unknown property in Interface description ('%{public}@') for controller %{public}@", buf, 0x26u);
            }
            v25 = v17;
            goto LABEL_26;
          }
          v25 = v17 + 1;
          v26 = objc_msgSend(objc_alloc((Class)v42(v23)), "_initWithInterfaceProperty:viewControllerID:propertyIndex:tableIndex:rowIndex:", v21, v45, v17, a6, a7);
          -[NSObject _setupWithDescription:forController:](v26, "_setupWithDescription:forController:", v20, v11);
          if (v26)
          {
            v27 = SetterForProperty(v21);
            if (v27)
            {
              v28 = v27;
              if ((objc_msgSend(MEMORY[0x24BEDCDF0], "instancesRespondToSelector:", v27) & 1) != 0
                || (objc_msgSend(WKInterfaceControllerClass(), "instancesRespondToSelector:", v28) & 1) != 0)
              {
                wk_default_log();
                v29 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  goto LABEL_18;
                NSStringFromSelector(v28);
                v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
                v53 = 1024;
                v54 = 2670;
                v55 = 2114;
                v56 = v34;
                v35 = v29;
                v36 = "%{public}s:%d: Cannot specify setter '%{public}@' for properties of NSObject or WKInterfaceController";
                v37 = 28;
LABEL_34:
                _os_log_error_impl(&dword_215918000, v35, OS_LOG_TYPE_ERROR, v36, buf, v37);

                goto LABEL_18;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[NSString performSelector:withObject:](v11, "performSelector:withObject:", v28, v26);
                objc_msgSend(v41, "addObject:", v26);
              }
              else
              {
                wk_default_log();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(v28);
                  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136446978;
                  v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
                  v53 = 1024;
                  v54 = 2667;
                  v55 = 2114;
                  v56 = v11;
                  v57 = 2114;
                  v58 = v34;
                  v35 = v29;
                  v36 = "%{public}s:%d: Controller %{public}@ does not implement setter '%{public}@'";
                  v37 = 38;
                  goto LABEL_34;
                }
LABEL_18:

              }
LABEL_26:

              v17 = v25;
              goto LABEL_27;
            }
            wk_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
LABEL_25:

              goto LABEL_26;
            }
            *(_DWORD *)buf = 136446722;
            v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
            v53 = 1024;
            v54 = 2673;
            v55 = 2114;
            v56 = v21;
            v31 = v30;
            v32 = "%{public}s:%d: Invalid setter name for property '%{public}@'";
            v33 = 28;
          }
          else
          {
            wk_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              goto LABEL_25;
            *(_DWORD *)buf = v40;
            v52 = "+[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:]";
            v53 = 1024;
            v54 = 2676;
            v55 = 2114;
            v56 = v23;
            v57 = 2114;
            v58 = v21;
            v59 = 2114;
            v60 = v11;
            v31 = v30;
            v32 = "%{public}s:%d: Unable to instantiate object of type '%{public}@' for property %{public}@ in controller %{public}@";
            v33 = 48;
          }
          _os_log_error_impl(&dword_215918000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
          goto LABEL_25;
        }
LABEL_27:

        ++v19;
      }
      while (v16 != v19);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      v16 = v38;
    }
    while (v38);
  }

  return v41;
}

- (void)receiveProtoData:(id)a3 fromIdentifier:(id)a4
{
  __CFString *v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = -[__CFString length](v5, "length");
  wk_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("...");
    v12 = 136447234;
    v13 = "-[SPRemoteInterface receiveProtoData:fromIdentifier:]";
    v14 = 1024;
    if (v7 < 0x10)
      v9 = v5;
    v15 = 2689;
    v16 = 2114;
    v17 = v6;
    v18 = 2048;
    v19 = v7;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_215918000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin clientIdentifier=%{public}@ len=%lu data=%{public}@", (uint8_t *)&v12, 0x30u);
  }

  +[SPProtoSerializer objectWithData:](SPProtoSerializer, "objectWithData:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleCacheMessage:", v10);

  }
}

- (void)receiveData:(id)a3 fromIdentifier:(id)a4
{
  id v6;
  id v7;
  SPProtoSockPuppetPlist *v8;
  NSObject *v9;

  v6 = a4;
  v7 = a3;
  kdebug_trace();
  v8 = -[SPProtoSockPuppetPlist initWithData:]([SPProtoSockPuppetPlist alloc], "initWithData:", v7);

  if (v8)
  {
    -[SPRemoteInterface handleProtoPlist:fromIdentifier:](self, "handleProtoPlist:fromIdentifier:", v8, v6);
  }
  else
  {
    wk_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface receiveData:fromIdentifier:].cold.1();

  }
}

- (void)handleProtoPlist:(id)a3 fromIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SPProtoSerializer dictionaryWithSPPlist:](SPProtoSerializer, "dictionaryWithSPPlist:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "data");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject length](v9, "length");
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("V"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v15 = 136447235;
      v16 = "-[SPRemoteInterface handleProtoPlist:fromIdentifier:]";
      v14 = CFSTR("...");
      v17 = 1024;
      v18 = 2749;
      if (v10 < 0x10)
        v14 = (const __CFString *)v9;
      v19 = 2114;
      v20 = v12;
      v21 = 2048;
      v22 = v10;
      v23 = 2113;
      v24 = v14;
      _os_log_debug_impl(&dword_215918000, v11, OS_LOG_TYPE_DEBUG, "%{public}s:%d: ComF:->Plugin vcID=%{public}@ len=%lu data=%{private}@", (uint8_t *)&v15, 0x30u);

    }
    -[SPRemoteInterface handlePlistDictionary:fromIdentifier:](self, "handlePlistDictionary:fromIdentifier:", v8, v7);
  }
  else
  {
    wk_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface handleProtoPlist:fromIdentifier:].cold.1();
  }

}

- (void)handlePlistDictionary:(id)a3 fromIdentifier:(id)a4
{
  id v6;
  id v7;
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
  char v19;
  void *v20;
  NSString *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  dispatch_time_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  char isKindOfClass;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  char v64;
  void *v65;
  char v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  uint64_t v76;
  SEL v77;
  NSObject *v78;
  NSObject *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  NSObject *v87;
  int v88;
  id v89;
  int v90;
  uint64_t v91;
  void *v92;
  NSString *v93;
  id v94;
  void *v95;
  _QWORD v96[5];
  id v97;
  _QWORD v98[5];
  _QWORD v99[5];
  id v100;
  id v101;
  _QWORD v102[5];
  id v103;
  _QWORD v104[4];
  NSString *v105;
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  id v114;
  id v115;
  id v116;
  _BYTE *v117;
  char v118;
  char v119;
  _QWORD v120[4];
  id v121;
  id v122;
  uint64_t v123;
  _QWORD block[4];
  id v125;
  SPRemoteInterface *v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD v129[4];
  id v130;
  SPRemoteInterface *v131;
  id v132;
  _BYTE buf[38];
  __int16 v134;
  void *v135;
  __int16 v136;
  void *v137;
  void *v138;
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[2];
  _QWORD v142[5];

  v142[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("!"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("C")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("K"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("P"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("X"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("I"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:](self, "createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:", v11, v12, v13, v14, v15, 0, v7);

LABEL_5:
LABEL_49:

LABEL_126:
        goto LABEL_127;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("R")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        wk_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "-[SPRemoteInterface handlePlistDictionary:fromIdentifier:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2780;
          *(_WORD *)&buf[18] = 2114;
          *(_QWORD *)&buf[20] = v7;
          *(_WORD *)&buf[28] = 2114;
          *(_QWORD *)&buf[30] = v22;
          _os_log_impl(&dword_215918000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: !!! Release controller - clientIdentifier:%{public}@, viewControllerIdentifier:%{public}@", buf, 0x26u);
        }

        -[SPRemoteInterface _deregisterInterfaceControllerID:](self, "_deregisterInterfaceControllerID:", v22);
        goto LABEL_126;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("A")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          -[SPRemoteInterface activateViewController:clientIdentifier:](self, "activateViewController:clientIdentifier:", v11, v7);
          goto LABEL_49;
        }
        wk_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.4();
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("D")))
        {
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("N")))
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPRemoteInterface receiveNavigationReply:clientIdentifier:](self, "receiveNavigationReply:clientIdentifier:", v11, v7);
            goto LABEL_49;
          }
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("an")))
          {
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("aua")))
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ua"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (v56)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  spUtils_allowedClassesForUserActivity();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  spUtils_deserializeObject(v56, v57);
                  v58 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v58 = v56;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  wk_default_log();
                  v79 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                    -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.6();

                }
                objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("uai"));
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v129[0] = MEMORY[0x24BDAC760];
                v129[1] = 3221225472;
                v129[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke;
                v129[3] = &unk_24D3BB358;
                v130 = v6;
                v131 = self;
                v132 = v80;
                v81 = v80;
                +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v129);

              }
            }
            goto LABEL_126;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ni"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ai"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("au"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPRemoteInterface rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:](self, "rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:", v14, v12, v11, v13, v7, 0);
          goto LABEL_5;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          -[SPRemoteInterface deactivateViewController:clientIdentifier:](self, "deactivateViewController:clientIdentifier:", v11, v7);
          goto LABEL_49;
        }
        wk_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.5();
      }

      goto LABEL_49;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPRemoteInterface _interfaceControllerWithID:](self, "_interfaceControllerWithID:", v95);
    v94 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("a"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17
      && (-[SPRemoteInterface navigatingViewControllerID](self, "navigatingViewControllerID"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v95, "isEqualToString:", v18),
          v18,
          v17,
          (v19 & 1) == 0))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("a"));
      v93 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](v93, "isEqualToString:", CFSTR(".Marco")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR(".idx"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v25, "integerValue");

        objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR(".tr"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v26, "BOOLValue");

        objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR(".rs"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "integerValue");

        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPRemoteInterface _fillDataWithRandom:length:](self, "_fillDataWithRandom:length:", v29, v28);
        v141[0] = CFSTR(".idx");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v91);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v141[1] = CFSTR(".pl");
        v142[0] = v30;
        v142[1] = v29;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v142, v141, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[SPRemoteInterface _interfaceControllerClientIDForControllerID:](self, "_interfaceControllerClientIDForControllerID:", v95);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v139[0] = CFSTR("V");
        v139[1] = CFSTR("k");
        v140[0] = v95;
        v140[1] = CFSTR(".Polo");
        v139[2] = CFSTR("v");
        v140[2] = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v140, v139, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = v32;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v138, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPRemoteInterface sendPlist:clientIdentifiers:](self, "sendPlist:clientIdentifiers:", v33, v34);

        if (v90)
        {
          v35 = dispatch_time(0, 5000000);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_2;
          block[3] = &unk_24D3BB468;
          v127 = v91;
          v128 = v28;
          v125 = v95;
          v126 = self;
          dispatch_after(v35, MEMORY[0x24BDAC9B8], block);

        }
      }
      else if (-[NSString isEqualToString:](v93, "isEqualToString:", CFSTR(".select")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("v"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "integerValue");

        v120[0] = MEMORY[0x24BDAC760];
        v120[1] = 3221225472;
        v120[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_3;
        v120[3] = &unk_24D3BB490;
        v94 = v94;
        v121 = v94;
        v122 = v38;
        v123 = v40;
        v41 = v38;
        +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v120);

      }
      else if (-[NSString isEqualToString:](v93, "isEqualToString:", CFSTR(".segue")))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        *(_QWORD *)&buf[24] = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("v"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("v"));
        if ((isKindOfClass & 1) != 0)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
        }
        else
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "valueForKey:", v60);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "objectAtIndexedSubscript:", 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "integerValue");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v62;

          objc_msgSend(v59, "objectAtIndexedSubscript:", 2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("type"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("present"));

        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("destination"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v66 = objc_opt_isKindOfClass();

        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("identifier"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v112[0] = MEMORY[0x24BDAC760];
        v112[1] = 3221225472;
        v112[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_4;
        v112[3] = &unk_24D3BB4B8;
        v68 = v49;
        v113 = v68;
        v118 = v66 & 1;
        v94 = v94;
        v114 = v94;
        v69 = v67;
        v115 = v69;
        v117 = buf;
        v119 = v64;
        v70 = v48;
        v116 = v70;
        +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v112);

        _Block_object_dispose(buf, 8);
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("v"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v50;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v50, "count") >= 2)
        {
          objc_msgSend(v50, "objectAtIndex:", 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectAtIndex:", 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "integerValue");

          if ((unint64_t)objc_msgSend(v50, "count") < 3)
          {
            v54 = 0;
          }
          else
          {
            objc_msgSend(v50, "objectAtIndex:", 2);
            v54 = (id)objc_claimAutoreleasedReturnValue();
          }

          v111 = v54;
          objc_msgSend(v94, "valueForKey:", v51);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v74;
          if (v74 && (v53 & 0x8000000000000000) == 0 && v53 < objc_msgSend(v74, "numberOfRows"))
          {
            objc_msgSend(v75, "rowControllerAtIndex:", v53);
            v76 = objc_claimAutoreleasedReturnValue();

            v94 = (id)v76;
          }

        }
        else
        {
          v54 = v50;
        }
        if (!-[NSString isEqualToString:](v93, "isEqualToString:", CFSTR(".pickerSettle"))
          && !-[NSString isEqualToString:](v93, "isEqualToString:", CFSTR(".pickerFocus"))
          && !-[NSString isEqualToString:](v93, "isEqualToString:", CFSTR(".pickerClearFocus")))
        {
          v77 = NSSelectorFromString(v93);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (+[WKInterfaceController instancesRespondToSelector:](WKInterfaceController, "instancesRespondToSelector:", v77) & 1) == 0)
          {
            objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", v77);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "setTarget:", v94);
            objc_msgSend(v83, "setSelector:", v77);
            wk_default_log();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136447490;
              *(_QWORD *)&buf[4] = "-[SPRemoteInterface handlePlistDictionary:fromIdentifier:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 3057;
              *(_WORD *)&buf[18] = 2114;
              *(_QWORD *)&buf[20] = v94;
              *(_WORD *)&buf[28] = 2114;
              *(_QWORD *)&buf[30] = v93;
              v134 = 2114;
              v135 = v82;
              v136 = 2114;
              v137 = v83;
              _os_log_impl(&dword_215918000, v84, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: controller controller=%{public}@ action=%{public}@ methodSignature=%{public}@ invocation=%{public}@", buf, 0x3Au);
            }

            if (v54 && (unint64_t)objc_msgSend(v82, "numberOfArguments") >= 3)
            {
              v85 = (const char *)objc_msgSend(objc_retainAutorelease(v82), "getArgumentTypeAtIndex:", 2);
              if (!strcmp(v85, "@"))
              {
                objc_msgSend(v83, "setArgument:atIndex:", &v111, 2);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (!strcmp(v85, "B"))
                  {
                    buf[0] = objc_msgSend(v111, "BOOLValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "q"))
                  {
                    *(_QWORD *)buf = objc_msgSend(v111, "integerValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "Q"))
                  {
                    *(_QWORD *)buf = objc_msgSend(v111, "unsignedIntegerValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "c"))
                  {
                    buf[0] = objc_msgSend(v111, "charValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "C"))
                  {
                    buf[0] = objc_msgSend(v111, "unsignedCharValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "s"))
                  {
                    *(_WORD *)buf = objc_msgSend(v111, "shortValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "S"))
                  {
                    *(_WORD *)buf = objc_msgSend(v111, "unsignedShortValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "i"))
                  {
                    *(_DWORD *)buf = objc_msgSend(v111, "intValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "I"))
                  {
                    *(_DWORD *)buf = objc_msgSend(v111, "unsignedIntValue");
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "f"))
                  {
                    objc_msgSend(v111, "floatValue");
                    *(_DWORD *)buf = v88;
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                  else if (!strcmp(v85, "d"))
                  {
                    objc_msgSend(v111, "doubleValue");
                    *(_QWORD *)buf = v86;
                    objc_msgSend(v83, "setArgument:atIndex:", buf, 2);
                  }
                }
                else
                {
                  wk_default_log();
                  v87 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                    -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.3();

                }
              }
            }
            v109[0] = MEMORY[0x24BDAC760];
            v109[1] = 3221225472;
            v109[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_374;
            v109[3] = &unk_24D3BB2A0;
            v110 = v83;
            v89 = v83;
            +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v109);

            v54 = v111;
          }
          else if (!-[NSString isEqualToString:](v93, "isEqualToString:", CFSTR(".Marco")))
          {
            wk_default_log();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.2();

          }
        }

      }
      v107[0] = MEMORY[0x24BDAC760];
      v107[1] = 3221225472;
      v107[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_375;
      v107[3] = &unk_24D3BB2A0;
      v108 = v95;
      +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v107);

      v21 = v93;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("k"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_125:

        goto LABEL_126;
      }
      v104[0] = MEMORY[0x24BDAC760];
      v104[1] = 3221225472;
      v104[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_2_376;
      v104[3] = &unk_24D3BB3D0;
      v94 = v94;
      v105 = (NSString *)v94;
      v106 = v6;
      +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v104);

      v21 = v105;
    }

    goto LABEL_125;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v102[0] = MEMORY[0x24BDAC760];
    v102[1] = 3221225472;
    v102[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_3_377;
    v102[3] = &unk_24D3BB3D0;
    v102[4] = self;
    v103 = v6;
    spUtils_dispatchAsyncToMainThread(v102);

  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v99[0] = MEMORY[0x24BDAC760];
      v99[1] = 3221225472;
      v99[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_4_378;
      v99[3] = &unk_24D3BB358;
      v99[4] = self;
      v100 = v6;
      v101 = v7;
      spUtils_dispatchAsyncToMainThread(v99);

    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pkf"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        v98[0] = MEMORY[0x24BDAC760];
        v98[1] = 3221225472;
        v98[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_5;
        v98[3] = &unk_24D3BB2A0;
        v98[4] = self;
        spUtils_dispatchAsyncToMainThread(v98);
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lm"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lm"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%@"), v43);

          wk_default_log();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            -[SPRemoteInterface handlePlistDictionary:fromIdentifier:].cold.1(v6, (uint64_t)CFSTR("lm"), v44);

        }
        else
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cc"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
          {
            v96[0] = MEMORY[0x24BDAC760];
            v96[1] = 3221225472;
            v96[2] = __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_379;
            v96[3] = &unk_24D3BB3D0;
            v96[4] = self;
            v97 = v6;
            spUtils_dispatchAsyncToMainThread(v96);

          }
          else
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cd"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              -[SPRemoteInterface activeComplicationsConnections](self, "activeComplicationsConnections");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = objc_msgSend(v72, "containsObject:", v7);

              if ((v73 & 1) == 0)
              {
                -[SPRemoteInterface applicationDidFinishConnecting:](self, "applicationDidFinishConnecting:", v7);
                -[SPRemoteInterface dataInterfaceDidBecomeActive:](self, "dataInterfaceDidBecomeActive:", v7);
              }
              -[SPRemoteInterface getComplicationData:](self, "getComplicationData:", v7);
            }
          }
        }
      }
    }
  }
LABEL_127:

}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("V"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_interfaceControllerWithID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleUserActivity:", *(_QWORD *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v2, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_interfaceControllerWithID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPRemoteInterface didFinishHandlingActivity:](SPRemoteInterface, "didFinishHandlingActivity:", v10);

}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = *(_QWORD *)(a1 + 32);
  v5[0] = CFSTR("V");
  v5[1] = CFSTR(".idx");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  v5[2] = CFSTR(".rs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_requestTimingData:", v4);
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "valueForKey:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "table:didSelectRowAtIndex:", v3, a1[6]);

}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v2 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    if (v2)
    {
      objc_msgSend(v3, "contextsForSegueWithIdentifier:inTable:rowIndex:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = (void *)v6;
      v13 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v3, "contextForSegueWithIdentifier:inTable:rowIndex:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
    {
      objc_msgSend(v3, "contextsForSegueWithIdentifier:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(v3, "contextForSegueWithIdentifier:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v8;
  v7 = 0;
LABEL_10:
  v9 = *(unsigned __int8 *)(a1 + 72);
  if (*(_BYTE *)(a1 + 73))
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("destination"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      +[SPRemoteInterface controller:presentInterfaceControllers:contexts:](SPRemoteInterface, "controller:presentInterfaceControllers:contexts:", v10, v11, v7);
    else
      +[SPRemoteInterface controller:presentInterfaceController:context:](SPRemoteInterface, "controller:presentInterfaceController:context:", v10, v11, v13);
    goto LABEL_16;
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("destination"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPRemoteInterface controller:pushInterfaceController:context:](SPRemoteInterface, "controller:pushInterfaceController:context:", v12, v11, v13);
LABEL_16:

  }
}

uint64_t __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_374(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

uint64_t __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_375(uint64_t a1)
{
  return +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", *(_QWORD *)(a1 + 32), CFSTR(".null"), &stru_24D3BD200, 0);
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_2_376(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("v"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("k"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, v3);

}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_3_377(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("tI"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    if (objc_msgSend(v8, "count"))
      v3 = v8;
    else
      v3 = 0;
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = 0;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 96);
    *(_QWORD *)(v6 + 96) = 0;

  }
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_4_378(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("tL"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = v4;
    else
      v5 = (void *)MEMORY[0x24BDBD1A8];
    v10 = CFSTR("tS");
    v11[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendPlist:clientIdentifiers:", v6, v8);

  }
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_5(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "addPassesCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addPassesCompletion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setAddPassesCompletion:", 0);
  }
}

void __58__SPRemoteInterface_handlePlistDictionary_fromIdentifier___block_invoke_379(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v4 = *(void **)(v3 + 8);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cc"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteInterface:setComplicationDataClassName:", v3, v5);

  }
}

- (void)createViewController:(id)a3 className:(id)a4 properties:(id)a5 contextID:(id)a6 info:(id)a7 gestureDescriptions:(id)a8 clientIdentifier:(id)a9
{
  id v15;
  NSString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  Class v22;
  id v23;
  id v24;
  NSString *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  Class v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  SPRemoteInterface *v38;
  id v39;
  id v40;
  NSString *v41;
  id v42;
  id v43;

  v15 = a3;
  v16 = (NSString *)a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (!WKInterfaceControllerClass()
    || (v22 = NSClassFromString(v16),
        !-[objc_class isSubclassOfClass:](v22, "isSubclassOfClass:", WKInterfaceControllerClass())))
  {
    v30 = NSClassFromString(v16);
    wk_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:].cold.4();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not a subclass of WKInterfaceController"), v16);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Condition failed:\"%s\". %@"), "NO", objc_claimAutoreleasedReturnValue());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      wk_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:].cold.3();
    }
    else
    {
      if (v32)
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:].cold.2();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Couldn't instantiate class %@"), v16);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Condition failed:\"%s\". %@"), "NO", objc_claimAutoreleasedReturnValue());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      wk_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:].cold.1();
    }

    __abort_with_reason(objc_msgSend(objc_retainAutorelease(v33), "UTF8String"));
    exit(1);
  }
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke;
  v35[3] = &unk_24D3BB5F0;
  v36 = v19;
  v37 = v18;
  v38 = self;
  v39 = v21;
  v40 = v15;
  v41 = v16;
  v42 = v17;
  v43 = v20;
  v23 = v20;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v21;
  v28 = v18;
  v29 = v19;
  +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v35);

}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  char v44;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("s"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((unint64_t)objc_msgSend(v2, "count") < 4)
  {
    v7 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;
    objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

  }
  v17 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  v19 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(a1 + 48);
  if (v17 < 0)
    objc_msgSend(v18, "pageInterfaceCreationContextForID:", v19);
  else
    objc_msgSend(v18, "interfaceCreationContextForID:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_2;
  v32[3] = &unk_24D3BB558;
  v33 = *(id *)(a1 + 56);
  v34 = *(id *)(a1 + 64);
  v35 = *(id *)(a1 + 72);
  v22 = v20;
  v36 = v22;
  v40 = v7;
  v41 = v10;
  v42 = v13;
  v43 = v16;
  v37 = *(id *)(a1 + 80);
  v23 = *(id *)(a1 + 88);
  v24 = *(_QWORD *)(a1 + 48);
  v38 = v23;
  v39 = v24;
  v44 = v4;
  v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199E8B48](v32);
  if (__pageInterfaceCreationContexts_block_invoke_2_onceToken != -1)
    dispatch_once(&__pageInterfaceCreationContexts_block_invoke_2_onceToken, &__block_literal_global_387);
  if (-[objc_class isSubclassOfClass:](NSClassFromString(*(NSString **)(a1 + 72)), "isSubclassOfClass:", __pageInterfaceCreationContexts_block_invoke_2___wkUserNotificationInterfaceControllerClass))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ni"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = *(void **)(a1 + 48);
      v29[0] = v21;
      v29[1] = 3221225472;
      v29[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_390;
      v29[3] = &unk_24D3BB5C8;
      v30 = v26;
      v31 = v25;
      objc_msgSend(v28, "fetchNotificationForNotificationID:completion:", v30, v29);

    }
    else
    {
      v25[2](v25, v4, 0, 0, 0, 0);
    }

  }
  else
  {
    v25[2](v25, v4, 0, 0, 0, 0);
  }

}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, int a6)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t *v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  wk_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136447234;
    v45 = "-[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentif"
          "ier:]_block_invoke_2";
    v46 = 1024;
    v47 = 3197;
    v48 = 2114;
    v49 = v14;
    v50 = 2114;
    v51 = v15;
    v52 = 2114;
    v53 = v16;
    _os_log_impl(&dword_215918000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: !!! Create controller - clientIdentifier:%{public}@, viewControllerIdentifier:%{public}@, className:%{public}@", buf, 0x30u);
  }

  v17 = *(void **)(a1 + 40);
  v18 = *(void **)(a1 + 48);
  v20 = *(void **)(a1 + 56);
  v19 = *(void **)(a1 + 64);
  v21 = *(void **)(a1 + 72);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_382;
  v29[3] = &unk_24D3BB508;
  v22 = v12;
  v30 = v22;
  v23 = v10;
  v31 = v23;
  v24 = v11;
  v36 = &v38;
  v25 = *(_QWORD *)(a1 + 80);
  v32 = v24;
  v33 = v25;
  v34 = *(id *)(a1 + 40);
  v35 = *(id *)(a1 + 32);
  v37 = *(_BYTE *)(a1 + 120);
  v26 = _WKInterfaceControllerCreateClass(v18, v20, v17, v19, v21, v29, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  if (a6)
  {
    objc_msgSend(*(id *)(a1 + 80), "extensionDidBeginNotificationUICreation");
    v27 = (void *)v39[5];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_3;
    v28[3] = &unk_24D3BB530;
    v28[4] = *(_QWORD *)(a1 + 80);
    v28[5] = &v38;
    objc_msgSend(v27, "_didReceiveNotification:remoteNotification:localNotification:withCompletion:", v22, v23, v24, v28);
  }

  _Block_object_dispose(&v38, 8);
}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_382(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  char v13;

  v4 = a2;
  if (*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a2);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  v7 = *(NSObject **)(v5 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_2_383;
  block[3] = &unk_24D3BB4E0;
  block[4] = v5;
  v10 = v4;
  v11 = v6;
  v12 = *(id *)(a1 + 72);
  v13 = *(_BYTE *)(a1 + 88);
  v8 = v4;
  dispatch_barrier_sync(v7, block);
  objc_msgSend(v8, "didRegisterWithRemoteInterface");

}

uint64_t __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_2_383(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerInterfaceController:interfaceControllerID:interfaceControllerClientID:applicationRootController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

uint64_t __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  +[SPRemoteInterface notificationController:showNotificationInterfaceType:](SPRemoteInterface, "notificationController:showNotificationInterfaceType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  return objc_msgSend(*(id *)(a1 + 32), "extensionDidEndNotificationUICreation");
}

Class __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_4()
{
  Class result;

  result = NSClassFromString(CFSTR("WKUserNotificationInterfaceController"));
  __pageInterfaceCreationContexts_block_invoke_2___wkUserNotificationInterfaceControllerClass = (uint64_t)result;
  return result;
}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_390(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_390_cold_1();

  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_391;
  v18[3] = &unk_24D3BB5A0;
  v14 = *(id *)(a1 + 40);
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = v14;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  spUtils_dispatchAsyncToMainThread(v18);

}

uint64_t __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_391(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1[7] + 16))(a1[7], 0, a1[4], a1[5], a1[6], 1);
}

- (void)activateViewController:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __61__SPRemoteInterface_activateViewController_clientIdentifier___block_invoke;
    v13[3] = &unk_24D3BB358;
    v13[4] = self;
    v9 = v6;
    v14 = v9;
    v15 = v7;
    +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v13);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __61__SPRemoteInterface_activateViewController_clientIdentifier___block_invoke_2;
    v11[3] = &unk_24D3BB2A0;
    v12 = v9;
    +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v11);

  }
  else
  {
    wk_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface activateViewController:clientIdentifier:].cold.1();

  }
}

uint64_t __61__SPRemoteInterface_activateViewController_clientIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateViewController:clientIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __61__SPRemoteInterface_activateViewController_clientIdentifier___block_invoke_2(uint64_t a1)
{
  return +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", *(_QWORD *)(a1 + 32), CFSTR(".null"), &stru_24D3BD200, 0);
}

- (void)_activateViewController:(id)a3 clientIdentifier:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SPRemoteInterface _interfaceControllerWithID:](self, "_interfaceControllerWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPRemoteInterface setControllerActive:](SPRemoteInterface, "setControllerActive:", v5);

  wk_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "viewControllerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136446722;
    v10 = "-[SPRemoteInterface _activateViewController:clientIdentifier:]";
    v11 = 1024;
    v12 = 3327;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_215918000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling willActivate for %{public}@", (uint8_t *)&v9, 0x1Cu);

  }
  objc_msgSend(v6, "willActivate");
  -[SPRemoteInterface sendWillActivateReplyForController:](self, "sendWillActivateReplyForController:", v6);

}

- (void)deactivateViewController:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[SPRemoteInterface _interfaceControllerWithID:](self, "_interfaceControllerWithID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__SPRemoteInterface_deactivateViewController_clientIdentifier___block_invoke;
    v10[3] = &unk_24D3BB3D0;
    v11 = v6;
    v12 = v8;
    v9 = v8;
    +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v10);

  }
  else
  {
    wk_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SPRemoteInterface deactivateViewController:clientIdentifier:].cold.1();
  }

}

uint64_t __63__SPRemoteInterface_deactivateViewController_clientIdentifier___block_invoke(uint64_t a1)
{
  +[SPRemoteInterface setControllerInactive:](SPRemoteInterface, "setControllerInactive:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "didDeactivate");
}

- (void)receiveNavigationReply:(id)a3 clientIdentifier:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a3;
  -[SPRemoteInterface navigatingViewControllerID](self, "navigatingViewControllerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if (v7)
    -[SPRemoteInterface setNavigatingViewControllerID:](self, "setNavigatingViewControllerID:", 0);
}

- (void)applicationDidTerminate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v11 = "-[SPRemoteInterface applicationDidTerminate:]";
    v12 = 1024;
    v13 = 3433;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  -[SPRemoteInterface removeInterfaceControllersForClient:](self, "removeInterfaceControllersForClient:", v4);
  -[SPRemoteInterface activeComplicationsConnections](self, "activeComplicationsConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SPRemoteInterface activeComplicationsConnections](self, "activeComplicationsConnections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", v7);

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__SPRemoteInterface_applicationDidTerminate___block_invoke;
    v9[3] = &unk_24D3BB2A0;
    v9[4] = self;
    spUtils_dispatchAsyncToMainThread(v9);
  }

}

uint64_t __45__SPRemoteInterface_applicationDidTerminate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dataInterfaceWillResignActive:");
  return result;
}

- (void)applicationContentsDidReset:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[SPRemoteInterface applicationContentsDidReset:]";
    v8 = 1024;
    v9 = 3449;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", (uint8_t *)&v6, 0x1Cu);
  }

  -[SPRemoteInterface removeInterfaceControllersForClient:](self, "removeInterfaceControllersForClient:", v4);
}

- (void)applicationDidFinishConnecting:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[SPRemoteInterface applicationDidFinishConnecting:]";
    v9 = 1024;
    v10 = 3456;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__SPRemoteInterface_applicationDidFinishConnecting___block_invoke;
  v6[3] = &unk_24D3BB2A0;
  v6[4] = self;
  spUtils_dispatchAsyncToMainThread(v6);

}

uint64_t __52__SPRemoteInterface_applicationDidFinishConnecting___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteInterfaceDidFinishConnecting:");
  return result;
}

- (void)applicationDidBecomeActive:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  wk_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[SPRemoteInterface applicationDidBecomeActive:]";
    v6 = 1024;
    v7 = 3618;
    _os_log_impl(&dword_215918000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin", (uint8_t *)&v4, 0x12u);
  }

}

- (void)applicationWillResignActive:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  wk_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[SPRemoteInterface applicationWillResignActive:]";
    v6 = 1024;
    v7 = 3642;
    _os_log_impl(&dword_215918000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin", (uint8_t *)&v4, 0x12u);
  }

}

- (void)applicationDidReceiveNotification:(id)a3 clientIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v7 = a3;
  v8 = a5;
  if (spUtils_isApplicationCompanionConnectionClientIdentifier(a4))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __94__SPRemoteInterface_applicationDidReceiveNotification_clientIdentifier_withCompletionHandler___block_invoke;
    v9[3] = &unk_24D3BB618;
    v10 = v7;
    v11 = v8;
    spUtils_dispatchAsyncToMainThread(v9);

  }
}

void __94__SPRemoteInterface_applicationDidReceiveNotification_clientIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x24BDD1620];
  getUNNotificationClass();
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v11 = 0;
  objc_msgSend(v2, "unarchivedObjectOfClass:fromData:error:", v3, v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (!v5)
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __94__SPRemoteInterface_applicationDidReceiveNotification_clientIdentifier_withCompletionHandler___block_invoke_cold_1();

  }
  objc_msgSend(getUNUserNotificationCenterClass(), "currentNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    NSClassFromString(CFSTR("SPApplicationDelegate"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(getUNUserNotificationCenterClass(), "currentNotificationCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userNotificationCenter:willPresentNotification:withCompletionHandler:", v10, v5, *(_QWORD *)(a1 + 40));

    }
  }

}

- (void)finishActivatingVCWithID:(id)a3 completion:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)performAfterApplicationDidFinishLaunching:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)applicationHandleWatchTaskKeys:(id)a3 reasonForSnapshot:(unint64_t)a4 visibleVCID:(id)a5 barTaskUUID:(id)a6 clientIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (spUtils_isApplicationCompanionConnectionClientIdentifier(v14))
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke;
    v15[3] = &unk_24D3BB640;
    v15[4] = self;
    v16 = v12;
    v17 = v11;
    v18 = v13;
    v19 = v14;
    spUtils_dispatchAsyncToMainThread(v15);

  }
}

void __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke_2;
  v5[3] = &unk_24D3BB640;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performAfterApplicationDidFinishLaunching:", v5);

}

void __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  wk_bg_app_refresh_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136447234;
    v13 = "-[SPRemoteInterface applicationHandleWatchTaskKeys:reasonForSnapshot:visibleVCID:barTaskUUID:clientIdentifier:"
          "]_block_invoke_2";
    v14 = 1024;
    v15 = 3775;
    v16 = 2114;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Waiting on finishActivatingVCWithID:%{public}@ with taskKeys %{public}@, barTaskUUID=%{public}@", buf, 0x30u);

  }
  v6 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke_408;
  v8[3] = &unk_24D3BB3A8;
  v8[4] = v6;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v6, "finishActivatingVCWithID:completion:", v7, v8);

}

void __111__SPRemoteInterface_applicationHandleWatchTaskKeys_reasonForSnapshot_visibleVCID_barTaskUUID_clientIdentifier___block_invoke_408(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  wk_bg_app_refresh_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[SPRemoteInterface applicationHandleWatchTaskKeys:reasonForSnapshot:visibleVCID:barTaskUUID:clientIdentifier:]_block_invoke";
    v14 = 1024;
    v15 = 3845;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Finished activating for snapshot", buf, 0x12u);
  }

  v3 = (void *)a1[4];
  if (a1[5])
    v4 = a1[5];
  else
    v4 = MEMORY[0x24BDBD1B8];
  v10[0] = CFSTR("hT");
  v10[1] = CFSTR("Ui");
  v11[0] = v4;
  v5 = (void *)a1[6];
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[7];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendPlist:clientIdentifiers:", v7, v8);

  if (!v5)
}

- (void)applicationIsStillActive
{
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[SPRemoteInterface applicationIsStillActive]";
    v5 = 1024;
    v6 = 3856;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin", (uint8_t *)&v3, 0x12u);
  }

}

- (void)dataInterfaceDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v11 = "-[SPRemoteInterface dataInterfaceDidBecomeActive:]";
    v12 = 1024;
    v13 = 3892;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  -[SPRemoteInterface activeComplicationsConnections](self, "activeComplicationsConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    -[SPRemoteInterface activeComplicationsConnections](self, "activeComplicationsConnections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__SPRemoteInterface_dataInterfaceDidBecomeActive___block_invoke;
  v9[3] = &unk_24D3BB2A0;
  v9[4] = self;
  spUtils_dispatchAsyncToMainThread(v9);

}

uint64_t __50__SPRemoteInterface_dataInterfaceDidBecomeActive___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dataInterfaceDidBecomeActive:");
  return result;
}

- (void)dataInterfaceWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "-[SPRemoteInterface dataInterfaceWillResignActive:]";
    v10 = 1024;
    v11 = 3907;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  -[SPRemoteInterface activeComplicationsConnections](self, "activeComplicationsConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SPRemoteInterface_dataInterfaceWillResignActive___block_invoke;
  v7[3] = &unk_24D3BB2A0;
  v7[4] = self;
  spUtils_dispatchAsyncToMainThread(v7);

}

uint64_t __51__SPRemoteInterface_dataInterfaceWillResignActive___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dataInterfaceWillResignActive:");
  return result;
}

- (void)preferredContentSizeCategory:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  wk_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[SPRemoteInterface preferredContentSizeCategory:]";
    v9 = 1024;
    v10 = 3918;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_215918000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  if (v3 && (!preferredContentSizeCategory____textSize || objc_msgSend(v3, "compare:")))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __50__SPRemoteInterface_preferredContentSizeCategory___block_invoke;
    v5[3] = &unk_24D3BB2A0;
    v6 = v3;
    spUtils_dispatchAsyncToMainThread(v5);

  }
}

void __50__SPRemoteInterface_preferredContentSizeCategory___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)&preferredContentSizeCategory____textSize, *(id *)(a1 + 32));
  v1 = preferredContentSizeCategory____textSize;
  +[WKInterfaceDevice currentDevice](WKInterfaceDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredContentSizeCategory:", v1);

  v6 = *MEMORY[0x24BDF76B0];
  v7[0] = preferredContentSizeCategory____textSize;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:userInfo:", *MEMORY[0x24BDF7670], 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:", v4);

}

- (void)layoutDirection:(int64_t)a3
{
  int v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  wk_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[SPRemoteInterface layoutDirection:]";
    v7 = 1024;
    v8 = 3939;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_215918000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %d", (uint8_t *)&v5, 0x18u);
  }

}

- (BOOL)_handleAction:(id)a3 forNotification:(id)a4 remoteNotificationContext:(id)a5 localNotification:(id)a6 unNotification:(id)a7 handler:(id)a8 controller:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __CFString *v22;
  _QWORD *v23;
  void *v24;
  __CFString *v25;
  BOOL v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  __CFString *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __CFString *v38;
  _QWORD v39[4];
  id v40;
  __CFString *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = (__CFString *)v15;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v23 = (_QWORD *)getUNNotificationDefaultActionIdentifierSymbolLoc_ptr;
  v49 = getUNNotificationDefaultActionIdentifierSymbolLoc_ptr;
  if (!getUNNotificationDefaultActionIdentifierSymbolLoc_ptr)
  {
    v24 = (void *)UserNotificationsLibrary();
    v23 = dlsym(v24, "UNNotificationDefaultActionIdentifier");
    v47[3] = (uint64_t)v23;
    getUNNotificationDefaultActionIdentifierSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v46, 8);
  if (!v23)
    -[SPRemoteInterface _handleAction:forNotification:remoteNotificationContext:localNotification:unNotification:handler:controller:].cold.1();
  v25 = v22;
  if (-[__CFString isEqualToString:](v22, "isEqualToString:", *v23))
  {

    v25 = &stru_24D3BD200;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v18 || v17 || v19)
    {
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke;
      v39[3] = &unk_24D3BB668;
      v40 = v20;
      v41 = v22;
      v42 = v19;
      v43 = v17;
      v44 = v18;
      v45 = v21;
      +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v39);

      v26 = 1;
      v27 = v40;
    }
    else
    {
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2;
      v35[3] = &unk_24D3BB690;
      v36 = v21;
      v37 = v20;
      v38 = v25;
      -[SPRemoteInterface fetchNotificationForNotificationID:completion:](self, "fetchNotificationForNotificationID:completion:", v16, v35);

      v26 = 1;
      v27 = v36;
    }
  }
  else
  {
    objc_msgSend(getUNUserNotificationCenterClass(), "currentNotificationCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "delegate");
    v27 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0
      && (NSClassFromString(CFSTR("SPApplicationDelegate")), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_3;
      v30[3] = &unk_24D3BB3A8;
      v27 = v27;
      v31 = v27;
      v32 = v22;
      v33 = v19;
      v34 = v21;
      +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v30);

      v26 = 1;
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

uint64_t __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleActionWithIdentifier:forNotification:remoteNotification:localNotification:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return +[SPRemoteInterface didFinishHandlingActivity:](SPRemoteInterface, "didFinishHandlingActivity:", *(_QWORD *)(a1 + 72));
}

void __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2_cold_1();

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_415;
    v22[3] = &unk_24D3BB2A0;
    v14 = &v23;
    v23 = a1[4];
    +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v22);
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2_416;
    v15[3] = &unk_24D3BB668;
    v14 = &v16;
    v16 = a1[5];
    v17 = a1[6];
    v18 = v11;
    v19 = v9;
    v20 = v10;
    v21 = a1[4];
    +[SPRemoteInterface handleEvent:](SPRemoteInterface, "handleEvent:", v15);

  }
}

uint64_t __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_415(uint64_t a1)
{
  return +[SPRemoteInterface didFinishHandlingActivity:](SPRemoteInterface, "didFinishHandlingActivity:", *(_QWORD *)(a1 + 32));
}

uint64_t __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2_416(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleActionWithIdentifier:forNotification:remoteNotification:localNotification:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return +[SPRemoteInterface didFinishHandlingActivity:](SPRemoteInterface, "didFinishHandlingActivity:", *(_QWORD *)(a1 + 72));
}

uint64_t __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE buf[40];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = "-[SPRemoteInterface _handleAction:forNotification:remoteNotificationContext:localNotification:u"
                         "nNotification:handler:controller:]_block_invoke_3";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4111;
    *(_WORD *)&buf[18] = 2114;
    *(_QWORD *)&buf[20] = v3;
    *(_WORD *)&buf[28] = 2114;
    *(_QWORD *)&buf[30] = v4;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: on notifCenterDelegate %{public}@ with actionItemID %{public}@", buf, 0x26u);
  }

  v5 = (void *)a1[4];
  objc_msgSend(getUNUserNotificationCenterClass(), "currentNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v7 = (void *)getUNNotificationResponseClass_softClass;
  v14 = getUNNotificationResponseClass_softClass;
  if (!getUNNotificationResponseClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getUNNotificationResponseClass_block_invoke;
    *(_QWORD *)&buf[24] = &unk_24D3BB130;
    *(_QWORD *)&buf[32] = &v11;
    __getUNNotificationResponseClass_block_invoke((uint64_t)buf);
    v7 = (void *)v12[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v8, "responseWithNotification:actionIdentifier:", a1[6], a1[5], v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", v6, v9, &__block_literal_global_420);

  return +[SPRemoteInterface didFinishHandlingActivity:](SPRemoteInterface, "didFinishHandlingActivity:", a1[7]);
}

- (void)rootInterfaceController:(id)a3 performActionWithItemID:(id)a4 forNotificationID:(id)a5 userInfo:(id)a6 clientIdentifier:(id)a7 completionHandler:(id)a8
{
  id v13;
  void (**v14)(_QWORD);
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v31 = a3;
  v32 = a4;
  v13 = a5;
  v14 = (void (**)(_QWORD))a8;
  v15 = a6;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("nC"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("nD"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("nUD"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD1620];
    getUNNotificationClass();
    v34 = 0;
    objc_msgSend(v19, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v18, &v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v34;
    if (!v20)
    {
      wk_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SPRemoteInterface rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:].cold.2();

    }
  }
  if (v17)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v17, &v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v33;
    v25 = v31;
    if (!v23)
    {
      wk_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[SPRemoteInterface rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:].cold.1();

    }
  }
  else
  {
    v23 = 0;
    v25 = v31;
  }
  v27 = v32;
  if (!v16)
  {
    objc_msgSend(0, "request");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "content");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v32;
  }
  -[SPRemoteInterface _interfaceControllerWithID:](self, "_interfaceControllerWithID:", v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SPRemoteInterface _handleAction:forNotification:remoteNotificationContext:localNotification:unNotification:handler:controller:](self, "_handleAction:forNotification:remoteNotificationContext:localNotification:unNotification:handler:controller:", v27, v13, v16, v23, 0, 0, v30))-[SPRemoteInterface _handleAction:forNotification:remoteNotificationContext:localNotification:unNotification:handler:controller:](self, "_handleAction:forNotification:remoteNotificationContext:localNotification:unNotification:handler:controller:", v27, v13, v16, v23, 0, v30, v30);
  if (v14)
    v14[2](v14);

}

- (void)getComplicationData:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[SPRemoteInterface getComplicationData:]";
    v9 = 1024;
    v10 = 4391;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComF:->Plugin, %{public}@", buf, 0x1Cu);
  }

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__SPRemoteInterface_getComplicationData___block_invoke;
  v6[3] = &unk_24D3BB2A0;
  v6[4] = self;
  spUtils_dispatchAsyncToMainThread(v6);

}

uint64_t __41__SPRemoteInterface_getComplicationData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getComplicationData:");
  return result;
}

- (void)_fillDataWithRandom:(id)a3 length:(int64_t)a4
{
  id v5;
  double v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v5 = a3;
  if ((_fillDataWithRandom_length__inited & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    srand(v6);
    _fillDataWithRandom_length__inited = 1;
  }
  v7 = a4 + 3;
  if (a4 >= 0)
    v7 = a4;
  if (a4 >= 4)
  {
    v8 = 0;
    v9 = v7 >> 2;
    do
    {
      v10 = 0;
      v10 = rand();
      objc_msgSend(v5, "replaceBytesInRange:withBytes:", v8, 4, &v10);
      v8 += 4;
      --v9;
    }
    while (v9);
  }

}

- (id)controllerMethods:(id)a3
{
  id v3;
  void *v4;
  objc_class *Class;
  Method *v6;
  Method *v7;
  unint64_t i;
  void *v9;
  SEL Name;
  unsigned int outCount;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  Class = object_getClass(v3);
  v6 = class_copyMethodList(Class, &outCount);
  if (v6)
  {
    v7 = v6;
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        Name = 0;
        Name = method_getName(v7[i]);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &Name, ":");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

      }
    }
    free(v7);
  }

  return v4;
}

- (SPRemoteInterfaceDataDelegateProtocol)dataDelegate
{
  return self->_dataDelegate;
}

- (void)setDataDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_dataDelegate, a3);
}

- (NSMutableArray)activeComplicationsConnections
{
  return self->_activeComplicationsConnections;
}

- (void)setActiveComplicationsConnections:(id)a3
{
  objc_storeStrong((id *)&self->_activeComplicationsConnections, a3);
}

- (id)runLoopObserver
{
  return self->_runLoopObserver;
}

- (void)setRunLoopObserver:(id)a3
{
  objc_storeStrong(&self->_runLoopObserver, a3);
}

- (NSMutableDictionary)interfaceControllers
{
  return self->_interfaceControllers;
}

- (void)setInterfaceControllers:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceControllers, a3);
}

- (NSMutableDictionary)interfaceControllersOwners
{
  return self->_interfaceControllersOwners;
}

- (void)setInterfaceControllersOwners:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceControllersOwners, a3);
}

- (NSMutableSet)missingInterfaceControllers
{
  return self->_missingInterfaceControllers;
}

- (void)setMissingInterfaceControllers:(id)a3
{
  objc_storeStrong((id *)&self->_missingInterfaceControllers, a3);
}

- (OS_dispatch_queue)interfaceControllersAccessQueue
{
  return self->_interfaceControllersAccessQueue;
}

- (void)setInterfaceControllersAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceControllersAccessQueue, a3);
}

- (NSString)rootViewControllerID
{
  return self->_rootViewControllerID;
}

- (void)setRootViewControllerID:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewControllerID, a3);
}

- (NSString)navigatingViewControllerID
{
  return self->_navigatingViewControllerID;
}

- (void)setNavigatingViewControllerID:(id)a3
{
  objc_storeStrong((id *)&self->_navigatingViewControllerID, a3);
}

- (NSString)appClientIdentifier
{
  return self->_appClientIdentifier;
}

- (void)setAppClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appClientIdentifier, a3);
}

- (id)textInputCompletion
{
  return self->_textInputCompletion;
}

- (void)setTextInputCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)textInputSuggestions
{
  return self->_textInputSuggestions;
}

- (void)setTextInputSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)mediaPlayerControllerCompletion
{
  return self->_mediaPlayerControllerCompletion;
}

- (void)setMediaPlayerControllerCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)audioRecorderControllerCompletion
{
  return self->_audioRecorderControllerCompletion;
}

- (void)setAudioRecorderControllerCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSMutableArray)openParentRequests
{
  return self->_openParentRequests;
}

- (void)setOpenParentRequests:(id)a3
{
  objc_storeStrong((id *)&self->_openParentRequests, a3);
}

- (NSBundle)extensionBundle
{
  return self->_extensionBundle;
}

- (void)setExtensionBundle:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundle, a3);
}

- (id)addPassesCompletion
{
  return self->_addPassesCompletion;
}

- (void)setAddPassesCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_addPassesCompletion, 0);
  objc_storeStrong((id *)&self->_extensionBundle, 0);
  objc_storeStrong((id *)&self->_openParentRequests, 0);
  objc_storeStrong(&self->_audioRecorderControllerCompletion, 0);
  objc_storeStrong(&self->_mediaPlayerControllerCompletion, 0);
  objc_storeStrong(&self->_textInputSuggestions, 0);
  objc_storeStrong(&self->_textInputCompletion, 0);
  objc_storeStrong((id *)&self->_appClientIdentifier, 0);
  objc_storeStrong((id *)&self->_navigatingViewControllerID, 0);
  objc_storeStrong((id *)&self->_rootViewControllerID, 0);
  objc_storeStrong((id *)&self->_interfaceControllersAccessQueue, 0);
  objc_storeStrong((id *)&self->_missingInterfaceControllers, 0);
  objc_storeStrong((id *)&self->_interfaceControllersOwners, 0);
  objc_storeStrong((id *)&self->_interfaceControllers, 0);
  objc_storeStrong(&self->_runLoopObserver, 0);
  objc_storeStrong((id *)&self->_activeComplicationsConnections, 0);
  objc_storeStrong((id *)&self->_dataDelegate, 0);
}

void __38__SPRemoteInterface__remoteIdentifier__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:->ComD unable to find Gizmo app identifier in Info.plist", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

void __36__SPRemoteInterface_initWithBundle___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Initializing data delegate: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setupSignal:handler:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  _WORD v3[10];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v3[7] = 567;
  v3[9] = v0;
  v4 = v1;
  _os_log_error_impl(&dword_215918000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%d: *** Could not set up signal handler for %d.", (uint8_t *)v3, 0x18u);
  OUTLINED_FUNCTION_9();
}

- (void)sendData:clientIdentifiers:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Unable to connect to companionappd to send request", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)sendData:clientIdentifiers:reply:.cold.2()
{
  os_log_t v0;
  _DWORD v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 623;
  _os_log_debug_impl(&dword_215918000, v0, OS_LOG_TYPE_DEBUG, "%{public}s:%d: ComF:->ComD", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_9();
}

- (void)sendPlist:clientIdentifiers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: spPlistWithDictionary failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)sendPlist:clientIdentifiers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Unable to serialize data", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)_requestTimingData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: ERROR: Unable to connect to companionappd to send request", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)fetchNotificationForNotificationID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Unable to connect to companionappd to send request", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

void __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Failed to unarchive localNotificationArchivedData: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __67__SPRemoteInterface_fetchNotificationForNotificationID_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Failed to unarchive unnData: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)updateUserActivity:userInfo:webpageURL:controller:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)sendCacheRequestMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Unable to serialize data", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)sendCacheRequestMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Unable to connect to companionappd to send request", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

+ (void)sendCacheRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error: not implemented", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)controller:pushInterfaceController:initializationContextID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controllerPop:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controllerPopToRoot:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controllerBecomeCurrentPage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controller:presentInterfaceController:initializationContextID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controller:presentInterfaceControllers:initializationContextIDs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controllerDismiss:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (controller:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controllerPresentTextInputController:allowedInputMode:suggestions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controllerDismissTextInputController:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controllerPresentAddPassesController:passes:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)controllerDismissAddPassesController:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)didFinishHandlingActivity:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)notificationController:showNotificationInterfaceType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ (object:%{public}@) has no client identifier", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_tellApplicationThatInterfaceControllerCantBeFound:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Unable to connect to host to send gotUnknownInterfaceController: for %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_interfaceControllerWithID:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *(_DWORD *)a3 = 136446978;
  *(_QWORD *)(a3 + 4) = "-[SPRemoteInterface _interfaceControllerWithID:]";
  *(_WORD *)(a3 + 12) = 1024;
  OUTLINED_FUNCTION_10(a1, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_6(&dword_215918000, v6, v4, "%{public}s:%d: ComF: interfaceController for interfaceControllerID:%{public}@ not found (clientIdentifier=%{public}@)", v5);

}

- (void)_interfaceControllerID:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *(_DWORD *)a3 = 136446978;
  *(_QWORD *)(a3 + 4) = "-[SPRemoteInterface _interfaceControllerID:]";
  *(_WORD *)(a3 + 12) = 1024;
  OUTLINED_FUNCTION_10(a1, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_6(&dword_215918000, v6, v4, "%{public}s:%d: ComF: interfaceControllerID for controller:%{public}@ not found (clientIdentifier=%{public}@)", v5);

}

- (void)_interfaceControllerClientIDForControllerID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: ComF: clientIdentifier for interfaceControllerID:%{public}@ not found", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  _WORD v5[10];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12(a1);
  *(_DWORD *)v5 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v5[7] = 2529;
  v5[9] = 2048;
  v6 = v3;
  OUTLINED_FUNCTION_5(&dword_215918000, a2, v4, "%{public}s:%d: %lu interfaceControllers", (uint8_t *)v5);
  OUTLINED_FUNCTION_11();
}

void __45__SPRemoteInterface__dumpInterfaceDictionary__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _WORD v7[10];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = OUTLINED_FUNCTION_12(a1);
  objc_msgSend(*(id *)(*(_QWORD *)a1 + 40), "count");
  *(_DWORD *)v7 = 136446978;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v7[7] = 2527;
  v7[9] = 2048;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_6(&dword_215918000, a2, v6, "%{public}s:%d: *********** ERROR interfaceControllers.count %lu != interfaceControllersOwners.count %lu", (uint8_t *)v7);
}

- (void)receiveData:fromIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: failed to initialize protoPlist", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)handleProtoPlist:fromIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: failed to deserialize dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)handlePlistDictionary:(NSObject *)a3 fromIdentifier:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _WORD v7[10];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v7 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v7[7] = 3156;
  v7[9] = 2112;
  v8 = v5;
  OUTLINED_FUNCTION_5(&dword_215918000, a3, v6, "%{public}s:%d: Sending message to debug console: \"%@\", (uint8_t *)v7);

  OUTLINED_FUNCTION_11();
}

- (void)handlePlistDictionary:fromIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: ComF:->Plugin method %{public}@ is not implemented by the controller %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)handlePlistDictionary:fromIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: ComF:->Plugin method %{public}@ has wrong parameter type", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)handlePlistDictionary:fromIdentifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Ignoring request to activate view controller with and empty viewControllerIdentifier (client identifier = %{public}@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)handlePlistDictionary:fromIdentifier:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Ignoring request to deactivate view controller with and empty viewControllerIdentifier (client identifier = %{public}@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)handlePlistDictionary:fromIdentifier:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: userActivity %{public}@ should be of type NSDictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Critical failure. Simulating crash: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Couldn't instantiate class %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Critical failure. Simulating crash: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)createViewController:className:properties:contextID:info:gestureDescriptions:clientIdentifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}@ is not a subclass of WKInterfaceController", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __115__SPRemoteInterface_createViewController_className_properties_contextID_info_gestureDescriptions_clientIdentifier___block_invoke_390_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;

  LODWORD(v2) = 136446978;
  *(_QWORD *)((char *)&v2 + 4) = "-[SPRemoteInterface createViewController:className:properties:contextID:info:gestureDes"
                                 "criptions:clientIdentifier:]_block_invoke";
  WORD6(v2) = 1024;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: Got error fetching notification context for notification with ID %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)activateViewController:clientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Ignoring request for empty viewControllerIdentifier (client identifier = %{public}@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)deactivateViewController:clientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Ignoring request for empty viewControllerIdentifier (client identifier = %{public}@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __94__SPRemoteInterface_applicationDidReceiveNotification_clientIdentifier_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Failed to unarchive unNotificationKeyedArchive: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleAction:forNotification:remoteNotificationContext:localNotification:unNotification:handler:controller:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getUNNotificationDefaultActionIdentifier(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPRemoteInterface.m"), 94, CFSTR("%s"), dlerror());

  __break(1u);
}

void __129__SPRemoteInterface__handleAction_forNotification_remoteNotificationContext_localNotification_unNotification_handler_controller___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Got error %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Failed to unarchive a UILocalNotification: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)rootInterfaceController:performActionWithItemID:forNotificationID:userInfo:clientIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Failed to unarchive a UNNotification: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
