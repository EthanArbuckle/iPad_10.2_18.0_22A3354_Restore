@implementation _ATXAppInfoManager

- (id)appInfoForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v6;
}

- (id)_appInfoNoLockForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  -[_ATXDataStore appInfoForBundleId:](self->_dataStore, "appInfoForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)lastAppLaunch
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore lastLaunchedApp](self->_dataStore, "lastLaunchedApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)lastAppLaunchDate
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore lastLaunchDate](self->_dataStore, "lastLaunchDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

+ (_ATXAppInfoManager)sharedInstance
{
  if (sharedInstance__pasOnceToken6_28 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_28, &__block_literal_global_159);
  return (_ATXAppInfoManager *)(id)sharedInstance__pasExprOnceResult_37;
}

- (_ATXAppInfoManager)initWithInMemoryStore
{
  _ATXDataStore *v3;
  _ATXAppInfoManager *v4;

  v3 = -[_ATXDataStore initWithInMemoryDataStore]([_ATXDataStore alloc], "initWithInMemoryDataStore");
  v4 = -[_ATXAppInfoManager initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (_ATXAppInfoManager)initWithDataStore:(id)a3
{
  id v6;
  _ATXAppInfoManager *v7;
  _ATXAppInfoManager *v8;
  NSObject *v9;
  _ATXAppInfoManager *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppInfoManager.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataStore"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_ATXAppInfoManager;
  v7 = -[_ATXAppInfoManager init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataStore, a3);
    if (!v6)
    {
      v10 = 0;
      goto LABEL_10;
    }
    pthread_rwlock_init(&v8->_rwlock, 0);
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_ATXAppInfoManager initWithDataStore:].cold.1();

  }
  v10 = v8;
LABEL_10:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->_rwlock);
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppInfoManager;
  -[_ATXAppInfoManager dealloc](&v3, sel_dealloc);
}

- (id)lastLaunchDateForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;
  void *v7;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastLaunch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)averageSecondsBetweenLaunchesForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;
  void *v7;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "averageSecondsBetweenLaunches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)medianSecondsBetweenLaunchesForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;
  void *v7;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "medianSecondsBetweenLaunches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)genreIdForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;
  void *v7;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "genreId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)subGenreIdsForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subGenreIds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  pthread_rwlock_unlock(p_rwlock);
  return v8;
}

- (id)genreIdsForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "genreId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subGenreIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  pthread_rwlock_unlock(p_rwlock);
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)app2VecClusterForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;
  void *v7;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "app2VecCluster");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v7;
}

- (id)secondMostRecentAppLaunch
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore nthMostRecentAppLaunch:](self->_dataStore, "nthMostRecentAppLaunch:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)allActionKeys
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;
  void *v5;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore loadAppActionsFromAppActionInfo](self->_dataStore, "loadAppActionsFromAppActionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)totalSlotsInDatastore
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore totalSlotsInDatastore](self->_dataStore, "totalSlotsInDatastore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)lastAppActionLaunch
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;
  void *v5;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore loadAppActionInfo](self->_dataStore, "loadAppActionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);

  return v5;
}

- (id)lastAppActionLaunchDate
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;
  void *v5;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore loadAppActionInfo](self->_dataStore, "loadAppActionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);

  return v5;
}

- (id)lastAppActionLaunchDateForActionKey:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXDataStore lastAppActionLaunchDateForAppAction:](self->_dataStore, "lastAppActionLaunchDateForAppAction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v6;
}

- (id)averageSecondsBetweenAppActionsForActionKey:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXDataStore averageSecondsBetweenAppActionsForAppAction:](self->_dataStore, "averageSecondsBetweenAppActionsForAppAction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v6;
}

- (id)medianSecondsBetweenAppActionsForActionKey:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;
  void *v6;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_rdlock(p_rwlock);
  -[_ATXDataStore medianSecondsBetweenAppActionsForAppAction:](self->_dataStore, "medianSecondsBetweenAppActionsForAppAction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v6;
}

