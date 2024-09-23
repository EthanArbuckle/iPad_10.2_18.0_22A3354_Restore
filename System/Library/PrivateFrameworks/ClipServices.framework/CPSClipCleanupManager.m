@implementation CPSClipCleanupManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_sharedManager;
}

void __38__CPSClipCleanupManager_sharedManager__block_invoke()
{
  CPSClipCleanupManager *v0;
  void *v1;

  v0 = objc_alloc_init(CPSClipCleanupManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (CPSClipCleanupManager)init
{
  CPSClipCleanupManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *pendingTerminationAssertionsByBundleIDs;
  NSMutableDictionary *v8;
  NSMutableDictionary *clipDeletionPromisesByBundleIDs;
  void *v10;
  CPSClipCleanupManager *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CPSClipCleanupManager;
  v2 = -[CPSClipCleanupManager init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ClipServices.CPSClipCleanupManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingTerminationAssertionsByBundleIDs = v2->_pendingTerminationAssertionsByBundleIDs;
    v2->_pendingTerminationAssertionsByBundleIDs = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clipDeletionPromisesByBundleIDs = v2->_clipDeletionPromisesByBundleIDs;
    v2->_clipDeletionPromisesByBundleIDs = v8;

    -[CPSClipCleanupManager _registerLocalNotifications](v2, "_registerLocalNotifications");
    -[CPSClipCleanupManager _registerDistributedNotificationHandler](v2, "_registerDistributedNotificationHandler");
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v2);

    v11 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allValues](self->_pendingTerminationAssertionsByBundleIDs, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "removeObserver:", self);
        objc_msgSend(v9, "invalidate");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_clipDeletionPromisesByBundleIDs, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "finishWithError:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  v17.receiver = self;
  v17.super_class = (Class)CPSClipCleanupManager;
  -[CPSClipCleanupManager dealloc](&v17, sel_dealloc);
}

- (void)removeClipsByUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CPSClipCleanupManager *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v17 = v6;
    _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: user deleting clips (%{private}@)", buf, 0xCu);
  }
  +[CPSWebClipStore sharedStore](CPSWebClipStore, "sharedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke;
  v12[3] = &unk_24C3B9300;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "removeWebClipsWithApplicationBundleIdentifiers:completionHandler:", v11, v12);

}

void __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id obj;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  if (objc_msgSend(v11, "count"))
  {
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke_cold_1();
  }
  v4 = dispatch_group_create();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        dispatch_group_enter(v4);
        v9 = *(void **)(a1 + 40);
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke_8;
        v13[3] = &unk_24C3B92D8;
        v15 = &v20;
        v14 = v4;
        objc_msgSend(v9, "_removeClipCancellingPendingRemovalIfNeeded:completionHandler:", v8, v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v21[5]);
  _Block_object_dispose(&v20, 8);

}

void __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v3, "addObject:", v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)_removeClipCancellingPendingRemovalIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__CPSClipCleanupManager__removeClipCancellingPendingRemovalIfNeeded_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __87__CPSClipCleanupManager__removeClipCancellingPendingRemovalIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    if (!v4)
    {
      +[CPSPromise promise](CPSPromise, "promise");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 48);
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __87__CPSClipCleanupManager__removeClipCancellingPendingRemovalIfNeeded_completionHandler___block_invoke_2;
    v9[3] = &unk_24C3B9328;
    v10 = v6;
    objc_msgSend(v5, "addCompletionBlock:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "_uninstallClipWithBundleIdentifier:deletionPromise:", *(_QWORD *)(a1 + 40), v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

  }
}

uint64_t __87__CPSClipCleanupManager__removeClipCancellingPendingRemovalIfNeeded_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeFailedClipInstallsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  dispatch_group_t v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  dispatch_group_t v12;
  id v13;
  CPSClipCleanupManager *v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  +[CPSWebClipStore sharedStore](CPSWebClipStore, "sharedStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke;
  v11[3] = &unk_24C3B93A0;
  v12 = v6;
  v13 = v5;
  v14 = self;
  v15 = v4;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "fetchAppClipsWithCompletionHandler:", v11);

}

