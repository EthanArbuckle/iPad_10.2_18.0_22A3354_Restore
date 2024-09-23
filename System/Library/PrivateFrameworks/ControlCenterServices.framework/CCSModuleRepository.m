@implementation CCSModuleRepository

void __48__CCSModuleRepository_loadableModuleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSSet)loadableModuleIdentifiers
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__CCSModuleRepository_loadableModuleIdentifiers__block_invoke;
  v5[3] = &unk_24D460D08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (void)_updateAvailableModuleMetadata
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__CCSModuleRepository__updateAvailableModuleMetadata__block_invoke;
  v4[3] = &unk_24D460DC0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __60__CCSModuleRepository__queue_filterModuleMetadataByGestalt___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue") ^ 1;
}

void __53__CCSModuleRepository__updateAvailableModuleMetadata__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_updateAvailableModuleMetadata");
    WeakRetained = v2;
  }

}

- (void)_queue_updateAvailableModuleMetadata
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSDictionary allValues](self->_allModuleMetadataByIdentifier, "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CCSModuleRepository _queue_updateAvailableModuleMetadataForAllModuleMetadata:](self, "_queue_updateAvailableModuleMetadataForAllModuleMetadata:", v3);

}

- (void)_queue_updateAvailableModuleMetadataForAllModuleMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCSModuleRepository _queue_filterModuleMetadataByAssociatedBundleAvailability:](self, "_queue_filterModuleMetadataByAssociatedBundleAvailability:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSModuleRepository _queue_filterModuleMetadataByVisibilityPreference:](self, "_queue_filterModuleMetadataByVisibilityPreference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCSModuleRepository _queue_moduleIdentifiersForMetadata:](self, "_queue_moduleIdentifiersForMetadata:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_availableModuleIdentifiers, v6);
    -[CCSModuleRepository _queue_updateGestaltQuestionsForModuleMetadata:](self, "_queue_updateGestaltQuestionsForModuleMetadata:", v5);
    -[CCSModuleRepository _queue_updateLoadableModuleMetadataForAvailableModuleMetadata:](self, "_queue_updateLoadableModuleMetadataForAvailableModuleMetadata:", v5);
  }

}

- (id)_queue_filterModuleMetadataByVisibilityPreference:(id)a3
{
  NSObject *queue;
  id v4;
  void *v5;

  queue = self->_queue;
  v4 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_46);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_queue_filterModuleMetadataByAssociatedBundleAvailability:(id)a3
{
  NSObject *queue;
  id v4;
  void *v5;

  queue = self->_queue;
  v4 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_43_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_queue_updateLoadableModuleMetadataForAvailableModuleMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCSModuleRepository _queue_filterModuleMetadataByGestalt:](self, "_queue_filterModuleMetadataByGestalt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSModuleRepository _queue_moduleIdentifiersForMetadata:](self, "_queue_moduleIdentifiersForMetadata:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_loadableModuleIdentifiers, v6);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __85__CCSModuleRepository__queue_updateLoadableModuleMetadataForAvailableModuleMetadata___block_invoke;
    v7[3] = &unk_24D460EF0;
    v7[4] = self;
    -[CCSModuleRepository _queue_runBlockOnObservers:](self, "_queue_runBlockOnObservers:", v7);
  }

}

- (void)_queue_updateGestaltQuestionsForModuleMetadata:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCSModuleRepository _queue_gestaltQuestionsForModuleMetadata:](self, "_queue_gestaltQuestionsForModuleMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSModuleRepository _queue_stopObservingGestaltQuestions](self, "_queue_stopObservingGestaltQuestions");
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__CCSModuleRepository__queue_updateGestaltQuestionsForModuleMetadata___block_invoke;
  v6[3] = &unk_24D460DC0;
  objc_copyWeak(&v7, &location);
  -[CCSModuleRepository _queue_startObservingMobileGestaltQuestions:withChangeHandler:](self, "_queue_startObservingMobileGestaltQuestions:withChangeHandler:", v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_queue_stopObservingGestaltQuestions
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_mobileGestaltNotificationToken != (MGNotificationTokenStruct *)-1)
  {
    MGCancelNotifications();
    self->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)-1;
  }
}

