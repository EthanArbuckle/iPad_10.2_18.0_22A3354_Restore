@implementation FPDDownloadManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FPDDownloadManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, block);
  return (id)sharedInstance__instance;
}

void __36__FPDDownloadManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v1;

}

+ (id)acquireDownloadSlotForItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "providerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)_globalDownloadSlotsByProvider;
  objc_sync_enter(v5);
  objc_msgSend((id)_globalDownloadSlotsByProvider, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = dispatch_semaphore_create(256);
    objc_msgSend((id)_globalDownloadSlotsByProvider, "setObject:forKeyedSubscript:", v6, v4);
  }
  objc_sync_exit(v5);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  return v4;
}

+ (void)releaseDownloadSlot:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  v3 = (id)_globalDownloadSlotsByProvider;
  objc_sync_enter(v3);
  objc_msgSend((id)_globalDownloadSlotsByProvider, "objectForKeyedSubscript:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ semaphore should still exists"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[FPDDownloadManager releaseDownloadSlot:].cold.1();

    __assert_rtn("+[FPDDownloadManager releaseDownloadSlot:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/download/FPDDownloadManager.m", 84, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  }
  dispatch_semaphore_signal(v4);

}

+ (void)initialize
{
  if (initialize_once != -1)
    dispatch_once(&initialize_once, &__block_literal_global_19);
}

void __32__FPDDownloadManager_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_globalDownloadSlotsByProvider;
  _globalDownloadSlotsByProvider = v0;

}

- (FPDDownloadManager)init
{
  FPDDownloadManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *preflightQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FPDDownloadManager;
  v2 = -[FPDDownloadManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("FileProvider.download-manager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("FileProvider.download-manager.preflight", v6);
    preflightQueue = v2->_preflightQueue;
    v2->_preflightQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)downloadItems:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 request:(id)a6 perItemCompletion:(id)a7 withCompletion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *queue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  FPDDownloadManager *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke;
  block[3] = &unk_1E8C78400;
  v26 = v14;
  v27 = self;
  v31 = v18;
  v32 = a4;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  dispatch_async(queue, block);

}

void __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id obj;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__13;
  v27[4] = __Block_byref_object_dispose__13;
  v28 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v3)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v4);
        fp_current_or_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v5;
          _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: starting recursive download of item  %@", buf, 0xCu);
        }

        dispatch_group_enter(v2);
        v7 = *(_QWORD *)(a1 + 80);
        v8 = *(void **)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 56);
        v11 = *(_QWORD *)(a1 + 64);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_6;
        v20[3] = &unk_1E8C783D8;
        v21 = v2;
        v22 = v27;
        objc_msgSend(v8, "downloadItem:recursively:downloader:request:perItemCompletion:withCompletion:", v5, v7, v9, v10, v11, v20);

        ++v4;
      }
      while (v3 != v4);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v3);
  }

  v12 = *(void **)(a1 + 32);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_8;
  block[3] = &unk_1E8C76928;
  v17 = v12;
  v18 = *(id *)(a1 + 72);
  v19 = v27;
  dispatch_group_notify(v2, v13, block);

  _Block_object_dispose(v27, 8);
}

void __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  if (v4)
  {
    v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_6_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_sync_exit(v5);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_8_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return result;
}

- (void)downloadItem:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 request:(id)a6 perItemCompletion:(id)a7 withCompletion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  FPDDownloadManager *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  fp_current_or_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[FPDDownloadManager downloadItem:recursively:downloader:request:perItemCompletion:withCompletion:].cold.1();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke;
  block[3] = &unk_1E8C78400;
  v32 = v18;
  v33 = a4;
  v27 = v14;
  v28 = self;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  dispatch_async(queue, block);

}

void __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 48), "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isUsingFPFS");
      v8 = *(_QWORD *)(a1 + 80) == 1;
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_2;
      v25[3] = &unk_1E8C78428;
      v11 = *(_QWORD *)(a1 + 64);
      v26 = *(id *)(a1 + 72);
      objc_msgSend(v4, "_recursivelyDownloadItem:forceDiskIteration:skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:", v2, v7, v8, v9, v10, v11, v25);

      v12 = v26;
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_3;
      v22[3] = &unk_1E8C78450;
      v21 = *(_QWORD *)(a1 + 56);
      v23 = *(id *)(a1 + 64);
      v24 = *(id *)(a1 + 72);
      objc_msgSend(v4, "_downloadItem:downloader:request:withCompletion:", v2, v5, v21, v22);

      v12 = v23;
    }
  }
  else
  {
    if (!*(_QWORD *)(a1 + 72))
      return;
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_cold_1(v3, v13, v14, v15, v16, v17, v18, v19);

    v20 = *(_QWORD *)(a1 + 72);
    FPItemNotFoundError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v12);
  }

}

