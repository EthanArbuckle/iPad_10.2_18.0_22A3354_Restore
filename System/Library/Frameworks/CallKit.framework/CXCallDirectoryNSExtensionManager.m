@implementation CXCallDirectoryNSExtensionManager

- (CXCallDirectoryNSExtensionManager)init
{
  CXCallDirectoryNSExtensionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXCallDirectoryNSExtensionManager;
  v2 = -[CXCallDirectoryNSExtensionManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.callkit.calldirectorynsextensionmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v2);

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[CXCallDirectoryNSExtensionManager extensionMatchingContext](self, "extensionMatchingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35D8];
    -[CXCallDirectoryNSExtensionManager extensionMatchingContext](self, "extensionMatchingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endMatchingExtensions:", v5);

  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)CXCallDirectoryNSExtensionManager;
  -[CXCallDirectoryNSExtensionManager dealloc](&v7, sel_dealloc);
}

- (void)setDelegate:(id)a3 queue:(id)a4
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
  -[CXCallDirectoryNSExtensionManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CXCallDirectoryNSExtensionManager_setDelegate_queue___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __55__CXCallDirectoryNSExtensionManager_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    v2 = *(_QWORD *)(a1 + 48);
  else
    v2 = MEMORY[0x1E0C80D38];
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", v2);
}

- (void)beginMatchingExtensions
{
  NSObject *v3;
  _QWORD block[5];

  -[CXCallDirectoryNSExtensionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CXCallDirectoryNSExtensionManager_beginMatchingExtensions__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __60__CXCallDirectoryNSExtensionManager_beginMatchingExtensions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginMatchingExtensionsIfNecessary");
}

+ (NSDictionary)baseExtensionMatchingAttributes
{
  void *v2;
  const __CFString **v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v11[0] = CFSTR("com.apple.callkit.call-directory");
    v11[1] = CFSTR("com.apple.live-lookup");
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = (const __CFString **)v11;
    v4 = 2;
  }
  else
  {
    v10 = CFSTR("com.apple.callkit.call-directory");
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = &v10;
    v4 = 1;
  }
  objc_msgSend(v2, "arrayWithObjects:count:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB2A28];
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (void)_beginMatchingExtensionsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  CXCallDirectoryNSExtensionManager *v12;
  id v13;
  id v14;
  id location;

  -[CXCallDirectoryNSExtensionManager extensionMatchingContext](self, "extensionMatchingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "baseExtensionMatchingAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0CB35D8];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke;
    v11 = &unk_1E4B88EA0;
    objc_copyWeak(&v14, &location);
    v12 = self;
    v6 = v4;
    v13 = v6;
    objc_msgSend(v5, "beginMatchingExtensionsWithAttributes:completion:", v6, &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallDirectoryNSExtensionManager setExtensionMatchingContext:](self, "setExtensionMatchingContext:", v7, v8, v9, v10, v11, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD block[4];
  NSObject *v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      CXDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(WeakRetained, "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_2;
      block[3] = &unk_1E4B88AC0;
      v11 = v5;
      v12 = *(_QWORD *)(a1 + 32);
      v14 = v11;
      v15 = v12;
      v16 = v8;
      dispatch_async(v10, block);

      v9 = v14;
    }

  }
}

void __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  __int128 v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "matchingExtensions=%@", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "setExtensions:", v4);
  objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_13;
    block[3] = &unk_1E4B88AC0;
    v15 = *(_OWORD *)(a1 + 40);
    v16 = *(id *)(a1 + 32);
    dispatch_async(v13, block);

  }
}

void __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_13(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryNSExtensionManager:extensionsChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)extensionsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "baseExtensionMatchingAttributes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:completion:", v4, v3);

}

