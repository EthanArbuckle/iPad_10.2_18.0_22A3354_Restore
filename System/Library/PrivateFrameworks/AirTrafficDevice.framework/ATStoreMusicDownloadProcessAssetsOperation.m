@implementation ATStoreMusicDownloadProcessAssetsOperation

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  ATStoreMusicDownloadProcessAssetsOperation *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[ATStoreMusicDownloadProcessAssetsOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[ATStoreMusicDownloadProcessAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:");

  }
  else
  {
    -[ATStoreDownloadOperation asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreDownloadProcessAssetsOperation assetsOperationResult](self, "assetsOperationResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATStoreDownloadProcessAssetsOperation assetsOperationResult](self, "assetsOperationResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storeMediaResponseItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "downloadableAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ATLogCategoryStoreDownloads();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v3;
      _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ starting process assets phase for asset %{public}@", buf, 0x16u);
    }

    -[ATStoreDownloadProcessAssetsOperation assetsOperationResult](self, "assetsOperationResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isHLSDownload");

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__ATStoreMusicDownloadProcessAssetsOperation_execute__block_invoke;
    v17[3] = &unk_1E927DEB0;
    v17[4] = self;
    v18 = v3;
    v22 = v11;
    v19 = v8;
    v20 = v7;
    v21 = v5;
    v12 = v5;
    v13 = v7;
    v14 = v8;
    v15 = v3;
    -[ATStoreMusicDownloadProcessAssetsOperation _removeDRMFromDownloadedAssetWithCompletion:](self, "_removeDRMFromDownloadedAssetWithCompletion:", v17);

  }
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATStoreMusicDownloadProcessAssetsOperation;
  -[ATStoreMusicDownloadProcessAssetsOperation cancel](&v3, sel_cancel);
  -[ICSongDownloadDoneRequest cancel](self->_downloadDoneRequest, "cancel");
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  ICSongDownloadDoneRequest *downloadDoneRequest;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if (-[ATStoreMusicDownloadProcessAssetsOperation isCancelled](self, "isCancelled"))
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
  v11.super_class = (Class)ATStoreMusicDownloadProcessAssetsOperation;
  -[ATStoreDownloadOperation finishWithError:operationResult:](&v11, sel_finishWithError_operationResult_, v9, v7);
  downloadDoneRequest = self->_downloadDoneRequest;
  self->_downloadDoneRequest = 0;

}

- (void)_removeDRMFromDownloadedAssetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  ATStoreMusicDownloadProcessAssetsOperation *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATStoreDownloadProcessAssetsOperation assetsOperationResult](self, "assetsOperationResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeMediaResponseItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v6;
  objc_msgSend(v6, "downloadableAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreDownloadProcessAssetsOperation assetsOperationResult](self, "assetsOperationResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadFilePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fairPlayInfoList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "responseSinfDictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v14);
  }

  -[ATStoreDownloadProcessAssetsOperation assetsOperationResult](self, "assetsOperationResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isHLSDownload") & 1) != 0)
  {

  }
  else
  {
    v19 = objc_msgSend(v11, "count");

    if (v19)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC040]), "initWithFilePath:sinfs:", v9, v11);
      -[ICRequestOperation progress](self, "progress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "progress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addChild:withPendingUnitCount:", v22, 50);

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __90__ATStoreMusicDownloadProcessAssetsOperation__removeDRMFromDownloadedAssetWithCompletion___block_invoke;
      v25[3] = &unk_1E927DED8;
      v25[4] = self;
      v26 = v7;
      v27 = v9;
      v28 = v4;
      objc_msgSend(v20, "removeDRMWithCompletionHandler:", v25);

      goto LABEL_15;
    }
  }
  _ATLogCategoryAssetUtils();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = self;
    _os_log_impl(&dword_1D1868000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping removing DRM from downloaded file", buf, 0xCu);
  }

  (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v9, 0);
LABEL_15:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadDoneRequest, 0);
}

