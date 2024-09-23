@implementation LSApplicationWorkspaceRemoteObserver

- (void)setObservinglsd:(BOOL)a3
{
  self->_observinglsd = a3;
}

- (void)addLocalObserver:(id)a3
{
  LSApplicationWorkspaceRemoteObserver *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v5)
    -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (BOOL)isObservinglsd
{
  return self->_observinglsd;
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  id v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _LSInstallLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:].cold.3();

  _LSInstallLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:].cold.2();

  _LSInstallLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:].cold.1();

  v46 = (void *)objc_opt_new();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v46, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v46, "count"))
  {
    v45 = v7;
    v17 = (void *)objc_opt_new();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v44 = v6;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v56 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
          +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v23, v44);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appState");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isValid");

          if ((v26 & 1) != 0)
          {
            objc_msgSend(v17, "addObject:", v24);
          }
          else
          {
            _LSInstallLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v66 = v23;
              v67 = 2112;
              v68 = v24;
              _os_log_error_impl(&dword_182882000, v27, OS_LOG_TYPE_ERROR, "Couldn't instantiate valid proxy for %@ when processing active installs, got %@", buf, 0x16u);
            }

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      }
      while (v20);
    }

    v28 = (void *)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v29 = v45;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v52 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k);
          +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v34, v44);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "appState");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isValid");

          if ((v37 & 1) != 0)
          {
            objc_msgSend(v28, "addObject:", v35);
          }
          else
          {
            _LSInstallLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v66 = v34;
              v67 = 2112;
              v68 = v35;
              _os_log_error_impl(&dword_182882000, v38, OS_LOG_TYPE_ERROR, "Couldn't instantiate valid proxy for %@ when processing active installs, got %@", buf, 0x16u);
            }

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v31);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v39 = v46;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    v6 = v44;
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v48;
      do
      {
        for (m = 0; m != v41; ++m)
        {
          if (*(_QWORD *)v48 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * m), "applicationInstallsArePrioritized:arePaused:", v17, v28, v44);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      }
      while (v41);
    }

    v7 = v45;
  }

}

- (id)localObservers
{
  LSApplicationWorkspaceRemoteObserver *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NSHashTable allObjects](v2->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return v4;
}

- (unint64_t)currentObserverCount
{
  LSApplicationWorkspaceRemoteObserver *v2;
  NSHashTable *observers;
  unint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  observers = v2->_observers;
  if (observers)
    v4 = -[NSHashTable count](observers, "count");
  else
    v4 = 0;
  objc_sync_exit(v2);

  return v4;
}

- (LSApplicationWorkspaceRemoteObserver)init
{
  LSApplicationWorkspaceRemoteObserver *v2;
  NSUUID *v3;
  NSUUID *uuid;
  uint64_t v5;
  NSHashTable *observers;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *progressSubscriptionsQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LSApplicationWorkspaceRemoteObserver;
  v2 = -[LSApplicationWorkspaceRemoteObserver init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v2->_uuid;
    v2->_uuid = v3;

    v2->_observinglsd = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("LSApplicationWorkspaceRemoteObserver.progress.subscriptions", v8);
    progressSubscriptionsQueue = v2->_progressSubscriptionsQueue;
    v2->_progressSubscriptionsQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LSApplicationWorkspaceRemoteObserver uuid](self, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

}

- (LSApplicationWorkspaceRemoteObserver)initWithCoder:(id)a3
{
  id v4;
  LSApplicationWorkspaceRemoteObserver *v5;
  uint64_t v6;
  NSUUID *uuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSApplicationWorkspaceRemoteObserver;
  v5 = -[LSApplicationWorkspaceRemoteObserver init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

  }
  return v5;
}

- (void)removeLocalObserver:(id)a3
{
  LSApplicationWorkspaceRemoteObserver *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v5)
    -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4 filterLaunchProhibited:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v23 = v8;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayByFilteringLaunchProhibitedAppsFrom:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
  }
  v10 = v9;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_msgSend(v17, "valueForKey:", CFSTR("observeLaunchProhibitedApps")),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v19, "BOOLValue"),
                v19,
                v18 = v23,
                (v20 & 1) != 0)
            || (v21 = objc_msgSend(v10, "count", v18), v18 = v10, v21))
          {
            objc_msgSend(v17, a3, v18);
          }
          v14 = 1;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  return v14 & 1;
}

- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4
{
  return -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:filterLaunchProhibited:](self, "messageObserversWithSelector:andApps:filterLaunchProhibited:", a3, a4, 1);
}

- (BOOL)messageObserversWithSelector:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, a3);
          v7 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidStart", v6);

}

void __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: InstallsStarted %@", buf, 0xCu);
  }

  _LSContextInvalidate();
  if (objc_msgSend(*(id *)(a1 + 40), "messageObserversWithSelector:andApps:", sel_applicationInstallsDidStart_, *(_QWORD *)(a1 + 32)))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke_589;
    block[3] = &unk_1E1040478;
    v9 = v4;
    dispatch_async(v5, block);

  }
  v6 = *(void **)(a1 + 40);
  filterProxiesForHelperPlaceholders(*(void **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageObserversWithSelector:andApps:filterLaunchProhibited:", sel_helperPlaceholdersInstalled_, v7, 0);

}

void __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke_589(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5), "installProgress", (_QWORD)v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidUpdateIcon___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidUpdateIcon", v6);

}

uint64_t __73__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidUpdateIcon___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: IconsUpdated %@", (uint8_t *)&v5, 0xCu);
  }

  _LSContextInvalidate();
  return objc_msgSend(*(id *)(a1 + 40), "messageObserversWithSelector:andApps:", sel_applicationInstallsDidUpdateIcon_, *(_QWORD *)(a1 + 32));
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidChange", v6);

}

void __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = a1;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8), 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "appState");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isValid") & 1) != 0)
          {
            objc_msgSend(v10, "appState");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isPlaceholder");

            if (v13)
              objc_msgSend(v3, "addObject:", v10);
          }
          else
          {

          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  _LSContextInvalidate();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(v14 + 40), "messageObserversWithSelector:andApps:", sel_applicationInstallsDidChange_, v3);

}

- (void)applicationsWillInstall:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__LSApplicationWorkspaceRemoteObserver_applicationsWillInstall___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsWillInstall", v6);

}

uint64_t __64__LSApplicationWorkspaceRemoteObserver_applicationsWillInstall___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Will install %@", (uint8_t *)&v5, 0xCu);
  }

  _LSContextInvalidate();
  return objc_msgSend(*(id *)(a1 + 40), "messageObserversWithSelector:andApps:", sel_applicationsWillInstall_, *(_QWORD *)(a1 + 32));
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  LSApplicationWorkspaceRemoteObserver *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "Received applicationsDidInstall:%@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__LSApplicationWorkspaceRemoteObserver_applicationsDidInstall___block_invoke;
  v7[3] = &unk_1E103FCC8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidInstall", v7);

}

