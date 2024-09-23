@implementation ATRestoreManager

- (ATRestoreManager)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  ATRestoreAssetLink *v5;
  void *v6;
  ATRestoreAssetLink *v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  dispatch_queue_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ATRestoreManager;
  v2 = -[ATRestoreManager init](&v18, sel_init);
  if (v2)
  {
    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v3;

    v5 = objc_alloc_init(ATRestoreAssetLink);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = objc_alloc_init(ATRestoreAssetLink);
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v7;

    *(_WORD *)(v2 + 49) = 0;
    v2[51] = 0;
    v9 = dispatch_queue_create("com.apple.amp.AirTraffic.ATRestoreManager.queue", 0);
    v10 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v9;

    v11 = dispatch_queue_create("com.apple.amp.AirTraffic.ATRestoreManager.callBackQueue", MEMORY[0x1E0C80D50]);
    v12 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v11;

    v13 = dispatch_queue_create("com.apple.amp.AirTraffic.ATRestoreManager.checkRestoreStatusQueue", 0);
    v14 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D130]), "initWithName:", CFSTR("com.apple.atc.restore"));
    v16 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v15;

  }
  return (ATRestoreManager *)v2;
}

- (void)restoreSessionActiveWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__ATRestoreManager_restoreSessionActiveWithCompletion___block_invoke;
  v6[3] = &unk_1E927D348;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ATRestoreManager _checkActiveRestoreStateWithCompletion:](self, "_checkActiveRestoreStateWithCompletion:", v6);

}

- (void)resume
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __26__ATRestoreManager_resume__block_invoke;
  v2[3] = &unk_1E927D248;
  v2[4] = self;
  -[ATRestoreManager restoreSessionActiveWithCompletion:](self, "restoreSessionActiveWithCompletion:", v2);
}

- (BOOL)hasProperNetworkConditions
{
  return -[ATRestoreAssetLink hasProperNetworkConditions](self->_restoreLink, "hasProperNetworkConditions");
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ATRestoreManager_environmentMonitorDidChangeNetworkReachability___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)sessionDidFinish:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATRestoreManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ATRestoreManager_sessionDidFinish___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)restoreAssetLinkDidCancelRestore:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ATRestoreManager_restoreAssetLinkDidCancelRestore___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)restoreAssetLinkNetworkPolicyDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATRestoreManager environmentMonitorDidChangeNetworkReachability:](self, "environmentMonitorDidChangeNetworkReachability:", v4);

}

- (id)_dataClasses
{
  if (_dataClasses_onceToken != -1)
    dispatch_once(&_dataClasses_onceToken, &__block_literal_global_30);
  return (id)objc_msgSend((id)_dataClasses_dataClassesArray, "copy");
}

- (void)_start
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t i;
  uint64_t v11;
  ATAssetSessionTask *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  ATSession *restoreSession;
  void *v18;
  ATRestoreManager *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  ATRestoreManager *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((-[MSVXPCTransaction isActive](self->_xpcTransaction, "isActive") & 1) == 0)
    -[MSVXPCTransaction beginTransaction](self->_xpcTransaction, "beginTransaction");
  v3 = -[ATDeviceSettings activeRestoreType](self->_settings, "activeRestoreType");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = self;
  -[ATRestoreManager _dataClasses](self, "_dataClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = v3 & 0xFFFFFFFE;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v9 == 2
          && objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isEqualToString:", CFSTR("Photo"))
          && -[ATRestoreManager _iCloudPhotoLibraryEnabled](v19, "_iCloudPhotoLibraryEnabled"))
        {
          _ATLogCategoryRestore();
          v12 = (ATAssetSessionTask *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v25 = v19;
            _os_log_impl(&dword_1D1868000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping photos restore from iTunes because iCPL is enabled", buf, 0xCu);
          }
        }
        else
        {
          v12 = -[ATAssetSessionTask initWithDataClass:]([ATAssetSessionTask alloc], "initWithDataClass:", v11);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ restore"), v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATSessionTask setLocalizedDescription:](v12, "setLocalizedDescription:", v13);

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(isRestore = YES) AND NOT (dataclass = %@)"), CFSTR("Media"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATAssetSessionTask setFilterPredicate:](v12, "setFilterPredicate:", v14);

          -[ATAssetSessionTask setRetryUntilFinished:](v12, "setRetryUntilFinished:", 1);
          -[ATAssetSessionTask setShouldRetryAssetBlock:](v12, "setShouldRetryAssetBlock:", &__block_literal_global_41);
          objc_msgSend(v4, "addObject:", v12);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }

  -[ATRestoreManager setRestoreInProgress:](v19, "setRestoreInProgress:", 1);
  v15 = objc_alloc(MEMORY[0x1E0CF76B0]);
  v16 = objc_msgSend(v15, "initWithSessionTypeIdentifier:", *MEMORY[0x1E0CF7658]);
  restoreSession = v19->_restoreSession;
  v19->_restoreSession = (ATSession *)v16;

  -[ATSession addSessionTasks:](v19->_restoreSession, "addSessionTasks:", v4);
  -[ATSession addObserver:](v19->_restoreSession, "addObserver:", v19);
  objc_msgSend(MEMORY[0x1E0CF2220], "sharedSessionServer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSession:", v19->_restoreSession);

  -[ATSession start](v19->_restoreSession, "start");
}

