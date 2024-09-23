@implementation NTKGreenfieldCompanionAppInstallationMonitor

- (void)start
{
  void *v3;
  void *v4;
  NTKFaceCollection *v5;
  NTKFaceCollection *library;
  NSObject *v7;
  uint8_t v8[16];

  if (!self->_isRunning)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKCompanionFaceCollectionsManager sharedInstance](NTKCompanionFaceCollectionsManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedFaceCollectionForDevice:forCollectionIdentifier:", v3, CFSTR("LibraryFaces"));
    v5 = (NTKFaceCollection *)objc_claimAutoreleasedReturnValue();
    library = self->_library;
    self->_library = v5;

    if (-[NTKFaceCollection hasLoaded](self->_library, "hasLoaded"))
      -[NTKGreenfieldCompanionAppInstallationMonitor _toggleObserving](self, "_toggleObserving");
    else
      -[NTKFaceCollection addObserver:](self->_library, "addObserver:", self);
    self->_isRunning = 1;
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: started", v8, 2u);
    }

  }
}

void __61__NTKGreenfieldCompanionAppInstallationMonitor_sharedMonitor__block_invoke()
{
  NTKGreenfieldCompanionAppInstallationMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(NTKGreenfieldCompanionAppInstallationMonitor);
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v0;

}

- (NTKGreenfieldCompanionAppInstallationMonitor)init
{
  NTKGreenfieldCompanionAppInstallationMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldCompanionAppInstallationMonitor;
  v2 = -[NTKGreenfieldCompanionAppInstallationMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nanotimekit.NTKGreenfieldCompanionAppInstallationMonitor", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_58);
  return (id)sharedMonitor_monitor;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  -[NTKFaceCollection removeObserver:](self->_library, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)NTKGreenfieldCompanionAppInstallationMonitor;
  -[NTKGreenfieldCompanionAppInstallationMonitor dealloc](&v5, sel_dealloc);
}

- (void)fetchInstalledAppsOnWatchWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke;
  block[3] = &unk_1E6BCDF60;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);

}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  _QWORD *v36;
  uint64_t *v37;
  _QWORD block[4];
  id v39;
  uint64_t *v40;
  _QWORD v41[4];
  NSObject *v42;
  uint64_t *v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__23;
  v58 = __Block_byref_object_dispose__23;
  v59 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__23;
  v52[4] = __Block_byref_object_dispose__23;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__23;
  v50 = __Block_byref_object_dispose__23;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nrDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10;
  v41[3] = &unk_1E6BD29A8;
  v7 = v5;
  v42 = v7;
  v43 = &v54;
  v44 = v52;
  v45 = &v46;
  objc_msgSend(v4, "enumerateInstalledApplicationsOnPairedDevice:withBlock:", v3, v41);
  v8 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v7, v8);
  if (!v55[5])
  {
    if (objc_msgSend((id)v47[5], "count"))
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v47[5];
        *(_DWORD *)buf = 138412290;
        v61 = v11;
        _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "(NTKGreenfieldCompanionAppInstallationMonitor) Started SAD ItemID lookup %@:", buf, 0xCu);
      }

      v12 = dispatch_semaphore_create(0);
      v13 = (void *)MEMORY[0x1E0CF9CA0];
      objc_msgSend((id)v47[5], "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v6;
      v33[1] = 3221225472;
      v33[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_14;
      v33[3] = &unk_1E6BD29D0;
      v35 = &v54;
      v36 = v52;
      v37 = &v46;
      v7 = v12;
      v34 = v7;
      objc_msgSend(v13, "lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:withResultHandler:", v14, v33);

      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
      if (v55[5])
      {
        v30[0] = v6;
        v30[1] = 3221225472;
        v30[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_16;
        v30[3] = &unk_1E6BD1738;
        v31 = *(id *)(a1 + 32);
        v32 = &v54;
        dispatch_async(MEMORY[0x1E0C80D38], v30);

        v9 = v34;
        goto LABEL_3;
      }

    }
    if (objc_msgSend((id)v47[5], "count"))
    {
      v15 = dispatch_semaphore_create(0);

      v16 = (void *)MEMORY[0x1E0CF9CA8];
      objc_msgSend((id)v47[5], "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queryForBundleIDs:", v17);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v26[0] = v6;
      v26[1] = 3221225472;
      v26[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_2;
      v26[3] = &unk_1E6BD29F8;
      v28 = &v54;
      v29 = v52;
      v7 = v15;
      v27 = v7;
      objc_msgSend(v9, "executeQueryWithResultHandler:", v26);
      v18 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v7, v18);
      if (v55[5])
      {
        v23[0] = v6;
        v23[1] = 3221225472;
        v23[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_3;
        v23[3] = &unk_1E6BD1738;
        v24 = *(id *)(a1 + 32);
        v25 = &v54;
        dispatch_async(MEMORY[0x1E0C80D38], v23);

        goto LABEL_3;
      }

    }
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_4;
    v19[3] = &unk_1E6BD2A20;
    v20 = *(id *)(a1 + 32);
    v21 = v52;
    v22 = &v46;
    dispatch_async(MEMORY[0x1E0C80D38], v19);
    v9 = v20;
    goto LABEL_3;
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_12;
  block[3] = &unk_1E6BD1738;
  v39 = *(id *)(a1 + 32);
  v40 = &v54;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v9 = v39;
LABEL_3:

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10_cold_1();

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
      goto LABEL_6;
    }
    objc_msgSend((id)v5, "storeMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v12);
LABEL_15:

      v9 = 1;
      goto LABEL_7;
    }
    objc_msgSend((id)v5, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend((id)v5, "bundleIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)v5, "companionAppBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_15;
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend((id)v5, "companionAppBundleID");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v15;
    objc_msgSend(v14, "addObject:", v15);

    goto LABEL_15;
  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v9 = 0;
LABEL_7:

  return v9;
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_14_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = v6;
    v17 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v5;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "(NTKGreenfieldCompanionAppInstallationMonitor) Completed SAD ItemID lookup finished with result %@:", buf, 0xCu);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "allKeys", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v23);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObject:", v22);
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "storeItemID") >= 1)
          {
            v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "storeItemID"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v13);

          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0);
}

