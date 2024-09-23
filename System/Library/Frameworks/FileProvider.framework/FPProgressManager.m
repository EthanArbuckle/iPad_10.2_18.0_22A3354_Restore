@implementation FPProgressManager

void __41__FPProgressManager_copyProgressForItem___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObjectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_3);
  return (id)defaultManager_defaultManager;
}

- (id)copyProgressForItem:(id)a3
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FPProgressManager_copyProgressForItem___block_invoke;
  block[3] = &unk_1E444AB70;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)attachProgressToItemsIfNeeded:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412802;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isDownloading", v13) & 1) != 0 || objc_msgSend(v9, "isUploading"))
        {
          objc_msgSend(v9, "progress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            fp_current_or_default_log();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              v12 = objc_opt_class();
              *(_DWORD *)buf = v13;
              v19 = v12;
              v20 = 2048;
              v21 = v10;
              v22 = 2112;
              v23 = v9;
              _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] progress <%@:%p> attached to %@", buf, 0x20u);
            }

          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v6);
  }

}

void __35__FPProgressManager_defaultManager__block_invoke()
{
  FPProgressManager *v0;
  void *v1;

  v0 = objc_alloc_init(FPProgressManager);
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;

}

- (FPProgressManager)init
{
  FPProgressManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMapTable *downloadProgressPerItemIDs;
  uint64_t v8;
  NSMapTable *uploadProgressPerItemIDs;
  FPOneToManyWeakMap *v10;
  FPOneToManyWeakMap *copyProgressPerItemIDs;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FPProgressManager;
  v2 = -[FPProgressManager init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.FileProvider.item-progress-manager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    downloadProgressPerItemIDs = v2->_downloadProgressPerItemIDs;
    v2->_downloadProgressPerItemIDs = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    uploadProgressPerItemIDs = v2->_uploadProgressPerItemIDs;
    v2->_uploadProgressPerItemIDs = (NSMapTable *)v8;

    v10 = objc_alloc_init(FPOneToManyWeakMap);
    copyProgressPerItemIDs = v2->_copyProgressPerItemIDs;
    v2->_copyProgressPerItemIDs = v10;

  }
  return v2;
}

- (void)registerCopyProgress:(id)a3 forItemID:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__FPProgressManager_registerCopyProgress_forItemID___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __52__FPProgressManager_registerCopyProgress_forItemID___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "addObject:forKey:", a1[5], a1[6]);
}

- (void)removeCopyProgressForItemID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __49__FPProgressManager_removeCopyProgressForItemID___block_invoke;
    block[3] = &unk_1E4449A40;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

uint64_t __49__FPProgressManager_removeCopyProgressForItemID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectsForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeDownloadProgressForItemID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __53__FPProgressManager_removeDownloadProgressForItemID___block_invoke;
    block[3] = &unk_1E4449A40;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

uint64_t __53__FPProgressManager_removeDownloadProgressForItemID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)removeCopyProgress:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FPProgressManager_removeCopyProgress___block_invoke;
  block[3] = &unk_1E444AB70;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  dispatch_sync(queue, block);
  objc_msgSend((id)v13[5], "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __40__FPProgressManager_removeCopyProgress___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "removeObject:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)downloadProgressForItem:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v15;

  -[FPProgressManager _progressForItem:usingProgressMap:](self, "_progressForItem:usingProgressMap:", a3, self->_downloadProgressPerItemIDs);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0CB30B8];
    if ((objc_msgSend(v3, "fp_isOfFileOperationKind:", *MEMORY[0x1E0CB30B8]) & 1) == 0)
    {
      objc_msgSend(v4, "fp_fileOperationKind");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      fp_simulate_crash(CFSTR("[Progress] Progress kind %@ should be \"downloading\" but instead it's \"%@\"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v4);

      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[FPProgressManager downloadProgressForItem:].cold.1(v4);

      objc_msgSend(v4, "fp_setFileOperationKind:", v5);
    }
  }
  return v4;
}

