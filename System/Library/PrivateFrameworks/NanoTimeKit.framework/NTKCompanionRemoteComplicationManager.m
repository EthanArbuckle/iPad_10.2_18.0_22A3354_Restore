@implementation NTKCompanionRemoteComplicationManager

- (void)_load
{
  os_unfair_lock_s *p_remoteComplicationsLock;
  void *v4;
  void *v5;
  void *v6;

  p_remoteComplicationsLock = &self->_remoteComplicationsLock;
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCompanionRemoteComplicationManager setDevice:](self, "setDevice:", v4);

  -[NTKComplicationCollection removeObserver:](self->_remoteComplications, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedComplicationCollectionForDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCompanionRemoteComplicationManager setRemoteComplications:](self, "setRemoteComplications:", v6);

  -[NTKComplicationCollection addObserver:](self->_remoteComplications, "addObserver:", self);
  os_unfair_lock_unlock(p_remoteComplicationsLock);
  -[NTKCompanionRemoteComplicationManager _fetchInstalledApps](self, "_fetchInstalledApps");
}

- (void)setRemoteComplications:(id)a3
{
  objc_storeStrong((id *)&self->_remoteComplications, a3);
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)loaded
{
  return self->_loaded;
}

void __55__NTKCompanionRemoteComplicationManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (NTKCompanionRemoteComplicationManager)init
{
  NTKCompanionRemoteComplicationManager *v2;
  NTKCompanionRemoteComplicationManager *v3;
  dispatch_queue_t v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKCompanionRemoteComplicationManager;
  v2 = -[NTKCompanionRemoteComplicationManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_installedComplicationsLock._os_unfair_lock_opaque = 0;
    v2->_remoteComplicationsLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_create("com.apple.ntk.companionremotecomplicationmanager.updates", 0);
    -[NTKCompanionRemoteComplicationManager setSerialQueue:](v3, "setSerialQueue:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__activeDeviceChanged, *MEMORY[0x1E0C93E48], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__appStartedInstall, CFSTR("NTKCompanion3rdPartyAppInstallStartedNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__fetchInstalledApps, CFSTR("NTKSystemAppStateChangedNotification"), 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_handleAppConduitApplicationsChangedNotification, (CFStringRef)*MEMORY[0x1E0CF8828], v3, (CFNotificationSuspensionBehavior)0);
    -[NTKCompanionRemoteComplicationManager _load](v3, "_load");

  }
  return v3;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void)_fetchInstalledApps
{
  os_unfair_lock_s *p_remoteComplicationsLock;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 wantsAppFetch;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  p_remoteComplicationsLock = &self->_remoteComplicationsLock;
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  -[NTKCompanionRemoteComplicationManager remoteComplications](self, "remoteComplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasLoaded");

  os_unfair_lock_unlock(p_remoteComplicationsLock);
  if (v5)
  {
    os_unfair_lock_lock(p_remoteComplicationsLock);
    if (self->_fetchingApps)
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        wantsAppFetch = self->_wantsAppFetch;
        v8[0] = 67109120;
        v8[1] = wantsAppFetch;
        _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "NTKCompanionRemoteComplicationManager: Attempted to fetch installed apps while already retrieving installed apps! Deferring until after the first operation completes... (previously defered=%d)", (uint8_t *)v8, 8u);
      }

      self->_wantsAppFetch = 1;
      os_unfair_lock_unlock(p_remoteComplicationsLock);
    }
    else
    {
      os_unfair_lock_unlock(p_remoteComplicationsLock);
      -[NTKCompanionRemoteComplicationManager _queryInstalledApps](self, "_queryInstalledApps");
    }
  }
}

- (NTKComplicationCollection)remoteComplications
{
  return self->_remoteComplications;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_21);
  return (id)sharedInstance_sharedInstance;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93E48], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKCompanion3rdPartyAppInstallStartedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKSystemAppStateChangedNotification"), 0);
  -[NTKComplicationCollection removeObserver:](self->_remoteComplications, "removeObserver:", self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CF8828], self);

  v5.receiver = self;
  v5.super_class = (Class)NTKCompanionRemoteComplicationManager;
  -[NTKCompanionRemoteComplicationManager dealloc](&v5, sel_dealloc);
}

