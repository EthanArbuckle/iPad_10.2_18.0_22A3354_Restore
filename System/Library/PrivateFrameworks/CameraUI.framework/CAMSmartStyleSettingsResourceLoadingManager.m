@implementation CAMSmartStyleSettingsResourceLoadingManager

- (CAMSmartStyleSettingsResourceLoadingManager)init
{
  CAMSmartStyleSettingsResourceLoadingManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *loadingQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *allResourceLoaders;
  NSMutableArray *v8;
  NSMutableArray *pendingResourceLoaders;
  NSMutableDictionary *v10;
  NSMutableDictionary *logIdentifiers;
  CAMSmartStyleSettingsResourceLoadingManager *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMSmartStyleSettingsResourceLoadingManager;
  v2 = -[CAMSmartStyleSettingsResourceLoadingManager init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.style-settings-resource-loading-manager.loading-queue", v3);
    loadingQueue = v2->__loadingQueue;
    v2->__loadingQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    allResourceLoaders = v2->__allResourceLoaders;
    v2->__allResourceLoaders = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingResourceLoaders = v2->__pendingResourceLoaders;
    v2->__pendingResourceLoaders = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    logIdentifiers = v2->__logIdentifiers;
    v2->__logIdentifiers = v10;

    v12 = v2;
  }

  return v2;
}

- (void)loadResourcesForAssetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  CAMSmartStyleSettingsResourceLoader *v9;
  void *v10;
  CAMSmartStyleSettingsResourceLoader *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CAMSmartStyleSettingsResourceLoadingManager _allResourceLoaders](self, "_allResourceLoaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifier:](self, "logIdentifierForAssetIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CAMSmartStyleSettingsResourceLoadingManager loadResourcesForAssetIdentifier:].cold.1();

    v9 = [CAMSmartStyleSettingsResourceLoader alloc];
    -[CAMSmartStyleSettingsResourceLoadingManager _loadingQueue](self, "_loadingQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CAMSmartStyleSettingsResourceLoader initWithDelegate:loadingQueue:assetIdentifier:logIdentifier:](v9, "initWithDelegate:loadingQueue:assetIdentifier:logIdentifier:", self, v10, v4, v7);

    -[CAMSmartStyleSettingsResourceLoadingManager _pendingResourceLoaders](self, "_pendingResourceLoaders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

    -[CAMSmartStyleSettingsResourceLoadingManager _allResourceLoaders](self, "_allResourceLoaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v4);

    -[CAMSmartStyleSettingsResourceLoadingManager _loadNextResourceIfPossible](self, "_loadNextResourceIfPossible");
  }

}

- (void)loadResourcesForAssetIdentifiers:(id)a3 unloadAllOthers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[CAMSmartStyleSettingsResourceLoadingManager _allResourceLoaders](self, "_allResourceLoaders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithArray:", v10);

    objc_msgSend(v11, "minusSet:", v7);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          -[CAMSmartStyleSettingsResourceLoadingManager _unloadResourcesForAssetIdentifier:allowLoadingNextResource:](self, "_unloadResourcesForAssetIdentifier:allowLoadingNextResource:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v16++), 0);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v14);
    }

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[CAMSmartStyleSettingsResourceLoadingManager loadResourcesForAssetIdentifier:](self, "loadResourcesForAssetIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), (_QWORD)v22);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

  -[CAMSmartStyleSettingsResourceLoadingManager _loadNextResourceIfPossible](self, "_loadNextResourceIfPossible");
}

- (void)unloadResourcesForAssetIdentifier:(id)a3
{
  -[CAMSmartStyleSettingsResourceLoadingManager _unloadResourcesForAssetIdentifier:allowLoadingNextResource:](self, "_unloadResourcesForAssetIdentifier:allowLoadingNextResource:", a3, 1);
}

- (void)_unloadResourcesForAssetIdentifier:(id)a3 allowLoadingNextResource:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifier:](self, "logIdentifierForAssetIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsResourceLoadingManager _allResourceLoaders](self, "_allResourceLoaders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "setDelegate:", 0);
    -[CAMSmartStyleSettingsResourceLoadingManager _pendingResourceLoaders](self, "_pendingResourceLoaders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v9);

    -[CAMSmartStyleSettingsResourceLoadingManager _allResourceLoaders](self, "_allResourceLoaders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v6);

    -[CAMSmartStyleSettingsResourceLoadingManager _activeResourceLoader](self, "_activeResourceLoader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = os_log_create("com.apple.camera", "SmartStyleSettings");
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12 == v9)
    {
      if (v14)
        -[CAMSmartStyleSettingsResourceLoadingManager _unloadResourcesForAssetIdentifier:allowLoadingNextResource:].cold.1();

      -[CAMSmartStyleSettingsResourceLoadingManager set_activeResourceLoader:](self, "set_activeResourceLoader:", 0);
      if (v4)
        -[CAMSmartStyleSettingsResourceLoadingManager _loadNextResourceIfPossible](self, "_loadNextResourceIfPossible");
    }
    else
    {
      if (v14)
        -[CAMSmartStyleSettingsResourceLoadingManager _unloadResourcesForAssetIdentifier:allowLoadingNextResource:].cold.2();

    }
  }
  else
  {
    v15 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v7;
      _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "ResourceLoadingManager (%{public}@): could not cancel untracked asset identifier", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)_loadNextResourceIfPossible
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1DB760000, a2, v4, "ResourceLoadingManager (%{public}@): starting load", v5);

}