void __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  __int128 v18;
  int8x16_t v19;
  _QWORD block[4];
  int8x16_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v26;
    *(_QWORD *)&v5 = 138477827;
    v18 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isApplicationInstalled", v18) & 1) == 0)
        {
          v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v30 = v9;
            _os_log_impl(&dword_20AD44000, v10, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found WebClip with failed app clip install: %{private}@", buf, 0xCu);
          }
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          +[CPSWebClipStore sharedStore](CPSWebClipStore, "sharedStore");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke_15;
          v23[3] = &unk_24C3B9378;
          v23[4] = v9;
          v24 = *(id *)(a1 + 32);
          objc_msgSend(v11, "removeWebClipWithIdentifier:completionHandler:", v12, v23);

          objc_msgSend(v9, "applicationBundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = *(void **)(a1 + 40);
            objc_msgSend(v9, "applicationBundleIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v15);

          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);
  }
  v16 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke_16;
  block[3] = &unk_24C3B9350;
  v19 = *(int8x16_t *)(a1 + 40);
  v17 = (id)v19.i64[0];
  v21 = vextq_s8(v19, v19, 8uLL);
  v22 = *(id *)(a1 + 56);
  dispatch_group_notify(v16, MEMORY[0x24BDAC9B8], block);

}

void __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cps_privacyPreservingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138478083;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Removed WebClip with failed AppClip install: %{private}@, error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __71__CPSClipCleanupManager_removeFailedClipInstallsWithCompletionHandler___block_invoke_16(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  uint64_t result;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  int buf;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allAppClipsForPlaceholderOnly:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7
          && objc_msgSend(v6, "isPlaceholder")
          && !+[CPSUtilities isBundleIdentifierBeingInstalled:](CPSUtilities, "isBundleIdentifierBeingInstalled:", v7))
        {
          v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            buf = 138477827;
            v31 = v7;
            _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found abandoned app clip placeholder: %{private}@", (uint8_t *)&buf, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v3);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        v20 = 0;
        +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:isPlaceholder:](CPSUtilities, "versionIdentifierForAppWithBundleIdentifier:isPlaceholder:", v14, &v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v16 = v20 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            buf = 138477827;
            v31 = v14;
            _os_log_impl(&dword_20AD44000, v17, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Removing AppClip that failed install: %{private}@", (uint8_t *)&buf, 0xCu);
          }
          +[CPSUtilities uninstallAppWithBundleIdentifier:completion:](CPSUtilities, "uninstallAppWithBundleIdentifier:completion:", v14, 0);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v11);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)uninstallClipsWithParentAppInstalledWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__CPSClipCleanupManager_uninstallClipsWithParentAppInstalledWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3B93C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __83__CPSClipCleanupManager_uninstallClipsWithParentAppInstalledWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = a1;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allAppClipsForPlaceholderOnly:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v37;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(obj);
        v25 = v2;
        v3 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v2);
        +[CPSClipCleanupManager _parentBundleIDsFromAppRecord:](CPSClipCleanupManager, "_parentBundleIDsFromAppRecord:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v33 != v7)
                objc_enumerationMutation(v4);
              v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0);
              if (v10)
              {
                v11 = objc_msgSend(*(id *)(v27 + 32), "_shouldDeleteClipWithRecord:parentRecord:", v3, v10);
                v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
                v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
                if ((v11 & 1) != 0)
                {
                  if (v13)
                  {
                    v14 = v12;
                    objc_msgSend(v3, "bundleIdentifier");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138478083;
                    v42 = v15;
                    v43 = 2113;
                    v44 = v9;
                    _os_log_impl(&dword_20AD44000, v14, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found clip (%{private}@) with installed parent app %{private}@ to delete", buf, 0x16u);

                  }
                  objc_msgSend(v3, "bundleIdentifier");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "addObject:", v16);

                }
                else if (v13)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_20AD44000, v12, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found installed parent app but clip should not be deleted", buf, 2u);
                }
              }

            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
          }
          while (v6);
        }

        v2 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v24);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v26;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(v27 + 32), "_deleteClipWhenBackgrounded:completionHandler:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), 0);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v19);
  }

  (*(void (**)(void))(*(_QWORD *)(v27 + 40) + 16))();
}

