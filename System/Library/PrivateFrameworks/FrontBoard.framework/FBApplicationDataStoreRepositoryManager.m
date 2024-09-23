@implementation FBApplicationDataStoreRepositoryManager

- (void)objectChangedForKeys:(id)a3 application:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1A8590A90]();
        -[FBApplicationDataStoreRepository objectForKey:forApplication:](self->_dataStore, "objectForKey:forApplication:", v14, v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = CFSTR("FBApplicationStoreRepositoryChangeKey");
        v24[1] = CFSTR("FBApplicationStoreRepositoryChangeApp");
        v25[0] = v14;
        v25[1] = v8;
        v17 = v16;
        v24[2] = CFSTR("FBApplicationStoreRepositoryChangeValue");
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v4;
        }
        v25[2] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("FBApplicationStoreRepositoryChangeNotification"), 0, v18);

        if (!v16)
        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v11);
  }

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FBApplicationDataStoreRepositoryManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, block);
  return (id)sharedInstance_sharedInstance;
}

void __57__FBApplicationDataStoreRepositoryManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (FBApplicationDataStoreRepositoryManager)init
{
  return (FBApplicationDataStoreRepositoryManager *)-[FBApplicationDataStoreRepositoryManager _initWithDataStore:lsEnumerator:](self, "_initWithDataStore:lsEnumerator:", 0, 0);
}

- (id)_initWithDataStore:(id)a3 lsEnumerator:(id)a4
{
  id v6;
  id v7;
  FBApplicationDataStoreRepositoryManager *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSURL *dataStoreURL;
  __CFNotificationCenter *DistributedCenter;
  FBSqliteApplicationDataStoreRepository *v14;
  FBApplicationDataStoreRepository *dataStore;
  uint64_t Serial;
  OS_dispatch_queue *deferredWorkQueue;
  NSObject *v18;
  _QWORD block[4];
  FBApplicationDataStoreRepositoryManager *v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FBApplicationDataStoreRepositoryManager;
  v8 = -[FBApplicationDataStoreRepositoryManager init](&v22, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(CFSTR("~/Library/FrontBoard/applicationState.db"), "stringByExpandingTildeInPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    dataStoreURL = v8->_dataStoreURL;
    v8->_dataStoreURL = (NSURL *)v11;

    objc_storeStrong((id *)&v8->_lsEnumerator, a4);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v8, (CFNotificationCallback)_handleApplicationsRegisteredNotification, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[FBApplicationDataStoreRepositoryManager migrateApplicationStorePathIfNecessary](v8, "migrateApplicationStorePathIfNecessary");
    if (v6)
      v14 = (FBSqliteApplicationDataStoreRepository *)v6;
    else
      v14 = -[FBSqliteApplicationDataStoreRepository initWithStorePath:]([FBSqliteApplicationDataStoreRepository alloc], "initWithStorePath:", v8->_dataStoreURL);
    dataStore = v8->_dataStore;
    v8->_dataStore = (FBApplicationDataStoreRepository *)v14;

    -[FBApplicationDataStoreRepository setDelegate:](v8->_dataStore, "setDelegate:", v8);
    Serial = BSDispatchQueueCreateSerial();
    deferredWorkQueue = v8->_deferredWorkQueue;
    v8->_deferredWorkQueue = (OS_dispatch_queue *)Serial;

    v18 = v8->_deferredWorkQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__FBApplicationDataStoreRepositoryManager__initWithDataStore_lsEnumerator___block_invoke;
    block[3] = &unk_1E4A12348;
    v21 = v8;
    dispatch_async(v18, block);

  }
  return v8;
}

uint64_t __75__FBApplicationDataStoreRepositoryManager__initWithDataStore_lsEnumerator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearExpiredUninstalledApplicationsFromStoreIfNecessary");
}

- (void)dealloc
{
  objc_super v3;

  -[FBApplicationDataStoreRepository flushSynchronously](self->_dataStore, "flushSynchronously");
  -[FBApplicationDataStoreRepository close](self->_dataStore, "close");
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationDataStoreRepositoryManager;
  -[FBApplicationDataStoreRepositoryManager dealloc](&v3, sel_dealloc);
}