- (void)_queue_startObservingMobileGestaltQuestions:(id)a3 withChangeHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v6, "count"))
  {
    v8 = v7;
    self->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)MGRegisterForBulkUpdates();

  }
}

- (void)_queue_runBlockOnObservers:(id)a3
{
  id v4;
  void *v5;
  NSObject *callOutQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__CCSModuleRepository__queue_runBlockOnObservers___block_invoke;
  v9[3] = &unk_24D460A70;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(callOutQueue, v9);

}

- (id)_queue_filterModuleMetadataByGestalt:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[CCSModuleRepository _queue_gestaltQuestionsForModuleMetadata:](self, "_queue_gestaltQuestionsForModuleMetadata:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MGCopyMultipleAnswers();
  objc_msgSend(v7, "bs_filter:", &__block_literal_global_48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v8, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__CCSModuleRepository__queue_filterModuleMetadataByGestalt___block_invoke_2;
  v19[3] = &unk_24D461068;
  v20 = v11;
  v21 = v14;
  v15 = v14;
  v16 = v11;
  objc_msgSend(v5, "bs_filter:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __81__CCSModuleRepository__queue_filterModuleMetadataByAssociatedBundleAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  uint64_t v15;
  id v16;

  v2 = a2;
  objc_msgSend(v2, "associatedBundleIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v16);
    v5 = v16;
    if (v4)
    {
      objc_msgSend(v4, "applicationState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isInstalled"))
        goto LABEL_7;
      if ((objc_msgSend(v6, "isRestricted") & 1) != 0)
        goto LABEL_7;
      objc_msgSend(v2, "associatedBundleMinimumVersion");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_15;
      v8 = (void *)v7;
      objc_msgSend(v4, "shortVersionString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "compare:options:", v9, 65);

      if (v10 == 1)
      {
LABEL_7:
        v11 = 0;
      }
      else
      {
LABEL_15:
        v14 = (void *)CFPreferencesCopyAppValue(CFSTR("SBIconVisibility"), v3);
        v15 = CCSVisibilityPreferenceForBundleRecord(v4);
        v11 = CCSResolveModuleVisibility(v14, v15, 1);

      }
    }
    else
    {
      v12 = CCSLogModuleSettings;
      if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR))
        __81__CCSModuleRepository__queue_filterModuleMetadataByAssociatedBundleAvailability___block_invoke_cold_1((uint64_t)v3, (uint64_t)v5, v12);
      v11 = 0;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __73__CCSModuleRepository__queue_filterModuleMetadataByVisibilityPreference___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a2;
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SBIconVisibility"), (CFStringRef)objc_msgSend(v2, "moduleIdentifier"));
  v4 = objc_msgSend(v2, "visibilityPreference");

  v5 = CCSResolveModuleVisibility(v3, v4, 1);
  return v5;
}

- (id)moduleMetadataForModuleIdentifier:(id)a3
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
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CCSModuleRepository_moduleMetadataForModuleIdentifier___block_invoke;
  block[3] = &unk_24D460E38;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)visibilityForModuleIdentifier:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SBIconVisibility"), (CFStringRef)a3);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_queue_moduleIdentifiersForMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "moduleIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

void __57__CCSModuleRepository_moduleMetadataForModuleIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __60__CCSModuleRepository__queue_filterModuleMetadataByGestalt___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "requiredDeviceCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count")
    && (!objc_msgSend(v4, "isSubsetOfSet:", *(_QWORD *)(a1 + 32))
     || (objc_msgSend(v4, "intersectsSet:", *(_QWORD *)(a1 + 40)) & 1) != 0))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "requiredDeviceIncapabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v6, "isSubsetOfSet:", *(_QWORD *)(a1 + 32)))
        v5 = objc_msgSend(v6, "isSubsetOfSet:", *(_QWORD *)(a1 + 40));
      else
        v5 = 0;
    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (id)_queue_gestaltQuestionsForModuleMetadata:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "requiredDeviceCapabilities", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v12);

        objc_msgSend(v11, "requiredDeviceIncapabilities");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setVisibility:(BOOL)a3 forModuleIdentifier:(id)a4
{
  CFPropertyListRef *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v4 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("SBIconVisibility"), *v4, (CFStringRef)a4);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, 0, 1u);
}