- (void)_registerDistributedNotificationHandler
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke;
  v4[3] = &unk_24C3B93F0;
  objc_copyWeak(&v5, &location);
  v3 = (void *)MEMORY[0x20BD30A54](v4);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)self->_queue, v3);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_queue, v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  id WeakRetained;
  const char *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const char *string;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x20BD30BE0]();
  v5 = MEMORY[0x24BDACFA0];
  if (v4 == MEMORY[0x24BDACFA0])
  {
    v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (const char *)*MEMORY[0x24BDACF50];
      v8 = v6;
      v33 = 136315138;
      string = xpc_dictionary_get_string(v3, v7);
      _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_INFO, "CPSClipCleanupManager: Received distributed notification via XPC event: %s", (uint8_t *)&v33, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained || MEMORY[0x20BD30BE0](v3) != v5)
      goto LABEL_17;
    v10 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF50]);
    if (!v10)
    {
      v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "UserInfo");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12 && MEMORY[0x20BD30BE0](v12) == v5)
    {
      v14 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      if (!v14)
      {
        v25 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke_cold_2(v25, v26, v27, v28, v29, v30, v31, v32);
        goto LABEL_14;
      }

    }
    v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412546;
      string = v11;
      v35 = 2112;
      v36 = 0;
      _os_log_impl(&dword_20AD44000, v15, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Post notification with name: %@, userInfo: %@", (uint8_t *)&v33, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:", v11, 0, 0);

LABEL_14:
LABEL_17:

  }
}

- (void)_registerLocalNotifications
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMCEffectiveSettingsChangedNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSClipCleanupManager.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_didReceiveApplicationRegisteredNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__CPSClipCleanupManager__didReceiveApplicationRegisteredNotification___block_invoke;
  v3[3] = &unk_24C3B9418;
  v3[4] = self;
  -[CPSClipCleanupManager _didReceiveApplicationChangedNotification:operationHandler:](self, "_didReceiveApplicationChangedNotification:operationHandler:", a3, v3);
}

uint64_t __70__CPSClipCleanupManager__didReceiveApplicationRegisteredNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNewInstalledAppWithBundleID:", a2);
}

- (void)_didReceiveApplicationUnregisteredNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __72__CPSClipCleanupManager__didReceiveApplicationUnregisteredNotification___block_invoke;
  v3[3] = &unk_24C3B9418;
  v3[4] = self;
  -[CPSClipCleanupManager _didReceiveApplicationChangedNotification:operationHandler:](self, "_didReceiveApplicationChangedNotification:operationHandler:", a3, v3);
}

uint64_t __72__CPSClipCleanupManager__didReceiveApplicationUnregisteredNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNewUninstalledAppWithBundleID:", a2);
}

- (void)_didReceiveApplicationChangedNotification:(id)a3 operationHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  NSObject *queue;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[16];

  v6 = a4;
  objc_msgSend(a3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "safari_BOOLForKey:", CFSTR("isPlaceholder")) & 1) == 0)
  {
    v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Received app registered (non-placeholder) notification", buf, 2u);
    }
    objc_msgSend(v7, "safari_arrayForKey:", CFSTR("bundleIDs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      queue = self->_queue;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __84__CPSClipCleanupManager__didReceiveApplicationChangedNotification_operationHandler___block_invoke;
      v21[3] = &unk_24C3B93C8;
      v22 = v9;
      v23 = v6;
      dispatch_async(queue, v21);

    }
    else
    {
      v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CPSClipCleanupManager _didReceiveApplicationChangedNotification:operationHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }

  }
}

void __84__CPSClipCleanupManager__didReceiveApplicationChangedNotification_operationHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_allAppClipsForPlaceholderOnly:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_41);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  return v4;
}

uint64_t __56__CPSClipCleanupManager__allAppClipsForPlaceholderOnly___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "appClipMetadata");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length") != 0;

  }
  return v3;
}

- (void)_didReceiveMCSettingsChangedNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t i;
  void *v16;
  void *v17;
  unint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  BOOL v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t v36[128];
  __int128 buf;
  uint64_t v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v1 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_20AD44000, v1, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Received MobileConfiguration settings change notificaion.", (uint8_t *)&buf, 2u);
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  v35 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v38 = (uint64_t)__getMCProfileConnectionClass_block_invoke;
    v39 = &unk_24C3B9278;
    v40 = &v32;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&buf);
    v2 = (void *)v33[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v32, 8);
  objc_msgSend(v3, "sharedConnection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "isAppClipsAllowed");
  v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("YES");
    if (v4)
      v6 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: appClipsRestricted: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x2020000000;
  v7 = (_QWORD *)getMCFeatureMaximumAppsRatingSymbolLoc_ptr;
  v39 = (void *)getMCFeatureMaximumAppsRatingSymbolLoc_ptr;
  if (!getMCFeatureMaximumAppsRatingSymbolLoc_ptr)
  {
    v8 = (void *)ManagedConfigurationLibrary();
    v7 = dlsym(v8, "MCFeatureMaximumAppsRating");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v7;
    getMCFeatureMaximumAppsRatingSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&buf, 8);
  if (!v7)
    __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_cold_1();
  objc_msgSend(v24, "effectiveValueForSetting:", *v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  if (v9)
    v10 = (int)objc_msgSend(v9, "intValue");
  else
    v10 = 0x7FFFFFFFLL;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allAppClipsForPlaceholderOnly:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    v14 = v4 ^ 1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "iTunesMetadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "ratingRank");

        if ((v14 | (v18 > v10)) == 1)
        {
          v19 = v18 > v10;
          v20 = *(void **)(a1 + 32);
          objc_msgSend(v16, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_46;
          v26[3] = &unk_24C3B9480;
          v26[4] = v16;
          v27 = v19;
          objc_msgSend(v20, "_deleteClipWhenBackgrounded:completionHandler:", v21, v26);

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v12);
  }

  +[CPSSessionManager sharedManager](CPSSessionManager, "sharedManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleManagedConfigurationChanged");

}

void __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v7)
        goto LABEL_10;
      v8 = *(void **)(a1 + 32);
      v9 = v6;
      objc_msgSend(v8, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138477827;
      v14 = v10;
      v11 = "CPSClipCleanupManager: Deleted an app clip due to age restriction: %{private}@";
    }
    else
    {
      if (!v7)
        goto LABEL_10;
      v12 = *(void **)(a1 + 32);
      v9 = v6;
      objc_msgSend(v12, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138477827;
      v14 = v10;
      v11 = "CPSClipCleanupManager: Deleted an app clip due to content restriction: %{private}@";
    }
    _os_log_impl(&dword_20AD44000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);

    goto LABEL_10;
  }
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_46_cold_1(a1, v4, (uint64_t)v3);
LABEL_10:

}

- (void)applicationsDidInstall:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__CPSClipCleanupManager_applicationsDidInstall___block_invoke;
  v3[3] = &unk_24C3B9418;
  v3[4] = self;
  -[CPSClipCleanupManager _applicationsDidChange:operationHandler:](self, "_applicationsDidChange:operationHandler:", a3, v3);
}

uint64_t __48__CPSClipCleanupManager_applicationsDidInstall___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNewInstalledAppWithBundleID:", a2);
}

- (void)applicationsDidUninstall:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__CPSClipCleanupManager_applicationsDidUninstall___block_invoke;
  v3[3] = &unk_24C3B9418;
  v3[4] = self;
  -[CPSClipCleanupManager _applicationsDidChange:operationHandler:](self, "_applicationsDidChange:operationHandler:", a3, v3);
}

uint64_t __50__CPSClipCleanupManager_applicationsDidUninstall___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNewUninstalledAppWithBundleID:", a2);
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CPSClipCleanupManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__CPSClipCleanupManager_assertionTargetProcessDidExit___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__CPSClipCleanupManager_assertionTargetProcessDidExit___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_20AD44000, v2, OS_LOG_TYPE_INFO, "CPSClipCleanupManager: Assertion target process did exit %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "allKeysForObject:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v11 = *(id **)(a1 + 40);
          objc_msgSend(v11[3], "objectForKeyedSubscript:", v10, (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_uninstallClipWithBundleIdentifier:deletionPromise:", v10, v12);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", 0, v10);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKeyedSubscript:", 0, v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(v13 + 32);
      *(_QWORD *)(v13 + 32) = 0;

    }
  }
  else
  {
    v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __55__CPSClipCleanupManager_assertionTargetProcessDidExit___block_invoke_cold_1();
  }

}

- (void)_applicationsDidChange:(id)a3 operationHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_49);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__CPSClipCleanupManager__applicationsDidChange_operationHandler___block_invoke_2;
    v10[3] = &unk_24C3B93C8;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    dispatch_async(queue, v10);

  }
}