uint64_t __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v12, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, id))(v9 + 16))(v9, v12, v10, v8);

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v8);

}

- (void)verifyIfSubtreeIsFullyMaterializedBelowItem:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  FPDDownloadManager *v21;
  id v22;
  unint64_t v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[FPDDownloadManager verifyIfSubtreeIsFullyMaterializedBelowItem:recursively:downloader:completion:].cold.1();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke;
  block[3] = &unk_1E8C779C0;
  v22 = v12;
  v23 = a4;
  v19 = v10;
  v20 = v11;
  v21 = self;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  dispatch_async(queue, block);

}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  FPDSubtreeChangeDetector *v5;
  void *v6;
  void *v7;
  id *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  char v20;
  _QWORD v21[5];
  id obj;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v2 = 0;
  v3 = 0;
  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__13;
  v27 = __Block_byref_object_dispose__13;
  v28 = 0;
  v4 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 64) == 2)
  {
    v5 = [FPDSubtreeChangeDetector alloc];
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;
    obj = v24[5];
    v2 = -[FPDSubtreeChangeDetector initAtPath:error:](v5, "initAtPath:error:", v7, &obj);
    objc_storeStrong(v8 + 5, obj);

    if (!v2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_5;
    }
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2;
    v21[3] = &unk_1E8C784A0;
    v21[4] = &v23;
    v3 = (void *)MEMORY[0x1D17D1C84](v21);
  }
  v9 = objc_msgSend(*(id *)(a1 + 40), "isDryRun");
  objc_msgSend(*(id *)(a1 + 40), "setDryRun:", 1);
  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_19;
  v14[3] = &unk_1E8C784C8;
  v15 = v10;
  v20 = v9;
  v13 = v2;
  v16 = v13;
  v18 = *(id *)(a1 + 56);
  v19 = &v23;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v11, "_recursivelyDownloadItem:forceDiskIteration:skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:", v12, 1, 0, v15, 0, v3, v14);

LABEL_5:
  _Block_object_dispose(&v23, 8);

}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2_cold_2();
  }
  else
  {
    v10 = objc_retainAutorelease(v7);
    objc_msgSend(v10, "fileSystemRepresentation");
    v12 = v10;
    v13 = v6;
    if ((fpfs_openat() & 0x80000000) != 0 && *__error() != 22)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2_cold_1();

    }
    v9 = v12;
  }

}

uint64_t __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_16(uint64_t a1, int a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  stat v10;
  char v11;

  if ((fpfs_unset_evictable() & 0x80000000) != 0)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_16_cold_1();

    return 0xFFFFFFFFLL;
  }
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 40), "providerDomainID");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");

  if (v5)
    fpfs_get_is_ignore_root();
  memset(&v10, 0, sizeof(v10));
  if (fstat(a2, &v10) < 0)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_16_cold_2(a1, v6);
    goto LABEL_17;
  }
  if ((v10.st_mode & 0xF000) == 0x4000 && (fpfs_fset_syncroot() & 0x80000000) != 0)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_16_cold_3();
LABEL_17:
    v7 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "providerDomainID");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[NSObject UTF8String](v6, "UTF8String");
    fpfs_set_is_ignore_root();
    v7 = 0;
LABEL_18:

    return v7;
  }
  return 0;
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setDryRun:", *(unsigned __int8 *)(a1 + 72));
  if (v4 || (v5 = *(void **)(a1 + 40)) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v6 + 40);
    objc_msgSend(v5, "verifyTreeIdentityWithError:", &obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v6 + 40), obj);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setProvidedItemRecursiveGenerationCount:forItemAtURL:", v7, v9);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)retrieveFPItemForURL:(id)a3 domain:(id)a4 request:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *queue;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (a4)
  {
    objc_msgSend(a4, "defaultBackend");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke;
    v19[3] = &unk_1E8C758B8;
    v19[4] = self;
    v20 = v10;
    v21 = v13;
    objc_msgSend(v14, "itemForURL:request:completionHandler:", v20, v11, v19);

    v15 = v20;
  }
  else
  {
    queue = self->_queue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_21;
    v17[3] = &unk_1E8C77448;
    v18 = v12;
    dispatch_async(queue, v17);
    v15 = v18;
  }

}

