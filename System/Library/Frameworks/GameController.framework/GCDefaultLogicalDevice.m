@implementation GCDefaultLogicalDevice

intptr_t __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_147(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_150(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 7, a2);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v6[9], "objectEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setStatuses:", v4);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

intptr_t __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_178(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_180(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 18, a2);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v6[19], "objectEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setBattery:", v4);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

void __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_189(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int isInternalBuild;
  NSObject *v9;
  id GKDaemonProxyClass;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GCGameIntentBlocklist();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frontmostApplicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

    isInternalBuild = gc_isInternalBuild();
    if (!v7)
    {
      if (isInternalBuild)
      {
        getGCLogger();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 134217984;
          v20 = a2;
          _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_DEFAULT, "Received intent: %ld", (uint8_t *)&v19, 0xCu);
        }

      }
      if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_DEFAULT, "Opening game center overlay", (uint8_t *)&v19, 2u);
          }

        }
        GKDaemonProxyClass = getGKDaemonProxyClass();
        objc_msgSend(getGKLocalPlayerClass(), "local");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(GKDaemonProxyClass, "proxyForPlayer:", v11);
        v9 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(getGKGameClass(), "currentGame");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "internal");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = getpid();
        getGKDashboardLaunchContextGameController();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject utilityService](v9, "utilityService");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext:", v13, v14, 0, v15);

      }
      else
      {
        +[GCGameIntentManager instance](GCGameIntentManager, "instance");
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSObject toggleGamesFolder](v9, "toggleGamesFolder");
      }
      goto LABEL_11;
    }
    if (isInternalBuild)
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "Blocklisted application foregrounded, ignoring game intent", (uint8_t *)&v19, 2u);
      }
LABEL_11:

    }
  }

}

void __38___GCDefaultLogicalDevice__addClient___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeClient:", v2);

}

@end
