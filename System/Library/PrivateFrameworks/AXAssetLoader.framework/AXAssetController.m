@implementation AXAssetController

uint64_t __53__AXAssetController__queue_refreshAssets_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "contentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "contentVersion");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

uint64_t __38__AXAssetController_setUserInitiated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateDownloadPriorityIfNecessary");
}

- (BOOL)isAssetCatalogInstalled
{
  void *v2;
  void *v3;

  -[AXAssetController assetPolicy](self, "assetPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newAssetQuery");

  LOBYTE(v2) = objc_msgSend(v3, "queryMetaDataSync") == 0;
  return (char)v2;
}

- (void)performBlockOnAssetObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__AXAssetController_performBlockOnAssetObservers___block_invoke;
  v13[3] = &unk_1E95D4088;
  v13[4] = self;
  v13[5] = &v14;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v13);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = (id)v15[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

+ (AXAssetController)assetControllerWithPolicy:(id)a3 qosClass:(unsigned int)a4 shouldRefreshForAssetInstallNotifications:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = -[AXAssetController _initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:]([AXAssetController alloc], "_initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:", v7, v6, v5);

  return (AXAssetController *)v8;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__AXAssetController_addObserver___block_invoke;
  v6[3] = &unk_1E95D3AD0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v6);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXAssetController assetPolicy](self, "assetPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetTypeSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_queue_updateDownloadPriorityIfNecessary
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v3 = (void *)getMADownloadConfigClass_softClass;
  v30 = getMADownloadConfigClass_softClass;
  if (!getMADownloadConfigClass_softClass)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = (uint64_t)__getMADownloadConfigClass_block_invoke;
    v24 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E95D3900;
    v25 = (void (*)(uint64_t))&v27;
    __getMADownloadConfigClass_block_invoke((uint64_t)&v21);
    v3 = (void *)v28[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v27, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setDiscretionary:", -[AXAssetController userInitiated](self, "userInitiated") ^ 1);
  v21 = 0;
  v22 = (uint64_t)&v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__AXAssetController__queue_updateDownloadPriorityIfNecessary__block_invoke;
  v20[3] = &unk_1E95D4088;
  v20[4] = self;
  v20[5] = &v21;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v20);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *(id *)(v22 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "maAsset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "state") == 4;

        if (v12)
        {
          objc_msgSend(v10, "maAsset");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __61__AXAssetController__queue_updateDownloadPriorityIfNecessary__block_invoke_2;
          v15[3] = &unk_1E95D4208;
          v15[4] = self;
          v15[5] = v10;
          objc_msgSend(v13, "configDownload:completion:", v5, v15);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v31, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)performWithinLock:(id)a3
{
  os_unfair_lock_s *p_assetsLock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_assetsLock = &self->_assetsLock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_assetsLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_assetsLock);
  }
}

void __61__AXAssetController__queue_updateDownloadPriorityIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __33__AXAssetController_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setProductionServerURL
{
  int has_internal_ui;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _BYTE buf[24];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[AXAssetController assetPolicy](self, "assetPolicy");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "shouldUseProductionServerForInternalBuilds"))
  {

    return;
  }
  has_internal_ui = os_variant_has_internal_ui();

  if (has_internal_ui)
  {
    -[AXAssetController assetPolicy](self, "assetPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetType");
    v28 = 0;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v6 = getASServerURLForAssetTypeSymbolLoc_ptr_0;
    v30 = getASServerURLForAssetTypeSymbolLoc_ptr_0;
    if (!getASServerURLForAssetTypeSymbolLoc_ptr_0)
    {
      v7 = (void *)MobileAssetLibrary_2();
      v6 = dlsym(v7, "ASServerURLForAssetType");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v6;
      getASServerURLForAssetTypeSymbolLoc_ptr_0 = v6;
    }
    _Block_object_dispose(buf, 8);
    if (v6)
    {
      ((void (*)(id, id *))v6)(v5, &v28);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v28;
      if (v9)
      {
        AXLogAssetLoader();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[AXAssetController assetPolicy](self, "assetPolicy");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "assetType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl(&dword_1D3F8E000, v10, OS_LOG_TYPE_DEFAULT, "Unable to retrieve asset URL for policy %@. %@", buf, 0x16u);

        }
      }
      objc_msgSend(v8, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("https://mesu.apple.com/assets/"));

      if ((v14 & 1) != 0)
      {
        AXLogAssetLoader();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[AXAssetController assetPolicy](self, "assetPolicy");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "assetType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_1D3F8E000, v15, OS_LOG_TYPE_DEFAULT, "%@ is already set to mesu URL %@", buf, 0x16u);

        }
LABEL_20:

        return;
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://mesu.apple.com/assets/"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAssetController assetPolicy](self, "assetPolicy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "assetType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18;
      v21 = v20;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v22 = getASSetAssetServerURLForAssetTypeSymbolLoc_ptr;
      v30 = getASSetAssetServerURLForAssetTypeSymbolLoc_ptr;
      if (!getASSetAssetServerURLForAssetTypeSymbolLoc_ptr)
      {
        v23 = (void *)MobileAssetLibrary_2();
        v22 = dlsym(v23, "ASSetAssetServerURLForAssetType");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v22;
        getASSetAssetServerURLForAssetTypeSymbolLoc_ptr = v22;
      }
      _Block_object_dispose(buf, 8);
      if (v22)
      {
        ((void (*)(NSObject *, id))v22)(v15, v21);

        AXLogAssetLoader();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          -[AXAssetController assetPolicy](self, "assetPolicy");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "assetType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2112;
          v30 = v8;
          _os_log_impl(&dword_1D3F8E000, v24, OS_LOG_TYPE_DEFAULT, "Setting %@ server URL to mesu: %@ from :%@", buf, 0x20u);

        }
        goto LABEL_20;
      }
      -[AXAudiogramIngestionAssetPolicy init].cold.1();
    }
    else
    {
      -[AXAudiogramIngestionAssetPolicy init].cold.1();
    }
    __break(1u);
  }
}