- (id)urlByAppendingString:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)removeStoreAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "removeItemAtURL:error:", self->_dataStoreURL, a4))
  {
    -[FBApplicationDataStoreRepositoryManager urlByAppendingString:toURL:](self, "urlByAppendingString:toURL:", CFSTR("-shm"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "fileExistsAtPath:", v9);

    if (v10 && !objc_msgSend(v7, "removeItemAtURL:error:", v8, a4))
    {
      v14 = 0;
    }
    else
    {
      -[FBApplicationDataStoreRepositoryManager urlByAppendingString:toURL:](self, "urlByAppendingString:toURL:", CFSTR("-wal"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "fileExistsAtPath:", v12);

      v14 = !v13 || objc_msgSend(v7, "removeItemAtURL:error:", v11, a4);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)migrateApplicationStorePathIfNecessary
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  NSURL *dataStoreURL;
  BOOL v27;
  id v28;
  NSObject *v29;
  NSURL *v30;
  _BOOL4 v31;
  id v32;
  NSObject *v33;
  NSURL *v34;
  NSURL *v35;
  NSObject *v36;
  NSURL *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  int v45;
  __int128 v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  NSURL *v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  _QWORD v66[6];

  v66[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  -[NSURL path](self->_dataStoreURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  v47 = v5;
  if ((v5 & 1) == 0)
  {
    -[NSURL URLByDeletingLastPathComponent](self->_dataStoreURL, "URLByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  }
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("~/Library/FrontBoard/applicationState.plist"), "stringByExpandingTildeInPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v9;
  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("~/Library/BackBoard/applicationState.plist"), "stringByExpandingTildeInPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v12;
  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("~/Library/SpringBoard/applicationstate.plist"), "stringByExpandingTildeInPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v55;
    *(_QWORD *)&v19 = 138543874;
    v46 = v19;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v23, "path", v46);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v3, "fileExistsAtPath:", v24);

        if (v25)
        {
          if (v47)
          {
            dataStoreURL = self->_dataStoreURL;
            v53 = 0;
            v27 = -[FBApplicationDataStoreRepositoryManager removeStoreAtURL:error:](self, "removeStoreAtURL:error:", dataStoreURL, &v53);
            v28 = v53;
            if (!v27)
            {
              FBLogAppDataStore();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v35 = self->_dataStoreURL;
                *(_DWORD *)buf = v46;
                v60 = v23;
                v61 = 2114;
                v62 = v35;
                v63 = 2114;
                v64 = v28;
                _os_log_error_impl(&dword_1A359A000, v29, OS_LOG_TYPE_ERROR, "Unable to migrate application state store from %{public}@ to %{public}@ due to error: %{public}@", buf, 0x20u);
              }

            }
          }
          else
          {
            v28 = 0;
          }
          v30 = self->_dataStoreURL;
          v52 = v28;
          v31 = -[FBApplicationDataStoreRepositoryManager migrateFromPlistStoreAtURL:toSqliteStoreAtURL:error:](self, "migrateFromPlistStoreAtURL:toSqliteStoreAtURL:error:", v23, v30, &v52);
          v32 = v52;

          if (v31)
          {
            FBLogAppDataStore();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = self->_dataStoreURL;
              *(_DWORD *)buf = 138543618;
              v60 = v23;
              v61 = 2114;
              v62 = v37;
              _os_log_impl(&dword_1A359A000, v36, OS_LOG_TYPE_INFO, "Successfully migrated application state store from %{public}@ to %{public}@.", buf, 0x16u);
            }

            goto LABEL_27;
          }
          if (v32)
          {
            FBLogAppDataStore();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = self->_dataStoreURL;
              *(_DWORD *)buf = v46;
              v60 = v23;
              v61 = 2114;
              v62 = v34;
              v63 = 2114;
              v64 = v32;
              _os_log_error_impl(&dword_1A359A000, v33, OS_LOG_TYPE_ERROR, "Unable to migrate application state store from %{public}@ to %{public}@ due to error: %{public}@", buf, 0x20u);
            }

          }
        }
      }
      v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_27:

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v17);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v43, "path");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v3, "fileExistsAtPath:", v44);

        if (v45)
          objc_msgSend(v3, "removeItemAtURL:error:", v43, 0);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v40);
  }

}

