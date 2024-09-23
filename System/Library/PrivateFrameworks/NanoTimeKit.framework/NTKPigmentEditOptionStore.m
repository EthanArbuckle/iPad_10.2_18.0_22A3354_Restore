@implementation NTKPigmentEditOptionStore

void __54__NTKPigmentEditOptionStore_removeListener_forDomain___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 48));
  if (!objc_msgSend(v2, "count"))
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_INFO, "#store No more listeners for domain  %{public}@. Purging memory cache.", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_INFO, "#store No more listeners. Purging shared collections.", (uint8_t *)&v9, 2u);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = 0;

  }
}

void __51__NTKPigmentEditOptionStore_addListener_forDomain___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v3, a1[5]);
    v2 = v3;
  }
  v4 = v2;
  objc_msgSend(v2, "addObject:", a1[6]);

}

void __43__NTKPigmentEditOptionStore_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (void)removeListener:(id)a3 forDomain:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  os_unfair_lock_s *p_lock;
  id v10;
  __CFString *v11;
  _QWORD v12[5];
  __CFString *v13;
  id v14;

  v6 = a3;
  v7 = (__CFString *)a4;
  v12[0] = MEMORY[0x1E0C809B0];
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("AllDomains");
  v12[1] = 3221225472;
  v12[2] = __54__NTKPigmentEditOptionStore_removeListener_forDomain___block_invoke;
  v12[3] = &unk_1E6BCDCB8;
  p_lock = &self->_lock;
  v12[4] = self;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  _executeWithLock(p_lock, v12);

}

- (NTKPigmentEditOptionStore)init
{
  NTKPigmentEditOptionStore *v2;
  NTKPigmentEditOptionStore *v3;
  void *v4;
  uint64_t v5;
  CLKDevice *device;
  uint64_t v7;
  NSMutableDictionary *listenersByDomain;
  NSCache *v9;
  NSCache *cache;
  dispatch_queue_t v11;
  OS_dispatch_queue *privateQueue;
  NTKPigmentPreferenceManager *v13;
  NTKPigmentPreferenceManager *preferenceManager;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NTKPigmentEditOptionStore;
  v2 = -[NTKPigmentEditOptionStore init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = objc_claimAutoreleasedReturnValue();
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    listenersByDomain = v3->_listenersByDomain;
    v3->_listenersByDomain = (NSMutableDictionary *)v7;

    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v3->_cache;
    v3->_cache = v9;

    v11 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPigmentEditOptionStore", 0);
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(NTKPigmentPreferenceManager);
    preferenceManager = v3->_preferenceManager;
    v3->_preferenceManager = v13;

    -[NTKPigmentPreferenceManager setDelegate:](v3->_preferenceManager, "setDelegate:", v3);
    v3->_persistenceCacheEnabled = CLKIsClockFaceApp();
    -[NTKPigmentEditOptionStore _setupPlistLoader](v3, "_setupPlistLoader");
    -[NTKPigmentEditOptionStore _companion_setupPersistentStorage](v3, "_companion_setupPersistentStorage");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel_colorBundleContentChanged, CFSTR("NTKColorBundleContentChangedNotificationName"), 0);

  }
  return v3;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)addListener:(id)a3 forDomain:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  os_unfair_lock_s *p_lock;
  id v10;
  __CFString *v11;
  _QWORD v12[5];
  __CFString *v13;
  id v14;

  v6 = a3;
  v7 = (__CFString *)a4;
  v12[0] = MEMORY[0x1E0C809B0];
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("AllDomains");
  v12[1] = 3221225472;
  v12[2] = __51__NTKPigmentEditOptionStore_addListener_forDomain___block_invoke;
  v12[3] = &unk_1E6BCDCB8;
  p_lock = &self->_lock;
  v12[4] = self;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  _executeWithLock(p_lock, v12);

}

