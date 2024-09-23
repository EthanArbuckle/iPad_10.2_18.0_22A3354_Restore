@implementation ACCPlatformPluginSystem

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)initPlugin
{
  NSMutableDictionary *v3;
  NSMutableDictionary *activeProcessAssertions;
  NSLock *v5;
  NSLock *applicationStateLock;
  void *v7;
  void *v8;
  void *v9;
  FBSDisplayLayoutMonitor *v10;
  FBSDisplayLayoutMonitor *mainDisplayLayoutMonitor;
  BKSApplicationStateMonitor *v12;
  BKSApplicationStateMonitor *appStateMonitor;
  id location;

  init_logging();
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  activeProcessAssertions = self->_activeProcessAssertions;
  self->_activeProcessAssertions = v3;

  v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  applicationStateLock = self->_applicationStateLock;
  self->_applicationStateLock = v5;

  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsUserInteractivePriority:", 1);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(v7, "setTransitionHandler:", &__block_literal_global_103);
  v8 = (void *)MEMORY[0x24BE38438];
  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "monitorWithConfiguration:", v9);
  v10 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  mainDisplayLayoutMonitor = self->_mainDisplayLayoutMonitor;
  self->_mainDisplayLayoutMonitor = v10;

  v12 = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x24BE08A08]);
  appStateMonitor = self->_appStateMonitor;
  self->_appStateMonitor = v12;

  -[ACCPlatformPluginSystem setIsRunning:](self, "setIsRunning:", 0);
  objc_destroyWeak(&location);

}

- (void)startPlugin
{
  -[ACCPlatformPluginSystem setIsRunning:](self, "setIsRunning:", 1);
}

- (void)stopPlugin
{
  void *v3;

  -[BKSApplicationStateMonitor handler](self->_appStateMonitor, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ACCPlatformPluginSystem setIsRunning:](self, "setIsRunning:", 0);
}

- (void)launchApplication:(id)a3 options:(int)a4
{
  char v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  void *v39;
  _BYTE v40[128];
  _QWORD v41[2];
  _QWORD v42[4];

  v4 = a4;
  v42[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x24BDBCED8];
    v8 = *MEMORY[0x24BE38310];
    v41[0] = *MEMORY[0x24BE38320];
    v41[1] = v8;
    v42[0] = MEMORY[0x24BDBD1C8];
    v42[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v4 & 1) != 0)
    {
      -[FBSDisplayLayoutMonitor currentLayout](self->_mainDisplayLayoutMonitor, "currentLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v11, "elements");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
LABEL_5:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
          if (objc_msgSend(v17, "level") == 1 && objc_msgSend(v17, "layoutRole") == 1)
            break;
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v14)
              goto LABEL_5;
            goto LABEL_12;
          }
        }
        objc_msgSend(v17, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_26;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1B70]), "initWithPreviousApplication:", v18);
        v30 = 0;
        objc_msgSend(v19, "asBSActionWithResponder:error:", 0, &v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v30;
        if (v20)
        {
          v39 = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE382A0]);
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v22 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
            v22 = MEMORY[0x24BDACB70];
            v23 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[ACCPlatformPluginSystem launchApplication:options:].cold.2((uint64_t)v18);
        }

      }
      else
      {
LABEL_12:
        v18 = v12;
      }

LABEL_26:
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v24 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v6;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_218A89000, v24, OS_LOG_TYPE_DEFAULT, "Launch app: %@ with options: %@", buf, 0x16u);
    }

    v26 = objc_alloc_init(MEMORY[0x24BE38490]);
    objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __53__ACCPlatformPluginSystem_launchApplication_options___block_invoke;
    v28[3] = &unk_24D998CB8;
    v29 = v6;
    objc_msgSend(v26, "openApplication:withOptions:completion:", v29, v27, v28);

  }
}

