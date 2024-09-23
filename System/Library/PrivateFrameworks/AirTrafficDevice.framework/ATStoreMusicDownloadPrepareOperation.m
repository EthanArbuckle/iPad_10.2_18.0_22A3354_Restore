@implementation ATStoreMusicDownloadPrepareOperation

- (void)execute
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  ICMediaRedownloadRequest *v19;
  ICMediaRedownloadRequest *redownloadRequest;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  ICMediaRedownloadRequest *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  ICMediaRedownloadRequest *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  NSObject *v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  ICMediaRedownloadRequest *v49;
  _QWORD v50[5];
  id v51;
  uint64_t v52;
  _QWORD v53[5];
  _QWORD v54[5];
  uint8_t buf[4];
  ATStoreMusicDownloadPrepareOperation *v56;
  __int16 v57;
  _BYTE v58[10];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryStoreDownloads();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ATStoreDownloadOperation asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v56 = self;
    v57 = 2114;
    *(_QWORD *)v58 = v4;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting prepare phase for asset %{public}@", buf, 0x16u);

  }
  v5 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  v6 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke;
  v54[3] = &unk_1E927DDC0;
  v54[4] = self;
  v7 = (void *)objc_msgSend(v5, "initWithBlock:", v54);
  -[ATStoreDownloadOperation asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "endpointType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  switch(v11)
  {
    case 0:
      objc_msgSend(v9, "sagaID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "unsignedLongLongValue"))
      {
        objc_msgSend(v9, "redownloadParams");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (v14)
          goto LABEL_6;
      }
      else
      {

      }
      objc_msgSend(v9, "adamID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "unsignedLongLongValue"))
      {
        v11 = 0;
        goto LABEL_19;
      }
      objc_msgSend(v9, "redownloadParams");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (v27)
        goto LABEL_15;
      v11 = 0;
      break;
    case 1:
LABEL_15:
      _ATLogCategoryStoreDownloads();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "redownloadParams");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = self;
        v57 = 2114;
        *(_QWORD *)v58 = v29;
        _os_log_impl(&dword_1D1868000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ performing purchase redownload. redownloadParams=%{public}@", buf, 0x16u);

      }
      v30 = objc_alloc(MEMORY[0x1E0DDC038]);
      objc_msgSend(v9, "redownloadParams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (ICMediaRedownloadRequest *)objc_msgSend(v30, "initWithRequestContext:redownloadParametersString:", v7, v18);
      redownloadRequest = self->_redownloadRequest;
      self->_redownloadRequest = v31;
      v11 = 1;
      goto LABEL_18;
    case 2:
LABEL_6:
      _ATLogCategoryStoreDownloads();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "redownloadParams");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = self;
        v57 = 2114;
        *(_QWORD *)v58 = v16;
        _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ performing match redownload. redownloadParams=%{public}@", buf, 0x16u);

      }
      v17 = objc_alloc(MEMORY[0x1E0DDBF80]);
      objc_msgSend(v9, "redownloadParams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (ICMediaRedownloadRequest *)objc_msgSend(v17, "initWithRequestContext:redownloadParametersString:", v7, v18);
      redownloadRequest = self->_redownloadRequest;
      self->_redownloadRequest = v19;
      v11 = 2;
      goto LABEL_18;
    case 3:
      _ATLogCategoryStoreDownloads();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "adamID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedLongLongValue");
        *(_DWORD *)buf = 138543618;
        v56 = self;
        v57 = 2048;
        *(_QWORD *)v58 = v23;
        _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ performing subscription redownload. subscriptionItemID=%lld", buf, 0x16u);

      }
      v24 = objc_alloc(MEMORY[0x1E0DDC0C0]);
      objc_msgSend(v9, "adamID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (ICMediaRedownloadRequest *)objc_msgSend(v24, "initWithRequestContext:subscriptionItemID:", v7, objc_msgSend(v18, "unsignedLongLongValue"));
      redownloadRequest = self->_redownloadRequest;
      self->_redownloadRequest = v25;
      v11 = 3;
LABEL_18:

LABEL_19:
      break;
    default:
      break;
  }
  if (!self->_redownloadRequest)
  {
    _ATLogCategoryStoreDownloads();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v56 = self;
      v57 = 2048;
      *(_QWORD *)v58 = v11;
      _os_log_impl(&dword_1D1868000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ unsupported endpoint type %ld", buf, 0x16u);
    }

    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = 21;
    goto LABEL_26;
  }
  if (-[ATStoreMusicDownloadPrepareOperation isCancelled](self, "isCancelled"))
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = 2;
LABEL_26:
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v33, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreMusicDownloadPrepareOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", v35, 0);
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("com.apple.AirTraffic.ATStoreMusicDownloadPrepareOperation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreDownloadOperation asset](self, "asset");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "canUseCellularData");

  if ((v37 & 1) == 0)
    objc_msgSend(v35, "appendString:", CFSTR(".wifi"));
  -[ATStoreDownloadOperation asset](self, "asset");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "canProxyUseCellularData");

  if ((v39 & 1) == 0)
    objc_msgSend(v35, "appendString:", CFSTR(".proxywifi"));
  _ATLogCategoryStoreDownloads();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    -[ATStoreDownloadOperation asset](self, "asset");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "canUseCellularData");
    -[ATStoreDownloadOperation asset](self, "asset");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "canProxyUseCellularData");
    *(_DWORD *)buf = 138543874;
    v56 = self;
    v57 = 1024;
    *(_DWORD *)v58 = v42;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = v44;
    _os_log_impl(&dword_1D1868000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ creating url session with constraints: canUseCellularData:%{BOOL}u, canProxyUseCellularData:%{BOOL}u, ", buf, 0x18u);

    v6 = MEMORY[0x1E0C809B0];
  }

  objc_msgSend(MEMORY[0x1E0DDC0F0], "sharedSessionManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v6;
  v53[1] = 3221225472;
  v53[2] = __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke_23;
  v53[3] = &unk_1E927DDE8;
  v53[4] = self;
  objc_msgSend(v45, "sessionWithIdentifier:creationBlock:", v35, v53);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICMediaRedownloadRequest setUrlSession:](self->_redownloadRequest, "setUrlSession:", v46);
  -[ICRequestOperation progress](self, "progress");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMediaRedownloadRequest progress](self->_redownloadRequest, "progress");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addChild:withPendingUnitCount:", v48, 100);

  v49 = self->_redownloadRequest;
  v50[0] = v6;
  v50[1] = 3221225472;
  v50[2] = __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke_2;
  v50[3] = &unk_1E927DE10;
  v50[4] = self;
  v52 = v11;
  v51 = v7;
  -[ICMediaRedownloadRequest performRequestWithResponseHandler:](v49, "performRequestWithResponseHandler:", v50);

