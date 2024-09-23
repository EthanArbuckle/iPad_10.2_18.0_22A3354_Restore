@implementation ATDeviceSettings

- (ATDeviceSettings)init
{
  ATDeviceSettings *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSUserDefaults *userDefaults;
  objc_class *v8;
  const char *Name;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATDeviceSettings;
  v2 = -[ATDeviceSettings init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.atc"));

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.atc"));
    }
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v6;

    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    v10 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (void)synchronize
{
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
}

- (BOOL)isDeviceLinkClient
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("IsDeviceClient"));
}

- (NSString)libraryIdentifier
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
  v9 = __Block_byref_object_copy__3147;
  v10 = __Block_byref_object_dispose__3148;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ATDeviceSettings_libraryIdentifier__block_invoke;
  v5[3] = &unk_1E927D590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)hasCompletedDataMigration
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("DataMigrated"));
}

- (int)activeRestoreType
{
  return -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("RestoreType"));
}

- (NSString)serviceName
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("ServiceName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = CFSTR("com.apple.private.alloy.airtraffic");

  return (NSString *)v4;
}

- (NSString)serviceDomain
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("ServiceDomain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = CFSTR("local");

  return (NSString *)v4;
}

- (NSString)serviceType
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("ServiceType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = CFSTR("_atc2._tcp");

  return (NSString *)v4;
}

- (NSString)interfaceName
{
  return -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("InterfaceName"));
}

- (id)endpointInfo
{
  return -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("EndpointInfo"));
}

- (void)setEndpointInfo:(id)a3
{
  NSUserDefaults *userDefaults;

  userDefaults = self->_userDefaults;
  if (a3)
    -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", a3, CFSTR("EndpointInfo"));
  else
    -[NSUserDefaults removeObjectForKey:](userDefaults, "removeObjectForKey:", CFSTR("EndpointInfo"));
}

- (void)removeEndpointInfoForLibrary:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  ATDeviceSettings *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ATDeviceSettings_removeEndpointInfoForLibrary___block_invoke;
  block[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)setSyncPending:(BOOL)a3 forDataClass:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ATDeviceSettings_setSyncPending_forDataClass___block_invoke;
  block[3] = &unk_1E927DA28;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(queue, block);

}

- (void)removePendingSyncSettingForDataClass:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  ATDeviceSettings *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ATDeviceSettings_removePendingSyncSettingForDataClass___block_invoke;
  block[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (BOOL)isSyncPendingForDataClass:(id)a3
{
  id v4;
  NSObject *queue;
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
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ATDeviceSettings_isSyncPendingForDataClass___block_invoke;
  block[3] = &unk_1E927E170;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (NSArray)dataClassesNeedingSync
{
  return (NSArray *)-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("DataClassesNeedingSync"));
}

- (double)pairingSyncCompletionTime
{
  void *v2;
  double v3;
  double v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("PairingSyncCompletionTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)lastAuthenticationDialogResponseTime
{
  void *v2;
  double v3;
  double v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ATDeviceSettingLastAuthenticationDialogResponseTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setLastAuthenticationDialogResponseTime:(double)a3
{
  NSUserDefaults *userDefaults;
  id v4;

  userDefaults = self->_userDefaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v4, CFSTR("ATDeviceSettingLastAuthenticationDialogResponseTime"));

}

- (BOOL)fairPlayEnabled
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("FairPlayEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 || -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("FairPlayEnabled"));
}

- (BOOL)grappaEnabled
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("GrappaEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 || -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("GrappaEnabled"));
}

- (BOOL)restoreBatchingEnabled
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("RestoreBatchingEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 || -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("RestoreBatchingEnabled"));
}

- (unint64_t)restoreBatchSize
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("RestoreBatchSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("RestoreBatchSize"));
  else
    return 20;
}

- (BOOL)useNewDownloadService
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("UseNewDownloadService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 || -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("UseNewDownloadService"));
}

- (BOOL)watchProxyDownloadsDisabled
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("WatchProxyDownloadsDisabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 && -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("WatchProxyDownloadsDisabled"));
}

- (void)setHasCompletedDataMigration:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "setting setHasCompletedDataMigration to %d", (uint8_t *)v6, 8u);
  }

  CFPreferencesSetAppValue(CFSTR("DataMigrated"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("com.apple.atc"));
  CFPreferencesSynchronize(CFSTR("com.apple.atc"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("ATHasCompletedMigrationNotificationName"), 0, 0, 1u);
}

- (void)setActiveRestoreType:(int)a3
{
  CFPreferencesSetAppValue(CFSTR("RestoreType"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3), CFSTR("com.apple.atc"));
  CFPreferencesSynchronize(CFSTR("com.apple.atc"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)setCurrentInstallDisposition:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "setting current installConfig info to %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("ATDeviceSettingCurrentInstallDisposition"));
}

- (id)getCurrentInstallDisposition
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v8;
  NSObject *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ATDeviceSettingCurrentInstallDisposition"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = _NSIsNSDictionary();
    _ATLogCategoryFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v8 = 138543362;
        v9 = v3;
        _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEBUG, "returning current installConfig=%{public}@", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "removing invalid current installConfig info", (uint8_t *)&v8, 2u);
      }

      -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", CFSTR("ATDeviceSettingCurrentInstallDisposition"));
      v6 = v3;
      v3 = 0;
    }

  }
  return v3;
}