- (id)_initWithAssetPolicy:(id)a3 qosClass:(unsigned int)a4 shouldRefreshForAssetInstallNotifications:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  AXAssetController *v10;
  uint64_t v11;
  NSHashTable *observers;
  uint64_t v13;
  NSMutableSet *cachedInProgressAssets;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *mobileAssetQueue;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *refreshQueue;
  NSObject *v29;
  AXAssetController *v30;
  NSObject *v31;
  _QWORD block[4];
  AXAssetController *v34;
  objc_super v35;

  v5 = a5;
  v9 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AXAssetController;
  v10 = -[AXAssetController init](&v35, sel_init);
  if (v10)
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10->_notifyToken = -1;
        v10->_assetsLock._os_unfair_lock_opaque = 0;
        objc_storeStrong((id *)&v10->_assetPolicy, a3);
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v11 = objc_claimAutoreleasedReturnValue();
        observers = v10->_observers;
        v10->_observers = (NSHashTable *)v11;

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v13 = objc_claimAutoreleasedReturnValue();
        cachedInProgressAssets = v10->_cachedInProgressAssets;
        v10->_cachedInProgressAssets = (NSMutableSet *)v13;

        v10->_shouldRefreshForAssetInstallNotifications = v5;
        dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v16 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "assetTypeSuffix");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("com.apple.Accessibility.AXAssetController.MobileAssetQueue.%@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_retainAutorelease(v19);
        v21 = dispatch_queue_create((const char *)objc_msgSend(v20, "cStringUsingEncoding:", 4), v16);
        mobileAssetQueue = v10->_mobileAssetQueue;
        v10->_mobileAssetQueue = (OS_dispatch_queue *)v21;

        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "assetTypeSuffix");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("com.apple.Accessibility.AXAssetController.RefreshQueue.%@"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_retainAutorelease(v25);
        v27 = dispatch_queue_create((const char *)objc_msgSend(v26, "cStringUsingEncoding:", 4), v16);
        refreshQueue = v10->_refreshQueue;
        v10->_refreshQueue = (OS_dispatch_queue *)v27;

        if (AXProcessIsAXAssetsd())
        {
          v29 = v10->_mobileAssetQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __93__AXAssetController__initWithAssetPolicy_qosClass_shouldRefreshForAssetInstallNotifications___block_invoke;
          block[3] = &unk_1E95D3A80;
          v34 = v10;
          dispatch_async(v29, block);

        }
        if (v5)
          -[AXAssetController _registerForNotifications](v10, "_registerForNotifications");

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_16:
        v30 = 0;
        goto LABEL_17;
      }
      AXLogAssetLoader();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[AXAssetController _initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:].cold.2((uint64_t)v9, v31);
    }
    else
    {
      AXLogAssetLoader();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[AXAssetController _initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:].cold.1(v31);
    }

    goto LABEL_16;
  }
LABEL_9:
  v30 = v10;
LABEL_17:

  return v30;
}

- (void)setUserInitiated:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (self->_userInitiated != a3)
  {
    self->_userInitiated = a3;
    -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__AXAssetController_setUserInitiated___block_invoke;
    block[3] = &unk_1E95D3A80;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (OS_dispatch_queue)mobileAssetQueue
{
  return self->_mobileAssetQueue;
}

- (void)_replaceCachedAssetsWithAssets:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void (**v26)(id, void *, id);
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id location;
  _BYTE from[12];
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = a4;
  v26 = (void (**)(id, void *, id))a5;
  objc_initWeak(&location, self);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
        -[AXAssetController assetPolicy](self, "assetPolicy");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "shouldCopyLocally");

        if (v15)
          objc_msgSend(v13, "copyLocally");
        if (objc_msgSend(v13, "isDownloading"))
        {
          objc_initWeak((id *)from, v13);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke;
          v32[3] = &unk_1E95D40D0;
          objc_copyWeak(&v33, (id *)from);
          objc_copyWeak(&v34, &location);
          objc_msgSend(v13, "attachProgressHandlerIfNeeded:", v32);
          objc_destroyWeak(&v34);
          objc_destroyWeak(&v33);
          objc_destroyWeak((id *)from);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v10);
  }

  AXLogAssetLoader();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(v9, "count");
    *(_DWORD *)from = 138412546;
    *(_QWORD *)&from[4] = self;
    v41 = 2048;
    v42 = v17;
    _os_log_impl(&dword_1D3F8E000, v16, OS_LOG_TYPE_INFO, "%@: Replacing cached assets with %ld items", from, 0x16u);
  }

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke_211;
  v30[3] = &unk_1E95D3AD0;
  v30[4] = self;
  v18 = v9;
  v31 = v18;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v30);
  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssetController assetPolicy](self, "assetPolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "assetType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "recordInstalledAssets:forAssetType:", v18, v21);

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke_2;
  v27[3] = &unk_1E95D40F8;
  v27[4] = self;
  v22 = v18;
  v28 = v22;
  v23 = v25;
  v29 = v23;
  -[AXAssetController performBlockOnAssetObservers:](self, "performBlockOnAssetObservers:", v27);
  if (v26)
  {
    v24 = (void *)objc_msgSend(v22, "copy");
    v26[2](v26, v24, v23);

  }
  objc_destroyWeak(&location);

}

- (AXAssetPolicy)assetPolicy
{
  return self->_assetPolicy;
}

