@implementation MTApplicationWorkspaceObserver

void __66__MTApplicationWorkspaceObserver_addObserver_forBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "observersForBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "observersForBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

    v3 = v6;
  }
  v7 = v3;
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 32), "isObserving") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObserver:");
    objc_msgSend(*(id *)(a1 + 32), "setObserving:", 1);
  }

}

- (NSMutableDictionary)observersForBundleID
{
  return self->_observersForBundleID;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (BOOL)isObserving
{
  return self->_observing;
}

void __57__MTApplicationWorkspaceObserver_sharedWorkspaceObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedWorkspaceObserver_instance;
  sharedWorkspaceObserver_instance = (uint64_t)v0;

}

- (MTApplicationWorkspaceObserver)init
{
  MTApplicationWorkspaceObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *observerQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *observersForBundleID;
  uint64_t v7;
  LSApplicationWorkspace *applicationWorkspace;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTApplicationWorkspaceObserver;
  v2 = -[MTApplicationWorkspaceObserver init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MobileTimer.MTApplicationWorkspaceObserverQueue", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersForBundleID = v2->_observersForBundleID;
    v2->_observersForBundleID = v5;

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = objc_claimAutoreleasedReturnValue();
    applicationWorkspace = v2->_applicationWorkspace;
    v2->_applicationWorkspace = (LSApplicationWorkspace *)v7;

  }
  return v2;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MTApplicationWorkspaceObserver observerQueue](self, "observerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MTApplicationWorkspaceObserver_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E39CB828;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

+ (MTApplicationWorkspaceObserver)sharedWorkspaceObserver
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MTApplicationWorkspaceObserver_sharedWorkspaceObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedWorkspaceObserver_onceToken != -1)
    dispatch_once(&sharedWorkspaceObserver_onceToken, block);
  return (MTApplicationWorkspaceObserver *)(id)sharedWorkspaceObserver_instance;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MTApplicationWorkspaceObserver observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MTApplicationWorkspaceObserver_removeObserver___block_invoke;
  block[3] = &unk_1E39CB7B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __49__MTApplicationWorkspaceObserver_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observersForBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__MTApplicationWorkspaceObserver_removeObserver___block_invoke_2;
  v18[3] = &unk_1E39CE968;
  v19 = *(id *)(a1 + 40);
  v4 = v2;
  v20 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v18);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 32), "observersForBundleID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "observersForBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:");
    objc_msgSend(*(id *)(a1 + 32), "setObserving:", 0);
  }

}

void __49__MTApplicationWorkspaceObserver_removeObserver___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "removeObject:", v5);
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

- (BOOL)isApplicationInstalledForBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v18;
  uint8_t buf[4];
  MTApplicationWorkspaceObserver *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, v4, &v18);
  v8 = v18;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "applicationState");
    v10 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isValid](v10, "isValid"))
    {
      objc_msgSend(v7, "applicationState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isInstalled");
      v13 = v4 | v12;
      if (v4 && (v12 & 1) == 0)
      {
        objc_msgSend(v7, "applicationState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v14, "isPlaceholder");

      }
      goto LABEL_14;
    }
LABEL_13:
    v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  if (v8)
  {
    if (objc_msgSend(v8, "code") != -10814
      || (objc_msgSend(v9, "domain"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB2F90]),
          v15,
          (v16 & 1) == 0))
    {
      MTLogForCategory(4);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v20 = self;
        v21 = 2114;
        v22 = v6;
        v23 = 2114;
        v24 = v9;
        _os_log_error_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_ERROR, "%{public}@ unexpected error getting bundle identifier for %{public}@: %{public}@", buf, 0x20u);
      }
      goto LABEL_13;
    }
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)isApplicationInstalledForBundleIdentifier:(id)a3
{
  return -[MTApplicationWorkspaceObserver isApplicationInstalledForBundleIdentifier:allowPlaceholder:](self, "isApplicationInstalledForBundleIdentifier:allowPlaceholder:", a3, 1);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MTApplicationWorkspaceObserver *v9;

  v4 = a3;
  -[MTApplicationWorkspaceObserver observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__MTApplicationWorkspaceObserver_applicationsDidInstall___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__MTApplicationWorkspaceObserver_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v14)
  {
    v12 = *(_QWORD *)v20;
    do
    {
      v1 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v1), "bundleIdentifier");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "observersForBundleID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(v4, "objectEnumerator");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v16;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v16 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v10, "observedApplicationDidInstallForBundleIdentifier:", v2);
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v7);
        }

        ++v1;
      }
      while (v1 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MTApplicationWorkspaceObserver *v9;

  v4 = a3;
  -[MTApplicationWorkspaceObserver observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__MTApplicationWorkspaceObserver_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__MTApplicationWorkspaceObserver_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v14)
  {
    v12 = *(_QWORD *)v20;
    do
    {
      v1 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v1), "bundleIdentifier");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "observersForBundleID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(v4, "objectEnumerator");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v16;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v16 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v10, "observedApplicationDidUninstallForBundleIdentifier:", v2);
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v7);
        }

        ++v1;
      }
      while (v1 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

}

- (void)setObserverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observerQueue, a3);
}

- (LSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (void)setApplicationWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_applicationWorkspace, a3);
}

- (void)setObserversForBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_observersForBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersForBundleID, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

@end