- (void)handleAddFaceManagerDidUpdateFaceLibrary
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[NTKFaceCollection hasLoaded](self->_library, "hasLoaded"))
    -[NTKGreenfieldCompanionAppInstallationMonitor _toggleObserving](self, "_toggleObserving");
}

- (void)_toggleObserving
{
  __assert_rtn("-[NTKGreenfieldCompanionAppInstallationMonitor _toggleObserving]", "NTKGreenfieldCompanionAppInstallationMonitor.m", 214, "[_library hasLoaded]");
}

- (void)_reloadInstallingAppsOnPhoneAndWatch
{
  void *v3;
  NSObject *serialQueue;
  id v5;
  _QWORD v6[5];
  id v7;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NTKGreenfieldCompanionAppInstallationMonitor _existingPlaceholderItemIds](self, "_existingPlaceholderItemIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__NTKGreenfieldCompanionAppInstallationMonitor__reloadInstallingAppsOnPhoneAndWatch__block_invoke;
  v6[3] = &unk_1E6BCD778;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(serialQueue, v6);

}

void __84__NTKGreenfieldCompanionAppInstallationMonitor__reloadInstallingAppsOnPhoneAndWatch__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__NTKGreenfieldCompanionAppInstallationMonitor__reloadInstallingAppsOnPhoneAndWatch__block_invoke_2;
  v4[3] = &unk_1E6BCD778;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __84__NTKGreenfieldCompanionAppInstallationMonitor__reloadInstallingAppsOnPhoneAndWatch__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePlaceholderComplicationWithItemIds:", *(_QWORD *)(a1 + 40));
}