uint64_t __65__CPSClipCleanupManager__applicationsDidChange_operationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

void __65__CPSClipCleanupManager__applicationsDidChange_operationHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)_parentBundleIDsFromAppRecord:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "appClipMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentApplicationIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_51);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__CPSClipCleanupManager__parentBundleIDsFromAppRecord___block_invoke()
{
  CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
  return 0;
}

- (BOOL)_shouldDeleteClipWithRecord:(id)a3 parentRecord:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(&unk_24C3C6220, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(&unk_24C3C6220);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "iTunesMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sourceApp");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v11) & 1) != 0)
        {
          objc_msgSend(v6, "iTunesMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sourceApp");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v11);

          if ((v16 & 1) != 0)
          {
            v17 = 0;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(&unk_24C3C6220, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  v17 = 1;
LABEL_13:

  return v17;
}

- (void)_handleNewInstalledAppWithBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id obj;
  void *v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v39 = (void *)os_transaction_create();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
  v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v54 = (uint64_t)v4;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Detected installation of new app (%{private}@)", buf, 0xCu);
  }
  objc_msgSend(v5, "appClipMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    +[CPSWebClipStore sharedStore](CPSWebClipStore, "sharedStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v8;
    v50[1] = 3221225472;
    v50[2] = __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke;
    v50[3] = &unk_24C3B9558;
    v51 = v4;
    objc_msgSend(v9, "updateWebClipTitle:forAppClipBundleIdentifier:completionHandler:", v10, v51, v50);

  }
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_58);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v47;
    v34 = 134217984;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v17, "bundleIdentifier", v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "hasPrefix:", v4) & 1) != 0)
        {
          +[CPSClipCleanupManager _parentBundleIDsFromAppRecord:](CPSClipCleanupManager, "_parentBundleIDsFromAppRecord:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "containsObject:", v4) & 1) != 0)
          {
            v20 = -[CPSClipCleanupManager _shouldDeleteClipWithRecord:parentRecord:](self, "_shouldDeleteClipWithRecord:parentRecord:", v17, v5);
            v21 = CPS_LOG_CHANNEL_PREFIXClipServices();
            v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            if (v20)
            {
              if (v22)
              {
                *(_DWORD *)buf = 138478083;
                v54 = (uint64_t)v18;
                v55 = 2113;
                v56 = v4;
                _os_log_impl(&dword_20AD44000, v21, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Found clip (%{private}@) matching %{private}@ to delete", buf, 0x16u);
              }
              objc_msgSend(v36, "addObject:", v18);
            }
            else if (v22)
            {
              *(_DWORD *)buf = 138478083;
              v54 = (uint64_t)v18;
              v55 = 2113;
              v56 = v4;
              _os_log_impl(&dword_20AD44000, v21, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Clip (%{private}@) matching %{private}@ should not be deleted", buf, 0x16u);
            }
          }
          else
          {
            v24 = CPS_LOG_CHANNEL_PREFIXClipServices();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = v24;
              v26 = objc_msgSend(v19, "count");
              *(_DWORD *)buf = v34;
              v54 = v26;
              _os_log_impl(&dword_20AD44000, v25, OS_LOG_TYPE_INFO, "CPSClipCleanupManager: Found no match for parent bundle IDs (count: %lu) from clip", buf, 0xCu);

            }
          }

        }
        else
        {
          v23 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            v54 = (uint64_t)v18;
            v55 = 2117;
            v56 = v4;
            _os_log_impl(&dword_20AD44000, v23, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: Clip bundleID (%{private}@) prefix does not match %{sensitive}@", buf, 0x16u);
          }
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v14);
  }
  v35 = v5;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v37 = v36;
  v27 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v37);
        v31 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
        +[CPSAnalyticsLogger sharedLogger](CPSAnalyticsLogger, "sharedLogger", v35);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "didUpgradeToFullAppFromClip:", v31);

        +[CPSWebClipStore sharedStore](CPSWebClipStore, "sharedStore");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke_60;
        v40[3] = &unk_24C3B95A0;
        v41 = v39;
        objc_msgSend(v33, "redirectPoweredByWebClipsWithApplicationBundleIdentifier:toParentApplicationBundleIdentifier:completionHandler:", v31, v4, v40);

        -[CPSClipCleanupManager _transferTCCPermissionsFromClipWithBundleID:toParentAppWithBundleID:](self, "_transferTCCPermissionsFromClipWithBundleID:toParentAppWithBundleID:", v31, v4);
        -[CPSClipCleanupManager _deleteClipWhenBackgrounded:completionHandler:](self, "_deleteClipWhenBackgrounded:completionHandler:", v31, 0);

      }
      v28 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v28);
  }

}

