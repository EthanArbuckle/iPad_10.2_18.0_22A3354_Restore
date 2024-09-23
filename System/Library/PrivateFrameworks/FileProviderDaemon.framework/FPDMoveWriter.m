@implementation FPDMoveWriter

+ (id)acquireDownloadSlotForItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "providerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)_globalDownloadSlotsByProvider_0;
  objc_sync_enter(v5);
  objc_msgSend((id)_globalDownloadSlotsByProvider_0, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = dispatch_semaphore_create(256);
    objc_msgSend((id)_globalDownloadSlotsByProvider_0, "setObject:forKeyedSubscript:", v6, v4);
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
  v3 = (id)_globalDownloadSlotsByProvider_0;
  objc_sync_enter(v3);
  objc_msgSend((id)_globalDownloadSlotsByProvider_0, "objectForKeyedSubscript:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ semaphore should still exists"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("+[FPDMoveWriter releaseDownloadSlot:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 104, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  }
  dispatch_semaphore_signal(v4);

}

+ (void)initialize
{
  if (initialize_once_0 != -1)
    dispatch_once(&initialize_once_0, &__block_literal_global_22);
}

void __27__FPDMoveWriter_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_globalDownloadSlotsByProvider_0;
  _globalDownloadSlotsByProvider_0 = v0;

}

- (FPDMoveWriter)initWithOperation:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  FPDMoveWriter *v8;
  FPDMoveWriter *v9;
  uint64_t v10;
  FPMoveInfo *info;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *asyncQueue;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  NSMutableArray *sourceFoldersStack;
  uint64_t v22;
  NSMutableArray *destinationFoldersStack;
  uint64_t v24;
  NSMutableDictionary *errorsByRoot;
  uint64_t v26;
  NSMutableDictionary *progressByRoot;
  FPDCoordinator *v28;
  id WeakRetained;
  void *v30;
  uint64_t v31;
  FPDCoordinator *coordinator;
  FPDCoordinator *v33;
  id v34;
  void *v35;
  uint64_t v36;
  FPDCoordinator *preemptiveDownloadCoordinator;
  uint64_t section;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  FPDMoveWriterToProvider *v43;
  FPDMoveWriterExecutor *providerWriter;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  FPDMoveWriter *v56;
  uint64_t v57;
  NSArray *accessTokens;
  _QWORD v60[4];
  FPDMoveWriter *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v66.receiver = self;
  v66.super_class = (Class)FPDMoveWriter;
  v8 = -[FPDMoveWriter init](&v66, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_operation, v6);
    objc_msgSend(v6, "info");
    v10 = objc_claimAutoreleasedReturnValue();
    info = v9->_info;
    v9->_info = (FPMoveInfo *)v10;

    objc_storeWeak((id *)&v9->_moveQueue, v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, (dispatch_qos_class_t)-[FPMoveInfo qos](v9->_info, "qos"), 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("FileProvider.move-writer.async", v13);
    asyncQueue = v9->_asyncQueue;
    v9->_asyncQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, (dispatch_qos_class_t)-[FPMoveInfo qos](v9->_info, "qos"), 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("FileProvider.move-writer", v17);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v18;

    v20 = objc_opt_new();
    sourceFoldersStack = v9->_sourceFoldersStack;
    v9->_sourceFoldersStack = (NSMutableArray *)v20;

    v22 = objc_opt_new();
    destinationFoldersStack = v9->_destinationFoldersStack;
    v9->_destinationFoldersStack = (NSMutableArray *)v22;

    v24 = objc_opt_new();
    errorsByRoot = v9->_errorsByRoot;
    v9->_errorsByRoot = (NSMutableDictionary *)v24;

    v26 = objc_opt_new();
    progressByRoot = v9->_progressByRoot;
    v9->_progressByRoot = (NSMutableDictionary *)v26;

    v9->_originalBouncePolicy = -[FPMoveInfo shouldBounce](v9->_info, "shouldBounce");
    v9->_depth = 0;
    v28 = [FPDCoordinator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v9->_operation);
    objc_msgSend(WeakRetained, "manager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[FPDCoordinator initWithExtensionManager:callbackQueue:](v28, "initWithExtensionManager:callbackQueue:", v30, v9->_queue);
    coordinator = v9->_coordinator;
    v9->_coordinator = (FPDCoordinator *)v31;

    v33 = [FPDCoordinator alloc];
    v34 = objc_loadWeakRetained((id *)&v9->_operation);
    objc_msgSend(v34, "manager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[FPDCoordinator initWithExtensionManager:callbackQueue:](v33, "initWithExtensionManager:callbackQueue:", v35, v9->_queue);
    preemptiveDownloadCoordinator = v9->_preemptiveDownloadCoordinator;
    v9->_preemptiveDownloadCoordinator = (FPDCoordinator *)v36;

    section = __fp_create_section();
    fp_current_or_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[FPDMoveWriter initWithOperation:queue:].cold.1();

    v9->_logSection = section;
    objc_msgSend(v6, "info");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "targetFolder");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isProviderItem");

    if (v42)
    {
      v43 = -[FPDMoveWriterToProvider initWithWriter:]([FPDMoveWriterToProvider alloc], "initWithWriter:", v9);
      providerWriter = v9->_providerWriter;
      v9->_providerWriter = (FPDMoveWriterExecutor *)v43;

    }
    if (-[FPMoveInfo _t_clearItemURLs](v9->_info, "_t_clearItemURLs"))
    {
      -[FPMoveInfo targetFolder](v9->_info, "targetFolder");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "asFPItem");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFileURL:", 0);

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      -[FPMoveInfo roots](v9->_info, "roots");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v63;
        do
        {
          v51 = 0;
          do
          {
            if (*(_QWORD *)v63 != v50)
              objc_enumerationMutation(v47);
            objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v51), "asFPItem");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setFileURL:", 0);

            ++v51;
          }
          while (v49 != v51);
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        }
        while (v49);
      }

    }
    -[FPMoveInfo roots](v9->_info, "roots");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPMoveInfo targetFolder](v9->_info, "targetFolder");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "arrayByAddingObject:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __41__FPDMoveWriter_initWithOperation_queue___block_invoke;
    v60[3] = &unk_1E8C78D30;
    v56 = v9;
    v61 = v56;
    objc_msgSend(v55, "fp_map:", v60);
    v57 = objc_claimAutoreleasedReturnValue();
    accessTokens = v56->_accessTokens;
    v56->_accessTokens = (NSArray *)v57;

  }
  return v9;
}