void __63__LSApplicationWorkspaceRemoteObserver_applicationsDidInstall___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  dispatch_time_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  _BYTE v47[128];
  __int128 block;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  _LSContextInvalidate();
  +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = 0;
  objc_msgSend(v2, "getKnowledgeUUID:andSequenceNumber:", &v46, &v45);
  v3 = v46;
  v4 = v45;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LaunchServices observer: Installed %@ {%@ %@}"), *(_QWORD *)(a1 + 32), v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v4;
  v38 = v3;
  if (_LSLoggingQueue_onceToken != -1)
    dispatch_once(&_LSLoggingQueue_onceToken, &__block_literal_global_905);
  v6 = _LSLoggingQueue_logQueue;
  *(_QWORD *)&block = MEMORY[0x1E0C809B0];
  *((_QWORD *)&block + 1) = 3221225472;
  v49 = ___LSSetCrashMessage_block_invoke;
  v50 = &unk_1E1040478;
  v51 = v5;
  v7 = v5;
  dispatch_sync(v6, &block);

  v36 = v7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v39 = a1;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
        objc_msgSend(v13, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v15, 0);
          v16 = objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[NSObject appState](v16, "appState");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "isInstalled") & 1) != 0)
            {
              -[NSObject bundleURL](v16, "bundleURL");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "path");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                -[NSObject bundleURL](v16, "bundleURL");
                v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v21 = (const char *)objc_msgSend(v20, "fileSystemRepresentation");

                if (v21 && access(v21, 0) && *__error() == 2)
                {
                  _LSDefaultLog();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(block) = 138412290;
                    *(_QWORD *)((char *)&block + 4) = v16;
                    _os_log_error_impl(&dword_182882000, v22, OS_LOG_TYPE_ERROR, "App validation Failed: bundle path does not exist %@", (uint8_t *)&block, 0xCu);
                  }

                  -[NSObject bundleIdentifier](v16, "bundleIdentifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  _LSLogStepAsync(8, 0, v23, CFSTR("App validation failed, ignoring didInstall notification for %@"), v24, v25, v26, v27, (uint64_t)v16);

                }
                else
                {
                  objc_msgSend(v13, "bundleIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  _LSLogStepAsync(8, 1, v29, CFSTR("applicationsDidInstall %@"), v30, v31, v32, v33, (uint64_t)v16);

                  objc_msgSend(v40, "addObject:", v16);
                }
                goto LABEL_24;
              }
            }
            else
            {

            }
          }
          _LSDefaultLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(_QWORD *)((char *)&block + 4) = v16;
            _os_log_error_impl(&dword_182882000, v28, OS_LOG_TYPE_ERROR, "LSApplicationProxy %@ is invalid", (uint8_t *)&block, 0xCu);
          }

        }
        else
        {
          _LSDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(_QWORD *)((char *)&block + 4) = v13;
            _os_log_error_impl(&dword_182882000, v16, OS_LOG_TYPE_ERROR, "LSApplicationProxy %@ is invalid (has nil identifier)", (uint8_t *)&block, 0xCu);
          }
        }
LABEL_24:

        ++v12;
      }
      while (v10 != v12);
      v34 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      v10 = v34;
    }
    while (v34);
  }

  objc_msgSend(*(id *)(v39 + 40), "messageObserversWithSelector:andApps:", sel_applicationsDidInstall_, v40);
  v35 = dispatch_time(0, 2000000000);
  if (_LSLoggingQueue_onceToken != -1)
    dispatch_once(&_LSLoggingQueue_onceToken, &__block_literal_global_905);
  dispatch_after(v35, (dispatch_queue_t)_LSLoggingQueue_logQueue, &__block_literal_global_912);

}

- (void)pluginsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Installed plugins %@", buf, 0xCu);
  }

  _LSContextInvalidate();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "pluginsDidInstall:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidFailToInstall", v6);

}

uint64_t __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke_cold_1();

  _LSContextInvalidate();
  return objc_msgSend(*(id *)(a1 + 40), "messageObserversWithSelector:andApps:", sel_applicationsDidFailToInstall_, *(_QWORD *)(a1 + 32));
}

- (void)pluginsWillUninstall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Plugins will be removed: %@", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "pluginsWillUninstall:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)applicationsWillUninstall:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__LSApplicationWorkspaceRemoteObserver_applicationsWillUninstall___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsWillUninstall", v6);

}

uint64_t __66__LSApplicationWorkspaceRemoteObserver_applicationsWillUninstall___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Will uninstall %@", (uint8_t *)&v5, 0xCu);
  }

  _LSContextInvalidate();
  return objc_msgSend(*(id *)(a1 + 40), "messageObserversWithSelector:andApps:", sel_applicationsWillUninstall_, *(_QWORD *)(a1 + 32));
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__LSApplicationWorkspaceRemoteObserver_applicationsDidUninstall___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidUninstall", v6);

}