- (id)uploadProgressForItem:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v15;

  -[FPProgressManager _progressForItem:usingProgressMap:](self, "_progressForItem:usingProgressMap:", a3, self->_uploadProgressPerItemIDs);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0CB30E0];
    if ((objc_msgSend(v3, "fp_isOfFileOperationKind:", *MEMORY[0x1E0CB30E0]) & 1) == 0)
    {
      objc_msgSend(v4, "fp_fileOperationKind");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      fp_simulate_crash(CFSTR("[Progress] Progress kind %@ should be \"uploading\" but instead it's \"%@\"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v4);

      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[FPProgressManager uploadProgressForItem:].cold.1(v4);

      objc_msgSend(v4, "fp_setFileOperationKind:", v5);
    }
  }
  return v4;
}

- (void)_resolveURLForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_7;
  objc_msgSend(v6, "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "startAccessingSecurityScopedResource");
  v11 = objc_msgSend(v9, "fp_checkSandboxFileMetadataRead");
  if (v10)
    objc_msgSend(v9, "stopAccessingSecurityScopedResource");
  if (!v11)
  {

LABEL_7:
    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__FPProgressManager__resolveURLForItem_completionHandler___block_invoke;
    v12[3] = &unk_1E444ABC0;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v9, "fetchURLForItem:creatingPlaceholderIfMissing:completionHandler:", v6, 1, v12);

    goto LABEL_8;
  }
  (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v9, 0);
LABEL_8:

}