- (void)_queue_refreshAssets:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44[5];
  _QWORD v45[5];
  id v46;
  id v47;
  uint8_t buf[4];
  AXAssetController *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v4 = a3;
  v54 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  AXLogAssetLoader();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v49 = self;
    v50 = 2048;
    v51 = v4;
    _os_log_impl(&dword_1D3F8E000, v8, OS_LOG_TYPE_INFO, "%@: Will refresh assets. canRefreshCatalog=%ld", buf, 0x16u);
  }

  -[AXAssetController assetPolicy](self, "assetPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newAssetQuery");

  AXLogAssetLoader();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = self;
    _os_log_impl(&dword_1D3F8E000, v11, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Will query for metadata.", buf, 0xCu);
  }

  v12 = objc_msgSend(v10, "queryMetaDataSync");
  v20 = v12;
  if (v12 == 5)
  {
    AXLogAssetLoader();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[AXAssetController _queue_refreshAssets:completion:].cold.2((uint64_t)self, v32);

    goto LABEL_16;
  }
  if (v12 != 2)
  {
    if (!v12)
    {
      AXLogAssetLoader();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = self;
        _os_log_impl(&dword_1D3F8E000, v21, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Metadata query successful", buf, 0xCu);
      }
      v22 = 0;
LABEL_18:

LABEL_19:
      objc_msgSend(v10, "results");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXAsset assetsFromMAAssets:](AXAsset, "assetsFromMAAssets:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = (uint64_t)__53__AXAssetController__queue_refreshAssets_completion___block_invoke_221;
      v44[3] = (uint64_t)&unk_1E95D39D8;
      v44[4] = (uint64_t)self;
      objc_msgSend(v34, "ax_filteredArrayUsingBlock:", v44);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_222);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogAssetLoader();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "results");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");
        v40 = objc_msgSend(v36, "count");
        *(_DWORD *)buf = 138412802;
        v49 = self;
        v50 = 2048;
        v51 = v39;
        v52 = 2048;
        v53 = v40;
        _os_log_impl(&dword_1D3F8E000, v37, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Retrieved %ld totals assets. %ld supported assets", buf, 0x20u);

      }
      -[AXAssetController _replaceCachedAssetsWithAssets:error:completion:](self, "_replaceCachedAssetsWithAssets:error:completion:", v36, v22, v6);

      goto LABEL_22;
    }
LABEL_16:
    AXAssetMakeErrorForQueryResult(v20, v13, v14, v15, v16, v17, v18, v19, v44[0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogAssetLoader();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = self;
      v50 = 2112;
      v51 = (uint64_t)v43;
      v52 = 2112;
      v53 = (uint64_t)v22;
      _os_log_error_impl(&dword_1D3F8E000, v21, OS_LOG_TYPE_ERROR, "%@: Refreshing assets. Metadata query failed: queryResult=%@. %@", buf, 0x20u);

    }
    goto LABEL_18;
  }
  objc_msgSend(v10, "results");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count") == 0;

  if (v24)
  {
    AXAssetMakeErrorForQueryResult(2, v25, v26, v27, v28, v29, v30, v31, v44[0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  AXLogAssetLoader();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    -[AXAssetController _queue_refreshAssets:completion:].cold.1();

  if (!v4)
    goto LABEL_19;
  AXLogAssetLoader();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = self;
    _os_log_impl(&dword_1D3F8E000, v42, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Will refresh catalog since XmlNotPresent", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __53__AXAssetController__queue_refreshAssets_completion___block_invoke;
  v45[3] = &unk_1E95D4148;
  objc_copyWeak(&v47, (id *)buf);
  v45[4] = self;
  v46 = v6;
  -[AXAssetController _updateCatalogWithOverrideTimeout:completion:](self, "_updateCatalogWithOverrideTimeout:completion:", 0, v45);

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);
LABEL_22:

}

void __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v5, "assetController:didFinishRefreshingAssets:wasSuccessful:error:", v3, v4, *(_QWORD *)(a1 + 48) == 0);

  }
}

uint64_t __61__AXAssetController_refreshWithoutCatalogUpdateSynchronously__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshAssets:completion:", 0, *(_QWORD *)(a1 + 40));
}

void __61__AXAssetController_refreshWithoutCatalogUpdateSynchronously__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __60__AXAssetController__refreshQueue_refreshAssets_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshAssets:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __50__AXAssetController_performBlockOnAssetObservers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)refreshWithoutCatalogUpdateSynchronously
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v3 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__AXAssetController_refreshWithoutCatalogUpdateSynchronously__block_invoke;
  v11[3] = &unk_1E95D3FC0;
  v11[4] = &v12;
  v4 = (void *)MEMORY[0x1D8256430](v11, a2);
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __61__AXAssetController_refreshWithoutCatalogUpdateSynchronously__block_invoke_2;
  block[3] = &unk_1E95D3FE8;
  block[4] = self;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_refreshQueue_refreshAssets:(BOOL)a3 completion:(id)a4
{
  id v6;
  AXDispatchTimer *refreshDispatchTimer;
  id v8;
  void *v9;
  AXDispatchTimer *v10;
  AXDispatchTimer *v11;
  AXDispatchTimer *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_refreshQueue);
  refreshDispatchTimer = self->_refreshDispatchTimer;
  if (!refreshDispatchTimer)
  {
    v8 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (AXDispatchTimer *)objc_msgSend(v8, "initWithTargetSerialQueue:", v9);
    v11 = self->_refreshDispatchTimer;
    self->_refreshDispatchTimer = v10;

    refreshDispatchTimer = self->_refreshDispatchTimer;
  }
  -[AXDispatchTimer cancel](refreshDispatchTimer, "cancel");
  v12 = self->_refreshDispatchTimer;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__AXAssetController__refreshQueue_refreshAssets_completion___block_invoke;
  v14[3] = &unk_1E95D3F28;
  v16 = a3;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  -[AXDispatchTimer afterDelay:processBlock:](v12, "afterDelay:processBlock:", v14, 0.0);

}

