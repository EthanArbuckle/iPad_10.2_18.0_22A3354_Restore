@implementation ATStorePodcastDownloadAssetsOperation

- (id)secureDownloadRenewalManager
{
  PFSecureDownloadRenewalManager *renewalManager;
  void *v4;
  objc_class *v5;
  PFSecureDownloadRenewalManager *v6;
  PFSecureDownloadRenewalManager *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  renewalManager = self->_renewalManager;
  if (!renewalManager)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getPFSecureDownloadRenewalManagerClass_softClass;
    v13 = getPFSecureDownloadRenewalManagerClass_softClass;
    if (!getPFSecureDownloadRenewalManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getPFSecureDownloadRenewalManagerClass_block_invoke;
      v9[3] = &unk_1E927E328;
      v9[4] = &v10;
      __getPFSecureDownloadRenewalManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (PFSecureDownloadRenewalManager *)objc_alloc_init(v5);
    v7 = self->_renewalManager;
    self->_renewalManager = v6;

    renewalManager = self->_renewalManager;
  }
  return renewalManager;
}

- (void)execute
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ATStorePodcastDownloadAssetsOperation *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  ATStorePodcastDownloadAssetsOperation *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryStoreDownloads();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ATStoreDownloadOperation asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreDownloadOperation asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "powerRequired");
    -[ATStoreDownloadOperation asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canUseCellularData");
    -[ATStoreDownloadOperation asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resumeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v30 = self;
    v31 = 2114;
    v32 = v4;
    v33 = 1024;
    v34 = v6;
    v35 = 1024;
    v36 = v8;
    v37 = 1024;
    v38 = v10 != 0;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting download for asset %{public}@. requiresPower=%d, canUseCellularData=%d, hasResumeData=%d", buf, 0x28u);

  }
  -[ATStoreDownloadOperation asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storeInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "redownloadParams");
  v13 = (ATStorePodcastDownloadAssetsOperation *)objc_claimAutoreleasedReturnValue();

  _ATLogCategoryStoreDownloads();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v13;
    _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "Downloading from remote url: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (!-[ATStorePodcastDownloadAssetsOperation isCancelled](self, "isCancelled"))
    {
      v19 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke;
      v27[3] = &unk_1E927E260;
      v27[4] = self;
      v28 = v15;
      v20 = (void *)MEMORY[0x1D8230780](v27);
      objc_msgSend(MEMORY[0x1E0DDC068], "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATStoreDownloadOperation asset](self, "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "totalBytes");
      v25[0] = v19;
      v25[1] = 3221225472;
      v25[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_24;
      v25[3] = &unk_1E927E288;
      v26 = v20;
      v24 = v20;
      objc_msgSend(v21, "ensureStorageIsAvailable:withCompletionHandler:", v23, v25);

      goto LABEL_11;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 2;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 26;
  }
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStorePodcastDownloadAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", v18, 0);

LABEL_11:
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  int *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATStorePodcastDownloadAssetsOperation;
  -[ATStorePodcastDownloadAssetsOperation cancel](&v13, sel_cancel);
  -[ATStorePodcastDownloadAssetsOperation _deleteHLSKey](self, "_deleteHLSKey");
  if (self->_request)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    -[ATStoreDownloadOperation asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "redownloadParams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "pf_isHLSPlaylistObjC");

    _ATLogCategoryStoreDownloads();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling HLS download", v12, 2u);
      }
      v11 = &OBJC_IVAR___ATStorePodcastDownloadAssetsOperation__hlsSession;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling regular, non-HLS download", v12, 2u);
      }
      v11 = &OBJC_IVAR___ATStorePodcastDownloadAssetsOperation__session;
    }

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v11), "cancelRequest:", self->_request);
  }
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  ICURLRequest *request;
  ICAVAssetDownloadURLSession *hlsSession;
  ICURLSession *session;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATStorePodcastDownloadAssetsOperation;
  -[ATStoreDownloadOperation finishWithError:operationResult:](&v8, sel_finishWithError_operationResult_, a3, a4);
  request = self->_request;
  self->_request = 0;

  hlsSession = self->_hlsSession;
  self->_hlsSession = 0;

  session = self->_session;
  self->_session = 0;

}

