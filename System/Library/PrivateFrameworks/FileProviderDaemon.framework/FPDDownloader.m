@implementation FPDDownloader

- (void)dealloc
{
  objc_super v3;

  -[FPDDownloader _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)FPDDownloader;
  -[FPDDownloader dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] Downloader has been cancelled, cancelling all ongoing materializations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (FPDDownloader)initWithDomain:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  FPDDownloader *v8;
  NSObject *v9;
  uint64_t v10;
  NSProgress *cancellationProgress;
  uint64_t v12;
  NSMutableDictionary *parentToChildMap;
  uint64_t v14;
  NSMutableDictionary *childProxies;

  v6 = a3;
  v7 = a4;
  v8 = -[FPDDownloader init](self, "init");
  if (v8)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FPDDownloader initWithDomain:callbackQueue:].cold.1();

    objc_storeWeak((id *)&v8->_domain, v6);
    objc_storeStrong((id *)&v8->_callbackQueue, a4);
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    cancellationProgress = v8->_cancellationProgress;
    v8->_cancellationProgress = (NSProgress *)v10;

    -[NSProgress setCancellable:](v8->_cancellationProgress, "setCancellable:", 1);
    v12 = objc_opt_new();
    parentToChildMap = v8->_parentToChildMap;
    v8->_parentToChildMap = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    childProxies = v8->_childProxies;
    v8->_childProxies = (NSMutableDictionary *)v14;

  }
  return v8;
}

- (void)_cleanup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] downloader: Untracking childProxies and unpublishing root progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_progressComputationPreflightForRecursiveRoot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", &__block_literal_global);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_2;
  v15[3] = &unk_1E8C751C8;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  v9 = (void *)MEMORY[0x1D17D1C84](v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_4;
  v13[3] = &unk_1E8C751C8;
  v13[4] = self;
  objc_copyWeak(&v14, &location);
  v10 = (void *)MEMORY[0x1D17D1C84](v13);
  +[FPDDownloadManager sharedInstance](FPDDownloadManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(&location);
  objc_msgSend(v11, "progressComputationPreflightForRecursiveRoot:downloader:itemProgressNeedsSetup:itemProgressSetup:completion:", v6, v12, v10, v9, v7);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_3;
  v6[3] = &unk_1E8C751A0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_createChildItem:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_5;
  v6[3] = &unk_1E8C751A0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained[2];
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 32), "parentItemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6[2], "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6[2], "setObject:forKeyedSubscript:", v5, v4);

    objc_sync_exit(v3);
    WeakRetained = v6;
  }

}

- (void)_stopTrackingFileURLs
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: Will stop tracking all urls for root URL %@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)_createChildItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *childProxies;
  void *v11;
  NSObject *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileURL:", v6);

  -[FPDDownloader progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addChild:withPendingUnitCount:", v5, objc_msgSend(v8, "integerValue"));

  objc_msgSend(v4, "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTrackingFileURL:kind:allowReadPausedProgressFromDisk:", v9, *MEMORY[0x1E0CB30B8], 0);

  childProxies = self->_childProxies;
  objc_msgSend(v4, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKey:](childProxies, "setObject:forKey:", v5, v11);
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[FPDDownloader _createChildItem:].cold.1(self, v12);

}

- (void)_logRootProgress
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] downloader: logging root progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __33__FPDDownloader__logRootProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileCompletedCount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

    if (v6 != v7)
    {
      objc_msgSend(v3, "progress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileCompletedCount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v9, "unsignedIntegerValue");

      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __33__FPDDownloader__logRootProgress__block_invoke_cold_1(v3);

    }
  }

}

- (void)downloadURL:(id)a3 recursively:(unint64_t)a4 request:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  FPDDownloader *v20;
  id v21;
  id v22;
  unint64_t v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[FPDDownloadManager sharedInstance](FPDDownloadManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDDownloader domain](self, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke;
  v18[3] = &unk_1E8C75218;
  v19 = v10;
  v20 = self;
  v22 = v12;
  v23 = a4;
  v21 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  objc_msgSend(v13, "retrieveFPItemForURL:domain:request:completion:", v17, v14, v15, v18);

}