- (void)extensionWithIdentifier:(id)a3 inContainingAppWithProcessIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CFE2F0]);
  objc_msgSend(v10, "bundleInfoValueForKey:PID:", *MEMORY[0x1E0C9AE78], v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CA5870], "cx_applicationRecordForBundleIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __109__CXCallDirectoryNSExtensionManager_extensionWithIdentifier_inContainingAppWithProcessIdentifier_completion___block_invoke;
    v16[3] = &unk_1E4B88EC8;
    v17 = v8;
    v18 = v13;
    v19 = v9;
    v14 = v13;
    -[CXCallDirectoryNSExtensionManager _extensionForIdentifier:containingAppBundleURL:completion:](self, "_extensionForIdentifier:containingAppBundleURL:completion:", v17, v14, v16);

  }
  else
  {
    CXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryNSExtensionManager extensionWithIdentifier:inContainingAppWithProcessIdentifier:completion:].cold.1(v6, v15);

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __109__CXCallDirectoryNSExtensionManager_extensionWithIdentifier_inContainingAppWithProcessIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (!v3)
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __109__CXCallDirectoryNSExtensionManager_extensionWithIdentifier_inContainingAppWithProcessIdentifier_completion___block_invoke_cold_1(a1, v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_extensionForIdentifier:(id)a3 containingAppBundleURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "baseExtensionMatchingAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2A08]);
  objc_msgSend(v8, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB29D8]);
  v13 = (void *)MEMORY[0x1E0CB35D8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__CXCallDirectoryNSExtensionManager__extensionForIdentifier_containingAppBundleURL_completion___block_invoke;
  v16[3] = &unk_1E4B88EF0;
  v17 = v11;
  v18 = v7;
  v14 = v7;
  v15 = v11;
  objc_msgSend(v13, "extensionsWithMatchingAttributes:completion:", v15, v16);

}

void __95__CXCallDirectoryNSExtensionManager__extensionForIdentifier_containingAppBundleURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95__CXCallDirectoryNSExtensionManager__extensionForIdentifier_containingAppBundleURL_completion___block_invoke_cold_1();

    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)pluginsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryNSExtensionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CXCallDirectoryNSExtensionManager_pluginsDidInstall___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__CXCallDirectoryNSExtensionManager_pluginsDidInstall___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "pluginKitProxies=%@", buf, 0xCu);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "extensions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "pluginIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v3, "addObject:", v14);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    CXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_impl(&dword_1A402D000, v15, OS_LOG_TYPE_DEFAULT, "installedPlugins=%@", buf, 0xCu);
    }

    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__CXCallDirectoryNSExtensionManager_pluginsDidInstall___block_invoke_19;
      v17[3] = &unk_1E4B88A20;
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = v3;
      dispatch_async(v16, v17);

    }
  }
}

void __55__CXCallDirectoryNSExtensionManager_pluginsDidInstall___block_invoke_19(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callDirectoryNSExtensionManager:extensionsChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CXCallDirectoryNSExtensionManagerDelegate)delegate
{
  return (CXCallDirectoryNSExtensionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (id)extensionMatchingContext
{
  return self->_extensionMatchingContext;
}

- (void)setExtensionMatchingContext:(id)a3
{
  objc_storeStrong(&self->_extensionMatchingContext, a3);
}

- (NSDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong(&self->_extensionMatchingContext, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_1A402D000, v0, v1, "Error beginning to match extensions with attributes %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)extensionWithIdentifier:(int)a1 inContainingAppWithProcessIdentifier:(NSObject *)a2 completion:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "No containing app bundle ID found for containingAppPID %d", (uint8_t *)v2, 8u);
}

void __109__CXCallDirectoryNSExtensionManager_extensionWithIdentifier_inContainingAppWithProcessIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "No NSExtension found for identifier %@ containingAppBundleURL %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __95__CXCallDirectoryNSExtensionManager__extensionForIdentifier_containingAppBundleURL_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_1A402D000, v0, v1, "Error matching extensions with attributes %@: %@");
  OUTLINED_FUNCTION_1();
}

@end
