@implementation NTKCompanionWidgetComplicationManager

+ (id)instanceForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NTKCompanionWidgetComplicationManager *v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "nrDeviceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&instanceForDevice__lock);
      v6 = (void *)instanceForDevice__uuidToProvider;
      if (!instanceForDevice__uuidToProvider)
      {
        v7 = objc_opt_new();
        v8 = (void *)instanceForDevice__uuidToProvider;
        instanceForDevice__uuidToProvider = v7;

        v6 = (void *)instanceForDevice__uuidToProvider;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", v5);
      v9 = (NTKCompanionWidgetComplicationManager *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v9 = -[NTKCompanionWidgetComplicationManager initWithDevice:]([NTKCompanionWidgetComplicationManager alloc], "initWithDevice:", v4);
        objc_msgSend((id)instanceForDevice__uuidToProvider, "setObject:forKeyedSubscript:", v9, v5);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&instanceForDevice__lock);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NTKCompanionWidgetComplicationManager)initWithDevice:(id)a3
{
  id v5;
  NTKCompanionWidgetComplicationManager *v6;
  NTKCompanionWidgetComplicationManager *v7;
  uint64_t v8;
  NSMutableDictionary *lock_clientToRecords;
  uint64_t v10;
  NSMapTable *lock_descriptorToRecord;
  uint64_t v12;
  NSDictionary *lock_appLookup;
  uint64_t v14;
  NSMutableArray *lock_loadCompletionBlocks;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKCompanionWidgetComplicationManager;
  v6 = -[NTKCompanionWidgetComplicationManager init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_opt_new();
    lock_clientToRecords = v7->_lock_clientToRecords;
    v7->_lock_clientToRecords = (NSMutableDictionary *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 517, 0);
    lock_descriptorToRecord = v7->_lock_descriptorToRecord;
    v7->_lock_descriptorToRecord = (NSMapTable *)v10;

    v12 = objc_opt_new();
    lock_appLookup = v7->_lock_appLookup;
    v7->_lock_appLookup = (NSDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    lock_loadCompletionBlocks = v7->_lock_loadCompletionBlocks;
    v7->_lock_loadCompletionBlocks = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__fetchInstalledApps, CFSTR("NTKCompanion3rdPartyAppInstallStartedNotification"), 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__fetchInstalledApps, CFSTR("NTKSystemAppStateChangedNotification"), 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_handleAppConduitApplicationsChangedNotification_1, (CFStringRef)*MEMORY[0x1E0CF8828], v7, (CFNotificationSuspensionBehavior)0);
    -[NTKCompanionWidgetComplicationManager _setup](v7, "_setup");

  }
  return v7;
}

- (void)performAfterLoad:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD);
  os_unfair_lock_s *p_lock;
  NSMutableArray *lock_loadCompletionBlocks;
  void *v10;
  _QWORD aBlock[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__NTKCompanionWidgetComplicationManager_performAfterLoad___block_invoke;
    aBlock[3] = &unk_1E6BCDF60;
    v6 = v4;
    v12 = v6;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_loaded)
    {
      os_unfair_lock_unlock(&self->_lock);
      v7[2](v7);
    }
    else
    {
      lock_loadCompletionBlocks = self->_lock_loadCompletionBlocks;
      v10 = _Block_copy(v6);
      -[NSMutableArray addObject:](lock_loadCompletionBlocks, "addObject:", v10);

      os_unfair_lock_unlock(p_lock);
    }

  }
}