id __41__FPDMoveWriter_initWithOperation_queue___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 160);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotateWithPersonaSandboxIfNeeded:", v5);

  objc_msgSend(v3, "startAccessingLocator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_performCopyOrMoveOfItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *errorsByRoot;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  _QWORD v43[5];
  id v44;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFolder");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ unexpected folder"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDMoveWriter _performCopyOrMoveOfItem:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 171, (const char *)objc_msgSend(objc_retainAutorelease(v33), "UTF8String"));
  }
  v10 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke;
  v43[3] = &unk_1E8C78D58;
  v43[4] = self;
  v11 = v7;
  v44 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17D1C84](v43);
  errorsByRoot = self->_errorsByRoot;
  objc_msgSend(v6, "root");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](errorsByRoot, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDMoveWriter _handleCompletionOfAtom:source:result:error:](self, "_handleCompletionOfAtom:source:result:error:", v6, v16, 0, v15);

    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v15);
  }
  else
  {
    v17 = -[FPMoveInfo byCopy](self->_info, "byCopy");
    objc_msgSend(v6, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v17)
    {
      objc_msgSend(v18, "parentIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "targetFolder");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isEqual:", v25))
      {
        objc_msgSend(v6, "targetName");
        v35 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "source");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "filename");
        v39 = v23;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v26, "isEqualToString:", v28);

        if (v37)
        {
          objc_msgSend(v6, "source");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v29, 0);

          goto LABEL_11;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "source");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "targetFolder");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "targetName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDMoveWriter performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:](self, "performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:", v30, v31, v32, objc_msgSend(v6, "materializeOption"), objc_msgSend(v6, "targetMaterializeOption"), objc_msgSend(v6, "useDiskWriter"), v12);

      goto LABEL_11;
    }
    objc_msgSend(v6, "targetFolder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v6, "materializeOption");
    v36 = objc_msgSend(v6, "targetMaterializeOption");
    v22 = objc_msgSend(v6, "useDiskWriter");
    v40[0] = v10;
    v40[1] = 3221225472;
    v40[2] = __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_3;
    v40[3] = &unk_1E8C78C98;
    v40[4] = self;
    v41 = v6;
    v42 = v12;
    -[FPDMoveWriter performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:](self, "performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:", v19, v20, v21, v38, v36, v22, v40);

  }