void __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 40), "_cleanup");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(v5, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(v5, "setFileURL:", *(_QWORD *)(a1 + 32));
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "downloadItem:recursively:request:withCompletion:", v5, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

- (void)downloadItem:(id)a3 recursively:(unint64_t)a4 request:(id)a5 withCompletion:(id)a6
{
  -[FPDDownloader _downloadItem:recursively:retryCount:request:withCompletion:](self, "_downloadItem:recursively:retryCount:request:withCompletion:", a3, a4, 0, a5, a6);
}

- (void)_downloadItem:(id)a3 recursively:(unint64_t)a4 retryCount:(int)a5 request:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  int v26;
  _QWORD v27[5];

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke;
  v27[3] = &unk_1E8C75268;
  v27[4] = self;
  v16 = (void *)MEMORY[0x1D17D1C84](v27);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_3;
  v21[3] = &unk_1E8C752B8;
  v21[4] = self;
  v17 = v12;
  v22 = v17;
  v25 = a4;
  v26 = a5;
  v18 = v13;
  v23 = v18;
  v24 = v14;
  v19 = v14;
  v20 = (void *)MEMORY[0x1D17D1C84](v21);
  if (a4 && ((objc_msgSend(v17, "isFolder") & 1) != 0 || objc_msgSend(v17, "isPackage")))
    -[FPDDownloader _recursiveDownloadOfItem:request:recursively:perItemCompletion:withCompletion:](self, "_recursiveDownloadOfItem:request:recursively:perItemCompletion:withCompletion:", v17, v18, a4, v16, v20);
  else
    -[FPDDownloader _nonRecursiveDownloadOfItem:request:perItemCompletion:withCompletion:](self, "_nonRecursiveDownloadOfItem:request:perItemCompletion:withCompletion:", v17, v18, v16, v20);

}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_2;
  block[3] = &unk_1E8C75240;
  block[4] = v8;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didDownloadItem:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4;
  block[3] = &unk_1E8C75290;
  v10 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v15 = *(_QWORD *)(a1 + 64);
  v16 = *(_DWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v8 = v3;
  dispatch_async(v5, block);

}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];

  v2 = *(id *)(a1 + 32);
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_4(a1, v2, v3);

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileTotalCount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "progress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fileTotalCount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "progress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFileCompletedCount:", v7);

    }
  }
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_3(a1);

  objc_msgSend(*(id *)(a1 + 48), "_cleanup");
  objc_msgSend(v2, "domain");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqual:](v10, "isEqual:", *MEMORY[0x1E0CAAB88]))
    goto LABEL_21;
  v11 = objc_msgSend(v2, "code");

  if (v11 != 14)
  {
LABEL_22:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(a1 + 72);
  if (!v12)
  {
LABEL_19:
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_1(a1, v10);
LABEL_21:

    goto LABEL_22;
  }
  if (*(int *)(a1 + 80) > 49)
  {
    if (v12 == 1)
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloader: tree changes too much when downloading its content, lying about download", v15, 2u);
      }

      v2 = 0;
    }
    goto LABEL_19;
  }
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_2();

  objc_msgSend(*(id *)(a1 + 48), "_downloadItem:recursively:retryCount:request:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), (*(_DWORD *)(a1 + 80) + 1), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_23:

}

- (void)_nonRecursiveDownloadOfItem:(id)a3 request:(id)a4 perItemCompletion:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  location = 0;
  objc_initWeak(&location, self);
  +[FPDDownloadManager sharedInstance](FPDDownloadManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained(&location);
  objc_msgSend(v14, "downloadItem:recursively:downloader:request:perItemCompletion:withCompletion:", v10, 0, v15, v11, v12, v13);

  objc_destroyWeak(&location);
}

- (void)_recursiveDownloadOfItem:(id)a3 request:(id)a4 recursively:(unint64_t)a5 perItemCompletion:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSProgress *v16;
  NSProgress *progress;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27[2];
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
  v16 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v16;

  -[NSProgress fp_setFileOperationKind:](self->_progress, "fp_setFileOperationKind:", *MEMORY[0x1E0CB30B8]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__FPDDownloader__recursiveDownloadOfItem_request_recursively_perItemCompletion_withCompletion___block_invoke;
  v22[3] = &unk_1E8C75308;
  v22[4] = self;
  v18 = v12;
  v23 = v18;
  v27[1] = (id)a5;
  objc_copyWeak(v27, &location);
  v19 = v13;
  v24 = v19;
  v20 = v14;
  v25 = v20;
  v21 = v15;
  v26 = v21;
  -[FPDDownloader _progressComputationPreflightForRecursiveRoot:completion:](self, "_progressComputationPreflightForRecursiveRoot:completion:", v18, v22);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

}

void __95__FPDDownloader__recursiveDownloadOfItem_request_recursively_perItemCompletion_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13[2];

  objc_msgSend(*(id *)(a1 + 32), "_logRootProgress");
  +[FPDDownloadManager sharedInstance](FPDDownloadManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__FPDDownloader__recursiveDownloadOfItem_request_recursively_perItemCompletion_withCompletion___block_invoke_2;
  v10[3] = &unk_1E8C752E0;
  v12 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(void **)(a1 + 80);
  v11 = v8;
  v13[1] = v9;
  objc_copyWeak(v13, (id *)(a1 + 72));
  objc_msgSend(v2, "downloadItem:recursively:downloader:request:perItemCompletion:withCompletion:", v3, v4, WeakRetained, v6, v7, v10);
  objc_destroyWeak(v13);

}

