@implementation NTKPigmentSyncProvider

- (NTKPigmentSyncProvider)initWithDelegate:(id)a3
{
  id v4;
  NTKPigmentSyncProvider *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *privateQueue;
  void *v9;
  uint64_t v10;
  CLKDevice *device;
  uint64_t v12;
  NTKPigmentEditOptionStore *pigmentStore;
  NTKPigmentPersistentStorageController *v14;
  void *v15;
  uint64_t v16;
  NTKPigmentPersistentStorageController *storageController;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  NTKPigmentSyncProvider *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NTKPigmentSyncProvider;
  v5 = -[NTKPigmentSyncProvider init](&v24, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPigmentSyncProvider", v6);
    privateQueue = v5->_privateQueue;
    v5->_privateQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "device");
    v10 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (CLKDevice *)v10;

    +[NTKPigmentEditOptionStore sharedInstance](NTKPigmentEditOptionStore, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    pigmentStore = v5->_pigmentStore;
    v5->_pigmentStore = (NTKPigmentEditOptionStore *)v12;

    -[NTKPigmentEditOptionStore addListener:forDomain:](v5->_pigmentStore, "addListener:forDomain:", v5, 0);
    v14 = [NTKPigmentPersistentStorageController alloc];
    +[NTKPigmentPersistentStorageController syncStoresFolder](NTKPigmentPersistentStorageController, "syncStoresFolder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NTKPigmentPersistentStorageController initWithRootDirectory:](v14, "initWithRootDirectory:", v15);
    storageController = v5->_storageController;
    v5->_storageController = (NTKPigmentPersistentStorageController *)v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v5, sel_colorBundleContentChanged, CFSTR("NTKColorBundleContentChangedNotificationName"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v5, sel_faceBundlesUpdated, CFSTR("NTKFaceBundleManagerDidUpdateBundlesNotificationName"), 0);

    v20 = v5->_privateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__NTKPigmentSyncProvider_initWithDelegate___block_invoke;
    block[3] = &unk_1E6BCD5F0;
    v23 = v5;
    dispatch_sync(v20, block);

  }
  return v5;
}

uint64_t __43__NTKPigmentSyncProvider_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "compareLocalSyncDifferences");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 32), "shouldForceFullSync");
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      v8 = "#sync Starting NTKPigmentSyncProvider - Will force full sync";
      v9 = v6;
      v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (v7)
  {
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
    v13 = 134217984;
    v14 = v11;
    v8 = "#sync Starting NTKPigmentSyncProvider - Number of domains to sync %lu";
    v9 = v6;
    v10 = 12;
    goto LABEL_6;
  }

  return objc_msgSend(*(id *)(a1 + 32), "_requestDeltaSyncIfNeeded");
}

- (BOOL)prepareForSyncing:(BOOL)a3
{
  NSObject *privateQueue;
  char v4;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke;
  block[3] = &unk_1E6BD8550;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(privateQueue, block);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  unsigned int v3;
  BOOL v4;
  unsigned int v5;
  NSObject *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldForceFullSync");
  if (v2[16])
    v4 = 0;
  else
    v4 = v3 == 0;
  if (!v4)
  {
    v5 = v3;
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v5;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "#sync will sync colors for all domains. forcing full sync: %lu", buf, 0xCu);
    }

    v7 = 1;
    *(_BYTE *)(*(_QWORD *)v2 + 9) = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)v2 + 64);
    *(_QWORD *)(*(_QWORD *)v2 + 64) = v8;

    v10 = *(void **)v2;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_30;
    v20[3] = &unk_1E6BD8528;
    v20[4] = v10;
    objc_msgSend(v10, "enumerateAllFacesPigmentDomains:", v20);
    v11 = 8;
LABEL_18:
    *(_BYTE *)(*(_QWORD *)v2 + v11) = v7;
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)v2 + 56), "count"))
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)v2 + 56);
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "#sync will sync colors for domains %{public}@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)v2 + 9) = objc_msgSend(*(id *)(*(_QWORD *)v2 + 56), "containsObject:", CFSTR("sharedCollections"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(_QWORD *)v2 + 64);
    *(_QWORD *)(*(_QWORD *)v2 + 64) = v14;

    v16 = *(void **)v2;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_33;
    v19[3] = &unk_1E6BD8528;
    v19[4] = v16;
    objc_msgSend(v16, "enumerateAllFacesPigmentDomains:", v19);
    if (objc_msgSend(*(id *)(*(_QWORD *)v2 + 56), "count")
      && (objc_msgSend(*(id *)(*(_QWORD *)v2 + 56), "count") != 1
       || (objc_msgSend(*(id *)(*(_QWORD *)v2 + 56), "containsObject:", CFSTR("sharedCollections")) & 1) == 0))
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_cold_1((uint64_t)v2, v17);

    }
    v18 = *(void **)(*(_QWORD *)v2 + 56);
    *(_QWORD *)(*(_QWORD *)v2 + 56) = 0;

    v7 = 0;
    *(_BYTE *)(*(_QWORD *)v2 + 8) = 1;
    v11 = 11;
    goto LABEL_18;
  }