- (void)_queryInstalledApps
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id *v14;
  id *v15;
  id *v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  id v25;
  char v26;
  _QWORD v27[5];
  id v28;
  _QWORD aBlock[5];
  id v30;
  id v31;
  id buf[2];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  *(_WORD *)&self->_fetchingApps = 1;
  os_unfair_lock_unlock(&self->_remoteComplicationsLock);
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "NTKCompanionRemoteComplicationManager: Fetching installed apps for remote complication manager...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke;
  aBlock[3] = &unk_1E6BCF7B0;
  objc_copyWeak(&v31, buf);
  aBlock[4] = self;
  v6 = v3;
  v30 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  v8 = -[CLKDevice isRunningGraceOrLater](self->_device, "isRunningGraceOrLater");
  -[CLKDevice nrDevice](self->_device, "nrDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_remoteComplicationsLock);
  objc_msgSend(v9, "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_17;
    v27[3] = &unk_1E6BCF7D8;
    v27[4] = self;
    v28 = v6;
    v11 = _Block_copy(v27);
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    dispatch_group_notify(v12, (dispatch_queue_t)self->_serialQueue, v7);
    dispatch_group_enter(v12);
    objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v22[0] = v5;
      v22[1] = 3221225472;
      v22[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22;
      v22[3] = &unk_1E6BCF800;
      v26 = v8;
      v23 = v10;
      v24 = v12;
      v25 = v11;
      objc_msgSend(v13, "enumerateInstalledApplicationsOnPairedDevice:withBlock:", v9, v22);
      v14 = &v23;
      v15 = (id *)&v24;
      v16 = &v25;
    }
    else
    {
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_24;
      v17[3] = &unk_1E6BCF850;
      v18 = v10;
      v19 = v12;
      v20 = v9;
      v21 = v11;
      objc_msgSend(v13, "enumerateLocallyAvailableApplicationsForPairedDevice:options:withBlock:", v20, 3, v17);
      v14 = &v18;
      v15 = (id *)&v19;
      v16 = &v20;

      v13 = v21;
    }

    dispatch_group_leave(v12);
  }
  else
  {
    v7[2](v7);
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(buf);

}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke(id *a1)
{
  char *WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[8];
  _QWORD block[5];

  WeakRetained = (char *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 4);
    v3 = (void *)objc_msgSend(a1[5], "copy");
    objc_msgSend(a1[4], "setInstalledComplications:", v3);

    os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 4);
    objc_msgSend(a1[4], "_queue_reloadApps");
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2;
    block[3] = &unk_1E6BCD5F0;
    block[4] = a1[4];
    dispatch_async(MEMORY[0x1E0C80D38], block);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
    if (WeakRetained[10])
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKCompanionRemoteComplicationManager: Finished fetching apps, but beginning a backlogged refresh", buf, 2u);
      }

      v8[0] = v4;
      v8[1] = 3221225472;
      v8[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_16;
      v8[3] = &unk_1E6BCD5F0;
      v8[4] = WeakRetained;
      v6 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v8);

    }
    else
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "NTKCompanionRemoteComplicationManager: Finished fetching apps", buf, 2u);
      }

      *(_WORD *)(WeakRetained + 9) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
    }
  }

}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("NTKCompanionRemoteComplicationManagerDidLoadNotification"), *(_QWORD *)(a1 + 32));

  }
}

uint64_t __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryInstalledApps");
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "companionAppBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v19 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v19);
    v6 = v19;
    if (!v5)
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_17_cold_1((uint64_t)v4, (uint64_t)v6, v7);

    }
    objc_msgSend(v5, "applicationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRestricted");

    if (v9)
    {
      objc_msgSend(v3, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v10;
        v22 = 2112;
        v23 = v4;
        _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Complication: Restricted app with bundleID: %@ - %@ on companion", buf, 0x16u);
      }

      goto LABEL_14;
    }

  }
  objc_msgSend(v3, "watchKitAppExtensionBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(v3, "bundleIdentifier"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = *(void **)(a1 + 40);
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_19;
    v15[3] = &unk_1E6BCDCB8;
    v16 = v13;
    v17 = v12;
    v18 = v3;
    v6 = v12;
    dispatch_sync(v14, v15);

    v5 = v16;
LABEL_14:

  }
}

uint64_t __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1BCCA7FA8]();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (v6 && *(_BYTE *)(a1 + 56))
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22_cold_1();

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

  return 1;
}

