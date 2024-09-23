@implementation MBBehaviorOptions

- (void)_startListeningForNotifications
{
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__MBBehaviorOptions__startListeningForNotifications__block_invoke;
  v6[3] = &unk_1E995D638;
  v6[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__MBBehaviorOptions__startListeningForNotifications__block_invoke_2;
  v4[3] = &unk_1E995D750;
  v5 = (id)MEMORY[0x1D8270EAC](v6, a2);
  v2 = _startListeningForNotifications_once;
  v3 = v5;
  if (v2 != -1)
    dispatch_once(&_startListeningForNotifications_once, v4);

}

void __52__MBBehaviorOptions__startListeningForNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  MBGetDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5213000, v2, OS_LOG_TYPE_INFO, "Looks like our prefs changed. Reloading.", buf, 2u);
    _MBLog(CFSTR("INFO"), (uint64_t)"Looks like our prefs changed. Reloading.", v3, v4, v5, v6, v7, v8, v19);
  }

  CFPreferencesSynchronize(CFSTR("com.apple.MobileBackup.BehaviorOptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  objc_msgSend(*(id *)(a1 + 32), "cachedPrefsQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MBBehaviorOptions__startListeningForNotifications__block_invoke_83;
  block[3] = &unk_1E995D728;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = buf;
  dispatch_sync(v9, block);

  v10 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*((id *)v25 + 5), "allKeys", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*((id *)v25 + 5), "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_behaviorOptionForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if ((v18 & 1) == 0)
          objc_msgSend(v10, "addObject:", v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v12);
  }

  _Block_object_dispose(buf, 8);
}

void __52__MBBehaviorOptions__startListeningForNotifications__block_invoke_83(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "cachedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "cachedPrefs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

void __52__MBBehaviorOptions__startListeningForNotifications__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  dispatch_get_global_queue(17, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", &_startListeningForNotifications_token, v2, *(notify_handler_t *)(a1 + 32));

  notify_register_dispatch("com.apple.mobilebackup.BehaviorOptionDidChange", &_startListeningForNotifications_token2, v2, *(notify_handler_t *)(a1 + 32));
}

- (MBBehaviorOptions)init
{
  MBBehaviorOptions *v2;
  uint64_t v3;
  NSMutableDictionary *cachedPrefs;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *cachedPrefsQueue;
  void *v8;
  uint64_t v9;
  NSString *plistPath;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MBBehaviorOptions;
  v2 = -[MBBehaviorOptions init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cachedPrefs = v2->_cachedPrefs;
    v2->_cachedPrefs = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.mobilebackup.behavioroptions", v5);
    cachedPrefsQueue = v2->_cachedPrefsQueue;
    v2->_cachedPrefsQueue = (OS_dispatch_queue *)v6;

    -[MBBehaviorOptions _startListeningForNotifications](v2, "_startListeningForNotifications");
    CFPreferencesSynchronize(CFSTR("com.apple.MobileBackup.BehaviorOptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    objc_msgSend(CFSTR("com.apple.MobileBackup.BehaviorOptions"), "stringByAppendingPathExtension:", CFSTR("plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Preferences"), "stringByAppendingPathComponent:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    plistPath = v2->_plistPath;
    v2->_plistPath = (NSString *)v9;

  }
  return v2;
}

+ (id)sharedOptions
{
  if (sharedOptions_onceToken != -1)
    dispatch_once(&sharedOptions_onceToken, &__block_literal_global_10);
  return (id)sharedOptions_sSharedOptions;
}

void __34__MBBehaviorOptions_sharedOptions__block_invoke()
{
  MBBehaviorOptions *v0;
  void *v1;

  v0 = objc_alloc_init(MBBehaviorOptions);
  v1 = (void *)sharedOptions_sSharedOptions;
  sharedOptions_sSharedOptions = (uint64_t)v0;

}

- (id)_behaviorOptionForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MBBehaviorOptions _behaviorOptionForTopLevelKey:](self, "_behaviorOptionForTopLevelKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v7 = (void *)CFPreferencesCopyValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.MobileBackup.BehaviorOptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v7;

  }
  return v6;
}

- (id)_behaviorOptionForTopLevelKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.MobileBackup.BehaviorOptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)_setPref:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  MBBehaviorOptions *v16;

  v13 = a3;
  v6 = a4;
  v7 = (void *)CFPreferencesCopyValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.MobileBackup.BehaviorOptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v8 = v7;
  if (v7)
    v9 = (id)objc_msgSend(v7, "mutableCopy");
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (v13)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v6);
  else
    objc_msgSend(v9, "removeObjectForKey:", v6);
  -[MBBehaviorOptions cachedPrefsQueue](self, "cachedPrefsQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MBBehaviorOptions__setPref_forKey___block_invoke;
  block[3] = &unk_1E995D778;
  v15 = v10;
  v16 = self;
  v12 = v10;
  dispatch_sync(v11, block);

  notify_post("com.apple.mobilebackup.BehaviorOptionDidChange");
}