- (id)lastUnlockDate
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;
  void *v5;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore appInfoForBundleId:](self->_dataStore, "appInfoForBundleId:", CFSTR("com.apple.DEC.AppPredictionInternal.backlightActivated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastLaunch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_rwlock);
  return v5;
}

- (int64_t)launchedAppCount
{
  _opaque_pthread_rwlock_t *p_rwlock;
  int64_t v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  v4 = -[_ATXDataStore launchedAppCount](self->_dataStore, "launchedAppCount");
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)allApps
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore allApps](self->_dataStore, "allApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)allAppsWithInstallDate
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore allAppsWithInstallDate](self->_dataStore, "allAppsWithInstallDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (id)allAppsLaunchedOrInstalledWithin30Days
{
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v4;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  -[_ATXDataStore allAppsLaunchedOrInstalledWithin30Days](self->_dataStore, "allAppsLaunchedOrInstalledWithin30Days");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (void)updateGenreIdsForBundleId:(id)a3 genreId:(id)a4 subGenreIds:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  v10 = pthread_rwlock_wrlock(&self->_rwlock);
  v11 = (void *)MEMORY[0x1CAA48B6C](v10);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "genreId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v14))
    {
      objc_msgSend(v13, "subGenreIds");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9;
      v17 = v15;
      if (v17 == v16)
      {

LABEL_13:
        objc_autoreleasePoolPop(v11);
        pthread_rwlock_unlock(&self->_rwlock);
        goto LABEL_14;
      }
      v18 = v17;
      if (v16 && v17)
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v16);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v18);
        v20 = objc_msgSend(v21, "isEqualToSet:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_13;
        goto LABEL_12;
      }

    }
LABEL_12:
    objc_msgSend(v13, "setGenreId:", v8);
    objc_msgSend(v13, "setSubGenreIds:", v9);
    -[_ATXDataStore writeGenreId:subGenreIds:forBundleId:](self->_dataStore, "writeGenreId:subGenreIds:forBundleId:", v8, v9, v22);
    goto LABEL_13;
  }
  pthread_rwlock_unlock(&self->_rwlock);
  objc_autoreleasePoolPop(v11);
LABEL_14:

}

- (void)updateApp2VecClusterForBundleId:(id)a3 app2VecCluster:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  v6 = a4;
  pthread_rwlock_wrlock(&self->_rwlock);
  -[_ATXAppInfoManager _appInfoNoLockForBundleId:](self, "_appInfoNoLockForBundleId:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "app2VecCluster");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v8, "setApp2VecCluster:", v6);
      -[_ATXDataStore writeApp2VecCluster:forBundleId:](self->_dataStore, "writeApp2VecCluster:forBundleId:", v6, v11);
    }
  }
  pthread_rwlock_unlock(&self->_rwlock);

}

- (void)addInstallForBundleId:(id)a3 date:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXAppInfoManager addInstallForBundleInfoMap:](self, "addInstallForBundleInfoMap:", v9);
}