void __90__ATStoreMusicDownloadProcessAssetsOperation__removeDRMFromDownloadedAssetWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ATLogCategoryAssetUtils();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v27 = v8;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ removing DRM completed. err=%{public}@", buf, 0x16u);
  }

  v9 = v6;
  if (v5)
  {
    v10 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "fileExtension");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v9)
  {
    v12 = 0;
    v13 = v9;
  }
  else
  {
    v12 = *(id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 48), "pathExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v11 || v14 && (objc_msgSend(v14, "isEqualToString:", v11) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "stringByDeletingPathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathExtension:", v11);
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 48);
      v25 = 0;
      v20 = objc_msgSend(v18, "moveItemAtPath:toPath:error:", v19, v17, &v25);
      v13 = v25;

      if ((v20 & 1) != 0)
      {
        v21 = (void *)v17;
        v17 = 0;
      }
      else
      {
        _ATLogCategoryAssetUtils();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(_QWORD *)(a1 + 32);
          v24 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138544130;
          v27 = v23;
          v28 = 2114;
          v29 = v24;
          v30 = 2114;
          v31 = v17;
          v32 = 2114;
          v33 = v13;
          _os_log_impl(&dword_1D1868000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to rename downloaded file from %{public}@ --> %{public}@. err=%{public}@", buf, 0x2Au);
        }

        v21 = v13;
        v13 = 0;
      }

      v12 = (id)v17;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __53__ATStoreMusicDownloadProcessAssetsOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  char v31;
  ATStoreDownloadOperationResult *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  ATStoreDownloadOperationResult *v57;
  stat v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[4];
  uint64_t v65;
  __int16 v66;
  id v67;
  __int16 v68;
  __darwin_ino64_t st_ino;
  __int16 v70;
  int st_mode;
  __int16 v72;
  uid_t st_uid;
  __int16 v74;
  gid_t st_gid;
  __int16 v76;
  id v77;
  __int16 v78;
  __darwin_ino64_t v79;
  __int16 v80;
  int v81;
  __int16 v82;
  uid_t v83;
  __int16 v84;
  gid_t v85;
  stat buf;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled")
    && (objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0),
        (v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v7, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "storeInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endpointType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 40), "assetType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Music"));

    }
    else
    {
      v12 = 0;
    }
    v13 = 2;
    if (v10 != 3 && (v12 & 1) == 0)
    {
      if (*(_BYTE *)(a1 + 72))
      {
        v13 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "fairPlayInfoList");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v87, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v61;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v61 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "dpInfoData");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  v13 = 0;
                  goto LABEL_23;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v87, 16);
              if (v17)
                continue;
              break;
            }
          }
          v13 = 1;