void __58__NTKCompanionWidgetComplicationManager_performAfterLoad___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__NTKCompanionWidgetComplicationManager_performAfterLoad___block_invoke_2;
    block[3] = &unk_1E6BCDF60;
    v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __58__NTKCompanionWidgetComplicationManager_performAfterLoad___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setup
{
  os_unfair_lock_s *p_lock;
  NTKComplicationCollection *v4;
  NTKComplicationCollection *lock_complicationCollection;
  NTKComplicationCollection *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[NTKCompanionComplicationCollectionManager sharedWidgetComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedWidgetComplicationCollectionForDevice:", self->_device);
  v4 = (NTKComplicationCollection *)objc_claimAutoreleasedReturnValue();
  lock_complicationCollection = self->_lock_complicationCollection;
  self->_lock_complicationCollection = v4;
  v6 = v4;

  -[NTKComplicationCollection addObserver:](self->_lock_complicationCollection, "addObserver:", self);
  os_unfair_lock_unlock(p_lock);
  -[NTKCompanionWidgetComplicationManager _fetchInstalledApps](self, "_fetchInstalledApps");
}

- (void)enumerateDescriptorsCompatibleWithFamilies:(id)a3 withBlock:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  p_lock = &self->_lock;
  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)-[NSMutableDictionary copy](self->_lock_clientToRecords, "copy");
  os_unfair_lock_unlock(p_lock);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke;
  v12[3] = &unk_1E6BD5550;
  v13 = v9;
  v14 = v6;
  v10 = v6;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

}

void __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = objc_msgSend(a2, "integerValue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke_2;
  v5[3] = &unk_1E6BD9DD0;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke_3;
  v5[3] = &unk_1E6BD9DA8;
  v4 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v6 = v4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);

}

void __94__NTKCompanionWidgetComplicationManager_enumerateDescriptorsCompatibleWithFamilies_withBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "supportedClockKitFamilies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "widgetDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))(v9, v10, a4);

  }
}

- (id)infoForDescriptor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NTKWidgetComplicationInfo *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSDictionary *lock_appLookup;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_descriptorToRecord, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v6, "appName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKCompanionWidgetComplicationManager infoForDescriptor:].cold.3((uint64_t)v4, v6, v9);

    objc_msgSend(v4, "containerBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[NTKWidgetComplicationInfo initWithAppName:displayName:]([NTKWidgetComplicationInfo alloc], "initWithAppName:displayName:", v7, v8);

  if (!v10)
  {
LABEL_7:
    _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[NTKCompanionWidgetComplicationManager infoForDescriptor:].cold.2();

    +[NTKCompanionWidgetFallbackPreviewProvider sharedInstance](NTKCompanionWidgetFallbackPreviewProvider, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fallbackInfoForDescriptor:", v4);
    v10 = (NTKWidgetComplicationInfo *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NTKCompanionWidgetComplicationManager infoForDescriptor:].cold.1();

      os_unfair_lock_lock(&self->_lock);
      lock_appLookup = self->_lock_appLookup;
      objc_msgSend(v4, "containerBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](lock_appLookup, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applicationName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(p_lock);
      v18 = v17;
      v10 = -[NTKWidgetComplicationInfo initWithAppName:displayName:]([NTKWidgetComplicationInfo alloc], "initWithAppName:displayName:", v18, v18);

    }
  }

  return v10;
}

- (BOOL)vendorExistsWithDescriptor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_clientToRecords;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  id obj;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_clientToRecords = self->_lock_clientToRecords;
  objc_msgSend(v4, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](lock_clientToRecords, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "widgetDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "extensionBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "extensionBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
        {
          objc_msgSend(v13, "widgetDescriptor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "kind");
          v18 = v11;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "kind");
          v20 = v4;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v19, "isEqualToString:", v21);

          v4 = v20;
          v11 = v18;

          if ((v25 & 1) != 0)
          {
            v22 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)vendorExistsForContainerBundleIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_clientToRecords, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = objc_msgSend(v6, "count") != 0;

  return (char)p_lock;
}

- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_clientToRecords;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v23;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_clientToRecords = self->_lock_clientToRecords;
  v27 = v6;
  objc_msgSend(v6, "containerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](lock_clientToRecords, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v13, "widgetDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "extensionBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "extensionBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
        {
          objc_msgSend(v13, "widgetDescriptor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "kind");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "kind");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (v20)
          {
            v31 = 0;
            v32 = &v31;
            v33 = 0x2020000000;
            v34 = 0;
            objc_msgSend(v13, "supportedClockKitFamilies");
            v21 = objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __77__NTKCompanionWidgetComplicationManager_isComplicationAvailable_forFamilies___block_invoke;
            v28[3] = &unk_1E6BCF8C8;
            v29 = v24;
            v30 = &v31;
            objc_msgSend((id)v21, "enumerateObjectsUsingBlock:", v28);

            LOBYTE(v21) = *((_BYTE *)v32 + 24) == 0;
            _Block_object_dispose(&v31, 8);
            if ((v21 & 1) == 0)
            {
              LOBYTE(v11) = 1;
              goto LABEL_13;
            }
          }
        }
        else
        {

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v11);
  }
LABEL_13:

  return v11;
}

uint64_t __77__NTKCompanionWidgetComplicationManager_isComplicationAvailable_forFamilies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
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

- (void)_updateLoaded
{
  os_unfair_lock_s *p_lock;
  void *v4;
  int loaded;
  int lock_collectionLoaded;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_lock_loadCompletionBlocks, "copy");
  if (!self->_lock_appsLoaded)
  {
    self->_loaded = 0;
LABEL_10:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_11;
  }
  loaded = self->_loaded;
  lock_collectionLoaded = self->_lock_collectionLoaded;
  self->_loaded = lock_collectionLoaded;
  if (loaded == lock_collectionLoaded || lock_collectionLoaded == 0)
    goto LABEL_10;
  -[NSMutableArray removeAllObjects](self->_lock_loadCompletionBlocks, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "NTKCompanionWidgetComplicationManager loaded", buf, 2u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__NTKCompanionWidgetComplicationManager__updateLoaded__block_invoke;
  v9[3] = &unk_1E6BCD778;
  v9[4] = self;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

LABEL_11:
}

void __54__NTKCompanionWidgetComplicationManager__updateLoaded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
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
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKCompanionWidgetComplicationManagerDidLoadNotification"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NTKWidgetComplicationProviderComplicationsDidChange"), *(_QWORD *)(a1 + 32));

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_lock_updateAppNames
{
  void *v3;
  _QWORD v4[5];

  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary allKeys](self->_lock_clientToRecords, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__NTKCompanionWidgetComplicationManager__lock_updateAppNames__block_invoke;
  v4[3] = &unk_1E6BCD930;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __61__NTKCompanionWidgetComplicationManager__lock_updateAppNames__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_updateAppNamesForClientIdentifer:", a2);
}