- (id)_queue_fetchInstalledWatchAppsItemIds
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __85__NTKGreenfieldCompanionAppInstallationMonitor__queue_fetchInstalledWatchAppsItemIds__block_invoke;
  v11 = &unk_1E6BD2A48;
  v13 = &v14;
  v4 = v3;
  v12 = v4;
  -[NTKGreenfieldCompanionAppInstallationMonitor fetchInstalledAppsOnWatchWithCompletionBlock:](self, "fetchInstalledAppsOnWatchWithCompletionBlock:", &v8);
  v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = (void *)objc_msgSend((id)v15[5], "copy", v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __85__NTKGreenfieldCompanionAppInstallationMonitor__queue_fetchInstalledWatchAppsItemIds__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_queue_fetchNotInstalledWatchAppStatus
{
  void *v2;
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *, void *);
  void *v15;
  dispatch_semaphore_t v16;
  id v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nrDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __86__NTKGreenfieldCompanionAppInstallationMonitor__queue_fetchNotInstalledWatchAppStatus__block_invoke;
  v15 = &unk_1E6BD2A70;
  v16 = v4;
  v17 = v2;
  v7 = v2;
  v8 = v4;
  objc_msgSend(v3, "enumerateLocallyAvailableApplicationsForPairedDevice:options:withBlock:", v6, 1, &v12);
  v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  v10 = (void *)objc_msgSend(v7, "copy", v12, v13, v14, v15);

  return v10;
}

uint64_t __86__NTKGreenfieldCompanionAppInstallationMonitor__queue_fetchNotInstalledWatchAppStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (v6)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10_cold_1();

    goto LABEL_7;
  }
  objc_msgSend((id)v5, "storeMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend((id)v5, "deviceStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v12);

  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (id)_queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  __int128 v27;
  id obj;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NTKGreenfieldCompanionAppInstallationMonitor _queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  -[NTKGreenfieldCompanionAppInstallationMonitor _queue_fetchInstalledWatchAppsItemIds](self, "_queue_fetchInstalledWatchAppsItemIds");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldCompanionAppInstallationMonitor _queue_fetchNotInstalledWatchAppStatus](self, "_queue_fetchNotInstalledWatchAppStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v32;
    *(_QWORD *)&v14 = 138412802;
    v27 = v14;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v17);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithStoreItemIdentifier:error:", objc_msgSend(v18, "unsignedLongLongValue"), 0);
        objc_msgSend(v19, "applicationState");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v30, "containsObject:", v18);
        objc_msgSend(v12, "objectForKeyedSubscript:", v18);
        v22 = objc_claimAutoreleasedReturnValue();
        _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v27;
          v36 = v20;
          v37 = 1024;
          v38 = v21;
          v39 = 2112;
          v40 = v22;
          _os_log_impl(&dword_1B72A3000, v23, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: enumerateInstalledApplicationsOnPairedDevice: decision time:\n\t[phoneAppState=%@]\n\t[installedOnWatch=%d]\n\t[watchAppStatus=%@\n", buf, 0x1Cu);
        }

        if ((v21 & 1) != 0
          || !(v20 | v22)
          || v22 && (v24 = objc_msgSend((id)v22, "installStatus"), v24 <= 4) && v24 != 1)
        {
          objc_msgSend(v29, "addObject:", v18, v27);
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v15);
  }

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = (uint64_t)v29;
    _os_log_impl(&dword_1B72A3000, v25, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: calculated removal ids: %@", buf, 0xCu);
  }

  return v29;
}