uint64_t __50__CCSModuleRepository__queue_runBlockOnObservers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bs_each:", *(_QWORD *)(a1 + 40));
}

uint64_t __85__CCSModuleRepository__queue_updateLoadableModuleMetadataForAvailableModuleMetadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loadableModulesChangedForModuleRepository:", *(_QWORD *)(a1 + 32));
}

+ (id)_deviceFamily
{
  if (_deviceFamily_onceToken != -1)
    dispatch_once(&_deviceFamily_onceToken, &__block_literal_global_5);
  return (id)_deviceFamily_deviceFamily;
}

void __36__CCSModuleRepository__deviceFamily__block_invoke()
{
  void *v0;
  unsigned int v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "deviceClass");

  if (v1 <= 2)
  {
    v2 = (void *)_deviceFamily_deviceFamily;
    _deviceFamily_deviceFamily = qword_24D4610B0[v1];

  }
}

+ (CCSModuleRepository)repositoryWithDefaults
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_defaultModuleDirectories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultModuleIdentifierAllowedList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "_initWithDirectoryURLs:allowedModuleIdentifiers:", v4, v5);

  return (CCSModuleRepository *)v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    CCSRegisterControlCenterLogging();
}

- (id)_initWithDirectoryURLs:(id)a3 allowedModuleIdentifiers:(id)a4
{
  id v6;
  id v7;
  CCSModuleRepository *v8;
  uint64_t v9;
  NSArray *directoryURLs;
  uint64_t v11;
  NSSet *allowedModuleIdentifiers;
  uint64_t v13;
  NSHashTable *observers;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *callOutQueue;
  NSObject *v21;
  _QWORD block[4];
  CCSModuleRepository *v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CCSModuleRepository;
  v8 = -[CCSModuleRepository init](&v25, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    directoryURLs = v8->_directoryURLs;
    v8->_directoryURLs = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    allowedModuleIdentifiers = v8->_allowedModuleIdentifiers;
    v8->_allowedModuleIdentifiers = (NSSet *)v11;

    v8->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)-1;
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v13 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.ControlCenter.ModuleRepository", v15);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.ControlCenter.ModuleRepository.callout", v18);
    callOutQueue = v8->_callOutQueue;
    v8->_callOutQueue = (OS_dispatch_queue *)v19;

    v21 = v8->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__CCSModuleRepository__initWithDirectoryURLs_allowedModuleIdentifiers___block_invoke;
    block[3] = &unk_24D460CE0;
    v24 = v8;
    dispatch_sync(v21, block);

  }
  return v8;
}

uint64_t __71__CCSModuleRepository__initWithDirectoryURLs_allowedModuleIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllModuleMetadata");
  v2 = *(void **)(a1 + 32);
  +[CCSControlCenterDefaults standardDefaults](CCSControlCenterDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_setIgnoreAllowedList:", objc_msgSend(v3, "shouldEnablePrototypeFeatures"));

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_queue_registerForVisiblityPreferenceChanges");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_registerForInternalPreferenceChanges");
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CCSModuleRepository_invalidate__block_invoke;
  block[3] = &unk_24D460CE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __33__CCSModuleRepository_invalidate__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_queue_unregisterForVisiblityPreferenceChanges");
  objc_msgSend(*(id *)(a1 + 32), "_queue_unregisterForInternalPreferenceChanges");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopObservingGestaltQuestions");
}

