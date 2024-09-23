@implementation FPFetchPublishingURLOperation

- (FPFetchPublishingURLOperation)initWithItem:(id)a3
{
  id v5;
  void *v6;
  FPFetchPublishingURLOperation *v7;
  void *v8;
  uint64_t v9;
  NSOperationQueue *operationQueue;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)FPFetchPublishingURLOperation;
  v7 = -[FPActionOperation initWithItemsOfDifferentProviders:action:](&v13, sel_initWithItemsOfDifferentProviders_action_, v6, 0);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_item, a3);
    v8 = (void *)objc_opt_new();
    -[FPActionOperation setProgress:](v7, "setProgress:", v8);

    v9 = objc_opt_new();
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = (NSOperationQueue *)v9;

    -[FPOperation callbackQueue](v7, "callbackQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v7->_operationQueue, "setUnderlyingQueue:", v11);

    -[FPActionOperation setSetupRemoteOperationService:](v7, "setSetupRemoteOperationService:", 1);
  }

  return v7;
}

- (NSURL)presentedItemURL
{
  return self->_itemURL;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_operationQueue;
}

- (void)presentedItemDidChangeUbiquityAttributes:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSURL *itemURL;
  _QWORD v13[5];

  if ((-[FPFetchPublishingURLOperation isCancelled](self, "isCancelled", a3) & 1) == 0)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[FPFetchPublishingURLOperation presentedItemDidChangeUbiquityAttributes:].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

    -[FPActionOperation itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    itemURL = self->_itemURL;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke;
    v13[3] = &unk_1E444BD00;
    v13[4] = self;
    objc_msgSend(v11, "fetchItemForURL:completionHandler:", itemURL, v13);

  }
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2;
  block[3] = &unk_1E444AB48;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id *v10;
  NSObject *v11;
  uint64_t *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_5(a1, v2, v3, v4, v5, v6, v7, v8);

  v9 = (id *)(a1 + 40);
  if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
  {
    v10 = (id *)(a1 + 48);
    if (*(_QWORD *)(a1 + 48))
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_4((uint64_t)v9, v10, v11);

      objc_msgSend(*v9, "completedWithResult:error:", 0, *v10);
      return;
    }
    v13 = *(void **)(a1 + 32);
    v12 = (uint64_t *)(a1 + 32);
    if (objc_msgSend(v13, "isUploaded"))
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_1((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

      objc_msgSend(*v9, "_tryFetchingSharingURL");
      return;
    }
    if ((objc_msgSend((id)*v12, "isUploading") & 1) == 0)
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_3(v12, v21, v22);

    }
    objc_msgSend((id)*v12, "uploadingError");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_2((id *)v12, v24);

      v25 = *v9;
      objc_msgSend((id)*v12, "uploadingError");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "completedWithResult:error:", 0, v26);

      return;
    }
    if (*((_QWORD *)*v9 + 61))
      return;
    v27 = *v9;
    objc_sync_enter(v27);
    v28 = (void *)*((_QWORD *)*v9 + 60);
    v29 = v28;
    objc_sync_exit(v27);

    objc_msgSend((id)*v12, "uploadingProgress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 && (objc_msgSend(v29, "isIndeterminate") & 1) == 0)
    {
      objc_storeStrong((id *)*v9 + 61, v28);
      objc_msgSend(*v9, "progress");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v33 = v29;
    }
    else
    {
      if (!v30)
      {
LABEL_27:
        if (*((_QWORD *)*v9 + 61))
        {
          objc_msgSend(*v9, "progress");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "startReportingProgress");

        }
        return;
      }
      objc_storeStrong((id *)*v9 + 61, v30);
      objc_msgSend(*v9, "progress");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v33 = v30;
    }
    objc_msgSend(v31, "addChild:", v33);

    goto LABEL_27;
  }
}

- (NSSet)observedPresentedItemUbiquityAttributes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C99B38], *MEMORY[0x1E0C99B48], 0);
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB28A8];
  v7 = (void (**)(id, _QWORD))a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 260, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v6);

  v7[2](v7, 0);
}

