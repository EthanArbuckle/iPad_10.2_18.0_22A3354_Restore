@implementation NPKApplicationStateListener

- (NPKApplicationStateListener)init
{
  NPKApplicationStateListener *v2;
  NPKApplicationStateListener *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalClassQueue;
  NPKThreadSafeObserverManager *v7;
  NPKObserverManager *observerManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NPKApplicationStateListener;
  v2 = -[NPKApplicationStateListener init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_appStateLock._os_unfair_lock_opaque = 0;
    v2->_appState = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.nanoPassKit.applicationStateListener", v4);
    internalClassQueue = v3->_internalClassQueue;
    v3->_internalClassQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(NPKThreadSafeObserverManager);
    observerManager = v3->_observerManager;
    v3->_observerManager = &v7->super;

  }
  return v3;
}

- (void)prewarm
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *internalClassQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NPKApplicationStateListener *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Prewarming app state", buf, 0xCu);
    }

  }
  internalClassQueue = self->_internalClassQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__NPKApplicationStateListener_prewarm__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalClassQueue, block);
}

uint64_t __38__NPKApplicationStateListener_prewarm__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retrieveAppState:", 0);
}

- (unint64_t)cachedAppState
{
  os_unfair_lock_s *p_appStateLock;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  NSObject *internalClassQueue;
  _QWORD block[5];
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t);
  void *v16;
  NPKApplicationStateListener *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  NPKApplicationStateListener *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  p_appStateLock = &self->_appStateLock;
  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v15 = __45__NPKApplicationStateListener_cachedAppState__block_invoke;
  v16 = &unk_24CFE8318;
  v17 = self;
  v18 = &v19;
  v5 = v14;
  os_unfair_lock_lock(p_appStateLock);
  v15((uint64_t)v5);

  os_unfair_lock_unlock(p_appStateLock);
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v5)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v20[3] - 1;
      if (v8 > 2)
        v9 = CFSTR("Unknown");
      else
        v9 = off_24CFEB648[v8];
      *(_DWORD *)buf = 134218242;
      v24 = self;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Getting cached app state. State: %@", buf, 0x16u);
    }

  }
  v10 = v20[3];
  if (!v10)
  {
    internalClassQueue = self->_internalClassQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __45__NPKApplicationStateListener_cachedAppState__block_invoke_41;
    block[3] = &unk_24CFE7998;
    block[4] = self;
    dispatch_async(internalClassQueue, block);
    v10 = v20[3];
  }
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __45__NPKApplicationStateListener_cachedAppState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __45__NPKApplicationStateListener_cachedAppState__block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retrieveAppState:", 0);
}

- (void)appState:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalClassQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    internalClassQueue = self->_internalClassQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __40__NPKApplicationStateListener_appState___block_invoke;
    v7[3] = &unk_24CFE7E90;
    v7[4] = self;
    v8 = v4;
    dispatch_async(internalClassQueue, v7);

  }
}

uint64_t __40__NPKApplicationStateListener_appState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retrieveAppState:", *(_QWORD *)(a1 + 40));
}

- (void)registerObserver:(id)a3
{
  id v4;

  -[NPKObserverManager registerObserver:](self->_observerManager, "registerObserver:", a3);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)removeObserver:(id)a3
{
  id v4;

  -[NPKObserverManager unregisterObserver:](self->_observerManager, "unregisterObserver:", a3);
  if (!-[NPKObserverManager hasObservers](self->_observerManager, "hasObservers"))
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

  }
}

- (void)applicationStateDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__NPKApplicationStateListener_applicationStateDidChange___block_invoke;
  v3[3] = &unk_24CFEB550;
  v3[4] = self;
  -[NPKApplicationStateListener _handleApplicationChangeNotificationWithWorkspaceApplicationProxies:newStateResolver:](self, "_handleApplicationChangeNotificationWithWorkspaceApplicationProxies:newStateResolver:", a3, v3);
}

uint64_t __57__NPKApplicationStateListener_applicationStateDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationStateWithLSApplicationState:", a2);
}

- (void)applicationsDidInstall:(id)a3
{
  -[NPKApplicationStateListener _handleApplicationChangeNotificationWithWorkspaceApplicationProxies:newStateResolver:](self, "_handleApplicationChangeNotificationWithWorkspaceApplicationProxies:newStateResolver:", a3, &__block_literal_global_19);
}

uint64_t __54__NPKApplicationStateListener_applicationsDidInstall___block_invoke()
{
  return 1;
}

- (void)applicationsDidUninstall:(id)a3
{
  -[NPKApplicationStateListener _handleApplicationChangeNotificationWithWorkspaceApplicationProxies:newStateResolver:](self, "_handleApplicationChangeNotificationWithWorkspaceApplicationProxies:newStateResolver:", a3, &__block_literal_global_44_0);
}

uint64_t __56__NPKApplicationStateListener_applicationsDidUninstall___block_invoke()
{
  return 3;
}

