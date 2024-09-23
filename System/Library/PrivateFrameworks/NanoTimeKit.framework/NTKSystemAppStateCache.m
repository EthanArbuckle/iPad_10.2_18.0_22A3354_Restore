@implementation NTKSystemAppStateCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1)
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_102);
  return (id)sharedInstance___sharedInstance_4;
}

void __40__NTKSystemAppStateCache_sharedInstance__block_invoke()
{
  NTKSystemAppStateCache *v0;
  void *v1;

  v0 = objc_alloc_init(NTKSystemAppStateCache);
  v1 = (void *)sharedInstance___sharedInstance_4;
  sharedInstance___sharedInstance_4 = (uint64_t)v0;

}

- (NTKSystemAppStateCache)init
{
  NTKSystemAppStateCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  void *v5;
  NSString *tinCanBundleID;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKSystemAppStateCache;
  v2 = -[NTKSystemAppStateCache init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nanotimekit.systemappstatecache.internalqueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", v2);

    tinCanBundleID = v2->_tinCanBundleID;
    v2->_tinCanBundleID = (NSString *)CFSTR("com.apple.facetime");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__tinCanSettingsChanged, CFSTR("NTKCTinCanSettingsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__deviceDidPair, *MEMORY[0x1E0D517C0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("NTKCTinCanSettingsChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D517C0], 0);

  v6.receiver = self;
  v6.super_class = (Class)NTKSystemAppStateCache;
  -[NTKSystemAppStateCache dealloc](&v6, sel_dealloc);
}

- (void)prewarmGizmoDaemon
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NTKSystemAppStateCache_prewarmGizmoDaemon__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __44__NTKSystemAppStateCache_prewarmGizmoDaemon__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_removedSystemApps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_restrictedSystemApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("SystemAppCacheRemovedApps"), CFSTR("com.apple.NanoTimeKit.daemon"));
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = (void *)CFPreferencesCopyAppValue(CFSTR("SystemAppCacheRestrictedApps"), CFSTR("com.apple.NanoTimeKit.daemon"));
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToSet:", v6) & 1) != 0)
  {
    if ((objc_msgSend(v3, "isEqualToSet:", v9) & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "removed system apps changed while daemon was not running, previous set: %@", (uint8_t *)&v13, 0xCu);
    }

    CFPreferencesSetAppValue(CFSTR("SystemAppCacheRemovedApps"), (CFPropertyListRef)objc_msgSend(v2, "allObjects"), CFSTR("com.apple.NanoTimeKit.daemon"));
    if ((objc_msgSend(v3, "isEqualToSet:", v9) & 1) != 0)
      goto LABEL_10;
  }
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "restricted system apps changed while daemon was not running, previous set: %@", (uint8_t *)&v13, 0xCu);
  }

  CFPreferencesSetAppValue(CFSTR("SystemAppCacheRestrictedApps"), (CFPropertyListRef)objc_msgSend(v3, "allObjects"), CFSTR("com.apple.NanoTimeKit.daemon"));
LABEL_10:
  CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit.daemon"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("NTKSystemAppStateChangedWhileDaemonNotRunningNotification"), *(_QWORD *)(a1 + 32));

LABEL_11:
  xpc_set_event_stream_handler("com.apple.distnoted.matching", 0, &__block_literal_global_206);

}