- (void)addInstallForBundleInfoMap:(id)a3
{
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *installDeltaLog;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(obj, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_app_install();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v29 = v8;
          v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXAppInfoManager: Adding install date %{public}@ for bundleId %@", buf, 0x16u);
        }

        +[ATXLaunchServicesHelper getGenreIdsForBundleId:](ATXLaunchServicesHelper, "getGenreIdsForBundleId:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "first");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = &unk_1E83CD6C0;
        if (v11)
          v13 = (void *)v11;
        v14 = v13;

        objc_msgSend(v10, "second");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXApp2VecClustering sharedInstance](ATXApp2VecClustering, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "getClosestClusterCentroidForBundleId:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[_ATXDataStore addAppInstallForBundleId:date:genreId:subGenreIds:app2VecCluster:](self->_dataStore, "addAppInstallForBundleId:date:genreId:subGenreIds:app2VecCluster:", v6, v8, v14, v15, v17);
        installDeltaLog = self->_installDeltaLog;
        if (installDeltaLog)
        {
          v27[0] = v6;
          v27[1] = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](installDeltaLog, "addObject:", v19);

        }
        objc_autoreleasePoolPop(v7);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v21);
  }

  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)addExtensionLaunchForBundleId:(id)a3 date:(id)a4
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v7;
  id v8;

  p_rwlock = &self->_rwlock;
  v7 = a4;
  v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore addExtensionLaunchForBundleId:date:](self->_dataStore, "addExtensionLaunchForBundleId:date:", v8, v7);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addLaunchForBundleId:(id)a3 date:(id)a4
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v7;
  id v8;

  p_rwlock = &self->_rwlock;
  v7 = a4;
  v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore addAppLaunchForBundleId:date:withLaunchType:](self->_dataStore, "addAppLaunchForBundleId:date:withLaunchType:", v8, v7, 0);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addLaunchForAppAction:(id)a3 date:(id)a4
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v7;
  id v8;

  p_rwlock = &self->_rwlock;
  v7 = a4;
  v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore addAppActionLaunchForAppAction:date:](self->_dataStore, "addAppActionLaunchForAppAction:date:", v8, v7);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addSpotlightLaunchForBundleId:(id)a3 date:(id)a4
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v7;
  id v8;

  p_rwlock = &self->_rwlock;
  v7 = a4;
  v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore addAppLaunchForBundleId:date:withLaunchType:](self->_dataStore, "addAppLaunchForBundleId:date:withLaunchType:", v8, v7, 1);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addAverageSecondsBetweenLaunchesForBundleId:(id)a3 average:(id)a4
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v7;
  id v8;

  p_rwlock = &self->_rwlock;
  v7 = a4;
  v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore writeAverageSecondsBetweenLaunches:forBundleId:](self->_dataStore, "writeAverageSecondsBetweenLaunches:forBundleId:", v7, v8);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addMedianSecondsBetweenLaunchesForBundleId:(id)a3 median:(id)a4
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v7;
  id v8;

  p_rwlock = &self->_rwlock;
  v7 = a4;
  v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore writeMedianSecondsBetweenLaunches:forBundleId:](self->_dataStore, "writeMedianSecondsBetweenLaunches:forBundleId:", v7, v8);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addAverageSecondsBetweenAppActionsForActionKey:(id)a3 average:(id)a4
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v7;
  id v8;

  p_rwlock = &self->_rwlock;
  v7 = a4;
  v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore writeAverageSecondsBetweenAppActions:forAppAction:](self->_dataStore, "writeAverageSecondsBetweenAppActions:forAppAction:", v7, v8);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addMedianSecondsBetweenAppActionsForActionKey:(id)a3 median:(id)a4
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v7;
  id v8;

  p_rwlock = &self->_rwlock;
  v7 = a4;
  v8 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore writeMedianSecondsBetweenAppActions:forAppAction:](self->_dataStore, "writeMedianSecondsBetweenAppActions:forAppAction:", v7, v8);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)addScreenLockAtDate:(id)a3
{
  if (a3)
    -[_ATXAppInfoManager addLaunchForBundleId:date:](self, "addLaunchForBundleId:date:", CFSTR("com.apple.DEC.AppPredictionInternal.backlightActivated"), a3);
}

- (void)removeAppInfoForBundleId:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXAppInfoManager removeAppInfoForBundleIds:](self, "removeAppInfoForBundleIds:", v4);

}

- (void)removeAppInfoForBundleIds:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        __atxlog_handle_deletions();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "_ATXAppInfoManager: Uninstall occurred for %@ - Deleting appInfo and action data related to it.", buf, 0xCu);
        }

        -[_ATXDataStore removeAppInfoForBundleId:](self->_dataStore, "removeAppInfoForBundleId:", v10);
        -[_ATXDataStore removeActionDataForBundleId:](self->_dataStore, "removeActionDataForBundleId:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)removeAppLaunchesForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore removeAppLaunchesForBundleId:](self->_dataStore, "removeAppLaunchesForBundleId:", v5);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)removeActionDataForBundleId:(id)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  id v5;

  p_rwlock = &self->_rwlock;
  v5 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  -[_ATXDataStore removeActionDataForBundleId:](self->_dataStore, "removeActionDataForBundleId:", v5);

  pthread_rwlock_unlock(p_rwlock);
}

- (void)clearAppLaunchInfo
{
  _opaque_pthread_rwlock_t *p_rwlock;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  -[_ATXDataStore clearAppLaunchInfo](self->_dataStore, "clearAppLaunchInfo");
  pthread_rwlock_unlock(p_rwlock);
}

- (void)clearAppInstallInfo
{
  _opaque_pthread_rwlock_t *p_rwlock;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  -[_ATXDataStore clearAppInstallInfo](self->_dataStore, "clearAppInstallInfo");
  pthread_rwlock_unlock(p_rwlock);
}