void __53__ACCPlatformPluginSystem_launchApplication_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (gLogObjects)
    v8 = gNumLogObjects <= 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __53__ACCPlatformPluginSystem_launchApplication_options___block_invoke_cold_2(a1);
  }
  else
  {
    if (v9)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_218A89000, v10, OS_LOG_TYPE_DEFAULT, "Launched app: %@!", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (BOOL)isAppVisibleInCurrentMode:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a3;
  v4 = WeakLinkClass(CFSTR("LSApplicationProxy"), 1uLL);
  v5 = WeakLinkClass(CFSTR("LSApplicationWorkspace"), 1uLL);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v5, "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "applicationIsInstalled:", v3);

  if (v7)
  {
    objc_msgSend(v4, "applicationProxyForIdentifier:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__ACCPlatformPluginSystem_isAppVisibleInCurrentMode___block_invoke;
    v13[3] = &unk_24D998CE0;
    v15 = &v16;
    v10 = v8;
    v14 = v10;
    objc_msgSend(v9, "enumerateBundlesOfType:block:", 4, v13);

  }
  v11 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v11;
}

uint64_t __53__ACCPlatformPluginSystem_isAppVisibleInCurrentMode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

- (id)applicationsInstalledWithExternalAccessoryProtocol:(id)a3
{
  return (id)SBSCopyDisplayIdentifiersForExternalAccessoryProtocol();
}

- (BOOL)launchURL:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("no");
    if (v5)
      v9 = CFSTR("yes");
    v11 = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_218A89000, v8, OS_LOG_TYPE_DEFAULT, "Launching URL %@ was successful = %@", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

- (BOOL)isAppInstalledWithBundleID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BDC1548];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applicationIsInstalled:", v4);

  return v6;
}

- (id)appNameForBundleID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsExternalAccessoryBackgroundMode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "UIBackgroundModes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "containsObject:", CFSTR("external-accessory"));
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v8 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[ACCPlatformPluginSystem supportsExternalAccessoryBackgroundMode:].cold.1();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)startObservingApplicationState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if ((gbApplicationStateMonitoringStarted & 1) == 0)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __57__ACCPlatformPluginSystem_startObservingApplicationState__block_invoke;
    v8 = &unk_24D998D08;
    objc_copyWeak(&v9, &location);
    -[BKSApplicationStateMonitor setHandler:](self->_appStateMonitor, "setHandler:", &v5);
    gbApplicationStateMonitoringStarted = 1;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

void __57__ACCPlatformPluginSystem_startObservingApplicationState__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_observeApplicationState:", v3);

}

- (void)stopObservingApplicationState
{
  void *v3;
  id v4;

  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (gbApplicationStateMonitoringStarted == 1)
  {
    -[BKSApplicationStateMonitor setHandler:](self->_appStateMonitor, "setHandler:", 0);
    gbApplicationStateMonitoringStarted = 0;
  }
  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (void)_observeApplicationState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE089F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE089E8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCPlatformPluginSystem _convertDictionaryToPlatformACCDictionary:](self, "_convertDictionaryToPlatformACCDictionary:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ACCPlatformPluginSystem__observeApplicationState___block_invoke;
  block[3] = &unk_24D998D30;
  v13 = v8;
  v10 = v8;
  dispatch_async(v9, block);

  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

void __52__ACCPlatformPluginSystem__observeApplicationState___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_218A89000, v4, OS_LOG_TYPE_DEFAULT, "Posting application state change %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformApplicationNotificationStateChanged"), 0, *(_QWORD *)(a1 + 32));

}

- (id)_convertDictionaryToPlatformACCDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE089F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE08A00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE089E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("ACCPlatformApplicationStateKey"));
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("ACCPlatformApplicationStateProcessIDKey"));
  if (v8)
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("ACCPlatformApplicationStateDisplayIDKey"));

  return v5;
}

