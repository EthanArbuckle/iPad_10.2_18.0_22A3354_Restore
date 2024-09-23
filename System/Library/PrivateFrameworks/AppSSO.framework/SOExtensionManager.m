@implementation SOExtensionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_defaultManager;
}

void __36__SOExtensionManager_sharedInstance__block_invoke()
{
  SOExtensionManager *v0;
  void *v1;

  v0 = objc_alloc_init(SOExtensionManager);
  v1 = (void *)sharedInstance_defaultManager;
  sharedInstance_defaultManager = (uint64_t)v0;

}

- (SOExtensionManager)init
{
  SOExtensionManager *v2;
  SOExtensionFinder *v3;
  SOExtensionFinder *extensionFinder;
  dispatch_queue_t v5;
  OS_dispatch_queue *extensionManagerQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SOExtensionManager;
  v2 = -[SOExtensionManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SOExtensionFinder);
    extensionFinder = v2->_extensionFinder;
    v2->_extensionFinder = v3;

    v5 = dispatch_queue_create("com.apple.AppSSO.extension-manager-queue", 0);
    extensionManagerQueue = v2->_extensionManagerQueue;
    v2->_extensionManagerQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SOExtensionManager unloadExtensions](self, "unloadExtensions");
  v3.receiver = self;
  v3.super_class = (Class)SOExtensionManager;
  -[SOExtensionManager dealloc](&v3, sel_dealloc);
}

- (void)loadExtensionWithBundleIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SOExtensionFinder *extensionFinder;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  SOExtensionManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOExtensionManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SOExtensionManager loadExtensionWithBundleIdentifer:completion:]";
    v17 = 2114;
    v18 = v6;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s bundleIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  extensionFinder = self->_extensionFinder;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__SOExtensionManager_loadExtensionWithBundleIdentifer_completion___block_invoke;
  v12[3] = &unk_24C80C698;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  -[SOExtensionFinder findExtensionWithBundleIdentifier:completion:](extensionFinder, "findExtensionWithBundleIdentifier:completion:", v10, v12);

}

void __66__SOExtensionManager_loadExtensionWithBundleIdentifer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v6);
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(), "_isMatchedExtension:forBundleIdentifier:", v5, *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v5, 0);
    }
    else
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2050000000;
      v9 = (void *)getSOErrorHelperClass_softClass_2;
      v16 = getSOErrorHelperClass_softClass_2;
      if (!getSOErrorHelperClass_softClass_2)
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __getSOErrorHelperClass_block_invoke_2;
        v12[3] = &unk_24C80C0B8;
        v12[4] = &v13;
        __getSOErrorHelperClass_block_invoke_2((uint64_t)v12);
        v9 = (void *)v14[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v13, 8);
      objc_msgSend(v10, "internalErrorWithMessage:", CFSTR("No AppSSO IdP extension found (internal error)"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v11);

    }
  }

}

- (id)loadExtensionWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _BYTE *v11;
  _BYTE buf[24];
  SOExtensionManager *v13;
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtensionManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SOExtensionManager loadExtensionWithBundleIdentifier:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v13 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s bundleIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v13 = (SOExtensionManager *)__Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke;
  v9[3] = &unk_24C80C6C0;
  v11 = buf;
  v6 = v4;
  v10 = v6;
  -[SOExtensionManager loadExtensionWithBundleIdentifer:completion:](self, "loadExtensionWithBundleIdentifer:completion:", v6, v9);
  v7 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v7;
}

void __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    SO_LOG_SOExtensionManager();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke_cold_1(a1, (uint64_t)v7, v8);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)loadInternalExtension
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  SOExtensionManager *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtensionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOExtensionManager loadInternalExtension]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend((id)objc_opt_class(), "internalExtensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOExtensionManager loadExtensionWithBundleIdentifier:](self, "loadExtensionWithBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)beginMatchingExtensions
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  SOExtensionManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtensionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SOExtensionManager beginMatchingExtensions]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  -[SOExtensionManager _doBeginMatchingExtensions](self, "_doBeginMatchingExtensions");
}