LABEL_19:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
}

void __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  _NTKPigmentSyncProviderFaceDomain *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v5 = a3;
  v6 = a2;
  v7 = -[_NTKPigmentSyncProviderFaceDomain initWithFace:domain:]([_NTKPigmentSyncProviderFaceDomain alloc], "initWithFace:domain:", v6, v5);

  objc_msgSend(v4, "addObject:", v7);
}

void __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  _NTKPigmentSyncProviderFaceDomain *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", v5))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v7 = -[_NTKPigmentSyncProviderFaceDomain initWithFace:domain:]([_NTKPigmentSyncProviderFaceDomain alloc], "initWithFace:domain:", v8, v5);
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", v5);
  }

}

- (void)enumerateAllFacesPigmentDomains:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  if (NTKInternalBuild(v4, v5) && (CLKIsNTKDaemon() & 1) == 0 && (CLKIsNTKXCTests() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[NTKPigmentSyncProvider enumerateAllFacesPigmentDomains:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  -[NTKPigmentSyncProvider allAvailableFacesSupportingPigment](self, "allAvailableFacesSupportingPigment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__NTKPigmentSyncProvider_enumerateAllFacesPigmentDomains___block_invoke;
  v16[3] = &unk_1E6BD8578;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

}

void __58__NTKPigmentSyncProvider_enumerateAllFacesPigmentDomains___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "allPigmentFaceDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)nextSyncData:(id *)a3
{
  NSObject *privateQueue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__41;
  v18 = __Block_byref_object_dispose__41;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__41;
  v12 = __Block_byref_object_dispose__41;
  v13 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__NTKPigmentSyncProvider_nextSyncData___block_invoke;
  block[3] = &unk_1E6BD85A0;
  block[4] = self;
  block[5] = &v8;
  block[6] = &v14;
  dispatch_sync(privateQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __39__NTKPigmentSyncProvider_nextSyncData___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (*(_BYTE *)(v2 + 9))
  {
    *(_BYTE *)(v2 + 9) = 0;
    objc_msgSend(*(id *)(a1[4] + 24), "sharedCollections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[NTKProtoSharedCollections protoBufferFromSharedCollections:](NTKProtoSharedCollections, "protoBufferFromSharedCollections:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("sharedCollections"));
      objc_msgSend(v4, "data");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1[6] + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "length");
        v24 = 134217984;
        v25 = v9;
        _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_INFO, "#sync Loaded pigment shared collections for sync - data size: %lu", (uint8_t *)&v24, 0xCu);
      }
LABEL_11:

    }
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 64), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1[4] + 64), "removeObjectAtIndex:", 0);
      v10 = *(void **)(a1[4] + 24);
      objc_msgSend(v3, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v3, "face");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pigmentSetForDomain:bundle:", v11, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "domain");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1[5] + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        objc_msgSend(v4, "protoBuffer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "data");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1[6] + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "domain");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "length");
          v24 = 138543618;
          v25 = (uint64_t)v22;
          v26 = 2048;
          v27 = v23;
          _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_INFO, "#sync Loaded pigment set for sync - face domain: %{public}@, data size: %lu", (uint8_t *)&v24, 0x16u);

        }
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __39__NTKPigmentSyncProvider_nextSyncData___block_invoke_cold_1(v3, v8);
      }
      goto LABEL_11;
    }
  }

}

- (BOOL)isSyncing
{
  NSObject *privateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__NTKPigmentSyncProvider_isSyncing__block_invoke;
  v5[3] = &unk_1E6BD1498;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__NTKPigmentSyncProvider_isSyncing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)finishSyncing:(BOOL)a3
{
  NSObject *privateQueue;
  _QWORD v4[5];
  BOOL v5;

  privateQueue = self->_privateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__NTKPigmentSyncProvider_finishSyncing___block_invoke;
  v4[3] = &unk_1E6BCF930;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(privateQueue, v4);
}