- (void)_retrieveAppState:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  uint8_t buf[4];
  NPKApplicationStateListener *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = self;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Retrieving application record.", buf, 0xCu);
    }

  }
  v8 = objc_alloc(MEMORY[0x24BDC1540]);
  v9 = *MEMORY[0x24BE6F818];
  v18 = 0;
  v10 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, &v18);
  v11 = v18;
  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      pk_Payment_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromBOOL();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v20 = self;
        v21 = 2112;
        v22 = v9;
        v23 = 2112;
        v24 = v15;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_ERROR, "Error: [NPKApplicationStateListener] %p Failed to fetch %@ application record. App Record is nil? %@. Error: %@", buf, 0x2Au);

      }
    }
  }
  objc_msgSend(v10, "applicationState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NPKApplicationStateListener _applicationStateWithLSApplicationState:](self, "_applicationStateWithLSApplicationState:", v16);

  -[NPKApplicationStateListener _updateStateWithNewState:completion:](self, "_updateStateWithNewState:completion:", v17, v4);
}

- (void)_handleApplicationChangeNotificationWithWorkspaceApplicationProxies:(id)a3 newStateResolver:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  NSObject *internalClassQueue;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  NPKApplicationStateListener *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = *MEMORY[0x24BE6F818];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v12);

        if (v16)
        {
          objc_msgSend(v14, "appState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v7[2](v7, v17);

          pk_Payment_log();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

          if (v20)
          {
            pk_Payment_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "appState");
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v22;
              if ((unint64_t)(v18 - 1) > 2)
                v24 = CFSTR("Unknown");
              else
                v24 = off_24CFEB648[v18 - 1];
              *(_DWORD *)buf = 134218498;
              v32 = self;
              v33 = 2112;
              v34 = v22;
              v35 = 2112;
              v36 = v24;
              _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Received NanoPassbook LS app state change notification. App Proxy state: %@, resolved state to %@", buf, 0x20u);

            }
          }
          internalClassQueue = self->_internalClassQueue;
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __116__NPKApplicationStateListener__handleApplicationChangeNotificationWithWorkspaceApplicationProxies_newStateResolver___block_invoke;
          v26[3] = &unk_24CFE8238;
          v26[4] = self;
          v26[5] = v18;
          dispatch_async(internalClassQueue, v26);
          goto LABEL_18;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_18:

}

uint64_t __116__NPKApplicationStateListener__handleApplicationChangeNotificationWithWorkspaceApplicationProxies_newStateResolver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStateWithNewState:completion:", MEMORY[0x24BDAC760], 3221225472, __116__NPKApplicationStateListener__handleApplicationChangeNotificationWithWorkspaceApplicationProxies_newStateResolver___block_invoke_2, &unk_24CFEB5D8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __116__NPKApplicationStateListener__handleApplicationChangeNotificationWithWorkspaceApplicationProxies_newStateResolver___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40) - 1;
      if (v7 > 2)
        v8 = CFSTR("Unknown");
      else
        v8 = off_24CFEB648[v7];
      v9 = *(_QWORD *)(a1 + 32);
      if ((unint64_t)(a2 - 1) > 2)
        v10 = CFSTR("Unknown");
      else
        v10 = off_24CFEB648[a2 - 1];
      v11 = 134218498;
      v12 = v9;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Finished updating application state from LS app state notification with state %@. New resolved state: %@", (uint8_t *)&v11, 0x20u);
    }

  }
}

- (unint64_t)_applicationStateWithLSApplicationState:(id)a3
{
  id v3;
  void *v4;
  int v5;
  char v6;
  unint64_t v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isInstalled");
    v6 = objc_msgSend(v4, "isRestricted");
    if (v5)
      v7 = 1;
    else
      v7 = 3;
    if (v5 && (v6 & 1) != 0)
      v7 = 2;
  }
  else if (PKPassbookIsCurrentlyDeletedByUser())
  {
    v7 = 3;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_updateStateWithNewState:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, unint64_t);
  uint64_t v7;
  _QWORD *v8;
  NPKObserverManager *observerManager;
  _QWORD v10[7];
  _QWORD v11[2];
  void (*v12)(_QWORD *);
  void *v13;
  NPKApplicationStateListener *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = (void (**)(id, unint64_t))a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v12 = (void (*)(_QWORD *))__67__NPKApplicationStateListener__updateStateWithNewState_completion___block_invoke;
  v13 = &unk_24CFEB600;
  v14 = self;
  v15 = &v17;
  v16 = a3;
  v8 = v11;
  os_unfair_lock_lock(&self->_appStateLock);
  v12(v8);

  os_unfair_lock_unlock(&self->_appStateLock);
  if (v6)
    v6[2](v6, a3);
  if (v18[3] != a3)
  {
    observerManager = self->_observerManager;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __67__NPKApplicationStateListener__updateStateWithNewState_completion___block_invoke_2;
    v10[3] = &unk_24CFEB628;
    v10[4] = self;
    v10[5] = &v17;
    v10[6] = a3;
    -[NPKObserverManager enumerateObserversUsingBlock:](observerManager, "enumerateObserversUsingBlock:", v10);
  }
  _Block_object_dispose(&v17, 8);

}

_QWORD *__67__NPKApplicationStateListener__updateStateWithNewState_completion___block_invoke(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 16);
  *(_QWORD *)(result[4] + 16) = result[6];
  return result;
}

uint64_t __67__NPKApplicationStateListener__updateStateWithNewState_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "applicationStateListener:applicationStateDidChangeFrom:to:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerManager, 0);
  objc_storeStrong((id *)&self->_internalClassQueue, 0);
}

@end
