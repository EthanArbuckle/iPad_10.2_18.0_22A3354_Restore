@implementation MDIndexExtensionManager

void __41___MDIndexExtensionManager_sharedManager__block_invoke()
{
  _MDIndexExtensionManager *v0;
  void *v1;

  v0 = objc_alloc_init(_MDIndexExtensionManager);
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;

}

void __42___MDIndexExtensionManager_loadExtensions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C42F000, v2, OS_LOG_TYPE_INFO, "One time load of extensions 1!", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "extensionLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42___MDIndexExtensionManager_loadExtensions__block_invoke_6;
  v4[3] = &unk_1E2405190;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "startLookingForExtensionsWithMatchUpdateHandler:", v4);

}

void __42___MDIndexExtensionManager_loadExtensions__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  logForCSLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_18C42F000, v10, OS_LOG_TYPE_INFO, "Extensions callback 1 %@ %@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "extensionsCondition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setLoaderCallbackCount:", objc_msgSend(*(id *)(a1 + 32), "loaderCallbackCount") + 1);
  objc_msgSend(*(id *)(a1 + 32), "setIndexExtensionsByBundleID:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setFileProviderBundleMap:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setFileProviderBundleIDs:", v9);

  objc_msgSend(*(id *)(a1 + 32), "extensionsCondition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "broadcast");

  objc_msgSend(*(id *)(a1 + 32), "extensionsCondition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  objc_msgSend(*(id *)(a1 + 32), "_notifyForLoadedExtensions");
}

@end