void __37__MBBehaviorOptions__setPref_forKey___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  id v3;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("BehaviorOptions"), *(CFPropertyListRef *)(a1 + 32), CFSTR("com.apple.MobileBackup.BehaviorOptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(CFSTR("com.apple.MobileBackup.BehaviorOptions"), CFSTR("mobile"), v2);
  objc_msgSend(*(id *)(a1 + 40), "cachedPrefs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (id)_getNumberOptionForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  -[MBBehaviorOptions cachedPrefsQueue](self, "cachedPrefsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MBBehaviorOptions__getNumberOptionForKey___block_invoke;
  block[3] = &unk_1E995CE98;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  v11 = v6;
  dispatch_sync(v5, block);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = 0;
  else
    v7 = (void *)v14[5];
  v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __44__MBBehaviorOptions__getNumberOptionForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cachedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_behaviorOptionForKey:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 32), "cachedPrefs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, *(_QWORD *)(a1 + 40));

        return;
      }
      MBGetDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v24 = v10;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_ERROR, "For key %@, found value %@ which was not a NSNumber.  Ignoring.", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"For key %@, found value %@ which was not a NSNumber.  Ignoring.", v12, v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 40));
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    goto LABEL_8;
  }
}

- (BOOL)_getBoolOptionForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;

  -[MBBehaviorOptions _getNumberOptionForKey:](self, "_getNumberOptionForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      a4 = objc_msgSend(v5, "BOOLValue");
  }

  return a4;
}

- (int)_getIntOptionForKey:(id)a3 defaultValue:(int)a4
{
  void *v5;

  -[MBBehaviorOptions _getNumberOptionForKey:](self, "_getNumberOptionForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      a4 = objc_msgSend(v5, "intValue");
  }

  return a4;
}

- (double)_getDoubleOptionForKey:(id)a3 defaultValue:(double)a4
{
  void *v5;
  double v6;

  -[MBBehaviorOptions _getNumberOptionForKey:](self, "_getNumberOptionForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v5, "doubleValue");
      a4 = v6;
    }
  }

  return a4;
}

- (id)_getStringOptionLockedForKey:(id)a3 defaultValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  -[MBBehaviorOptions cachedPrefs](self, "cachedPrefs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[MBBehaviorOptions _behaviorOptionForKey:](self, "_behaviorOptionForKey:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = (void *)v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v7, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MBBehaviorOptions cachedPrefs](self, "cachedPrefs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v5);

  }
  return v7;
}

- (id)_getStringOptionForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[MBBehaviorOptions cachedPrefsQueue](self, "cachedPrefsQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__MBBehaviorOptions__getStringOptionForKey_defaultValue___block_invoke;
  v15[3] = &unk_1E995D7A0;
  v18 = &v19;
  v15[4] = self;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  dispatch_sync(v8, v15);

  v11 = v10;
  if (v20[5])
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = v10;
    if ((isKindOfClass & 1) == 0)
      v11 = (void *)v20[5];
  }
  v13 = v11;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __57__MBBehaviorOptions__getStringOptionForKey_defaultValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getStringOptionLockedForKey:defaultValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_getArrayOptionForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  id v12;
  _QWORD block[5];
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
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  -[MBBehaviorOptions cachedPrefsQueue](self, "cachedPrefsQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MBBehaviorOptions__getArrayOptionForKey_defaultValue___block_invoke;
  block[3] = &unk_1E995CE98;
  v16 = &v17;
  block[4] = self;
  v9 = v6;
  v15 = v9;
  dispatch_sync(v8, block);

  v10 = v7;
  if (v18[5])
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = v7;
    if ((isKindOfClass & 1) == 0)
      v10 = (void *)v18[5];
  }
  v12 = v10;

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __56__MBBehaviorOptions__getArrayOptionForKey_defaultValue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "cachedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_behaviorOptionForTopLevelKey:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "cachedPrefs");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

  }
}

