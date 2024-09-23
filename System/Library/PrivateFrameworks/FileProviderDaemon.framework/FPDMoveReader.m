@implementation FPDMoveReader

- (FPDMoveReader)init
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should not call this"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDMoveReader init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveReader.m", 66, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (FPDMoveReader)initWithMoveWriter:(id)a3 operation:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  FPDMoveReader *v11;
  FPDMoveReader *v12;
  uint64_t v13;
  FPMoveInfo *info;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  NSMutableSet *cancelledRoots;
  uint64_t section;
  NSObject *v22;
  dispatch_semaphore_t v23;
  OS_dispatch_semaphore *clientUnblockSema;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)FPDMoveReader;
  v11 = -[FPDMoveReader init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_operation, v9);
    objc_msgSend(v9, "info");
    v13 = objc_claimAutoreleasedReturnValue();
    info = v12->_info;
    v12->_info = (FPMoveInfo *)v13;

    objc_storeWeak((id *)&v12->_moveQueue, v10);
    objc_storeWeak((id *)&v12->_writer, v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, (dispatch_qos_class_t)-[FPMoveInfo qos](v12->_info, "qos"), 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("FileProvider.move-reader", v16);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    v19 = objc_opt_new();
    cancelledRoots = v12->_cancelledRoots;
    v12->_cancelledRoots = (NSMutableSet *)v19;

    section = __fp_create_section();
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[FPDMoveReader initWithMoveWriter:operation:queue:].cold.1();

    v12->_logSection = section;
    if (-[FPMoveInfo _t_clientDrivenReader](v12->_info, "_t_clientDrivenReader"))
    {
      v23 = dispatch_semaphore_create(0);
      clientUnblockSema = v12->_clientUnblockSema;
      v12->_clientUnblockSema = (OS_dispatch_semaphore *)v23;

    }
  }

  return v12;
}

- (void)verifyTargetURL:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  void (**v23)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExternalURL");
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "asURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "asFPItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    v4[2](v4, v9, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    objc_msgSend(WeakRetained, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asFPItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "domainFromItemID:reason:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "defaultBackend");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "asFPItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "itemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __33__FPDMoveReader_verifyTargetURL___block_invoke;
    v22[3] = &unk_1E8C77600;
    v22[4] = self;
    v23 = v4;
    objc_msgSend(v17, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v20, 1, 1, 0, v21, v22);

  }
}

void __33__FPDMoveReader_verifyTargetURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a3, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "targetFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asFPItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFileURL:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "targetFolder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asFPItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAccessingSecurityScopedResource");

    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "targetFolder");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asFPItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v12, 0);

  }
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __22__FPDMoveReader_start__block_invoke;
  v2[3] = &unk_1E8C76768;
  v2[4] = self;
  -[FPDMoveReader verifyTargetURL:](self, "verifyTargetURL:", v2);
}

void __22__FPDMoveReader_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __22__FPDMoveReader_start__block_invoke_cold_1(v6);

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 80);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __22__FPDMoveReader_start__block_invoke_6;
  v11[3] = &unk_1E8C75850;
  v11[4] = v8;
  v12 = v5;
  v10 = v5;
  dispatch_async(v9, v11);

}

uint64_t __22__FPDMoveReader_start__block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __22__FPDMoveReader_start__block_invoke_6_cold_1((uint64_t)&v19, v2, v3, v4, v5, v6, v7, v8);

  v9 = objc_msgSend(*(id *)(a1 + 40), "startAccessingSecurityScopedResource");
  v11 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __22__FPDMoveReader_start__block_invoke_7;
  v15[3] = &unk_1E8C77628;
  v18 = v9;
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 32);
  v16 = v12;
  v17 = v13;
  objc_msgSend(v11, "_progressComputationPreflight:completion:", v12, v15);

  return __fp_leave_section_Debug();
}

uint64_t __22__FPDMoveReader_start__block_invoke_7(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  return objc_msgSend(*(id *)(a1 + 40), "_run");
}

- (BOOL)_isCancelled
{
  FPDMoveReader *v2;
  BOOL cancelled;

  v2 = self;
  objc_sync_enter(v2);
  cancelled = v2->__cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)_finishWithError:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void (**errorBlock)(id, id);

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[FPDMoveReader _isCancelled](self, "_isCancelled"))
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
        -[FPDMoveReader _finishWithError:].cold.1(v5);
    }
    else if (v7)
    {
      -[FPDMoveReader _finishWithError:].cold.2();
    }

    self->__cancelled = 1;
    objc_storeStrong((id *)&self->_error, a3);
    errorBlock = (void (**)(id, id))self->_errorBlock;
    if (v5 && errorBlock)
    {
      errorBlock[2](errorBlock, v5);
      errorBlock = (void (**)(id, id))self->_errorBlock;
    }
    self->_errorBlock = 0;

  }
}