- (void)_queue_refreshAssets:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  v3 = v0;
  _os_log_error_impl(&dword_1D3F8E000, v1, OS_LOG_TYPE_ERROR, "%@: Refreshing assets. Metadata query failed: XmlNotPresent. %@", v2, 0x16u);
}

+ (AXAssetController)assetControllerWithPolicy:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[AXAssetController _initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:]([AXAssetController alloc], "_initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:", v3, 33, 1);

  return (AXAssetController *)v4;
}

+ (AXAssetController)assetControllerWithPolicy:(id)a3 qosClass:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[AXAssetController _initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:]([AXAssetController alloc], "_initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:", v5, v4, 1);

  return (AXAssetController *)v6;
}

uint64_t __93__AXAssetController__initWithAssetPolicy_qosClass_shouldRefreshForAssetInstallNotifications___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProductionServerURL");
}

- (void)_registerForNotifications
{
  int *p_notifyToken;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  NSObject *refreshQueue;
  id v12;
  _QWORD handler[4];
  id v14;
  id v15;
  uint8_t buf[4];
  AXAssetController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken == -1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[AXAssetController assetPolicy](self, "assetPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.ma.new-asset-installed"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogAssetLoader();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D3F8E000, v8, OS_LOG_TYPE_INFO, "%@: Registering for asset notifications: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v9 = objc_retainAutorelease(v7);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    refreshQueue = self->_refreshQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46__AXAssetController__registerForNotifications__block_invoke;
    handler[3] = &unk_1E95D3EB0;
    objc_copyWeak(&v15, (id *)buf);
    v12 = v9;
    v14 = v12;
    notify_register_dispatch(v10, p_notifyToken, refreshQueue, handler);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);

  }
}

void __46__AXAssetController__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  AXLogAssetLoader();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412802;
    v6 = WeakRetained;
    v7 = 2112;
    v8 = v4;
    v9 = 2048;
    v10 = objc_msgSend(WeakRetained, "shouldRefreshForAssetInstallNotifications");
    _os_log_impl(&dword_1D3F8E000, v3, OS_LOG_TYPE_INFO, "%@: Did receive note: '%@'. Will kick off asset refresh: %ld", (uint8_t *)&v5, 0x20u);
  }

  if (objc_msgSend(WeakRetained, "shouldRefreshForAssetInstallNotifications"))
    objc_msgSend(WeakRetained, "_refreshQueue_refreshAssets:completion:", 0, 0);

}

- (void)_deregisterForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  AXAssetController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_notifyToken != -1)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[AXAssetController assetPolicy](self, "assetPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.ma.new-asset-installed"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogAssetLoader();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D3F8E000, v7, OS_LOG_TYPE_INFO, "%@: Unregistering for asset notifications: %@", buf, 0x16u);
    }

    notify_cancel(self->_notifyToken);
    self->_notifyToken = -1;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[AXAssetController _deregisterForNotifications](self, "_deregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AXAssetController;
  -[AXAssetController dealloc](&v3, sel_dealloc);
}

- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4
{
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](self, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", a3, a4, 0, 0);
}

- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4 catalogRefreshOverrideTimeout:(id)a5
{
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](self, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", a3, a4, a5, 0);
}

- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4 catalogRefreshOverrideTimeout:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id *v14;
  id v15;
  NSObject *refreshQueue;
  id v17;
  _QWORD v18[5];
  id v19;
  BOOL v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  AXAssetController *v25;
  __int16 v26;
  _BOOL8 v27;
  uint64_t v28;

  v8 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  AXLogAssetLoader();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v25 = self;
    v26 = 2048;
    v27 = v8;
    _os_log_impl(&dword_1D3F8E000, v12, OS_LOG_TYPE_INFO, "%@: Asset refresh requested. ForceUpdateCatalog=%ld", buf, 0x16u);
  }

  if (v8)
  {
    -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke;
    block[3] = &unk_1E95D3F00;
    block[4] = self;
    v14 = &v22;
    v22 = v10;
    v23 = v11;
    v15 = v11;
    dispatch_async(v13, block);

  }
  else
  {
    refreshQueue = self->_refreshQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_192;
    v18[3] = &unk_1E95D3F28;
    v20 = a4;
    v14 = &v19;
    v18[4] = self;
    v19 = v11;
    v17 = v11;
    dispatch_async(refreshQueue, v18);
  }

}

void __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_2;
  v4[3] = &unk_1E95D3ED8;
  v4[4] = v2;
  objc_copyWeak(&v6, &location);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_updateCatalogWithOverrideTimeout:completion:", v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AXLogAssetLoader();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_2_cold_1(a1, a2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "%@: Did force-update catalog", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, 0, 0, *(_QWORD *)(a1 + 40));

}

uint64_t __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_192(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshQueue_refreshAssets:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (id)refreshAssetsWithAttributesSynchronously:(id)a3 installedOnly:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__AXAssetController_refreshAssetsWithAttributesSynchronously_installedOnly___block_invoke;
  v11[3] = &unk_1E95D3F70;
  v14 = a4;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v8 = v6;
  dispatch_sync(v7, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __76__AXAssetController_refreshAssetsWithAttributesSynchronously_installedOnly___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newAssetQuery");

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v3, "returnTypes:", 1);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9, (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addKeyValuePair:with:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "queryMetaDataSync");
  objc_msgSend(v3, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXAsset assetsFromMAAssets:](AXAsset, "assetsFromMAAssets:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v12;

}

BOOL __76__AXAssetController_refreshAssetsWithAttributesSynchronously_installedOnly___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "contentVersion");
  v6 = objc_msgSend(v4, "contentVersion");

  return v5 > v6;
}

