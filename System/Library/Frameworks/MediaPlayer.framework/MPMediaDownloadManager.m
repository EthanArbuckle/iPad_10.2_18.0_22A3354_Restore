@implementation MPMediaDownloadManager

- (BOOL)hasActiveDownloads
{
  void *v3;
  BOOL v4;

  -[MPStoreDownloadManager userDownloads](self->_storeDownloadManager, "userDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = 1;
  else
    v4 = -[NSMutableOrderedSet count](self->_cachedATDownloads, "count") != 0;

  return v4;
}

uint64_t __43__MPMediaDownloadManager_registerObserver___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 64), "containsObject:");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 64), "addObject:", *(_QWORD *)(v1 + 32));
  }
  return result;
}

+ (MPMediaDownloadManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (MPMediaDownloadManager *)(id)sharedManager__sharedManager;
}

void __39__MPMediaDownloadManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPMediaDownloadManager _init]([MPMediaDownloadManager alloc], "_init");
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;

}

void __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 96))
  {
    v3 = *(void **)(v1 + 40);
    if (!v3)
    {
      v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        getATMachDownloadObserverServiceName();
        *(_DWORD *)buf = 138543362;
        v24 = v5;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to %{public}@ ", buf, 0xCu);
      }

      v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
      getATMachDownloadObserverServiceName();
      v8 = objc_msgSend(v6, "initWithMachServiceName:options:", v7, 0);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE371A40);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      getATAssetClass();
      objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getAllDownloadsWithReplyBlock_, 0, 1);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_getAllDownloadsWithReplyBlock_, 1, 1);

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2D4BF8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C99E60];
      v18 = objc_opt_class();
      getATAssetClass();
      objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_atcDidUpdateDownloadStateForAssets_, 0, 0);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setRemoteObjectInterface:", v11);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setExportedInterface:", v16);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setExportedObject:");
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setInterruptionHandler:", &__block_literal_global_156);
      v20 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke_157;
      v21[3] = &unk_1E315E5D0;
      objc_copyWeak(&v22, (id *)buf);
      objc_msgSend(v20, "setInvalidationHandler:", v21);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "resume");
      objc_msgSend(*(id *)(a1 + 32), "_prefectchAllATDownloads");
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  }
}

void __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 96) && !*(_QWORD *)(v2 + 48))
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      getATMachKeepLocalRequestHandlerServiceName();
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Connecting to %{public}@ ", buf, 0xCu);
    }

    v5 = objc_alloc(MEMORY[0x1E0D4D128]);
    getATMachKeepLocalRequestHandlerServiceName();
    v7 = objc_msgSend(v5, "initWithMachServiceName:options:", v6, 0);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 48);
    *(_QWORD *)(v8 + 48) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setExportedObject:");
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE371980);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setRemoteObjectInterface:", v10);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3719E0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setExportedInterface:", v11);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setInterruptionHandler:", &__block_literal_global_134);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke_135;
    v13[3] = &unk_1E315E5D0;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend(v12, "setInvalidationHandler:", v13);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 48));
}