- (void)_lock_updateAppNamesForClientIdentifer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_clientToRecords, "objectForKeyedSubscript:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[NSDictionary objectForKeyedSubscript:](self->_lock_appLookup, "objectForKeyedSubscript:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "applicationName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAppName:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_fetchInstalledApps
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  _BOOL4 lock_wantsAppFetch;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_fetchingApps)
  {
    _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      lock_wantsAppFetch = self->_lock_wantsAppFetch;
      v6[0] = 67109120;
      v6[1] = lock_wantsAppFetch;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Attempted to fetch installed apps while already fetching installed apps! Deferring until after the first operation completes... (previously defered=%d)", (uint8_t *)v6, 8u);
    }

    self->_lock_wantsAppFetch = 1;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    -[NTKCompanionWidgetComplicationManager _updateInstalledApps](self, "_updateInstalledApps");
  }
}

- (void)_updateInstalledApps
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD block[6];
  _QWORD v15[5];
  id v16;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_lock_fetchingApps = 1;
  os_unfair_lock_unlock(p_lock);
  -[CLKDevice nrDevice](self->_device, "nrDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__52;
  v15[4] = __Block_byref_object_dispose__52;
  v16 = (id)objc_opt_new();
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke;
  block[3] = &unk_1E6BD1498;
  block[4] = self;
  block[5] = v15;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);
  objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_2;
  v10[3] = &unk_1E6BD9DF8;
  v8 = v4;
  v11 = v8;
  v9 = v5;
  v12 = v9;
  v13 = v15;
  objc_msgSend(v7, "enumerateInstalledApplicationsOnPairedDevice:withBlock:", v8, v10);

  _Block_object_dispose(v15, 8);
}