- (void)_queue_setIgnoreAllowedList:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CCSIsInternalInstall())
  {
    if (self->_ignoreAllowedList != v3)
    {
      self->_ignoreAllowedList = v3;
      -[CCSModuleRepository _queue_updateAllModuleMetadata](self, "_queue_updateAllModuleMetadata");
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__CCSModuleRepository_addObserver___block_invoke;
  block[3] = &unk_24D460D30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __35__CCSModuleRepository_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CCSModuleRepository_removeObserver___block_invoke;
  block[3] = &unk_24D460D30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __38__CCSModuleRepository_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_applicationsDidChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CCSModuleRepository__applicationsDidChange___block_invoke;
  block[3] = &unk_24D460E60;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__CCSModuleRepository__applicationsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_queue_arrayContainsInterestingApplicationProxy:", *(_QWORD *)(a1 + 32));
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "_queue_updateAvailableModuleMetadata");
      v3 = v5;
    }
  }

}

+ (id)_defaultModuleDirectories
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (CCSIsInternalInstall())
  {
    +[CCSControlCenterDefaults standardDefaults](CCSControlCenterDefaults, "standardDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldEnableInternalModules");

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", &unk_24D464AC0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "arrayByAddingObject:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v6;
    }
  }
  objc_msgSend(v2, "bs_map:", &__block_literal_global_16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __48__CCSModuleRepository__defaultModuleDirectories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = a2;
  BSSystemRootDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = v3;
  v8[2] = CFSTR("ControlCenter");
  v8[3] = CFSTR("Bundles");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultModuleIdentifierAllowedList
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("ModuleAllowedList"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_queue_updateAllModuleMetadata
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCSModuleRepository _queue_loadAllModuleMetadata](self, "_queue_loadAllModuleMetadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CCSModuleRepository _queue_updateAllModuleMetadataForAllModuleMetadata:](self, "_queue_updateAllModuleMetadataForAllModuleMetadata:", v3);

}

- (void)_queue_updateLoadableModuleMetadata
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSSet allObjects](self->_availableModuleIdentifiers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__CCSModuleRepository__queue_updateLoadableModuleMetadata__block_invoke;
  v5[3] = &unk_24D460EC8;
  v5[4] = self;
  objc_msgSend(v3, "bs_mapNoNulls:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCSModuleRepository _queue_updateLoadableModuleMetadataForAvailableModuleMetadata:](self, "_queue_updateLoadableModuleMetadataForAvailableModuleMetadata:", v4);
}

uint64_t __58__CCSModuleRepository__queue_updateLoadableModuleMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "moduleMetadataForModuleIdentifier:", a2);
}

- (void)_queue_updateAllModuleMetadataForAllModuleMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *allModuleMetadataByIdentifier;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "moduleIdentifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if ((BSEqualObjects() & 1) == 0)
  {
    v13 = (NSDictionary *)objc_msgSend(v5, "copy");
    allModuleMetadataByIdentifier = self->_allModuleMetadataByIdentifier;
    self->_allModuleMetadataByIdentifier = v13;

    -[CCSModuleRepository _queue_updateInterestingBundleIdentifiersForModuleMetadata:](self, "_queue_updateInterestingBundleIdentifiersForModuleMetadata:", v6);
    -[CCSModuleRepository _queue_updateAvailableModuleMetadataForAllModuleMetadata:](self, "_queue_updateAvailableModuleMetadataForAllModuleMetadata:", v6);
  }

}

- (id)_queue_loadAllModuleMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSArray bs_mapNoNulls:](self->_directoryURLs, "bs_mapNoNulls:", &__block_literal_global_35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_38);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__CCSModuleRepository__queue_loadAllModuleMetadata__block_invoke_3;
  v8[3] = &unk_24D460F98;
  v8[4] = self;
  objc_msgSend(v5, "bs_mapNoNulls:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__CCSModuleRepository__queue_loadAllModuleMetadata__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1580];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __51__CCSModuleRepository__queue_loadAllModuleMetadata__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("bundle")) == 0;

  return v3;
}

