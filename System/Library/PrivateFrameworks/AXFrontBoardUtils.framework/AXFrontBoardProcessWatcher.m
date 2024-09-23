@implementation AXFrontBoardProcessWatcher

+ (void)validateFocusedAppsWithEvent:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = AXValidateFocusedAppsNotification;
  v8 = CFSTR("event");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", v5, 0, v7);

}

- (AXFrontBoardProcessWatcher)init
{
  AXFrontBoardProcessWatcher *v2;
  id v3;
  uint64_t v4;
  AXDispatchTimer *appTransitionTimer;
  uint64_t v6;
  NSSet *cachedFocusedAppPIDs;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id observerToken;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id location[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)AXFrontBoardProcessWatcher;
  v2 = -[AXFrontBoardProcessWatcher init](&v27, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE005F0]);
    v4 = objc_msgSend(v3, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    appTransitionTimer = v2->_appTransitionTimer;
    v2->_appTransitionTimer = (AXDispatchTimer *)v4;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_appTransitionTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    cachedFocusedAppPIDs = v2->_cachedFocusedAppPIDs;
    v2->_cachedFocusedAppPIDs = (NSSet *)v6;

    objc_msgSend(MEMORY[0x24BE38070], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v8, "allProcesses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12++), "addObserver:", v2);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }

    objc_msgSend(v8, "addObserver:", v2);
    objc_initWeak(location, v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = AXValidateFocusedAppsNotification;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __34__AXFrontBoardProcessWatcher_init__block_invoke;
    v20[3] = &unk_24DA1AAE8;
    objc_copyWeak(&v21, location);
    objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v14, 0, v15, v20);
    v16 = objc_claimAutoreleasedReturnValue();
    observerToken = v2->_observerToken;
    v2->_observerToken = (id)v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);

  }
  AXRuntimeLogPID();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_218DDF000, v18, OS_LOG_TYPE_INFO, "did initialize AXFrontBoardProcessWatcher", (uint8_t *)location, 2u);
  }

  return v2;
}

void __34__AXFrontBoardProcessWatcher_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_validateFocusedApps:", objc_msgSend(v5, "integerValue"));

}

- (void)dealloc
{
  AXDispatchTimer *appTransitionTimer;
  void *v4;
  id observerToken;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[AXDispatchTimer cancel](self->_appTransitionTimer, "cancel");
  appTransitionTimer = self->_appTransitionTimer;
  self->_appTransitionTimer = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_observerToken);

  observerToken = self->_observerToken;
  self->_observerToken = 0;

  objc_msgSend(MEMORY[0x24BE38070], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "allProcesses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "removeObserver:", self);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "removeObserver:", self);
  v12.receiver = self;
  v12.super_class = (Class)AXFrontBoardProcessWatcher;
  -[AXFrontBoardProcessWatcher dealloc](&v12, sel_dealloc);
}

- (id)_processDescriptionForPID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BE38070], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processForPID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (int)v3;
  if (v5)
  {
    objc_msgSend(v5, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("PID:%ld Name:%@ BundleID:%@"), v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PID:%ld <no other info available>"), (int)v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_validateFocusedApps:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet **p_cachedFocusedAppPIDs;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSSet *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  char *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  char *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  AXRuntimeLogPID();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "AXValidateFocusedAppsEventAppStateVisibilityDidChange";
    v65 = 2048;
    v66 = a3;
    _os_log_impl(&dword_218DDF000, v5, OS_LOG_TYPE_INFO, "Received focused app validation event: %s (%ld)", buf, 0x16u);
  }

  v6 = (void *)MEMORY[0x24BDBCF20];
  AXFrontBoardFocusedAppPIDs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  p_cachedFocusedAppPIDs = &self->_cachedFocusedAppPIDs;
  if ((objc_msgSend(v8, "isEqualToSet:", self->_cachedFocusedAppPIDs) & 1) == 0)
  {
    AXRuntimeLogPID();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      AXRuntimeLogPID();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[AXFrontBoardProcessWatcher _validateFocusedApps:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
      v52 = v8;

      AXRuntimeLogPID();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[AXFrontBoardProcessWatcher _validateFocusedApps:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v28 = *p_cachedFocusedAppPIDs;
      v29 = -[NSSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v58;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v58 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v32);
            AXRuntimeLogPID();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              -[AXFrontBoardProcessWatcher _processDescriptionForPID:](self, "_processDescriptionForPID:", objc_msgSend(v33, "integerValue"));
              v35 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v64 = v35;
              _os_log_debug_impl(&dword_218DDF000, v34, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);

            }
            ++v32;
          }
          while (v30 != v32);
          v30 = -[NSSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        }
        while (v30);
      }

      AXRuntimeLogPID();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[AXFrontBoardProcessWatcher _validateFocusedApps:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v44 = v52;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v54;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v54 != v47)
              objc_enumerationMutation(v44);
            v49 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v48);
            AXRuntimeLogPID();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              -[AXFrontBoardProcessWatcher _processDescriptionForPID:](self, "_processDescriptionForPID:", objc_msgSend(v49, "integerValue"));
              v51 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v64 = v51;
              _os_log_debug_impl(&dword_218DDF000, v50, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);

            }
            ++v48;
          }
          while (v46 != v48);
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v46);
      }

      p_cachedFocusedAppPIDs = &self->_cachedFocusedAppPIDs;
      v8 = v52;
    }
    objc_storeStrong((id *)p_cachedFocusedAppPIDs, v8);
    UIAccessibilityPostNotification(0x1389u, 0);
  }

}