- (void)_prefectchAllATDownloads
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_init
{
  MPMediaDownloadManager *v2;
  uint64_t v3;
  NSMutableDictionary *cachedProgressMap;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_queue_t v7;
  OS_dispatch_queue *calloutQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *xpcConnectionQueue;
  uint64_t v11;
  NSHashTable *downloadObservers;
  uint64_t v13;
  MPStoreDownloadManager *storeDownloadManager;
  _BOOL4 v15;
  uint64_t v16;
  NSMutableOrderedSet *cachedATDownloads;
  uint64_t v18;
  NSMutableOrderedSet *cachedATUnEnqueuedDownloads;
  uint64_t v20;
  NSMutableDictionary *cachedATPausedDownloads;
  id v22;
  id v23;
  __CFNotificationCenter *DarwinNotifyCenter;
  CFStringRef v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)MPMediaDownloadManager;
  v2 = -[MPMediaDownloadManager init](&v27, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cachedProgressMap = v2->_cachedProgressMap;
    v2->_cachedProgressMap = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("com.apple.mediaplayer.mediadownloadmanager.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.mediaplayer.mediadownloadmanager.callout", MEMORY[0x1E0C80D50]);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.mediaplayer.mediadownloadmanager.xpcconnections", 0);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
    downloadObservers = v2->_downloadObservers;
    v2->_downloadObservers = (NSHashTable *)v11;

    +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
    v13 = objc_claimAutoreleasedReturnValue();
    storeDownloadManager = v2->_storeDownloadManager;
    v2->_storeDownloadManager = (MPStoreDownloadManager *)v13;

    -[MPStoreDownloadManager addObserver:forDownloads:](v2->_storeDownloadManager, "addObserver:forDownloads:", v2, 0);
    v15 = -[MPMediaDownloadManager _hasRequiredAirTrafficEntitlement](v2, "_hasRequiredAirTrafficEntitlement");
    v2->_hasRequiredAirTrafficEntitlement = v15;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v16 = objc_claimAutoreleasedReturnValue();
      cachedATDownloads = v2->_cachedATDownloads;
      v2->_cachedATDownloads = (NSMutableOrderedSet *)v16;

      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v18 = objc_claimAutoreleasedReturnValue();
      cachedATUnEnqueuedDownloads = v2->_cachedATUnEnqueuedDownloads;
      v2->_cachedATUnEnqueuedDownloads = (NSMutableOrderedSet *)v18;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = objc_claimAutoreleasedReturnValue();
      cachedATPausedDownloads = v2->_cachedATPausedDownloads;
      v2->_cachedATPausedDownloads = (NSMutableDictionary *)v20;

      v22 = -[MPMediaDownloadManager _keepLocalTaskConnection](v2, "_keepLocalTaskConnection");
      v23 = -[MPMediaDownloadManager _downloadProgressConnection](v2, "_downloadProgressConnection");
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      getATStartupCompleteNotification();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleATCStartupCompletedNotification, v25, 0, CFNotificationSuspensionBehaviorDrop);
    }
  }
  return v2;
}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_downloadProgressConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_65);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_66;
  v4[3] = &unk_1E3152E78;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "getAllDownloadsWithReplyBlock:", v4);

}

- (id)_downloadProgressConnection
{
  NSObject *xpcConnectionQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(xpcConnectionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_keepLocalTaskConnection
{
  NSObject *xpcConnectionQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(xpcConnectionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)_hasRequiredAirTrafficEntitlement
{
  __SecTask *v2;
  __SecTask *v3;
  CFTypeRef v4;
  CFErrorRef v5;
  CFTypeID v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    error = 0;
    v4 = SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.atc.private"), &error);
    v5 = error;
    if (!v4 || error)
    {
      v7 = 0;
      LODWORD(v8) = 0;
      if (!v4)
      {
        if (!error)
        {
LABEL_12:
          CFRelease(v3);
          v11 = os_log_create("com.apple.amp.mediaplayer", "Download");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "bundleIdentifier");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = (void *)v13;
            v15 = "cannot";
            if ((_DWORD)v8)
              v15 = "can";
            *(_DWORD *)buf = 138412546;
            v19 = v13;
            v20 = 2080;
            v21 = v15;
            _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s connect to atc", buf, 0x16u);

          }
          return (char)v8;
        }
LABEL_11:
        CFRelease(v5);
        goto LABEL_12;
      }
    }
    else
    {
      v6 = CFGetTypeID(v4);
      v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4) != 0;
    }
    CFRelease(v4);
    v5 = error;
    LODWORD(v8) = v7;
    if (!error)
      goto LABEL_12;
    goto LABEL_11;
  }
  v8 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = (uint64_t)v10;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%@ cannot connect to atc [unable to create SecTask]", buf, 0xCu);

  }
  LOBYTE(v8) = 0;
  return (char)v8;
}

void __48__MPMediaDownloadManager__statusChangeObservers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_statusChangeObservers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MPMediaDownloadManager__statusChangeObservers__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  MPMediaDownloadManager *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MPMediaDownloadManager_registerObserver___block_invoke;
  block[3] = &unk_1E31635F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __65__MPMediaDownloadManager_downloadForIdentifierSet_downloadState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  BOOL v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "persistentID");

  if (!v3)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      return;
    goto LABEL_33;
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v5 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    goto LABEL_33;
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "adamID");

  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "subscriptionAdamID");

  if (v11 | v13)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "allValues", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v11 && objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "storeItemID") == v11)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v20);
            goto LABEL_27;
          }
          if (!v17 && v13)
          {
            if (objc_msgSend(v20, "storeItemID") == v13)
              v17 = v20;
            else
              v17 = 0;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v16)
          continue;
        break;
      }
    }
    else
    {
      v17 = 0;
    }
LABEL_27:

    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = *(_QWORD *)(v28 + 40);
    v29 = (id *)(v28 + 40);
    if (v30)
      v31 = 1;
    else
      v31 = v17 == 0;
    if (!v31)
      objc_storeStrong(v29, v17);

    v5 = 0x1E0CB3000;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      goto LABEL_33;
    goto LABEL_22;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