void __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_2;
  block[3] = &unk_1E8C75C50;
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

void __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_2_cold_1(a1, v2, v3);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v5 + 16))(*(_QWORD *)(a1 + 48), v4, 0);
  }
  else
  {
    FPItemNotFoundErrorAtURL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

void __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  FPNotSupportedError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)progressComputationPreflightForRecursiveRoot:(id)a3 downloader:(id)a4 itemProgressNeedsSetup:(id)a5 itemProgressSetup:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  char v17;
  uint64_t v18;
  void *v19;
  id v20;
  int is_demoted_at;
  NSObject *preflightQueue;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(_QWORD);
  char v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  v17 = objc_msgSend(v12, "isFolder");
  if (objc_msgSend(v12, "isPackage"))
  {
    v29 = 0;
    objc_msgSend(v12, "fileURL");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v12, "fileURL");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "fileSystemRepresentation");
      is_demoted_at = fpfs_pkg_is_demoted_at();

      if (!is_demoted_at)
        goto LABEL_5;
    }
  }
  if ((v17 & 1) != 0)
  {
    preflightQueue = self->_preflightQueue;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke;
    v23[3] = &unk_1E8C784F0;
    v24 = v13;
    v25 = v12;
    v26 = v15;
    v27 = v14;
    v28 = v16;
    dispatch_async(preflightQueue, v23);

  }
  else
  {
LABEL_5:
    if (v16)
      v16[2](v16);
  }

}