- (BOOL)isRemovedSystemApp:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NTKSystemAppStateCache_isRemovedSystemApp___block_invoke;
  block[3] = &unk_1E6BD5358;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __45__NTKSystemAppStateCache_isRemovedSystemApp___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_cachedAppStateBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_queue_verifyStateForAppBundleId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_removedSystemApps");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isRestrictedSystemApp:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NTKSystemAppStateCache_isRestrictedSystemApp___block_invoke;
  block[3] = &unk_1E6BD5358;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __48__NTKSystemAppStateCache_isRestrictedSystemApp___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_cachedAppStateBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_queue_verifyStateForAppBundleId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_restrictedSystemApps");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (id)restrictedSystemApps
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__NTKSystemAppStateCache_restrictedSystemApps__block_invoke;
  v5[3] = &unk_1E6BD1498;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__NTKSystemAppStateCache_restrictedSystemApps__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_restrictedSystemApps");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)removedSystemApps
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__NTKSystemAppStateCache_removedSystemApps__block_invoke;
  v5[3] = &unk_1E6BD1498;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__NTKSystemAppStateCache_removedSystemApps__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_removedSystemApps");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)applicationStateDidChange:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__NTKSystemAppStateCache_applicationStateDidChange___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __52__NTKSystemAppStateCache_applicationStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:state:", *(_QWORD *)(a1 + 40), 2);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__NTKSystemAppStateCache_applicationsDidInstall___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __49__NTKSystemAppStateCache_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:state:", *(_QWORD *)(a1 + 40), 0);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__NTKSystemAppStateCache_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __51__NTKSystemAppStateCache_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:state:", *(_QWORD *)(a1 + 40), 1);
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__NTKSystemAppStateCache_applicationInstallsDidStart___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __54__NTKSystemAppStateCache_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:state:", *(_QWORD *)(a1 + 40), 3);
}

- (void)_tinCanSettingsChanged
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NTKSystemAppStateCache__tinCanSettingsChanged__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __48__NTKSystemAppStateCache__tinCanSettingsChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_tinCanSettingsChanged");
}

- (void)_deviceDidPair
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NTKSystemAppStateCache__deviceDidPair__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __40__NTKSystemAppStateCache__deviceDidPair__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deviceDidPair");
}

- (void)_queue_initializeRestrictedSystemApps
{
  NSMutableSet *v3;
  NSMutableSet *restrictedSystemApps;
  void *v5;
  void *v6;
  NSObject *v7;
  NSMutableSet *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  NSMutableSet *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableSet *)objc_opt_new();
  restrictedSystemApps = self->_restrictedSystemApps;
  self->_restrictedSystemApps = v3;

  NTKBundleIDToComplicationTypesMappingForGloryDevices();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__NTKSystemAppStateCache__queue_initializeRestrictedSystemApps__block_invoke;
  v9[3] = &unk_1E6BCD930;
  v9[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_restrictedSystemApps;
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "restricted system app set initialized: %@", buf, 0xCu);
  }

}

uint64_t __63__NTKSystemAppStateCache__queue_initializeRestrictedSystemApps__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_verifyStateForAppBundleId:", a2);
}

- (void)_queue_initializeRemovedSystemApps
{
  NSMutableSet *v3;
  NSMutableSet *removedSystemApps;
  void *v5;
  void *v6;
  NSObject *v7;
  NSMutableSet *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  NSMutableSet *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableSet *)objc_opt_new();
  removedSystemApps = self->_removedSystemApps;
  self->_removedSystemApps = v3;

  NTKBundleIDToComplicationTypesMappingForGloryDevices();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__NTKSystemAppStateCache__queue_initializeRemovedSystemApps__block_invoke;
  v9[3] = &unk_1E6BCD930;
  v9[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_removedSystemApps;
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "removed system app set initialized: %@", buf, 0xCu);
  }

}

void __60__NTKSystemAppStateCache__queue_initializeRemovedSystemApps__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Health")))
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB67B0], "isElectrocardiogramSupportedOnActiveWatch");
    v4 = v7;
    if ((v3 & 1) != 0)
      goto LABEL_9;
    goto LABEL_6;
  }
  if (!objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_verifyStateForAppBundleId:", v7);
    goto LABEL_8;
  }
  +[NTKCTinCanSettings sharedInstance](NTKCTinCanSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tinCanEnabled");

  v4 = v7;
  if ((v6 & 1) == 0)
  {
LABEL_6:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v7);
LABEL_8:
    v4 = v7;
  }
LABEL_9:

}

