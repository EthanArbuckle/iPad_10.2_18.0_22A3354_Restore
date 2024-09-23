@implementation NRRegistryHistoryStore

- (void)deasyncGrabHistoryWithReadBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__NRRegistryHistoryStore_sync_history__deasyncGrabHistoryWithReadBlock___block_invoke;
  v6[3] = &unk_1E4495530;
  v7 = v4;
  v5 = v4;
  -[NRRegistryHistoryStore grabHistoryWithReadBlock:](self, "grabHistoryWithReadBlock:", v6);

}

uint64_t __72__NRRegistryHistoryStore_sync_history__deasyncGrabHistoryWithReadBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deasyncGrabHistoryWithWriteBlock:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  id v10;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__NRRegistryHistoryStore_sync_history__deasyncGrabHistoryWithWriteBlock___block_invoke;
  v8[3] = &unk_1E4495558;
  v9 = v5;
  v10 = v4;
  v6 = v5;
  v7 = v4;
  -[NRRegistryHistoryStore grabHistoryWithWriteBlock:](self, "grabHistoryWithWriteBlock:", v8);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

id __73__NRRegistryHistoryStore_sync_history__deasyncGrabHistoryWithWriteBlock___block_invoke(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NRRegistryHistoryStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE237D0 != -1)
    dispatch_once(&qword_1ECE237D0, block);
  return (id)_MergedGlobals_5;
}

void __40__NRRegistryHistoryStore_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = (uint64_t)v1;

}

- (NRRegistryHistoryStore)initWithParameters:(id)a3
{
  id v4;
  void *v5;
  NRRegistryHistoryStore *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NRRegistryHistoryStore *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  _QWORD v18[4];
  NRRegistryHistoryStore *v19;
  id v20;
  id location;
  objc_super v22;
  _QWORD v23[4];
  id v24;
  NRRegistryHistoryStore *v25;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("NRRegistryShouldCreateCollection"));
  v22.receiver = self;
  v22.super_class = (Class)NRRegistryHistoryStore;
  v6 = -[NRRegistry initWithParameters:](&v22, sel_initWithParameters_, v5);
  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = (void *)objc_opt_class();
    dispatch_get_global_queue(21, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__NRRegistryHistoryStore_initWithParameters___block_invoke;
    v18[3] = &unk_1E4496B08;
    v10 = v6;
    v19 = v10;
    objc_copyWeak(&v20, &location);
    v10->_keyBagStatusChangedNotificationToken = objc_msgSend(v7, "registerNotifyTokenWithName:withQueue:withBlock:", CFSTR("com.apple.mobile.keybagd.lock_status"), v8, v18);

    +[NRDataFileHistoryHelpers unarchiveDeviceHistory](NRDataFileHistoryHelpers, "unarchiveDeviceHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      +[NRDataFileHistoryHelpers createMissingDates:](NRDataFileHistoryHelpers, "createMissingDates:", v11);
    else
      v11 = (void *)objc_opt_new();
    v12 = v11;
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __37__NRRegistryHistoryStore_setHistory___block_invoke;
    v23[3] = &unk_1E4495030;
    v13 = v12;
    v24 = v13;
    v25 = v10;
    -[NRRegistry performUnderCollectionLock:](v10, "performUnderCollectionLock:", v23);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NRRegistryHistoryStoreShouldInitializeWithFirstUnlockStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = objc_msgSend(v14, "BOOLValue");
    else
      v16 = MKBDeviceUnlockedSinceBoot();
    if (v16)
      -[NRRegistryHistoryStore _loadAndNotifySecureProperties](v10);
    -[NRRegistry _startQueue](v10, "_startQueue");

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __45__NRRegistryHistoryStore_initWithParameters___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (MKBDeviceUnlockedSinceBoot())
  {
    v2 = *(void **)(a1 + 32);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __45__NRRegistryHistoryStore_initWithParameters___block_invoke_2;
    v3[3] = &unk_1E4496AE0;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    objc_msgSend(v2, "grabHistoryWithWriteBlock:", v3);
    objc_destroyWeak(&v4);
  }
}

uint64_t __45__NRRegistryHistoryStore_initWithParameters___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[NRRegistryHistoryStore _loadAndNotifySecureProperties](WeakRetained);

  return 0;
}

- (void)_loadAndNotifySecureProperties
{
  void *v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "secureProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      +[NRDataFileHistoryHelpers unarchiveSecureProperties](NRDataFileHistoryHelpers, "unarchiveSecureProperties");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!v3)
        v3 = objc_opt_new();
      v4 = (id)v3;
      objc_msgSend(a1, "setSecureProperties:", v3);

    }
  }
}