- (void)startInstallDeltaRecording
{
  _opaque_pthread_rwlock_t *p_rwlock;
  NSMutableArray *v4;
  NSMutableArray *installDeltaLog;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  v4 = (NSMutableArray *)objc_opt_new();
  installDeltaLog = self->_installDeltaLog;
  self->_installDeltaLog = v4;

  pthread_rwlock_unlock(p_rwlock);
}

- (id)stopInstallDeltaRecording
{
  _opaque_pthread_rwlock_t *p_rwlock;
  NSMutableArray *v4;
  NSMutableArray *installDeltaLog;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  v4 = self->_installDeltaLog;
  installDeltaLog = self->_installDeltaLog;
  self->_installDeltaLog = 0;

  pthread_rwlock_unlock(p_rwlock);
  return v4;
}

- (void)train
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "_ATXAppInfoManager: Updating GenreIds for all apps.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)removeUninstalledApps
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[_ATXDataStore removeAppInfoForBundleIdsNotInSet:](self->_dataStore, "removeAppInfoForBundleIdsNotInSet:", v3);

}

+ (id)sortArrayAndComputeMedian:(id)a3
{
  id v3;
  int v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
    v4 = objc_msgSend(v3, "count");
    if (v4 >= 0)
      v5 = v4;
    else
      v5 = v4 + 1;
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "objectAtIndexedSubscript:", (uint64_t)v5 >> 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v7, "doubleValue");
      v10 = v9;
      objc_msgSend(v3, "objectAtIndexedSubscript:", (v5 >> 1) - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = (v10 + v12) * 0.5;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)computeAverageAndMedianSecondsBetweenAppLaunches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__70;
  v18[4] = __Block_byref_object_dispose__70;
  v19 = 0;
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "App");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "InFocus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v3, v8, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke_37;
  v15 = &unk_1E82DC7D0;
  v10 = v4;
  v16 = v10;
  v17 = v18;
  v11 = (id)objc_msgSend(v9, "sinkWithCompletion:shouldContinue:", &__block_literal_global_36_2, &v12);

  -[_ATXAppInfoManager appLaunchesCalculations:](self, "appLaunchesCalculations:", v10, v12, v13, v14, v15);
  _Block_object_dispose(v18, 8);

}

- (void)appLaunchesCalculations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  id v41;
  id v42;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v3;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v44)
  {
    v41 = *(id *)v51;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(id *)v51 != v41)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v8, "bundleId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, v10);
        objc_msgSend(v8, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v15);
        v17 = v16;

        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectForKeyedSubscript:", v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        objc_msgSend(v20, "numberWithDouble:", v17 + v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, v10);

        objc_msgSend(v8, "endDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, v10);

        objc_autoreleasePoolPop(v9);
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v44);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[_ATXAppInfoManager allApps](self, "allApps");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v25)
  {
    v26 = v25;
    v45 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v47 != v45)
          objc_enumerationMutation(v42);
        v28 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v6, "objectForKeyedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v33 = v32;
          objc_msgSend(v4, "objectForKeyedSubscript:", v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v33 / (double)(unint64_t)objc_msgSend(v34, "count");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXAppInfoManager addAverageSecondsBetweenLaunchesForBundleId:average:](self, "addAverageSecondsBetweenLaunchesForBundleId:average:", v28, v36);

          objc_msgSend(v4, "objectForKeyedSubscript:", v28);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ATXAppInfoManager sortArrayAndComputeMedian:](_ATXAppInfoManager, "sortArrayAndComputeMedian:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXAppInfoManager addMedianSecondsBetweenLaunchesForBundleId:median:](self, "addMedianSecondsBetweenLaunchesForBundleId:median:", v28, v38);

        }
        else
        {
          -[_ATXAppInfoManager addAverageSecondsBetweenLaunchesForBundleId:average:](self, "addAverageSecondsBetweenLaunchesForBundleId:average:", v28, 0);
          -[_ATXAppInfoManager addMedianSecondsBetweenLaunchesForBundleId:median:](self, "addMedianSecondsBetweenLaunchesForBundleId:median:", v28, 0);
        }
        objc_autoreleasePoolPop(v29);
      }
      v26 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v26);
  }

}

