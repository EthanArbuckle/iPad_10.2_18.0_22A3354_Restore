@implementation CSEndpointerAssetManager

- (CSEndpointerAssetManager)init
{
  CSEndpointerAssetManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSHashTable *observers;
  void *v7;
  CSAssetDownloadingOption *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CSEndpointerAssetManager;
  v2 = -[CSEndpointerAssetManager init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSEndpointerAssetManager queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    -[CSEndpointerAssetManager _registerForAssetUpdateNotifications](v2, "_registerForAssetUpdateNotifications");
    objc_msgSend(MEMORY[0x1E0D19158], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v2);

    v8 = objc_alloc_init(CSAssetDownloadingOption);
    -[CSAssetDownloadingOption setAllowEndpointAssetDownloading:](v8, "setAllowEndpointAssetDownloading:", 1);
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAssetDownloadingOption:", v8);

    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:forAssetType:", v2, 1);

    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSEndpointerAssetManager init]";
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CSEndpointerAssetManager_addObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CSEndpointerAssetManager_removeObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)getCurrentOSDAsset
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
  v9 = __Block_byref_object_copy__18207;
  v10 = __Block_byref_object_dispose__18208;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__CSEndpointerAssetManager_getCurrentOSDAsset__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getCurrentEndpointerAsset
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
  v9 = __Block_byref_object_copy__18207;
  v10 = __Block_byref_object_dispose__18208;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CSEndpointerAssetManager_getCurrentEndpointerAsset__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  int assetUpdateNotificationToken;
  uint32_t v4;
  uint32_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint32_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  assetUpdateNotificationToken = self->_assetUpdateNotificationToken;
  if (assetUpdateNotificationToken != -1)
  {
    v4 = notify_cancel(assetUpdateNotificationToken);
    if (v4)
    {
      v5 = v4;
      v6 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "-[CSEndpointerAssetManager dealloc]";
        v10 = 1024;
        v11 = v5;
        _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Failed to deregister for asset update notifications, status: %u", buf, 0x12u);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CSEndpointerAssetManager;
  -[CSEndpointerAssetManager dealloc](&v7, sel_dealloc);
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  CSEndpointerAssetManager *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__CSEndpointerAssetManager_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)CSAssetManagerDidDownloadNewAsset:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSEndpointerAssetManager_CSAssetManagerDidDownloadNewAsset___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_registerForAssetUpdateNotifications
{
  NSObject **v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint32_t v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint32_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (NSObject **)MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSEndpointerAssetManager _registerForAssetUpdateNotifications]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Registering for asset update notifications...", buf, 0xCu);
  }
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__CSEndpointerAssetManager__registerForAssetUpdateNotifications__block_invoke;
  v13[3] = &unk_1E7C26F50;
  objc_copyWeak(&v14, &location);
  v6 = (void *)MEMORY[0x1C3BC4734](v13);
  v7 = notify_register_dispatch((const char *)objc_msgSend(CFSTR("com.apple.siri.uaf.com.apple.siri.understanding"), "UTF8String"), &self->_assetUpdateNotificationToken, (dispatch_queue_t)self->_queue, v6);
  if (v7)
  {
    v8 = *v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSEndpointerAssetManager _registerForAssetUpdateNotifications]";
      v18 = 1024;
      v19 = v7;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed to register for asset update notifications, status: %u", buf, 0x12u);
    }
    self->_assetUpdateNotificationToken = -1;
  }
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __64__CSEndpointerAssetManager__registerForAssetUpdateNotifications__block_invoke_199;
  block[3] = &unk_1E7C28F10;
  v12 = v6;
  v10 = v6;
  dispatch_async_and_wait(queue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)_getCurrentHEPAsset
{
  CSAsset *currentHEPAsset;
  void *v4;
  CSAsset *v5;
  CSAsset *v6;
  CSAsset *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  CSAsset *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  currentHEPAsset = self->_currentHEPAsset;
  if (currentHEPAsset)
    return currentHEPAsset;
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSEndpointerAssetManager _fetchEndpointMobileAssetWithLanguage:](self, "_fetchEndpointMobileAssetWithLanguage:", v4);
  v5 = (CSAsset *)objc_claimAutoreleasedReturnValue();
  v6 = self->_currentHEPAsset;
  self->_currentHEPAsset = v5;

  v7 = self->_currentHEPAsset;
  v8 = *MEMORY[0x1E0D18F60];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = v8;
      -[CSAsset path](v7, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[CSEndpointerAssetManager _getCurrentHEPAsset]";
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s HEP Asset: %{public}@, path: %{public}@", (uint8_t *)&v13, 0x20u);

    }
    -[CSEndpointerAssetManager _notifyAssetsUpdate](self, "_notifyAssetsUpdate");
    currentHEPAsset = self->_currentHEPAsset;
    return currentHEPAsset;
  }
  if (v9)
  {
    v13 = 136315138;
    v14 = "-[CSEndpointerAssetManager _getCurrentHEPAsset]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to get HEP asset", (uint8_t *)&v13, 0xCu);
  }
  return 0;
}