- (void)_setupPlistLoader
{
  NTKPlistPigmentEditOptionLoader *v3;
  NTKPlistPigmentEditOptionLoader *plistLoader;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(NTKPlistPigmentEditOptionLoader);
  plistLoader = self->_plistLoader;
  self->_plistLoader = v3;

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader setIgnoreSensitiveUIItems:](self->_plistLoader, "setIgnoreSensitiveUIItems:", objc_msgSend(v5, "isSensitiveUIEnabled") ^ 1);

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSensitiveUIObserver:", self);

  -[CLKDevice deviceBrand](self->_device, "deviceBrand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "integerValue"))
  {
    -[NTKPlistPigmentEditOptionLoader setSku:](self->_plistLoader, "setSku:", v8);
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKPlistPigmentEditOptionLoader sku](self->_plistLoader, "sku");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "#store Plist loader configured with deviceBrand %{public}@", (uint8_t *)&v23, 0xCu);

    }
  }
  v11 = -[CLKDevice materialType](self->_device, "materialType");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPlistPigmentEditOptionLoader setClhs:](self->_plistLoader, "setClhs:", v12);

    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKPlistPigmentEditOptionLoader clhs](self->_plistLoader, "clhs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v14;
      _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "#store Plist loader configured with material %{public}@", (uint8_t *)&v23, 0xCu);

    }
  }
  v15 = -[CLKDevice productFamilyType](self->_device, "productFamilyType");
  if (v15 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPlistPigmentEditOptionLoader setFamily:](self->_plistLoader, "setFamily:", v16);

    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKPlistPigmentEditOptionLoader family](self->_plistLoader, "family");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v18;
      _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "#store Plist loader configured with family %{public}@", (uint8_t *)&v23, 0xCu);

    }
  }
  -[NTKPlistPigmentEditOptionLoader setIncludesAllDeviceSpecificColors:](self->_plistLoader, "setIncludesAllDeviceSpecificColors:", NTKShowHardwareSpecificFaces());
  +[NTKColorBundleLoader sharedInstance](NTKColorBundleLoader, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loadColorBundles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader setAdditionalBundles:](self->_plistLoader, "setAdditionalBundles:", v20);

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKPlistPigmentEditOptionLoader additionalBundles](self->_plistLoader, "additionalBundles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v22;
    _os_log_impl(&dword_1B72A3000, v21, OS_LOG_TYPE_DEFAULT, "#store Additional color bundles loaded: %{public}@", (uint8_t *)&v23, 0xCu);

  }
}

- (void)_companion_setupPersistentStorage
{
  NTKPigmentPersistentStorageController *v3;
  NTKPigmentPersistentStorageController *storageController;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = objc_alloc_init(NTKPigmentPersistentStorageController);
  storageController = self->_storageController;
  self->_storageController = v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleActiveDeviceChangedNotification, *MEMORY[0x1E0C93E48], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_faceBundlesUpdated, CFSTR("NTKFaceBundleManagerDidUpdateBundlesNotificationName"), 0);

  objc_initWeak(&location, self);
  +[NTKDarwinNotificationCenter defaultCenter](NTKDarwinNotificationCenter, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__NTKPigmentEditOptionStore__companion_setupPersistentStorage__block_invoke;
  v8[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "addObserver:notificationName:usingBlock:", self, CFSTR("NTKColorSyncDataUpdatedNotificationName"), v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (NTKPigmentEditOptionStore)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NTKPigmentEditOptionStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, block);
  return (NTKPigmentEditOptionStore *)(id)sharedInstance_sharedInstance_0;
}

- (void)setIncludesAllDeviceSpecificColors:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__NTKPigmentEditOptionStore_setIncludesAllDeviceSpecificColors___block_invoke;
  v4[3] = &unk_1E6BCF930;
  v4[4] = self;
  v5 = a3;
  _executeWithLock(&self->_lock, v4);
  -[NTKPigmentEditOptionStore resetCacheAndNotifyListeners](self, "resetCacheAndNotifyListeners");
}

void __64__NTKPigmentEditOptionStore_setIncludesAllDeviceSpecificColors___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "plistLoader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludesAllDeviceSpecificColors:", v1);

}

- (void)setIgnoreSensitiveUIItems:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__NTKPigmentEditOptionStore_setIgnoreSensitiveUIItems___block_invoke;
  v4[3] = &unk_1E6BCF930;
  v4[4] = self;
  v5 = a3;
  _executeWithLock(&self->_lock, v4);
  -[NTKPigmentEditOptionStore resetCacheAndNotifyListeners](self, "resetCacheAndNotifyListeners");
}