uint64_t __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_25;
      v13[3] = &unk_1E6BCF828;
      v10 = *(_QWORD *)(a1 + 48);
      v16 = *(id *)(a1 + 56);
      v14 = v5;
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v9, "applicationIsInstalledOnPairedDevice:withBundleID:completion:", v10, v8, v13);

    }
  }
  else
  {
    if (v6)
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22_cold_1();

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

  return 1;
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_25(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x1BCCA7FA8]();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_autoreleasePoolPop(v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)_queue_reloadApps
{
  void *v3;
  NTKComplicationCollection *v4;
  void *v5;
  void *v6;
  NTKComplicationCollection *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NTKCompanionSyncedComplication *v19;
  void *v20;
  void *v21;
  NTKCompanionSyncedComplication *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NTKCompanionSyncedComplication *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  NSDictionary *syncedComplications;
  NTKCompanionRemoteComplicationManager *v50;
  uint64_t v51;
  uint64_t v52;
  NTKComplicationCollection *v53;
  void *v54;
  id obj;
  id v56;
  id v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _QWORD block[5];
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
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  NTKCompanionSyncedComplication *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  -[NTKCompanionRemoteComplicationManager _safeInstalledComplications](self, "_safeInstalledComplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  v4 = self->_remoteComplications;
  v50 = self;
  -[NTKCompanionRemoteComplicationManager device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A7ECBEFE-1F57-4037-8007-469E4BF74064"));
  v58 = objc_msgSend(v5, "supportsCapability:", v6);

  v7 = v4;
  os_unfair_lock_unlock(&self->_remoteComplicationsLock);
  -[NTKComplicationCollection clients](v4, "clients");
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  v53 = v4;
  v54 = v3;
  if (v8)
  {
    v9 = v8;
    v60 = *(_QWORD *)v77;
    do
    {
      v10 = 0;
      v56 = (id)v9;
      do
      {
        if (*(_QWORD *)v77 != v60)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (v58)
          {
            -[NTKComplicationCollection complicationDescriptorsForClientIdentifier:](v7, "complicationDescriptorsForClientIdentifier:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v73;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v73 != v17)
                    objc_enumerationMutation(v14);
                  v19 = -[NTKCompanionSyncedComplication initWithRemoteApplication:descriptor:]([NTKCompanionSyncedComplication alloc], "initWithRemoteApplication:descriptor:", v13, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i));
                  objc_msgSend(v12, "addObject:", v19);

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
              }
              while (v16);
              v7 = v53;
              v3 = v54;
              v9 = (uint64_t)v56;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKComplicationCollection supportedTemplateFamiliesForClientIdentifier:descriptor:](v7, "supportedTemplateFamiliesForClientIdentifier:descriptor:", v11, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptorWithSupportedFamilies:", v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = -[NTKCompanionSyncedComplication initWithRemoteApplication:descriptor:]([NTKCompanionSyncedComplication alloc], "initWithRemoteApplication:descriptor:", v13, v14);
            objc_msgSend(v12, "addObject:", v22);

            v9 = (uint64_t)v56;
          }

          v23 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v62, "setObject:forKeyedSubscript:", v23, v11);

        }
        ++v10;
      }
      while (v10 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v9);
  }
  if ((v58 & 1) == 0)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    objc_msgSend(v3, "allKeys");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v69;
      v51 = *(_QWORD *)v69;
      do
      {
        v27 = 0;
        v52 = v25;
        do
        {
          if (*(_QWORD *)v69 != v26)
            objc_enumerationMutation(v57);
          v28 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v27);
          objc_msgSend(v62, "allKeys");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "containsObject:", v28);

          if ((v30 & 1) == 0)
          {
            objc_msgSend(v54, "objectForKeyedSubscript:", v28);
            v61 = objc_claimAutoreleasedReturnValue();
            +[NTKCompanionAppLibrary sharedAppLibrary](NTKCompanionAppLibrary, "sharedAppLibrary");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = 0u;
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v59 = v31;
            objc_msgSend(v31, "allApps");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v65;
LABEL_29:
              v36 = 0;
              while (1)
              {
                if (*(_QWORD *)v65 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v36);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v38 = v37;
                  objc_msgSend(v38, "complicationClientIdentifier");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "isEqualToString:", v28);

                  if ((v40 & 1) != 0)
                  {

                    v26 = v51;
                    v25 = v52;
                    v41 = (void *)v61;
                    if (!v38)
                      goto LABEL_43;
                    v42 = (void *)MEMORY[0x1E0C94148];
                    objc_msgSend(v38, "supportedFamilies");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "legacyComplicationDescriptorWithSupportedFamilies:", v43);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();

                    v45 = -[NTKCompanionSyncedComplication initWithRemoteApplication:descriptor:]([NTKCompanionSyncedComplication alloc], "initWithRemoteApplication:descriptor:", v61, v44);
                    v82 = v45;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "setObject:forKeyedSubscript:", v46, v28);

                    goto LABEL_42;
                  }

                }
                if (v34 == ++v36)
                {
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
                  if (v34)
                    goto LABEL_29;
                  v38 = v32;
                  v26 = v51;
                  v25 = v52;
                  goto LABEL_41;
                }
              }
            }
            v38 = v32;
