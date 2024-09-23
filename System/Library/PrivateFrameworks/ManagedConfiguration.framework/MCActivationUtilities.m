@implementation MCActivationUtilities

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MCActivationUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance__sharedInstance;
}

void __39__MCActivationUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initPrivate");
  v2 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = v1;

}

- (MCActivationUtilities)init
{

  return 0;
}

- (id)initPrivate
{
  MCActivationUtilities *v2;
  MCActivationUtilities *v3;
  NSNumber *isHRNModeCache;
  NSDictionary *activationRecordCache;
  uint64_t v6;
  NSMutableDictionary *didBecomeReadyCallbacks;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCActivationUtilities;
  v2 = -[MCActivationUtilities init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    isHRNModeCache = v2->_isHRNModeCache;
    v2->_isHRNModeCache = 0;

    v3->_isActivatedCache = 0;
    activationRecordCache = v3->_activationRecordCache;
    v3->_activationRecordCache = 0;

    v3->_isReady = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    didBecomeReadyCallbacks = v3->_didBecomeReadyCallbacks;
    v3->_didBecomeReadyCallbacks = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)setIsReady:(BOOL)a3
{
  _BOOL4 isReady;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableDictionary *v11;
  NSMutableDictionary *didBecomeReadyCallbacks;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  isReady = self->_isReady;
  self->_isReady = a3;
  if (!isReady && a3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSMutableDictionary allValues](self->_didBecomeReadyCallbacks, "allValues", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i) + 16))();
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    didBecomeReadyCallbacks = self->_didBecomeReadyCallbacks;
    self->_didBecomeReadyCallbacks = v11;

  }
}

- (int)isActivated
{
  MCActivationUtilities *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_isReady)
    return 0;
  v2 = self;
  objc_sync_enter(v2);
  if (-[MCActivationUtilities isActivatedCache](v2, "isActivatedCache"))
  {
    v3 = 2;
  }
  else
  {
    v12 = 0;
    MCMAEGetActivationStateWithError((uint64_t)&v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v5)
    {
      v6 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "MAEGetActivationStateWithError() error: %@", buf, 0xCu);
      }
      v3 = 0;
    }
    else
    {
      MCkMAActivationStateActivated();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "isEqualToString:", v7);

      if (v8)
      {
        -[MCActivationUtilities setIsActivatedCache:](v2, "setIsActivatedCache:", 1);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v10 = (const __CFString *)MCkNotificationActivationStateChanged();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)MCActivationUtilitiesDeactivated, v10, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        v3 = 2;
      }
      else
      {
        v3 = 1;
      }
    }

  }
  objc_sync_exit(v2);

  return v3;
}

- (id)activationRecord
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[MCActivationUtilities activationRecordCache](self, "activationRecordCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v7 = 0;
    MCMAECopyActivationRecordWithError((uint64_t)&v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v4)
    {
      v5 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "MAECopyActivationRecordWithError error: %@", buf, 0xCu);
      }

      v3 = 0;
    }
    -[MCActivationUtilities setActivationRecordCache:](self, "setActivationRecordCache:", v3);

  }
  return v3;
}

- (int)isHRNMode
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  MCActivationUtilities *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_isReady)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = _MCLogObjects;
      v4 = 2;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEBUG, "isHRNMode returning yes because of feature flag", (uint8_t *)&v20, 2u);
      }
    }
    else
    {
      v6 = self;
      objc_sync_enter(v6);
      -[MCActivationUtilities isHRNModeCache](v6, "isHRNModeCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = objc_msgSend(v7, "BOOLValue");
        v10 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          v11 = "no";
          if (v9)
            v11 = "yes";
          v20 = 136446210;
          v21 = v11;
          _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEBUG, "isHRNMode returning %{public}s from cache", (uint8_t *)&v20, 0xCu);
        }
        if (v9)
          v4 = 2;
        else
          v4 = 1;
      }
      else if (-[MCActivationUtilities isActivated](v6, "isActivated") == 2)
      {
        -[MCActivationUtilities activationRecord](v6, "activationRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue") & 0x21;
        v15 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          v16 = "no";
          if (v14 == 33)
            v16 = "yes";
          v20 = 136446210;
          v21 = v16;
          _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEBUG, "isHRNMode returning %{public}s from activation record", (uint8_t *)&v20, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14 == 33);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCActivationUtilities setIsHRNModeCache:](v6, "setIsHRNModeCache:", v17);

        if (v14 == 33)
          v4 = 2;
        else
          v4 = 1;

      }
      else
      {
        v18 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_DEBUG, "isHRNMode returning unknown because the device isn't activated", (uint8_t *)&v20, 2u);
        }
        v4 = 0;
      }

      objc_sync_exit(v6);
    }
  }
  else
  {
    v5 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEBUG, "isHRNMode returning unknown because it's not ready", (uint8_t *)&v20, 2u);
    }
    return 0;
  }
  return v4;
}

- (void)addDidBecomeReadyKey:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_isReady)
  {
    v9 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_FAULT, "Ignoring an added callback when MCActivationUtilities are already ready", v11, 2u);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AF040C](v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_didBecomeReadyCallbacks, "setObject:forKeyedSubscript:", v10, v6);

  }
}

- (void)_clearCache
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v3;
  MCActivationUtilities *observer;

  observer = self;
  objc_sync_enter(observer);
  -[MCActivationUtilities setIsHRNModeCache:](observer, "setIsHRNModeCache:", 0);
  -[MCActivationUtilities setIsActivatedCache:](observer, "setIsActivatedCache:", 0);
  -[MCActivationUtilities setActivationRecordCache:](observer, "setActivationRecordCache:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = (const __CFString *)MCkNotificationActivationStateChanged();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, observer, v3, 0);
  objc_sync_exit(observer);

}

- (BOOL)isReady
{
  return self->_isReady;
}

- (NSNumber)isHRNModeCache
{
  return self->_isHRNModeCache;
}

- (void)setIsHRNModeCache:(id)a3
{
  objc_storeStrong((id *)&self->_isHRNModeCache, a3);
}

- (BOOL)isActivatedCache
{
  return self->_isActivatedCache;
}

- (void)setIsActivatedCache:(BOOL)a3
{
  self->_isActivatedCache = a3;
}

- (NSDictionary)activationRecordCache
{
  return self->_activationRecordCache;
}

- (void)setActivationRecordCache:(id)a3
{
  objc_storeStrong((id *)&self->_activationRecordCache, a3);
}

- (NSMutableDictionary)didBecomeReadyCallbacks
{
  return self->_didBecomeReadyCallbacks;
}

- (void)setDidBecomeReadyCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_didBecomeReadyCallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didBecomeReadyCallbacks, 0);
  objc_storeStrong((id *)&self->_activationRecordCache, 0);
  objc_storeStrong((id *)&self->_isHRNModeCache, 0);
}

@end
