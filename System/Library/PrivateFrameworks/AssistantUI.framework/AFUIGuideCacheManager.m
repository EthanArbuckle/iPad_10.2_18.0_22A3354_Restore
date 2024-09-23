@implementation AFUIGuideCacheManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__AFUIGuideCacheManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

void __38__AFUIGuideCacheManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

- (AFUIGuideCacheManager)init
{
  AFUIGuideCacheManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *cacheFileQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFUIGuideCacheManager;
  v2 = -[AFUIGuideCacheManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.siri.AFUIGuideCacheManager", MEMORY[0x24BDAC9C0]);
    cacheFileQueue = v2->_cacheFileQueue;
    v2->_cacheFileQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleKeyboardPreferencesChanged, CFSTR("AppleKeyboardsPreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("AppleKeyboardsPreferencesChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)AFUIGuideCacheManager;
  -[AFUIGuideCacheManager dealloc](&v4, sel_dealloc);
}

- (NSNumber)cachedGuideTag
{
  void *v2;
  void *v3;

  -[AFUIGuideCacheManager _cachedGuideUpdate](self, "_cachedGuideUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guideTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (SAGuidanceGuideSnippet)cachedGuideSnippet
{
  void *v2;
  void *v3;

  -[AFUIGuideCacheManager _cachedGuideUpdate](self, "_cachedGuideUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guideSnippet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAGuidanceGuideSnippet *)v3;
}

- (SAGuidanceSuggestedUtterances)cachedSuggestedUtterances
{
  void *v2;
  void *v3;

  -[AFUIGuideCacheManager _cachedGuideUpdate](self, "_cachedGuideUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestedUtterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAGuidanceSuggestedUtterances *)v3;
}

- (BOOL)shouldCheckForUpdateWithLastAppUpdateTime:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[AFUIGuideCacheManager _shouldCheckForUpdateAtDate:lastAppUpdateTime:](self, "_shouldCheckForUpdateAtDate:lastAppUpdateTime:", v6, v5);

  return (char)self;
}

- (void)updateLastCheckedDate
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIGuideCacheManager _updateLastCheckedWithDate:](self, "_updateLastCheckedWithDate:", v3);

}

- (void)updateCacheWithGuideUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *cacheFileQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  AFUIGuideCacheManager *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFUIGuideCacheManager updateCacheWithGuideUpdate:completion:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  cacheFileQueue = self->_cacheFileQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke;
  block[3] = &unk_24D7A2DF0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_barrier_async(cacheFileQueue, block);

}

void __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke(id *a1)
{
  os_log_t *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  _QWORD *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[AFUIGuideCacheManager updateCacheWithGuideUpdate:completion:]_block_invoke";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", buf, 0xCu);
  }
  objc_msgSend(a1[4], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v20;
  objc_msgSend(a1[5], "_pathForCachedGuideUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v19 = v6;
    v8 = objc_msgSend(v5, "writeToFile:options:error:", v7, 1, &v19);
    v9 = v19;

    if ((v8 & 1) != 0)
    {
      v10 = a1[5];
      v11 = (void *)v10[1];
      v10[1] = 0;

      v12 = 1;
    }
    else
    {
      v13 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
        __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_cold_2((uint64_t)v7, (uint64_t)v9, v13);
      v12 = 0;
    }
    v6 = v9;
  }
  else
  {
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_cold_1();
    v12 = 0;
  }
  if (a1[6])
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_8;
    block[3] = &unk_24D7A2DC8;
    v17 = a1[6];
    v18 = v12;
    v16 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  v14 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[AFUIGuideCacheManager updateCacheWithGuideUpdate:completion:]_block_invoke_2";
    _os_log_impl(&dword_217514000, v14, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", buf, 0xCu);
  }

}

uint64_t __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_clearCachedGuide
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *cacheFileQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  AFUIGuideCacheManager *v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[AFUIGuideCacheManager _clearCachedGuide]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[AFUIGuideCacheManager _pathForCachedGuideUpdate](self, "_pathForCachedGuideUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cacheFileQueue = self->_cacheFileQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AFUIGuideCacheManager__clearCachedGuide__block_invoke;
  block[3] = &unk_24D7A2410;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_barrier_async(cacheFileQueue, block);

}

void __42__AFUIGuideCacheManager__clearCachedGuide__block_invoke(_QWORD *a1)
{
  os_log_t *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFUIGuideCacheManager _clearCachedGuide]_block_invoke";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", buf, 0xCu);
  }
  v4 = (void *)a1[4];
  v5 = a1[5];
  v13 = 0;
  v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v13);
  v7 = v13;
  if ((v6 & 1) == 0)
  {
    v8 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[5];
      *(_DWORD *)buf = 136315650;
      v15 = "-[AFUIGuideCacheManager _clearCachedGuide]_block_invoke";
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s Can't remove %@: %@", buf, 0x20u);
    }
  }
  v10 = a1[6];
  v11 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = 0;

  v12 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFUIGuideCacheManager _clearCachedGuide]_block_invoke";
    _os_log_impl(&dword_217514000, v12, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", buf, 0xCu);
  }

}