- (void)_deleteHLSKey
{
  void *v3;
  void *v4;
  ATStorePodcastDownloadAssetsOperation *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  ATStorePodcastDownloadAssetsOperation *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ATStoreDownloadOperation asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adamID");
  v5 = (ATStorePodcastDownloadAssetsOperation *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(getMTStoreIdentifierClass(), "isNotEmptyNumber:", v5))
  {
    objc_msgSend(getMTDBExtensionAccessClass(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isReady");

    _ATLogCategoryStoreDownloads();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "Deleting HLS secure key for asset with adam ID %@", (uint8_t *)&v11, 0xCu);
      }

      -[ATStorePodcastDownloadAssetsOperation secureDownloadRenewalManager](self, "secureDownloadRenewalManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestSecureDeletionOfEpisodeWithAdamID:", -[ATStorePodcastDownloadAssetsOperation longLongValue](v5, "longLongValue"));
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = 138543362;
        v12 = self;
        _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Cannot open Podcasts DB. Will not enqueue assets to sync.", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(getMTDBExtensionAccessClass(), "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attemptToFix");
    }

  }
}

- (id)_icavUrlSession
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("com.apple.airtraffic.ATPodcastEpisodeDownloadOperation.HLS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreDownloadOperation asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "powerRequired");

  if (v5)
    objc_msgSend(v3, "appendString:", CFSTR(".power"));
  -[ATStoreDownloadOperation asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canUseCellularData");

  if ((v7 & 1) == 0)
    objc_msgSend(v3, "appendString:", CFSTR(".wifi"));
  objc_msgSend(MEMORY[0x1E0DDC0F0], "sharedSessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__ATStorePodcastDownloadAssetsOperation__icavUrlSession__block_invoke;
  v12[3] = &unk_1E927E2B0;
  v12[4] = self;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v8, "sessionWithIdentifier:creationBlock:", v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_urlSession
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("com.apple.airtraffic.ATPodcastEpisodeDownloadOperation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreDownloadOperation asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "powerRequired");

  if (v5)
    objc_msgSend(v3, "appendString:", CFSTR(".power"));
  -[ATStoreDownloadOperation asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canUseCellularData");

  if ((v7 & 1) == 0)
    objc_msgSend(v3, "appendString:", CFSTR(".wifi"));
  objc_msgSend(MEMORY[0x1E0DDC0F0], "sharedSessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__ATStorePodcastDownloadAssetsOperation__urlSession__block_invoke;
  v12[3] = &unk_1E927E2B0;
  v12[4] = self;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v8, "sessionWithIdentifier:creationBlock:", v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_getContentKeyForAssetWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  AVURLAsset *hlsAsset;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ATStorePodcastDownloadAssetsOperation *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v5 = (void *)getIMAVSecureKeyLoaderClass_softClass;
  v27 = getIMAVSecureKeyLoaderClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getIMAVSecureKeyLoaderClass_softClass)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __getIMAVSecureKeyLoaderClass_block_invoke;
    v22 = &unk_1E927E328;
    v23 = &v24;
    __getIMAVSecureKeyLoaderClass_block_invoke((uint64_t)&v19);
    v5 = (void *)v25[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v24, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initWithRecipient:useCase:account:urlProtocolDelegate:", self->_hlsAsset, 1, 0, 0);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v9 = (void *)getPFMediaItemMetadataLoaderClass_softClass;
  v27 = getPFMediaItemMetadataLoaderClass_softClass;
  if (!getPFMediaItemMetadataLoaderClass_softClass)
  {
    v19 = v6;
    v20 = 3221225472;
    v21 = __getPFMediaItemMetadataLoaderClass_block_invoke;
    v22 = &unk_1E927E328;
    v23 = &v24;
    __getPFMediaItemMetadataLoaderClass_block_invoke((uint64_t)&v19);
    v9 = (void *)v25[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v24, 8);
  v11 = objc_alloc_init(v10);
  hlsAsset = self->_hlsAsset;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __85__ATStorePodcastDownloadAssetsOperation__getContentKeyForAssetWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E927E300;
  v17 = self;
  v18 = v4;
  v16 = v8;
  v13 = v8;
  v14 = v4;
  objc_msgSend(v11, "keyIdentifiersFromAsset:completion:", hlsAsset, v15);

}

- (id)_downloadConfigurationWithSessionIdentifier:(id)a3 isHLS:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v6 = a3;
  if (a4)
    objc_msgSend(MEMORY[0x1E0CB39F8], "backgroundSessionConfigurationWithIdentifier:", v6);
  else
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreDownloadOperation asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsCellularAccess:", objc_msgSend(v8, "canUseCellularData"));

  objc_msgSend(v7, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v7, "setHTTPShouldSetCookies:", 0);
  objc_msgSend(v7, "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isWatch");

  if (v10)
  {
    objc_msgSend(v7, "set_prefersInfraWiFi:", 1);
    objc_msgSend(v7, "set_companionProxyPreference:", 2);
  }

  return v7;
}

- (void)_moveAssetToPurchasesDirectoryFromTmpPath:(id)a3 downloadError:(id)a4 isHLSAsset:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  const __CFString *v24;
  ATStoreDownloadOperationResult *v25;
  ATStoreDownloadOperationResult *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  uint8_t buf[4];
  ATStorePodcastDownloadAssetsOperation *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ATStoreDownloadOperation asset](self, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProtectionType:", 1);

  -[ATStoreDownloadOperation asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = CFSTR("movpkg");
  }
  else
  {
    objc_msgSend(v8, "pathExtension");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_5;
  }
  objc_msgSend(v12, "stringByAppendingPathExtension:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v14;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0D51270], "pathForBaseLocationPath:", 400);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, 0);

  objc_msgSend(v15, "stringByAppendingPathComponent:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeItemAtPath:error:", v17, 0);

  v28 = v5;
  if (v5)
  {
    objc_msgSend(v8, "stringByAppendingPathExtension:", v13);
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v19;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  v21 = objc_msgSend(v20, "moveItemAtPath:toPath:error:", v8, v17, &v29);
  v22 = v29;

  if ((v21 & 1) == 0)
  {
    _ATLogCategoryStoreDownloads();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = &stru_1E927E4E0;
      *(_DWORD *)buf = 138544386;
      v31 = self;
      v32 = 2114;
      if (v28)
        v24 = CFSTR("HLS");
      v33 = v24;
      v34 = 2114;
      v35 = v8;
      v36 = 2114;
      v37 = v17;
      v38 = 2114;
      v39 = v22;
      _os_log_impl(&dword_1D1868000, v23, OS_LOG_TYPE_ERROR, "%{public}@ failed to rename %{public}@ downloaded file from %{public}@ --> %{public}@. err=%{public}@", buf, 0x34u);
    }

  }
  v25 = objc_alloc_init(ATStoreDownloadOperationResult);
  v26 = v25;
  if (v22)
    v27 = 0;
  else
    v27 = v17;
  -[ATStoreDownloadOperationResult setDownloadFilePath:](v25, "setDownloadFilePath:", v27);
  -[ATStorePodcastDownloadAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", v22, v26);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renewalManager, 0);
  objc_storeStrong((id *)&self->_hlsAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_hlsSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __85__ATStorePodcastDownloadAssetsOperation__getContentKeyForAssetWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[16];

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      _ATLogCategoryStoreDownloads();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected number of keyUris found in asset metadata. Continuing with first keyUri", buf, 2u);
      }

    }
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adamID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__ATStorePodcastDownloadAssetsOperation__getContentKeyForAssetWithCompletionHandler___block_invoke_45;
    v15[3] = &unk_1E927E2D8;
    v12 = *(void **)(a1 + 48);
    v15[4] = *(_QWORD *)(a1 + 40);
    v16 = v12;
    objc_msgSend(v5, "startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:", v6, v11, 0, v15);

  }
  else
  {
    _ATLogCategoryStoreDownloads();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_ERROR, "Downloading unprotected HLS content with an adamId is not supported", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 26, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __85__ATStorePodcastDownloadAssetsOperation__getContentKeyForAssetWithCompletionHandler___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ATLogCategoryStoreDownloads();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "storeInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "adamID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v8;
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "Attempt to load key for episode asset with adam id: %@ failed with err=%{public}@", (uint8_t *)&v14, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 25, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "storeInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "adamID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "Attempt to load key for episode asset with adam id: %@ succeeded", (uint8_t *)&v14, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

id __52__ATStorePodcastDownloadAssetsOperation__urlSession__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DDC0E8]);
  objc_msgSend(*(id *)(a1 + 32), "_downloadConfigurationWithSessionIdentifier:isHLS:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithConfiguration:", v3);

  return v4;
}

id __56__ATStorePodcastDownloadAssetsOperation__icavUrlSession__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DDBED0]);
  objc_msgSend(*(id *)(a1 + 32), "_downloadConfigurationWithSessionIdentifier:isHLS:", *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithConfiguration:", v3);

  return v4;
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  id MTStoreIdentifierClass;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  _QWORD v69[5];
  id v70;
  char v71;
  _QWORD v72[5];
  id v73;
  char v74;
  _QWORD v75[4];
  id v76;
  id v77;
  BOOL v78;
  uint64_t v79;
  void *v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  unint64_t v84;
  __int16 v85;
  uint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "totalBytes");

  if (v5 <= a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
      v67 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishWithError:operationResult:");

      return;
    }
    ICBundleIdentifierForSystemApplicationType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DDBEF8], "defaultInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "setRequestingBundleIdentifier:", v12);
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "canUseCellularData"))
    {
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (unint64_t)objc_msgSend(v16, "totalBytes") >> 21 < 0x19;

    }
    else
    {
      v17 = 0;
    }

    v18 = objc_alloc(MEMORY[0x1E0DDC048]);
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_7;
    v75[3] = &unk_1E927E1E8;
    v19 = v12;
    v76 = v19;
    v78 = v17;
    v20 = v14;
    v77 = v20;
    v21 = objc_msgSend(v18, "initWithBlock:", v75);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0D8]), "initWithURL:requestContext:resumeData:", *(_QWORD *)(a1 + 40), v21, 0);
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 344);
    *(_QWORD *)(v23 + 344) = v22;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "pathExtension");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(*(id *)(a1 + 40), "pf_isHLSPlaylistObjC");
    v29 = v28;
    v66 = v20;
    v68 = v19;
    v64 = (void *)v27;
    v65 = (void *)v21;
    if (v27 && (v28 & 1) == 0)
    {
      objc_msgSend(v26, "stringByAppendingPathExtension:", v27);
      v30 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v30;
    }
    +[ATStoreDownloadService downloadDirectoryPath](ATStoreDownloadService, "downloadDirectoryPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByAppendingPathComponent:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v31, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeItemAtPath:error:", v32, 0);

    _ATLogCategoryStoreDownloads();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v82 = v36;
      v83 = 2114;
      v84 = (unint64_t)v32;
      _os_log_impl(&dword_1D1868000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading to temporary file path '%{public}@'", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "progress");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "progress");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addChild:withPendingUnitCount:", v38, 100);

    if (v29)
    {
      v39 = v17;
      MTStoreIdentifierClass = getMTStoreIdentifierClass();
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "storeInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "adamID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(MTStoreIdentifierClass) = objc_msgSend(MTStoreIdentifierClass, "isEmptyNumber:", v43);

      if ((_DWORD)MTStoreIdentifierClass)
      {
        _ATLogCategoryStoreDownloads();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1868000, v44, OS_LOG_TYPE_ERROR, "Can't download HLS content for episode without an adam id", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 26, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v45, 0);

        goto LABEL_25;
      }
      v56 = objc_alloc(MEMORY[0x1E0C8B3C0]);
      v57 = *(_QWORD *)(a1 + 40);
      v79 = *MEMORY[0x1E0C8AD38];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v56, "initWithURL:options:", v57, v59);
      v61 = *(_QWORD *)(a1 + 32);
      v62 = *(void **)(v61 + 352);
      *(_QWORD *)(v61 + 352) = v60;

      v63 = *(void **)(a1 + 32);
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_17;
      v72[3] = &unk_1E927E238;
      v72[4] = v63;
      v73 = v32;
      v74 = v29;
      objc_msgSend(v63, "_getContentKeyForAssetWithCompletionHandler:", v72);
      v55 = v73;
    }
    else
    {
      _ATLogCategoryStoreDownloads();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "asset");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v82 = v47;
        _os_log_impl(&dword_1D1868000, v46, OS_LOG_TYPE_DEFAULT, "Downloading regular URL asset: %@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_urlSession");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = *(_QWORD *)(a1 + 32);
      v50 = *(void **)(v49 + 328);
      *(_QWORD *)(v49 + 328) = v48;

      v51 = *(_QWORD *)(a1 + 32);
      v52 = *(void **)(v51 + 328);
      v53 = *(_QWORD *)(v51 + 344);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v32, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_21;
      v69[3] = &unk_1E927E210;
      v69[4] = *(_QWORD *)(a1 + 32);
      v70 = v32;
      v71 = 0;
      objc_msgSend(v52, "enqueueDownloadRequest:toDestination:withCompletionHandler:", v53, v54, v69);

      v55 = v70;
    }