- (id)applicationInfoForPID:(int)a3
{
  void *v4;
  void *v5;

  -[BKSApplicationStateMonitor applicationInfoForPID:](self->_appStateMonitor, "applicationInfoForPID:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCPlatformPluginSystem _convertDictionaryToPlatformACCDictionary:](self, "_convertDictionaryToPlatformACCDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)applicationInfoForBundleID:(id)a3
{
  void *v4;
  void *v5;

  -[BKSApplicationStateMonitor applicationInfoForApplication:](self->_appStateMonitor, "applicationInfoForApplication:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCPlatformPluginSystem _convertDictionaryToPlatformACCDictionary:](self, "_convertDictionaryToPlatformACCDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isApplicationInForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  BOOL v10;
  NSObject *v12;
  id v13;
  id v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCPlatformPluginSystem applicationInfoForBundleID:](self, "applicationInfoForBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ACCPlatformApplicationStateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntValue");
    v10 = v8 > 4 && v8 != 16;
    if (v8 < 5 || v8 == 16)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v12 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ACCPlatformPluginSystem isApplicationInForeground:].cold.2();
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v12 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v4;
        _os_log_impl(&dword_218A89000, v12, OS_LOG_TYPE_DEFAULT, "app bundleID %@ is in foreground", (uint8_t *)&v16, 0xCu);
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isApplicationRunning:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  NSObject *v11;
  id v12;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCPlatformPluginSystem applicationInfoForBundleID:](self, "applicationInfoForBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ACCPlatformApplicationStateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntValue");
    v9 = v8 != 16 && v8 > 2;
    if (v8 > 0x10 || ((1 << v8) & 0x10007) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_218A89000, v11, OS_LOG_TYPE_DEFAULT, "app bundleID %@ is actively running", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[ACCPlatformPluginSystem isApplicationRunning:].cold.2();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)takeOneTimeProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  dispatch_time_t v19;
  id v20;
  _QWORD block[4];
  NSObject *v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[2];

  v4 = *(_QWORD *)&a4;
  v31[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("accessoryd.%@.%d.oneTime.assertion]"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.accessoryd"), CFSTR("OneTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = (id)0xAAAAAAAAAAAAAAAALL;
  v9 = objc_alloc(MEMORY[0x24BE80B10]);
  objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v9, "initWithExplanation:target:attributes:", v6, v10, v8);

  v11 = (void *)v26[5];
  v24 = 0;
  v12 = objc_msgSend(v11, "acquireWithError:", &v24);
  v13 = v24;
  if (gLogObjects)
    v14 = gNumLogObjects <= 0;
  else
    v14 = 1;
  v15 = !v14;
  if (v12)
  {
    if (v15)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ACCPlatformPluginSystem takeOneTimeProcessAssertionForBundleID:applicationPid:].cold.1();

    v19 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__ACCPlatformPluginSystem_takeOneTimeProcessAssertionForBundleID_applicationPid___block_invoke;
    block[3] = &unk_24D998D58;
    v22 = v6;
    v23 = &v25;
    dispatch_after(v19, MEMORY[0x24BDAC9B8], block);
    v17 = v22;
  }
  else
  {
    if (v15)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginSystem takeOneTimeProcessAssertionForBundleID:applicationPid:].cold.3();
  }

  _Block_object_dispose(&v25, 8);
}

void __81__ACCPlatformPluginSystem_takeOneTimeProcessAssertionForBundleID_applicationPid___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __81__ACCPlatformPluginSystem_takeOneTimeProcessAssertionForBundleID_applicationPid___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