- (void)_queue_verifyStateForAppBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKSystemAppStateCache _queue_cachedAppStateBundleId](self, "_queue_cachedAppStateBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  v18 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v18);
  v7 = v18;
  if (v6)
  {
    objc_msgSend(v6, "applicationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInstalled");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "applicationState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isPlaceholder");

      _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if ((v11 & 1) != 0)
      {
        if (v13)
        {
          *(_DWORD *)buf = 138412290;
          v20 = v4;
          _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "found placeholder for system app (%@)", buf, 0xCu);
        }

      }
      else
      {
        if (v13)
        {
          *(_DWORD *)buf = 138412290;
          v20 = v4;
          _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "system app (%@) is not installed", buf, 0xCu);
        }

        -[NSMutableSet addObject:](self->_removedSystemApps, "addObject:", v4);
      }
    }
    objc_msgSend(v6, "applicationState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isRestricted");

    if (v16)
    {
      -[NSMutableSet addObject:](self->_restrictedSystemApps, "addObject:", v4);
      _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "system app (%@) is restricted", buf, 0xCu);
      }

    }
  }
  else
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "system app (%@) does not have a record", buf, 0xCu);
    }

    -[NSMutableSet addObject:](self->_removedSystemApps, "addObject:", v4);
  }

}

- (void)_queue_applicationsDidChange:(id)a3 state:(unint64_t)a4
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  NSObject *v35;
  __int128 v36;
  id obj;
  _QWORD block[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v6)
    goto LABEL_37;
  v8 = v6;
  v9 = 0;
  v10 = *(_QWORD *)v40;
  *(_QWORD *)&v7 = 138412290;
  v36 = v7;
LABEL_3:
  v11 = 0;
  while (2)
  {
    if (*(_QWORD *)v40 != v10)
      objc_enumerationMutation(obj);
    v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
    objc_msgSend(v12, "applicationIdentifier", v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a4)
    {
      case 0uLL:
        -[NTKSystemAppStateCache _queue_removedSystemApps](self, "_queue_removedSystemApps");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v13);

        if (v15)
        {
          -[NTKSystemAppStateCache _queue_removedSystemApps](self, "_queue_removedSystemApps");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObject:", v13);

          _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_31;
          *(_DWORD *)buf = v36;
          v44 = v13;
          v18 = v17;
          v19 = "system app (%@) was installed";
          goto LABEL_30;
        }
        goto LABEL_33;
      case 1uLL:
        -[NTKSystemAppStateCache _queue_removedSystemApps](self, "_queue_removedSystemApps");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "containsObject:", v13);

        if ((v26 & 1) == 0)
        {
          -[NTKSystemAppStateCache _queue_removedSystemApps](self, "_queue_removedSystemApps");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v13);

          _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_31;
          *(_DWORD *)buf = v36;
          v44 = v13;
          v18 = v17;
          v19 = "system app (%@) was uninstalled";
          goto LABEL_30;
        }
        goto LABEL_33;
      case 2uLL:
        objc_msgSend(v12, "appState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isRestricted");

        -[NTKSystemAppStateCache _queue_restrictedSystemApps](self, "_queue_restrictedSystemApps");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsObject:", v13);

        if (v21)
        {
          if ((v23 & 1) == 0)
          {
            -[NTKSystemAppStateCache _queue_restrictedSystemApps](self, "_queue_restrictedSystemApps");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v13);

            _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_31;
            *(_DWORD *)buf = v36;
            v44 = v13;
            v18 = v17;
            v19 = "system app (%@) restricted";
            goto LABEL_30;
          }
        }
        else if (v23)
        {
          -[NTKSystemAppStateCache _queue_restrictedSystemApps](self, "_queue_restrictedSystemApps");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "removeObject:", v13);

          _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_31;
          *(_DWORD *)buf = v36;
          v44 = v13;
          v18 = v17;
          v19 = "system app (%@) un-restricted";
          goto LABEL_30;
        }
        goto LABEL_33;
      case 3uLL:
        -[NTKSystemAppStateCache _queue_removedSystemApps](self, "_queue_removedSystemApps");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "containsObject:", v13);

        if (v29)
        {
          -[NTKSystemAppStateCache _queue_removedSystemApps](self, "_queue_removedSystemApps");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "removeObject:", v13);

        }
        -[NTKSystemAppStateCache _queue_restrictedSystemApps](self, "_queue_restrictedSystemApps");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "containsObject:", v13);

        if (v32)
        {
          -[NTKSystemAppStateCache _queue_restrictedSystemApps](self, "_queue_restrictedSystemApps");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeObject:", v13);

        }
        else if (!v29)
        {
          _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v36;
            v44 = v13;
            v18 = v17;
            v19 = "system app (%@) install started";
LABEL_30:
            _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          }