- (id)refreshInstalledAssetsSynchronously
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__AXAssetController_refreshInstalledAssetsSynchronously__block_invoke;
  v6[3] = &unk_1E95D3F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__AXAssetController_refreshInstalledAssetsSynchronously__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "assetPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "newAssetQuery");

  objc_msgSend(v7, "returnTypes:", 1);
  objc_msgSend(v7, "queryMetaDataSync");
  objc_msgSend(v7, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXAsset assetsFromMAAssets:](AXAsset, "assetsFromMAAssets:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)stopDownloadAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__AXAssetController_stopDownloadAsset_completion___block_invoke;
  v11[3] = &unk_1E95D3FE8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __50__AXAssetController_stopDownloadAsset_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "maAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__AXAssetController_stopDownloadAsset_completion___block_invoke_2;
  v3[3] = &unk_1E95D4010;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "cancelDownload:", v3);

}

uint64_t __50__AXAssetController_stopDownloadAsset_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  AXLogAssetLoader();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D3F8E000, v4, OS_LOG_TYPE_DEFAULT, "Download cancelled: %@ %@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2 == 0);
}

- (void)downloadAssets:(id)a3 successStartBlock:(id)a4
{
  -[AXAssetController downloadAssets:successStartBlock:completionBlock:](self, "downloadAssets:successStartBlock:completionBlock:", a3, a4, 0);
}

- (void)downloadAssets:(id)a3 successStartBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  AXAssetController *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = a4;
  v24 = a5;
  v22 = v8;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (!v11)
      goto LABEL_16;
    v12 = *(_QWORD *)v35;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "refreshMAAsset");
        objc_msgSend(v14, "maAsset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "state") == 4;

        if (!v16)
          goto LABEL_13;
        v30 = 0;
        v31 = &v30;
        v32 = 0x2020000000;
        v33 = 0;
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __70__AXAssetController_downloadAssets_successStartBlock_completionBlock___block_invoke;
        v29[3] = &unk_1E95D4038;
        v29[5] = v14;
        v29[6] = &v30;
        v29[4] = self;
        -[AXAssetController performWithinLock:](self, "performWithinLock:", v29);
        if (!*((_BYTE *)v31 + 24))
        {
          _Block_object_dispose(&v30, 8);
LABEL_13:
          objc_msgSend(v9, "addObject:", v14);
          continue;
        }
        AXLogAssetLoader();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v39 = self;
          v40 = 2112;
          v41 = v14;
          _os_log_impl(&dword_1D3F8E000, v17, OS_LOG_TYPE_INFO, "%@: Asked to download already-downloading asset. %@", buf, 0x16u);
        }

        _Block_object_dispose(&v30, 8);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (!v11)
      {
LABEL_16:

        if (objc_msgSend(v9, "count"))
        {
          -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
          v18 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __70__AXAssetController_downloadAssets_successStartBlock_completionBlock___block_invoke_206;
          block[3] = &unk_1E95D4060;
          block[4] = self;
          v26 = v9;
          v27 = v23;
          v28 = v24;
          dispatch_async(v18, block);

        }
        else
        {
          if (v23)
            (*((void (**)(id, uint64_t))v23 + 2))(v23, 1);
          if (v24)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXAssetLoader"), CFSTR("No assets require a new download."));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v24 + 2))(v24, 0, v21);

          }
        }

        v20 = v24;
        goto LABEL_26;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXAssetLoader"), CFSTR("No assets passed in to download."));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v24;
  if (v24)
    (*((void (**)(id, _QWORD, void *))v24 + 2))(v24, 0, v19);

LABEL_26:
}

uint64_t __70__AXAssetController_downloadAssets_successStartBlock_completionBlock___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __70__AXAssetController_downloadAssets_successStartBlock_completionBlock___block_invoke_206(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_downloadAssets:successStartBlock:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)purgeAssets:(id)a3
{
  -[AXAssetController purgeAssets:completion:](self, "purgeAssets:completion:", a3, 0);
}

- (void)purgeAssets:(id)a3 completion:(id)a4
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
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AXAssetController_purgeAssets_completion___block_invoke;
  block[3] = &unk_1E95D3F00;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __44__AXAssetController_purgeAssets_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_purgeAssets:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)purgeAssetsSynchronously:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AXAssetController_purgeAssetsSynchronously___block_invoke;
  block[3] = &unk_1E95D3AD0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __46__AXAssetController_purgeAssetsSynchronously___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_purgeAssets:completion:", *(_QWORD *)(a1 + 40), 0);
}

- (void)getCachedAvailableAssets:(id)a3
{
  void (**v4)(id, _QWORD);
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__2;
    v10 = __Block_byref_object_dispose__2;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__AXAssetController_getCachedAvailableAssets___block_invoke;
    v5[3] = &unk_1E95D4088;
    v5[4] = self;
    v5[5] = &v6;
    -[AXAssetController performWithinLock:](self, "performWithinLock:", v5);
    v4[2](v4, v7[5]);
    _Block_object_dispose(&v6, 8);

  }
}

void __46__AXAssetController_getCachedAvailableAssets___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)getCachedDownloadedAssets:(id)a3
{
  void (**v4)(id, _QWORD);
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__2;
    v10 = __Block_byref_object_dispose__2;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__AXAssetController_getCachedDownloadedAssets___block_invoke;
    v5[3] = &unk_1E95D4088;
    v5[4] = self;
    v5[5] = &v6;
    -[AXAssetController performWithinLock:](self, "performWithinLock:", v5);
    v4[2](v4, v7[5]);
    _Block_object_dispose(&v6, 8);

  }
}

void __47__AXAssetController_getCachedDownloadedAssets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "ax_filteredArrayUsingBlock:", &__block_literal_global_208);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __47__AXAssetController_getCachedDownloadedAssets___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0CB3620];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

  return v7;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__AXAssetController_removeObserver___block_invoke;
  v6[3] = &unk_1E95D3AD0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v6);

}