- (void)setPreExistingStoreIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (v8)
    {
      -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v5, CFSTR("ATDeviceSettingPreExistingStoreAccountIDs"));
    }
    else
    {
      _ATLogCategorySyncBundle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v7;
        _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "Could not serialize known store identifiers. error=%{public}@", buf, 0xCu);
      }

    }
  }

}

- (id)getPreExistingStoreIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ATDeviceSettingPreExistingStoreAccountIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (_NSIsNSData())
    {
      v4 = (void *)MEMORY[0x1E0CB3710];
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = objc_opt_class();
      objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    _ATLogCategoryFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "removing invalid current preExistingStoreIdentifiers", buf, 2u);
    }

    -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", CFSTR("ATDeviceSettingPreExistingStoreAccountIDs"));
  }
  v8 = 0;
LABEL_8:
  _ATLogCategoryFramework();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEBUG, "preExistingStoreIdentifiers=%{public}@", buf, 0xCu);
  }

  return v8;
}

- (id)syncStateForLibrary:(id)a3 dataClass:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3147;
  v21 = __Block_byref_object_dispose__3148;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__ATDeviceSettings_syncStateForLibrary_dataClass___block_invoke;
  v13[3] = &unk_1E927D5B8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)setSyncState:(id)a3 forLibrary:(id)a4 dataClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  ATDeviceSettings *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ATDeviceSettings_setSyncState_forLibrary_dataClass___block_invoke;
  block[3] = &unk_1E927D688;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);

}

- (id)hostInfoForLibrary:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3147;
  v16 = __Block_byref_object_dispose__3148;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ATDeviceSettings_hostInfoForLibrary___block_invoke;
  block[3] = &unk_1E927E170;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setHostInfo:(id)a3 forLibrary:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ATDeviceSettings_setHostInfo_forLibrary___block_invoke;
  block[3] = &unk_1E927E198;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

- (id)lastSyncTimeForLibrary:(id)a3 dataClass:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3147;
  v21 = __Block_byref_object_dispose__3148;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__ATDeviceSettings_lastSyncTimeForLibrary_dataClass___block_invoke;
  v13[3] = &unk_1E927D5B8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)updateLastSyncTimeForLibrary:(id)a3 dataClass:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ATDeviceSettings_updateLastSyncTimeForLibrary_dataClass___block_invoke;
  block[3] = &unk_1E927E198;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)setPairingSyncCompletionTime:(double)a3
{
  NSUserDefaults *userDefaults;
  id v4;

  userDefaults = self->_userDefaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v4, CFSTR("PairingSyncCompletionTime"));

}

- (void)setVersion:(unint64_t)a3 forDataclass:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ATDeviceSettings_setVersion_forDataclass___block_invoke;
  block[3] = &unk_1E927DAC8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(queue, block);

}

- (unint64_t)versionForDataclass:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ATDeviceSettings_versionForDataclass___block_invoke;
  block[3] = &unk_1E927E170;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_endpointInfoForLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATDeviceSettings endpointInfo](self, "endpointInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setEndpointInfo:(id)a3 forLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ATDeviceSettings endpointInfo](self, "endpointInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setValue:forKey:", v9, v6);
  -[ATDeviceSettings setEndpointInfo:](self, "setEndpointInfo:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

void __40__ATDeviceSettings_versionForDataclass___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", CFSTR("DataclassVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, "objectForKey:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "unsignedIntegerValue");

    v2 = v4;
  }

}