void __40__NTKPigmentSyncProvider_finishSyncing___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 0;
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 40) && !*(_BYTE *)(v3 + 11))
    {
      v4 = *(void **)(v3 + 32);
      objc_msgSend(*(id *)(v3 + 24), "sharedCollections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "persistSharedCollections:deviceUUID:", v5, 0);

      v6 = *(void **)(a1 + 32);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __40__NTKPigmentSyncProvider_finishSyncing___block_invoke_2;
      v12[3] = &unk_1E6BD8528;
      v12[4] = v6;
      objc_msgSend(v6, "enumerateAllFacesPigmentDomains:", v12);
      objc_msgSend(*(id *)(a1 + 32), "saveSyncVersion");
      v3 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v3 + 10))
    {
      *(_BYTE *)(v3 + 10) = 0;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __40__NTKPigmentSyncProvider_finishSyncing___block_invoke_3;
      v11[3] = &unk_1E6BCD5F0;
      v11[4] = v7;
      dispatch_async(v8, v11);
      v3 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v3 + 32), "closeTransactionForDeviceUUID:", 0);
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      v14 = v10;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "#sync Finished syncing. success:%lu", buf, 0xCu);
    }

  }
}

void __40__NTKPigmentSyncProvider_finishSyncing___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pigmentSetForDomain:bundle:", v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "storageController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistFacePigmentSet:deviceUUID:", v9, 0);

}

uint64_t __40__NTKPigmentSyncProvider_finishSyncing___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestDeltaSyncIfNeeded");
}

- (void)saveSyncVersion
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, CFSTR("NTKPigmentSyncProviderSyncVersion"));

}

- (BOOL)shouldForceFullSync
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NTKPigmentSyncProviderSyncVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4 != 2;
}

- (void)colorBundleContentChanged
{
  NSObject *privateQueue;
  _QWORD block[5];

  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKPigmentSyncProvider_colorBundleContentChanged__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(privateQueue, block);
}

uint64_t __51__NTKPigmentSyncProvider_colorBundleContentChanged__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "setReceivedUpdateDuringSync:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#sync color bundles changed. It will attempt to request delta sync", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_requestDeltaSyncIfNeeded");
}

- (void)faceBundlesUpdated
{
  NSObject *privateQueue;
  _QWORD block[5];

  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NTKPigmentSyncProvider_faceBundlesUpdated__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(privateQueue, block);
}

uint64_t __44__NTKPigmentSyncProvider_faceBundlesUpdated__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "setReceivedUpdateDuringSync:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#sync face bundles updated. It will attempt to request delta sync", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_requestDeltaSyncIfNeeded");
}

- (void)colorEditOptionStore:(id)a3 didChangeForDomain:(id)a4
{
  NSObject *privateQueue;
  _QWORD block[5];

  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NTKPigmentSyncProvider_colorEditOptionStore_didChangeForDomain___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(privateQueue, block);
}

uint64_t __66__NTKPigmentSyncProvider_colorEditOptionStore_didChangeForDomain___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "setReceivedUpdateDuringSync:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#sync pigment store changed. It will attempt to request delta sync", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_requestDeltaSyncIfNeeded");
}

- (void)_requestDeltaSyncIfNeeded
{
  void *v3;
  NSMutableSet *v4;
  NSMutableSet *domainsRequiringDeltaSync;
  _BOOL4 syncing;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NTKPigmentPersistentStorageController sharedCollections](self->_storageController, "sharedCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _NTKLoggingObjectForDomain(5, (uint64_t)"NTKLoggingDomainSync");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v11 = "#color-sync Ignoring request delta sync, waiting for reset sync request";
LABEL_15:
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 2u);
    }
LABEL_16:

    goto LABEL_17;
  }
  -[NTKPigmentSyncProvider compareLocalSyncDifferences](self, "compareLocalSyncDifferences");
  v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  domainsRequiringDeltaSync = self->_domainsRequiringDeltaSync;
  self->_domainsRequiringDeltaSync = v4;

  if (!-[NSMutableSet count](self->_domainsRequiringDeltaSync, "count")
    && !-[NTKPigmentSyncProvider shouldForceFullSync](self, "shouldForceFullSync"))
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v11 = "#sync No changes since last sync";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  syncing = self->_syncing;
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (syncing)
  {
    if (v8)
    {
      v9 = -[NSMutableSet count](self->_domainsRequiringDeltaSync, "count");
      v14 = 134217984;
      v15 = v9;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "#sync Needs to request delta sync due to changes in pigment set for domains (%lu)", (uint8_t *)&v14, 0xCu);
    }

    self->_requestDeltaSyncAfterSyncing = 1;
  }
  else
  {
    if (v8)
    {
      v12 = -[NSMutableSet count](self->_domainsRequiringDeltaSync, "count");
      v14 = 134217984;
      v15 = v12;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "#sync Requesting delta sync due to changes in pigment set for domains (%lu)", (uint8_t *)&v14, 0xCu);
    }

    -[NTKPigmentSyncProvider delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncProviderDidRequiresDeltaSync:", self);

  }
LABEL_17:

}