- (NSString)cloudKitContainerName
{
  return (NSString *)-[MBBehaviorOptions _getStringOptionForKey:defaultValue:](self, "_getStringOptionForKey:defaultValue:", CFSTR("CloudKitContainer"), CFSTR("com.apple.backup.ios"));
}

- (int64_t)maxBatchCount
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("MaxBatchCount"), 100);
}

- (int64_t)maxBatchSize
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("MaxBatchSize"), 1572864);
}

- (int64_t)maxBatchSaveAssetSize
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("maxBatchSaveAssetSize"), 125829120);
}

- (int)maxBatchSaveConcurrentModifyRecordsOperationsWithDefaultValue:(int)a3
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("MaxBatchSaveConcurrentModifyRecordsOperations"), *(_QWORD *)&a3);
}

- (int)maxBatchDeleteConcurrentModifyRecordsOperationsWithDefaultValue:(int)a3
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("MaxBatchDeleteConcurrentModifyRecordsOperations"), *(_QWORD *)&a3);
}

- (int)maxBatchFetchConcurrentFetchRecordsOperationsWithDefaultValue:(int)a3
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("MaxBatchFetchConcurrentFetchRecordsOperations"), *(_QWORD *)&a3);
}

- (int64_t)maxBatchFetchAssetSize
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("maxBatchFetchAssetSize"), 125829120);
}

- (int64_t)recordSaveAttempts
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("RecordSaveAttempts"), 2);
}

- (BOOL)sqlTrace
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("SQLTrace"), 0);
}

- (int64_t)manifestPageSize
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("ManifestPageSize"), 5000);
}

- (int)sqlBatchCount
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("SQLBatchCount"), 5000);
}

- (double)sqlBatchTime
{
  double result;

  -[MBBehaviorOptions _getDoubleOptionForKey:defaultValue:](self, "_getDoubleOptionForKey:defaultValue:", CFSTR("SQLBatchTime"), 5.0);
  return result;
}

- (BOOL)useBackgroundOperationsForBackup
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("UseBackgroundOperationsForBackupKey"), 0);
}

- (void)setUseBackgroundOperationsForBackup:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MBBehaviorOptions _setPref:forKey:](self, "_setPref:forKey:", v4, CFSTR("UseBackgroundOperationsForBackupKey"));

}

- (NSString)minimumBuildVersionForFullBackup
{
  return (NSString *)-[MBBehaviorOptions _getStringOptionForKey:defaultValue:](self, "_getStringOptionForKey:defaultValue:", CFSTR("MinimumBuildVersionForFullBackupKey"), 0);
}

- (void)setMinimumBuildVersionForFullBackup:(id)a3
{
  -[MBBehaviorOptions _setPref:forKey:](self, "_setPref:forKey:", a3, CFSTR("MinimumBuildVersionForFullBackupKey"));
}

- (BOOL)shouldKeepFileSystemSnapshotAfterBackupSuccess
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("KeepDailySnapshots"), 0);
}

- (void)setShouldKeepFileSystemSnapshotAfterBackupSuccess:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MBBehaviorOptions _setPref:forKey:](self, "_setPref:forKey:", v4, CFSTR("KeepDailySnapshots"));

}

- (BOOL)shouldKeepFileSystemSnapshotAfterBackupFailure
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("KeepFileSystemSnapshotAfterBackupFailure"), 0);
}

- (BOOL)snapshotAfterForegroundRestore
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("SnapshotAfterForegroundRestore"), 0);
}

- (void)setSnapshotAfterForegroundRestore:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MBBehaviorOptions _setPref:forKey:](self, "_setPref:forKey:", v4, CFSTR("SnapshotAfterForegroundRestore"));

}

- (BOOL)usePowerLog
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("UsePowerLog"), 1);
}

- (BOOL)useABC
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("UseABC"), 1);
}

- (void)setUseABC:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MBBehaviorOptions _setPref:forKey:](self, "_setPref:forKey:", v4, CFSTR("UseABC"));

}

- (double)SQLiteSpaceSavingsThresholdWithDefaultValue:(double)a3
{
  double result;

  -[MBBehaviorOptions _getDoubleOptionForKey:defaultValue:](self, "_getDoubleOptionForKey:defaultValue:", CFSTR("SQLiteSpaceSavingsThreshold"), a3);
  return result;
}