- (void)setRestoreInProgress:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  ATRestoreManager *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryRestore();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying restore progress: %d", (uint8_t *)&v9, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/restore/inProgress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

- (BOOL)_iCloudPhotoLibraryEnabled
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__ATRestoreManager__iCloudPhotoLibraryEnabled__block_invoke;
  v6[3] = &unk_1E927D2D0;
  v8 = &v9;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "ic_primaryAppleAccountWithCompletion:", v6);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

- (void)_checkActiveRestoreStateWithCompletion:(id)a3
{
  id v4;
  NSObject *checkRestoreStatusQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  checkRestoreStatusQueue = self->_checkRestoreStatusQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke;
  v7[3] = &unk_1E927D348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(checkRestoreStatusQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreSession, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
  objc_storeStrong((id *)&self->_checkRestoreStatusQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationDataRestoreLink, 0);
  objc_storeStrong((id *)&self->_restoreLink, 0);
}

uint64_t __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_semaphore_t v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v21;
  uint64_t v22;
  uint64_t result;
  _QWORD block[5];
  NSObject *v25;
  _BYTE *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "activeRestoreType") == 2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "activeRestoreType") == 3;
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 49) && !*(_BYTE *)(v2 + 51))
  {
    v3 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    *(_QWORD *)v38 = 0;
    *(_QWORD *)&v38[8] = v38;
    *(_QWORD *)&v38[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__2228;
    v40 = __Block_byref_object_dispose__2229;
    v41 = 0;
    v4 = MEMORY[0x1E0C809B0];
    do
    {
      _ATLogCategoryRestore();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD *)(v6 + 8);
        *(_DWORD *)buf = 138543874;
        v33 = v6;
        v34 = 2048;
        v35 = v3;
        v36 = 2114;
        v37 = v7;
        _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ start checking if iCloudRestore is active in %llu (seconds), restoreLink %{public}@", buf, 0x20u);
      }

      v8 = dispatch_semaphore_create(0);
      v9 = dispatch_time(0, 1000000000 * v3);
      dispatch_get_global_queue(0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke_51;
      block[3] = &unk_1E927D320;
      block[4] = *(_QWORD *)(a1 + 32);
      v26 = v38;
      v27 = &v28;
      v11 = v8;
      v25 = v11;
      dispatch_after(v9, v10, block);

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      v12 = *(_QWORD *)(*(_QWORD *)&v38[8] + 40);
      if (v12)
      {
        *((_BYTE *)v29 + 24) = 0;
        if (v3 > 0x3B)
          v3 = 60;
        else
          v3 = 2 * v3 + 2;
      }
      v13 = v12 == 0;

    }
    while (!v13);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) = *((_BYTE *)v29 + 24);
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(&v28, 8);
  }
  _ATLogCategoryRestore();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(unsigned __int8 **)(a1 + 32);
    v16 = v15[50];
    v17 = v15[49];
    v18 = v15[51];
    *(_DWORD *)v38 = 138544130;
    *(_QWORD *)&v38[4] = v15;
    *(_WORD *)&v38[12] = 1024;
    *(_DWORD *)&v38[14] = v16;
    *(_WORD *)&v38[18] = 1024;
    *(_DWORD *)&v38[20] = v17;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v18;
    _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ iCloudRestoreActive %d iTunesRestoreActive %d deviceRestoreActive %d.", v38, 0x1Eu);
  }

  v19 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v19 + 50)
    && !*(_BYTE *)(v19 + 49)
    && !*(_BYTE *)(v19 + 51)
    && objc_msgSend(*(id *)(v19 + 64), "activeRestoreType"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0CF75F0], 0, 0, 1u);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setActiveRestoreType:", 0);
    _ATLogCategoryRestore();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v38 = 138543618;
      *(_QWORD *)&v38[4] = v22;
      *(_WORD *)&v38[12] = 1024;
      *(_DWORD *)&v38[14] = 0;
      _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ No active restore - setting activeRestoreType to %d.", v38, 0x12u);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke_51(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E927D2F8;
  v6 = *(_QWORD *)(a1 + 56);
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "restoreSessionActiveWithCompletion:", v4);

}