- (void)_setupFilePresenterAndWaitForUpload
{
  NSObject *v4;
  void *v5;
  void *v6;
  FPItem *item;
  _QWORD v8[5];

  -[FPOperation callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if ((-[FPFetchPublishingURLOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (self->_isFilePresenter)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPFetchPublishingURLOperation.m"), 168, CFSTR("already a file presenter"));

    }
    -[FPActionOperation itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    item = self->_item;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__FPFetchPublishingURLOperation__setupFilePresenterAndWaitForUpload__block_invoke;
    v8[3] = &unk_1E444C668;
    v8[4] = self;
    objc_msgSend(v6, "fetchURLForItem:completionHandler:", item, v8);

    self->_isFilePresenter = 1;
  }
}

void __68__FPFetchPublishingURLOperation__setupFilePresenterAndWaitForUpload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__FPFetchPublishingURLOperation__setupFilePresenterAndWaitForUpload__block_invoke_2;
  block[3] = &unk_1E444AB48;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __68__FPFetchPublishingURLOperation__setupFilePresenterAndWaitForUpload__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(void);
  void (**v6)(void);

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 40) || (v2 = *(void **)(a1 + 48)) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0);
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 472), v2);
      objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", *(_QWORD *)(a1 + 32));
      v3 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentedItemDidChangeUbiquityAttributes:", v4);

      objc_msgSend(*(id *)(a1 + 32), "_t_filePresenterStarted");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = v5;
        v5[2]();
        objc_msgSend(*(id *)(a1 + 32), "set_t_filePresenterStarted:", 0);
        v5 = v6;
      }

    }
  }
}

- (void)_tryFetchingSharingURL
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  FPFetchPublishingURLOperation *v7;
  _QWORD v8[5];

  -[FPOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem itemID](self->_item, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__FPFetchPublishingURLOperation__tryFetchingSharingURL__block_invoke;
  v8[3] = &unk_1E444C668;
  v8[4] = self;
  objc_msgSend(v4, "fetchPublishingURLForItemID:completionHandler:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_remoteCancellableProgress, v6);
  if (-[FPFetchPublishingURLOperation isCancelled](v7, "isCancelled"))
    -[NSProgress cancel](v7->_remoteCancellableProgress, "cancel");
  objc_sync_exit(v7);

}

void __55__FPFetchPublishingURLOperation__tryFetchingSharingURL__block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __55__FPFetchPublishingURLOperation__tryFetchingSharingURL__block_invoke_2;
  block[3] = &unk_1E444AB48;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

uint64_t __55__FPFetchPublishingURLOperation__tryFetchingSharingURL__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("NSFileProviderErrorDomain"))
    && objc_msgSend(*(id *)(a1 + 32), "code") == -5006)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 456);

    if (!v3)
      return objc_msgSend(*(id *)(a1 + 40), "_setupFilePresenterAndWaitForUpload");
  }
  else
  {

  }
  return objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)cancel
{
  FPFetchPublishingURLOperation *v3;
  NSProgress *remoteCancellableProgress;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPFetchPublishingURLOperation;
  -[FPOperation cancel](&v5, sel_cancel);
  v3 = self;
  objc_sync_enter(v3);
  -[NSProgress cancel](v3->_remoteCancellableProgress, "cancel");
  remoteCancellableProgress = v3->_remoteCancellableProgress;
  v3->_remoteCancellableProgress = 0;

  objc_sync_exit(v3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", self);
  -[FPFetchPublishingURLOperation fetchCompletionBlock](self, "fetchCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[FPFetchPublishingURLOperation setFetchCompletionBlock:](self, "setFetchCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)FPFetchPublishingURLOperation;
  -[FPActionOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (void)setFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (id)_t_filePresenterStarted
{
  return self->__t_filePresenterStarted;
}

- (void)set_t_filePresenterStarted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__t_filePresenterStarted, 0);
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_itemUploadProgress, 0);
  objc_storeStrong((id *)&self->_remoteCancellableProgress, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)presentedItemDidChangeUbiquityAttributes:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] %@ item did change", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] item was successfully uploaded: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "uploadingError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v5, "[ERROR] item failed to upload: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7();
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_3(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, a3, "[ERROR] we're waiting on upload but the item is not uploading: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_4(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 472);
  objc_msgSend(*a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't get updated item for url %@; %@",
    (uint8_t *)&v6,
    0x16u);

  OUTLINED_FUNCTION_7();
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] received updated item %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