- (void)computeAverageAndMedianSecondsBetweenAppActions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x1E0CF8EE0]);
  objc_msgSend(v4, "getIntentEventsBetweenStartDate:endDate:forSource:", v14, v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0CF9198]);
  objc_msgSend(v6, "getActivityIntentEventsBetweenStartDate:endDate:", v14, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  v9 = v5;
  v10 = v9;
  if (v9)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (v11)
  {
    if (v8)
      v12 = v8;
    else
      v12 = v9;
  }
  else
  {
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[_ATXAppInfoManager computeAverageAndMedianSecondsBetweenAppActions:](self, "computeAverageAndMedianSecondsBetweenAppActions:", v13);
}

- (void)computeAverageAndMedianSecondsBetweenAppActions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  id v47;
  id v48;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v3;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v50)
  {
    v47 = *(id *)v57;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(id *)v57 != v47)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1CAA48B6C]();
        v10 = (void *)MEMORY[0x1E0CF8C20];
        objc_msgSend(v8, "bundleId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "intentType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "getActionKeyForBundleId:actionType:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, v13);
        objc_msgSend(v8, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", v18);
        v20 = v19;

        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v22);

        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        objc_msgSend(v23, "numberWithDouble:", v20 + v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v13);

        objc_msgSend(v8, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, v13);

        objc_autoreleasePoolPop(v9);
      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v50);
  }

  -[_ATXAppInfoManager allActionKeys](self, "allActionKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setByAddingObjectsFromArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v48 = v30;
  v31 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v31)
  {
    v32 = v31;
    v51 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v53 != v51)
          objc_enumerationMutation(v48);
        v34 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
        v35 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v6, "objectForKeyedSubscript:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "doubleValue");
          v39 = v38;
          objc_msgSend(v4, "objectForKeyedSubscript:", v34);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v39 / (double)(unint64_t)objc_msgSend(v40, "count");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXAppInfoManager addAverageSecondsBetweenAppActionsForActionKey:average:](self, "addAverageSecondsBetweenAppActionsForActionKey:average:", v34, v42);

          objc_msgSend(v4, "objectForKeyedSubscript:", v34);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ATXAppInfoManager sortArrayAndComputeMedian:](_ATXAppInfoManager, "sortArrayAndComputeMedian:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXAppInfoManager addMedianSecondsBetweenAppActionsForActionKey:median:](self, "addMedianSecondsBetweenAppActionsForActionKey:median:", v34, v44);

        }
        else
        {
          -[_ATXAppInfoManager addAverageSecondsBetweenLaunchesForBundleId:average:](self, "addAverageSecondsBetweenLaunchesForBundleId:average:", v34, 0);
          -[_ATXAppInfoManager addMedianSecondsBetweenLaunchesForBundleId:median:](self, "addMedianSecondsBetweenLaunchesForBundleId:median:", v34, 0);
        }
        objc_autoreleasePoolPop(v35);
      }
      v32 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v32);
  }

}

- (void)updateGenreIdsForAllApps
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[_ATXAppInfoManager allApps](self, "allApps");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1CAA48B6C]();
        +[ATXLaunchServicesHelper getGenreIdsForBundleId:](ATXLaunchServicesHelper, "getGenreIdsForBundleId:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "first");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (void *)v10;
        else
          v12 = &unk_1E83CD6C0;
        objc_msgSend(v9, "second");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = v13;
        else
          v15 = MEMORY[0x1E0C9AA60];
        -[_ATXAppInfoManager updateGenreIdsForBundleId:genreId:subGenreIds:](self, "updateGenreIdsForBundleId:genreId:subGenreIds:", v7, v12, v15);

        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

- (void)updateApp2VecClustersForAllApps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[_ATXAppInfoManager allApps](self, "allApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "mutableCopy");

  +[ATXApp2VecClustering sharedInstance](ATXApp2VecClustering, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getClusterCentroidsForBundleIds:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)MEMORY[0x1CAA48B6C]();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ATXAppInfoManager updateApp2VecClusterForBundleId:app2VecCluster:](self, "updateApp2VecClusterForBundleId:app2VecCluster:", v9, v10);

      objc_autoreleasePoolPop(v8);
      ++v7;
    }
    while (objc_msgSend(v11, "count") > v7);
  }

}

- (void)removeBundleIds:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[_ATXAppInfoManager removeAppLaunchesForBundleId:](self, "removeAppLaunchesForBundleId:", v9);
        -[_ATXAppInfoManager removeActionDataForBundleId:](self, "removeActionDataForBundleId:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installDeltaLog, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

- (void)initWithDataStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "_ATXAppInfoManager initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