void __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __46__ATRestoreManager__iCloudPhotoLibraryEnabled__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "isEnabledForDataclass:", *MEMORY[0x1E0C8F380]);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL __26__ATRestoreManager__start__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "code") == 16)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "code") == 3;

  }
  return v4;
}

void __32__ATRestoreManager__dataClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Application"), CFSTR("Book"), CFSTR("Media"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_dataClasses_dataClassesArray;
  _dataClasses_dataClassesArray = v1;

  v3 = (void *)_dataClasses_dataClassesArray;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Photo"), CFSTR("MessagePart"), CFSTR("Book"), CFSTR("VoiceMemo"), CFSTR("File"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsInArray:", v4);

  v5 = (void *)_dataClasses_dataClassesArray;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Photo"), CFSTR("MessagePart"), CFSTR("Book"), CFSTR("VoiceMemo"), CFSTR("File"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

}

void __53__ATRestoreManager_restoreAssetLinkDidCancelRestore___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sessionTasks", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "cancelAllAssets");
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __37__ATRestoreManager_sessionDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

  _ATLogCategoryRestore();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finishing restore", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "finishRestore");
  objc_msgSend(*(id *)(a1 + 40), "setRestoreInProgress:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0CF75F0], 0, 0, 1u);
  +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActiveRestoreType:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "endTransaction");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v16[0] = v13;
          v16[1] = 3221225472;
          v16[2] = __37__ATRestoreManager_sessionDidFinish___block_invoke_28;
          v16[3] = &unk_1E927E120;
          v16[4] = v15;
          dispatch_client_async(v15, v16);
        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

uint64_t __37__ATRestoreManager_sessionDidFinish___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restoreEndedWithError:", 0);
}

void __67__ATRestoreManager_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  int v2;
  id *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hasProperNetworkConditions");
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "resume");
  }
  else
  {
    objc_msgSend(v3[9], "sessionTasks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ATLogCategoryRestore();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v18 = v6;
      v19 = 2048;
      v20 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ suspending %lu restore tasks because wifi is not available", buf, 0x16u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "suspend", (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

void __26__ATRestoreManager_resume__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__ATRestoreManager_resume__block_invoke_2;
  v4[3] = &unk_1E927D220;
  v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

void __26__ATRestoreManager_resume__block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[5];
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  _ATLogCategoryRestore();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 72);
      *(_DWORD *)buf = 138543618;
      v30 = v5;
      v31 = 2114;
      v32 = v6;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming restore _restoreSession %{public}@.", buf, 0x16u);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 72);
    if (v8)
    {
      objc_msgSend(v8, "sessionTasks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ATLogCategoryRestore();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 138543618;
        v30 = v11;
        v31 = 2048;
        v32 = v12;
        _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming %lu restore tasks", buf, 0x16u);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "resume", (_QWORD)v23);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v15);
      }

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __26__ATRestoreManager_resume__block_invoke_8;
      block[3] = &unk_1E927E120;
      block[4] = v7;
      if (_block_invoke_onceToken != -1)
        dispatch_once(&_block_invoke_onceToken, block);
      +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hasCompletedDataMigration");

      _ATLogCategoryRestore();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v30 = v22;
        v31 = 1024;
        LODWORD(v32) = v20;
        _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ hasCompletedDataMigration = %d", buf, 0x12u);
      }

      if (v20)
        objc_msgSend(*(id *)(a1 + 32), "_start");
    }
  }
  else
  {
    if (v4)
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ No active restore session.", buf, 0xCu);
    }

  }
}

void __26__ATRestoreManager_resume__block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50))
  {
    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addAssetLink:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRestoreDelegate:");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Photo"), CFSTR("MessagePart"), CFSTR("Book"), CFSTR("VoiceMemo"), CFSTR("File"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAllowedDataClasses:", v3);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "open");
    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAssetLink:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAllowedDataClasses:", &unk_1E928BAB0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "open");
  }
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", *(_QWORD *)(a1 + 32));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_CFNotificationCallback, CFSTR("ATHasCompletedMigrationNotificationName"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __55__ATRestoreManager_restoreSessionActiveWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__ATRestoreManager_restoreSessionActiveWithCompletion___block_invoke_2;
    v5[3] = &unk_1E927D348;
    v4 = v1;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_async(v3, v5);

  }
}

uint64_t __55__ATRestoreManager_restoreSessionActiveWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  _BOOL8 v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_BYTE **)(a1 + 32);
  v4 = v3[49] || v3[50] || v3[51] != 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v2 + 16))(v2, v4);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2292);
  return (id)sharedManager_restoreManager;
}

void __33__ATRestoreManager_sharedManager__block_invoke()
{
  ATRestoreManager *v0;
  void *v1;

  v0 = objc_alloc_init(ATRestoreManager);
  v1 = (void *)sharedManager_restoreManager;
  sharedManager_restoreManager = (uint64_t)v0;

}

@end