void __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke_cold_1(a1, v4, v3);
  }

}

BOOL __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke_57(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "appClipMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_transferTCCPermissionsFromClipWithBundleID:(id)a3 toParentAppWithBundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
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
  _QWORD v28[5];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = *MEMORY[0x24BEB38C0];
  v28[0] = *MEMORY[0x24BEB3848];
  v28[1] = v8;
  v28[2] = *MEMORY[0x24BEB3838];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = (id)TCCAccessCopyInformationForBundleId();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    v15 = (_QWORD *)MEMORY[0x24BEB3828];
    v16 = (_QWORD *)MEMORY[0x24BEB3818];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", *v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 && objc_msgSend(v10, "containsObject:", v19))
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", *v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            objc_msgSend(v20, "BOOLValue");
            TCCAccessSetForBundleId();
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  if (objc_msgSend(MEMORY[0x24BDBFA88], "authorizationStatusForBundleIdentifier:", v22) == 2)
    objc_msgSend(MEMORY[0x24BDBFA88], "setAuthorizationStatusByType:forBundleIdentifier:", 2, v6);

}

- (void)_handleNewUninstalledAppWithBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)os_transaction_create();
  +[CPSWebClipStore sharedStore](CPSWebClipStore, "sharedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke;
  v20[3] = &unk_24C3B95C8;
  v8 = v4;
  v21 = v8;
  v9 = v5;
  v22 = v9;
  objc_msgSend(v6, "removeWebClipsWithApplicationBundleIdentifier:completionHandler:", v8, v20);

  v10 = objc_alloc_init(MEMORY[0x24BE0FF00]);
  v14 = v7;
  v15 = 3221225472;
  v16 = __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_66;
  v17 = &unk_24C3B95F0;
  v18 = v8;
  v19 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "clearCachesForLinkItemsAssociatedWithBundleID:completion:", v12, &v14);
  +[CPSClipDataSQLiteStore defaultStore](CPSClipDataSQLiteStore, "defaultStore", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeRecordWithBundleID:", v12);

}

void __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_cold_1();
  }

}

void __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_66_cold_1();
  }

}

- (void)_deleteClipWhenBackgrounded:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  OS_os_transaction *v16;
  OS_os_transaction *deletionTransaction;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v23 = v6;
    _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: will delete clip when backgrounded: %{private}@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clipDeletionPromisesByBundleIDs, "objectForKeyedSubscript:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    +[CPSPromise promise](CPSPromise, "promise");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v7)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __71__CPSClipCleanupManager__deleteClipWhenBackgrounded_completionHandler___block_invoke;
    v20[3] = &unk_24C3B9328;
    v21 = v7;
    objc_msgSend(v10, "addCompletionBlock:", v20);

  }
  if (!v9)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE80D40]);
    objc_msgSend(v11, "setExplanation:", CFSTR("Terminate clip before uninstallation"));
    objc_msgSend(v11, "setMaximumTerminationResistance:", 30);
    objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80D50]), "initWithPredicate:context:", v12, v11);
    objc_msgSend(v13, "addObserver:", self);
    v19 = 0;
    v14 = objc_msgSend(v13, "acquireWithError:", &v19);
    v15 = v19;
    if ((v14 & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingTerminationAssertionsByBundleIDs, "setObject:forKeyedSubscript:", v13, v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clipDeletionPromisesByBundleIDs, "setObject:forKeyedSubscript:", v10, v6);
      if (!self->_deletionTransaction)
      {
        v16 = (OS_os_transaction *)os_transaction_create();
        deletionTransaction = self->_deletionTransaction;
        self->_deletionTransaction = v16;

      }
    }
    else
    {
      v18 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CPSClipCleanupManager _deleteClipWhenBackgrounded:completionHandler:].cold.1((uint64_t)v6);
      -[CPSClipCleanupManager _uninstallClipWithBundleIdentifier:deletionPromise:](self, "_uninstallClipWithBundleIdentifier:deletionPromise:", v6, v10);
      objc_msgSend(v13, "removeObserver:", self);
      objc_msgSend(v13, "invalidate");
    }

  }
}