LABEL_31:

          goto LABEL_32;
        }
        _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v36;
          v44 = v13;
          _os_log_impl(&dword_1B72A3000, v35, OS_LOG_TYPE_DEFAULT, "system app (%@) install started and was previously removed or restricted, re-evaluating", buf, 0xCu);
        }

        -[NTKSystemAppStateCache _queue_verifyStateForAppBundleId:](self, "_queue_verifyStateForAppBundleId:", v13);
LABEL_32:
        v9 = 1;
        goto LABEL_33;
      default:
LABEL_33:

        if (v8 != ++v11)
          continue;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v8)
          goto LABEL_3;
        if ((v9 & 1) != 0)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __61__NTKSystemAppStateCache__queue_applicationsDidChange_state___block_invoke;
          block[3] = &unk_1E6BCD5F0;
          block[4] = self;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
LABEL_37:

        return;
    }
  }
}

void __61__NTKSystemAppStateCache__queue_applicationsDidChange_state___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKSystemAppStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_queue_tinCanSettingsChanged
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  _QWORD block[5];

  +[NTKCTinCanSettings sharedInstance](NTKCTinCanSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tinCanEnabled");

  -[NTKSystemAppStateCache _queue_removedSystemApps](self, "_queue_removedSystemApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", self->_tinCanBundleID);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v5, "removeObject:", self->_tinCanBundleID);
LABEL_6:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__NTKSystemAppStateCache__queue_tinCanSettingsChanged__block_invoke;
      block[3] = &unk_1E6BCD5F0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else if ((v6 & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", self->_tinCanBundleID);
    goto LABEL_6;
  }

}

void __54__NTKSystemAppStateCache__queue_tinCanSettingsChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKSystemAppStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_queue_deviceDidPair
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB67B0], "isElectrocardiogramSupportedOnActiveWatch")
    && -[NSMutableSet containsObject:](self->_removedSystemApps, "containsObject:", CFSTR("com.apple.Health")))
  {
    -[NSMutableSet removeObject:](self->_removedSystemApps, "removeObject:", CFSTR("com.apple.Health"));
LABEL_7:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__NTKSystemAppStateCache__queue_deviceDidPair__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    return;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB67B0], "isElectrocardiogramSupportedOnActiveWatch") & 1) == 0
    && (-[NSMutableSet containsObject:](self->_removedSystemApps, "containsObject:", CFSTR("com.apple.Health")) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_removedSystemApps, "addObject:", CFSTR("com.apple.Health"));
    goto LABEL_7;
  }
}

void __46__NTKSystemAppStateCache__queue_deviceDidPair__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKSystemAppStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (id)_queue_removedSystemApps
{
  NSMutableSet *removedSystemApps;

  removedSystemApps = self->_removedSystemApps;
  if (!removedSystemApps)
  {
    -[NTKSystemAppStateCache _queue_initializeRemovedSystemApps](self, "_queue_initializeRemovedSystemApps");
    removedSystemApps = self->_removedSystemApps;
  }
  return removedSystemApps;
}

- (id)_queue_cachedAppStateBundleId
{
  NSMutableSet *cachedAppStateBundleId;
  NSMutableSet *v4;
  NSMutableSet *v5;

  cachedAppStateBundleId = self->_cachedAppStateBundleId;
  if (!cachedAppStateBundleId)
  {
    v4 = (NSMutableSet *)objc_opt_new();
    v5 = self->_cachedAppStateBundleId;
    self->_cachedAppStateBundleId = v4;

    cachedAppStateBundleId = self->_cachedAppStateBundleId;
  }
  return cachedAppStateBundleId;
}

- (id)_queue_restrictedSystemApps
{
  NSMutableSet *restrictedSystemApps;

  restrictedSystemApps = self->_restrictedSystemApps;
  if (!restrictedSystemApps)
  {
    -[NTKSystemAppStateCache _queue_initializeRestrictedSystemApps](self, "_queue_initializeRestrictedSystemApps");
    restrictedSystemApps = self->_restrictedSystemApps;
  }
  return restrictedSystemApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tinCanBundleID, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_cachedAppStateBundleId, 0);
  objc_storeStrong((id *)&self->_removedSystemApps, 0);
  objc_storeStrong((id *)&self->_restrictedSystemApps, 0);
}

@end