void __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTotalUnitCount:", 0);
  objc_msgSend(v10, "setKind:", *MEMORY[0x1E0CB30F8]);
  objc_msgSend(v10, "setFileCompletedCount:", &unk_1E8C95E50);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFileTotalCount:", v11);

  objc_msgSend(*(id *)(a1 + 40), "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFileURL:", v12);

  objc_msgSend(v10, "publish");
  if ((objc_msgSend(*(id *)(a1 + 40), "isRecursivelyDownloaded") & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    LOBYTE(v15) = 1;
    goto LABEL_21;
  }
  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPDIterator hybridIteratorForItem:domain:enforceFPItem:](FPDIterator, "hybridIteratorForItem:domain:enforceFPItem:", v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = 1;
  objc_msgSend(v18, "setShouldDecorateItems:", 1);
  if ((objc_msgSend(v18, "done") & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_20;
  }
  v14 = 0;
  v13 = 0;
  while (1)
  {
    v19 = (void *)MEMORY[0x1D17D1B04]();
    v31 = 0;
    objc_msgSend(v18, "nextWithError:", &v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v31;
    if (!v20)
      break;
    if (!objc_msgSend(v20, "isProviderItem") || (objc_msgSend(v20, "isDownloaded") & 1) != 0)
      goto LABEL_17;
    if ((objc_msgSend(v20, "isFolder") & 1) != 0)
      goto LABEL_16;
    ++v13;
    v14 += objc_msgSend(v20, "size");
    objc_msgSend(v20, "asFPItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fileURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v15 = *(_QWORD *)(a1 + 48);
LABEL_15:
      objc_msgSend(v20, "asFPItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v24);

LABEL_16:
      LOBYTE(v15) = 0;
      goto LABEL_17;
    }
    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
      goto LABEL_15;
LABEL_17:
    objc_msgSend(v10, "setTotalUnitCount:", v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFileTotalCount:", v25);

    objc_autoreleasePoolPop(v19);
    if (objc_msgSend(v18, "done"))
      goto LABEL_20;
  }

  objc_autoreleasePoolPop(v19);
LABEL_20:

LABEL_21:
  fp_current_or_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v29 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15 & 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v33 = v29;
    v34 = 2048;
    v35 = v13;
    v36 = 2048;
    v37 = v14;
    v38 = 2112;
    v39 = v30;
    _os_log_debug_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: preflight for root: %@, numItems:%lu, undownloadedSize:%lu, fullyMaterialized:%@", buf, 0x2Au);

  }
  fp_current_or_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke_cold_1(v10, v27);

  v28 = *(_QWORD *)(a1 + 64);
  if (v28)
    (*(void (**)(void))(v28 + 16))();

}

- (void)_recursivelyDownloadItem:(id)a3 forceDiskIteration:(BOOL)a4 skipAlreadyDownloadedItems:(BOOL)a5 downloader:(id)a6 request:(id)a7 perItemCompletion:(id)a8 completion:(id)a9
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  uint64_t *v36;
  id v37;
  char v38;
  char v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  NSObject *queue;
  NSObject *group;
  _BOOL4 v50;
  id v51;
  _BOOL4 v52;
  void *v53;
  void (**v54)(id, NSObject *, void *, _QWORD);
  _QWORD block[4];
  id v56;
  id v57;
  uint64_t *v58;
  _QWORD v59[4];
  NSObject *v60;
  id v61;
  NSObject *v62;
  FPDDownloadManager *v63;
  id v64;
  void (**v65)(id, NSObject *, void *, _QWORD);
  uint64_t *v66;
  BOOL v67;
  BOOL v68;
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint8_t v76[4];
  uint64_t v77;
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v52 = a5;
  v50 = a4;
  v80 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v51 = a7;
  v54 = (void (**)(id, NSObject *, void *, _QWORD))a8;
  v14 = a9;
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[FPDDownloadManager _recursivelyDownloadItem:forceDiskIteration:skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

  objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:", v12);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isRecursivelyDownloaded") & v52) != 1)
  {
    objc_msgSend(v13, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "provider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDIterator iteratorForLocator:wantsDisk:provider:](FPDIterator, "iteratorForLocator:wantsDisk:provider:", v53, v50, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setShouldDecorateItems:", 1);
    objc_msgSend(v23, "setSkipMaterializedTreeTraversal:", v52);
    group = dispatch_group_create();
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__13;
    v74 = __Block_byref_object_dispose__13;
    v75 = 0;
    while (1)
    {
      if ((objc_msgSend(v23, "done") & 1) != 0)
      {
LABEL_39:
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_29;
        block[3] = &unk_1E8C78590;
        v56 = v53;
        v58 = &v70;
        v57 = v14;
        dispatch_group_notify(group, queue, block);

        _Block_object_dispose(&v70, 8);
        goto LABEL_40;
      }
      v26 = (void *)MEMORY[0x1D17D1B04]();
      v69 = 0;
      objc_msgSend(v23, "nextWithError:", &v69);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v69;
      objc_msgSend(v13, "cancellationProgress");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isCancelled");

      if (v30)
      {
        fp_current_or_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)v71[5], "fp_prettyDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v79 = v32;
          _os_log_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_INFO, "[INFO] download-manager: recursive downloader had been canceled due to error %@", buf, 0xCu);

        }
        v33 = 0;
      }
      else if (v27 || !v28)
      {
        v38 = objc_msgSend(v23, "done");
        if (v27)
          v39 = v38;
        else
          v39 = 1;
        if ((v39 & 1) != 0)
        {
          v33 = 0;
          goto LABEL_17;
        }
        if ((objc_msgSend(v27, "isDownloaded") & 1) != 0)
        {
          if (!v54)
          {
            v33 = 1;
            goto LABEL_17;
          }
          if (objc_msgSend(v27, "isProviderItem")
            && (objc_msgSend(v27, "asFPItem"), v40 = objc_claimAutoreleasedReturnValue(), (v31 = v40) != 0))
          {
            -[NSObject fileURL](v40, "fileURL");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v27, "asURL");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0;
          }
          fp_current_or_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v27;
            _os_log_debug_impl(&dword_1CF55F000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: Already materialized item %@ so skipping", buf, 0xCu);
          }

          v54[2](v54, v31, v41, 0);
          v33 = 1;
        }
        else if (objc_msgSend(v13, "isDryRun"))
        {
          fp_current_or_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v27;
            _os_log_error_impl(&dword_1CF55F000, v42, OS_LOG_TYPE_ERROR, "[ERROR] download-manager: found non-downloaded item %@", buf, 0xCu);
          }

          FPSubtreeChangedError();
          v43 = objc_claimAutoreleasedReturnValue();
          v33 = 0;
          v31 = v71[5];
          v71[5] = v43;
        }
        else
        {
          dispatch_group_enter(group);
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke;
          v59[3] = &unk_1E8C78568;
          v66 = &v70;
          v44 = v13;
          v60 = v44;
          v65 = v54;
          v45 = v27;
          v61 = v45;
          v62 = group;
          v63 = self;
          v67 = v50;
          v68 = v52;
          v64 = v51;
          -[FPDDownloadManager _downloadItemAtLocator:downloader:request:completion:](self, "_downloadItemAtLocator:downloader:request:completion:", v45, v44, v64, v59);

          v33 = 1;
          v31 = v60;
        }
      }
      else
      {
        fp_current_or_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v28, "fp_prettyDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPDDownloadManager _recursivelyDownloadItem:forceDiskIteration:skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:].cold.1(v35, v76, &v77, v34);
        }

        v36 = v71;
        v37 = v28;
        v33 = 0;
        v31 = v36[5];
        v36[5] = (uint64_t)v37;
      }