LABEL_11:

}

void __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_2;
  block[3] = &unk_1E8C78BD0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 112);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_4;
  block[3] = &unk_1E8C78CC0;
  block[4] = v7;
  v14 = v8;
  v15 = v5;
  v10 = *(id *)(a1 + 48);
  v16 = v6;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

uint64_t __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleCreationForAtom:result:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_handleItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__FPDMoveWriter__handleItem_completion___block_invoke;
  v10[3] = &unk_1E8C78C98;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[FPDMoveWriter _performCopyOrMoveOfItem:completion:](self, "_performCopyOrMoveOfItem:completion:", v9, v10);

}

uint64_t __40__FPDMoveWriter__handleItem_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(NSObject **)(a1[4] + 112);
  v6 = a3;
  v7 = a2;
  dispatch_assert_queue_V2(v5);
  v8 = (void *)a1[4];
  v9 = (void *)a1[5];
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_handleCompletionOfAtom:source:result:error:", v9, v10, v7, v6);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_performCopyOrMoveOfFolder:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *errorsByRoot;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__FPDMoveWriter__performCopyOrMoveOfFolder_completion___block_invoke;
  v22[3] = &unk_1E8C78D58;
  v22[4] = self;
  v8 = v7;
  v23 = v8;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17D1C84](v22);
  errorsByRoot = self->_errorsByRoot;
  objc_msgSend(v6, "root");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](errorsByRoot, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDMoveWriter _handleCompletionOfAtom:source:result:error:](self, "_handleCompletionOfAtom:source:result:error:", v6, v13, 0, v12);

    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v12);
  }
  else
  {
    v14 = -[FPMoveInfo byCopy](self->_info, "byCopy");
    objc_msgSend(v6, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetFolder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[FPDMoveWriter performCreateFolder:inside:as:useDiskWriter:completion:](self, "performCreateFolder:inside:as:useDiskWriter:completion:", v15, v16, v17, objc_msgSend(v6, "useDiskWriter"), v9);
    }
    else
    {
      v21 = objc_msgSend(v6, "materializeOption");
      v18 = objc_msgSend(v6, "targetMaterializeOption");
      v19 = objc_msgSend(v6, "useAtomicMove");
      LOBYTE(v20) = objc_msgSend(v6, "useDiskWriter");
      -[FPDMoveWriter performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:](self, "performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:", v15, v16, v17, v21, v18, v19, v20, v9);
    }

  }
}

void __55__FPDMoveWriter__performCopyOrMoveOfFolder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FPDMoveWriter__performCopyOrMoveOfFolder_completion___block_invoke_2;
  block[3] = &unk_1E8C78BD0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __55__FPDMoveWriter__performCopyOrMoveOfFolder_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_handleFolder:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFolder");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ expected a folder"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDMoveWriter _handleFolder:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 266, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__FPDMoveWriter__handleFolder_completion___block_invoke;
  v14[3] = &unk_1E8C78C98;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  -[FPDMoveWriter _performCopyOrMoveOfFolder:completion:](self, "_performCopyOrMoveOfFolder:completion:", v11, v14);

}