void __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    *(_DWORD *)buf = 134217984;
    v10 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Updated app records: %lu", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
  objc_msgSend(v4, "_setAppLookup:", v5);

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
  v6 = *(_QWORD *)(a1 + 32);
  LODWORD(v4) = *(unsigned __int8 *)(v6 + 59);
  *(_BYTE *)(v6 + 58) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 59) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
  if ((_DWORD)v4)
  {
    _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching apps, but beginning a backlogged refresh", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_54;
    block[3] = &unk_1E6BCD5F0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateInstalledApps");
}

uint64_t __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "watchKitAppExtensionBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v5, "bundleIdentifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v5, v12);
  }
  else
  {
    if (v6)
    {
      _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_2_cold_1(a1);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

  return 1;
}

- (void)_setAppLookup:(id)a3
{
  NSDictionary *v4;
  NSDictionary *lock_appLookup;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_appLookup = self->_lock_appLookup;
  self->_lock_appLookup = v4;

  -[NTKCompanionWidgetComplicationManager _lock_updateAppNames](self, "_lock_updateAppNames");
  self->_lock_appsLoaded = 1;
  os_unfair_lock_unlock(&self->_lock);
  -[NTKCompanionWidgetComplicationManager _updateLoaded](self, "_updateLoaded");
}

- (id)cachedWidgetMigrationForClientIdentifier:(id)a3 descriptor:(id)a4
{
  return 0;
}

- (void)_lock_updateRecordsForClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMapTable *lock_descriptorToRecord;
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
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[NTKComplicationCollection complicationDescriptorsForClientIdentifier:](self->_lock_complicationCollection, "complicationDescriptorsForClientIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setComplicationDescriptor:", v12);
        objc_msgSend(v12, "widgetDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWidgetDescriptor:", v14);

        objc_msgSend(v12, "supportedFamilies");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(v13, "setSupportedClockKitFamilies:", v16);

        objc_msgSend(v12, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDisplayName:", v17);

        -[NSDictionary objectForKeyedSubscript:](self->_lock_appLookup, "objectForKeyedSubscript:", v4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "applicationName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAppName:", v19);

        objc_msgSend(v7, "addObject:", v13);
        lock_descriptorToRecord = self->_lock_descriptorToRecord;
        objc_msgSend(v13, "widgetDescriptor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](lock_descriptorToRecord, "setObject:forKey:", v13, v21);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
  {
    v22 = (void *)objc_msgSend(v7, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_clientToRecords, "setObject:forKeyedSubscript:", v22, v4);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_lock_clientToRecords, "removeObjectForKey:", v4);
  }

}

- (void)_lock_updateRecordsForAllClients
{
  void *v3;
  uint64_t v4;
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
  os_unfair_lock_assert_owner(&self->_lock);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NTKComplicationCollection clients](self->_lock_complicationCollection, "clients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NTKCompanionWidgetComplicationManager _lock_updateRecordsForClientIdentifier:](self, "_lock_updateRecordsForClientIdentifier:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)complicationCollectionDidLoad:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Complication collection did load", v6, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NTKCompanionWidgetComplicationManager _lock_updateRecordsForAllClients](self, "_lock_updateRecordsForAllClients");
  self->_lock_collectionLoaded = 1;
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("NTKCompanionWidgetComplicationManagerComplicationTemplatesDidChange"), self);

  -[NTKCompanionWidgetComplicationManager _updateLoaded](self, "_updateLoaded");
}

- (void)complicationCollectionDidReload:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Complication collection did reload", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NTKCompanionWidgetComplicationManager _lock_updateRecordsForAllClients](self, "_lock_updateRecordsForAllClients");
  self->_lock_collectionLoaded = 1;
  os_unfair_lock_unlock(&self->_lock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NTKCompanionWidgetComplicationManager_complicationCollectionDidReload___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __73__NTKCompanionWidgetComplicationManager_complicationCollectionDidReload___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKWidgetComplicationProviderComplicationsDidChange"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NTKCompanionWidgetComplicationManagerComplicationTemplatesDidChange"), *(_QWORD *)(a1 + 32));

}

- (void)complicationCollection:(id)a3 didUpdateSampleTemplateForClient:(id)a4 descriptor:(id)a5
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("NTKCompanionWidgetComplicationManagerComplicationTemplatesDidChange"), self);

}