LABEL_33:
    v26 = *(uint64_t **)(a1 + 56);
    if (!v26)
      return;
    v27 = 1;
    goto LABEL_35;
  }
LABEL_22:
  v21 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  objc_msgSend(*(id *)(v5 + 2024), "numberWithLongLong:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v26 = *(uint64_t **)(a1 + 56);
    if (v26)
    {
      v27 = 2;
LABEL_35:
      *v26 = v27;
    }
  }
}

- (id)downloadForIdentifierSet:(id)a3 downloadState:(int64_t *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  MPMediaDownloadManager *v13;
  uint64_t *v14;
  int64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  if (a4)
    *a4 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__MPMediaDownloadManager_downloadForIdentifierSet_downloadState___block_invoke;
  v11[3] = &unk_1E315B848;
  v12 = v6;
  v13 = self;
  v14 = &v16;
  v15 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (MPMediaDownloadManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-init is not supported, use +sharedInstance"));

  return 0;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  CFNotificationName v4;
  objc_super v5;

  -[NSXPCConnection invalidate](self->__downloadProgressConnection, "invalidate");
  -[NSXPCConnection invalidate](self->__keepLocalTaskConnection, "invalidate");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  getATStartupCompleteNotification();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)MPMediaDownloadManager;
  -[MPMediaDownloadManager dealloc](&v5, sel_dealloc);
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  MPMediaDownloadManager *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MPMediaDownloadManager_unregisterObserver___block_invoke;
  block[3] = &unk_1E31635F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)cancelDownloads:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  MPMediaDownloadManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MPMediaDownloadManager_cancelDownloads___block_invoke;
  v7[3] = &unk_1E31635F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSArray)allMediaDownloadLibraryIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  MPMediaDownloadManager *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreDownloadManager userDownloads](self->_storeDownloadManager, "userDownloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isCanceled") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "libraryItemIdentifier"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  queue = self->_queue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __60__MPMediaDownloadManager_allMediaDownloadLibraryIdentifiers__block_invoke;
  v19 = &unk_1E31635F8;
  v20 = self;
  v21 = v3;
  v12 = v3;
  dispatch_sync(queue, &v16);
  v13 = -[MPMediaDownloadManager _downloadProgressConnection](self, "_downloadProgressConnection", v16, v17, v18, v19, v20);
  objc_msgSend(v12, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (int64_t)activeDownloadsCount
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[MPStoreDownloadManager userDownloads](self->_storeDownloadManager, "userDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[NSMutableOrderedSet count](self->_cachedATDownloads, "count") + v4;

  return v5;
}

- (void)prioritizeDownload:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MPMediaDownloadManager_prioritizeDownload___block_invoke;
  v4[3] = &unk_1E3161620;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)enqueueAssetForDownload:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke;
  block[3] = &unk_1E315C618;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)sendKeepLocalStatusChanged:(int64_t)a3 forLibraryIdentifier:(int64_t)a4 entityType:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;

  v10 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke;
  block[3] = &unk_1E3152E30;
  v15 = a4;
  v16 = a5;
  v17 = a3;
  block[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_async(queue, block);

}

- (id)activeDownloadForMediaItemPersistentID:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MPMediaDownloadManager_activeDownloadForMediaItemPersistentID___block_invoke;
  block[3] = &unk_1E3163780;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)activeDownloadForStoreID:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MPMediaDownloadManager_activeDownloadForStoreID___block_invoke;
  block[3] = &unk_1E3163780;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)downloadLibraryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3162560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)downloadManager:(id)a3 didAddDownloads:(id)a4 removeDownloads:(id)a5
{
  id v7;
  id v8;
  NSObject *calloutQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  MPMediaDownloadManager *v15;

  v7 = a4;
  v8 = a5;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MPMediaDownloadManager_downloadManager_didAddDownloads_removeDownloads___block_invoke;
  block[3] = &unk_1E3163698;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(calloutQueue, block);

}

- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__MPMediaDownloadManager_downloadManager_downloadDidProgress___block_invoke;
  v8[3] = &unk_1E31635F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)downloadManager:(id)a3 downloadsDidProgress:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  MPMediaDownloadManager *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__MPMediaDownloadManager_downloadManager_downloadsDidProgress___block_invoke;
  v8[3] = &unk_1E31635F8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  MPMediaDownloadManager *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MPMediaDownloadManager_downloadManager_downloadDidFinish___block_invoke;
  v8[3] = &unk_1E31635F8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)atcDidEnqueueAsset:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  MPMediaDownloadManager *v8;

  v4 = a3;
  if (-[MPMediaDownloadManager _isValidMediaAsset:](self, "_isValidMediaAsset:", v4))
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__MPMediaDownloadManager_atcDidEnqueueAsset___block_invoke;
    v6[3] = &unk_1E31635F8;
    v7 = v4;
    v8 = self;
    dispatch_async(queue, v6);

  }
}