- (id)_iteratorForRoot:(id)a3 enforceFPItem:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  FPDMoveOperation **p_operation;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "isProviderItem"))
  {
    objc_msgSend(v8, "asFPItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    p_operation = &self->_operation;
    WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    objc_msgSend(WeakRetained, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "providerDomainID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "domainWithID:reason:", v14, &v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (objc_msgSend(v15, "isUsingFPFS"))
      {
        +[FPDIterator hybridIteratorForItem:domain:enforceFPItem:](FPDIterator, "hybridIteratorForItem:domain:enforceFPItem:", v9, v15, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = objc_loadWeakRetained((id *)p_operation);
        objc_msgSend(v22, "manager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDIterator iteratorForLocator:manager:](FPDIterator, "iteratorForLocator:manager:", v8, v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "asFPItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setShouldDecorateItems:", objc_msgSend(v24, "isRecursivelyDownloaded") ^ 1);

      }
    }
    else
    {
      if (a5)
      {
        objc_msgSend(v9, "itemID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "providerDomainID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[FPDMoveReader _iteratorForRoot:enforceFPItem:error:].cold.1(v9);

      v16 = 0;
    }

  }
  else
  {
    v17 = objc_loadWeakRetained((id *)&self->_operation);
    objc_msgSend(v17, "manager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDIterator iteratorForLocator:manager:](FPDIterator, "iteratorForLocator:manager:", v8, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)_progressComputationPreflight:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  void *v18;
  NSObject *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  id v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  FPDMoveReader *v34;
  void *v35;
  void *v36;
  void *v37;
  FPDMoveReader *v38;
  FPMoveInfo *info;
  id v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void (**v45)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _BOOL4 willMaterializeTargetFolder;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void (**v56)(_QWORD);
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id *location;
  _BOOL4 v67;
  uint64_t v68;
  uint64_t v69;
  _BOOL4 v70;
  uint64_t v71;
  void *v72;
  _QWORD v73[5];
  void (**v74)(_QWORD);
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  int v92;
  __int16 v93;
  _BOOL4 v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v56 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[FPDMoveReader _progressComputationPreflight:completion:].cold.3();

  self->_startedPreflight = 1;
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isTargetFolderMaterialized = objc_msgSend(v8, "isDownloaded");

  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[FPDMoveReader _fileSizeBitsSupportAtPath:](self, "_fileSizeBitsSupportAtPath:", v9);

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[FPMoveInfo roots](self->_info, "roots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
  if (v11)
  {
    v12 = v11;
    v68 = 0;
    v13 = *(_QWORD *)v80;
    location = (id *)&self->_operation;
    v59 = v6;
    v60 = v10;
    v57 = *(_QWORD *)v80;
LABEL_5:
    v14 = 0;
    v58 = v12;
    while (1)
    {
      if (*(_QWORD *)v80 != v13)
        objc_enumerationMutation(v10);
      v69 = v14;
      v15 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v14);
      if (-[FPDMoveReader _isCancelled](self, "_isCancelled"))
        break;
      if (!self->_isTargetFolderMaterialized && !self->_willMaterializeTargetFolder)
      {
        -[FPMoveInfo targetFolder](self->_info, "targetFolder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained(location);
        objc_msgSend(WeakRetained, "manager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        self->_willMaterializeTargetFolder = objc_msgSend(v16, "willRequireDownloadForSourceItem:extensionManager:", v15, v18);

      }
      if (-[FPDMoveReader _isSingleMoveForRoot:](self, "_isSingleMoveForRoot:", v15))
      {
        fp_current_or_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          willMaterializeTargetFolder = self->_willMaterializeTargetFolder;
          *(_DWORD *)buf = 138412546;
          v84 = v15;
          v85 = 1024;
          LODWORD(v86) = willMaterializeTargetFolder;
          _os_log_debug_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: preflight for root: %@, atomic move, willMaterializeTargetFolder=%{BOOL}d", buf, 0x12u);
        }

        -[FPDMoveReader rootPreflightCompletionBlock](self, "rootPreflightCompletionBlock");
        v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v20[2](v20, v15, 1, 0, 0);
      }
      else
      {
        v78 = 0;
        -[FPDMoveReader _iteratorForRoot:enforceFPItem:error:](self, "_iteratorForRoot:enforceFPItem:error:", v15, 0, &v78);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v78;
        v23 = v22;
        if (!v21)
        {
          -[FPDMoveReader _finishWithError:](self, "_finishWithError:", v22);
          v51 = v56;
          goto LABEL_68;
        }
        v61 = v22;
        v24 = -[FPDMoveReader _shouldCheckFileSystemBitsForRoot:targetFolderURL:](self, "_shouldCheckFileSystemBitsForRoot:targetFolderURL:", v15, v6);
        v70 = -[FPDMoveReader _shouldCheckSpaceForRoot:targetFolderURL:](self, "_shouldCheckSpaceForRoot:targetFolderURL:", v15, v6);
        if ((objc_msgSend(v21, "done") & 1) == 0)
        {
          v62 = 0;
          v25 = 0;
          v71 = 0;
          v26 = 0;
          v27 = v63 > 0 && v24;
          v67 = v27;
          v64 = v15;
          v65 = v21;
          while (1)
          {
            v28 = (void *)MEMORY[0x1D17D1B04]();
            if (-[FPDMoveReader _isCancelled](self, "_isCancelled"))
            {
              v51 = v56;
              v56[2](v56);
              objc_autoreleasePoolPop(v28);
              v6 = v59;
              goto LABEL_67;
            }
            if (-[FPDMoveReader _isRootCancelled:](self, "_isRootCancelled:", v15))
            {
              v26 = 0;
              v71 = 0;
LABEL_46:
              objc_autoreleasePoolPop(v28);
              goto LABEL_47;
            }
            v77 = 0;
            objc_msgSend(v21, "nextWithError:", &v77);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v77;
            if (v67 && objc_msgSend(v29, "size") > v63)
              break;
            if (v29)
              v31 = v70;
            else
              v31 = 0;
            if (v31)
            {
              v68 += objc_msgSend(v29, "size");
            }
            else if (!v29 && v30)
            {
              fp_current_or_default_log();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                -[FPDMoveReader _progressComputationPreflight:completion:].cold.2(v30);

              -[FPDMoveReader _finishWithError:](self, "_finishWithError:", v30);
              v51 = v56;
              v56[2](v56);
              goto LABEL_66;
            }
            if (objc_msgSend(v21, "done") || !v29)
            {

              goto LABEL_46;
            }
            v72 = v30;
            v32 = v28;
            v33 = v25;
            -[FPMoveInfo targetFolder](self->_info, "targetFolder");
            v34 = self;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "filename");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v55) = 0;
            +[FPDMoveAtom atomForMoving:toTargetFolder:as:root:atomically:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:](FPDMoveAtom, "atomForMoving:toTargetFolder:as:root:atomically:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:", v29, v35, v36, v15, 0, 0, 0, v55);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v38 = v34;
            info = v34->_info;
            v40 = objc_loadWeakRetained(location);
            objc_msgSend(v40, "manager");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(info) = objc_msgSend(v37, "shouldAccountForDownloadOfSourceItemForMoveInfo:extensionManager:", info, v41);

            if ((_DWORD)info)
            {
              v71 += objc_msgSend(v29, "size");
              v62 = 1;
            }
            self = v38;
            if ((objc_msgSend(v29, "requiresCrossDeviceCopy") & 1) != 0
              || (-[FPMoveInfo targetFolder](v38->_info, "targetFolder"),
                  v42 = (void *)objc_claimAutoreleasedReturnValue(),
                  v43 = objc_msgSend(v42, "requiresCrossDeviceCopy"),
                  v42,
                  v43))
            {
              v25 = objc_msgSend(v29, "size") + v33;
            }
            else
            {
              v25 = v33;
            }

            objc_autoreleasePoolPop(v32);
            v21 = v65;
            ++v26;
            v15 = v64;
            if ((objc_msgSend(v65, "done") & 1) != 0)
              goto LABEL_47;
          }
          fp_current_or_default_log();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            -[FPDMoveReader _progressComputationPreflight:completion:].cold.1();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 27, MEMORY[0x1E0C9AA70]);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPDMoveReader _finishWithError:](self, "_finishWithError:", v53);
          v51 = v56;
          v56[2](v56);

LABEL_66:
          v6 = v59;

          objc_autoreleasePoolPop(v28);
LABEL_67:
          v23 = v61;
LABEL_68:

          v10 = v60;
LABEL_69:

          goto LABEL_70;
        }
        v25 = 0;
        v62 = 0;
        v26 = 0;
        v71 = 0;
LABEL_47:
        fp_current_or_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v47 = self->_willMaterializeTargetFolder;
          *(_DWORD *)buf = 138413570;
          v84 = v15;
          v85 = 2048;
          v86 = v26;
          v87 = 2048;
          v88 = v71;
          v89 = 2048;
          v90 = v25;
          v91 = 1024;
          v92 = v62 & 1;
          v93 = 1024;
          v94 = v47;
          _os_log_debug_impl(&dword_1CF55F000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: preflight for root: %@, numItems:%lu, undownloadedSize:%lu, crossDeviceCopySize:%lu,                   isRequiringDownload:%{BOOL}d, willMaterializeTargetFolder:%{BOOL}d", buf, 0x36u);
        }

        -[FPDMoveReader rootPreflightCompletionBlock](self, "rootPreflightCompletionBlock");
        v45 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v45[2](v45, v15, v26, v71, v25);

        v6 = v59;
        v10 = v60;
        v13 = v57;
        v12 = v58;
        v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v61;
      }

      v14 = v69 + 1;
      if (v69 + 1 == v12)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
        if (v12)
          goto LABEL_5;
        goto LABEL_54;
      }
    }
    v51 = v56;
    v56[2](v56);
    goto LABEL_69;
  }
  v68 = 0;
LABEL_54:

  v48 = MEMORY[0x1E0C809B0];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke;
  v76[3] = &unk_1E8C75E48;
  v76[4] = self;
  v49 = MEMORY[0x1D17D1C84](v76);
  v50 = (void *)v49;
  if (v68)
  {
    v73[0] = v48;
    v73[1] = 3221225472;
    v73[2] = __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_13;
    v73[3] = &unk_1E8C77678;
    v73[4] = self;
    v51 = v56;
    v74 = v56;
    v75 = v50;
    -[FPDMoveReader _getSpaceForWriteSize:atTargetPath:completion:](self, "_getSpaceForWriteSize:atTargetPath:completion:", v68, v6, v73);

  }
  else
  {
    (*(void (**)(uint64_t))(v49 + 16))(v49);
    v51 = v56;
    v56[2](v56);
  }

LABEL_70:
}

void __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void (**v3)(void);

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "preflightCompletionBlock");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
}

