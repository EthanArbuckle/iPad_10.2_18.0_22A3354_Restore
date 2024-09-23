@implementation ANAccessorySettingsCache

- (ANAccessorySettingsCache)initWithAccessorySettingsDataSource:(id)a3
{
  id v5;
  ANAccessorySettingsCache *v6;
  uint64_t v7;
  OS_os_log *log;
  dispatch_queue_t v9;
  OS_dispatch_queue *settingsQueue;
  uint64_t v11;
  NSMutableDictionary *cachedAccessorySettings;
  uint64_t v13;
  NSMutableDictionary *lastAccessorySettingsFetch;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ANAccessorySettingsCache;
  v6 = -[ANAccessorySettingsCache init](&v16, sel_init);
  if (v6)
  {
    ANLogWithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    v9 = dispatch_queue_create("com.apple.announce.settingsCache", 0);
    settingsQueue = v6->_settingsQueue;
    v6->_settingsQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    cachedAccessorySettings = v6->_cachedAccessorySettings;
    v6->_cachedAccessorySettings = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    lastAccessorySettingsFetch = v6->_lastAccessorySettingsFetch;
    v6->_lastAccessorySettingsFetch = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v6->_accessorySettingsDataSource, a3);
    objc_msgSend(v5, "setDelegate:", v6);
  }

  return v6;
}