- (void)atcDidDownloadAsset:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[4];
  id v10;
  MPMediaDownloadManager *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[MPMediaDownloadManager _isValidMediaAsset:](self, "_isValidMediaAsset:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MPMediaDownloadManager_atcDidDownloadAsset_withError___block_invoke;
    block[3] = &unk_1E3163698;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(queue, block);

  }
}

- (void)atcDidUpdateAsset:(id)a3 withProgress:(float)a4
{
  id v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  if (-[MPMediaDownloadManager _isValidMediaAsset:](self, "_isValidMediaAsset:", v5))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__MPMediaDownloadManager_atcDidUpdateAsset_withProgress___block_invoke;
    v7[3] = &unk_1E31635F8;
    v7[4] = self;
    v8 = v5;
    dispatch_async(queue, v7);

  }
}

- (void)atcDidUpdateDownloadStateForAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  MPMediaDownloadManager *v9;
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
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MPMediaDownloadManager_atcDidUpdateDownloadStateForAssets___block_invoke;
  block[3] = &unk_1E31635A8;
  v6 = v4;
  v8 = v6;
  v9 = self;
  v10 = &v11;
  dispatch_async(queue, block);
  -[MPMediaDownloadManager _notifyObserversOfDownloadPauseReasonChangedForAssets:](self, "_notifyObserversOfDownloadPauseReasonChangedForAssets:", v12[5]);

  _Block_object_dispose(&v11, 8);
}

- (void)atcWillEnqueueDownloads:(id)a3 cancelDownloads:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MPMediaDownloadManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MPMediaDownloadManager_atcWillEnqueueDownloads_cancelDownloads___block_invoke;
  block[3] = &unk_1E3163698;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (id)_updateCacheAndItemToReportForATAssetDownloadProgressChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MPMediaDownload *v8;
  float v9;
  double v10;
  double v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_cachedProgressMap, "objectForKey:", v7);
  v8 = (MPMediaDownload *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadProgress");
  if (v8)
  {
    v10 = v9;
    -[MPMediaDownload downloadProgress](v8, "downloadProgress");
    if (vabdd_f64(v10, v11) <= 0.000001)
    {

      v8 = 0;
      goto LABEL_8;
    }
    -[MPMediaDownload setDownloadProgress:](v8, "setDownloadProgress:", v10);
    goto LABEL_6;
  }
  v8 = -[MPMediaDownload initWithATAsset:]([MPMediaDownload alloc], "initWithATAsset:", v4);
  if (v8)
  {
    -[NSMutableDictionary setObject:forKey:](self->_cachedProgressMap, "setObject:forKey:", v8, v7);
LABEL_6:
    -[NSMutableDictionary removeObjectForKey:](self->_cachedATPausedDownloads, "removeObjectForKey:", v7);
  }
LABEL_8:

  return v8;
}

- (id)_updateCacheAndGetItemToReportForATAssetDownloadPauseReasonChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MPMediaDownload *v8;
  MPMediaDownload *v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  NSObject *v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_cachedATPausedDownloads, "objectForKey:", v7);
  v8 = (MPMediaDownload *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    v10 = -[MPMediaDownload downloadPausedReason](v8, "downloadPausedReason");
    v11 = +[MPMediaDownload MPMediaDownloadPauseReasonForATAsset:](MPMediaDownload, "MPMediaDownloadPauseReasonForATAsset:", v4);
    if (v10 == v11)
    {
      v12 = v10;
    }
    else
    {
      v12 = v11;
      -[MPMediaDownload setDownloadPausedReason:](v9, "setDownloadPausedReason:", v11);
      if (!-[MPMediaDownload downloadPausedReason](v9, "downloadPausedReason"))
        -[NSMutableDictionary removeObjectForKey:](self->_cachedATPausedDownloads, "removeObjectForKey:", v7);
    }
  }
  else
  {
    v12 = +[MPMediaDownload MPMediaDownloadPauseReasonForATAsset:](MPMediaDownload, "MPMediaDownloadPauseReasonForATAsset:", v4);
    v9 = -[MPMediaDownload initWithATAsset:]([MPMediaDownload alloc], "initWithATAsset:", v4);
    if (-[MPMediaDownload downloadPausedReason](v9, "downloadPausedReason"))
      -[NSMutableDictionary setObject:forKey:](self->_cachedATPausedDownloads, "setObject:forKey:", v9, v7);
    LODWORD(v10) = 0;
  }
  v13 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = "updated";
    v16 = 136315906;
    if (!v9)
      v14 = "not updated";
    v17 = v14;
    v18 = 2114;
    v19 = v4;
    v20 = 1024;
    v21 = v10;
    v22 = 1024;
    v23 = v12;
    _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_DEBUG, "%s cache handling state change for %{public}@ - download pause reason (existing:%d, current:%d)", (uint8_t *)&v16, 0x22u);
  }

  return v9;
}