- (void)dealloc
{
  int keyBagStatusChangedNotificationToken;
  objc_super v4;

  keyBagStatusChangedNotificationToken = self->_keyBagStatusChangedNotificationToken;
  if (keyBagStatusChangedNotificationToken != -1)
  {
    notify_cancel(keyBagStatusChangedNotificationToken);
    self->_keyBagStatusChangedNotificationToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NRRegistryHistoryStore;
  -[NRRegistryHistoryStore dealloc](&v4, sel_dealloc);
}

- (void)_notifyObserversSecurePropertiesAreAvailableWithCollection:(id)a3 secureProperties:(id)a4
{
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRRegistryHistoryStore;
  -[NRRegistry _notifyObserversSecurePropertiesAreAvailableWithCollection:secureProperties:](&v8, sel__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties_, a3, a4);
  -[NRRegistry secureProperties](self, "secureProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NRRegistry managementQueue](self, "managementQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__NRRegistryHistoryStore__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties___block_invoke;
    block[3] = &unk_1E4494FB8;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

void __102__NRRegistryHistoryStore__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88);
    if (v3 != -1)
    {
      notify_cancel(v3);
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = -1;
    }
  }
}

- (id)collection
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__NRRegistryHistoryStore_collection__block_invoke;
  v4[3] = &unk_1E4495A48;
  v4[4] = self;
  v4[5] = &v5;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __36__NRRegistryHistoryStore_collection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "deviceCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NRDeviceCollectionHistory)history
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__NRRegistryHistoryStore_history__block_invoke;
  v4[3] = &unk_1E4495A48;
  v4[4] = self;
  v4[5] = &v5;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NRDeviceCollectionHistory *)v2;
}

void __33__NRRegistryHistoryStore_history__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

void __37__NRRegistryHistoryStore_setHistory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__NRRegistryHistoryStore_setHistory___block_invoke_2;
  v4[3] = &unk_1E4496B30;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(v2, "addObserverQueue:withBlock:", 0, v4);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 96), *(id *)(a1 + 32));
}

void __37__NRRegistryHistoryStore_setHistory___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v2 = a1;
  v80 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 32), "secureProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(v2 + 32);
  v57 = v5;
  v8 = v6;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NRDataFilePaths pathToNanoRegistryStateDirectory](NRDataFilePaths, "pathToNanoRegistryStateDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[NRDataFilePaths pathToNanoRegistryStateDirectory](NRDataFilePaths, "pathToNanoRegistryStateDirectory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v14 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v61);
      v15 = v61;

      if ((v14 & 1) == 0)
      {
        nr_daemon_log();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

        if (v17)
        {
          nr_daemon_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            +[NRDataFilePaths pathToNanoRegistryStateDirectory](NRDataFilePaths, "pathToNanoRegistryStateDirectory");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "nr_safeDescription");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v77 = v52;
            v78 = 2114;
            v79 = v53;
            _os_log_error_impl(&dword_1A0BDB000, v18, OS_LOG_TYPE_ERROR, "Can't create path %{public}@! error=%{public}@", buf, 0x16u);

          }
        }
      }

    }
    objc_msgSend(v7, "history");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "dirty");

    objc_msgSend(v7, "secureProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v7, "secureProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = +[NRDataFileHistoryHelpers archiveSecureProperties:](NRDataFileHistoryHelpers, "archiveSecureProperties:", v22);

    }
    else
    {
      v23 = 1;
    }
    objc_msgSend(v7, "history");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23 & +[NRDataFileHistoryHelpers archiveDeviceHistory:](NRDataFileHistoryHelpers, "archiveDeviceHistory:", v24);

    if ((v25 & v20) == 1)
    {
      v54 = v8;
      v55 = v4;
      v56 = v2;
      v26 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v7, "secureProperties");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allSecurePropertyIDs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v7, "collection");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
      if (v60)
      {
        v59 = *(_QWORD *)v71;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v71 != v59)
              objc_enumerationMutation(obj);
            v31 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v30);
            v32 = v7;
            objc_msgSend(v7, "collection");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKeyedSubscript:", v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v35 = v34;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v67;
              do
              {
                v39 = 0;
                do
                {
                  if (*(_QWORD *)v67 != v38)
                    objc_enumerationMutation(v35);
                  objc_msgSend(v35, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v39));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "value");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v29, "removeObject:", v41);

                  ++v39;
                }
                while (v37 != v39);
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
              }
              while (v37);
            }

            ++v30;
            v7 = v32;
          }
          while (v30 != v60);
          v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
        }
        while (v60);
      }

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v42 = v29;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      v8 = v54;
      v4 = v55;
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v63;
        do
        {
          v46 = 0;
          do
          {
            if (*(_QWORD *)v63 != v45)
              objc_enumerationMutation(v42);
            v47 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v46);
            objc_msgSend(v7, "secureProperties");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "removeSecureProperty:", v47);

            ++v46;
          }
          while (v44 != v46);
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        }
        while (v44);
      }

      objc_msgSend(v7, "secureProperties");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[NRDataFileHistoryHelpers archiveSecureProperties:](NRDataFileHistoryHelpers, "archiveSecureProperties:", v49);

      v2 = v56;
    }
  }

  objc_msgSend(*(id *)(v2 + 32), "_notifyDiffIndexObserversWithHistoryEntry:deviceCollection:secureProperties:", v4, v57, v8);
  v50 = *(void **)(v2 + 32);
  objc_msgSend(v4, "diff");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "_notifyDiffObserversWithDiff:deviceCollection:secureProperties:", v51, v57, v8);
}