void __65__LSApplicationWorkspaceRemoteObserver_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Uninstalled %@", (uint8_t *)&v6, 0xCu);
  }

  _LSContextInvalidate();
  objc_msgSend(*(id *)(a1 + 40), "messageObserversWithSelector:andApps:", sel_applicationsDidUninstall_, *(_QWORD *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  filterProxiesForHelperPlaceholders(*(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageObserversWithSelector:andApps:filterLaunchProhibited:", sel_helperPlaceholdersUninstalled_, v5, 0);

}

- (void)pluginsDidUninstall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Uninstalled plugins %@", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "pluginsDidUninstall:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)applicationsDidFailToUninstall:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidFailToUninstall", v6);

}

uint64_t __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "messageObserversWithSelector:andApps:", sel_applicationsDidFailToUninstall_, *(_QWORD *)(a1 + 32));
}

- (void)applicationInstallsDidPause:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: PAUSE %@", (uint8_t *)&v6, 0xCu);
  }

  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:](self, "messageObserversWithSelector:andApps:", sel_applicationInstallsDidPause_, v4);
}

- (void)applicationInstallsDidResume:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: RESUME %@", (uint8_t *)&v6, 0xCu);
  }

  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:](self, "messageObserversWithSelector:andApps:", sel_applicationInstallsDidResume_, v4);
}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: CANCEL %@", (uint8_t *)&v6, 0xCu);
  }

  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:](self, "messageObserversWithSelector:andApps:", sel_applicationInstallsDidCancel_, v4);
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: PRIORITIZE %@", (uint8_t *)&v6, 0xCu);
  }

  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:](self, "messageObserversWithSelector:andApps:", sel_applicationInstallsDidPrioritize_, v4);
}

- (void)applicationStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: StateChange %@", (uint8_t *)&v6, 0xCu);
  }

  _LSContextInvalidate();
  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:](self, "messageObserversWithSelector:andApps:", sel_applicationStateDidChange_, v4);

}

- (void)applicationIconDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: IconChange %@", (uint8_t *)&v6, 0xCu);
  }

  _LSContextInvalidate();
  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:](self, "messageObserversWithSelector:andApps:", sel_applicationIconDidChange_, v4);

}

- (void)networkUsageChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: NetworkUsageChanged using network: %@", buf, 0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0);
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
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "networkUsageChanged:", v3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: deviceManagementPolicyDidChange %@", (uint8_t *)&v6, 0xCu);
  }

  _LSContextInvalidate();
  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:](self, "messageObserversWithSelector:andApps:", sel_deviceManagementPolicyDidChange_, v4);

}

- (void)applicationsDidChangePersonas:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  LSApplicationWorkspaceRemoteObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__LSApplicationWorkspaceRemoteObserver_applicationsDidChangePersonas___block_invoke;
  v6[3] = &unk_1E103FCC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidChangePersonas", v6);

}

uint64_t __70__LSApplicationWorkspaceRemoteObserver_applicationsDidChangePersonas___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: applicationsDidChangePersonas %@", (uint8_t *)&v5, 0xCu);
  }

  _LSContextInvalidate();
  return objc_msgSend(*(id *)(a1 + 40), "messageObserversWithSelector:andApps:", sel_applicationsDidChangePersonas_, *(_QWORD *)(a1 + 32));
}

- (void)databaseWasRebuilt
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__LSApplicationWorkspaceRemoteObserver_databaseWasRebuilt__block_invoke;
  v2[3] = &unk_1E1040478;
  v2[4] = self;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.databaserebuilt", v2);
}

uint64_t __58__LSApplicationWorkspaceRemoteObserver_databaseWasRebuilt__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: databaseWasRebuilt", v4, 2u);
  }

  _LSContextInvalidate();
  return objc_msgSend(*(id *)(a1 + 32), "messageObserversWithSelector:", sel_databaseWasRebuilt);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSubscriptionsQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LaunchServices: observer: installProgress changed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "LaunchServices observer: Apps Failed be installed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "LaunchServices observer: Apps Failed be Uninstalled: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LaunchServices observer: Paused apps: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LaunchServices observer: Prioritized apps: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.3()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_182882000, v0, OS_LOG_TYPE_DEBUG, "LaunchServices observer: Catchup Callback", v1, 2u);
  OUTLINED_FUNCTION_33();
}

@end