- (id)settingsForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;
  ANAccessorySettingsCache *v11;
  uint64_t *v12;
  id v13;
  id location;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_initWeak(&location, self);
  -[ANAccessorySettingsCache settingsQueue](self, "settingsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ANAccessorySettingsCache_settingsForAccessory___block_invoke;
  block[3] = &unk_1E938F7D0;
  objc_copyWeak(&v13, &location);
  v6 = v4;
  v11 = self;
  v12 = &v15;
  v10 = v6;
  dispatch_sync(v5, block);

  -[ANAccessorySettingsCache _fetchSettingsForAccessory:useCache:](self, "_fetchSettingsForAccessory:useCache:", v6, *((unsigned __int8 *)v16 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __49__ANAccessorySettingsCache_settingsForAccessory___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "lastAccessorySettingsFetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberForDefault:", *MEMORY[0x1E0CF7A98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v5
    && (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "timeIntervalSinceDate:", v5),
        v12 = v11,
        v10,
        v12 < v9))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v16 = "WARNING: Using cached settings for accessory. Value may be stale. %@, %@";
LABEL_7:
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v17, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v16 = "Settings need refresh for accessory %@, %@";
      goto LABEL_7;
    }
  }

}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[ANAccessorySettingsCache settingsQueue](self, "settingsQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__ANAccessorySettingsCache_accessorySettingsDataSource_didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke;
  block[3] = &unk_1E938F7F8;
  block[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  objc_copyWeak(&v17, &location);
  dispatch_async(v11, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __117__ANAccessorySettingsCache_accessorySettingsDataSource_didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "Received Settings Updates for Accessory Identifier %@: %@", (uint8_t *)&v6, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updateSettings:forAccessoryWithIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (id)_fetchSettingsForAccessory:(id)a3 useCache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  NSObject *v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v28;
  void *v29;
  _QWORD block[4];
  id v31;
  _BYTE *v32;
  id v33;
  _QWORD aBlock[5];
  __CFString *v35;
  id v36;
  NSObject *v37;
  _BYTE *v38;
  id v39;
  id location;
  uint8_t v41[4];
  __CFString *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  const __CFString *v47;
  const __CFString *v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v4 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ANAccessorySettingsCache settingsQueue](self, "settingsQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v8 = CFSTR("Settings");
  if (v4)
    v8 = CFSTR("Cached Settings");
  v9 = v8;
  -[ANAccessorySettingsCache log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v50 = v12;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "Fetching %{public}@ for Accessory %@, %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = 0;
  objc_initWeak(&location, self);
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke;
  aBlock[3] = &unk_1E938F870;
  objc_copyWeak(&v39, &location);
  aBlock[4] = self;
  v14 = v9;
  v35 = v14;
  v15 = v6;
  v36 = v15;
  v38 = buf;
  v16 = v13;
  v37 = v16;
  v17 = _Block_copy(aBlock);
  -[ANAccessorySettingsCache accessorySettingsDataSource](self, "accessorySettingsDataSource");
  if (v4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = CFSTR("root.announce.enabled");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchCachedAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:", v20, v21, v22, v17);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = CFSTR("root.announce.enabled");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:", v20, v21, v22, v17);
  }

  v23 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v16, v23))
  {
    -[ANAccessorySettingsCache log](self, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v41 = 138543874;
      v42 = v14;
      v43 = 2112;
      v44 = v28;
      v45 = 2112;
      v46 = v29;
      _os_log_error_impl(&dword_1D23A0000, v24, OS_LOG_TYPE_ERROR, "Timed-out waiting for Accessory %{public}@ for %@, %@", v41, 0x20u);

    }
    -[ANAccessorySettingsCache settingsQueue](self, "settingsQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_12;
    block[3] = &unk_1E938F898;
    objc_copyWeak(&v33, &location);
    v32 = buf;
    v31 = v15;
    dispatch_sync(v25, block);

    objc_destroyWeak(&v33);
  }
  v26 = *(id *)(*(_QWORD *)&buf[8] + 40);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  return v26;
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  _QWORD block[6];
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_cold_1(a1, (uint64_t)v5, v9);

    objc_msgSend(WeakRetained, "settingsQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_8;
    block[3] = &unk_1E938F820;
    v28 = *(_QWORD *)(a1 + 64);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = WeakRetained;
    v26 = *(id *)(a1 + 48);
    v27 = *(id *)(a1 + 56);
    dispatch_async(v10, block);

    v11 = v26;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v30 = v12;
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "Fetched %{public}@ for Accessory %@, %@: %@", buf, 0x2Au);

    }
    objc_msgSend(WeakRetained, "settingsQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_9;
    v20[3] = &unk_1E938F848;
    v20[4] = WeakRetained;
    v21 = v6;
    v16 = *(id *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 32);
    v22 = v16;
    v23 = v17;
    v19 = *(_OWORD *)(a1 + 56);
    v18 = (id)v19;
    v24 = v19;
    dispatch_async(v15, v20);

    v11 = v21;
  }

}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to use locally-cached settings", v9, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "cachedAccessorySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_9(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateSettings:forAccessoryWithIdentifier:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "cachedAccessorySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "lastAccessorySettingsFetch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to use locally-cached settings", v10, 2u);
  }

  objc_msgSend(WeakRetained, "cachedAccessorySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)_updateSettings:(id)a3 forAccessoryWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ANAccessorySettingsCache settingsQueue](self, "settingsQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ANAccessorySettingsCache cachedAccessorySettings](self, "cachedAccessorySettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)v10;
  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    -[ANAccessorySettingsCache cachedAccessorySettings](self, "cachedAccessorySettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v7);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[ANAccessorySettingsCache cachedAccessorySettings](self, "cachedAccessorySettings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "keyPath");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

}

- (void)_removeSettingsForAccessoryWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[ANAccessorySettingsCache settingsQueue](self, "settingsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ANAccessorySettingsCache cachedAccessorySettings](self, "cachedAccessorySettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);

}

- (OS_dispatch_queue)settingsQueue
{
  return self->_settingsQueue;
}

- (HMAccessorySettingsDataSource)accessorySettingsDataSource
{
  return self->_accessorySettingsDataSource;
}

- (NSMutableDictionary)cachedAccessorySettings
{
  return self->_cachedAccessorySettings;
}

- (NSMutableDictionary)lastAccessorySettingsFetch
{
  return self->_lastAccessorySettingsFetch;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lastAccessorySettingsFetch, 0);
  objc_storeStrong((id *)&self->_cachedAccessorySettings, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138544130;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  v15 = 2112;
  v16 = a2;
  _os_log_error_impl(&dword_1D23A0000, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve %{public}@ for Accessory %@, %@: %@", (uint8_t *)&v9, 0x2Au);

}

@end