void __55__NTKPigmentEditOptionStore_setIgnoreSensitiveUIItems___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "plistLoader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIgnoreSensitiveUIItems:", v1);

}

- (void)setPersistenceCacheEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__NTKPigmentEditOptionStore_setPersistenceCacheEnabled___block_invoke;
  v3[3] = &unk_1E6BCF930;
  v3[4] = self;
  v4 = a3;
  _executeWithLock(&self->_lock, v3);
}

uint64_t __56__NTKPigmentEditOptionStore_setPersistenceCacheEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isCacheRussiaLocaleStateChanged
{
  void *v3;
  void *v4;
  int v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("NTKPigmentEditOptionStoreLocaleRussia"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = NTKGizmoOrCompanionAreRussian(self->_device);
  if (v4)
    v6 = v5 ^ objc_msgSend(v4, "BOOLValue");
  else
    LOBYTE(v6) = 1;

  return v6;
}

- (BOOL)shouldClearPersistanceStoreCache
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  _BOOL8 v19;
  __int16 v20;
  _BOOL8 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_persistenceCacheEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("NTKPigmentEditOptionStoreBuildVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    NTKBuildVersion();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5) ^ 1;
    v7 = -[NTKPigmentEditOptionStore shouldForceResetingPersistentCache](self, "shouldForceResetingPersistentCache");
    v8 = -[NTKPigmentEditOptionStore isCacheRussiaLocaleStateChanged](self, "isCacheRussiaLocaleStateChanged");
    v9 = v6 | (v7 || v8);
    if (v9 == 1)
    {
      v10 = v8;
      if (v7)
        -[NTKPigmentEditOptionStore savePersistentCacheVersion](self, "savePersistentCacheVersion");
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v16 = 134218496;
        v17 = v6;
        v18 = 2048;
        v19 = v7;
        v20 = 2048;
        v21 = v10;
        _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_INFO, "#store It should clear persistent cache. versionChanged: %lu, force: %lu, LocaleChanged: %lu", (uint8_t *)&v16, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v5, CFSTR("NTKPigmentEditOptionStoreBuildVersion"));

      if (!v10)
      {
        LOBYTE(v9) = 1;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", NTKGizmoOrCompanionAreRussian(self->_device));
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("NTKPigmentEditOptionStoreLocaleRussia"));

    }
    else
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_INFO, "#store Persistent pigment cache won't be reset.", (uint8_t *)&v16, 2u);
      }
    }

LABEL_14:
    return v9;
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (void)savePersistentCacheVersion
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, CFSTR("NTKPigmentPersistentCacheVersionKey"));

}

- (BOOL)shouldForceResetingPersistentCache
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NTKPigmentPersistentCacheVersionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4)
    return 1;
  else
    return NTKShowHardwareSpecificFaces();
}

void __62__NTKPigmentEditOptionStore__companion_setupPersistentStorage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_INFO, "#store received darwin notification pigment sync data updated from daemon.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "resetCache");

}