void __42__FPDMoveWriter__handleFolder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 112));
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v17 = 138412802;
    v18 = v16;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: atom done %@: %@, error=%@", (uint8_t *)&v17, 0x20u);
  }

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 48);
  if (v5)
  {
    objc_msgSend(*(id *)(v10 + 48), "addObject:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  v13 = *(void **)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  objc_msgSend(v14, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_handleCompletionOfAtom:source:result:error:", v14, v15, v5, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_handleCompletionOfAtom:(id)a3 source:(id)a4 result:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  FPMoveInfo *info;
  id WeakRetained;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v25;
  int v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  unint64_t v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  id v31;

  v31 = a4;
  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  v13 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDMoveWriter _unblockWaiterForSourceID:withResult:error:](self, "_unblockWaiterForSourceID:withResult:error:", v15, v10, v11);

  objc_msgSend(v13, "root");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "kind");
  info = self->_info;
  WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  objc_msgSend(WeakRetained, "manager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v13, "shouldAccountForDownloadOfSourceItemForMoveInfo:extensionManager:", info, v20);

  v22 = objc_msgSend(v13, "useAtomicMove");
  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_errorsByRoot, "objectForKeyedSubscript:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_errorsByRoot, "setObject:forKeyedSubscript:", v11, v16);
  }
  if (v17 != 1)
  {
    -[FPDMoveWriter itemCompletionBlock](self, "itemCompletionBlock");
    v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id, uint64_t))v24)[2](v24, v16, v31, v21);

  }
  -[FPMoveInfo roots](self->_info, "roots");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "containsObject:", v31);

  if (v26)
  {
    if (v10)
    {
      -[FPDMoveWriter rootCreatedBlock](self, "rootCreatedBlock");
      v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v27)[2](v27, v16, v10);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_errorsByRoot, "objectForKeyedSubscript:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (-[FPMoveInfo byMoving](self->_info, "byMoving")
        && ((objc_msgSend(v31, "isExternalURL") ^ 1 | v22) & 1) == 0)
      {
        -[FPDMoveWriter _removeRoot:](self, "_removeRoot:", v16);
      }
      if (v17 == 1)
      {
        v29 = self->_depth - 1;
        self->_depth = v29;
        if (!v29)
          -[FPMoveInfo setShouldBounce:](self->_info, "setShouldBounce:", self->_originalBouncePolicy);
      }
      -[FPDMoveWriter rootCompletionBlock](self, "rootCompletionBlock");
      v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v30)[2](v30, v16, v28);

    }
    else
    {
      ++self->_depth;
      -[FPMoveInfo setShouldBounce:](self->_info, "setShouldBounce:", 1);
    }

  }
}

- (void)handleCreationForAtom:(id)a3 result:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *progressByRoot;
  void *v13;
  NSObservation *importProgressObservation;
  id v15;

  v15 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v15, "root");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPMoveInfo roots](self->_info, "roots");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    if (v6)
    {
      -[FPDMoveWriter rootCreatedBlock](self, "rootCreatedBlock");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v11)[2](v11, v7, v6);

    }
    progressByRoot = self->_progressByRoot;
    objc_msgSend(v15, "root");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](progressByRoot, "removeObjectForKey:", v13);

  }
  -[NSObservation finishObserving](self->_importProgressObservation, "finishObserving");
  importProgressObservation = self->_importProgressObservation;
  self->_importProgressObservation = 0;

}

- (void)_handlePostFolder:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[NSMutableArray count](self->_sourceFoldersStack, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _sourceFoldersStack - no folder to pop"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDMoveWriter _handlePostFolder:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 373, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  }
  if (!-[NSMutableArray count](self->_destinationFoldersStack, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _destinationFoldersStack - no folder to pop"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDMoveWriter _handlePostFolder:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 374, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  }
  -[NSMutableArray lastObject](self->_sourceFoldersStack, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDMoveWriter _handleCompletionOfAtom:source:result:error:](self, "_handleCompletionOfAtom:source:result:error:", v12, v7, 0, 0);
  -[NSMutableArray removeLastObject](self->_sourceFoldersStack, "removeLastObject");
  -[NSMutableArray removeLastObject](self->_destinationFoldersStack, "removeLastObject");
  v6[2](v6);

}

- (void)handleAtom:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  FPDMoveWriter *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __39__FPDMoveWriter_handleAtom_completion___block_invoke;
  v14 = &unk_1E8C75698;
  v15 = self;
  v16 = v7;
  v8 = v7;
  v9 = (void *)MEMORY[0x1D17D1C84](&v11);
  v10 = objc_msgSend(v6, "kind", v11, v12, v13, v14, v15);
  if (v10)
  {
    if (v10 == 1)
    {
      -[FPDMoveWriter _handlePostFolder:completion:](self, "_handlePostFolder:completion:", v6, v9);
    }
    else if (v10 == 2)
    {
      -[FPDMoveWriter _handleItem:completion:](self, "_handleItem:completion:", v6, v9);
    }
  }
  else
  {
    -[FPDMoveWriter _handleFolder:completion:](self, "_handleFolder:completion:", v6, v9);
  }

}

uint64_t __39__FPDMoveWriter_handleAtom_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "stopAccessingAllURLs");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_step
{
  id WeakRetained;
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  FPDMoveWriter *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_asyncQueue);
  if (!self->_cancelled)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    WeakRetained = objc_loadWeakRetained((id *)&self->_moveQueue);
    objc_msgSend(WeakRetained, "dequeue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __22__FPDMoveWriter__step__block_invoke;
    block[3] = &unk_1E8C75850;
    v8 = v4;
    v9 = self;
    v6 = v4;
    dispatch_sync(queue, block);

  }
}