- (void)_checkGuideUpdateUsingAFClientLiteWithTag:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  if (!self->_isCheckingGuideUpdate)
  {
    self->_isCheckingGuideUpdate = 1;
    v5 = objc_alloc_init(MEMORY[0x24BE81280]);
    objc_msgSend(v5, "setCurrentGuideTag:", v4);
    objc_msgSend(MEMORY[0x24BE81280], "afui_guideCheckSupportedFeatures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSupportedFeatures:", v6);

    v7 = objc_alloc_init(MEMORY[0x24BE09130]);
    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke;
    v11[3] = &unk_24D7A2E58;
    objc_copyWeak(&v12, &location);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_17;
    v9[3] = &unk_24D7A2E80;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v7, "handleCommand:commandHandler:completion:", v5, v11, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  os_log_t *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s Handle guide update with command: %@", (uint8_t *)&v7, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "updateCacheWithGuideUpdate:completion:", v3, &__block_literal_global_7);
  }
  else if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_cold_1();
  }

}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_14(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:]_block_invoke";
      _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s Guide update completed successfully", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_14_cold_1(v5);
  }

}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_17(uint64_t a1, int a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = *MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (!a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_17_cold_1();
      if (!WeakRetained)
        goto LABEL_9;
    }
    else if (!WeakRetained)
    {
      goto LABEL_9;
    }
LABEL_8:
    WeakRetained[24] = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:]_block_invoke";
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_INFO, "%s Guide update succeeded", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(WeakRetained, "updateLastCheckedDate");
  if (WeakRetained)
    goto LABEL_8;
LABEL_9:

}

- (void)checkGuideUpdate
{
  id v3;

  -[AFUIGuideCacheManager cachedGuideTag](self, "cachedGuideTag");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:](self, "_checkGuideUpdateUsingAFClientLiteWithTag:", v3);

}

- (BOOL)_shouldCheckForUpdateAtDate:(id)a3 lastAppUpdateTime:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *cacheFileQueue;
  id v15;
  id v16;
  BOOL v17;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[AFUIGuideCacheManager _cachedGuideUpdate](self, "_cachedGuideUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (AFUIGetLanguageCode(),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isEqualToString:", v10),
        v10,
        (v11 & 1) != 0))
  {
    -[AFUIGuideCacheManager _pathForCachedGuideUpdate](self, "_pathForCachedGuideUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    cacheFileQueue = self->_cacheFileQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__AFUIGuideCacheManager__shouldCheckForUpdateAtDate_lastAppUpdateTime___block_invoke;
    block[3] = &unk_24D7A2EA8;
    v20 = v13;
    v21 = v12;
    v22 = v7;
    v24 = &v25;
    v23 = v6;
    v15 = v12;
    v16 = v13;
    dispatch_sync(cacheFileQueue, block);

    v17 = *((_BYTE *)v26 + 24) != 0;
  }
  else
  {
    v17 = 1;
    *((_BYTE *)v26 + 24) = 1;
  }

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __71__AFUIGuideCacheManager__shouldCheckForUpdateAtDate_lastAppUpdateTime___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFUIGuideCacheManager _shouldCheckForUpdateAtDate:lastAppUpdateTime:]_block_invoke";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0C98]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "dateByAddingTimeInterval:", 600.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

    if (v10 == -1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      v11 = *(void **)(a1 + 56);
      objc_msgSend(v8, "dateByAddingTimeInterval:", 86400.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v11, "compare:", v12) == 1;

    }
  }
  else
  {
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      __71__AFUIGuideCacheManager__shouldCheckForUpdateAtDate_lastAppUpdateTime___block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  v13 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFUIGuideCacheManager _shouldCheckForUpdateAtDate:lastAppUpdateTime:]_block_invoke";
    _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", buf, 0xCu);
  }

}

- (void)_updateLastCheckedWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *cacheFileQueue;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  -[AFUIGuideCacheManager _pathForCachedGuideUpdate](self, "_pathForCachedGuideUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  cacheFileQueue = self->_cacheFileQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__AFUIGuideCacheManager__updateLastCheckedWithDate___block_invoke;
  block[3] = &unk_24D7A2410;
  v12 = v4;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  v10 = v4;
  dispatch_barrier_async(cacheFileQueue, block);

}

