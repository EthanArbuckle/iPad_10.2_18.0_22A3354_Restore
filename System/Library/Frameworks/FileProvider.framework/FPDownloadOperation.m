@implementation FPDownloadOperation

- (void)_recomputeDownloadInfoIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  FPDownloadInfo *v6;
  FPDownloadInfo *info;
  void *v8;
  void (**v9)(id, FPDownloadInfo *);

  if (!self->_info)
  {
    +[FPDaemonOperationManager sharedInstance](FPDaemonOperationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "generateLocalOperationID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray fp_map:](self->_items, "fp_map:", &__block_literal_global_26);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FPActionOperationInfo initWithOperationID:roots:]([FPDownloadInfo alloc], "initWithOperationID:roots:", v4, v5);
    info = self->_info;
    self->_info = v6;

    -[FPDownloadInfo setRecursively:](self->_info, "setRecursively:", 1);
  }
  -[FPDownloadOperation _t_patchActionOperationInfo](self, "_t_patchActionOperationInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FPDownloadOperation _t_patchActionOperationInfo](self, "_t_patchActionOperationInfo");
    v9 = (void (**)(id, FPDownloadInfo *))objc_claimAutoreleasedReturnValue();
    v9[2](v9, self->_info);

  }
}

id __56__FPDownloadOperation__recomputeDownloadInfoIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[FPActionOperationLocator locatorForItem:](FPActionOperationLocator, "locatorForItem:", a2);
}

- (FPDownloadOperation)initWithItems:(id)a3
{
  id v5;
  FPDownloadOperation *v6;
  FPDownloadOperation *v7;
  uint64_t v8;
  NSMutableSet *itemsPendingDownload;
  uint64_t v10;
  NSMutableDictionary *childProxies;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPDownloadOperation;
  v6 = -[FPActionOperation initWithProvider:action:](&v13, sel_initWithProvider_action_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_items, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    itemsPendingDownload = v7->_itemsPendingDownload;
    v7->_itemsPendingDownload = (NSMutableSet *)v8;

    v10 = objc_opt_new();
    childProxies = v7->_childProxies;
    v7->_childProxies = (NSMutableDictionary *)v10;

    -[FPDownloadOperation _setupParentProgress](v7, "_setupParentProgress");
  }

  return v7;
}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  id v5;

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transformItems:handler:", self->_items, &__block_literal_global_6_1);

  -[FPActionOperation stitcher](self, "stitcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flush");

}

void __43__FPDownloadOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "isCloudItem")
    && (!objc_msgSend(v2, "isDownloaded")
     || objc_msgSend(v2, "isFolder") && (objc_msgSend(v2, "isRecursivelyDownloaded") & 1) == 0))
  {
    objc_msgSend(v2, "setDownloaded:", 0);
    objc_msgSend(v2, "setDownloading:", 1);
  }

}

- (id)fp_prettyDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray fp_itemIdentifiers](self->_items, "fp_itemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("download items (%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)actionMain
{
  void *v4;
  FPDownloadInfo *info;
  void *v6;
  _QWORD v7[5];

  -[FPDownloadOperation _recomputeDownloadInfoIfNecessary](self, "_recomputeDownloadInfoIfNecessary");
  if (-[FPActionOperation finishAfterPreflight](self, "finishAfterPreflight")
    && -[FPActionOperation finishAfterPreflight](self, "finishAfterPreflight"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDownloadOperation.m"), 106, CFSTR("operation shouldn't run"));

  }
  -[FPActionOperationInfo setAttachSandboxExtensionsOnXPCEncoding:](self->_info, "setAttachSandboxExtensionsOnXPCEncoding:", 1);
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  info = self->_info;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__FPDownloadOperation_actionMain__block_invoke;
  v7[3] = &unk_1E444CF08;
  v7[4] = self;
  objc_msgSend(v4, "scheduleActionOperationWithInfo:completionHandler:", info, v7);

}

void __33__FPDownloadOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPDownloadOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E444AB48;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

uint64_t __33__FPDownloadOperation_actionMain__block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "completedWithResult:error:", 0);
  else
    return objc_msgSend(v2, "_runWithRemoteOperation:", a1[6]);
}