uint64_t __22__FPDMoveWriter__step__block_invoke(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  v2 = (uint64_t *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_finishWithError:", 0);
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __22__FPDMoveWriter__step__block_invoke_cold_1(v2, v3, v4);

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __22__FPDMoveWriter__step__block_invoke_20;
  v8[3] = &unk_1E8C75E48;
  v8[4] = v5;
  return objc_msgSend(v5, "handleAtom:completion:", v6, v8);
}

void __22__FPDMoveWriter__step__block_invoke_20(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__FPDMoveWriter__step__block_invoke_2;
  block[3] = &unk_1E8C75E48;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __22__FPDMoveWriter__step__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_step");
}

- (void)start
{
  NSObject *asyncQueue;
  _QWORD block[5];

  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__FPDMoveWriter_start__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(asyncQueue, block);
}

uint64_t __22__FPDMoveWriter_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_step");
}

- (void)_finishWithError:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (**waiterBlock)(id, _QWORD, id);
  id v21;
  id waitedOnID;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_cancelled)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[FPDMoveWriter _finishWithError:].cold.2(v5);
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[FPDMoveWriter _finishWithError:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    -[FPDCoordinator stopAccessingAllURLs](self->_coordinator, "stopAccessingAllURLs");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = self->_accessTokens;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v19++), "stopAccessing", (_QWORD)v25);
        }
        while (v17 != v19);
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    -[FPDCoordinator stopAccessingAllURLs](self->_preemptiveDownloadCoordinator, "stopAccessingAllURLs");
    waiterBlock = (void (**)(id, _QWORD, id))self->_waiterBlock;
    if (waiterBlock)
    {
      waiterBlock[2](waiterBlock, 0, v5);
      v21 = self->_waiterBlock;
    }
    else
    {
      v21 = 0;
    }
    self->_waiterBlock = 0;

    waitedOnID = self->_waitedOnID;
    self->_waitedOnID = 0;

    self->_cancelled = 1;
    objc_storeStrong((id *)&self->_error, a3);
    -[FPDMoveWriter completionBlock](self, "completionBlock");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
    {
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v5);
      -[FPDMoveWriter setCompletionBlock:](self, "setCompletionBlock:", 0);
    }

  }
}

- (void)failWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FPDMoveWriter_failWithError___block_invoke;
  block[3] = &unk_1E8C75850;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __31__FPDMoveWriter_failWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
}

- (void)cancelRoot:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__FPDMoveWriter_cancelRoot___block_invoke;
  block[3] = &unk_1E8C75850;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __28__FPDMoveWriter_cancelRoot___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__FPDMoveWriter_cancel__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __23__FPDMoveWriter_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_finishWithError:", v2);

}

- (void)setProgress:(id)a3 forRoot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  NSObservation *v13;
  NSObservation *importProgressObservation;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[FPMoveInfo roots](self->_info, "roots");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_progressByRoot, "setObject:forKeyedSubscript:", v6, v7);
    -[FPDMoveWriter itemCopyProgressBlock](self, "itemCopyProgressBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v6, "fractionCompleted");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__FPDMoveWriter_setProgress_forRoot___block_invoke;
    v15[3] = &unk_1E8C78D80;
    v16 = v6;
    v19 = v20;
    v12 = v10;
    v18 = v12;
    v17 = v7;
    objc_msgSend(v11, "addObserverBlock:", v15);
    v13 = (NSObservation *)objc_claimAutoreleasedReturnValue();
    importProgressObservation = self->_importProgressObservation;
    self->_importProgressObservation = v13;

    _Block_object_dispose(v20, 8);
  }

}

uint64_t __37__FPDMoveWriter_setProgress_forRoot___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "completedUnitCount");
  if (result != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "completedUnitCount");
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return result;
}