LABEL_41:
            v41 = (void *)v61;
LABEL_42:

LABEL_43:
          }
          ++v27;
        }
        while (v27 != v25);
        v25 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
      }
      while (v25);
    }

    v7 = v53;
    v3 = v54;
  }
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v62;
    _os_log_impl(&dword_1B72A3000, v47, OS_LOG_TYPE_DEFAULT, "Complications did change: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&v50->_syncedComplicationsLock);
  v48 = objc_msgSend(v62, "copy");
  syncedComplications = v50->_syncedComplications;
  v50->_syncedComplications = (NSDictionary *)v48;

  os_unfair_lock_unlock(&v50->_syncedComplicationsLock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NTKCompanionRemoteComplicationManager__queue_reloadApps__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = v50;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __58__NTKCompanionRemoteComplicationManager__queue_reloadApps__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKRemoteComplicationProviderComplicationsDidChange"), *(_QWORD *)(a1 + 32));

}

- (void)_reloadApps
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NTKCompanionRemoteComplicationManager__reloadApps__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __52__NTKCompanionRemoteComplicationManager__reloadApps__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchInstalledApps");
}

- (id)_safeComplications
{
  os_unfair_lock_s *p_syncedComplicationsLock;
  NSDictionary *v4;

  p_syncedComplicationsLock = &self->_syncedComplicationsLock;
  os_unfair_lock_lock(&self->_syncedComplicationsLock);
  v4 = self->_syncedComplications;
  os_unfair_lock_unlock(p_syncedComplicationsLock);
  return v4;
}

- (id)_safeInstalledComplications
{
  os_unfair_lock_s *p_installedComplicationsLock;
  NSDictionary *v4;

  p_installedComplicationsLock = &self->_installedComplicationsLock;
  os_unfair_lock_lock(&self->_installedComplicationsLock);
  v4 = self->_installedComplications;
  os_unfair_lock_unlock(p_installedComplicationsLock);
  return v4;
}

- (void)enumerateEnabledVendorsForComplicationFamily:(int64_t)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;
  int64_t v15;

  v6 = a4;
  -[NTKCompanionRemoteComplicationManager _safeComplications](self, "_safeComplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__NTKCompanionRemoteComplicationManager_enumerateEnabledVendorsForComplicationFamily_withBlock___block_invoke;
  aBlock[3] = &unk_1E6BCF878;
  v14 = v6;
  v15 = a3;
  v9 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __96__NTKCompanionRemoteComplicationManager_enumerateEnabledVendorsForComplicationFamily_withBlock___block_invoke_2;
  v11[3] = &unk_1E6BCF8A0;
  v12 = _Block_copy(aBlock);
  v10 = v12;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

}

uint64_t __96__NTKCompanionRemoteComplicationManager_enumerateEnabledVendorsForComplicationFamily_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedFamilies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(a1 + 40);
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if ((v7 & 1) != 0)
      break;
    if ((NTKFallbackComplicationFamilyForFamily(v12, &v12) & 1) == 0)
      goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

LABEL_6:
  return v7;
}