- (id)pigmentSetForDomain:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
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
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__20;
    v21 = __Block_byref_object_dispose__20;
    v22 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__NTKPigmentEditOptionStore_pigmentSetForDomain_bundle___block_invoke;
    v14[3] = &unk_1E6BD0830;
    v16 = &v17;
    v14[4] = self;
    v8 = v6;
    v15 = v8;
    _executeWithLock(&self->_lock, v14);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v10 = (void *)v18[5];
      if (!v10)
      {
        -[NTKPigmentEditOptionStore _loadPigmentSetForDomain:bundle:](self, "_loadPigmentSetForDomain:bundle:", v8, v7);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v18[5];
        v18[5] = v11;

        v10 = (void *)v18[5];
      }
      v9 = v10;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __56__NTKPigmentEditOptionStore_pigmentSetForDomain_bundle___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)colorOptionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  -[NTKPigmentEditOptionStore pigmentSetForDomain:bundle:](self, "pigmentSetForDomain:bundle:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionForSlot:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDictionary)sharedCollections
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
  v8 = __Block_byref_object_copy__20;
  v9 = __Block_byref_object_dispose__20;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__NTKPigmentEditOptionStore_sharedCollections__block_invoke;
  v4[3] = &unk_1E6BD1498;
  v4[4] = self;
  v4[5] = &v5;
  _executeWithLock(&self->_lock, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __46__NTKPigmentEditOptionStore_sharedCollections__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_threadunsafe_sharedCollections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_threadunsafe_sharedCollections
{
  NSDictionary *sharedCollections;
  NSDictionary *v4;
  NSObject *v5;
  void *v6;
  NSDictionary *v7;

  sharedCollections = self->_sharedCollections;
  if (!sharedCollections)
  {
    -[NTKPigmentPersistentStorageController sharedCollections](self->_storageController, "sharedCollections");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[NTKPigmentEditOptionStore _threadunsafe_sharedCollections].cold.1(v5);

      -[NTKPigmentEditOptionStore plistLoader](self, "plistLoader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loadSharedCollections");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    }
    v7 = self->_sharedCollections;
    self->_sharedCollections = v4;

    sharedCollections = self->_sharedCollections;
  }
  return sharedCollections;
}

- (id)_loadPigmentSetForDomain:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  NTKPigmentEditOptionStore *v16;
  id v17;

  v6 = a3;
  -[NTKPigmentEditOptionStore _companion_loadPigmentSetForDomain:bundle:](self, "_companion_loadPigmentSetForDomain:bundle:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__NTKPigmentEditOptionStore__loadPigmentSetForDomain_bundle___block_invoke;
  v14[3] = &unk_1E6BCDCB8;
  v9 = v7;
  v15 = v9;
  v16 = self;
  v17 = v6;
  v10 = v6;
  _executeWithLock(p_lock, v14);
  v11 = v17;
  v12 = v9;

  return v12;
}

void __61__NTKPigmentEditOptionStore__loadPigmentSetForDomain_bundle___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = a1[4];
  v3 = a1[5];
  v4 = *(void **)(v3 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 40), "setObject:forKey:", v2, a1[6]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, a1[6]);

  }
}

- (id)_watch_loadPigmentSetForDomain:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *privateQueue;
  _QWORD block[4];
  id v20;
  NTKPigmentEditOptionStore *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[NTKPigmentEditOptionStore sharedCollections](self, "sharedCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentPersistentStorageController facePigmentSetForDomain:sharedCollections:](self->_storageController, "facePigmentSetForDomain:sharedCollections:", v6, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[NTKPigmentEditOptionStore _watch_loadPigmentSetForDomain:bundle:].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    -[NTKPlistPigmentEditOptionLoader parseColorOptionsForDomain:bundle:sharedCollections:](self->_plistLoader, "parseColorOptionsForDomain:bundle:sharedCollections:", v6, v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_persistenceCacheEnabled)
    {
      privateQueue = self->_privateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__NTKPigmentEditOptionStore__watch_loadPigmentSetForDomain_bundle___block_invoke;
      block[3] = &unk_1E6BCDCB8;
      v20 = v6;
      v21 = self;
      v9 = v9;
      v22 = v9;
      dispatch_async(privateQueue, block);

    }
  }

  return v9;
}

uint64_t __67__NTKPigmentEditOptionStore__watch_loadPigmentSetForDomain_bundle___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__NTKPigmentEditOptionStore__watch_loadPigmentSetForDomain_bundle___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 40), "_autoSelectPigmentsFromFacePigmentSet:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "persistFacePigmentSet:deviceUUID:", *(_QWORD *)(a1 + 48), 0);
}

- (id)_companion_loadPigmentSetForDomain:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  -[NTKPigmentEditOptionStore sharedCollections](self, "sharedCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentPersistentStorageController facePigmentSetForDomain:sharedCollections:](self->_storageController, "facePigmentSetForDomain:sharedCollections:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || !objc_msgSend(v9, "numberOfItemsForAllSlots"))
  {
    -[CLKDevice nrDevice](self->_device, "nrDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NTKPigmentEditOptionStore _companion_loadPigmentSetForDomain:bundle:].cold.1((uint64_t)v6, v12);

    }
    -[NTKPlistPigmentEditOptionLoader parseColorOptionsForDomain:bundle:sharedCollections:](self->_plistLoader, "parseColorOptionsForDomain:bundle:sharedCollections:", v6, v7, v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }

  return v10;
}