void __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_13(uint64_t a1, char a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  if ((a2 & 1) != 0)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_2;
    block[3] = &unk_1E8C77650;
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    dispatch_async(v3, block);

    v4 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 28, MEMORY[0x1E0C9AA70]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_13_cold_1();

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(v7 + 80);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_14;
    v13[3] = &unk_1E8C75C50;
    v13[4] = v7;
    v14 = v5;
    v15 = v8;
    v4 = v5;
    dispatch_async(v9, v13);

  }
}

uint64_t __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_14(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_getSpaceForWriteSize:(int64_t)a3 atTargetPath:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  int64_t v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  _QWORD v36[4];
  void (**v37)(id, uint64_t);
  int64_t v38;
  id v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  int64_t v44;
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (v7)
  {
    v9 = *MEMORY[0x1E0C99BA8];
    v10 = *MEMORY[0x1E0C99BB8];
    v45[0] = *MEMORY[0x1E0C99BA8];
    v45[1] = v10;
    v11 = *MEMORY[0x1E0C99C00];
    v45[2] = *MEMORY[0x1E0C99C00];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v7, "resourceValuesForKeys:error:", v12, &v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v40;
    v15 = v14;
    if (v13)
      goto LABEL_3;
    objc_msgSend(v14, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v26 = objc_msgSend(v15, "code");

      if (v26 == 260)
      {
        objc_msgSend(v7, "URLByDeletingLastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v15;
        objc_msgSend(v27, "resourceValuesForKeys:error:", v12, &v39);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v39;

        objc_msgSend(v7, "URLByDeletingLastPathComponent");
        v28 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v28;
        v15 = v35;
        if (v13)
        {
LABEL_3:
          objc_msgSend(v13, "objectForKeyedSubscript:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "longLongValue");

          objc_msgSend(v13, "objectForKeyedSubscript:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v18, "BOOLValue");

          if ((_DWORD)v16)
            v19 = v17 <= 0;
          else
            v19 = 1;
          if (v19)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v10);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "longLongValue");

            if (v21)
              v22 = v21 < a3;
            else
              v22 = 0;
            v23 = !v22;
            v8[2](v8, v23);
          }
          else if (v17 >= a3)
          {
            v8[2](v8, 1);
          }
          else
          {
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __63__FPDMoveReader__getSpaceForWriteSize_atTargetPath_completion___block_invoke;
            v36[3] = &unk_1E8C776A0;
            v37 = v8;
            v38 = a3;
            v29 = (void *)MEMORY[0x1D17D1C84](v36);
            fp_current_or_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v44 = a3;
              _os_log_impl(&dword_1CF55F000, v30, OS_LOG_TYPE_INFO, "[INFO] Low disk space: purging to make room for %ld bytes", buf, 0xCu);
            }

            v41[0] = CFSTR("CACHE_DELETE_VOLUME");
            objc_msgSend(v7, "path");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v41[1] = CFSTR("CACHE_DELETE_AMOUNT");
            v42[0] = v31;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 + 10485760);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v42[1] = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
            CacheDeletePurgeSpaceWithInfo();
            v33 = (void *)objc_claimAutoreleasedReturnValue();

          }
LABEL_32:

          goto LABEL_33;
        }
      }
    }
    else
    {

    }
    fp_current_or_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[FPDMoveReader _getSpaceForWriteSize:atTargetPath:completion:].cold.2((uint64_t)v7, v15, v34);

    v8[2](v8, 1);
    goto LABEL_32;
  }
  fp_current_or_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[FPDMoveReader _getSpaceForWriteSize:atTargetPath:completion:].cold.1();

  v8[2](v8, 1);
