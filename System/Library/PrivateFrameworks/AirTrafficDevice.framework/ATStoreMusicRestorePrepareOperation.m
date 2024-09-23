@implementation ATStoreMusicRestorePrepareOperation

- (void)execute
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ICMusicRestoreRequest *v32;
  ICMusicRestoreRequest *restoreRequest;
  void *v34;
  void *v35;
  ICMusicRestoreRequest *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  uint8_t buf[4];
  ATStoreMusicRestorePrepareOperation *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __46__ATStoreMusicRestorePrepareOperation_execute__block_invoke;
  v47[3] = &unk_1E927DDC0;
  v47[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithBlock:", v47);
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v5, "getPropertiesForUserIdentity:error:", v6, &v46);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v46;

  if (v8 | v7)
  {
    if (-[ATStoreMusicRestorePrepareOperation isCancelled](self, "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATStoreMusicRestorePrepareOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", v9, 0);

      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7400, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    _ATLogCategoryStoreDownloads();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v49 = self;
      v50 = 2114;
      v51 = v8;
      _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not get properties for active account - error %{public}@.", buf, 0x16u);
    }

    -[ATStoreMusicRestorePrepareOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", v8, 0);
  }
  else
  {
    v42 = v7;
    v43 = v4;
    objc_msgSend((id)v7, "storefrontIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    -[ATStoreDownloadOperation asset](self, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "storeInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "flavor");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("HQ");
    if (v13)
      v15 = (__CFString *)v13;
    v41 = v15;

    -[ATStoreDownloadOperation asset](self, "asset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "storePID");

    if (!v17)
    {
      -[ATStoreDownloadOperation asset](self, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "storeInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "adamID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v20, "longLongValue");

      if (v17 <= 0)
      {
        -[ATStoreDownloadOperation asset](self, "asset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "storeInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sagaID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "longLongValue");

        v17 = v24 & ~(v24 >> 63);
      }
    }
    v37 = objc_alloc(MEMORY[0x1E0DDBFC0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreDownloadOperation asset](self, "asset");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "prettyName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreDownloadOperation asset](self, "asset");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "storeInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "DSID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreDownloadOperation asset](self, "asset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "storeInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "matchStatus");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "initWithItemID:title:storeFrontID:mediaKind:accountID:matchStatus:flavor:", v25, v26, v8, CFSTR("song"), v28, v31, v41);

    v4 = v43;
    v32 = (ICMusicRestoreRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBFB8]), "initWithRequestContext:parameters:", v43, v38);
    restoreRequest = self->_restoreRequest;
    self->_restoreRequest = v32;

    -[ICRequestOperation progress](self, "progress");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicRestoreRequest progress](self->_restoreRequest, "progress");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addChild:withPendingUnitCount:", v35, 100);

    v36 = self->_restoreRequest;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __46__ATStoreMusicRestorePrepareOperation_execute__block_invoke_53;
    v44[3] = &unk_1E927DE38;
    v44[4] = self;
    v45 = v43;
    -[ICMusicRestoreRequest performRestoreRequestWithCompletionHandler:](v36, "performRestoreRequestWithCompletionHandler:", v44);

    v7 = v42;
  }
LABEL_15:

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATStoreMusicRestorePrepareOperation;
  -[ATStoreMusicRestorePrepareOperation cancel](&v3, sel_cancel);
  -[ICMusicRestoreRequest cancel](self->_restoreRequest, "cancel");
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  ICMusicRestoreRequest *restoreRequest;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if (-[ATStoreMusicRestorePrepareOperation isCancelled](self, "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ATStoreMusicRestorePrepareOperation;
  -[ATStoreDownloadOperation finishWithError:operationResult:](&v11, sel_finishWithError_operationResult_, v9, v7);
  restoreRequest = self->_restoreRequest;
  self->_restoreRequest = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreRequest, 0);
}

void __46__ATStoreMusicRestorePrepareOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentity:", v4);

  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentityStore:", v5);

  objc_msgSend(MEMORY[0x1E0DDBEF8], "defaultInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setRequestingBundleIdentifier:", CFSTR("com.apple.atc"));
  objc_msgSend(v7, "setProcessName:", CFSTR("atc"));
  objc_msgSend(v7, "setClientIdentifier:", CFSTR("atc"));
  objc_msgSend(v7, "setClientVersion:", CFSTR("1.0"));
  objc_msgSend(v3, "setClientInfo:", v7);
  objc_msgSend(MEMORY[0x1E0DDBF58], "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDeviceSetupComplete");

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isForeground"))
      v11 = 2;
    else
      v11 = 1;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0B0]), "initWithUserInteractionLevel:", v11);
    objc_msgSend(v3, "setAuthenticationProvider:", v12);
    v13 = objc_alloc_init(MEMORY[0x1E0DDC080]);
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsHandlingNonAuthenticationDialogs:", objc_msgSend(v14, "isForeground"));

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC078]), "initWithConfiguration:", v13);
    objc_msgSend(v3, "setStoreDialogResponseHandler:", v15);

  }
  _ATLogCategoryStoreDownloads();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v17, "asset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v17;
    v23 = 2114;
    v24 = v18;
    v25 = 1024;
    v26 = v9;
    _os_log_impl(&dword_1D1868000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ starting restore for asset %{public}@, setupCompleted=%{BOOL}u", (uint8_t *)&v21, 0x1Cu);

  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC010]), "initWithBundleIdentifier:", CFSTR("com.apple.atc"));
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShouldAllowDataForCellularNetworkTypes:", objc_msgSend(v20, "canUseCellularData"));

  objc_msgSend(v3, "setNetworkConstraints:", v19);
}

void __46__ATStoreMusicRestorePrepareOperation_execute__block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  ATStoreDownloadOperationResult *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ATLogCategoryStoreDownloads();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v16 = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished restore request with error %{public}@.", (uint8_t *)&v16, 0x16u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "isCancelled"))
  {
    objc_msgSend(v5, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DDBD38]))
        v13 = objc_msgSend(v6, "code") == -7403;
      else
        v13 = 0;

      v14 = objc_alloc_init(ATStoreDownloadOperationResult);
      if (v13)
      {
        v15 = 1;
LABEL_14:
        -[ATStoreDownloadOperationResult setCancelAllRemaining:](v14, "setCancelAllRemaining:", v15);
        -[ATStoreDownloadOperationResult setStoreMediaResponseItem:](v14, "setStoreMediaResponseItem:", v10);
        -[ATStoreDownloadOperationResult setRequestContext:](v14, "setRequestContext:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v6, v14);

        goto LABEL_15;
      }
    }
    else
    {
      v14 = objc_alloc_init(ATStoreDownloadOperationResult);
    }
    v15 = objc_msgSend(v5, "shouldCancelPurchaseBatch");
    goto LABEL_14;
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishWithError:operationResult:", v10, 0);
LABEL_15:

}

@end