- (void)_autoSelectPigmentsFromFacePigmentSet:(id)a3
{
  void *v4;
  NTKPigmentPreferenceManager *preferenceManager;
  void *v6;
  id v7;

  v7 = a3;
  if (CLKIsClockFaceApp())
  {
    objc_msgSend(v7, "pigmentsFromMostRecentAddableCollectionForSlot:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    preferenceManager = self->_preferenceManager;
    objc_msgSend(v7, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentPreferenceManager setAutoSelectedPigments:forCollectionName:](preferenceManager, "setAutoSelectedPigments:forCollectionName:", v4, v6);

  }
}

- (void)_autoSelectPigmentsForSharedCollections:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  if (CLKIsClockFaceApp())
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__NTKPigmentEditOptionStore__autoSelectPigmentsForSharedCollections___block_invoke;
    v5[3] = &unk_1E6BD27A8;
    v5[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  }

}

void __69__NTKPigmentEditOptionStore__autoSelectPigmentsForSharedCollections___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isRootCollection"))
  {
    objc_msgSend(v7, "pigmentsFromMostRecentAddableCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(v7, "collectionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoSelectedPigments:forCollectionName:", v4, v6);

  }
}

- (id)defaultColorOptionForDomain:(id)a3 bundle:(id)a4 slot:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  -[NTKPigmentEditOptionStore pigmentSetForDomain:bundle:](self, "pigmentSetForDomain:bundle:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionForSlot:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "defaultOption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)numberOfOptionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v8 = a5;
  -[NTKPigmentEditOptionStore pigmentSetForDomain:bundle:](self, "pigmentSetForDomain:bundle:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionForSlot:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  return v11;
}

- (unint64_t)indexOfOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v10 = a3;
  -[NTKPigmentEditOptionStore colorOptionsForDomain:bundle:slot:](self, "colorOptionsForDomain:bundle:slot:", a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v10);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[NTKPigmentEditOption defaultFraction](NTKPigmentEditOption, "defaultFraction");
    v13 = (void *)objc_msgSend(v10, "copyWithColorFraction:");
    v12 = objc_msgSend(v11, "indexOfObject:", v13);

  }
  return v12;
}

- (id)optionAtIndex:(unint64_t)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  void *v7;
  void *v8;

  -[NTKPigmentEditOptionStore colorOptionsForDomain:bundle:slot:](self, "colorOptionsForDomain:bundle:slot:", a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)defaultGalleryColorsForDomain:(id)a3 bundle:(id)a4
{
  void *v4;
  void *v5;

  -[NTKPigmentEditOptionStore pigmentSetForDomain:bundle:](self, "pigmentSetForDomain:bundle:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultGalleryColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasAddableCollectionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[NTKPigmentEditOptionStore pigmentSetForDomain:bundle:](self, "pigmentSetForDomain:bundle:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionForSlot:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend(v10, "hasAddableCollection");
  return (char)self;
}

- (id)fulfilledOptionForOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "isFromStore"))
  {
    v14 = v10;
  }
  else
  {
    v15 = -[NTKPigmentEditOptionStore indexOfOption:domain:bundle:slot:](self, "indexOfOption:domain:bundle:slot:", v10, v11, v12, v13);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      -[NTKPigmentEditOptionStore _normalizeOptionForOption:domain:bundle:slot:](self, "_normalizeOptionForOption:domain:bundle:slot:", v10, v11, v12, v13);
    else
      -[NTKPigmentEditOptionStore optionAtIndex:domain:bundle:slot:](self, "optionAtIndex:domain:bundle:slot:", v15, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    if (!v16
      || (objc_msgSend(v16, "colorFraction"), v18 = v17, objc_msgSend(v10, "colorFraction"), v18 != v19)
      && (objc_msgSend(v10, "colorFraction"),
          v20 = objc_msgSend(v14, "copyWithColorFraction:"),
          v14,
          (v14 = (id)v20) == 0))
    {
      -[NTKPigmentEditOptionStore pigmentSetForDomain:bundle:](self, "pigmentSetForDomain:bundle:", v11, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "collectionForSlot:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[NTKPigmentEditOptionStore fulfilledOptionForOption:domain:bundle:slot:].cold.1((uint64_t)v10, (uint64_t)v22, v23);

      v14 = v10;
    }
  }

  return v14;
}

- (id)migratedOptionForInvalidOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[NTKPigmentEditOptionStore pigmentSetForDomain:bundle:](self, "pigmentSetForDomain:bundle:", v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collectionForSlot:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKPigmentEditOptionStore _migratedOptionForInvalidOption:collection:](self, "_migratedOptionForInvalidOption:collection:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543874;
      v23 = v10;
      v24 = 2114;
      v25 = v15;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "#store Pigment option migrated from %{public}@ to %{public}@ - domain %{public}@", (uint8_t *)&v22, 0x20u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v14, "allItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "config");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "migration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544130;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v19;
    v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_ERROR, "#store Failed to migrate pigment option %{public}@ - domain %{public}@ - items:%{public}@ - migration: %{public}@", (uint8_t *)&v22, 0x2Au);

  }
  return v15;
}