- (void)_updateEndpointerAssetsIfNeeded
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointerAssetManager _updateEndpointerAssetsIfNeeded]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Updating endpointer assets if needed...", (uint8_t *)&v4, 0xCu);
  }
  -[CSEndpointerAssetManager _updateAssetWithCurrentLanguageForAssetType:](self, "_updateAssetWithCurrentLanguageForAssetType:", 1);
  -[CSEndpointerAssetManager _updateAssetWithCurrentLanguageForAssetType:](self, "_updateAssetWithCurrentLanguageForAssetType:", 0);
}

- (void)_updateAssetWithCurrentLanguageForAssetType:(unint64_t)a3
{
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSEndpointerAssetManager _updateAssetWithLanguage:assetType:](self, "_updateAssetWithLanguage:assetType:", v5, a3);

}

- (void)_updateAssetWithLanguage:(id)a3 assetType:(unint64_t)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  CSAsset *v12;
  CSAsset *currentHEPAsset;
  CSAsset *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (os_log_t *)MEMORY[0x1E0D18F60];
  v8 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("Invalid CSEndpointerAssetType");
    if (a4 == 1)
      v9 = CFSTR("HEP");
    if (!a4)
      v9 = CFSTR("OEP");
    v10 = v9;
    v16 = 136315650;
    v17 = "-[CSEndpointerAssetManager _updateAssetWithLanguage:assetType:]";
    v18 = 2112;
    v19 = (unint64_t)v10;
    v20 = 2112;
    v21 = v6;
    v11 = v8;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Updating %@ asset with language: %@", (uint8_t *)&v16, 0x20u);

  }
  if (a4 == 1)
  {
    -[CSEndpointerAssetManager _fetchEndpointMobileAssetWithLanguage:](self, "_fetchEndpointMobileAssetWithLanguage:", v6);
    v14 = (CSAsset *)objc_claimAutoreleasedReturnValue();
    currentHEPAsset = self->_currentHEPAsset;
    self->_currentHEPAsset = v14;
    goto LABEL_11;
  }
  if (!a4)
  {
    objc_msgSend((id)objc_opt_class(), "_getOEPAssetWithLanguage:", v6);
    v12 = (CSAsset *)objc_claimAutoreleasedReturnValue();
    currentHEPAsset = self->_currentOEPAsset;
    self->_currentOEPAsset = v12;
LABEL_11:

    -[CSEndpointerAssetManager _notifyAssetsUpdate](self, "_notifyAssetsUpdate");
    goto LABEL_14;
  }
  v15 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315394;
    v17 = "-[CSEndpointerAssetManager _updateAssetWithLanguage:assetType:]";
    v18 = 2048;
    v19 = a4;
    _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s Invalid CSEndpointerAssetType: %lu", (uint8_t *)&v16, 0x16u);
  }
LABEL_14:

}