uint64_t __36__AXAssetController_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)hasInProgressDownloads
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AXAssetController_hasInProgressDownloads__block_invoke;
  v4[3] = &unk_1E95D4088;
  v4[4] = self;
  v4[5] = &v5;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__AXAssetController_hasInProgressDownloads__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "_handleAssetProgressUpdate:progressNotification:", WeakRetained, v5);

  }
}

void __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke_211(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (void)addInProgressAsset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  AXAssetController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogAssetLoader();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "%@: Adding in-progress asset: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AXAssetController_addInProgressAsset___block_invoke;
  v7[3] = &unk_1E95D3AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v7);

}

uint64_t __40__AXAssetController_addInProgressAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeInProgressAsset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  AXAssetController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogAssetLoader();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "%@: Removing in-progress asset: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AXAssetController_removeInProgressAsset___block_invoke;
  v7[3] = &unk_1E95D3AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v7);

}

uint64_t __43__AXAssetController_removeInProgressAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_handleAssetProgressUpdate:(id)a3 progressNotification:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  AXAssetController *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  AXLogAssetLoader();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_msgSend(v7, "totalWritten");
    v12 = objc_msgSend(v7, "totalExpected");
    v13 = objc_msgSend(v7, "isStalled");
    objc_msgSend(v7, "expectedTimeRemaining");
    *(_DWORD *)buf = 138413570;
    v19 = self;
    v20 = 2048;
    v21 = v11;
    v22 = 2048;
    v23 = v12;
    v24 = 2048;
    v25 = v13;
    v26 = 2048;
    v27 = v14;
    v28 = 2112;
    v29 = v6;
    _os_log_debug_impl(&dword_1D3F8E000, v8, OS_LOG_TYPE_DEBUG, "%@: Asset DL: %lld of %lld bytes. isStalled=%ld. expectedTimeRemaining=%f. %@", buf, 0x3Eu);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__AXAssetController__handleAssetProgressUpdate_progressNotification___block_invoke;
  v15[3] = &unk_1E95D40F8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  -[AXAssetController performBlockOnAssetObservers:](self, "performBlockOnAssetObservers:", v15);

}

void __69__AXAssetController__handleAssetProgressUpdate_progressNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = objc_msgSend(*(id *)(a1 + 48), "totalWritten");
    v6 = objc_msgSend(*(id *)(a1 + 48), "totalExpected");
    v7 = objc_msgSend(*(id *)(a1 + 48), "isStalled");
    objc_msgSend(*(id *)(a1 + 48), "expectedTimeRemaining");
    objc_msgSend(v8, "assetController:asset:downloadProgressTotalWritten:totalExpected:isStalled:expectedTimeRemaining:", v3, v4, v5, v6, v7);
  }

}

- (void)_handleAssetDownloadCompletion:(id)a3 downloadResult:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22[5];
  id v23;
  id v24;
  BOOL v25;
  uint8_t buf[4];
  AXAssetController *v27;
  __int16 v28;
  _BOOL8 v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "refreshMAAsset");
  -[AXAssetController removeInProgressAsset:](self, "removeInProgressAsset:", v6);
  v14 = -[NSMutableSet count](self->_cachedInProgressAssets, "count");
  if (a4 != 10 && a4)
  {
    AXAssetMakeErrorForDownloadResult(a4, v7, v8, v9, v10, v11, v12, v13, v22[0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogAssetLoader();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v27 = self;
      v28 = 2048;
      v29 = v14 != 0;
      v30 = 2112;
      v31 = v18;
      v32 = 2112;
      v33 = v6;
      _os_log_error_impl(&dword_1D3F8E000, v19, OS_LOG_TYPE_ERROR, "%@: DL failed. hasRemainingDownloads=%ld. error=%@. %@", buf, 0x2Au);
    }

  }
  else
  {
    AXLogAssetLoader();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v27 = self;
      v28 = 2048;
      v29 = v14 != 0;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_1D3F8E000, v15, OS_LOG_TYPE_INFO, "%@: DL finished. hasRemainingDownloads=%ld. %@", buf, 0x20u);
    }

    -[AXAssetController assetPolicy](self, "assetPolicy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldCopyLocally");

    if (v17)
      objc_msgSend(v6, "copyLocally");
    v18 = 0;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = (uint64_t)__67__AXAssetController__handleAssetDownloadCompletion_downloadResult___block_invoke;
  v22[3] = (uint64_t)&unk_1E95D4120;
  v22[4] = (uint64_t)self;
  v23 = v6;
  v24 = v18;
  v25 = v14 != 0;
  v20 = v18;
  v21 = v6;
  -[AXAssetController performBlockOnAssetObservers:](self, "performBlockOnAssetObservers:", v22);

}

void __67__AXAssetController__handleAssetDownloadCompletion_downloadResult___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:", a1[4], a1[5], a1[6] == 0);

}

void __53__AXAssetController__queue_refreshAssets_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19[5];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    AXLogAssetLoader();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (a2)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        MAStringForMADownloadResultSoft(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v7;
        v23 = 2048;
        v24 = a2;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Catalog refresh failed. result=%ld %@", buf, 0x20u);

      }
      AXAssetMakeErrorForDownloadResult(a2, v9, v10, v11, v12, v13, v14, v15, v19[0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_replaceCachedAssetsWithAssets:error:completion:", 0, v16, *(_QWORD *)(a1 + 40));

    }
    else
    {
      if (v6)
      {
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v22 = v17;
        _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Catalog refresh successful. Will attempt asset refesh again.", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "mobileAssetQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = (uint64_t)__53__AXAssetController__queue_refreshAssets_completion___block_invoke_220;
      v19[3] = (uint64_t)&unk_1E95D3FE8;
      v19[4] = (uint64_t)WeakRetained;
      v20 = *(id *)(a1 + 40);
      dispatch_async(v18, v19);

    }
  }

}