LABEL_25:
    return;
  }
  _ATLogCategoryStoreDownloads();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v82 = v7;
    v83 = 2048;
    v84 = a2;
    v85 = 2048;
    v86 = objc_msgSend(v8, "totalBytes");
    _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_ERROR, "%{public}@ not enough free space available for download. available=%lld, needed=%lld", buf, 0x20u);

  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 14, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishWithError:operationResult:", v10, 0);

}

uint64_t __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_7(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0DDC010];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setShouldAllowDataForCellularNetworkTypes:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v4, "setNetworkConstraints:", v5);
  objc_msgSend(v4, "setClientInfo:", *(_QWORD *)(a1 + 40));

}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  char v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ATLogCategoryStoreDownloads();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v3;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "Content key could not be acquired, returning early due to error: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_deleteHLSKey");
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v3, 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "Content key successfully acquired, proceeding with HLS download", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_icavUrlSession");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 336);
    *(_QWORD *)(v7 + 336) = v6;

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 336);
    v11 = *(_QWORD *)(v9 + 344);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(a1 + 40), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(v13 + 352);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_18;
    v16[3] = &unk_1E927E210;
    v16[1] = 3221225472;
    v16[4] = v13;
    v17 = v14;
    v18 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v10, "enqueueAggregateAssetDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:", v11, v12, v15, 0, v16);

  }
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryStoreDownloads();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ download complete. err=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v7, "finishWithError:operationResult:", v4, 0);

  }
  else if (objc_msgSend(v7, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_moveAssetToPurchasesDirectoryFromTmpPath:downloadError:isHLSAsset:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48));
  }
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryStoreDownloads();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ download complete. err=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v7, "_deleteHLSKey");
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v4, 0);
  }
  else
  {
    if (!objc_msgSend(v7, "isCancelled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_moveAssetToPurchasesDirectoryFromTmpPath:downloadError:isHLSAsset:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48));
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_deleteHLSKey");
  }

}

@end