- (void)_unblockWaiterForSourceID:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  id waiterBlock;
  id waitedOnID;
  id v13;

  v13 = a4;
  v8 = a5;
  queue = self->_queue;
  v10 = a3;
  dispatch_assert_queue_V2(queue);
  LODWORD(queue) = objc_msgSend(self->_waitedOnID, "isEqual:", v10);

  if ((_DWORD)queue)
  {
    (*((void (**)(void))self->_waiterBlock + 2))();
    waiterBlock = self->_waiterBlock;
    self->_waiterBlock = 0;

    waitedOnID = self->_waitedOnID;
    self->_waitedOnID = 0;

  }
}

- (id)waitForResultOfSourceID:(id)a3 root:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  NSObject *queue;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  SEL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v9 = a3;
  v10 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__15;
  v35 = __Block_byref_object_dispose__15;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15;
  v29 = __Block_byref_object_dispose__15;
  v30 = 0;
  v11 = dispatch_semaphore_create(0);
  queue = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__FPDMoveWriter_waitForResultOfSourceID_root_error___block_invoke;
  v18[3] = &unk_1E8C78DD0;
  v18[4] = self;
  v24 = a2;
  v13 = v9;
  v19 = v13;
  v22 = &v31;
  v14 = v11;
  v20 = v14;
  v15 = v10;
  v21 = v15;
  v23 = &v25;
  dispatch_sync(queue, v18);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v26[5]);
  v16 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __52__FPDMoveWriter_waitForResultOfSourceID_root_error___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id location;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  location = 0;
  v2 = (uint64_t *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *v2;
  if (*(_QWORD *)(*v2 + 80))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ cannot have more than 1 waiter"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDMoveWriter waitForResultOfSourceID:root:error:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 547, (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(id *)(v3 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v8), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectAtIndexedSubscript:", v6 + v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectAtIndexedSubscript:", v6 + v8);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v21 = *(void **)(v20 + 40);
            *(_QWORD *)(v20 + 40) = v19;

            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
            goto LABEL_16;
          }
        }
        else
        {

        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      v6 += v8;
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__FPDMoveWriter_waitForResultOfSourceID_root_error___block_invoke_2;
    v26[3] = &unk_1E8C78DA8;
    objc_copyWeak(&v29, &location);
    v28 = *(_OWORD *)(a1 + 64);
    v27 = *(id *)(a1 + 48);
    v22 = MEMORY[0x1D17D1C84](v26);
    v23 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = v22;

    objc_destroyWeak(&v29);
  }
LABEL_16:
  objc_destroyWeak(&location);
}

void __52__FPDMoveWriter_waitForResultOfSourceID_root_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  dispatch_queue_t *WeakRetained;

  v5 = a2;
  v6 = a3;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 56));
  dispatch_assert_queue_V2(WeakRetained[14]);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)startDownloadOfItem:(id)a3 shouldMaterializeRecursively:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  FPDCoordinator *preemptiveDownloadCoordinator;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  FPDMoveWriter *v20;
  id v21;
  NSObject *v22;
  id v23;
  BOOL v24;

  v8 = a3;
  v9 = a5;
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FPDMoveWriter startDownloadOfItem:shouldMaterializeRecursively:completionHandler:].cold.1();

  objc_msgSend((id)objc_opt_class(), "acquireDownloadSlotForItem:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  preemptiveDownloadCoordinator = self->_preemptiveDownloadCoordinator;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke;
  v18[3] = &unk_1E8C78BF8;
  v19 = v8;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v23 = v9;
  v24 = a4;
  v14 = v9;
  v15 = v12;
  v16 = v11;
  v17 = v8;
  -[FPDCoordinator resolveItem:completion:](preemptiveDownloadCoordinator, "resolveItem:completion:", v17, v18);
  dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD **)(a1 + 40);
    v8 = (void *)v7[4];
    v9 = *(unsigned __int8 *)(a1 + 72);
    objc_msgSend(v7, "operation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_32;
    v17[3] = &unk_1E8C78DF8;
    v12 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v12;
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 64);
    objc_msgSend(v8, "coordinateAtURL:recursively:request:handler:", v5, v9, v11, v17);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  else
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_cold_1(a1, v6, v13);

    objc_msgSend((id)objc_opt_class(), "releaseDownloadSlot:", *(_QWORD *)(a1 + 48));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
    {
      if (v6)
      {
        (*(void (**)(_QWORD, id))(v14 + 16))(*(_QWORD *)(a1 + 64), v6);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        FPItemNotFoundError();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);

      }
    }
  }

}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_32(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "releaseDownloadSlot:", *(_QWORD *)(a1 + 40));
  v7[2](v7);

  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_32_cold_2(a1, v6, v9);

    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_32_cold_1(a1, v9, v10);

  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);

}