LABEL_33:

}

uint64_t __63__FPDMoveReader__getSpaceForWriteSize_atTargetPath_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v6;

  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "longLongValue");

    return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4 >= *(_QWORD *)(a1 + 40));
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__FPDMoveReader__getSpaceForWriteSize_atTargetPath_completion___block_invoke_cold_1();

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (int64_t)_fileSizeBitsSupportAtPath:(id)a3
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;

  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 2097156);
  if (v4 < 0)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FPDMoveReader _fileSizeBitsSupportAtPath:].cold.1();
    goto LABEL_9;
  }
  v5 = v4;
  v6 = fpathconf(v4, 18);
  close(v5);
  if (v6 < 0)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FPDMoveReader _fileSizeBitsSupportAtPath:].cold.2();
LABEL_9:

    v7 = -1;
    goto LABEL_10;
  }
  if (v6)
    v7 = (uint64_t)exp2((double)(v6 - 1));
  else
    v7 = 0;
LABEL_10:

  return v7;
}

- (BOOL)_shouldCheckSpaceForRoot:(id)a3 targetFolderURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  _OWORD v30[2];
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v6 = a3;
  v7 = a4;
  if (-[FPMoveInfo byCopy](self->_info, "byCopy"))
  {
    v33 = 0;
    v32 = xmmword_1CF627DB0;
    v31 = 0;
    memset(v30, 0, sizeof(v30));
    objc_msgSend(v7, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (getattrlist((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v32, v30, 0x28uLL, 0x21u) < 0)
    {
      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[FPDMoveReader _shouldCheckSpaceForRoot:targetFolderURL:].cold.1(v8);

      v9 = 1;
    }
    else
    {
      v9 = (BYTE14(v30[0]) & 1) == 0;
    }
    goto LABEL_22;
  }
  if (!objc_msgSend(v6, "isProviderItem"))
    goto LABEL_8;
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isProviderItem");

  if (!v11)
    goto LABEL_8;
  objc_msgSend(v6, "asFPItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "providerDomainID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "asFPItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "providerDomainID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "isEqualToString:", v16);

  if ((v17 & 1) == 0)
  {
LABEL_8:
    if ((objc_msgSend(v6, "isExternalURL") & 1) != 0)
    {
      objc_msgSend(v6, "asURL");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "asFPItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fileURL");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v29 = 0;
    v19 = *MEMORY[0x1E0C99BC8];
    v28 = 0;
    objc_msgSend(v8, "getResourceValue:forKey:error:", &v29, v19, &v28);
    v20 = v29;
    v26 = 0;
    v27 = 0;
    v21 = v28;
    objc_msgSend(v7, "getResourceValue:forKey:error:", &v27, v19, &v26);
    v22 = v27;
    v23 = v26;

    v9 = v7 && !v23 && v20 && v22 && !objc_msgSend(v20, "isEqual:", v22);
LABEL_22:

    goto LABEL_23;
  }
  v9 = 0;
LABEL_23:

  return v9;
}

- (BOOL)_shouldCheckFileSystemBitsForRoot:(id)a3 targetFolderURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isProviderItem"))
    goto LABEL_5;
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isProviderItem");

  if (!v9)
    goto LABEL_5;
  objc_msgSend(v6, "asFPItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "providerDomainID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asFPItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "providerDomainID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "isEqualToString:", v14);

  if ((v15 & 1) != 0)
  {
    LOBYTE(v16) = 0;
  }
  else
  {
LABEL_5:
    if ((objc_msgSend(v6, "isExternalURL") & 1) != 0)
    {
      objc_msgSend(v6, "asURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "asFPItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v27 = 0;
    v16 = *MEMORY[0x1E0C99BC8];
    v26 = 0;
    objc_msgSend(v17, "getResourceValue:forKey:error:", &v27, v16, &v26);
    v19 = v27;
    v24 = 0;
    v25 = 0;
    v20 = v26;
    objc_msgSend(v7, "getResourceValue:forKey:error:", &v25, v16, &v24);
    v21 = v25;
    v22 = v24;

    LOBYTE(v16) = 0;
    if (v7 && !v22 && v19 && v21)
      LODWORD(v16) = objc_msgSend(v19, "isEqual:", v21) ^ 1;

  }
  return v16;
}

- (id)_getTargetFolderFor:(id)a3 root:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id WeakRetained;
  void *v14;

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[FPMoveInfo roots](self->_info, "roots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v8);

  if (v11)
  {
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
    objc_msgSend(v8, "parentIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "waitForResultOfSourceID:root:error:", v14, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)_targetNameForSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[FPMoveInfo roots](self->_info, "roots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FPMoveInfo rootFilenames](self->_info, "rootFilenames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)_enqueueItem:(id)a3 forRoot:(id)a4 atomically:(BOOL)a5 useDiskWriter:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  id WeakRetained;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v33 = 0;
  -[FPDMoveReader _getTargetFolderFor:root:error:](self, "_getTargetFolderFor:root:error:", v10, v11, &v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v33;
  v14 = v13;
  if (v12)
  {
    v32 = v13;
    -[FPDMoveReader _targetNameForSource:](self, "_targetNameForSource:", v10);
    v31 = objc_claimAutoreleasedReturnValue();
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FPMoveInfo byCopy](self->_info, "byCopy");
    v17 = v11;
    v18 = a6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    objc_msgSend(WeakRetained, "manager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "materializeOptionForDestinationItem:recursively:isCopy:extensionManager:", v15, v7, v16, v20);

    LOBYTE(v30) = v18;
    v11 = v17;
    v22 = v31;
    +[FPDMoveAtom atomForMoving:toTargetFolder:as:root:atomically:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:](FPDMoveAtom, "atomForMoving:toTargetFolder:as:root:atomically:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:", v10, v12, v31, v11, v7, v21, self->_willMaterializeTargetFolder, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[FPDMoveReader startDownloadBlock](self, "startDownloadBlock");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[FPDMoveReader startDownloadBlock](self, "startDownloadBlock");
        v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "source");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "asFPItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, BOOL, _QWORD))v25)[2](v25, v27, v21 == 2, 0);

      }
    }
    v28 = objc_loadWeakRetained((id *)&self->_moveQueue);
    objc_msgSend(v28, "enqueue:", v23);

    v14 = v32;
  }
  else
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[FPDMoveReader _enqueueItem:forRoot:atomically:useDiskWriter:].cold.1((uint64_t)v10, v14);
  }

  return v12 != 0;
}

- (void)_bailOutOfRoot:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  unint64_t v9;
  unint64_t depth;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDMoveReader _bailOutOfRoot:].cold.1();

  if (self->_depth)
  {
    do
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        depth = self->_depth;
        *(_DWORD *)buf = 67109120;
        v12 = depth;
        _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader:_bailOutOfRoot: adding atomForPostFolder %d", buf, 8u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_moveQueue);
      +[FPDMoveAtom atomForPostFolderUnderRoot:atomically:useDiskWriter:](FPDMoveAtom, "atomForPostFolderUnderRoot:atomically:useDiskWriter:", v4, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "enqueue:", v8);

      v9 = self->_depth - 1;
      self->_depth = v9;
    }
    while (v9);
  }

}