LABEL_17:
      objc_autoreleasePoolPop(v26);
      if ((v33 & 1) == 0)
        goto LABEL_39;
    }
  }
  objc_msgSend(v12, "fileURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v14 + 2))(v14, v23, 0);
LABEL_40:

}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  __int16 v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_cold_2((uint64_t)v7, v9, v10);

  if (v9)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v13 = *(_QWORD *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (!v13)
    {
      objc_storeStrong(v12, a4);
      objc_msgSend(*(id *)(a1 + 32), "cancellationProgress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isCancelled");

      if ((v15 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "cancel");
    }
  }
  v16 = *(_QWORD *)(a1 + 72);
  if (v16)
    (*(void (**)(uint64_t, id, id, id))(v16 + 16))(v16, v7, v8, v9);
  if (objc_msgSend(*(id *)(a1 + 40), "isExternalURL"))
  {
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isUsingFPFS") & 1) != 0)
    {
      if (objc_msgSend(v7, "isFolder"))
      {

      }
      else
      {
        v18 = objc_msgSend(v7, "isPackage");

        if (!v18)
          goto LABEL_18;
      }
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_cold_1();

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v20 = *(_QWORD *)(a1 + 56);
      v21 = *(NSObject **)(v20 + 8);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_28;
      v24[3] = &unk_1E8C78540;
      v24[4] = v20;
      v25 = v7;
      v31 = *(_WORD *)(a1 + 88);
      v26 = *(id *)(a1 + 32);
      v27 = *(id *)(a1 + 64);
      v22 = *(id *)(a1 + 72);
      v23 = *(_QWORD *)(a1 + 80);
      v29 = v22;
      v30 = v23;
      v28 = *(id *)(a1 + 48);
      dispatch_async(v21, v24);

    }
    else
    {

    }
  }
LABEL_18:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_28(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 88);
  v5 = *(unsigned __int8 *)(a1 + 89);
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_2;
  v9[3] = &unk_1E8C78518;
  v8 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 80);
  v10 = v6;
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_recursivelyDownloadItem:forceDiskIteration:skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:", v3, v4, v5, v10, v7, v8, v9);

}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
    {
      objc_storeStrong(v7, a3);
      objc_msgSend(*(id *)(a1 + 32), "cancellationProgress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isCancelled");

      if ((v10 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "cancel");
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_29(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_29_cold_1(a1, v2);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "asFPItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)_downloadItem:(id)a3 downloader:(id)a4 request:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  FPDDownloadManager *v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a6;
  queue = self->_queue;
  v13 = a5;
  v14 = a4;
  dispatch_assert_queue_V2(queue);
  objc_msgSend((id)objc_opt_class(), "acquireDownloadSlotForItem:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[FPDDownloadManager _downloadItem:downloader:request:withCompletion:].cold.1();

  objc_msgSend(v14, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancellationProgress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke;
  v23[3] = &unk_1E8C785B8;
  v24 = v10;
  v25 = self;
  v26 = v15;
  v27 = v11;
  v20 = v11;
  v21 = v15;
  v22 = v10;
  objc_msgSend(v17, "downloadItemWithItemID:request:progress:completionHandler:", v18, v13, v19, v23);

}

void __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke_cold_2(a1, v7);

  objc_msgSend((id)objc_opt_class(), "releaseDownloadSlot:", *(_QWORD *)(a1 + 48));
  if (v6)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke_cold_1(a1, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(*(id *)(a1 + 32), "setFileURL:", v5);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, id))(v10 + 16))(v10, v11, v12, v6);

}

- (void)_downloadItemAtLocator:(id)a3 downloader:(id)a4 request:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "isProviderItem"))
  {
    objc_msgSend(v10, "asFPItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDDownloadManager _downloadItem:downloader:request:withCompletion:](self, "_downloadItem:downloader:request:withCompletion:", v14, v11, v12, v13);

  }
  else
  {
    objc_msgSend(v11, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "defaultBackend");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__FPDDownloadManager__downloadItemAtLocator_downloader_request_completion___block_invoke;
    v18[3] = &unk_1E8C785E0;
    v18[4] = self;
    v22 = v13;
    v19 = v10;
    v20 = v11;
    v21 = v12;
    objc_msgSend(v16, "itemForURL:request:completionHandler:", v17, v21, v18);

  }
}