id __51__CCSModuleRepository__queue_loadAllModuleMetadata__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  const char *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[CCSModuleMetadata metadataForBundleAtURL:](CCSModuleMetadata, "metadataForBundleAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CCSLogModuleSettings;
  if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_215C14000, v5, OS_LOG_TYPE_DEFAULT, "Found module metadata at URL %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 80))
  {
    v7 = *(void **)(v6 + 16);
    objc_msgSend(v4, "moduleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "containsObject:", v8);

    if ((v7 & 1) == 0)
    {
      v13 = CCSLogModuleSettings;
      if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543362;
        v17 = v3;
        v14 = "Ignoring disallowed module at URL: %{public}@";
        goto LABEL_11;
      }
LABEL_12:
      v12 = 0;
      goto LABEL_13;
    }
  }
  objc_msgSend(v4, "supportedDeviceFamilies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_deviceFamily");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) == 0)
  {
    v13 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v3;
      v14 = "Ignoring unsupported module at URL: %{public}@";
LABEL_11:
      _os_log_impl(&dword_215C14000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v12 = v4;
LABEL_13:

  return v12;
}

- (void)_queue_updateInterestingBundleIdentifiersForModuleMetadata:(id)a3
{
  NSObject *queue;
  id v5;
  NSSet *v6;
  NSSet *interestingBundleIdentifiers;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[CCSModuleRepository _queue_associatedBundleIdentifiersForModuleMetadata:](self, "_queue_associatedBundleIdentifiersForModuleMetadata:", v5);
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();

  interestingBundleIdentifiers = self->_interestingBundleIdentifiers;
  self->_interestingBundleIdentifiers = v6;

}

- (id)_queue_associatedBundleIdentifiersForModuleMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "associatedBundleIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bs_safeAddObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (BOOL)_queue_arrayContainsInterestingApplicationProxy:(id)a3
{
  CCSModuleRepository *v3;
  NSObject *queue;
  id v5;
  _QWORD v7[5];

  v3 = self;
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__CCSModuleRepository__queue_arrayContainsInterestingApplicationProxy___block_invoke;
  v7[3] = &unk_24D461000;
  v7[4] = v3;
  LOBYTE(v3) = objc_msgSend(v5, "bs_containsObjectPassingTest:", v7);

  return (char)v3;
}

uint64_t __71__CCSModuleRepository__queue_arrayContainsInterestingApplicationProxy___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)_queue_registerForVisiblityPreferenceChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_SBIconVisibilityNotificationRecieved, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_queue_unregisterForVisiblityPreferenceChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0);
}

void __70__CCSModuleRepository__queue_updateGestaltQuestionsForModuleMetadata___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updateLoadableModuleMetadata");

}

uint64_t __85__CCSModuleRepository__queue_startObservingMobileGestaltQuestions_withChangeHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_queue_registerForInternalPreferenceChanges
{
  void *v3;
  OS_dispatch_queue *queue;
  BSDefaultObserver *v5;
  BSDefaultObserver *internalDefaultsObserver;
  _QWORD v7[4];
  id v8;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  +[CCSControlCenterDefaults standardDefaults](CCSControlCenterDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__CCSModuleRepository__queue_registerForInternalPreferenceChanges__block_invoke;
  v7[3] = &unk_24D460DC0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "observeDefault:onQueue:withBlock:", CFSTR("shouldEnablePrototypeFeatures"), queue, v7);
  v5 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
  internalDefaultsObserver = self->_internalDefaultsObserver;
  self->_internalDefaultsObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__CCSModuleRepository__queue_registerForInternalPreferenceChanges__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[CCSControlCenterDefaults standardDefaults](CCSControlCenterDefaults, "standardDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_queue_setIgnoreAllowedList:", objc_msgSend(v1, "shouldEnablePrototypeFeatures"));

}

- (void)_queue_unregisterForInternalPreferenceChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BSDefaultObserver invalidate](self->_internalDefaultsObserver, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loadableModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_internalDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_interestingBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allModuleMetadataByIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_directoryURLs, 0);
}

void __81__CCSModuleRepository__queue_filterModuleMetadataByAssociatedBundleAvailability___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_215C14000, log, OS_LOG_TYPE_ERROR, "Error obtaining application record for object with associated bundleID %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
