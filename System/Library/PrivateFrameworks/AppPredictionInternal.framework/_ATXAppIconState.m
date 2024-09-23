@implementation _ATXAppIconState

- (id)allAppsKnownToSpringBoard
{
  NSObject *syncQueue;
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__51;
  v11 = __Block_byref_object_dispose__51;
  v12 = 0;
  syncQueue = self->_syncQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45___ATXAppIconState_allAppsKnownToSpringBoard__block_invoke;
  v6[3] = &unk_1E82DC528;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(syncQueue, v6);
  v3 = (void *)v8[5];
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (_ATXAppIconState)sharedInstance
{
  if (sharedInstance__pasOnceToken6_18 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_18, &__block_literal_global_113);
  return (_ATXAppIconState *)(id)sharedInstance__pasExprOnceResult_23;
}

- (_ATXAppIconState)initWithHomeScreenConfigCache:(id)a3 sbsHomeScreenService:(id)a4
{
  id v7;
  id v8;
  _ATXAppIconState *v9;
  _ATXAppIconState *v10;
  objc_class *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *syncQueue;
  id v17;
  OS_dispatch_queue *v18;
  uint64_t v19;
  uint64_t v20;
  _PASSimpleCoalescingTimer *coalescedReloadOperation;
  void *v22;
  uint64_t v23;
  _ATXInternalInstallNotification *installNotification;
  _ATXInternalInstallNotification *v25;
  id v26;
  uint64_t v27;
  _ATXInternalUninstallNotification *uninstallNotification;
  _ATXInternalUninstallNotification *v29;
  id v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD aBlock[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v7 = a3;
  v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)_ATXAppIconState;
  v9 = -[_ATXAppIconState init](&v41, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeScreenConfigCache, a3);
    objc_storeStrong((id *)&v10->_sbsHomeScreenService, a4);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    syncQueue = v10->_syncQueue;
    v10->_syncQueue = (OS_dispatch_queue *)v15;

    -[_ATXAppIconState _reload](v10, "_reload");
    objc_initWeak(&location, v10);
    v17 = objc_alloc(MEMORY[0x1E0D81618]);
    v18 = v10->_syncQueue;
    v19 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke;
    v38[3] = &unk_1E82DB988;
    objc_copyWeak(&v39, &location);
    v20 = objc_msgSend(v17, "initWithQueue:operation:", v18, v38);
    coalescedReloadOperation = v10->_coalescedReloadOperation;
    v10->_coalescedReloadOperation = (_PASSimpleCoalescingTimer *)v20;

    aBlock[0] = v19;
    aBlock[1] = 3221225472;
    aBlock[2] = __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_35;
    aBlock[3] = &unk_1E82DC4D8;
    objc_copyWeak(&v37, &location);
    v22 = _Block_copy(aBlock);
    notify_register_dispatch((const char *)objc_msgSend((id)*MEMORY[0x1E0CF8A50], "UTF8String"), &v10->_homeScreenConfigCacheChangeDarwinNotificationObserver, (dispatch_queue_t)v10->_syncQueue, v22);
    notify_register_dispatch((const char *)objc_msgSend((id)*MEMORY[0x1E0CF8BA0], "UTF8String"), &v10->_homeScreenTodayPageConfigCacheChangeDarwinNotificationObserver, (dispatch_queue_t)v10->_syncQueue, v22);
    notify_register_dispatch((const char *)objc_msgSend((id)*MEMORY[0x1E0CF8A30], "UTF8String"), &v10->_dockAppListChangeDarwinNotificationObserver, (dispatch_queue_t)v10->_syncQueue, v22);
    v23 = objc_opt_new();
    installNotification = v10->_installNotification;
    v10->_installNotification = (_ATXInternalInstallNotification *)v23;

    v25 = v10->_installNotification;
    v34[0] = v19;
    v34[1] = 3221225472;
    v34[2] = __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_38;
    v34[3] = &unk_1E82DFFE0;
    v26 = v22;
    v35 = v26;
    -[_ATXInternalInstallNotification registerForNotificationsWithInstallBlock:](v25, "registerForNotificationsWithInstallBlock:", v34);
    v27 = objc_opt_new();
    uninstallNotification = v10->_uninstallNotification;
    v10->_uninstallNotification = (_ATXInternalUninstallNotification *)v27;

    v29 = v10->_uninstallNotification;
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_2;
    v32[3] = &unk_1E82E4008;
    v30 = v26;
    v33 = v30;
    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v29, "registerForNotificationsWithUninstallBlock:", v32);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)_reload
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXAppIconState: Could not query all home screen placeholders from SpringBoard", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (id)allInstalledAppsKnownToSpringBoard
{
  void *v3;
  NSObject *syncQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54___ATXAppIconState_allInstalledAppsKnownToSpringBoard__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(syncQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)allDockedApps
{
  void *v3;
  NSObject *syncQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33___ATXAppIconState_allDockedApps__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(syncQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)allFolderApps
{
  void *v3;
  NSObject *syncQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33___ATXAppIconState_allFolderApps__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(syncQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (BOOL)appOnDockWithBundleId:(id)a3
{
  id v4;
  NSObject *syncQueue;
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
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___ATXAppIconState_appOnDockWithBundleId___block_invoke;
  block[3] = &unk_1E82DF880;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (BOOL)appInFolderWithBundleId:(id)a3
{
  id v4;
  NSObject *syncQueue;
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
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___ATXAppIconState_appInFolderWithBundleId___block_invoke;
  block[3] = &unk_1E82DF880;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (int64_t)springboardPageNumberForBundleId:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__51;
  v18 = __Block_byref_object_dispose__51;
  v19 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___ATXAppIconState_springboardPageNumberForBundleId___block_invoke;
  block[3] = &unk_1E82DF880;
  v13 = &v14;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  dispatch_sync(syncQueue, block);
  objc_msgSend((id)v15[5], "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)v15[5], "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexAtPosition:", 0);

  }
  else
  {
    v9 = -1;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (int64_t)springboardPageLocationForBundleId:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__51;
  v18 = __Block_byref_object_dispose__51;
  v19 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___ATXAppIconState_springboardPageLocationForBundleId___block_invoke;
  block[3] = &unk_1E82DF880;
  v13 = &v14;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  dispatch_sync(syncQueue, block);
  objc_msgSend((id)v15[5], "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)v15[5], "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexAtPosition:", 1);

  }
  else
  {
    v9 = -1;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (int64_t)folderPageNumberForBundleId:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__51;
  v20 = __Block_byref_object_dispose__51;
  v21 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___ATXAppIconState_folderPageNumberForBundleId___block_invoke;
  block[3] = &unk_1E82DF880;
  v15 = &v16;
  block[4] = self;
  v6 = v4;
  v14 = v6;
  dispatch_sync(syncQueue, block);
  v7 = (void *)v17[5];
  if (v7)
  {
    objc_msgSend(v7, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 == 3)
    {
      objc_msgSend((id)v17[5], "indexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexAtPosition:", 2);

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = -1;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (unint64_t)numberOfApps
{
  void *v2;
  unint64_t v3;

  -[_ATXAppIconState allInstalledAppsKnownToSpringBoard](self, "allInstalledAppsKnownToSpringBoard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)numberOfFolders
{
  NSObject *syncQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35___ATXAppIconState_numberOfFolders__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)numberOfPages
{
  NSObject *syncQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33___ATXAppIconState_numberOfPages__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)nonFolderAppSetOnPages
{
  void *v3;
  NSObject *syncQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42___ATXAppIconState_nonFolderAppSetOnPages__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(syncQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (unint64_t)getFirstVisiblePageIndex
{
  NSObject *syncQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44___ATXAppIconState_getFirstVisiblePageIndex__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)springboardPageNumbersWithAppPredictionPanels
{
  NSObject *syncQueue;
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
  v9 = __Block_byref_object_copy__51;
  v10 = __Block_byref_object_dispose__51;
  v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65___ATXAppIconState_springboardPageNumbersWithAppPredictionPanels__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)springboardPageNumbersWithSuggestionsWidgets
{
  NSObject *syncQueue;
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
  v9 = __Block_byref_object_copy__51;
  v10 = __Block_byref_object_dispose__51;
  v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64___ATXAppIconState_springboardPageNumbersWithSuggestionsWidgets__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedReloadOperation, 0);
  objc_storeStrong((id *)&self->_pageIndicesWithSuggestionWidgets, 0);
  objc_storeStrong((id *)&self->_pageIndicesWithAppPredictionPanels, 0);
  objc_storeStrong((id *)&self->_orderedVisiblePageIndices, 0);
  objc_storeStrong((id *)&self->_iconLocationByBundleId, 0);
  objc_storeStrong((id *)&self->_sbsHomeScreenService, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_uninstallNotification, 0);
  objc_storeStrong((id *)&self->_installNotification, 0);
}

@end