void __75__FPDDownloadManager__downloadItemAtLocator_downloader_request_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__FPDDownloadManager__downloadItemAtLocator_downloader_request_completion___block_invoke_2;
  block[3] = &unk_1E8C77C28;
  v13 = v5;
  v14 = v6;
  v19 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __75__FPDDownloadManager__downloadItemAtLocator_downloader_request_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v1)
    {
      v2 = *(_QWORD *)(a1 + 80);
LABEL_5:
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0);
      return;
    }
    objc_msgSend(*(id *)(a1 + 56), "_downloadItem:downloader:request:withCompletion:");
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 80);
    if (v1)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 48), "asURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    FPItemNotFoundErrorAtURL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v2 + 16))(v2, 0, 0, v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)releaseDownloadSlot:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

void __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] download-manager: items downloaded recursively with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_8_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] download-manager: Completed downloading roots for items %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

- (void)downloadItem:recursively:downloader:request:perItemCompletion:withCompletion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, (uint64_t)v0, "[DEBUG] download-manager: Request to download item %@, recursively %@", v1);
  OUTLINED_FUNCTION_8_0();
}

void __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] download-manager: No item to download for locatorItem %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

- (void)verifyIfSubtreeIsFullyMaterializedBelowItem:recursively:downloader:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] download-manager: looking for dataless faults in %@, recursively", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v1, v2, "[ERROR] download-manager: removal of FileProvider Bits  failed on %@: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_ERROR, "[ERROR] download-manager: post-download traversal failed on %@: %@", v1, 0x16u);
  OUTLINED_FUNCTION_8_0();
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_16_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v1, v2, "[ERROR] download-manager: removal of purgeability attributes failed on %@: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_16_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *__error();
  v5 = 138412546;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] download-manager: failed to stat on %@: %{errno}d", (uint8_t *)&v5, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_16_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v1, v2, "[ERROR] download-manager: removal of syncroot bit failed on %@: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

void __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a2, a3, "[DEBUG] Received item %@ for url %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_8_0();
}

void __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileTotalCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: Publishing download rootProgress %@ (%@ files) at url %@", (uint8_t *)&v6, 0x20u);

}

void __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] download-manager: starting preflight", a5, a6, a7, a8, 0);
}

- (void)_recursivelyDownloadItem:(_QWORD *)a3 forceDiskIteration:(os_log_t)log skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:.cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] download-manager: encountered error during enumeration: %@", buf, 0xCu);

}

- (void)_recursivelyDownloadItem:(uint64_t)a3 forceDiskIteration:(uint64_t)a4 skipAlreadyDownloadedItems:(uint64_t)a5 downloader:(uint64_t)a6 request:(uint64_t)a7 perItemCompletion:(uint64_t)a8 completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] download-manager: recursive download has began", a5, a6, a7, a8, 0);
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] download-manager: recursive in item %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a3, v5, "[DEBUG] download-manager: Finished downloading item %@ - %@", v6);

  OUTLINED_FUNCTION_2();
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_29_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "asFPItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a2, v6, "[DEBUG] download-manager: Completed downloading items recursively from root %@: %@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)_downloadItem:downloader:request:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] download-manager: requesting non recursive download of %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v5, v6, "[ERROR] download-manager: couldn't provide item for itemID (%@): %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: Finished downloading %@", v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

@end