- (void)grabHistoryWithReadBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__NRRegistryHistoryStore_grabHistoryWithReadBlock___block_invoke;
  v6[3] = &unk_1E4494DE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry enqueue:](self, "enqueue:", v6);

}

void __51__NRRegistryHistoryStore_grabHistoryWithReadBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "history");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)grabHistoryWithWriteBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__4;
  v9[4] = __Block_byref_object_dispose__4;
  v10 = (id)os_transaction_create();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__NRRegistryHistoryStore_grabHistoryWithWriteBlock___block_invoke;
  v6[3] = &unk_1E44959D0;
  v5 = v4;
  v6[4] = self;
  v7 = v5;
  v8 = v9;
  -[NRRegistry enqueueAsync:](self, "enqueueAsync:", v6);

  _Block_object_dispose(v9, 8);
}

void __52__NRRegistryHistoryStore_grabHistoryWithWriteBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "history");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "history");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "applyDiff:", v9);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (id)addDiffIndexObserverWithWriteBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NRRegistryHistoryStore_addDiffIndexObserverWithWriteBlock___block_invoke;
  v8[3] = &unk_1E4495A20;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __61__NRRegistryHistoryStore_addDiffIndexObserverWithWriteBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend((id)objc_opt_class(), "_nextToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(a1[4] + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v7 = *(void **)(v6 + 80);
    *(_QWORD *)(v6 + 80) = v5;

  }
  v8 = (id)MEMORY[0x1A1B01DE4](a1[5]);
  objc_msgSend(*(id *)(a1[4] + 80), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

- (void)removeDiffIndexObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__NRRegistryHistoryStore_removeDiffIndexObserver___block_invoke;
  v6[3] = &unk_1E4495030;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v6);

}

uint64_t __50__NRRegistryHistoryStore_removeDiffIndexObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyDiffIndexObserversWithHistoryEntry:(id)a3 deviceCollection:(id)a4 secureProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __102__NRRegistryHistoryStore__notifyDiffIndexObserversWithHistoryEntry_deviceCollection_secureProperties___block_invoke;
  v22[3] = &unk_1E4495A48;
  v22[4] = self;
  v22[5] = &v23;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = (id)v24[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend((id)v24[5], "objectForKeyedSubscript:", v15, (_QWORD)v18);
        v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "diff");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, id, id, uint64_t, uint64_t))v16)[2](v16, v17, v9, v10, v15, objc_msgSend(v8, "index") + 1);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    }
    while (v12);
  }

  _Block_object_dispose(&v23, 8);
}

void __102__NRRegistryHistoryStore__notifyDiffIndexObserversWithHistoryEntry_deviceCollection_secureProperties___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)invalidate
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__NRRegistryHistoryStore_invalidate__block_invoke;
  v4[3] = &unk_1E4494FB8;
  v4[4] = self;
  -[NRRegistry enqueueBypassAsync:](self, "enqueueBypassAsync:", v4);
  v3.receiver = self;
  v3.super_class = (Class)NRRegistryHistoryStore;
  -[NRRegistry invalidate](&v3, sel_invalidate);
}

void __36__NRRegistryHistoryStore_invalidate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "history");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_diffIndexObservers, 0);
}

@end