- (BOOL)_isSingleMoveForRoot:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v29;
  id v30;
  id v31;
  id v32;

  v4 = a3;
  if (-[FPMoveInfo byCopy](self->_info, "byCopy"))
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FPDMoveReader _isSingleMoveForRoot:].cold.1();
LABEL_16:
    v14 = 0;
    goto LABEL_32;
  }
  if (!-[FPMoveInfo byMoving](self->_info, "byMoving"))
    goto LABEL_11;
  if (!objc_msgSend(v4, "isProviderItem"))
    goto LABEL_11;
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isProviderItem");

  if (!v7)
    goto LABEL_11;
  objc_msgSend(v4, "asFPItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerDomainID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asFPItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "providerDomainID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqualToString:", v12);

  if (v13)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FPDMoveReader _isSingleMoveForRoot:].cold.2();
    v14 = 1;
  }
  else
  {
LABEL_11:
    if (!-[FPDMoveReader _shouldUseDiskWriterToPerformMoveForItem:](self, "_shouldUseDiskWriterToPerformMoveForItem:", v4))
    {
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[FPDMoveReader _isSingleMoveForRoot:].cold.5();
      goto LABEL_16;
    }
    if ((objc_msgSend(v4, "isExternalURL") & 1) != 0)
    {
      objc_msgSend(v4, "asURL");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "asFPItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileURL");
      v5 = objc_claimAutoreleasedReturnValue();

    }
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isExternalURL");
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((v17 & 1) != 0)
    {
      objc_msgSend(v18, "asURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v18, "asFPItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fileURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v32 = 0;
    v22 = *MEMORY[0x1E0C99BC8];
    v31 = 0;
    -[NSObject getResourceValue:forKey:error:](v5, "getResourceValue:forKey:error:", &v32, v22, &v31);
    v23 = v32;
    v29 = 0;
    v30 = 0;
    v24 = v31;
    objc_msgSend(v20, "getResourceValue:forKey:error:", &v30, v22, &v29);
    v25 = v30;
    v26 = v29;

    if (!v26 && v23 && v20 && objc_msgSend(v23, "isEqual:", v25))
    {
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[FPDMoveReader _isSingleMoveForRoot:].cold.3();
      v14 = 1;
    }
    else
    {
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[FPDMoveReader _isSingleMoveForRoot:].cold.4();
      v14 = 0;
    }

  }
LABEL_32:

  return v14;
}

- (BOOL)_isSinglePkgCopyForRoot:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isExternalURL") & 1) != 0)
  {
    objc_msgSend(v3, "asURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "asFPItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
  }

  v6 = objc_msgSend(v4, "fp_isPackage");
  return v6;
}