uint64_t __53__AXAssetController__queue_refreshAssets_completion___block_invoke_220(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshAssets:completion:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __53__AXAssetController__queue_refreshAssets_completion___block_invoke_221(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "assetPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAssetSupported:", v3);

  return v5;
}

- (void)_updateCatalogWithOverrideTimeout:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id location;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE buf[24];
  void *v32;
  uint64_t *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[AXAssetController assetPolicy](self, "assetPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadOptionsForOperation:userInitiated:", 0, -[AXAssetController userInitiated](self, "userInitiated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v9, "setTimeoutIntervalForResource:", objc_msgSend(v6, "longValue"));
  -[AXAssetController assetPolicy](self, "assetPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke;
  v24[3] = &unk_1E95D4190;
  v24[4] = self;
  v12 = v10;
  v25 = v12;
  -[AXAssetController performBlockOnAssetObservers:](self, "performBlockOnAssetObservers:", v24);
  AXLogAssetLoader();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1D3F8E000, v13, OS_LOG_TYPE_INFO, "%@: Will update catalog with options: %@", buf, 0x16u);
  }

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v14 = (void *)getMAAssetClass_softClass;
  v30 = getMAAssetClass_softClass;
  if (!getMAAssetClass_softClass)
  {
    *(_QWORD *)buf = v11;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getMAAssetClass_block_invoke;
    v32 = &unk_1E95D3900;
    v33 = &v27;
    __getMAAssetClass_block_invoke((uint64_t)buf);
    v14 = (void *)v28[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v27, 8);
  -[AXAssetController assetPolicy](self, "assetPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke_225;
  v20[3] = &unk_1E95D41B8;
  objc_copyWeak(&v23, &location);
  v20[4] = self;
  v18 = v12;
  v21 = v18;
  v19 = v7;
  v22 = v19;
  objc_msgSend(v15, "startCatalogDownload:options:then:", v17, v9, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetController:willUpdateCatalogForPolicy:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke_225(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  AXLogAssetLoader();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MAStringForMADownloadResultSoft(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "%@: Catalog download failed: %@ - %@", buf, 0x20u);

    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    MAStringForMADownloadResultSoft(a2);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ax_errorWithDomain:description:", CFSTR("AXAssetLoader"), CFSTR("%@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "%@: Catalog download succeeeded", buf, 0xCu);
    }
    v11 = 0;
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke_228;
  v15[3] = &unk_1E95D4120;
  v15[4] = WeakRetained;
  v13 = *(id *)(a1 + 40);
  v18 = a2 == 0;
  v16 = v13;
  v17 = v11;
  v14 = v11;
  objc_msgSend(WeakRetained, "performBlockOnAssetObservers:", v15);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke_228(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetController:didUpdateCatalogForPolicy:wasSuccessful:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)_queue_downloadAssets:(id)a3 successStartBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(id, _QWORD);
  id obj;
  uint64_t v36;
  uint64_t v37;
  AXAssetController *val;
  void (**v39)(id, _QWORD, void *);
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  void (**v45)(id, _QWORD, void *);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id location;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  AXAssetController *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = (void (**)(id, _QWORD))a4;
  val = self;
  v39 = (void (**)(id, _QWORD, void *))a5;
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "maAsset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        location = 0;
        if ((objc_msgSend(v13, "spaceCheck:", &location) & 1) == 0)
        {
          AXLogAssetLoader();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", location);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v58 = self;
            v59 = 2112;
            v60 = v13;
            v61 = 2112;
            v62 = (uint64_t)v33;
            _os_log_error_impl(&dword_1D3F8E000, v28, OS_LOG_TYPE_ERROR, "%@: DL failed. not enough disk space for asset. %@. diskSpaceRequired=%@", buf, 0x20u);

          }
          v29 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", location);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("not enough disk space for asset: %@, required disk space: %@ bytes"), v13, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
            v34[2](v34, 0);
          if (v39)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXAssetLoader"), CFSTR("%@"), v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v39[2](v39, 0, v32);

          }
          v27 = obj;
          goto LABEL_28;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      if (v10)
        continue;
      break;
    }
  }

  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssetController assetPolicy](self, "assetPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assetType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordAssetsToBeDownloaded:forAssetType:", obj, v16);

  -[AXAssetController assetPolicy](self, "assetPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "downloadOptionsForOperation:userInitiated:", 1, -[AXAssetController userInitiated](self, "userInitiated"));
  v37 = objc_claimAutoreleasedReturnValue();

  AXLogAssetLoader();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v58 = self;
    v59 = 2112;
    v60 = v19;
    v61 = 2112;
    v62 = v37;
    _os_log_impl(&dword_1D3F8E000, v18, OS_LOG_TYPE_INFO, "%@: Will download %@ assets with options: %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v20 = obj;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v21)
  {
    v36 = *(_QWORD *)v48;
    v22 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        -[AXAssetController _handleAssetDownloadStarted:](val, "_handleAssetDownloadStarted:", v24);
        objc_msgSend(v24, "maAsset");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v22;
        v43[1] = 3221225472;
        v43[2] = __77__AXAssetController__queue_downloadAssets_successStartBlock_completionBlock___block_invoke;
        v43[3] = &unk_1E95D41E0;
        objc_copyWeak(&v46, (id *)buf);
        v43[4] = v24;
        v45 = v39;
        v26 = v20;
        v44 = v26;
        objc_msgSend(v25, "startDownload:then:", v37, v43);
        objc_initWeak(&location, v24);
        v40[0] = v22;
        v40[1] = 3221225472;
        v40[2] = __77__AXAssetController__queue_downloadAssets_successStartBlock_completionBlock___block_invoke_2;
        v40[3] = &unk_1E95D40D0;
        objc_copyWeak(&v41, &location);
        objc_copyWeak(&v42, (id *)buf);
        objc_msgSend(v24, "attachProgressHandlerIfNeeded:", v40);
        objc_destroyWeak(&v42);
        objc_destroyWeak(&v41);
        objc_destroyWeak(&location);

        objc_destroyWeak(&v46);
      }
      v21 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v21);
  }

  if (v34)
    ((void (*)(void))v34[2])();
  objc_destroyWeak((id *)buf);
  v27 = (void *)v37;