uint64_t __71__CPSClipCleanupManager__deleteClipWhenBackgrounded_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_uninstallClipWithBundleIdentifier:(id)a3 deletionPromise:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__CPSClipCleanupManager__uninstallClipWithBundleIdentifier_deletionPromise___block_invoke;
  v9[3] = &unk_24C3B9378;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  +[CPSUtilities uninstallAppWithBundleIdentifier:completion:](CPSUtilities, "uninstallAppWithBundleIdentifier:completion:", v8, v9);

}

void __76__CPSClipCleanupManager__uninstallClipWithBundleIdentifier_deletionPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__CPSClipCleanupManager__uninstallClipWithBundleIdentifier_deletionPromise___block_invoke_cold_1(a1, v5, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138477827;
    v8 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_DEFAULT, "CPSClipCleanupManager: successfully deleted clip %{private}@", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionTransaction, 0);
  objc_storeStrong((id *)&self->_clipDeletionPromisesByBundleIDs, 0);
  objc_storeStrong((id *)&self->_pendingTerminationAssertionsByBundleIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__CPSClipCleanupManager_removeClipsByUser_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_20AD44000, v0, v1, "CPSClipCleanupManager: failed to delete web clips before their backing app clips %{private}@ are uninstalled: %{private}@");
  OUTLINED_FUNCTION_3_0();
}

void __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "CPSClipCleanupManager: Didn't get distributed notification name.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __64__CPSClipCleanupManager__registerDistributedNotificationHandler__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "CPSClipCleanupManager: Failed to convert user info XPC dictionary to CF dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_didReceiveApplicationChangedNotification:(uint64_t)a3 operationHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "CPSClipCleanupManager: Failed to find launched app's bundleID in XPC event", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMCFeatureMaximumAppsRating(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSClipCleanupManager.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
}

void __66__CPSClipCleanupManager__didReceiveMCSettingsChangedNotification___block_invoke_46_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  NSObject *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = OUTLINED_FUNCTION_8(a1, a2);
  objc_msgSend(v3, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 40);
  v10 = 138478339;
  v11 = v7;
  if (v8)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v12 = 2112;
  v13 = v9;
  v14 = 2112;
  v15 = a3;
  _os_log_error_impl(&dword_20AD44000, v6, OS_LOG_TYPE_ERROR, "CPSClipCleanupManager: Error ocurred when deleting %{private}@, ageRestricted: %@, error: %@", (uint8_t *)&v10, 0x20u);

}

void __55__CPSClipCleanupManager_assertionTargetProcessDidExit___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_20AD44000, v0, OS_LOG_TYPE_ERROR, "CPSClipCleanupManager: Clip not found for assertion %@", v1, 0xCu);
  OUTLINED_FUNCTION_3_0();
}

void __60__CPSClipCleanupManager__handleNewInstalledAppWithBundleID___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = OUTLINED_FUNCTION_8(a1, a2);
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v4, v6, "CPSClipCleanupManager: Failed to update web clip title for %{private}@ due to %{public}@", v7);

  OUTLINED_FUNCTION_5();
}

void __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_20AD44000, v0, v1, "CPSClipCleanupManager: failed to delete web clips %{private}@ when its backing app clip is uninstalled: %{sensitive}@");
  OUTLINED_FUNCTION_3_0();
}

void __62__CPSClipCleanupManager__handleNewUninstalledAppWithBundleID___block_invoke_66_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_20AD44000, v0, v1, "CPSClipCleanupManager: failed to delete ABR cached items for bundleID %{private}@, Error: %@");
  OUTLINED_FUNCTION_3_0();
}

- (void)_deleteClipWhenBackgrounded:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_20AD44000, v1, v2, "CPSClipCleanupManager: Unable to acquire termination assertion for bundle ID %@ with error %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3_0();
}

void __76__CPSClipCleanupManager__uninstallClipWithBundleIdentifier_deletionPromise___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = OUTLINED_FUNCTION_8(a1, a2);
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v4, v6, "CPSClipCleanupManager: failed to delete clip %{private}@: %{public}@", v7);

  OUTLINED_FUNCTION_5();
}

@end