+ (BOOL)_hasDiskWriterSupportForDomain:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isUsingFPFS") & 1) == 0)
  {
    objc_msgSend(v4, "providerDomainID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fp_toProviderID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_shouldUseDiskWriterToPerformMoveForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isProviderItem"))
  {
    objc_msgSend(v4, "asFPItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isProviderItem"))
  {
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asFPItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    objc_msgSend(WeakRetained, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "domainFromItemID:reason:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_9:
      v13 = objc_loadWeakRetained((id *)&self->_operation);
      objc_msgSend(v13, "manager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "domainFromItemID:reason:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  else
  {
    v12 = 0;
    if (v8)
      goto LABEL_9;
  }
  v16 = 0;
LABEL_12:
  v17 = +[FPDMoveReader _hasDiskWriterSupportForDomain:](FPDMoveReader, "_hasDiskWriterSupportForDomain:", v12);
  if (+[FPDMoveReader _hasDiskWriterSupportForDomain:](FPDMoveReader, "_hasDiskWriterSupportForDomain:", v16))
  {
    LOBYTE(v18) = objc_msgSend(v16, "isUsingFPFS");
    if ((v18 & 1) == 0 && v17)
    {
      if (objc_msgSend(v12, "isUsingFPFS")
        && objc_msgSend(v16, "isUsingFPFS")
        && (!objc_msgSend(v4, "isProviderItem")
         || (-[FPMoveInfo targetFolder](self->_info, "targetFolder"),
             v19 = (void *)objc_claimAutoreleasedReturnValue(),
             v20 = objc_msgSend(v19, "isProviderItem"),
             v19,
             v20)))
      {
        if (-[FPMoveInfo byMoving](self->_info, "byMoving")
          && objc_msgSend(v4, "isProviderItem")
          && (-[FPMoveInfo targetFolder](self->_info, "targetFolder"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v21, "isProviderItem"),
              v21,
              v22))
        {
          objc_msgSend(v4, "asFPItem");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "providerDomainID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPMoveInfo targetFolder](self->_info, "targetFolder");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "asFPItem");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "providerDomainID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v18) = objc_msgSend(v47, "isEqualToString:", v25);

        }
        else
        {
          LODWORD(v18) = 0;
        }
        v27 = !self->_isTargetFolderMaterialized && !self->_willMaterializeTargetFolder;
        if (((v18 | v27) & 1) == 0)
        {
          -[FPMoveInfo targetFolder](self->_info, "targetFolder");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isExternalURL");
          -[FPMoveInfo targetFolder](self->_info, "targetFolder");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if ((v29 & 1) != 0)
          {
            objc_msgSend(v30, "asURL");
            v32 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v30, "asFPItem");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "fileURL");
            v32 = objc_claimAutoreleasedReturnValue();

          }
          if ((objc_msgSend(v4, "isExternalURL") & 1) != 0)
          {
            objc_msgSend(v4, "asURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v4, "asFPItem");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "fileURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (!v34)
          {
            v36 = objc_loadWeakRetained((id *)&self->_operation);
            objc_msgSend(v36, "manager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "materializedURLWithExtensionManager:", v37);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (!v32)
          {
            -[FPMoveInfo targetFolder](self->_info, "targetFolder");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_loadWeakRetained((id *)&self->_operation);
            objc_msgSend(v39, "manager");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "materializedURLWithExtensionManager:", v40);
            v32 = objc_claimAutoreleasedReturnValue();

          }
          v51 = (void *)v32;
          v55 = 0;
          v41 = *MEMORY[0x1E0C99BC8];
          v54 = 0;
          objc_msgSend(v34, "getResourceValue:forKey:error:", &v55, v41, &v54);
          v42 = v55;
          v43 = v54;
          fp_current_or_default_log();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v43, "fp_prettyDescription");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v57 = v34;
            v58 = 2112;
            v59 = v42;
            v60 = 2112;
            v61 = v48;
            _os_log_debug_impl(&dword_1CF55F000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: sourceURL %@ sourceVolume %@ error %@", buf, 0x20u);

          }
          v52 = 0;
          v53 = 0;
          objc_msgSend(v51, "getResourceValue:forKey:error:", &v53, v41, &v52);
          v45 = v53;
          v46 = v52;

          fp_current_or_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v46, "fp_prettyDescription");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v57 = v51;
            v58 = 2112;
            v59 = v45;
            v60 = 2112;
            v61 = v49;
            _os_log_debug_impl(&dword_1CF55F000, (os_log_t)v18, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: targetFolderURL %@ destVolume %@ error %@", buf, 0x20u);

          }
          LOBYTE(v18) = 0;
          if (!v46 && v42 && v45)
            LOBYTE(v18) = objc_msgSend(v42, "isEqual:", v45);

        }
      }
      else
      {
        LOBYTE(v18) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (void)_enqueueAtomsForRoot:(id)a3
{
  id v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  void *v14;
  __int128 v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _BOOL8 v20;
  uint64_t i;
  NSObject *v22;
  id WeakRetained;
  void *v24;
  unint64_t depth;
  NSObject *v26;
  BOOL v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  __int128 v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FPDMoveReader _isRootCancelled:](self, "_isRootCancelled:", v4))
    goto LABEL_50;
  v5 = -[FPDMoveReader _shouldUseDiskWriterToPerformMoveForItem:](self, "_shouldUseDiskWriterToPerformMoveForItem:", v4);
  if (-[FPDMoveReader _isSinglePkgCopyForRoot:](self, "_isSinglePkgCopyForRoot:", v4))
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FPDMoveReader _enqueueAtomsForRoot:].cold.2(v4);

    if (!-[FPDMoveReader _enqueueItem:forRoot:atomically:useDiskWriter:](self, "_enqueueItem:forRoot:atomically:useDiskWriter:", v4, v4, 1, v5))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ enqueuing a root should never fail"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDMoveReader _enqueueAtomsForRoot:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveReader.m", 719, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    }
    goto LABEL_50;
  }
  v9 = -[FPDMoveReader _isSingleMoveForRoot:](self, "_isSingleMoveForRoot:", v4);
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (!v9)
  {
    if (v11)
      -[FPDMoveReader _enqueueAtomsForRoot:].cold.7();

    self->_depth = 0;
    v37 = 0;
    -[FPDMoveReader _iteratorForRoot:enforceFPItem:error:](self, "_iteratorForRoot:enforceFPItem:error:", v4, 1, &v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v37;
    if (v14)
    {
      if ((objc_msgSend(v14, "done") & 1) == 0)
      {
        v33 = v13;
        *(_QWORD *)&v15 = 138412546;
        v32 = v15;
        while (1)
        {
          v16 = (void *)MEMORY[0x1D17D1B04]();
          -[FPDMoveReader _t_waitForUnblock](self, "_t_waitForUnblock");
          if (-[FPDMoveReader _isCancelled](self, "_isCancelled"))
            goto LABEL_42;
          if (-[FPDMoveReader _isRootCancelled:](self, "_isRootCancelled:", v4))
          {
            -[FPDMoveReader _bailOutOfRoot:](self, "_bailOutOfRoot:", v4);
LABEL_42:
            objc_autoreleasePoolPop(v16);
            goto LABEL_49;
          }
          v36 = 0;
          objc_msgSend(v14, "nextWithError:", &v36);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v36;
          v19 = v18;
          if (!v17)
          {
            if (v18)
              break;
          }
          v34 = v18;
          v35 = v16;
          v20 = v5;
          for (i = objc_msgSend(v14, "numFoldersPopped", v32); i; --i)
          {
            fp_current_or_default_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              depth = self->_depth;
              *(_DWORD *)buf = 67109120;
              LODWORD(v39) = depth;
              _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: adding atomForPostFolder %d", buf, 8u);
            }

            WeakRetained = objc_loadWeakRetained((id *)&self->_moveQueue);
            +[FPDMoveAtom atomForPostFolderUnderRoot:atomically:useDiskWriter:](FPDMoveAtom, "atomForPostFolderUnderRoot:atomically:useDiskWriter:", v4, 0, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "enqueue:", v24);

            --self->_depth;
          }
          if (!v17 || (objc_msgSend(v14, "done") & 1) != 0)
          {

            v19 = v34;
            v16 = v35;
            goto LABEL_48;
          }
          fp_current_or_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          v5 = v20;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v17, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v39 = v28;
            v40 = 1024;
            v41 = v20;
            _os_log_debug_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: itemID %@ shouldUseDiskWriterToPerformMoveForItem %{BOOL}d", buf, 0x12u);

          }
          v27 = -[FPDMoveReader _enqueueItem:forRoot:atomically:useDiskWriter:](self, "_enqueueItem:forRoot:atomically:useDiskWriter:", v17, v4, 0, v20);
          v19 = v34;
          v16 = v35;
          if (!v27)
          {
            -[FPDMoveReader _bailOutOfRoot:](self, "_bailOutOfRoot:", v4);

            goto LABEL_47;
          }
          if (objc_msgSend(v17, "isFolder"))
            ++self->_depth;

          objc_autoreleasePoolPop(v35);
          if ((objc_msgSend(v14, "done") & 1) != 0)
            goto LABEL_49;
        }
        fp_current_or_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[FPDMoveReader _enqueueAtomsForRoot:].cold.6(v19);

        -[FPDMoveReader _finishWithError:](self, "_finishWithError:", v19);
LABEL_47:
        v13 = v33;
LABEL_48:

        objc_autoreleasePoolPop(v16);
      }
    }
    else
    {
      -[FPDMoveReader _finishWithError:](self, "_finishWithError:", v13);
    }
    goto LABEL_49;
  }
  if (v11)
    -[FPDMoveReader _enqueueAtomsForRoot:].cold.5(v4);

  if (!-[FPDMoveReader _enqueueItem:forRoot:atomically:useDiskWriter:](self, "_enqueueItem:forRoot:atomically:useDiskWriter:", v4, v4, 1, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ enqueuing a root should never fail"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDMoveReader _enqueueAtomsForRoot:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveReader.m", 732, (const char *)objc_msgSend(objc_retainAutorelease(v30), "UTF8String"));
  }
  if (objc_msgSend(v4, "isFolder"))
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FPDMoveReader _enqueueAtomsForRoot:].cold.3();

    v13 = objc_loadWeakRetained((id *)&self->_moveQueue);
    +[FPDMoveAtom atomForPostFolderUnderRoot:atomically:useDiskWriter:](FPDMoveAtom, "atomForPostFolderUnderRoot:atomically:useDiskWriter:", v4, 1, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enqueue:", v14);
LABEL_49:

  }