- (void)_notifyAssetsUpdate
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[CSEndpointerAssetManager _isOSDIncludedInAsset:](self, "_isOSDIncludedInAsset:", v5),
        v5,
        v4,
        v6))
  {
    -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CSEndpointerAssetManager currentHEPAsset](self, "currentHEPAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSEndpointerAssetManager currentHEPAsset](self, "currentHEPAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
      }
    }
  }
  v11 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[CSEndpointerAssetManager _notifyAssetsUpdate]";
    v34 = 2114;
    v35 = v7;
    v36 = 2114;
    v37 = v8;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s endpointAsset: %{public}@, osdAsset: %{public}@", buf, 0x20u);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CSEndpointerAssetManager observers](self, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16++), "endpointerAssetManagerDidUpdateAsset:", v7);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CSEndpointerAssetManager observers](self, "observers", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "endpointerAssetManagerDidUpdateOSDAsset:", v8);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (void)_notifyAssetsUpdateForObserver:(id)a3
{
  NSObject *queue;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = -[CSEndpointerAssetManager _isOSDIncludedInAsset:](self, "_isOSDIncludedInAsset:", v8),
        v8,
        v7,
        v9))
  {
    -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CSEndpointerAssetManager currentHEPAsset](self, "currentHEPAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSEndpointerAssetManager currentHEPAsset](self, "currentHEPAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset");
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v13;
      }
    }
  }
  v14 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[CSEndpointerAssetManager _notifyAssetsUpdateForObserver:]";
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s endpointAsset: %{public}@, osdAsset: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  objc_msgSend(v5, "endpointerAssetManagerDidUpdateAsset:", v10);
  objc_msgSend(v5, "endpointerAssetManagerDidUpdateOSDAsset:", v11);

}

- (id)_fetchEndpointMobileAssetWithLanguage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEndpointAssetOverridingEnabled");

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_getFakeEndpointAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetOfType:language:", 1, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v10, "timeIntervalSinceDate:", v8);
      v15 = 136315394;
      v16 = "-[CSEndpointerAssetManager _fetchEndpointMobileAssetWithLanguage:]";
      v17 = 2050;
      v18 = v13;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s elapsed time to get HEP mobile assets: %{public}lf", (uint8_t *)&v15, 0x16u);

    }
  }

  return v7;
}

- (id)_getModelPathFromInstallationStatusString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("ModelInfo="));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 2)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v7, "count") >= 2)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isOSDIncludedInAsset:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("SPG.nnet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (CSAsset)currentHEPAsset
{
  return self->_currentHEPAsset;
}

- (void)setCurrentHEPAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentHEPAsset, a3);
}

- (CSAsset)currentOEPAsset
{
  return self->_currentOEPAsset;
}

- (void)setCurrentOEPAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentOEPAsset, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentOEPAsset, 0);
  objc_storeStrong((id *)&self->_currentHEPAsset, 0);
}

void __64__CSEndpointerAssetManager__registerForAssetUpdateNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CD7F40], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switchToNewAssetsForAssetType:", 3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateEndpointerAssetsIfNeeded");

}

uint64_t __64__CSEndpointerAssetManager__registerForAssetUpdateNotifications__block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__CSEndpointerAssetManager_CSAssetManagerDidDownloadNewAsset___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointerAssetManager CSAssetManagerDidDownloadNewAsset:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s New hybrid endpoint asset downloaded", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateAssetWithCurrentLanguageForAssetType:", 1);
}

uint64_t __86__CSEndpointerAssetManager_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[CSEndpointerAssetManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Language changed to: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateAssetWithLanguage:assetType:", *(_QWORD *)(a1 + 32), 0);
  return objc_msgSend(*(id *)(a1 + 40), "_updateAssetWithLanguage:assetType:", *(_QWORD *)(a1 + 32), 1);
}

void __53__CSEndpointerAssetManager_getCurrentEndpointerAsset__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  void *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3])
  {
    v3 = objc_msgSend(v2, "_isOSDIncludedInAsset:");
    v2 = *(_QWORD **)(a1 + 32);
    if (v3)
    {
      v4 = (void *)v2[3];
      v5 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
LABEL_6:
      v11 = v4;
      v12 = *v5;
      *v5 = v11;

      return;
    }
  }
  objc_msgSend(v2, "_getCurrentHEPAsset");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(_QWORD *)(v9 + 40);
  v5 = (void **)(v9 + 40);
  if (v10)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    if (v4)
      goto LABEL_6;
  }
}