- (BOOL)validateSignatureOnRestoreWithDefaultValue:(BOOL)a3
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("ValidateSignatureOnRestore"), a3);
}

- (int)validateFileEncodingWithDefaultValue:(int)a3
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("ValidateFileEncoding"), *(_QWORD *)&a3);
}

- (BOOL)useRestoreOperationLog
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("UseRestoreOperationLog"), 0);
}

- (unint64_t)numberOfRecordsToFetchBeforeCancellingPrivilegedSnapshotDownload
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("RecordsToFetchBeforeCancellingPrivilegedSnapshotDownload"), 0xFFFFFFFFLL);
}

- (BOOL)cancelBackupDuringJournalReplay
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("CancelBackupDuringJournalReplay"), 0);
}

- (NSString)engineStateToCancelBackupAfter
{
  return (NSString *)-[MBBehaviorOptions _getStringOptionForKey:defaultValue:](self, "_getStringOptionForKey:defaultValue:", CFSTR("CancelBackupAfterEngineState"), 0);
}

- (NSString)engineStateToCancelRestoreAfter
{
  return (NSString *)-[MBBehaviorOptions _getStringOptionForKey:defaultValue:](self, "_getStringOptionForKey:defaultValue:", CFSTR("CancelRestoreAfterEngineState"), 0);
}

- (BOOL)verifySnapshotAfterCommit
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("VerifySnapshotAfterCommit"), 0);
}

- (NSNumber)shouldVerifyRestore
{
  return (NSNumber *)-[MBBehaviorOptions _getNumberOptionForKey:](self, "_getNumberOptionForKey:", CFSTR("VerifyRestore"));
}

- (BOOL)useSandboxCKContainer
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("UseSandboxCKContainer"), 0);
}

- (NSString)snapshotFormatString
{
  return (NSString *)-[MBBehaviorOptions _getStringOptionForKey:defaultValue:](self, "_getStringOptionForKey:defaultValue:", CFSTR("SnapshotFormat"), 0);
}

- (NSNumber)shouldRestoreFromLegacySnapshotFormat
{
  return (NSNumber *)-[MBBehaviorOptions _getNumberOptionForKey:](self, "_getNumberOptionForKey:", CFSTR("ShouldRestoreLegacySnapshotFormat"));
}

- (NSString)requiredRestoreSnapshotFormatString
{
  return (NSString *)-[MBBehaviorOptions _getStringOptionForKey:defaultValue:](self, "_getStringOptionForKey:defaultValue:", CFSTR("RequiredRestoreSnapshotFormat"), 0);
}

- (BOOL)d2dTransferUseCompression
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("D2DUseCompression"), 1);
}

- (BOOL)d2dTransferUSBOnly
{
  return -[MBBehaviorOptions _getBoolOptionForKey:defaultValue:](self, "_getBoolOptionForKey:defaultValue:", CFSTR("D2DUSBOnly"), 0);
}

- (int)d2dTransferSmallFileMaxTasks
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("D2DSmallFileMaxTasks"), 3);
}

- (int)d2dTransferLargeFileMaxTasks
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("D2DLargeFileMaxTasks"), 5);
}

- (int)d2dTransferLargeFileBufferKilobytes
{
  return -[MBBehaviorOptions _getIntOptionForKey:defaultValue:](self, "_getIntOptionForKey:defaultValue:", CFSTR("D2DLargeFileBufferKB"), 1024);
}

- (NSString)plistPath
{
  return self->_plistPath;
}

- (BOOL)warnForLateiTunesBackups
{
  return self->_warnForLateiTunesBackups;
}

- (void)setWarnForLateiTunesBackups:(BOOL)a3
{
  self->_warnForLateiTunesBackups = a3;
}

- (NSMutableDictionary)cachedPrefs
{
  return self->_cachedPrefs;
}

- (void)setCachedPrefs:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPrefs, a3);
}

- (OS_dispatch_queue)cachedPrefsQueue
{
  return self->_cachedPrefsQueue;
}

- (void)setCachedPrefsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPrefsQueue, a3);
}

- (BOOL)flushLogMessages
{
  return self->_flushLogMessages;
}

- (void)setFlushLogMessages:(BOOL)a3
{
  self->_flushLogMessages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPrefsQueue, 0);
  objc_storeStrong((id *)&self->_cachedPrefs, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
}

@end