LABEL_50:

}

- (void)_runWithDownloadedTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = v4;
  if (self->_willMaterializeTargetFolder)
  {
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asFPItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[FPDMoveReader _runWithDownloadedTarget:].cold.1();

    -[FPDMoveReader startDownloadBlock](self, "startDownloadBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__FPDMoveReader__runWithDownloadedTarget___block_invoke;
    v10[3] = &unk_1E8C75530;
    v10[4] = self;
    v11 = v5;
    ((void (**)(_QWORD, void *, _QWORD, _QWORD *))v9)[2](v9, v7, 0, v10);

  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

void __42__FPDMoveReader__runWithDownloadedTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v4 = a2;
  v5 = *(id *)(a1 + 40);
  v3 = v4;
  fp_dispatch_async_with_logs();

}

uint64_t __42__FPDMoveReader__runWithDownloadedTarget___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_finishWithError:");
  result = objc_msgSend(v2, "_isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  return result;
}

- (void)_run
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] ┳%llx move-reader: signal", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

void __21__FPDMoveReader__run__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id WeakRetained;
  NSObject *v12;
  uint8_t v13;
  _BYTE v14[15];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "roots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D17D1B04]();
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v7;
          _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: looking at root %@", buf, 0xCu);
        }

        if (objc_msgSend(*(id *)(a1 + 32), "_isCancelled"))
        {
          fp_current_or_default_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            __21__FPDMoveReader__run__block_invoke_cold_1();

          objc_autoreleasePoolPop(v8);
          return;
        }
        if (objc_msgSend(*(id *)(a1 + 32), "_isRootCancelled:", v7))
        {
          fp_current_or_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            __21__FPDMoveReader__run__block_invoke_cold_2(&v13, v14, v10);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_enqueueAtomsForRoot:", v7);
        }
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v4)
        continue;
      break;
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "finishedEnqueuing");

  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

- (void)_t_waitForUnblock
{
  if (-[FPMoveInfo _t_clientDrivenReader](self->_info, "_t_clientDrivenReader"))
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_clientUnblockSema, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_t_unblock
{
  void *v3;
  NSObject *v4;

  if ((-[FPMoveInfo _t_clientDrivenReader](self->_info, "_t_clientDrivenReader") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ unexpected call"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDMoveReader _t_unblock]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveReader.m", 869, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_clientUnblockSema);
}

- (BOOL)_isRootCancelled:(id)a3
{
  id v4;
  FPDMoveReader *v5;
  char v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableSet containsObject:](v5->_cancelledRoots, "containsObject:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (void)cancelRoot:(id)a3
{
  FPDMoveReader *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](v4->_cancelledRoots, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)cancel
{
  FPDMoveReader *v2;
  int v3;
  NSObject *queue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  v2->__cancelled = 1;
  if (-[FPMoveInfo _t_clientDrivenReader](v2->_info, "_t_clientDrivenReader"))
  {
    v3 = 500;
    do
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)v2->_clientUnblockSema);
      --v3;
    }
    while (v3);
  }
  objc_sync_exit(v2);

  queue = v2->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__FPDMoveReader_cancel__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = v2;
  dispatch_sync(queue, block);
}

