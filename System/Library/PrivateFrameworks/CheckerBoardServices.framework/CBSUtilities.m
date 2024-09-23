@implementation CBSUtilities

+ (BOOL)isCheckerBoardActive
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE38508], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApplicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CheckerBoard"));
  return (char)v2;
}

+ (BOOL)rebootToCheckerBoard
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  uint8_t v8[16];
  uint8_t buf[16];

  if (objc_msgSend(a1, "_currentProcessHasEntitlement:", CFSTR("com.apple.CheckerBoard.services.reboot"))
    && objc_msgSend(a1, "_currentProcessHasEntitlement:", CFSTR("com.apple.private.iokit.nvram-write-access"))&& (objc_msgSend(a1, "_currentProcessHasEntitlement:", CFSTR("com.apple.frontboard.shutdown")) & 1) != 0)
  {
    CheckerBoardLogHandleForCategory(4);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22F698000, v3, OS_LOG_TYPE_DEFAULT, "Rebooting into CheckerBoard", v8, 2u);
    }

    +[CBSNVRamUtil writeNVRamVariable:value:](CBSNVRamUtil, "writeNVRamVariable:value:", CFSTR("one-time-boot-command"), CFSTR("checkerboard"));
    v4 = objc_alloc_init(MEMORY[0x24BE38508]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE38500]), "initWithReason:", CFSTR("Rebooting to CheckerBoard"));
    v6 = 1;
    objc_msgSend(v5, "setRebootType:", 1);
    -[NSObject shutdownWithOptions:](v4, "shutdownWithOptions:", v5);

  }
  else
  {
    CheckerBoardLogHandleForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F698000, v4, OS_LOG_TYPE_DEFAULT, "Missing entitlements necessary for rebooting to CheckerBoard", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

+ (void)exitCheckerBoard
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exitCheckerBoard");

}

+ (BOOL)isSSRBootIntentSet
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.CheckerBoard"));
  objc_msgSend(v2, "objectForKey:", CFSTR("persistedBootIntentReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && (objc_msgSend(v3, "isEqualToNumber:", &unk_24FCB4058) & 1) != 0;

  return v5;
}

+ (id)proxyServer
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v2 = dispatch_semaphore_create(0);
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __27__CBSUtilities_proxyServer__block_invoke;
  v9[3] = &unk_24FCB1318;
  v11 = &v12;
  v5 = v2;
  v10 = v5;
  objc_msgSend(v4, "proxyServerWithCompletion:", v9);

  v6 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __27__CBSUtilities_proxyServer__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)showSceneStatusBar
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showSceneStatusBar");

}

+ (void)hideSceneStatusBar
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideSceneStatusBar");

}

+ (void)sceneStatusBarStyle:(int64_t)a3
{
  void *v4;
  id v5;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarStyle:", a3);

}

+ (void)dimDisplay
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dimDisplay");

}

+ (void)undimDisplay
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undimDisplay");

}

+ (void)enableTouchButtonEvents
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableTouchButtonEvents");

}

+ (void)disableTouchButtonEvents
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableTouchButtonEvents");

}

+ (void)addShutdownTask:(id)a3 forReason:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemServicesServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addShutdownTask:forReason:", v6, v5);

}

+ (void)removeShutdownTask:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeShutdownTask:", v3);

}

+ (void)disableNetworkReconnect
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableNetworkReconnect");

}

+ (void)enableNetworkReconnect
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableNetworkReconnect");

}

+ (void)launchDiagnosticsApp
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchDiagnosticsApp");

}

+ (void)launchDiagnostics
{
  void *v2;
  id v3;

  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemServicesServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchDiagnostics");

}

+ (void)diagnosticsRunning:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diagnosticsRunning:", v3);

}

+ (void)connectToSSID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemServicesServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectToSSID:completion:", v6, v5);

}

+ (void)connectToSSID:(id)a3 password:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemServicesServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connectToSSID:password:completion:", v9, v8, v7);

}

+ (void)networkScanWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkScanWithCompletion:", v3);

}

+ (void)connectedNetwork:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedNetwork:", v3);

}

+ (void)displayDimmed:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayDimmed:", v3);

}

+ (void)networkReconnectEnabled:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkReconnectEnabled:", v3);

}

+ (void)currentLocaleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemServicesServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLocaleIdentifier:", v3);

}

+ (void)setLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemServicesServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocaleIdentifier:completion:", v6, v5);

}

+ (BOOL)_currentProcessHasEntitlement:(id)a3
{
  void *v3;
  void *v4;
  BOOL value;

  objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4);
  v3 = (void *)xpc_copy_entitlement_for_self();
  v4 = v3;
  if (v3)
    value = xpc_BOOL_get_value(v3);
  else
    value = 0;

  return value;
}

@end