LABEL_28:

}

void __77__AXAssetController__queue_downloadAssets_successStartBlock_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  char v7;

  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleAssetDownloadCompletion:downloadResult:", *(_QWORD *)(a1 + 32), a2);

  if (*(_QWORD *)(a1 + 48))
  {
    v6 = objc_loadWeakRetained(v4);
    v7 = objc_msgSend(v6, "hasInProgressDownloads");

    if ((v7 & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __77__AXAssetController__queue_downloadAssets_successStartBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "_handleAssetProgressUpdate:progressNotification:", WeakRetained, v5);

  }
}

- (void)_queue_purgeAssets:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  NSObject *v28;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void (**v39)(id, id, id);
  void *v40;
  AXAssetController *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[6];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = (void (**)(id, id, id))a4;
  v41 = self;
  -[AXAssetController mobileAssetQueue](self, "mobileAssetQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssetController assetPolicy](self, "assetPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordAssetsToBePurged:forAssetType:", v6, v10);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v15, "maAsset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "purgeSync");
        if (v17 == 3 || v17 == 0)
        {
          AXLogAssetLoader();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            _os_log_impl(&dword_1D3F8E000, v26, OS_LOG_TYPE_INFO, "%@: Successfully purged asset: %@", buf, 0x16u);
          }

          v27 = 0;
        }
        else
        {
          AXAssetMakeErrorForPurgeResult(v17, v18, v19, v20, v21, v22, v23, v24, v38);
          v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          AXLogAssetLoader();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2112;
            v51 = v27;
            _os_log_impl(&dword_1D3F8E000, v28, OS_LOG_TYPE_INFO, "%@: Asset purge failed. %@. Error: %@", buf, 0x20u);
          }

          if (v27)
            objc_msgSend(v40, "addObject:", v27);
        }
        objc_msgSend(v15, "refreshMAAsset");

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v12);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v51 = __Block_byref_object_copy__2;
  v52 = __Block_byref_object_dispose__2;
  v53 = 0;
  v30 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __51__AXAssetController__queue_purgeAssets_completion___block_invoke;
  v45[3] = &unk_1E95D4088;
  v45[4] = v41;
  v45[5] = buf;
  -[AXAssetController performWithinLock:](v41, "performWithinLock:", v45);
  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  -[AXAssetController assetPolicy](v41, "assetPolicy");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "assetType");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "recordInstalledAssets:forAssetType:", v32, v34);

  objc_msgSend(v40, "firstObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v30;
  v42[1] = 3221225472;
  v42[2] = __51__AXAssetController__queue_purgeAssets_completion___block_invoke_2;
  v42[3] = &unk_1E95D40F8;
  v42[4] = v41;
  v36 = v11;
  v43 = v36;
  v37 = v35;
  v44 = v37;
  -[AXAssetController performBlockOnAssetObservers:](v41, "performBlockOnAssetObservers:", v42);
  if (v39)
    v39[2](v39, v36, v37);

  _Block_object_dispose(buf, 8);
}

void __51__AXAssetController__queue_purgeAssets_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__AXAssetController__queue_purgeAssets_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetController:didFinishPurgingAssets:wasSuccessful:error:", a1[4], a1[5], a1[6] == 0);

}

void __61__AXAssetController__queue_updateDownloadPriorityIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  AXLogAssetLoader();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a2 == 0;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1D3F8E000, v4, OS_LOG_TYPE_INFO, "%@: Updated download priority for asset: %@, success=%@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)purgeInMemoryCachedAssets
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__AXAssetController_purgeInMemoryCachedAssets__block_invoke;
  v2[3] = &unk_1E95D3A80;
  v2[4] = self;
  -[AXAssetController performWithinLock:](self, "performWithinLock:", v2);
}

uint64_t __46__AXAssetController_purgeInMemoryCachedAssets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

- (BOOL)shouldRefreshForAssetInstallNotifications
{
  return self->_shouldRefreshForAssetInstallNotifications;
}

- (void)setShouldRefreshForAssetInstallNotifications:(BOOL)a3
{
  self->_shouldRefreshForAssetInstallNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetQueue, 0);
  objc_storeStrong((id *)&self->_assetPolicy, 0);
  objc_storeStrong((id *)&self->_refreshDispatchTimer, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_cachedInProgressAssets, 0);
  objc_storeStrong((id *)&self->_cachedAvailableAssets, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_initWithAssetPolicy:(os_log_t)log qosClass:shouldRefreshForAssetInstallNotifications:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D3F8E000, log, OS_LOG_TYPE_FAULT, "Attempted to create an asset controller with nil policy", v1, 2u);
}

- (void)_initWithAssetPolicy:(uint64_t)a1 qosClass:(NSObject *)a2 shouldRefreshForAssetInstallNotifications:.cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  v7 = a1;
  _os_log_fault_impl(&dword_1D3F8E000, a2, OS_LOG_TYPE_FAULT, "Received unexpected asset policy of type (%@): %@", v6, 0x16u);

}

void __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  MAStringForMADownloadResultSoft(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v5;
  v9 = 2048;
  v10 = a2;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1D3F8E000, a3, OS_LOG_TYPE_ERROR, "%@: Force-update catalog failed. Error Code:%ld - %@", (uint8_t *)&v7, 0x20u);

}

- (void)_queue_refreshAssets:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D3F8E000, a2, OS_LOG_TYPE_ERROR, "%@: Refreshing assets. Metadata query failed: Process not entitled for MobileAsset", (uint8_t *)&v2, 0xCu);
}

@end