void __23__FPDMoveReader_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_finishWithError:", v2);

}

- (void)dumpStateTo:(id)a3
{
  FPDMoveReader *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "write:", CFSTR("+ reader\n"));
  if (v4->__cancelled)
  {
    objc_msgSend(v5, "startAttributes:", 2);
    objc_msgSend(v5, "write:", CFSTR("  reader cancelled\n"));
    objc_msgSend(v5, "reset");
  }
  if (-[NSMutableSet count](v4->_cancelledRoots, "count"))
  {
    objc_msgSend(v5, "startFgColor:", 1);
    objc_msgSend(v5, "write:", CFSTR("  roots cancelled: %@\n"), v4->_cancelledRoots);
    objc_msgSend(v5, "reset");
  }
  if (v4->_error)
  {
    objc_msgSend(v5, "startFgColor:", 1);
    objc_msgSend(v5, "write:", CFSTR("  error: %@\n"), v4->_error);
    objc_msgSend(v5, "reset");
  }
  objc_msgSend(v5, "write:", CFSTR("\n"));
  objc_sync_exit(v4);

}

- (id)rootPreflightCompletionBlock
{
  return self->_rootPreflightCompletionBlock;
}

- (void)setRootPreflightCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)preflightCompletionBlock
{
  return self->_preflightCompletionBlock;
}

- (void)setPreflightCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)startDownloadBlock
{
  return self->_startDownloadBlock;
}

- (void)setStartDownloadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_startDownloadBlock, 0);
  objc_storeStrong(&self->_preflightCompletionBlock, 0);
  objc_storeStrong(&self->_rootPreflightCompletionBlock, 0);
  objc_storeStrong((id *)&self->_clientUnblockSema, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cancelledRoots, 0);
  objc_destroyWeak((id *)&self->_writer);
  objc_destroyWeak((id *)&self->_moveQueue);
  objc_storeStrong((id *)&self->_info, 0);
  objc_destroyWeak((id *)&self->_operation);
}

- (void)initWithMoveWriter:operation:queue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┣%llx move-reader: create move reader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __22__FPDMoveReader_start__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] move-reader: failed to verify target URL with error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __22__FPDMoveReader_start__block_invoke_6_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] ┳%llx move-reader: starting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

- (void)_finishWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_iteratorForRoot:(void *)a1 enforceFPItem:error:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "providerDomainID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_obfuscatedProviderDomainID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v3, v4, "[ERROR] move-reader: encountered error during enumeration: root is from unknown domain %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_progressComputationPreflight:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_1CF55F000, v1, OS_LOG_TYPE_ERROR, "[ERROR] Filesystem only supports %ld file size bits but we need %ld", v2, 0x16u);
  OUTLINED_FUNCTION_8_0();
}

- (void)_progressComputationPreflight:(void *)a1 completion:.cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] move-reader: encountered error during preflight: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_progressComputationPreflight:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: starting preflight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 43);
  LODWORD(v2) = *(unsigned __int8 *)(v2 + 42);
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = v2;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: finished preflight. isTargetFolderMaterialized: %{BOOL}d willMaterializeTargetFolder %{BOOL}d", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_8_0();
}

void __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] move-reader: Could not move/copy item due to not enough free space at destination.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_getSpaceForWriteSize:atTargetPath:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] Cannot check available space because no target path given", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_getSpaceForWriteSize:(uint64_t)a1 atTargetPath:(void *)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Error retrieving available space for url %@: %@, %@", (uint8_t *)&v8, 0x20u);

}

void __63__FPDMoveReader__getSpaceForWriteSize_atTargetPath_completion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(0, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v1, v2, "[ERROR] Error purging: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)_fileSizeBitsSupportAtPath:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v1, v2, "[ERROR] Cannot open target path: %@, error: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)_fileSizeBitsSupportAtPath:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v1, v2, "[ERROR] Cannot get max filesize bits: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)_shouldCheckSpaceForRoot:(void *)a1 targetFolderURL:.cold.1(void *a1)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v1 = __error();
  OUTLINED_FUNCTION_4_0(v1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v2, v3, "[ERROR] move_shouldCheckSpaceForRoot: getattrlist (%s) failed %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_0();
}

- (void)_enqueueItem:(uint64_t)a1 forRoot:(void *)a2 atomically:useDiskWriter:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "fp_prettyDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v2, v3, "[ERROR] couldn't get target folder for %@; %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_bailOutOfRoot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: bailing out of root", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isSingleMoveForRoot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: copy require to iterate on all the children of the root", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isSingleMoveForRoot:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: issuing a single move since source and destination are in the same domain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isSingleMoveForRoot:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: issuing a single move since source and destination support disk writer and are on the same volume", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isSingleMoveForRoot:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: move will require a copy since source and destination are on different volumes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_isSingleMoveForRoot:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: move does not support the disk-writer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_enqueueAtomsForRoot:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x12u);

  OUTLINED_FUNCTION_2();
}

- (void)_enqueueAtomsForRoot:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: _enqueueAtomsForRoot:_isSingleMoveForRoot: adding atomForPostFolder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_enqueueAtomsForRoot:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)_enqueueAtomsForRoot:(void *)a1 .cold.6(void *a1)
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
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] move-reader: encountered error during enumeration: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_enqueueAtomsForRoot:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: going to iterate over root", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_runWithDownloadedTarget:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: targetFolder needs to be materialized, starting download: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __21__FPDMoveReader__run__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-reader: operation was cancelled, don't enumerate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __21__FPDMoveReader__run__block_invoke_cold_2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: root was cancelled, don't enumerate", buf, 2u);
}

@end