void __58__FPProgressManager__resolveURLForItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FPProgressManager__resolveURLForItem_completionHandler___block_invoke_2;
  block[3] = &unk_1E444AB98;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __58__FPProgressManager__resolveURLForItem_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_progressForItem:(id)a3 usingProgressMap:(id)a4
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v15;
  FPProgressManager *v16;
  id v17;
  uint64_t *v18;
  SEL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke;
  block[3] = &unk_1E444AC60;
  v15 = v8;
  v16 = self;
  v17 = v7;
  v18 = &v20;
  v19 = a2;
  v10 = v7;
  v11 = v8;
  dispatch_sync(queue, block);
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t section;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  _FPParentProgress *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v4 = v2 == v3;
  section = __fp_create_section();
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v28 = CFSTR("download");
    v29 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    if (v2 == v3)
      v28 = CFSTR("upload");
    v39 = section;
    v40 = 2112;
    v41 = v28;
    v42 = 2112;
    v43 = v29;
    _os_log_debug_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx [Progress] looking up for %@ progress of %@", buf, 0x20u);
  }

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = a1 + 56;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;

  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v13 && (objc_msgSend(v13, "isCancelled") & 1) == 0)
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_cold_1(v10, v27);
  }
  else
  {
    v14 = (id *)MEMORY[0x1E0CB30E0];
    if (v2 != v3)
      v14 = (id *)MEMORY[0x1E0CB30B8];
    v15 = *v14;
    v16 = objc_alloc_init(_FPParentProgress);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTotalUnitCount:", -1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fp_setFileOperationKind:", v15);
    v19 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 48), "itemID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, v21);

    v23 = *(void **)(a1 + 40);
    v22 = *(void **)(a1 + 48);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_43;
    v30[3] = &unk_1E444AC38;
    v30[4] = v23;
    v35 = section;
    v24 = v22;
    v25 = *(_QWORD *)(a1 + 56);
    v36 = *(_QWORD *)(a1 + 64);
    v31 = v24;
    v34 = v25;
    v26 = *(id *)(a1 + 32);
    v37 = v4;
    v32 = v26;
    v33 = v15;
    v27 = v15;
    objc_msgSend(v23, "_resolveURLForItem:completionHandler:", v24, v30);

  }
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  _BYTE *v45;
  uint64_t v46;
  id v47[2];
  id location;
  uint64_t v49;
  uint8_t v50[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  v49 = *(_QWORD *)(a1 + 72);
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "fp_shortDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v49;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v33;
    *(_WORD *)&buf[22] = 2112;
    v59 = v34;
    _os_log_debug_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx [Progress] got url %@, creating child progress for %@", buf, 0x20u);

  }
  if (v6)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "fp_prettyDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_43_cold_3(v9, v10, buf, v8);
    }
  }
  else if (v5)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v12 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v11, "isEqual:", v14);

    if ((v11 & 1) != 0)
    {
      v8 = objc_opt_new();
      location = 0;
      objc_initWeak(&location, *(id *)(a1 + 32));
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v59 = __Block_byref_object_copy__0;
      v60 = __Block_byref_object_dispose__0;
      v43[0] = MEMORY[0x1E0C809B0];
      v61 = 0;
      v43[2] = __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_50;
      v43[3] = &unk_1E444AC10;
      v43[1] = 3221225472;
      objc_copyWeak(v47, &location);
      v15 = *(_QWORD *)(a1 + 64);
      v45 = buf;
      v46 = v15;
      v16 = *(id *)(a1 + 40);
      v17 = *(void **)(a1 + 72);
      v44 = v16;
      v47[1] = v17;
      -[NSObject setProgressDidSetupHandler:](v8, "setProgressDidSetupHandler:", v43);
      if (*(_BYTE *)(a1 + 88))
        v18 = 0;
      else
        v18 = objc_msgSend(*(id *)(a1 + 40), "isExternalDownloadPlaceholder");
      -[NSObject startTrackingFileURL:kind:allowReadPausedProgressFromDisk:](v8, "startTrackingFileURL:kind:allowReadPausedProgressFromDisk:", v5, *(_QWORD *)(a1 + 56), v18);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setProgressProxy:", v8);
      v35 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v35)
      {
        v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 40), "documentSize");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "fp_addChildProgress:withUnitCount:", v35, v37);

        v42 = *(_QWORD *)(a1 + 72);
        fp_current_or_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v39 = *(_QWORD *)(a1 + 40);
          v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          v41 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v50 = 134218754;
          v51 = v42;
          v52 = 2112;
          v53 = v39;
          v54 = 2112;
          v55 = v40;
          v56 = 2112;
          v57 = v41;
          _os_log_debug_impl(&dword_1A0A34000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx [Progress] Added child progress for %@: %@, child %@", v50, 0x2Au);
        }

        __fp_leave_section_Debug((uint64_t)&v42);
      }

      objc_destroyWeak(v47);
      _Block_object_dispose(buf, 8);

      objc_destroyWeak(&location);
    }
    else
    {
      fp_current_or_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_43_cold_2(v8, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  else
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_43_cold_1(v8, v19, v20, v21, v22, v23, v24, v25);
  }

  __fp_leave_section_Debug((uint64_t)&v49);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_50(uint64_t a1, void *a2, int a3)
{
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    if (a3)
    {
      dispatch_assert_queue_V2(WeakRetained[1]);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_2;
      v12[3] = &unk_1E444ABE8;
      v15 = *(_QWORD *)(a1 + 48);
      v13 = v6;
      v10 = *(id *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 64);
      v14 = v10;
      v16 = v11;
      dispatch_async(v9, v12);

    }
  }

}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "documentSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fp_addChildProgress:withUnitCount:", v3, v4);

  v9 = *(_QWORD *)(a1 + 56);
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v11 = v9;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_debug_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx [Progress] Added child progress for %@: %@, child %@", buf, 0x2Au);
  }

  __fp_leave_section_Debug((uint64_t)&v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copyProgressPerItemIDs, 0);
  objc_storeStrong((id *)&self->_uploadProgressPerItemIDs, 0);
  objc_storeStrong((id *)&self->_downloadProgressPerItemIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)downloadProgressForItem:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_fileOperationKind");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_33(&dword_1A0A34000, v2, v3, "[SIMCRASH] [Progress] Progress kind %@ should be \"downloading\" but instead it's \"%@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)uploadProgressForItem:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_fileOperationKind");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_33(&dword_1A0A34000, v2, v3, "[SIMCRASH] [Progress] Progress kind %@ should be \"uploading\" but instead it's \"%@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] [Progress] found existing progress %@", (uint8_t *)&v3, 0xCu);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_43_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] [Progress] can't create child children because URL is required; parent progress will remain indeterminate th"
    "roughout the transfer",
    a5,
    a6,
    a7,
    a8,
    0);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_43_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] [Progress] URL was fetched for a different progress no need to attach children", a5, a6, a7, a8, 0);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_43_cold_3(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] [Progress] can't retrieve URL for %@; %@",
    buf,
    0x16u);

}

@end