- (void)complicationCollection:(id)a3 didUpdateComplicationDescriptorsForClient:(id)a4
{
  id v6;
  NTKComplicationCollection *v7;
  NTKComplicationCollection *lock_complicationCollection;
  _QWORD block[5];

  v6 = a4;
  v7 = (NTKComplicationCollection *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_complicationCollection = self->_lock_complicationCollection;

  if (lock_complicationCollection == v7)
  {
    -[NTKCompanionWidgetComplicationManager _lock_updateRecordsForClientIdentifier:](self, "_lock_updateRecordsForClientIdentifier:", v6);
    os_unfair_lock_unlock(&self->_lock);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__NTKCompanionWidgetComplicationManager_complicationCollection_didUpdateComplicationDescriptorsForClient___block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

void __106__NTKCompanionWidgetComplicationManager_complicationCollection_didUpdateComplicationDescriptorsForClient___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKWidgetComplicationProviderComplicationsDidChange"), *(_QWORD *)(a1 + 32));

}

- (id)sampleTemplateForWidget:(id)a3 family:(int64_t)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NTKCompanionWidgetComplicationManager _lock_sampleTemplateForWidget:family:](self, "_lock_sampleTemplateForWidget:family:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (!v8)
  {
    _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKCompanionWidgetComplicationManager sampleTemplateForWidget:family:].cold.1();

    +[NTKCompanionWidgetFallbackPreviewProvider sharedInstance](NTKCompanionWidgetFallbackPreviewProvider, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fallbackSampleTemplateForDescriptor:family:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_lock_sampleTemplateForWidget:(id)a3 family:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NTKComplicationCollection *lock_complicationCollection;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_collectionLoaded)
  {
    -[NSMapTable objectForKey:](self->_lock_descriptorToRecord, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NTKCompanionWidgetComplicationManager _lock_sampleTemplateForWidget:family:].cold.2();
      v12 = 0;
      goto LABEL_12;
    }
    lock_complicationCollection = self->_lock_complicationCollection;
    objc_msgSend(v6, "containerBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject complicationDescriptor](v7, "complicationDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationCollection sampleTemplateForClientIdentifier:descriptor:applicationID:family:](lock_complicationCollection, "sampleTemplateForClientIdentifier:descriptor:applicationID:family:", v9, v10, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NTKCompanionWidgetComplicationManager _lock_sampleTemplateForWidget:family:].cold.3();
LABEL_12:

    }
  }
  else
  {
    _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NTKCompanionWidgetComplicationManager _lock_sampleTemplateForWidget:family:].cold.1();
    v12 = 0;
  }

  return v12;
}

- (id)cachedWidgetMigrationForAppIdentifier:(id)a3 descriptor:(id)a4
{
  return 0;
}

- (void)loadWidgetMigrationsForAppIdentifier:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_loadCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_lock_appLookup, 0);
  objc_storeStrong((id *)&self->_lock_descriptorToRecord, 0);
  objc_storeStrong((id *)&self->_lock_clientToRecords, 0);
  objc_storeStrong((id *)&self->_lock_complicationCollection, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)infoForDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Missing record and fallback preview provision for %@. Looking up remote app name for display.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)infoForDescriptor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Missing record for %@. Querying fallback preview provider.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)infoForDescriptor:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "appName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_ERROR, "Incomplete record for %@: %@ %@", (uint8_t *)&v8, 0x20u);

}

void __61__NTKCompanionWidgetComplicationManager__updateInstalledApps__block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "pairingID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "Couldn't fetch apps on device id %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)sampleTemplateForWidget:family:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Missing sample template for %@. Querying fallback preview provider.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_sampleTemplateForWidget:family:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "NTKCompanionWidgetComplicationManager failed to find sample template, collection not loaded %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_sampleTemplateForWidget:family:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "NTKCompanionWidgetComplicationManager failed to find sample template, failed to get record %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_sampleTemplateForWidget:family:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  CLKComplicationFamilyDescription();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v1, v2, "NTKCompanionWidgetComplicationManager failed to find sample template for family=%@ descriptor=%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_8();
}

@end