- (id)resourceLoaderForAssetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMSmartStyleSettingsResourceLoadingManager _allResourceLoaders](self, "_allResourceLoaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isWaitingOnLoadingForAssetIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CAMSmartStyleSettingsResourceLoadingManager _allResourceLoaders](self, "_allResourceLoaders", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "status") | 2) == 2)
        {

          v12 = 1;
          goto LABEL_12;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (id)logIdentifierForAssetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v4 = a3;
  -[CAMSmartStyleSettingsResourceLoadingManager _logIdentifiers](self, "_logIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[CAMSmartStyleSettingsResourceLoadingManager _logIdentifiers](self, "_logIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Asset:%ld"), objc_msgSend(v8, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifier:].cold.1();

    -[CAMSmartStyleSettingsResourceLoadingManager _logIdentifiers](self, "_logIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (id)logIdentifierForAssetIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifier:](self, "logIdentifierForAssetIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)smartStyleSettingsResourceLoaderDidFinishLoading:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMSmartStyleSettingsResourceLoadingManager _allResourceLoaders](self, "_allResourceLoaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMSmartStyleSettingsResourceLoadingManager _activeResourceLoader](self, "_activeResourceLoader");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = os_log_create("com.apple.camera", "SmartStyleSettings");
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 != v4)
  {
    if (v7 != v4)
    {
      if (!v10)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v4, "logIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSmartStyleSettingsResourceLoadingManager _activeResourceLoader](self, "_activeResourceLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoadingManager (%{public}@): Did finish loading for asset that was not activeResourceLoader %{public}@. Will not notify delegate.", (uint8_t *)&v18, 0x16u);

LABEL_13:
      goto LABEL_14;
    }
    if (v10)
    {
      objc_msgSend(v4, "logIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSmartStyleSettingsResourceLoadingManager _activeResourceLoader](self, "_activeResourceLoader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v15;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoadingManager (%{public}@): Did finish loading for asset that was not activeResourceLoader %{public}@", (uint8_t *)&v18, 0x16u);

    }
LABEL_12:
    -[CAMSmartStyleSettingsResourceLoadingManager delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject smartStyleSettingsResourceLoadingManager:didFinishLoadingForAssetIdentifier:](v9, "smartStyleSettingsResourceLoadingManager:didFinishLoadingForAssetIdentifier:", self, v11);
    goto LABEL_13;
  }
  if (v10)
  {
    objc_msgSend(v4, "logIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v14;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoadingManager (%{public}@): Did finish loading", (uint8_t *)&v18, 0xCu);

  }
  -[CAMSmartStyleSettingsResourceLoadingManager set_activeResourceLoader:](self, "set_activeResourceLoader:", 0);
  if (v7 == v4)
    goto LABEL_12;
LABEL_15:
  -[CAMSmartStyleSettingsResourceLoadingManager _loadNextResourceIfPossible](self, "_loadNextResourceIfPossible");

}

- (CAMSmartStyleSettingsResourceLoadingManagerDelegate)delegate
{
  return (CAMSmartStyleSettingsResourceLoadingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)_loadingQueue
{
  return self->__loadingQueue;
}

- (NSMutableDictionary)_allResourceLoaders
{
  return self->__allResourceLoaders;
}

- (NSMutableArray)_pendingResourceLoaders
{
  return self->__pendingResourceLoaders;
}

- (CAMSmartStyleSettingsResourceLoader)_activeResourceLoader
{
  return self->__activeResourceLoader;
}

- (void)set_activeResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->__activeResourceLoader, a3);
}

- (double)_activeLoadStartTime
{
  return self->__activeLoadStartTime;
}

- (void)set_activeLoadStartTime:(double)a3
{
  self->__activeLoadStartTime = a3;
}

- (NSMutableDictionary)_logIdentifiers
{
  return self->__logIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__logIdentifiers, 0);
  objc_storeStrong((id *)&self->__activeResourceLoader, 0);
  objc_storeStrong((id *)&self->__pendingResourceLoaders, 0);
  objc_storeStrong((id *)&self->__allResourceLoaders, 0);
  objc_storeStrong((id *)&self->__loadingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)loadResourcesForAssetIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1DB760000, v0, v1, "ResourceLoadingManager (%{public}@): start tracking", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_unloadResourcesForAssetIdentifier:allowLoadingNextResource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1DB760000, v0, v1, "ResourceLoadingManager (%{public}@): canceling tracking while actively loading", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_unloadResourcesForAssetIdentifier:allowLoadingNextResource:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1DB760000, v0, v1, "ResourceLoadingManager (%{public}@): stop tracking", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)logIdentifierForAssetIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_1DB760000, v1, OS_LOG_TYPE_DEBUG, "ResourceLoadingManager: mapping %{public}@ as %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