- (void)_completedWithResultsByRoot:(id)a3 errorsByRoot:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "fp_prettyDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v19;
    _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Remote download operation finished with results:%@; errors:%@; %@",
      (uint8_t *)&v20,
      0x20u);

  }
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[FPDownloadOperation _completedWithResultsByRoot:errorsByRoot:error:].cold.1(self);

  if (v10)
  {
    v14 = v10;
  }
  else
  {
    objc_msgSend(v9, "fp_copyItemKeysUnwrappedAndKeyMap:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fp_map:", &__block_literal_global_20_0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDownloadOperation completedWithResult:error:](self, "completedWithResult:error:", v18, v14);

}

id __70__FPDownloadOperation__completedWithResultsByRoot_errorsByRoot_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isProviderItem"))
  {
    objc_msgSend(v2, "asFPItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)completedWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  FPDownloadOperation *v14;

  v6 = a3;
  v7 = a4;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FPDownloadOperation_completedWithResult_error___block_invoke;
  block[3] = &unk_1E444AB48;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __49__FPDownloadOperation_completedWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)FPDownloadOperation;
  objc_msgSendSuper2(&v6, sel_completedWithResult_error_, v3, v2);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(v4 + 472);
  *(_QWORD *)(v4 + 472) = 0;

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObservation *observation;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_items;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "itemID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPDownloadOperation _removeProgressWithItemID:](self, "_removeProgressWithItemID:", v15);

        objc_msgSend(v14, "providerDomainID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  -[NSObservation finishObserving](self->_observation, "finishObserving");
  observation = self->_observation;
  self->_observation = 0;

  -[FPActionOperation progress](self, "progress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fileTotalCount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation progress](self, "progress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFileCompletedCount:", v19);

  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[FPDownloadOperation finishWithResult:error:].cold.1(self);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v6, 1);
  else
    v22 = 0;
  -[FPActionOperation stitcher](self, "stitcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "finishWithItems:error:", v22, v7);

  -[FPDownloadOperation downloadCompletionBlock](self, "downloadCompletionBlock");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
  {
    (*(void (**)(uint64_t, id, id))(v24 + 16))(v24, v6, v7);
    -[FPDownloadOperation setDownloadCompletionBlock:](self, "setDownloadCompletionBlock:", 0);
  }

  v26.receiver = self;
  v26.super_class = (Class)FPDownloadOperation;
  -[FPActionOperation finishWithResult:error:](&v26, sel_finishWithResult_error_, v6, v7);

}

- (FPDownloadOperation)initWithRemoteOperation:(id)a3 info:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPDownloadOperation;
  return -[FPActionOperation initWithProvider:action:](&v5, sel_initWithProvider_action_, 0, 0);
}

- (void)remoteOperationCompletedRoot:(id)a3 resultingItem:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  FPDownloadOperation *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[FPDownloadOperation remoteOperationCompletedRoot:resultingItem:error:completion:].cold.1((uint64_t)v10, v12, v14);

  v13[2](v13);
  -[FPOperation callbackQueue](self, "callbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__FPDownloadOperation_remoteOperationCompletedRoot_resultingItem_error_completion___block_invoke;
  v17[3] = &unk_1E4449A40;
  v18 = v11;
  v19 = self;
  v16 = v11;
  dispatch_async(v15, v17);

}

void __83__FPDownloadOperation_remoteOperationCompletedRoot_resultingItem_error_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isProviderItem"))
  {
    objc_msgSend(*(id *)(a1 + 32), "asFPItem");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (id)v2;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "removeObject:", v2);
      objc_msgSend(*(id *)(a1 + 40), "_updateProgressWithUpdatedFileCountForItem:", v3);

    }
  }
}

- (void)remoteOperationCreatedRoot:(id)a3 resultingItem:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  uint64_t v9;

  v6 = a3;
  v7 = (void (**)(_QWORD))a5;
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPDownloadOperation remoteOperationCreatedRoot:resultingItem:completion:].cold.1((uint64_t)v6, v8, v9);

  v7[2](v7);
}