- (void)toggleProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ACCPlatformProcessAssertion *v10;
  time_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  ACCPlatformProcessAssertion *v20;
  NSObject *v21;
  dispatch_time_t v22;
  void *v23;
  _QWORD handler[4];
  ACCPlatformProcessAssertion *v25;
  ACCPlatformPluginSystem *v26;
  int v27;
  _QWORD v28[2];

  v4 = *(_QWORD *)&a4;
  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[ACCPlatformPluginSystem activeProcessAssertions](self, "activeProcessAssertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (ACCPlatformProcessAssertion *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = time(0);
    if (v11 - -[ACCPlatformProcessAssertion startTime](v10, "startTime") >= 3)
    {
      -[ACCPlatformProcessAssertion processAssertionTimer](v10, "processAssertionTimer");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);

      -[ACCPlatformProcessAssertion setStartTime:](v10, "setStartTime:", time(0));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("accessoryd.%@.%d.assertion]"), v6, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.accessoryd"), CFSTR("OneTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]([ACCPlatformProcessAssertion alloc], "initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:", v6, v14, v16, v4);
    if (v10)
    {
      -[ACCPlatformPluginSystem activeProcessAssertions](self, "activeProcessAssertions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v10, v18);

      -[ACCPlatformProcessAssertion processAssertionTimer](v10, "processAssertionTimer");
      v19 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __76__ACCPlatformPluginSystem_toggleProcessAssertionForBundleID_applicationPid___block_invoke;
      handler[3] = &unk_24D998D80;
      v20 = v10;
      v25 = v20;
      v26 = self;
      v27 = v4;
      dispatch_source_set_event_handler(v19, handler);

      -[ACCPlatformProcessAssertion processAssertionTimer](v20, "processAssertionTimer");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0);

    }
  }
  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unlock");

}

void __76__ACCPlatformPluginSystem_toggleProcessAssertionForBundleID_applicationPid___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_218A89000, v4, OS_LOG_TYPE_DEFAULT, "process assertion timer expired, invalidating process assertion %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "processAssertionTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v6, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

  objc_msgSend(*(id *)(a1 + 32), "setStartTime:", 0);
  objc_msgSend(*(id *)(a1 + 40), "applicationStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  objc_msgSend(*(id *)(a1 + 40), "activeProcessAssertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  objc_msgSend(*(id *)(a1 + 40), "applicationStateLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

}

- (void)cancelProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[ACCPlatformPluginSystem activeProcessAssertions](self, "activeProcessAssertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_218A89000, v11, OS_LOG_TYPE_DEFAULT, "Found an active repeating assertion to cancel, %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v10, "processAssertionTimer");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v13, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_msgSend(v10, "setStartTime:", time(0));
    objc_msgSend(v10, "invalidate");
    -[ACCPlatformPluginSystem activeProcessAssertions](self, "activeProcessAssertions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v15);

  }
  -[ACCPlatformPluginSystem applicationStateLock](self, "applicationStateLock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unlock");

}

- (void)launchBundleIDToBackground:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  ACCPlatformPluginSystem *v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[ACCPlatformPluginSystem isApplicationRunning:](self, "isApplicationRunning:", v4))
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 1;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      _os_log_impl(&dword_218A89000, v12, OS_LOG_TYPE_DEFAULT, "App %@ is already running.", buf, 0xCu);
    }

    v13 = (void *)MEMORY[0x24BE80C78];
    objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifier:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v13, "handleForPredicate:error:", v14, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v15 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginSystem launchBundleIDToBackground:].cold.3((uint64_t)v4);
LABEL_24:

      goto LABEL_25;
    }
    if (!v8)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v15 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginSystem launchBundleIDToBackground:].cold.1();
      goto LABEL_24;
    }
    -[ACCPlatformPluginSystem toggleProcessAssertionForBundleID:applicationPid:](self, "toggleProcessAssertionForBundleID:applicationPid:", v4, objc_msgSend(v8, "pid"));
  }
  else
  {
    v7 = objc_alloc_init((Class)WeakLinkClass(CFSTR("UIAccessoryBackgroundTaskAction"), 0));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v7, 0);
    v9 = *MEMORY[0x24BE382A0];
    v24[0] = *MEMORY[0x24BE382B8];
    v24[1] = v9;
    v25[0] = MEMORY[0x24BDBD1C8];
    v25[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38508], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke;
    v19[3] = &unk_24D998DA8;
    v20 = v4;
    v21 = self;
    objc_msgSend(v11, "openApplication:options:withResult:", v20, v10, v19);

  }