- (void)endMatchingExtensions
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  SOExtensionManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtensionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SOExtensionManager endMatchingExtensions]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  -[SOExtensionManager _doEndMatchingExtensions](self, "_doEndMatchingExtensions");
}

- (void)loadExtensions
{
  NSObject *v3;
  SOExtensionManager *v4;
  uint64_t v5;
  NSArray *loadedExtensions;
  int v7;
  const char *v8;
  __int16 v9;
  SOExtensionManager *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtensionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOExtensionManager loadExtensions]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[SOExtensionManager _doLoadExtensions](v4, "_doLoadExtensions");
  v5 = objc_claimAutoreleasedReturnValue();
  loadedExtensions = v4->_loadedExtensions;
  v4->_loadedExtensions = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (id)_doLoadExtensions
{
  SOExtensionFinder *extensionFinder;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  extensionFinder = self->_extensionFinder;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__SOExtensionManager__doLoadExtensions__block_invoke;
  v5[3] = &unk_24C80C6E8;
  v5[4] = &v6;
  -[SOExtensionFinder findExtensionsWithCompletion:](extensionFinder, "findExtensionsWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__SOExtensionManager__doLoadExtensions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (!a3)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = v7;
  }

}

- (void)unloadExtensions
{
  NSObject *v3;
  SOExtensionManager *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *loadedExtensions;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  SOExtensionManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtensionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SOExtensionManager unloadExtensions]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4->_loadedExtensions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "unload", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  loadedExtensions = v4->_loadedExtensions;
  v4->_loadedExtensions = 0;

  objc_sync_exit(v4);
}

- (id)loadedExtensionWithBundleIdentifer:(id)a3
{
  id v4;
  NSObject *v5;
  SOExtensionManager *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  SOExtensionManager *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOExtensionManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOExtensionManager loadedExtensionWithBundleIdentifer:].cold.1();

  v6 = self;
  objc_sync_enter(v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6->_loadedExtensions;
  v8 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend((id)objc_opt_class(), "_isMatchedExtension:forBundleIdentifier:", v11, v4, (_QWORD)v15))
        {
          v8 = v11;
          goto LABEL_13;
        }
      }
      v8 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  objc_sync_exit(v6);
  SO_LOG_SOExtensionManager();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[SOExtensionManager loadedExtensions](v6, "loadedExtensions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v20 = "-[SOExtensionManager loadedExtensionWithBundleIdentifer:]";
    v21 = 2114;
    v22 = v4;
    v23 = 2114;
    v24 = v8;
    v25 = 2114;
    v26 = v13;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_20DABC000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@ => %{public}@ in %{public}@ on %@", buf, 0x34u);

  }
  return v8;
}

- (id)loadedInternalExtension
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  SOExtensionManager *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtensionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOExtensionManager loadedInternalExtension]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend((id)objc_opt_class(), "internalExtensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOExtensionManager loadedExtensionWithBundleIdentifer:](self, "loadedExtensionWithBundleIdentifer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isLoadedExtensionWithBundleIdentifer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  SO_LOG_SOExtensionManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOExtensionManager isLoadedExtensionWithBundleIdentifer:].cold.1();

  -[SOExtensionManager loadedExtensionWithBundleIdentifer:](self, "loadedExtensionWithBundleIdentifer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)_doBeginMatchingExtensions
{
  SOExtensionFinder *extensionFinder;
  _QWORD v3[5];

  extensionFinder = self->_extensionFinder;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke;
  v3[3] = &unk_24C80C710;
  v3[4] = self;
  -[SOExtensionFinder beginMatchingExtensionsWithCompletion:](extensionFinder, "beginMatchingExtensionsWithCompletion:", v3);
}

void __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_2;
  block[3] = &unk_24C80C1A8;
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  dispatch_time_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[4];
  id v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "endMatchingExtensions");
    v4 = dispatch_time(0, 1000000000);
    v5 = *(void **)(a1 + 32);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_3;
    block[3] = &unk_24C80C1F8;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 40);
    v25 = v7;
    v26 = v8;
    dispatch_after(v4, v6, block);
    v9 = v25;
  }
  else
  {
    objc_msgSend(v2, "loadedExtensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = *(id *)(a1 + 48);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsObject:", v18, (_QWORD)v20))
            objc_msgSend(v11, "removeObject:", v18);
          else
            objc_msgSend(v12, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      }
      while (v15);
    }

    v19 = *(id *)(a1 + 40);
    v9 = v11;
    objc_sync_enter(v19);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(a1 + 48));
    objc_sync_exit(v19);

    objc_msgSend((id)objc_opt_class(), "_sendNotificationsLoadedExtensions:new:removed:", *(_QWORD *)(a1 + 48), v12, v9);
  }

}