void __95__FPDDownloader__recursiveDownloadOfItem_request_recursively_perItemCompletion_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[FPDDownloadManager sharedInstance](FPDDownloadManager, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 56);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v6, "verifyIfSubtreeIsFullyMaterializedBelowItem:recursively:downloader:completion:", v3, v4, WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

- (void)_didDownloadItem:(id)a3 withError:(id)a4
{
  NSObject *v5;
  NSMutableDictionary *v6;
  NSObject *v7;
  NSMutableDictionary *parentToChildMap;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  NSMutableDictionary *childProxies;
  void *v29;
  _BOOL4 v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v42 = a4;
  if (v42)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FPDDownloader _didDownloadItem:withError:].cold.2(v43, v42, v5);

  }
  if (objc_msgSend(v43, "isFolder"))
  {
    v6 = self->_parentToChildMap;
    objc_sync_enter(v6);
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v43, "itemID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "fileURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v40;
      v52 = 2112;
      v53 = v41;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: Finished downloading folder (%@) %@.", buf, 0x16u);

    }
    parentToChildMap = self->_parentToChildMap;
    objc_msgSend(v43, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](parentToChildMap, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v46 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v15, "fileURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (v17)
          {
            objc_msgSend(v43, "fileURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "filename");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v19, objc_msgSend(v15, "isFolder"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            fp_current_or_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v23 = v6;
              objc_msgSend(v43, "fileURL");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "filename");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v51 = v24;
              v52 = 2112;
              v53 = v25;
              _os_log_error_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_ERROR, "[ERROR] downloader: folder %@ child filename %@.", buf, 0x16u);

              v6 = v23;
            }

            objc_msgSend(v15, "setFileURL:", v20);
          }
          objc_msgSend(v15, "fileURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            -[FPDDownloader _createChildItem:](self, "_createChildItem:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v12);
    }

    v26 = self->_parentToChildMap;
    objc_msgSend(v43, "itemID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v26, "removeObjectForKey:", v27);

    objc_sync_exit(v6);
  }
  else
  {
    childProxies = self->_childProxies;
    objc_msgSend(v43, "itemID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](childProxies, "objectForKeyedSubscript:", v29);
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v30 = v42 == 0;
    else
      v30 = 0;
    if (v30)
    {
      -[NSMutableDictionary stopTrackingIfStarted](v6, "stopTrackingIfStarted");
      v31 = self->_childProxies;
      objc_msgSend(v43, "itemID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v31, "removeObjectForKey:", v32);

      v33 = (void *)MEMORY[0x1E0CB37E8];
      -[FPDDownloader progress](self, "progress");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fileCompletedCount");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "numberWithInt:", objc_msgSend(v35, "intValue") + 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDDownloader progress](self, "progress");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFileCompletedCount:", v36);

      fp_current_or_default_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[FPDDownloader _didDownloadItem:withError:].cold.1(v43, v6, v38);

    }
  }

}

- (FPDDomain)domain
{
  return (FPDDomain *)objc_loadWeakRetained((id *)&self->_domain);
}

- (NSProgress)cancellationProgress
{
  return self->_cancellationProgress;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)isDryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_cancellationProgress, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_childProxies, 0);
  objc_storeStrong((id *)&self->_parentToChildMap, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)initWithDomain:callbackQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] downloader: initiated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_createChildItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a2, v7, "[DEBUG] downloader: Added child %@\n %@@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

void __33__FPDDownloader__logRootProgress__block_invoke_cold_1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17;

  objc_msgSend(a1, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileCompletedCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileTotalCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedAdditionalDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1CF55F000, v11, v12, "[DEBUG] downloader: %@\n %@ / %@ files: %@\n%@", v13, v14, v15, v16, v17);

  OUTLINED_FUNCTION_3();
}

void __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, (uint64_t)v0, "[DEBUG] downloader: Retrieved item %@ for URL %@", v1);
}

void __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, (uint64_t)v0, "[ERROR] downloader: Error %@ trying to retrieve item for URL %@", v1);
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 80);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: tree changed during download, failing since we're at our %dth retry", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_5();
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] downloader: tree changed during download, try again in case there are some dataless files in it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17;

  objc_msgSend(*(id *)(a1 + 48), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileCompletedCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileTotalCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedAdditionalDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1CF55F000, v11, v12, "[DEBUG] downloader final progress: %@\n %@ / %@ files: %@\n%@", v13, v14, v15, v16, v17);

  OUTLINED_FUNCTION_3();
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a3, v6, "[DEBUG] downloader: finished full download of root %@ (error: %@)", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

- (void)_didDownloadItem:(NSObject *)a3 withError:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  __int16 v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedAdditionalDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  OUTLINED_FUNCTION_4();
  v10 = v7;
  v11 = a2;
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: per item final progress: %@\n%@\n%@", (uint8_t *)&v8, 0x20u);

}

- (void)_didDownloadItem:(NSObject *)a3 withError:.cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v7, "[ERROR] downloader: failed to download item %@ : %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

@end