- (id)_updateCacheAndGetMediaDownloadToReportForStoreDownloadProgress:(id)a3
{
  id v4;
  void *v5;
  MPMediaDownload *v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "libraryItemIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_cachedProgressMap, "objectForKey:", v5);
  v6 = (MPMediaDownload *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "percentComplete");
  if (v6)
  {
    v8 = v7;
    -[MPMediaDownload downloadProgress](v6, "downloadProgress");
    if (vabdd_f64(v8, v9) <= 0.000001)
    {

      v6 = 0;
    }
    else
    {
      -[MPMediaDownload setDownloadProgress:](v6, "setDownloadProgress:", v8);
    }
  }
  else
  {
    v6 = -[MPMediaDownload initWithMPStoreDownload:]([MPMediaDownload alloc], "initWithMPStoreDownload:", v4);
    if (v6)
      -[NSMutableDictionary setObject:forKey:](self->_cachedProgressMap, "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (void)_notifyObserversOfAssetDownloadProgress:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    calloutQueue = self->_calloutQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__MPMediaDownloadManager__notifyObserversOfAssetDownloadProgress___block_invoke;
    v6[3] = &unk_1E31635F8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(calloutQueue, v6);

  }
}

- (void)_notifyObserversOfDownloadCompleteForAssets:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *calloutQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MPMediaDownloadManager__notifyObserversOfDownloadCompleteForAssets_withError___block_invoke;
    block[3] = &unk_1E3163698;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(calloutQueue, block);

  }
}

- (void)_notifyObserversOfDownloadPauseReasonChangedForAssets:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    calloutQueue = self->_calloutQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__MPMediaDownloadManager__notifyObserversOfDownloadPauseReasonChangedForAssets___block_invoke;
    v6[3] = &unk_1E31635F8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(calloutQueue, v6);

  }
}

- (BOOL)_isValidMediaAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "longLongValue"))
    goto LABEL_10;
  v6 = objc_msgSend(v4, "downloadOnly");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "assetType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Movie")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("Music")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("TVEpisode")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("MusicVideo")))
    {
      v7 = 1;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
LABEL_4:
  v7 = 0;
LABEL_12:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadObservers, 0);
  objc_storeStrong((id *)&self->_storeDownloadManager, 0);
  objc_storeStrong((id *)&self->__keepLocalTaskConnection, 0);
  objc_storeStrong((id *)&self->__downloadProgressConnection, 0);
  objc_storeStrong((id *)&self->_cachedATPausedDownloads, 0);
  objc_storeStrong((id *)&self->_cachedATUnEnqueuedDownloads, 0);
  objc_storeStrong((id *)&self->_cachedProgressMap, 0);
  objc_storeStrong((id *)&self->_cachedATDownloads, 0);
}

void __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke_157(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    getATMachDownloadObserverServiceName();
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ invalidated", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 5);
    *((_QWORD *)WeakRetained + 5) = 0;

  }
}

void __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke_155()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    getATMachDownloadObserverServiceName();
    v2 = 138543362;
    v3 = v1;
    _os_log_impl(&dword_193B9B000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ interrupted", (uint8_t *)&v2, 0xCu);
  }

}

void __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke_135(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    getATMachKeepLocalRequestHandlerServiceName();
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "Connection to %{public}@ invalidated", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 6);
    *((_QWORD *)WeakRetained + 6) = 0;

  }
}