- (void)remoteOperationProgressesAreReady
{
  NSObject *v4;
  _QWORD v5[6];

  -[FPOperation callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke;
  v5[3] = &unk_1E44499E8;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[57])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("FPDownloadOperation.m"), 228, CFSTR("operation was not setup propertly"));

    v2 = *(_QWORD **)(a1 + 32);
  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__13;
  v11[4] = __Block_byref_object_dispose__13;
  v12 = 0;
  v4 = (void *)MEMORY[0x1E0CB3800];
  objc_msgSend(v2, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPathWithRootObject:path:", v5, "fractionCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke_30;
  v10[3] = &unk_1E444CF50;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = v13;
  v10[6] = v11;
  objc_msgSend(v6, "addObserverBlock:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 488);
  *(_QWORD *)(v8 + 488) = v7;

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

void __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke_30(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fractionCompleted");
  if (v5 == *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {

    goto LABEL_13;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v2, "timeIntervalSinceDate:");
    if (v6 < 1.0)
    {
      objc_msgSend(*v3, "progress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fractionCompleted");
      if (v8 < 1.0)
      {
        objc_msgSend(*(id *)(a1 + 32), "progress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fractionCompleted");
        v11 = v10;
        v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

        if (v11 >= v12)
          goto LABEL_13;
        goto LABEL_10;
      }

    }
  }

LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fractionCompleted");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke_30_cold_1(v3);

LABEL_13:
}

- (void)_runWithRemoteOperation:(id)a3
{
  uint64_t v4;
  NSXPCProxyCreating *v5;
  NSXPCProxyCreating *remoteMoveOperation;
  NSXPCProxyCreating *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__FPDownloadOperation__runWithRemoteOperation___block_invoke;
  v9[3] = &unk_1E444A598;
  v9[4] = self;
  objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9);
  v5 = (NSXPCProxyCreating *)objc_claimAutoreleasedReturnValue();
  remoteMoveOperation = self->_remoteMoveOperation;
  self->_remoteMoveOperation = v5;

  v7 = self->_remoteMoveOperation;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_3;
  v8[3] = &unk_1E444CF78;
  v8[4] = self;
  -[NSXPCProxyCreating registerFrameworkClient:operationCompletion:](v7, "registerFrameworkClient:operationCompletion:", self, v8);
}

void __47__FPDownloadOperation__runWithRemoteOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_2;
  v6[3] = &unk_1E4449A40;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

void __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_4;
  v14[3] = &unk_1E444A0C0;
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, v14);

}

uint64_t __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithResultsByRoot:errorsByRoot:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_updateProgressWithUpdatedFileCountForItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "itemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDownloadOperation _removeProgressWithItemID:](self, "_removeProgressWithItemID:", v5);

  }
}

- (void)_setupParentProgress
{
  NSObject *v3;
  _QWORD block[5];

  -[FPOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__FPDownloadOperation__setupParentProgress__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(v3, block);

}

void __43__FPDownloadOperation__setupParentProgress__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id obj;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTotalUnitCount:", -1);

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_setFileOperationKind:", *MEMORY[0x1E0CB30B8]);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 448);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        +[FPItemManager defaultManager](FPItemManager, "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __43__FPDownloadOperation__setupParentProgress__block_invoke_2;
        v13[3] = &unk_1E444BD50;
        v11 = *(_QWORD *)(a1 + 32);
        v13[4] = v9;
        v13[5] = v11;
        objc_msgSend(v10, "fetchURLForItem:creatingPlaceholderIfMissing:completionHandler:", v9, 1, v13);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

void __43__FPDownloadOperation__setupParentProgress__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __43__FPDownloadOperation__setupParentProgress__block_invoke_2_cold_1(a1, (uint64_t)v7, v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "setFileURL:", v5);
  v11 = a1 + 32;
  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(v11 + 8);
  objc_msgSend(v9, "documentSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_updateParentProgressForItem:withUnitCount:", v9, v12);

}