- (BOOL)_processStateChangeIsVisibilityStateChangeFrom:(id)a3 to:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v9;

  v5 = a4;
  v6 = objc_msgSend(a3, "visibility");
  v7 = objc_msgSend(v5, "visibility");

  if (v6 == 1 && !v7)
    return 0;
  if (v6)
    v9 = 0;
  else
    v9 = v7 == 1;
  return !v9 && v6 != v7;
}

- (BOOL)_processStateChangeIsTaskStateChangeFrom:(id)a3 to:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "taskState");
  v7 = objc_msgSend(v5, "taskState");

  return v6 != v7;
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  objc_msgSend(v5, "addObserver:", self);
  AXRuntimeLogPID();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AXFrontBoardProcessWatcher processManager:didAddProcess:].cold.1(v5, v6);

  objc_msgSend(v5, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pid");

  if (v8 >= 1)
  {
    objc_msgSend(v5, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "taskState");

    if (v10 == 2)
    {
      objc_msgSend(v5, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pid");
      AXProcessIsCarPlay();
      AXPidUnsuspend();

    }
  }

}

- (void)processDidExit:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a3, "pid");
  if ((int)v3 >= 1)
  {
    v5[0] = CFSTR("pid");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[1] = CFSTR("terminated");
    v6[0] = v4;
    v6[1] = CFSTR("true");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
    AXPushNotificationToSystemForBroadcast();

  }
}

- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[5];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "pid");
  AXRuntimeLogPID();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_218DDF000, v12, OS_LOG_TYPE_DEBUG, "Process state change:%@.\n From:%@\nTo:%@", buf, 0x20u);
  }

  if (v11 >= 1
    && -[AXFrontBoardProcessWatcher _processStateChangeIsTaskStateChangeFrom:to:](self, "_processStateChangeIsTaskStateChangeFrom:to:", v9, v10))
  {
    v13 = objc_msgSend(v10, "taskState");
    AXProcessIsCarPlay();
    if (v13 == 2)
      AXPidUnsuspend();
    else
      AXPidSuspend();
  }
  if (-[AXFrontBoardProcessWatcher _processStateChangeIsVisibilityStateChangeFrom:to:](self, "_processStateChangeIsVisibilityStateChangeFrom:to:", v9, v10))
  {
    -[AXDispatchTimer cancel](self->_appTransitionTimer, "cancel");
    if (v11 >= 1 && objc_msgSend(v10, "visibility") != 2)
    {
      AXProcessIsCarPlay();
      AXTentativePidSuspend();
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__AXFrontBoardProcessWatcher_process_stateDidChangeFromState_toState___block_invoke;
    block[3] = &unk_24DA1AB38;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __70__AXFrontBoardProcessWatcher_process_stateDidChangeFromState_toState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v2 = (void *)MEMORY[0x24BDBCF20];
  AXFrontBoardFocusedAppPIDs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_validateFocusedApps:", 0);
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __70__AXFrontBoardProcessWatcher_process_stateDidChangeFromState_toState___block_invoke_2;
    v6[3] = &unk_24DA1AB10;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "afterDelay:processBlock:cancelBlock:", v6, 0, 2.0);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __70__AXFrontBoardProcessWatcher_process_stateDidChangeFromState_toState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_validateFocusedApps:", 0);

}

+ (id)processForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  AXFrontBoardRunningAppProcesses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__AXFrontBoardProcessWatcher_processForBundleIdentifier___block_invoke;
  v8[3] = &unk_24DA1AB60;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __57__AXFrontBoardProcessWatcher_processForBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (id)accessibilitySpokenNameForProcess:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v3 = a3;
  if (objc_msgSend(v3, "isApplicationProcess"))
  {
    v4 = v3;
    objc_getAssociatedObject(v4, &_AXSpokenNameKey);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("NO-SPOKEN-NAME")))
    {

      v5 = 0;
    }
    else if (!v5)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AXApplicationNameLabelForBundleIdentifier((uint64_t)v6);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v7 = v4;
        v8 = v5;
      }
      else
      {
        v8 = CFSTR("NO-SPOKEN-NAME");
        v7 = v4;
      }
      objc_setAssociatedObject(v7, &_AXSpokenNameKey, v8, (void *)0x303);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFocusedAppPIDs, 0);
  objc_storeStrong((id *)&self->_appTransitionTimer, 0);
  objc_storeStrong(&self->_observerToken, 0);
}

- (void)_validateFocusedApps:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218DDF000, a1, a3, " New:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_validateFocusedApps:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218DDF000, a1, a3, " Previous:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_validateFocusedApps:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218DDF000, a1, a3, "focused apps did change", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)processManager:(void *)a1 didAddProcess:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_218DDF000, a2, OS_LOG_TYPE_DEBUG, "Did add new process: %@\nState: %@", (uint8_t *)&v5, 0x16u);

}

@end