void __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke_133()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    getATMachKeepLocalRequestHandlerServiceName();
    v2 = 138543362;
    v3 = v1;
    _os_log_impl(&dword_193B9B000, v0, OS_LOG_TYPE_ERROR, "Connection to %{public}@ interrupted", (uint8_t *)&v2, 0xCu);
  }

}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_66(uint64_t a1, void *a2, void *a3)
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
  v8 = *(NSObject **)(v7 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_2_67;
  block[3] = &unk_1E3163698;
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_2_67(id *a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  MPMediaDownload *v30;
  float v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  _QWORD block[5];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[4], "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "finished getting downloads in ATC pipeline error=%{public}@", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "finished getting downloads in ATC pipeline", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)a1[5] + 7), "userDownloads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  v10 = 0x1E0CB3000uLL;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "libraryItemIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v11);
  }
  v41 = v8;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v15 = *((id *)a1[5] + 1);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
        if ((objc_msgSend(v7, "containsObject:", v20) & 1) == 0)
          objc_msgSend(*((id *)a1[5] + 2), "removeObjectForKey:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v17);
  }

  objc_msgSend(*((id *)a1[5] + 1), "removeAllObjects");
  objc_msgSend(*((id *)a1[5] + 3), "removeAllObjects");
  objc_msgSend(*((id *)a1[5] + 4), "removeAllObjects");
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = a1[6];
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
        if (objc_msgSend(a1[5], "_isValidMediaAsset:", v25))
        {
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "longLongValue");

          v28 = v10;
          objc_msgSend(*(id *)(v10 + 2024), "numberWithLongLong:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)a1[5] + 1), "addObject:", v29);
          v30 = -[MPMediaDownload initWithATAsset:]([MPMediaDownload alloc], "initWithATAsset:", v25);
          objc_msgSend(v42, "addObject:", v30);
          objc_msgSend(v25, "downloadProgress");
          if (v31 <= 0.0
            || (objc_msgSend(*((id *)a1[5] + 2), "objectForKey:", v29),
                v32 = (void *)objc_claimAutoreleasedReturnValue(),
                v32,
                v32))
          {
            v10 = v28;
            if (objc_msgSend(v25, "downloadPauseReason"))
            {
              v33 = 32;
              goto LABEL_33;
            }
          }
          else
          {
            v33 = 16;
            v10 = v28;
LABEL_33:
            objc_msgSend(*(id *)((char *)a1[5] + v33), "setObject:forKey:", v30, v29);
          }

          continue;
        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    }
    while (v22);
  }

  v34 = a1[5];
  v35 = *((_QWORD *)v34 + 10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_69;
  block[3] = &unk_1E31635F8;
  block[4] = v34;
  v36 = v42;
  v45 = v36;
  dispatch_async(v35, block);
  v37 = os_log_create("com.apple.amp.mediaplayer", "Download_Oversize");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = a1[5];
    v39 = (void *)*((_QWORD *)v38 + 1);
    objc_msgSend(*((id *)v38 + 4), "allValues");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v39;
    v60 = 2114;
    v61 = v40;
    _os_log_impl(&dword_193B9B000, v37, OS_LOG_TYPE_DEFAULT, "ATC's download pipeline: active=%{public}@, paused=%{public}@", buf, 0x16u);

  }
}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_69(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "downloadManager:didEnqueueAssetDownloads:didRemoveAssetDownloads:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "error %{public}@ connecting to remote object to get downloads in ATC queue", (uint8_t *)&v4, 0xCu);
  }

}

void __80__MPMediaDownloadManager__notifyObserversOfDownloadPauseReasonChangedForAssets___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "downloadManager:didChangeDownloadPausedReasonForAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __80__MPMediaDownloadManager__notifyObserversOfDownloadCompleteForAssets_withError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "downloadManager:didFinishAsset:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __66__MPMediaDownloadManager__notifyObserversOfAssetDownloadProgress___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "downloadManager:didUpdateDownloadProgress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __66__MPMediaDownloadManager_atcWillEnqueueDownloads_cancelDownloads___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
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
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

void __61__MPMediaDownloadManager_atcDidUpdateDownloadStateForAssets___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Download_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v21 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "atcDidUpdateDownloadStateForAssets=%{public}@", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "_isValidMediaAsset:", v9, (_QWORD)v15))
        {
          v10 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v13);

          objc_msgSend(*(id *)(a1 + 40), "_updateCacheAndGetItemToReportForATAssetDownloadPauseReasonChange:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

void __57__MPMediaDownloadManager_atcDidUpdateAsset_withProgress___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateCacheAndItemToReportForATAssetDownloadProgressChange:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v3, "addObject:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfAssetDownloadProgress:", v3);

}

void __56__MPMediaDownloadManager_atcDidDownloadAsset_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  MPMediaDownload *v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "containsObject:", v4);
  v7 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v12 = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "atc finished %{public}@ with error %{public}@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", v4);
  v10 = (MPMediaDownload *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = 0;
  else
    v11 = v6;
  if (v11 == 1)
    v10 = -[MPMediaDownload initWithATAsset:]([MPMediaDownload alloc], "initWithATAsset:", *(_QWORD *)(a1 + 32));
  if (v10)
    objc_msgSend(v5, "addObject:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectForKey:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectForKey:", v4);
  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfDownloadCompleteForAssets:withError:", v5, *(_QWORD *)(a1 + 48));

}