- (id)compareLocalSyncDifferences
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentEditOptionStore sharedCollections](self->_pigmentStore, "sharedCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentPersistentStorageController sharedCollections](self->_storageController, "sharedCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "areCollections:equalToCollections:", v4, v5) & 1) == 0)
    objc_msgSend(v3, "addObject:", CFSTR("sharedCollections"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__NTKPigmentSyncProvider_compareLocalSyncDifferences__block_invoke;
  v11[3] = &unk_1E6BD85C8;
  v11[4] = self;
  v12 = v5;
  v6 = v3;
  v13 = v6;
  v7 = v5;
  -[NTKPigmentSyncProvider enumerateAllFacesPigmentDomains:](self, "enumerateAllFacesPigmentDomains:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

void __53__NTKPigmentSyncProvider_compareLocalSyncDifferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1BCCA7FA8]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "pigmentSetForDomain:bundle:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "facePigmentSetForDomain:sharedCollections:", v5, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

  objc_autoreleasePoolPop(v6);
}

- (id)allAvailableFacesSupportingPigment
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (NTKInternalBuild(self, a2) && (CLKIsNTKDaemon() & 1) == 0 && (CLKIsNTKXCTests() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[NTKPigmentSyncProvider enumerateAllFacesPigmentDomains:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  NTKAllAvailableFaceDescriptors(self->_device);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        +[NTKFace defaultFaceFromFaceDescriptor:forDevice:](NTKFace, "defaultFaceFromFaceDescriptor:forDevice:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18), self->_device, (_QWORD)v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "supportsPigmentEditOption"))
        {
          objc_msgSend((id)objc_opt_class(), "pigmentFaceDomain");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v13, "addObject:", v19);

        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  return v13;
}

+ (BOOL)areCollections:(id)a3 equalToCollections:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = objc_msgSend(v5, "count");
  v16 = v7 == objc_msgSend(v6, "count");
  if (*((_BYTE *)v14 + 24))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__NTKPigmentSyncProvider_areCollections_equalToCollections___block_invoke;
    v10[3] = &unk_1E6BD85F0;
    v12 = &v13;
    v11 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

    v8 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __60__NTKPigmentSyncProvider_areCollections_equalToCollections___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1BCCA7FA8]();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = NTKEqualObjects(v7, v9);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  objc_autoreleasePoolPop(v8);

}

- (NTKPigmentSyncProviderDelegate)delegate
{
  return (NTKPigmentSyncProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSyncing:(BOOL)a3
{
  self->_syncing = a3;
}

- (NTKPigmentEditOptionStore)pigmentStore
{
  return self->_pigmentStore;
}

- (void)setPigmentStore:(id)a3
{
  objc_storeStrong((id *)&self->_pigmentStore, a3);
}

- (NTKPigmentPersistentStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
  objc_storeStrong((id *)&self->_storageController, a3);
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)shouldSyncSharedCollections
{
  return self->_shouldSyncSharedCollections;
}

- (void)setShouldSyncSharedCollections:(BOOL)a3
{
  self->_shouldSyncSharedCollections = a3;
}

- (NSMutableSet)domainsRequiringDeltaSync
{
  return self->_domainsRequiringDeltaSync;
}

- (void)setDomainsRequiringDeltaSync:(id)a3
{
  objc_storeStrong((id *)&self->_domainsRequiringDeltaSync, a3);
}

- (NSMutableArray)faceDomainsToBeSynced
{
  return self->_faceDomainsToBeSynced;
}

- (void)setFaceDomainsToBeSynced:(id)a3
{
  objc_storeStrong((id *)&self->_faceDomainsToBeSynced, a3);
}

- (BOOL)requestDeltaSyncAfterSyncing
{
  return self->_requestDeltaSyncAfterSyncing;
}

- (void)setRequestDeltaSyncAfterSyncing:(BOOL)a3
{
  self->_requestDeltaSyncAfterSyncing = a3;
}

- (BOOL)receivedUpdateDuringSync
{
  return self->_receivedUpdateDuringSync;
}

- (void)setReceivedUpdateDuringSync:(BOOL)a3
{
  self->_receivedUpdateDuringSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceDomainsToBeSynced, 0);
  objc_storeStrong((id *)&self->_domainsRequiringDeltaSync, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_pigmentStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__NTKPigmentSyncProvider_prepareForSyncing___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 56);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "#sync Domains requiring delta sync will be ignored because there is no face descriptor for them. %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)enumerateAllFacesPigmentDomains:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B72A3000, a1, a3, "SyncProviderUsedInvalid: Sync provider used outside of NTK Daemons", a5, a6, a7, a8, 0);
}

void __39__NTKPigmentSyncProvider_nextSyncData___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "#sync No pigment set for domain. It won't be synced %{public}@ - %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