void __44__ATDeviceSettings_setVersion_forDataclass___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", CFSTR("DataclassVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, a1[5]);

  objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", v4, CFSTR("DataclassVersion"));
}

void __59__ATDeviceSettings_updateLastSyncTimeForLibrary_dataClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_endpointInfoForLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("LastSyncTimes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("LastSyncTimes"));
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "_setEndpointInfo:forLibrary:", v6, *(_QWORD *)(a1 + 40));
}

void __53__ATDeviceSettings_lastSyncTimeForLibrary_dataClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_endpointInfoForLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("LastSyncTimes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "valueForKey:", *(_QWORD *)(a1 + 48));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    v3 = v9;
  }

}

void __43__ATDeviceSettings_setHostInfo_forLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_endpointInfoForLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("HostInfo"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("HostInfo"));
  objc_msgSend(*(id *)(a1 + 32), "_setEndpointInfo:forLibrary:", v6, *(_QWORD *)(a1 + 40));

}

void __39__ATDeviceSettings_hostInfoForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_endpointInfoForLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v3;
  objc_msgSend(v3, "objectForKey:", CFSTR("HostInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __54__ATDeviceSettings_setSyncState_forLibrary_dataClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v11 = 138543874;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "setSyncState: %{public}@, forLibrary: %{public}@ dataClass: %{public}@", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "_endpointInfoForLibrary:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("SyncState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("SyncState"));
  objc_msgSend(*(id *)(a1 + 56), "_setEndpointInfo:forLibrary:", v7, *(_QWORD *)(a1 + 40));

}

void __50__ATDeviceSettings_syncStateForLibrary_dataClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_endpointInfoForLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = v2;
    objc_msgSend(v2, "objectForKey:", CFSTR("SyncState"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    v2 = v8;
  }

}

void __46__ATDeviceSettings_isSyncPendingForDataClass___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", CFSTR("DataClassesNeedingSync"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    LOBYTE(v2) = objc_msgSend(v2, "containsObject:", a1[5]);
    v3 = v4;
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v2;

}

void __57__ATDeviceSettings_removePendingSyncSettingForDataClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(NSObject **)(a1 + 32);
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "removing sync pending setting for dataclass %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", CFSTR("DataClassesNeedingSync"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      v5 = objc_msgSend(v4, "mutableCopy");
      -[NSObject removeObject:](v5, "removeObject:", *(_QWORD *)(a1 + 32));
      _ATLogCategoryFramework();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543362;
        v9 = v5;
        _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "updating sync pending for %{public}@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v5, CFSTR("DataClassesNeedingSync"));
    }
    else
    {
      _ATLogCategoryFramework();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(NSObject **)(a1 + 32);
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "dataclass: %{public}@ is not pending sync", (uint8_t *)&v8, 0xCu);
      }
    }

  }
}

void __48__ATDeviceSettings_setSyncPending_forDataClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("DataClassesNeedingSync"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (v2)
  {
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    if ((objc_msgSend(v3, "containsObject:", v5) & 1) == 0)
      objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3, "removeObject:", v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v4, CFSTR("DataClassesNeedingSync"));

}

void __49__ATDeviceSettings_removeEndpointInfoForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "endpointInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "setEndpointInfo:", v5);

  }
  else
  {
    objc_msgSend(v2, "setEndpointInfo:", 0);
  }
}

void __37__ATDeviceSettings_libraryIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stringForKey:", CFSTR("LibraryIdentifier"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("LibraryIdentifier"));
  }
}

+ (ATDeviceSettings)sharedInstance
{
  if (sharedInstance_onceToken_3165 != -1)
    dispatch_once(&sharedInstance_onceToken_3165, &__block_literal_global_3166);
  return (ATDeviceSettings *)(id)__sharedInstance_3167;
}

void __34__ATDeviceSettings_sharedInstance__block_invoke()
{
  ATDeviceSettings *v0;
  void *v1;

  v0 = objc_alloc_init(ATDeviceSettings);
  v1 = (void *)__sharedInstance_3167;
  __sharedInstance_3167 = (uint64_t)v0;

}

@end