void __45__MPMediaDownloadManager_atcDidEnqueueAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaDownload *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaDownload initWithATAsset:]([MPMediaDownload alloc], "initWithATAsset:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "addObject:", v6);
  if (objc_msgSend(v5, "count"))
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "atc enqueued %{public}@ for download", buf, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(NSObject **)(v9 + 80);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__MPMediaDownloadManager_atcDidEnqueueAsset___block_invoke_43;
    v11[3] = &unk_1E31635F8;
    v11[4] = v9;
    v12 = v5;
    dispatch_async(v10, v11);

  }
}

void __45__MPMediaDownloadManager_atcDidEnqueueAsset___block_invoke_43(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "downloadManager:didEnqueueAssetDownloads:didRemoveAssetDownloads:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __60__MPMediaDownloadManager_downloadManager_downloadDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "libraryItemIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "failureError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "failureError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "store download finished %{public}@ error=%{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 32);
    v14 = 138543362;
    v15 = v10;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "store download finished %{public}@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v3, "addObject:", v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectForKey:", v2);
  }
  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "failureError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_notifyObserversOfDownloadCompleteForAssets:withError:", v3, v13);

}

void __63__MPMediaDownloadManager_downloadManager_downloadsDidProgress___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "_updateCacheAndGetMediaDownloadToReportForStoreDownloadProgress:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfAssetDownloadProgress:", v2);
}

void __62__MPMediaDownloadManager_downloadManager_downloadDidProgress___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateCacheAndGetMediaDownloadToReportForStoreDownloadProgress:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v3, "addObject:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfAssetDownloadProgress:", v3);

}

void __74__MPMediaDownloadManager_downloadManager_didAddDownloads_removeDownloads___block_invoke(uint64_t a1)
{
  void *v2;
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
  +[MPMediaDownload MPMediaDownloadsFromMPStoreDownloads:](MPMediaDownload, "MPMediaDownloadsFromMPStoreDownloads:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaDownload MPMediaDownloadsFromMPStoreDownloads:](MPMediaDownload, "MPMediaDownloadsFromMPStoreDownloads:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "_statusChangeObservers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "downloadManager:didEnqueueAssetDownloads:didRemoveAssetDownloads:", *(_QWORD *)(a1 + 48), v2, v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_keepLocalTaskConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E31624C0;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke_39;
  v5[3] = &unk_1E31624C0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "downloadLibraryWithCompletionBlock:", v5);

}

void __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "error %{public}@ initiating a keep local session to download music library", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v3;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "initiated a keep local session to download library with error %{public}@ error=%{public}@", (uint8_t *)&v8, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = 0;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "initiated a keep local session to download library with error %{public}@", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __51__MPMediaDownloadManager_activeDownloadForStoreID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1[4] + 16), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "storeItemID") == a1[6])
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

void __65__MPMediaDownloadManager_activeDownloadForMediaItemPersistentID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "_keepLocalTaskConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E3152E08;
  v15 = *(_OWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 64);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke_38;
  v8[3] = &unk_1E3152E08;
  v7 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v5;
  v9 = v7;
  objc_msgSend(v4, "handleKeepLocalStatusChanged:forLibraryIdentifier:entityType:withCompletionBlock:", v5, v10, v6, v8);

}

void __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = a1[5];
    v6 = a1[6];
    v7 = a1[7];
    v9 = 138544130;
    v10 = v3;
    v11 = 2048;
    v12 = v5;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "error %{public}@ initiating a keep local session for libraryIdentifier %lld, mediaType:%d, keep local status:%d", (uint8_t *)&v9, 0x22u);
  }

  v8 = a1[4];
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke_38(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[5];
      v7 = a1[6];
      v8 = a1[7];
      objc_msgSend(v3, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134218754;
      v15 = v6;
      v16 = 1024;
      v17 = v7;
      v18 = 1024;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "initiated a keep local session for libraryIdentifier %llu mediaType:%d new keep local status:%d error=%{public}@", (uint8_t *)&v14, 0x22u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[5];
    v11 = a1[6];
    v12 = a1[7];
    v14 = 134218496;
    v15 = v10;
    v16 = 1024;
    v17 = v11;
    v18 = 1024;
    v19 = v12;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "initiated a keep local session for libraryIdentifier %llu mediaType:%d new keep local status:%d", (uint8_t *)&v14, 0x18u);
  }

  v13 = a1[4];
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

void __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "_keepLocalTaskConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 48);
  v13[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E315C370;
  v13[4] = v5;
  v14 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_2_36;
  v10[3] = &unk_1E315C370;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v10[4] = v9;
  v11 = v7;
  objc_msgSend(v6, "enqueueAssetForDownload:withCompletionBlock:", v8, v10);

}