LABEL_25:

}

void __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (gLogObjects)
    v5 = gNumLogObjects <= 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v3)
  {
    if (v6)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_impl(&dword_218A89000, v8, OS_LOG_TYPE_DEFAULT, "Launching app %@ to bg succeeded, taking process assertion", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x24BE80C78];
    v13 = (_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifier:", *(_QWORD *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v12, "handleForPredicate:error:", v14, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v25;

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_3(v13);
    }
    else
    {
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 40), "toggleProcessAssertionForBundleID:applicationPid:", *(_QWORD *)(a1 + 32), objc_msgSend(v15, "pid"));
LABEL_34:

        goto LABEL_35;
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_1((uint64_t)v13, v16, v19, v20, v21, v22, v23, v24);
    }

    goto LABEL_34;
  }
  if (v6)
  {
    v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_6(a1);
LABEL_35:

}

- (BOOL)unlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (BOOL)isDeviceLocked
{
  int v2;
  BOOL result;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  v2 = MKBGetDeviceLockState();
  result = 0;
  if (v2 && v2 != 3)
  {
    if ((v2 - 1) >= 2)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v4 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
        v4 = MEMORY[0x24BDACB70];
        v5 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_218A89000, v4, OS_LOG_TYPE_DEFAULT, "Doesn't support isDeviceLocked API, treating as unlocked", v6, 2u);
      }

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDeviceLockSettingEnabled
{
  return MKBGetDeviceLockState() != 3;
}

- (int64_t)timeSinceBootInSecs
{
  timeval v3;
  size_t v4;
  _QWORD v5[2];
  int v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v6 = 0x1500000001;
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  v5[1] = 0xAAAAAAAAAAAAAAAALL;
  v4 = 16;
  if (sysctl(v6, 2u, v5, &v4, 0, 0) == -1)
    return 0;
  v3.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v3, 0);
  return v3.tv_sec - v5[0];
}

- (BOOL)isLockScreenUIDisplayed
{
  uint64_t v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v2 = SBSSpringBoardServerPort();
  MEMORY[0x219A1E738](v2, (char *)&v7 + 1, &v7);
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v9 = HIBYTE(v7);
    _os_log_impl(&dword_218A89000, v5, OS_LOG_TYPE_INFO, "device lockScreenDisplayed = %d", buf, 8u);
  }

  return HIBYTE(v7) != 0;
}

- (BOOL)createFolder:(const char *)a3 mode:(unsigned __int16)a4
{
  int v5;
  int v6;
  BOOL v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v12;

  if (a3)
  {
    v5 = mkdir(a3, a4);
    if (!v5)
      return 1;
    v6 = v5;
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginSystem createFolder:mode:].cold.3((uint64_t)a3, v6, v12);
  }
  else
  {
    if (gLogObjects)
      v9 = gNumLogObjects < 1;
    else
      v9 = 1;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginSystem createFolder:mode:].cold.1(v12);
  }

  return 0;
}

- (id)mediaLibraryUIDString:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  const __CFString *v16;

  if (a3)
  {
    ACCGetOSVersion();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@"), v5, CFSTR("4954524C"), v3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_getMediaLibraryHelper___mediaLibraryHelperInitOnce != -1)
      dispatch_once(&_getMediaLibraryHelper___mediaLibraryHelperInitOnce, &__block_literal_global_288);
    v7 = (id)_getMediaLibraryHelper___mediaLibraryHelper;
    ACCGetOSVersion();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "showMusic");
    v10 = CFSTR("M");
    if (!v9)
      v10 = CFSTR("N");
    v11 = v10;
    v12 = objc_msgSend(v7, "showPodcasts");
    v13 = CFSTR("P");
    if (!v12)
      v13 = CFSTR("N");
    v14 = v13;
    v15 = objc_msgSend(v7, "showAudioBooks");

    v6 = &stru_24D9991C8;
    if (v5 && v8)
    {
      v16 = CFSTR("B");
      if (!v15)
        v16 = CFSTR("N");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@%@%@-%@"), v8, v11, v14, v16, v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6;
}