void __46__CSEndpointerAssetManager_getCurrentOSDAsset__block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(id **)(a1 + 32);
  if (v2[3] && (v3 = objc_msgSend(v2, "_isOSDIncludedInAsset:"), v2 = *(id **)(a1 + 32), v3))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v2[3];
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    objc_msgSend(v2, "_getCurrentHEPAsset");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

}

void __43__CSEndpointerAssetManager_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __40__CSEndpointerAssetManager_addObserver___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_notifyAssetsUpdateForObserver:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_18233 != -1)
    dispatch_once(&sharedManager_onceToken_18233, &__block_literal_global_18234);
  return (id)sharedManager_sharedEndpointerAssetManager;
}

+ (id)_getOEPAssetWithLanguage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEndpointAssetBypassTrialEnabled");

  if (v6)
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315138;
      v28 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Bypass Trial Asset", (uint8_t *)&v27, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEndpointAssetOverridingEnabled");

    if (v10)
    {
      objc_msgSend(a1, "_getFakeEndpointAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7F30]), "initWithAssetType:language:regionId:", 3, v4, 0);
      objc_msgSend(MEMORY[0x1E0CD7F40], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "installedAssetWithConfig:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("OEP"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "fileExistsAtPath:", v14);

        v17 = *MEMORY[0x1E0D18F60];
        v18 = *MEMORY[0x1E0D18F60];
        if ((v16 & 1) != 0)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v17;
            objc_msgSend(v11, "language");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 136315650;
            v28 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
            v29 = 2112;
            v30 = v20;
            v31 = 2114;
            v32 = v14;
            _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Found OEP asset for %@ at path: %{public}@", (uint8_t *)&v27, 0x20u);

          }
          v21 = (void *)MEMORY[0x1E0D18FC0];
          objc_msgSend(a1, "_getOEPVersionFromPath:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "assetForAssetType:resourcePath:configVersion:assetProvider:", 1, v14, v22, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v27 = 136315394;
            v28 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
            v29 = 2114;
            v30 = v14;
            _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s File does not exist: %{public}@", (uint8_t *)&v27, 0x16u);
          }
          v8 = 0;
        }

      }
      else
      {
        v23 = (void *)*MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
          v25 = v23;
          objc_msgSend(v11, "language");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 136315394;
          v28 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
          v29 = 2112;
          v30 = v26;
          _os_log_error_impl(&dword_1C2614000, v25, OS_LOG_TYPE_ERROR, "%s No OEP asset for %@ was found.", (uint8_t *)&v27, 0x16u);

        }
        v8 = 0;
      }

    }
  }

  return v8;
}

+ (id)_getOEPVersionFromPath:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("cs_hep.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v12 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
        v18 = 2114;
        v19 = v3;
        _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }
      v11 = CFSTR("0.0");
      goto LABEL_17;
    }
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (v8)
    {
      v9 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
        v18 = 2114;
        v19 = v3;
        v20 = 2114;
        v21 = v8;
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Could not decode contents of: %{public}@: err: %{public}@", buf, 0x20u);
      }
    }
    else if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
    }
    v11 = CFSTR("0.0");
    goto LABEL_16;
  }
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
    v18 = 2114;
    v19 = v3;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s File does not exist: %{public}@", buf, 0x16u);
  }
  v11 = CFSTR("0.0");
LABEL_18:

  return v11;
}

+ (id)_getFakeEndpointAsset
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fakeEndpointAssetPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D18FC0], "assetForAssetType:resourcePath:configVersion:assetProvider:", 1, v3, CFSTR("0.0"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[CSEndpointerAssetManager _getFakeEndpointAsset]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Fake endpoint asset: %@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

void __41__CSEndpointerAssetManager_sharedManager__block_invoke()
{
  CSEndpointerAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSEndpointerAssetManager);
  v1 = (void *)sharedManager_sharedEndpointerAssetManager;
  sharedManager_sharedEndpointerAssetManager = (uint64_t)v0;

}

@end
