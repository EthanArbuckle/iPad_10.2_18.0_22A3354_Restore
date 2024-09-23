@implementation BioUserDefaults

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BioUserDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

void __33__BioUserDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (void)registerDefaults:(id)a3
{
  NSMutableDictionary *v4;
  id v5;
  _QWORD block[5];

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__BioUserDefaults_registerDefaults___block_invoke;
  block[3] = &unk_1E5F83D50;
  block[4] = self;
  if (registerDefaults__onceToken != -1)
    dispatch_once(&registerDefaults__onceToken, block);
  v4 = self->_registeredDefaults;
  objc_sync_enter(v4);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_registeredDefaults, "addEntriesFromDictionary:", v5);
  objc_sync_exit(v4);

}

void __36__BioUserDefaults_registerDefaults___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (void)updateNotification
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = self->_updateBlocks;
  objc_sync_enter(v3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_updateBlocks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)registerUpdateNotification:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *updateBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v9;
  id v10;

  v10 = a3;
  v4 = self->_updateBlocks;
  objc_sync_enter(v4);
  updateBlocks = self->_updateBlocks;
  if (!updateBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_updateBlocks;
    self->_updateBlocks = v6;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)updateCallback, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)updateCallback, CFSTR("com.apple.biometrickitd.userDefaultsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    updateBlocks = self->_updateBlocks;
  }
  v9 = (void *)MEMORY[0x1B5DF8A2C](v10);
  -[NSMutableArray addObject:](updateBlocks, "addObject:", v9);

  objc_sync_exit(v4);
}

- (void)unregisterUpdateNotification:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *updateBlocks;
  void *v6;
  NSMutableArray *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSMutableArray *v9;
  id v10;

  v10 = a3;
  v4 = self->_updateBlocks;
  objc_sync_enter(v4);
  updateBlocks = self->_updateBlocks;
  v6 = (void *)MEMORY[0x1B5DF8A2C](v10);
  -[NSMutableArray removeObject:](updateBlocks, "removeObject:", v6);

  v7 = self->_updateBlocks;
  if (v7 && !-[NSMutableArray count](v7, "count"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0);
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, CFSTR("com.apple.biometrickitd.userDefaultsChanged"), 0);
    v9 = self->_updateBlocks;
    self->_updateBlocks = 0;

  }
  objc_sync_exit(v4);

}

- (id)objectOfClass:(Class)a3 forKey:(id)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  CFPropertyListRef v9;
  NSObject *v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;
  char isKindOfClass;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/Library/Managed Preferences/mobile/com.apple.biometrickitd.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v8)
        goto LABEL_26;
    }
    else
    {

    }
  }
  v9 = CFPreferencesCopyValue(v5, CFSTR("com.apple.biometrickitd"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v9)
  {
    v8 = (void *)v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_26;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "0";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BioUserDefaults.m";
      v24 = 1024;
      v25 = 166;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    CFRelease(v8);
  }
  v8 = (void *)CFPreferencesCopyValue(v5, CFSTR("com.apple.biometrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_26;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "0";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BioUserDefaults.m";
      v24 = 1024;
      v25 = 184;
      _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    CFRelease(v8);
  }
  v12 = self->_registeredDefaults;
  objc_sync_enter(v12);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredDefaults, "objectForKeyedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredDefaults, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v12);

LABEL_26:
  return v8;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BioUserDefaults objectOfClass:forKey:](self, "objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (int)intForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[BioUserDefaults objectOfClass:forKey:](self, "objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "intValue");
  return v6;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[BioUserDefaults objectOfClass:forKey:](self, "objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

- (unsigned)unsignedIntForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  -[BioUserDefaults objectOfClass:forKey:](self, "objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

- (unint64_t)unsignedIntegerForKey:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[BioUserDefaults objectOfClass:forKey:](self, "objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

- (id)numberForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BioUserDefaults objectOfClass:forKey:](self, "objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BioUserDefaults objectOfClass:forKey:](self, "objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.biometrickitd"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  return CFPreferencesSynchronize(CFSTR("com.apple.biometrickitd"), v4, v5) != 0;
}

- (BOOL)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[BioUserDefaults setObject:forKey:](self, "setObject:forKey:", v8, v7);

  return (char)self;
}

+ (id)preferenceObjectForKey:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFPropertyListRef v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(CFSTR("com.apple.biometrickitd"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v6 = CFPreferencesCopyValue(v3, CFSTR("com.apple.biometrickitd"), v4, v5);
  if (v6)
  {
    v7 = (void *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_17;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "0";
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = &unk_1AF575226;
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BioUserDefaults.m";
      v20 = 1024;
      v21 = 310;
      _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    CFRelease(v7);
  }
  v9 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.biometrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v7 = (void *)CFPreferencesCopyValue(v3, CFSTR("com.apple.biometrickitd"), CFSTR("mobile"), v9);
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v10 = __osLog;
      else
        v10 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136316162;
        v13 = "0";
        v14 = 2048;
        v15 = 0;
        v16 = 2080;
        v17 = &unk_1AF575226;
        v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BioUserDefaults.m";
        v20 = 1024;
        v21 = 326;
        _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
      }
      CFRelease(v7);
      v7 = 0;
    }
  }
LABEL_17:

  return v7;
}

- (id)stateDictionary
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFArray *v8;
  CFDictionaryRef v9;
  const __CFString *v10;
  const __CFArray *v11;
  CFDictionaryRef v12;
  NSMutableDictionary *registeredDefaults;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/Library/Managed Preferences/mobile/com.apple.biometrickitd.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfURL:error:", v4, 0);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v7 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(CFSTR("com.apple.biometrickitd"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v8 = CFPreferencesCopyKeyList(CFSTR("com.apple.biometrickitd"), v6, v7);
  v9 = CFPreferencesCopyMultiple(v8, CFSTR("com.apple.biometrickitd"), v6, v7);
  if (v8)
    CFRelease(v8);
  v10 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v11 = CFPreferencesCopyKeyList(CFSTR("com.apple.biometrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v12 = CFPreferencesCopyMultiple(v11, CFSTR("com.apple.biometrickitd"), CFSTR("mobile"), v10);
  if (v11)
    CFRelease(v11);
  registeredDefaults = (NSMutableDictionary *)CFSTR("<none>");
  if (v5)
    v14 = v5;
  else
    v14 = CFSTR("<none>");
  v19[0] = CFSTR("profilePlist");
  v19[1] = CFSTR("defaults");
  if (v9)
    v15 = (const __CFString *)v9;
  else
    v15 = CFSTR("<none>");
  v20[0] = v14;
  v20[1] = v15;
  v19[2] = CFSTR("mobileDefaults");
  v19[3] = CFSTR("registeredDefaults");
  if (v12)
    v16 = (const __CFString *)v12;
  else
    v16 = CFSTR("<none>");
  if (self->_registeredDefaults)
    registeredDefaults = self->_registeredDefaults;
  v20[2] = v16;
  v20[3] = registeredDefaults;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)synchronize
{
  int v2;
  BOOL v3;

  v2 = CFPreferencesSynchronize(CFSTR("com.apple.biometrickitd"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (CFPreferencesSynchronize(CFSTR("com.apple.biometrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]))
    v3 = v2 == 0;
  else
    v3 = 1;
  return !v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_registeredDefaults, 0);
}

@end