uint64_t __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_3(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOExtensionManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_3_cold_1(a1, v2);

  return objc_msgSend(*(id *)(a1 + 40), "beginMatchingExtensions");
}

- (void)_doEndMatchingExtensions
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  SOExtensionManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOExtensionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SOExtensionManager _doEndMatchingExtensions]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  -[SOExtensionFinder endMatchingExtensions](self->_extensionFinder, "endMatchingExtensions");
}

+ (void)_sendNotificationsLoadedExtensions:(id)a3 new:(id)a4 removed:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SO_LOG_SOExtensionManager();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v24 = "+[SOExtensionManager _sendNotificationsLoadedExtensions:new:removed:]";
    v25 = 2114;
    v26 = v8;
    v27 = 2114;
    v28 = v9;
    v29 = 2114;
    v30 = v10;
    v31 = 2112;
    v32 = a1;
    _os_log_impl(&dword_20DABC000, v11, OS_LOG_TYPE_DEFAULT, "%s extensions: %{public}@, new: %{public}@, removed: %{public}@ on %@", buf, 0x34u);
  }

  if (v8)
    v12 = v8;
  else
    v12 = (id)MEMORY[0x24BDBD1B8];
  v17 = CFSTR("extensions");
  v18 = CFSTR("new");
  if (v9)
    v13 = v9;
  else
    v13 = (id)MEMORY[0x24BDBD1B8];
  v20 = v12;
  v21 = v13;
  v19 = CFSTR("removed");
  if (v10)
    v14 = v10;
  else
    v14 = (id)MEMORY[0x24BDBD1B8];
  v22 = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v17, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppSSO.SOExtensionManager.ExtensionsChanged"), a1, v15);

}

+ (BOOL)_isMatchedExtension:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  return v7;
}

+ (id)internalExtensionBundleIdentifier
{
  return CFSTR("com.apple.AuthKitUI.AKAppSSOExtension");
}

+ (id)internalExtensionsBundleIdentifiers
{
  return &unk_24C8130B0;
}

+ (BOOL)isInternalExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "internalExtensionsBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)isAppleConnectExtensionBundleIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ist.ds.appleconnect2.AppSSOExtension")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ist.AppleConnect.App-SSO")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ist.AppleConnect.mini.App-SSO"));
  }

  return v4;
}

+ (BOOL)isTiburonExtensionBundleIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.AuthKitUI.AKAppSSOExtension"));
}

- (NSArray)loadedExtensions
{
  return self->_loadedExtensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedExtensions, 0);
  objc_storeStrong((id *)&self->_extensionFinder, 0);
  objc_storeStrong((id *)&self->_extensionManagerQueue, 0);
}

void __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_20DABC000, log, OS_LOG_TYPE_ERROR, "extension not found: %{public}@, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)loadedExtensionWithBundleIdentifer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_20DABC000, v0, v1, "%s bundleIdentifier=%{public}@ on %@", v2);
}

- (void)isLoadedExtensionWithBundleIdentifer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_20DABC000, v0, v1, "%s bundleIdentifier=%{public}@ on %@", v2);
}

void __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_20DABC000, a2, OS_LOG_TYPE_ERROR, "restarting matching extensions because of error: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