- (void)startObservingFirstUnlockNotification
{
  BOOL v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD handler[4];
  int v7;
  uint8_t buf[4];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218A89000, v4, OS_LOG_TYPE_DEFAULT, "Device has not been unlocked since last boot. Waiting For first unlock", buf, 2u);
  }

  *(_DWORD *)buf = 0;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __64__ACCPlatformPluginSystem_startObservingFirstUnlockNotification__block_invoke;
  handler[3] = &__block_descriptor_36_e8_v12__0i8l;
  v7 = 0;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", (int *)buf, v5, handler);

}

void __64__ACCPlatformPluginSystem_startObservingFirstUnlockNotification__block_invoke(uint64_t a1)
{
  NSObject *v1;

  notify_cancel(*(_DWORD *)(a1 + 32));
  dispatch_get_global_queue(0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v1, &__block_literal_global_161);

}

void __64__ACCPlatformPluginSystem_startObservingFirstUnlockNotification__block_invoke_2()
{
  BOOL v0;
  id v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_218A89000, v2, OS_LOG_TYPE_DEFAULT, "Posting first unlock notification", v4, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("ACCPlatformApplicationFirstUnlockNotification"), 0, 0);

}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (NSMutableDictionary)activeProcessAssertions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActiveProcessAssertions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSLock)applicationStateLock
{
  return self->_applicationStateLock;
}

- (void)setApplicationStateLock:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateLock, 0);
  objc_storeStrong((id *)&self->_activeProcessAssertions, 0);
  objc_storeStrong((id *)&self->_mainDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

- (void)launchApplication:(uint64_t)a1 options:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_218A89000, v1, v2, "Error creating GCGameControllerActivationContext action for %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __53__ACCPlatformPluginSystem_launchApplication_options___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_218A89000, v1, v2, "Error launching %@:\n%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)supportsExternalAccessoryBackgroundMode:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_218A89000, v1, OS_LOG_TYPE_DEBUG, "client '%@' supports background EA = %d", v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)isApplicationInForeground:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_218A89000, v0, v1, "app bundleID %@ is in background", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isApplicationRunning:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_218A89000, v0, v1, "app bundleID %@ is NOT actively running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)takeOneTimeProcessAssertionForBundleID:applicationPid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_218A89000, v0, v1, "acquired one-time assertion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)takeOneTimeProcessAssertionForBundleID:applicationPid:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218A89000, v0, v1, "unable to take one-time process assertion for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__ACCPlatformPluginSystem_takeOneTimeProcessAssertionForBundleID_applicationPid___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_218A89000, a2, a3, "about to invalidate one-time assertion %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)launchBundleIDToBackground:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218A89000, v0, v1, "Unable to take assertion. ProcessHandle is NULL, cannot locate PID for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)launchBundleIDToBackground:(uint64_t)a1 .cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_218A89000, v1, v2, "error fetching PID for app with bundleID:%@ error:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_218A89000, a2, a3, "Unable to take assertion. ProcessHandle is NULL, cannot locate PID for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_3(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_218A89000, v1, v2, "error fetching PID for app with bundleID:%@ error:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_6(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_218A89000, v1, v2, "error launching app %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)createFolder:(os_log_t)log mode:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218A89000, log, OS_LOG_TYPE_ERROR, "null folderPath", v1, 2u);
}

- (void)createFolder:(NSObject *)a3 mode:.cold.3(uint64_t a1, int a2, NSObject *a3)
{
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = *__error();
  v7 = 136315650;
  v8 = a1;
  v9 = 1024;
  v10 = a2;
  v11 = 1024;
  v12 = v6;
  _os_log_error_impl(&dword_218A89000, a3, OS_LOG_TYPE_ERROR, "Error mkdir %s %d:%d", (uint8_t *)&v7, 0x18u);
}

@end