- (BOOL)migrateFromApplicationStore:(id)a3 toApplicationStore:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t j;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  uint64_t v20;
  void *v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "beginBatchedUpdate");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v7, "applicationIdentifiersWithState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "removeAllObjectsForApplication:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v6, "applicationIdentifiersWithState");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v6, "keysForApplication:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k);
              objc_msgSend(v6, "objectForKey:forApplication:", v20, v14);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend(v7, "setObject:forKey:forApplication:", v21, v20, v14);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          }
          while (v17);
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v25);
  }

  objc_msgSend(v7, "endBatchedUpdate");
  objc_msgSend(v7, "flushSynchronously");

  return 1;
}

- (BOOL)migrateFromPlistStoreAtURL:(id)a3 toSqliteStoreAtURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  FBPlistApplicationDataStoreRepository *v10;
  FBSqliteApplicationDataStoreRepository *v11;
  BOOL v12;
  BOOL v13;

  v8 = a4;
  v9 = a3;
  v10 = -[FBPlistApplicationDataStoreRepository initWithStorePath:]([FBPlistApplicationDataStoreRepository alloc], "initWithStorePath:", v9);

  v11 = -[FBSqliteApplicationDataStoreRepository initWithStorePath:]([FBSqliteApplicationDataStoreRepository alloc], "initWithStorePath:", v8);
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  v13 = !v12
     && -[FBApplicationDataStoreRepositoryManager migrateFromApplicationStore:toApplicationStore:error:](self, "migrateFromApplicationStore:toApplicationStore:error:", v10, v11, a5);

  return v13;
}

- (void)clearExpiredUninstalledApplicationsFromStoreIfNecessary
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A359A000, log, OS_LOG_TYPE_ERROR, "LSEnumerator returned zero apps", v1, 2u);
}

uint64_t __98__FBApplicationDataStoreRepositoryManager_clearExpiredUninstalledApplicationsFromStoreIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearExpiredUninstalledApplicationsFromStoreIfNecessary");
}

uint64_t __98__FBApplicationDataStoreRepositoryManager_clearExpiredUninstalledApplicationsFromStoreIfNecessary__block_invoke_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearExpiredUninstalledApplicationsFromStoreIfNecessary");
}

- (id)_safeObjectForKey:(id)a3 forApplication:(id)a4 ofType:(Class)a5
{
  void *v5;
  id v6;

  -[FBApplicationDataStoreRepository objectForKey:forApplication:](self->_dataStore, "objectForKey:forApplication:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)_handleApplicationInstalled:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        -[FBApplicationDataStoreRepository removeObjectForKey:forApplication:](self->_dataStore, "removeObjectForKey:forApplication:", CFSTR("__UninstallDate"), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[FBApplicationDataStoreRepository applicationIdentifiersWithState](self->_dataStore, "applicationIdentifiersWithState", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        objc_msgSend(v14, "fbs_bundleIDFromAppID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v15))
          -[FBApplicationDataStoreRepository removeObjectForKey:forApplication:](self->_dataStore, "removeObjectForKey:forApplication:", CFSTR("__UninstallDate"), v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

}

- (void)_performAfterDeferredWork:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_deferredWorkQueue, a3);
}

- (void)storeInvalidatedForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("FBApplicationStoreRepositoryChangeApp");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("FBApplicationStoreRepositoryInvalidatedNotification"), 0, v6);
}

- (FBApplicationDataStoreRepository)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredWorkQueue, 0);
  objc_storeStrong((id *)&self->_lsEnumerator, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_dataStoreURL, 0);
}

@end