- (id)_migratedOptionForInvalidOption:(id)a3 collection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "migration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_4;
  objc_msgSend(v5, "optionName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (v33 = 0,
        objc_msgSend(v5, "extractEffectiveCollectionName:effectiveOptionName:", 0, &v33),
        v11 = v33,
        objc_msgSend(v7, "objectForKeyedSubscript:", v11),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v9))
  {
LABEL_4:
    v31 = 0;
    v32 = 0;
    +[NTKPigmentEditOption effectiveNamesFromName:effectiveCollectionName:effectiveOptionName:](NTKPigmentEditOption, "effectiveNamesFromName:effectiveCollectionName:effectiveOptionName:", v9, &v32, &v31);
    v12 = v32;
    v13 = v31;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v6, "allItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v15)
    {
      v22 = v7;
      v23 = v6;
      v24 = v5;
      v16 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v25 = 0;
          v26 = 0;
          objc_msgSend(v18, "extractEffectiveCollectionName:effectiveOptionName:", &v26, &v25);
          v19 = v26;
          v20 = v25;
          if ((!v12 || objc_msgSend(v19, "isEqualToString:", v12))
            && objc_msgSend(v20, "isEqualToString:", v13))
          {
            v15 = v18;

            goto LABEL_16;
          }

        }
        v15 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        if (v15)
          continue;
        break;
      }
LABEL_16:
      v6 = v23;
      v5 = v24;
      v7 = v22;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_normalizeOptionForOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a3;
  -[NTKPigmentEditOptionStore pigmentSetForDomain:bundle:](self, "pigmentSetForDomain:bundle:", a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionForSlot:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fullname");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pigmentWithFullname:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isOptionVisible:(id)a3
{
  return -[NTKPigmentPreferenceManager isOptionVisible:](self->_preferenceManager, "isOptionVisible:", a3);
}

- (void)setOption:(id)a3 visible:(BOOL)a4
{
  -[NTKPigmentPreferenceManager setOption:visible:](self->_preferenceManager, "setOption:visible:", a3, a4);
}

- (void)colorBundleContentChanged
{
  NSObject *v3;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "#store Color bundles updated. Reseting Pigment Store cache", v4, 2u);
  }

  -[NTKPigmentEditOptionStore resetCacheAndNotifyListeners](self, "resetCacheAndNotifyListeners");
}

- (void)faceBundlesUpdated
{
  NSObject *v3;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "#store Face bundles updated. Reseting Pigment Store cache", v4, 2u);
  }

  -[NTKPigmentEditOptionStore resetCacheAndNotifyListeners](self, "resetCacheAndNotifyListeners");
}

- (void)handleActiveDeviceChangedNotification
{
  NSObject *v3;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "#store Active device chanced. Reseting Pigment Store cache", v4, 2u);
  }

  -[NTKPigmentPreferenceManager handlePairedDeviceChanged](self->_preferenceManager, "handlePairedDeviceChanged");
  -[NTKPigmentEditOptionStore resetCacheAndNotifyListeners](self, "resetCacheAndNotifyListeners");
}

- (void)deletePersistenceLayerCache
{
  -[NTKPigmentPersistentStorageController deleteContent](self->_storageController, "deleteContent");
}

