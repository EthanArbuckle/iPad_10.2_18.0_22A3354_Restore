@implementation _ATXAppLaunchSequenceManager

+ (_ATXAppLaunchSequenceManager)sharedInstance
{
  if (sharedInstance__pasOnceToken6_22 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_22, &__block_literal_global_127);
  return (_ATXAppLaunchSequenceManager *)(id)sharedInstance__pasExprOnceResult_28;
}

- (_ATXAppLaunchSequenceManager)init
{
  void *v3;
  _ATXAppLaunchSequenceManager *v4;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ATXAppLaunchSequenceManager initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (_ATXAppLaunchSequenceManager)initWithInMemoryStore
{
  _ATXDataStore *v3;
  _ATXAppLaunchSequenceManager *v4;

  v3 = -[_ATXDataStore initWithInMemoryDataStore]([_ATXDataStore alloc], "initWithInMemoryDataStore");
  v4 = -[_ATXAppLaunchSequenceManager initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (_ATXAppLaunchSequenceManager)initWithDataStore:(id)a3
{
  id v6;
  _ATXAppLaunchSequenceManager *v7;
  objc_class *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *syncQueue;
  uint64_t v14;
  NSMapTable *appLaunchSequence;
  uint64_t v16;
  NSMapTable *appActionLaunchSequence;
  uint64_t v18;
  _ATXInternalUninstallNotification *uninstallNotificationListener;
  _ATXInternalUninstallNotification *v20;
  NSObject *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppLaunchSequenceManager.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("datastore"));

  }
  v27.receiver = self;
  v27.super_class = (Class)_ATXAppLaunchSequenceManager;
  v7 = -[_ATXAppLaunchSequenceManager init](&v27, sel_init);
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v7->_datastore, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    appLaunchSequence = v7->_appLaunchSequence;
    v7->_appLaunchSequence = (NSMapTable *)v14;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    appActionLaunchSequence = v7->_appActionLaunchSequence;
    v7->_appActionLaunchSequence = (NSMapTable *)v16;

    objc_initWeak(&location, v7);
    v18 = objc_opt_new();
    uninstallNotificationListener = v7->_uninstallNotificationListener;
    v7->_uninstallNotificationListener = (_ATXInternalUninstallNotification *)v18;

    v20 = v7->_uninstallNotificationListener;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __50___ATXAppLaunchSequenceManager_initWithDataStore___block_invoke;
    v24[3] = &unk_1E82DAE98;
    objc_copyWeak(&v25, &location);
    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v20, "registerForNotificationsWithUninstallBlock:", v24);
    __atxlog_handle_default();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchSequenceManager initWithDataStore:].cold.1(v21);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (id)launchSequenceForBundle:(id)a3
{
  id v5;
  NSObject *syncQueue;
  id v7;
  id v8;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppLaunchSequenceManager.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__57;
  v18 = __Block_byref_object_dispose__57;
  v19 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___ATXAppLaunchSequenceManager_launchSequenceForBundle___block_invoke;
  block[3] = &unk_1E82DF880;
  v12 = v5;
  v13 = &v14;
  block[4] = self;
  v7 = v5;
  dispatch_sync(syncQueue, block);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)launchSequenceForAppAction:(id)a3
{
  id v5;
  NSObject *syncQueue;
  id v7;
  id v8;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppLaunchSequenceManager.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appAction"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__57;
  v18 = __Block_byref_object_dispose__57;
  v19 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___ATXAppLaunchSequenceManager_launchSequenceForAppAction___block_invoke;
  block[3] = &unk_1E82DF880;
  v12 = v5;
  v13 = &v14;
  block[4] = self;
  v7 = v5;
  dispatch_sync(syncQueue, block);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)decayAllLaunchSequencesWithHalfLifeInDays:(double)a3
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74___ATXAppLaunchSequenceManager_decayAllLaunchSequencesWithHalfLifeInDays___block_invoke;
  v4[3] = &unk_1E82DC688;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(syncQueue, v4);
}

- (void)decayAllAppActionLaunchSequencesWithHalfLifeInDays:(double)a3
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83___ATXAppLaunchSequenceManager_decayAllAppActionLaunchSequencesWithHalfLifeInDays___block_invoke;
  v4[3] = &unk_1E82DC688;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(syncQueue, v4);
}

- (void)deleteAllLaunchesForBundles:(id)a3
{
  NSObject *syncQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60___ATXAppLaunchSequenceManager_deleteAllLaunchesForBundles___block_invoke;
    block[3] = &unk_1E82DACB0;
    block[4] = self;
    v7 = v5;
    dispatch_sync(syncQueue, block);

  }
}

- (void)deleteAllLaunchesForAppActions:(id)a3
{
  NSObject *syncQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63___ATXAppLaunchSequenceManager_deleteAllLaunchesForAppActions___block_invoke;
    block[3] = &unk_1E82DACB0;
    block[4] = self;
    v7 = v5;
    dispatch_sync(syncQueue, block);

  }
}

- (id)launchSequence
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
  v9 = __Block_byref_object_copy__57;
  v10 = __Block_byref_object_dispose__57;
  v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46___ATXAppLaunchSequenceManager_launchSequence__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addBundleIdToLaunchSequence:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  NSObject *syncQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___ATXAppLaunchSequenceManager_addBundleIdToLaunchSequence_date___block_invoke;
  block[3] = &unk_1E82DB9D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(syncQueue, block);

}

- (id)syncQueue
{
  return self->_syncQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppActionLaunchDate, 0);
  objc_storeStrong((id *)&self->_lastAppActionLaunch, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
  objc_storeStrong((id *)&self->_appActionLaunchSequence, 0);
  objc_storeStrong((id *)&self->_appLaunchSequence, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

- (void)initWithDataStore:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "_ATXLaunchSequenceManager initialized", v1, 2u);
}

@end