- (id)_existingPlaceholderItemIds
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!-[NTKFaceCollection hasLoaded](self->_library, "hasLoaded"))
    -[NTKGreenfieldCompanionAppInstallationMonitor _existingPlaceholderItemIds].cold.1();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKFaceCollection numberOfFaces](self->_library, "numberOfFaces"))
  {
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      -[NTKFaceCollection faceAtIndex:](self->_library, "faceAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __75__NTKGreenfieldCompanionAppInstallationMonitor__existingPlaceholderItemIds__block_invoke;
      v10[3] = &unk_1E6BCF4C8;
      v11 = v6;
      v12 = v3;
      v7 = v6;
      objc_msgSend(v7, "enumerateComplicationSlotsWithBlock:", v10);

      ++v4;
    }
    while (-[NTKFaceCollection numberOfFaces](self->_library, "numberOfFaces") > v4);
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

void __75__NTKGreenfieldCompanionAppInstallationMonitor__existingPlaceholderItemIds__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "appStoreItemId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

- (void)_removePlaceholderComplicationWithItemIds:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!-[NTKFaceCollection hasLoaded](self->_library, "hasLoaded"))
    -[NTKGreenfieldCompanionAppInstallationMonitor _removePlaceholderComplicationWithItemIds:].cold.1();
  v5 = -[NTKFaceCollection numberOfFaces](self->_library, "numberOfFaces");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = 0;
    do
    {
      -[NTKFaceCollection faceAtIndex:](self->_library, "faceAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __90__NTKGreenfieldCompanionAppInstallationMonitor__removePlaceholderComplicationWithItemIds___block_invoke;
      v12[3] = &unk_1E6BD1360;
      v9 = v8;
      v13 = v9;
      v14 = v4;
      v15 = &v16;
      objc_msgSend(v9, "enumerateComplicationSlotsWithBlock:", v12);
      if (*((_BYTE *)v17 + 24))
        objc_msgSend(v9, "_updateComplicationTombstones");

      _Block_object_dispose(&v16, 8);
      ++v7;
    }
    while (-[NTKFaceCollection numberOfFaces](self->_library, "numberOfFaces") > v7);
  }
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __90__NTKGreenfieldCompanionAppInstallationMonitor__removePlaceholderComplicationWithItemIds___block_invoke_29;
  v11[3] = &unk_1E6BCD5F0;
  v11[4] = self;
  v10 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __90__NTKGreenfieldCompanionAppInstallationMonitor__removePlaceholderComplicationWithItemIds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "appStoreItemId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6))
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: _removePlaceholderComplicationWithItemIds: need to remove: slot:%@ itemId: %@ ", (uint8_t *)&v10, 0x16u);
      }

      objc_msgSend(v5, "complication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKComplicationTombstone tombstoneWithComplication:](NTKComplicationTombstone, "tombstoneWithComplication:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", v9, v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

    }
  }

}

uint64_t __90__NTKGreenfieldCompanionAppInstallationMonitor__removePlaceholderComplicationWithItemIds___block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_toggleObserving");
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: applicationInstallsDidStart: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__NTKGreenfieldCompanionAppInstallationMonitor_applicationInstallsDidStart___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __76__NTKGreenfieldCompanionAppInstallationMonitor_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadInstallingAppsOnPhoneAndWatch");
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: applicationsDidInstall: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NTKGreenfieldCompanionAppInstallationMonitor_applicationsDidInstall___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __71__NTKGreenfieldCompanionAppInstallationMonitor_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadInstallingAppsOnPhoneAndWatch");
}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: applicationsDidFailToInstall: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__NTKGreenfieldCompanionAppInstallationMonitor_applicationsDidFailToInstall___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __77__NTKGreenfieldCompanionAppInstallationMonitor_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadInstallingAppsOnPhoneAndWatch");
}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: applicationInstallsDidCancel: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__NTKGreenfieldCompanionAppInstallationMonitor_applicationInstallsDidCancel___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __77__NTKGreenfieldCompanionAppInstallationMonitor_applicationInstallsDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadInstallingAppsOnPhoneAndWatch");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "NTKGreenfieldCompanionAppInstallationMonitor: enumerateInstalledApplicationsOnPairedDevice: exiting loop, error: %@, app: %@");
  OUTLINED_FUNCTION_1();
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_14_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "(NTKGreenfieldCompanionAppInstallationMonitor) Completed SAD ItemID lookup finished with error %@:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "NTKGreenfieldCompanionAppInstallationMonitor: _queue_updateWithExistingPlaceholderIds: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_existingPlaceholderItemIds
{
  __assert_rtn("-[NTKGreenfieldCompanionAppInstallationMonitor _existingPlaceholderItemIds]", "NTKGreenfieldCompanionAppInstallationMonitor.m", 360, "[_library hasLoaded]");
}

- (void)_removePlaceholderComplicationWithItemIds:.cold.1()
{
  __assert_rtn("-[NTKGreenfieldCompanionAppInstallationMonitor _removePlaceholderComplicationWithItemIds:]", "NTKGreenfieldCompanionAppInstallationMonitor.m", 383, "[_library hasLoaded]");
}

@end