- (void)_removeRoot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isFolder"))
  {
    -[FPDMoveWriter coordinator](self, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startAccessingURLForAtomDuration:", v6);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = objc_msgSend(v7, "removeItemAtURL:error:", v8, &v12);
    v10 = v12;

    if ((v9 & 1) == 0)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FPDMoveWriter _removeRoot:].cold.1(v10);

    }
  }
  else
  {
    v10 = 0;
  }

}

- (void)dumpStateTo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  FPDMoveWriter *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__FPDMoveWriter_dumpStateTo___block_invoke;
  block[3] = &unk_1E8C75850;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __29__FPDMoveWriter_dumpStateTo___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("+ writer\n"));
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 88))
  {
    objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("  cancelled\n"));
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)(v2 + 96))
  {
    objc_msgSend(*(id *)(a1 + 32), "startFgColor:", 1);
    objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("  error: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
    objc_msgSend(*(id *)(a1 + 32), "reset");
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)(v2 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "startAttributes:", 2);
    objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("  waiter on: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
    objc_msgSend(*(id *)(a1 + 32), "reset");
    v2 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("  folder stack (origin): %@\n"), *(_QWORD *)(v2 + 40));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("  folder stack (destination): %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "startFgColor:", 1);
    objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("  errors by root: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }
  return objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("\n"));
}

- (id)defaultExecutor
{
  FPDMoveWriterExecutor *providerWriter;

  providerWriter = self->_providerWriter;
  if (providerWriter)
    return providerWriter;
  -[FPDMoveWriter diskWriter](self, "diskWriter");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FPDMoveWriterExecutor)diskWriter
{
  FPDMoveWriterExecutor *diskWriter;
  FPDMoveWriterToDisk *v4;
  FPDMoveWriterExecutor *v5;

  diskWriter = self->_diskWriter;
  if (!diskWriter)
  {
    v4 = -[FPDMoveWriterToDisk initWithWriter:]([FPDMoveWriterToDisk alloc], "initWithWriter:", self);
    v5 = self->_diskWriter;
    self->_diskWriter = (FPDMoveWriterExecutor *)v4;

    diskWriter = self->_diskWriter;
  }
  return diskWriter;
}

- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[FPDMoveWriter defaultExecutor](self, "defaultExecutor");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:", v17, v16, v15, a6, a7, v14);

}

- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 useDiskWriter:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;

  v9 = a8;
  v16 = a9;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  if (v9)
  {
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[FPDMoveWriter performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:].cold.1(self, v20);

    -[FPDMoveWriter diskWriter](self, "diskWriter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:", v19, v18, v17, a6, a7, v16);

  }
  else
  {
    -[FPDMoveWriter defaultExecutor](self, "defaultExecutor");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:", v19, v18, v17, a6, a7, v16);

  }
}

- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 useDiskWriter:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v9 = a8;
  v16 = a9;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  fp_current_or_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v21)
      -[FPDMoveWriter performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:].cold.1(self, v20);

    -[FPDMoveWriter diskWriter](self, "diskWriter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v21)
      -[FPDMoveWriter performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:].cold.2(v20, v22, v23, v24, v25, v26, v27, v28);

    -[FPDMoveWriter defaultExecutor](self, "defaultExecutor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;
  objc_msgSend(v29, "performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:", v19, v18, v17, a6, a7, v16);

}

- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 useDiskWriter:(BOOL)a9 completion:(id)a10
{
  _BOOL8 v10;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v10 = a8;
  v17 = a10;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (a9)
  {
    if (v22)
      -[FPDMoveWriter performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:].cold.1(self, v21);

    -[FPDMoveWriter diskWriter](self, "diskWriter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v22)
      -[FPDMoveWriter performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:].cold.2(v10, v21, v23);

    -[FPDMoveWriter defaultExecutor](self, "defaultExecutor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  objc_msgSend(v24, "performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:completion:", v20, v19, v18, a6, a7, v10, v17);

}

- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 useDiskWriter:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v17)
      -[FPDMoveWriter performCreateFolder:inside:as:useDiskWriter:completion:].cold.1(self, v16);

    -[FPDMoveWriter diskWriter](self, "diskWriter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v17)
      -[FPDMoveWriter performCreateFolder:inside:as:useDiskWriter:completion:].cold.2(v16, v18, v19, v20, v21, v22, v23, v24);

    -[FPDMoveWriter defaultExecutor](self, "defaultExecutor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;
  objc_msgSend(v25, "performCreateFolder:inside:as:completion:", v15, v14, v13, v12);

}

- (FPDMoveOperation)operation
{
  return (FPDMoveOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (id)itemCopyProgressBlock
{
  return self->_itemCopyProgressBlock;
}

- (void)setItemCopyProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)itemCompletionBlock
{
  return self->_itemCompletionBlock;
}

- (void)setItemCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)rootCreatedBlock
{
  return self->_rootCreatedBlock;
}

- (void)setRootCreatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)rootCompletionBlock
{
  return self->_rootCompletionBlock;
}

- (void)setRootCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setDiskWriter:(id)a3
{
  objc_storeStrong((id *)&self->_diskWriter, a3);
}

- (FPMoveInfo)info
{
  return self->_info;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (FPDCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_diskWriter, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_rootCompletionBlock, 0);
  objc_storeStrong(&self->_rootCreatedBlock, 0);
  objc_storeStrong(&self->_itemCompletionBlock, 0);
  objc_storeStrong(&self->_itemCopyProgressBlock, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_accessTokens, 0);
  objc_storeStrong((id *)&self->_importProgressObservation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_waiterBlock, 0);
  objc_storeStrong(&self->_waitedOnID, 0);
  objc_storeStrong((id *)&self->_progressByRoot, 0);
  objc_storeStrong((id *)&self->_errorsByRoot, 0);
  objc_storeStrong((id *)&self->_destinationFoldersStack, 0);
  objc_storeStrong((id *)&self->_sourceFoldersStack, 0);
  objc_storeStrong((id *)&self->_preemptiveDownloadCoordinator, 0);
  objc_storeStrong((id *)&self->_providerWriter, 0);
  objc_destroyWeak((id *)&self->_moveQueue);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)initWithOperation:queue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] ┣%llx creating move writer", v2);
  OUTLINED_FUNCTION_8_0();
}

void __22__FPDMoveWriter__step__block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, a3, "[DEBUG] move-writer dequeued atom %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)_finishWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] writer: successfully completed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_finishWithError:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] writer: failed with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)startDownloadOfItem:shouldMaterializeRecursively:completionHandler:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v1, (uint64_t)v1, "[DEBUG] move-writer starting download of item %@, shouldMaterializeRecursively %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a3, v5, "[DEBUG] move-writer: cannot resolve item to url %@: %@", v6);

  OUTLINED_FUNCTION_2();
}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_32_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, a3, "[DEBUG] move-writer: finished download of item %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_32_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] move-writer: couldn't download item to url (%@): %@", v5, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)_removeRoot:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] writer: couldn't remove root: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)performCopyOfItem:(void *)a1 to:(NSObject *)a2 as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "diskWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] move-writer in performMoveOfItem, copying file on disk %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)performMoveOfItem:(void *)a1 to:(NSObject *)a2 as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "diskWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] move-writer in performMoveOfItem, moving file to disk %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)performMoveOfItem:(uint64_t)a3 to:(uint64_t)a4 as:(uint64_t)a5 sourceMaterializeOption:(uint64_t)a6 targetMaterializeOption:(uint64_t)a7 useDiskWriter:(uint64_t)a8 completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] move-writer in performMoveOfItem, moving file to provider", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)performMoveOfFolder:(void *)a1 to:(NSObject *)a2 as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "diskWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] move-writer in performMoveOfFolder, moving folder to disk %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)performMoveOfFolder:(uint64_t)a3 to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:.cold.2(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("no");
  if ((a1 & 1) != 0)
    v3 = CFSTR("yes");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, a3, "[DEBUG] move-writer in performMoveOfFolder, moving folder to provider, useAtomicMove %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)performCreateFolder:(void *)a1 inside:(NSObject *)a2 as:useDiskWriter:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "diskWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] move-writer in performCreateFolder, creating folder in disk %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)performCreateFolder:(uint64_t)a3 inside:(uint64_t)a4 as:(uint64_t)a5 useDiskWriter:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] move-writer in performCreateFolder, creating folder in provider", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