void __52__AFUIGuideCacheManager__updateLastCheckedWithDate___block_invoke(_QWORD *a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFUIGuideCacheManager _updateLastCheckedWithDate:]_block_invoke";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", buf, 0xCu);
  }
  v4 = a1[4];
  v12 = *MEMORY[0x24BDD0C98];
  v13 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[6];
  v7 = (void *)a1[5];
  v11 = 0;
  v8 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v5, v6, &v11);
  v9 = v11;
  if ((v8 & 1) == 0 && os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    __52__AFUIGuideCacheManager__updateLastCheckedWithDate___block_invoke_cold_1();
  v10 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFUIGuideCacheManager _updateLastCheckedWithDate:]_block_invoke";
    _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", buf, 0xCu);
  }

}

- (id)_pathForCachedGuideUpdate
{
  return CFSTR("var/mobile/Library/Caches/com.apple.siri.SiriGuideUpdateCache.plist");
}

- (id)_cachedGuideUpdate
{
  void *v3;
  NSObject *cacheFileQueue;
  id v5;
  SAGuidanceGuideUpdate *v6;
  _QWORD v8[5];
  id v9;

  AFUIGetLanguageCode(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  cacheFileQueue = self->_cacheFileQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__AFUIGuideCacheManager__cachedGuideUpdate__block_invoke;
  v8[3] = &unk_24D7A2ED0;
  v8[4] = self;
  v9 = v3;
  v5 = v3;
  dispatch_sync(cacheFileQueue, v8);
  v6 = self->_cachedGuideUpdate;

  return v6;
}

void __43__AFUIGuideCacheManager__cachedGuideUpdate__block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[AFUIGuideCacheManager _cachedGuideUpdate]_block_invoke";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #noisy entered _cacheFileQueue", (uint8_t *)&v16, 0xCu);
  }
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[1];
  if (v5)
  {
    objc_msgSend(v5, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

    v4 = *(_QWORD **)(a1 + 32);
    if ((v7 & 1) == 0)
    {
      v8 = (void *)v4[1];
      v4[1] = 0;

      v4 = *(_QWORD **)(a1 + 32);
    }
  }
  if (!v4[1])
  {
    objc_msgSend(v4, "_pathForCachedGuideUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_aceObjectDictionaryAtFilepath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE81288]), "initWithDictionary:", v10);
      objc_msgSend(v11, "languageCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 40)))
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), v11);
      }
      else
      {
        v13 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 40);
          v16 = 136315650;
          v17 = "-[AFUIGuideCacheManager _cachedGuideUpdate]_block_invoke";
          v18 = 2112;
          v19 = v12;
          v20 = 2112;
          v21 = v14;
          _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s Cached guide language code: %@ does not match current language code: %@, ignoring cache", (uint8_t *)&v16, 0x20u);
        }
      }

    }
  }
  v15 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[AFUIGuideCacheManager _cachedGuideUpdate]_block_invoke";
    _os_log_impl(&dword_217514000, v15, OS_LOG_TYPE_DEFAULT, "%s #noisy exited _cacheFileQueue", (uint8_t *)&v16, 0xCu);
  }
}

- (id)_aceObjectDictionaryAtFilepath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
    }
    else
    {
      v8 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v12 = "-[AFUIGuideCacheManager _aceObjectDictionaryAtFilepath:]";
        v13 = 2112;
        v14 = v3;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s Can't load aceObject dictionary at: %@, %@", buf, 0x20u);
      }
      v7 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AFUIGuideCacheManager _aceObjectDictionaryAtFilepath:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheFileQueue, 0);
  objc_storeStrong((id *)&self->_cachedGuideUpdate, 0);
}

void __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_217514000, v0, v1, "%s Can't serialize %@: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __63__AFUIGuideCacheManager_updateCacheWithGuideUpdate_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[AFUIGuideCacheManager updateCacheWithGuideUpdate:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_4(&dword_217514000, a2, a3, "%s Can't write to %{public}@: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
  OUTLINED_FUNCTION_6();
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unexpected response for guide update: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_14_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[AFUIGuideCacheManager _checkGuideUpdateUsingAFClientLiteWithTag:]_block_invoke";
  _os_log_error_impl(&dword_217514000, log, OS_LOG_TYPE_ERROR, "%s Guide update failed", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __67__AFUIGuideCacheManager__checkGuideUpdateUsingAFClientLiteWithTag___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Guide update failed with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __71__AFUIGuideCacheManager__shouldCheckForUpdateAtDate_lastAppUpdateTime___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_217514000, v0, v1, "%s Can't retrieve file attributes for %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __52__AFUIGuideCacheManager__updateLastCheckedWithDate___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_217514000, v0, v1, "%s Can't update last checked date for cached guide at %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)_aceObjectDictionaryAtFilepath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Guide cache file not found at: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