- (void)resetCacheAndNotifyListeners
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__NTKPigmentEditOptionStore_resetCacheAndNotifyListeners__block_invoke;
  v3[3] = &unk_1E6BCD5F0;
  v3[4] = self;
  _executeWithLock(&self->_lock, v3);
  -[NTKPigmentEditOptionStore notifyListenersStoreContentChanged](self, "notifyListenersStoreContentChanged");
}

uint64_t __57__NTKPigmentEditOptionStore_resetCacheAndNotifyListeners__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_threadunsafe_resetCache");
}

- (void)_threadunsafe_resetCache
{
  NSDictionary *sharedCollections;

  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
  -[NTKPigmentPersistentStorageController resetCache](self->_storageController, "resetCache");
  sharedCollections = self->_sharedCollections;
  self->_sharedCollections = 0;

  self->_prewarmed = 0;
}

- (void)notifyListenersStoreContentChanged
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  NTKPigmentEditOptionStore *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke;
  v12[3] = &unk_1E6BCDCB8;
  v12[4] = self;
  v13 = v3;
  v6 = v4;
  v14 = v6;
  v7 = v3;
  _executeWithLock(&self->_lock, v12);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke_3;
  v9[3] = &unk_1E6BD2820;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "listenersByDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke_2;
  v3[3] = &unk_1E6BD27F8;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("AllDomains")))
    {

      v5 = 0;
    }
    objc_msgSend(v6, "colorEditOptionStore:didChangeForDomain:", *(_QWORD *)(a1 + 40), v5);

  }
}

- (void)sensitiveUIStateChanged
{
  _QWORD v3[5];

  -[NTKPigmentEditOptionStore deletePersistenceLayerCache](self, "deletePersistenceLayerCache");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__NTKPigmentEditOptionStore_sensitiveUIStateChanged__block_invoke;
  v3[3] = &unk_1E6BCD5F0;
  v3[4] = self;
  _executeWithLock(&self->_lock, v3);
  -[NTKPigmentEditOptionStore resetCacheAndNotifyListeners](self, "resetCacheAndNotifyListeners");
}

void __52__NTKPigmentEditOptionStore_sensitiveUIStateChanged__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_INFO, "#store Sensitive UI changed, resetting cache", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSensitiveUIEnabled") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "plistLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIgnoreSensitiveUIItems:", v4);

}

- (void)setSharedCollections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NTKPlistPigmentEditOptionLoader)plistLoader
{
  return self->_plistLoader;
}

- (void)setPlistLoader:(id)a3
{
  objc_storeStrong((id *)&self->_plistLoader, a3);
}

- (NSMutableDictionary)listenersByDomain
{
  return self->_listenersByDomain;
}

- (void)setListenersByDomain:(id)a3
{
  objc_storeStrong((id *)&self->_listenersByDomain, a3);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NTKFaceColorPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
}

- (NTKPigmentPersistentStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
  objc_storeStrong((id *)&self->_storageController, a3);
}

- (NTKPigmentPreferenceManager)preferenceManager
{
  return self->_preferenceManager;
}

- (void)setPreferenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_preferenceManager, a3);
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (BOOL)persistenceCacheEnabled
{
  return self->_persistenceCacheEnabled;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)prewarmed
{
  return self->_prewarmed;
}

- (void)setPrewarmed:(BOOL)a3
{
  self->_prewarmed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_preferenceManager, 0);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_listenersByDomain, 0);
  objc_storeStrong((id *)&self->_plistLoader, 0);
  objc_storeStrong((id *)&self->_sharedCollections, 0);
}

- (void)_threadunsafe_sharedCollections
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "#store Failed to loaded shared collections from persistence layer", v1, 2u);
}

- (void)_watch_loadPigmentSetForDomain:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, a2, a3, "#store Failed to loaded pigment set for domain %{public}@ from persistence layer cache", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __67__NTKPigmentEditOptionStore__watch_loadPigmentSetForDomain_bundle___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, a2, a3, "#store Persisting pigment set for domain %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_companion_loadPigmentSetForDomain:(uint64_t)a1 bundle:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "#store synced color data not found for domain %{public}@. Loading from color.plist file", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)fulfilledOptionForOption:(os_log_t)log domain:bundle:slot:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "#store Could not fulfill pigment. It may fail to localize its name. Returning original unfulfilled pigment: %{public}@ - Store Collection: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