LABEL_34:
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATStoreMusicDownloadPrepareOperation;
  -[ATStoreMusicDownloadPrepareOperation cancel](&v3, sel_cancel);
  -[ICMediaRedownloadRequest cancel](self->_redownloadRequest, "cancel");
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  ICMediaRedownloadRequest *redownloadRequest;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATStoreMusicDownloadPrepareOperation;
  -[ATStoreDownloadOperation finishWithError:operationResult:](&v6, sel_finishWithError_operationResult_, a3, a4);
  redownloadRequest = self->_redownloadRequest;
  self->_redownloadRequest = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redownloadRequest, 0);
}

void __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIdentity:", v3);

  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIdentityStore:", v4);

  ICBundleIdentifierForSystemApplicationType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDBEF8], "defaultInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setRequestingBundleIdentifier:", v5);
  objc_msgSend(v15, "setClientInfo:", v7);
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isForeground") & 1) != 0)
  {
    v9 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isWatch"))
      v9 = 5;
    else
      v9 = 1;

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0B0]), "initWithUserInteractionLevel:", v9);
  objc_msgSend(v15, "setAuthenticationProvider:", v11);
  v12 = objc_alloc_init(MEMORY[0x1E0DDC080]);
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowsHandlingNonAuthenticationDialogs:", objc_msgSend(v13, "isForeground"));

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC078]), "initWithConfiguration:", v12);
  objc_msgSend(v15, "setStoreDialogResponseHandler:", v14);

}

id __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke_23(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  int v9;

  objc_msgSend(MEMORY[0x1E0CB39F8], "ic_defaultSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isWatch"))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canUseCellularData"))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canProxyUseCellularData");

  if (v9)
  {
    objc_msgSend(v2, "set_allowsWCA:", 0);
    goto LABEL_6;
  }
LABEL_5:
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsCellularAccess:", objc_msgSend(v5, "canUseCellularData"));

LABEL_6:
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0E8]), "initWithConfiguration:", v2);

  return v6;
}

void __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  ATStoreDownloadOperationResult *v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled")
    && (objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0),
        (v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    v11 = 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 48) == 3)
    {
      objc_msgSend(MEMORY[0x1E0DDBF48], "standardDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "shouldForceStreamingOnlyKeysForPlayback");

      if (v13)
      {
        _ATLogCategoryStoreDownloads();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 32);
          v23 = 138543362;
          v24 = v15;
          _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Resetting default to force streaming-only playback keys now that we have completed a redownload request successfully", (uint8_t *)&v23, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0DDBF48], "standardDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setShouldForceStreamingOnlyKeysForPlayback:", 0);

      }
    }
    v10 = 0;
    v11 = 1;
  }
  objc_msgSend(v7, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v19 = objc_alloc_init(ATStoreDownloadOperationResult);
LABEL_18:
    v22 = objc_msgSend(v7, "shouldCancelPurchaseBatch");
    goto LABEL_19;
  }
  objc_msgSend(v10, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0DDBD38]))
    v21 = objc_msgSend(v10, "code") == -7403;
  else
    v21 = 0;

  v19 = objc_alloc_init(ATStoreDownloadOperationResult);
  if (!v21)
    goto LABEL_18;
  v22 = 1;
LABEL_19:
  -[ATStoreDownloadOperationResult setCancelAllRemaining:](v19, "setCancelAllRemaining:", v22);
  -[ATStoreDownloadOperationResult setStoreMediaResponseItem:](v19, "setStoreMediaResponseItem:", v18);
  -[ATStoreDownloadOperationResult setRequestContext:](v19, "setRequestContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v10, v19);

}

@end