LABEL_23:

        }
        else
        {
          v13 = 0;
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setProtectionType:", v13);
    objc_msgSend(v5, "pathExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathExtension:", v21);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D51270], "pathForBaseLocationPath:", 250);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v24, 1, 0, 0);

    v55 = (void *)v23;
    objc_msgSend(v24, "stringByAppendingPathComponent:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeItemAtPath:error:", v26, 0);

    _ATLogCategoryStoreDownloads();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(_QWORD *)(a1 + 32);
      buf.st_dev = 138543874;
      *(_QWORD *)&buf.st_mode = v29;
      WORD2(buf.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v5;
      HIWORD(buf.st_gid) = 2114;
      *(_QWORD *)&buf.st_rdev = v26;
      _os_log_impl(&dword_1D1868000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ moving downloaded file from %{public}@ --> %{public}@", (uint8_t *)&buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v31 = objc_msgSend(v30, "moveItemAtPath:toPath:error:", v5, v26, &v59);
    v7 = v59;

    if ((v31 & 1) != 0)
    {
      v54 = v21;
      v32 = objc_alloc_init(ATStoreDownloadOperationResult);
      -[ATStoreDownloadOperationResult setStoreMediaResponseItem:](v32, "setStoreMediaResponseItem:", *(_QWORD *)(a1 + 56));
      -[ATStoreDownloadOperationResult setRequestContext:](v32, "setRequestContext:", *(_QWORD *)(a1 + 64));
      -[ATStoreDownloadOperationResult setDownloadFilePath:](v32, "setDownloadFilePath:", v26);
      objc_msgSend(*(id *)(a1 + 32), "assetsOperationResult");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "assetClientParams");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATStoreDownloadOperationResult setAssetClientParams:](v32, "setAssetClientParams:", v34);

      objc_msgSend(*(id *)(a1 + 56), "downloadIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = objc_alloc(MEMORY[0x1E0DDC060]);
        v37 = *(_QWORD *)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 56), "downloadIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v36, "initWithRequestContext:downloadIdentifier:songID:", v37, v38, objc_msgSend(*(id *)(a1 + 56), "storeAdamID"));
        v40 = *(_QWORD *)(a1 + 32);
        v41 = *(void **)(v40 + 328);
        *(_QWORD *)(v40 + 328) = v39;

        objc_msgSend(*(id *)(a1 + 32), "progress");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "progress");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addChild:withPendingUnitCount:", v43, 50);

        v44 = *(_QWORD *)(a1 + 32);
        v45 = *(void **)(v44 + 328);
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __53__ATStoreMusicDownloadProcessAssetsOperation_execute__block_invoke_92;
        v56[3] = &unk_1E927E1C0;
        v56[4] = v44;
        v32 = v32;
        v57 = v32;
        objc_msgSend(v45, "performRequestWithResponseHandler:", v56);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v7, v32);
      }
      v21 = v54;
    }
    else
    {
      _ATLogCategoryStoreDownloads();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = *(_QWORD *)(a1 + 32);
        buf.st_dev = 138543618;
        *(_QWORD *)&buf.st_mode = v47;
        WORD2(buf.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v7;
        _os_log_impl(&dword_1D1868000, v46, OS_LOG_TYPE_ERROR, "%{public}@ failed to rename downloaded file. err=%{public}@", (uint8_t *)&buf, 0x16u);
      }

      objc_msgSend(v7, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x1E0CB28A8], 513);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        v53 = v21;
        memset(&buf, 0, sizeof(buf));
        v49 = objc_retainAutorelease(v5);
        stat((const char *)objc_msgSend(v49, "UTF8String"), &buf);
        memset(&v58, 0, sizeof(v58));
        v50 = objc_retainAutorelease(v24);
        stat((const char *)objc_msgSend(v50, "UTF8String"), &v58);
        _ATLogCategoryStoreDownloads();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)v64 = 138545922;
          v65 = v52;
          v66 = 2112;
          v67 = v49;
          v68 = 2048;
          st_ino = buf.st_ino;
          v70 = 1024;
          st_mode = buf.st_mode;
          v72 = 1024;
          st_uid = buf.st_uid;
          v74 = 1024;
          st_gid = buf.st_gid;
          v76 = 2112;
          v77 = v50;
          v78 = 2048;
          v79 = v58.st_ino;
          v80 = 1024;
          v81 = v58.st_mode;
          v82 = 1024;
          v83 = v58.st_uid;
          v84 = 1024;
          v85 = v58.st_gid;
          _os_log_impl(&dword_1D1868000, v51, OS_LOG_TYPE_ERROR, "%{public}@ Permission Denied moving file at path %@ (ino_t=%llu mode_t=%hu uid_t=%u gid_t=%u) to directory %@ (ino_t=%llu mode_t=%hu uid_t=%u gid_t=%u)", v64, 0x58u);
        }

        v21 = v53;
      }
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v7, 0, v53);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v32 = (ATStoreDownloadOperationResult *)objc_claimAutoreleasedReturnValue();
      -[ATStoreDownloadOperationResult removeItemAtPath:error:](v32, "removeItemAtPath:error:", v5, 0);
    }

  }
}

uint64_t __53__ATStoreMusicDownloadProcessAssetsOperation_execute__block_invoke_92(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", a2, *(_QWORD *)(a1 + 40));
}

@end
