@implementation ATStoreDownloadOperation

- (ATStoreDownloadOperation)initWithAsset:(id)a3
{
  id v5;
  ATStoreDownloadOperation *v6;
  ATStoreDownloadOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATStoreDownloadOperation;
  v6 = -[ICRequestOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    if (objc_msgSend(v5, "isPrioritized"))
      -[ATStoreDownloadOperation setQueuePriority:](v7, "setQueuePriority:", 8);
  }

  return v7;
}

- (void)performOnOperationQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__ATStoreDownloadOperation_performOnOperationQueue_completion___block_invoke;
  v8[3] = &unk_1E927E2D8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ICRequestOperation performRequestOnOperationQueue:withCompletionHandler:](self, "performRequestOnOperationQueue:withCompletionHandler:", a3, v8);

}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  ATStoreDownloadOperation *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "at_ATErrorFromError:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ATLogCategoryStoreDownloads();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v14 = self;
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ finished. err=%{public}@, result=%{public}@", buf, 0x20u);
  }

  -[ATStoreDownloadOperation set_operationResult:](self, "set_operationResult:", v7);
  if (!v8)
  {
    -[ICRequestOperation progress](self, "progress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRequestOperation progress](self, "progress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v11, "totalUnitCount"));

  }
  v12.receiver = self;
  v12.super_class = (Class)ATStoreDownloadOperation;
  -[ICRequestOperation finishWithError:](&v12, sel_finishWithError_, v8);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)ATStoreDownloadOperation;
  -[ATStoreDownloadOperation description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreDownloadOperation asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreDownloadOperation asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prettyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@ : %@)"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ATAsset)asset
{
  return self->_asset;
}

- (ATStoreDownloadOperationResult)_operationResult
{
  return self->__operationResult;
}

- (void)set_operationResult:(id)a3
{
  self->__operationResult = (ATStoreDownloadOperationResult *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

void __63__ATStoreDownloadOperation_performOnOperationQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "_operationResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v4, v5);

}

@end