- (void)_updateParentProgressForItem:(id)a3 withUnitCount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke(id *a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v2 = a1 + 5;
  v3 = (void *)*((_QWORD *)a1[4] + 62);
  objc_msgSend(a1[5], "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_cold_1(v2, v6);

  }
  else
  {
    location = 0;
    objc_initWeak(&location, a1[4]);
    v7 = a1[4];
    v8 = a1[5];
    v9 = v7[62];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_37;
    v10[3] = &unk_1E444CFA0;
    objc_copyWeak(&v12, &location);
    v11 = a1[6];
    objc_msgSend(v7, "_retrieveChildProgressForItem:childProxies:parentSetup:", v8, v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_2;
    block[3] = &unk_1E444AB48;
    block[4] = v5;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

  }
}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;

  v1 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fp_addChildProgress:withUnitCount:", *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));

  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_2_cold_1((id *)v1, v3);

}

- (void)_removeProgressWithItemID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_childProxies, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopTrackingIfStarted");
  -[NSMutableDictionary removeObjectForKey:](self->_childProxies, "removeObjectForKey:", v4);

}

- (void)_retrieveChildProgressForItem:(id)a3 childProxies:(id)a4 parentSetup:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v10, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setUpdateFileCount:", 1);
  objc_msgSend(v10, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__FPDownloadOperation__retrieveChildProgressForItem_childProxies_parentSetup___block_invoke;
  v16[3] = &unk_1E444CFC8;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v13, "setProgressDidSetupHandler:", v16);
  objc_msgSend(v13, "startTrackingFileURL:kind:allowReadPausedProgressFromDisk:", v12, *MEMORY[0x1E0CB30B8], 0);

}

uint64_t __78__FPDownloadOperation__retrieveChildProgressForItem_childProxies_parentSetup___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)recursively
{
  return self->_recursively;
}

- (void)setRecursively:(BOOL)a3
{
  self->_recursively = a3;
}

- (id)downloadCompletionBlock
{
  return self->_downloadCompletionBlock;
}

- (void)setDownloadCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (id)_t_patchActionOperationInfo
{
  return self->__t_patchActionOperationInfo;
}

- (void)set_t_patchActionOperationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__t_patchActionOperationInfo, 0);
  objc_storeStrong(&self->_downloadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_childProxies, 0);
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_progressByRoot, 0);
  objc_storeStrong((id *)&self->_remoteMoveOperation, 0);
  objc_storeStrong((id *)&self->_itemsPendingDownload, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)_completedWithResultsByRoot:(void *)a1 errorsByRoot:error:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  objc_msgSend(a1, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedAdditionalDescription");
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
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2_4(&dword_1A0A34000, v9, v10, "[DEBUG] download-op progress: %@\n files: %@ / %@\n%@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1_5();
}

- (void)finishWithResult:(void *)a1 error:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  objc_msgSend(a1, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedAdditionalDescription");
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
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2_4(&dword_1A0A34000, v9, v10, "[DEBUG] download-op final progress: %@\n files: %@ / %@\n%@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1_5();
}

- (void)remoteOperationCompletedRoot:(NSObject *)a3 resultingItem:error:completion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Remote root download finished - root:%@; error:%@",
    (uint8_t *)&v6,
    0x16u);

}

- (void)remoteOperationCreatedRoot:(uint64_t)a1 resultingItem:(NSObject *)a2 completion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, a3, "[DEBUG] Remote download root created: %@", (uint8_t *)&v3);
}

void __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke_30_cold_1(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  objc_msgSend(*a1, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedAdditionalDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileCompletedCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileTotalCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2_4(&dword_1A0A34000, v9, v10, "[DEBUG] download-op progress: %@\n files: %@ / %@\n%@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1_5();
}

void __43__FPDownloadOperation__setupParentProgress__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] Error retrieving url for item %@: %@", (uint8_t *)&v4, 0x16u);
}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] download-op already tracking a childProxy for item %@", (uint8_t *)&v5);

}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileCompletedCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileTotalCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v4;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download-op Added childProxy to parent: %@\n %@ / %@ files", (uint8_t *)&v9, 0x20u);

}

@end