void __96__NTKCompanionRemoteComplicationManager_enumerateEnabledVendorsForComplicationFamily_withBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(v4);
      if (((*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32)) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)itemIdForVendorWithClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NTKCompanionRemoteComplicationManager _safeInstalledComplications](self, "_safeInstalledComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "storeMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)enumerateComplicationDescriptorsForClientIdentifier:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  -[NTKCompanionRemoteComplicationManager _safeComplications](self, "_safeComplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
      v17 = 0;
      objc_msgSend(v15, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v16, &v17);

      if (v17)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateComplicationDescriptorsForClientIdentifier:(id)a3 family:(int64_t)a4 withBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  -[NTKCompanionRemoteComplicationManager _safeComplications](self, "_safeComplications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v16, "descriptor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "supportedFamilies");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "containsObject:", v19);

        if (v20)
        {
          objc_msgSend(v16, "descriptor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v21);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

}

- (void)notifyAppForClientIdentifier:(id)a3 ofSharedComplicationDescriptors:(id)a4 withCompletion:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (BOOL)vendorExistsWithClientIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a4;
  v7 = a3;
  -[NTKCompanionRemoteComplicationManager _safeComplications](self, "_safeComplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v6);

  return v12;
}

- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE *v18;
  _BYTE buf[24];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CLKLoggingObjectForDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Checking if complication is available %@ for families %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v20 = 0;
  objc_msgSend(v6, "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__NTKCompanionRemoteComplicationManager_isComplicationAvailable_forFamilies___block_invoke;
  v15[3] = &unk_1E6BCF8F0;
  v11 = v6;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v18 = buf;
  -[NTKCompanionRemoteComplicationManager enumerateComplicationDescriptorsForClientIdentifier:withBlock:](self, "enumerateComplicationDescriptorsForClientIdentifier:withBlock:", v10, v15);

  v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v13;
}

void __77__NTKCompanionRemoteComplicationManager_isComplicationAvailable_forFamilies___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    objc_msgSend(v5, "supportedFamilies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__NTKCompanionRemoteComplicationManager_isComplicationAvailable_forFamilies___block_invoke_2;
    v9[3] = &unk_1E6BCF8C8;
    v10 = *(id *)(a1 + 40);
    v11 = &v12;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

    if (*((_BYTE *)v13 + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }

    _Block_object_dispose(&v12, 8);
  }

}

uint64_t __77__NTKCompanionRemoteComplicationManager_isComplicationAvailable_forFamilies___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)localizedAppNameForClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NTKCompanionSyncedComplication *v7;
  void *v8;
  void *v9;
  NTKCompanionSyncedComplication *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[NTKCompanionRemoteComplicationManager _safeComplications](self, "_safeComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (NTKCompanionSyncedComplication *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[NTKCompanionRemoteComplicationManager _safeInstalledComplications](self, "_safeInstalledComplications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [NTKCompanionSyncedComplication alloc];
    objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NTKCompanionSyncedComplication initWithRemoteApplication:descriptor:](v10, "initWithRemoteApplication:descriptor:", v9, v11);

  }
  -[NTKCompanionSyncedComplication localizedName](v7, "localizedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (os_unfair_lock_s)remoteComplicationsLock
{
  return self->_remoteComplicationsLock;
}

- (NSDictionary)installedComplications
{
  return self->_installedComplications;
}

- (void)setInstalledComplications:(id)a3
{
  objc_storeStrong((id *)&self->_installedComplications, a3);
}

- (os_unfair_lock_s)installedComplicationsLock
{
  return self->_installedComplicationsLock;
}

- (NSDictionary)syncedComplications
{
  return self->_syncedComplications;
}

- (void)setSyncedComplications:(id)a3
{
  objc_storeStrong((id *)&self->_syncedComplications, a3);
}

- (os_unfair_lock_s)syncedComplicationsLock
{
  return self->_syncedComplicationsLock;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (BOOL)fetchingApps
{
  return self->_fetchingApps;
}

- (void)setFetchingApps:(BOOL)a3
{
  self->_fetchingApps = a3;
}

- (BOOL)wantsAppFetch
{
  return self->_wantsAppFetch;
}

- (void)setWantsAppFetch:(BOOL)a3
{
  self->_wantsAppFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_syncedComplications, 0);
  objc_storeStrong((id *)&self->_installedComplications, 0);
  objc_storeStrong((id *)&self->_remoteComplications, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_17_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, a2, a3, "Could not check restrictions for app with bundleID: %@ - %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't fetch apps on device %@: %@");
  OUTLINED_FUNCTION_1();
}

@end