void __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = a1[6];
    *(_DWORD *)buf = 138543618;
    v13 = v3;
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "error %{public}@ enqueuing download persistent id:%lld with atc", buf, 0x16u);
  }

  v6 = (void *)a1[5];
  v7 = *(NSObject **)(a1[4] + 80);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_35;
  v9[3] = &unk_1E3162560;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

void __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_2_36(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[6];
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v16 = v6;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "finished enqueuing download persistent id: %lld with atc error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[6];
    *(_DWORD *)buf = 134217984;
    v16 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "finished enqueuing download persistent id: %lld with atc", buf, 0xCu);
  }

  v9 = (void *)a1[5];
  v10 = *(NSObject **)(a1[4] + 80);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_37;
  v12[3] = &unk_1E3162560;
  v13 = v3;
  v14 = v9;
  v11 = v3;
  dispatch_async(v10, v12);

}

uint64_t __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_37(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __45__MPMediaDownloadManager_prioritizeDownload___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    v25 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "prioritizing download with persistentId:%lld", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "userDownloads");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v9, "libraryItemIdentifier") == *(_QWORD *)(a1 + 40))
        {
          v22 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "resumeDownloads:", v14);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "prioritizeDownloads:", v14);
          v15 = os_log_create("com.apple.amp.mediaplayer", "Download");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 134217984;
            v25 = v16;
            _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "prioritized download with identifier %llu with the store", buf, 0xCu);
          }

          v12 = v4;
          goto LABEL_17;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v6)
        continue;
      break;
    }
  }

  v10 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    v25 = v11;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "identifier %llu not found in the store queue", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_downloadProgressConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__MPMediaDownloadManager_prioritizeDownload___block_invoke_33;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "prioritizeDownloadWithStoreForLibraryIdentifier:withReplyBlock:", v13, 3221225472, __45__MPMediaDownloadManager_prioritizeDownload___block_invoke_34, &__block_descriptor_40_e17_v16__0__NSError_8l, *(_QWORD *)(a1 + 40));
LABEL_17:

}

void __45__MPMediaDownloadManager_prioritizeDownload___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v3;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "error %{public}@ prioritizing download identifier %llu with atc", (uint8_t *)&v6, 0x16u);
  }

}

void __45__MPMediaDownloadManager_prioritizeDownload___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218242;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "prioritized download for identifier %llu with atc error=%{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 134217984;
    v10 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "prioritized download for identifier %llu with atc", (uint8_t *)&v9, 0xCu);
  }

}

void __60__MPMediaDownloadManager_allMediaDownloadLibraryIdentifiers__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __42__MPMediaDownloadManager_cancelDownloads___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  id obj;
  _QWORD block[4];
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[3];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "valueForKey:", CFSTR("longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "downloads");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "libraryItemIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v6, "setObject:forKey:", v11, v12);
          objc_msgSend(v5, "removeObjectForKey:", v12);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v8);
  }
  v14 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend(v5, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "orderedSetWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "containsObject:", v22))
          objc_msgSend(v16, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v19);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v23 = *(id *)(*(_QWORD *)(a1 + 40) + 24);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v25);
  }

  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = CFSTR("keepLocal");
  v54[1] = CFSTR("keepLocalStatus");
  v54[2] = CFSTR("keepLocalStatusReason");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setValues:forProperties:forItemPersistentIDs:", &unk_1E31E5788, v29, v30);

  objc_msgSend(*(id *)(a1 + 40), "_keepLocalTaskConnection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "cancelDownloadsForMediaTypes:", &unk_1E31E57A0);

  v33 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  objc_msgSend(v6, "allValues");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "cancelDownloads:", v34);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeAllObjects");
  v35 = *(_QWORD *)(a1 + 40);
  v36 = *(NSObject **)(v35 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MPMediaDownloadManager_cancelDownloads___block_invoke_29;
  block[3] = &unk_1E31635F8;
  v40 = obj;
  v41 = v35;
  v37 = obj;
  dispatch_async(v36, block);

}

void __42__MPMediaDownloadManager_cancelDownloads___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[MPMediaDownload MPMediaDownloadsFromMPStoreDownloads:](MPMediaDownload, "MPMediaDownloadsFromMPStoreDownloads:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_statusChangeObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "downloadManager:didCancelAssets:", *(_QWORD *)(a1 + 40), v2);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __42__MPMediaDownloadManager_cancelDownloads___block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "error %{public}@ cancelling downloads with ATC", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __45__MPMediaDownloadManager_unregisterObserver___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 64), "removeObject:");
  return result;
}

@end
