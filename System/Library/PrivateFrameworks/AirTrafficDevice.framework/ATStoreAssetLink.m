@implementation ATStoreAssetLink

- (ATStoreAssetLink)init
{
  ATStoreAssetLink *v2;
  objc_class *v3;
  const char *Name;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  uint64_t v9;
  NSMutableDictionary *assetsByStoreID;
  uint64_t v11;
  NSMapTable *downloadsByAsset;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  SSDownloadManager *downloadManager;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ATStoreAssetLink;
  v2 = -[ATStoreAssetLink init](&v19, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.atc.storelink.callback", MEMORY[0x1E0C80D50]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 100);
    assetsByStoreID = v2->_assetsByStoreID;
    v2->_assetsByStoreID = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    downloadsByAsset = v2->_downloadsByAsset;
    v2->_downloadsByAsset = (NSMapTable *)v11;

    v13 = objc_alloc_init(MEMORY[0x1E0DAF4D8]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0DAF800], *MEMORY[0x1E0DAF810], *MEMORY[0x1E0DAF830], *MEMORY[0x1E0DAF838], *MEMORY[0x1E0DAF840], *MEMORY[0x1E0DAF848], *MEMORY[0x1E0DAF850], *MEMORY[0x1E0DAF860], *MEMORY[0x1E0DAF870], *MEMORY[0x1E0DAF878], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDownloadKinds:", v14);

    objc_msgSend(v13, "setShouldFilterExternalOriginatedDownloads:", 1);
    objc_msgSend(v13, "setPersistenceIdentifier:", CFSTR("com.apple.atc"));
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0DAF8F0], *MEMORY[0x1E0DAF998], *MEMORY[0x1E0DAF930], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPrefetchedDownloadProperties:", v15);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4D0]), "initWithManagerOptions:", v13);
    downloadManager = v2->_downloadManager;
    v2->_downloadManager = (SSDownloadManager *)v16;

  }
  return v2;
}

- (id)downloadManager
{
  return self->_downloadManager;
}

- (BOOL)open
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__ATStoreAssetLink_open__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__ATStoreAssetLink_close__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  ATStoreAssetLink *v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = (id)objc_opt_new();
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__ATStoreAssetLink_enqueueAssets_force___block_invoke;
  v11[3] = &unk_1E927C988;
  v12 = v6;
  v13 = self;
  v14 = &v16;
  v15 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (BOOL)canEnqueueAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  BOOL v30;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  ATStoreAssetLink *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "bypassStore") & 1) == 0)
  {
    if (objc_msgSend(v4, "isDownload"))
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Application"), CFSTR("Book"), CFSTR("Media"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataclass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "containsObject:", v6);

      if (v7)
      {
        objc_msgSend(v4, "dataclass");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Application"));

        if ((v9 & 1) == 0)
        {
          if (!_os_feature_enabled_impl())
            goto LABEL_9;
          objc_msgSend(v4, "dataclass");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Book"));

          if ((v11 & 1) == 0)
          {
            if (!_os_feature_enabled_impl()
              || (objc_msgSend(v4, "assetType"),
                  v12 = (void *)objc_claimAutoreleasedReturnValue(),
                  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Audiobook")),
                  v12,
                  (v13 & 1) == 0))
            {
LABEL_9:
              objc_msgSend(v4, "dataclass");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Media"));

              if (!v15)
                goto LABEL_20;
              if (objc_msgSend(v4, "isRestore"))
              {
                objc_msgSend(v4, "assetType");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("Music")))
                {

                  goto LABEL_14;
                }
                objc_msgSend(v4, "assetType");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("MusicVideo"));

                if (v18)
                {
LABEL_14:
                  objc_msgSend(v4, "storeInfo");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "endpointType");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "integerValue");

                  if (v21 <= 1)
                  {
                    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = 0;
                    objc_msgSend(v23, "DSIDForUserIdentity:outError:", v22, &v35);
                    v24 = (id)objc_claimAutoreleasedReturnValue();
                    v25 = v35;

                    objc_msgSend(v4, "storeInfo");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "DSID");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    v28 = v27;
                    if (v24 == v28)
                    {

                    }
                    else
                    {
                      v29 = objc_msgSend(v24, "isEqual:", v28);

                      if (!v29)
                      {
                        v30 = 1;
LABEL_28:

                        goto LABEL_19;
                      }
                    }
                    _ATLogCategoryStoreDownloads();
                    v32 = objc_claimAutoreleasedReturnValue();
                    v33 = v32;
                    if (v25)
                    {
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(v25, "msv_description");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v37 = self;
                        v38 = 2114;
                        v39 = v4;
                        v40 = 2114;
                        v41 = v34;
                        _os_log_impl(&dword_1D1868000, v33, OS_LOG_TYPE_ERROR, "%{public}@ Could not get DSID for active account. (asset=%{public}@) error=%{public}@", buf, 0x20u);

                      }
                    }
                    else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v37 = self;
                      v38 = 2114;
                      v39 = v4;
                      _os_log_impl(&dword_1D1868000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not get DSID for active account. (asset=%{public}@)", buf, 0x16u);
                    }

                    v30 = 0;
                    goto LABEL_28;
                  }
                  goto LABEL_18;
                }
LABEL_20:
                v30 = 1;
                goto LABEL_19;
              }
            }
          }
        }
      }
    }
  }
LABEL_18:
  v30 = 0;
LABEL_19:

  return v30;
}

- (void)cancelAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATStoreAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ATStoreAssetLink_cancelAssets___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)prioritizeAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  ATStoreAssetLink *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryStoreDownloads();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Prioritize %{public}@", buf, 0x16u);
  }

  -[NSMapTable objectForKey:](self->_downloadsByAsset, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "setIsPrioritized:", 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__ATStoreAssetLink_prioritizeAsset___block_invoke;
    v8[3] = &unk_1E927E1C0;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(v9, "prioritizeAboveDownload:completionBlock:", 0, v8);

  }
  else
  {
    _ATLogCategoryStoreDownloads();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_INFO, "%{public}@ Could not find download to prioritize for %{public}@", buf, 0x16u);
    }

  }
}

- (unint64_t)maximumBatchSize
{
  return -1;
}

- (BOOL)linkIsReady
{
  return 1;
}

- (unint64_t)priority
{
  return 50;
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATStoreAssetLink *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ATStoreAssetLink_downloadManager_downloadStatesDidChange___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)_updateInstallProgress:(double)a3 forAsset:(id)a4
{
  id v6;
  NSObject *callbackQueue;
  id v8;
  _QWORD block[4];
  id v10;
  ATStoreAssetLink *v11;
  double v12;

  v6 = a4;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ATStoreAssetLink__updateInstallProgress_forAsset___block_invoke;
  block[3] = &unk_1E927DAC8;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_async(callbackQueue, block);

}

- (void)_finishAsset:(id)a3 error:(id)a4 retryable:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *assetsByStoreID;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *callbackQueue;
  id v24;
  id v25;
  void *v26;
  int v27;
  uint64_t v28;
  double v29;
  _QWORD block[4];
  id v31;
  ATStoreAssetLink *v32;
  id v33;
  BOOL v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSMapTable objectForKey:](self->_downloadsByAsset, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    assetsByStoreID = self->_assetsByStoreID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "persistentIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](assetsByStoreID, "removeObjectForKey:", v13);

  }
  -[NSMapTable removeObjectForKey:](self->_downloadsByAsset, "removeObjectForKey:", v8);
  objc_msgSend(v9, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DAFCE0]))
  {
    v15 = objc_msgSend(v9, "code");

    v16 = v9;
    if (v15 == 2040)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB3388];
      v38[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATError"), 26, v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {

    v16 = v9;
  }
  objc_msgSend(v9, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0DAFA20]))
  {
    v20 = objc_msgSend(v9, "code");

    if (v20 != 103)
      goto LABEL_11;
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB3388];
    v36 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("ATError"), 14, v19);
    v22 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v22;
  }

LABEL_11:
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ATStoreAssetLink__finishAsset_error_retryable___block_invoke;
  block[3] = &unk_1E927CDE8;
  v24 = v8;
  v31 = v24;
  v32 = self;
  v25 = v16;
  v33 = v25;
  v34 = a5;
  dispatch_async(callbackQueue, block);
  if (v9)
  {
    ATReportEventIncrementingScalarKey();
    objc_msgSend(v25, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("ATError"));

    if (v27)
    {
      v28 = objc_msgSend(v25, "code");
      if (v28 == 8 || v28 == 4 || v28 == 2)
        ATReportEventIncrementingScalarKey();
    }
  }
  else
  {
    ATReportEventIncrementingScalarKey();
    objc_msgSend(v24, "transferStartTime");
    if (v29 != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v24, "transferStartTime");
      ATReportEventAddDoubleToScalarKey();
    }
  }

}

- (id)_storeKindForAsset:(id)a3
{
  void *v3;
  id *v4;
  id v5;

  objc_msgSend(a3, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audiobook")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Movie")) & 1) != 0)
    {
      v4 = (id *)MEMORY[0x1E0DAF830];
      goto LABEL_17;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Music")) & 1) != 0)
    {
      v4 = (id *)MEMORY[0x1E0DAF838];
      goto LABEL_17;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MusicVideo")) & 1) != 0)
    {
      v4 = (id *)MEMORY[0x1E0DAF840];
      goto LABEL_17;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Podcast")) & 1) != 0)
    {
LABEL_10:
      v4 = (id *)MEMORY[0x1E0DAF848];
      goto LABEL_17;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVEpisode")) & 1) != 0)
    {
      v4 = (id *)MEMORY[0x1E0DAF860];
      goto LABEL_17;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VideoPodcast")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iTunesU")) & 1) != 0)
        goto LABEL_10;
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("iTunesUVideo")))
      {
        v5 = 0;
        goto LABEL_18;
      }
    }
    v4 = (id *)MEMORY[0x1E0DAF878];
    goto LABEL_17;
  }
  v4 = (id *)MEMORY[0x1E0DAF800];
LABEL_17:
  v5 = *v4;
LABEL_18:

  return v5;
}

- (id)_assetTypeForStoreKind:(id)a3
{
  id v3;
  __CFString *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_assetTypeForStoreKind__onceToken != -1)
    dispatch_once(&_assetTypeForStoreKind__onceToken, &__block_literal_global_627);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "objectForKeyedSubscript:", v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _ATLogCategoryStoreDownloads();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = v3;
      v9 = 2114;
      v10 = CFSTR("Unknown");
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "Could not find matching assetType for storeKind=%{public}@, setting assetType=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    v4 = CFSTR("Unknown");
  }

  return v4;
}

- (id)_dataClassForStoreKind:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (_dataClassForStoreKind__onceToken != -1)
    dispatch_once(&_dataClassForStoreKind__onceToken, &__block_literal_global_49);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    ATStoreAssetLinkRaiseWithSerialABCReport(CFSTR("Unknown dataclass for kind %@"), v3);

  return v4;
}

- (void)_enqueueAssets:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  NSMutableDictionary *assetsByStoreID;
  void *v16;
  uint64_t v17;
  dispatch_semaphore_t v18;
  SSDownloadManager *downloadManager;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  __int128 v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  NSObject *v38;
  _BYTE *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t v46[4];
  ATStoreAssetLink *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  objc_msgSend(v4, "count");
  ATReportEventAddIntToScalarKey();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v42;
    *(_QWORD *)&v6 = 138543874;
    v30 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v40 = 0;
        -[ATStoreAssetLink _downloadForAsset:error:](self, "_downloadForAsset:error:", v9, &v40, v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v40;
        v12 = v11;
        if (v10)
        {
          objc_msgSend(v32, "addObject:", v10);
          _ATLogCategoryStoreDownloads();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "shortDescription");
            v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v30;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v10;
            *(_WORD *)&buf[22] = 2114;
            v51 = v14;
            _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Created %{public}@ for %{public}@", buf, 0x20u);

          }
          assetsByStoreID = self->_assetsByStoreID;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "persistentIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](assetsByStoreID, "setObject:forKey:", v9, v16);

          -[NSMapTable setObject:forKey:](self->_downloadsByAsset, "setObject:forKey:", v10, v9);
        }
        else
        {
          if (v11)
            v17 = ATIsRecoverableError();
          else
            v17 = 1;
          -[ATStoreAssetLink _finishAsset:error:retryable:](self, "_finishAsset:error:retryable:", v9, v12, v17);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v32, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v51 = __Block_byref_object_copy_;
    v52 = __Block_byref_object_dispose_;
    v53 = 0;
    v18 = dispatch_semaphore_create(0);
    downloadManager = self->_downloadManager;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __35__ATStoreAssetLink__enqueueAssets___block_invoke;
    v37[3] = &unk_1E927C9F0;
    v39 = buf;
    v20 = v18;
    v38 = v20;
    -[SSDownloadManager addDownloads:completionBlock:](downloadManager, "addDownloads:completionBlock:", v32, v37);
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      _ATLogCategoryStoreDownloads();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v46 = 138543618;
        v47 = self;
        v48 = 2114;
        v49 = v22;
        _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed adding downloads to store queue - error:%{public}@", v46, 0x16u);
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v23 = v32;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v34 != v25)
              objc_enumerationMutation(v23);
            v27 = self->_assetsByStoreID;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "persistentIdentifier"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v27, "objectForKey:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            -[ATStoreAssetLink _finishAsset:error:retryable:](self, "_finishAsset:error:retryable:", v29, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 1);
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        }
        while (v24);
      }

    }
    _Block_object_dispose(buf, 8);

  }
}

- (id)_downloadForAsset:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  ATStoreAssetLink *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  ATStoreAssetLink *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  ATStoreAssetLink *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint8_t buf[4];
  ATStoreAssetLink *v97;
  __int16 v98;
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "storePID"))
  {
    v91 = objc_alloc_init(MEMORY[0x1E0DAF4C0]);
    v8 = objc_alloc_init(MEMORY[0x1E0DAF4B8]);
    objc_msgSend(v6, "storeInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storePlist");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoPlist");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      objc_msgSend(v9, "downloadDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValuesWithDictionary:", v12);

      objc_msgSend(v9, "assetDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setValuesWithDictionary:", v13);

      objc_msgSend(v6, "setStoreInfo:", 0);
    }
    else if (v90)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v90);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4F0]), "initWithDictionary:", v15);
        objc_msgSend(v8, "setValuesWithStoreDownloadMetadata:", v16);

      }
      else
      {
        _ATLogCategoryStoreDownloads();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v97 = self;
          v98 = 2114;
          v99 = v6;
          _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing store plist file for %{public}@", buf, 0x16u);
        }
      }

      objc_msgSend(v6, "setStorePlist:", 0);
    }
    else if (v10)
    {
      v17 = self;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v18, 0, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", CFSTR("UIBackgroundModes"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20 && objc_msgSend(v20, "containsObject:", CFSTR("newsstand-content")))
        objc_msgSend(v8, "setValue:forProperty:", *MEMORY[0x1E0DAFA08], *MEMORY[0x1E0DAF9C0]);
      objc_msgSend(v6, "setInfoPlist:", 0);

      self = v17;
    }
    objc_msgSend(v6, "dataclass");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("Media"));

    if (v23)
    {
      v88 = v11;
      -[ATStoreAssetLink _storeKindForAsset:](self, "_storeKindForAsset:", v6);
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v94 = *MEMORY[0x1E0CB2D50];
        v58 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "assetType");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "description");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringWithFormat:", CFSTR("No valid store kind for asset type %@. asset=%@"), v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, v62);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v7 = 0;
        v11 = v88;
LABEL_36:

        goto LABEL_37;
      }
      v25 = (id)v24;
      v85 = (void *)MEMORY[0x1E0C99D80];
      v87 = a4;
      v81 = *MEMORY[0x1E0DAF988];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = *MEMORY[0x1E0DAF8F8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = *MEMORY[0x1E0DAF908];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0DAF918];
      objc_msgSend(v6, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v8;
      v30 = *MEMORY[0x1E0DAF998];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isRestore"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = self;
      v32 = *MEMORY[0x1E0DAF970];
      objc_msgSend(v6, "prettyName");
      v83 = v9;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v30;
      v8 = v29;
      objc_msgSend(v85, "dictionaryWithObjectsAndKeys:", v25, v81, v79, v77, v76, v75, v26, v27, v28, v73, v31, v32, v33, *MEMORY[0x1E0DAFA00], 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setValuesWithDictionary:", v34);

      v9 = v83;
      self = v74;

      v11 = v88;
    }
    else
    {
      v87 = a4;
      objc_msgSend(v6, "dataclass");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("Book"));

      if (!v36)
        goto LABEL_23;
      v86 = (void *)MEMORY[0x1E0C99D80];
      v84 = *MEMORY[0x1E0DAF810];
      v82 = *MEMORY[0x1E0DAF988];
      v89 = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = *MEMORY[0x1E0DAF908];
      objc_msgSend(v6, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = self;
      v39 = v8;
      v40 = *MEMORY[0x1E0DAF998];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isRestore"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x1E0DAF970];
      objc_msgSend(v6, "prettyName");
      v43 = v9;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v40;
      v8 = v39;
      self = v38;
      objc_msgSend(v86, "dictionaryWithObjectsAndKeys:", v84, v82, v80, v78, v37, v72, v41, v42, v44, *MEMORY[0x1E0DAFA00], 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValuesWithDictionary:", v45);

      v9 = v43;
      v11 = v89;

      objc_msgSend(v6, "icon");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v46)
      {
LABEL_23:
        objc_msgSend(v8, "setValue:forProperty:", *MEMORY[0x1E0CF75F8], *MEMORY[0x1E0DAF920]);
        objc_msgSend(v8, "addAsset:forType:", v91, *MEMORY[0x1E0DAF7D0]);
        objc_msgSend(v6, "dataclass");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "isEqualToString:", CFSTR("Book")))
        {

        }
        else
        {
          objc_msgSend(v6, "dataclass");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("Media"));

          if (!v51)
          {
LABEL_35:
            v7 = v8;
            goto LABEL_36;
          }
        }
        +[ATRestoreManager sharedManager](ATRestoreManager, "sharedManager");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "hasProperNetworkConditions");

        if (v53)
        {
          _ATLogCategoryStoreDownloads();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "shortDescription");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v97 = self;
            v98 = 2114;
            v99 = v55;
            _os_log_impl(&dword_1D1868000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ removing network constraints for %{public}@", buf, 0x16u);

          }
          objc_msgSend(v6, "dataclass");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v56, "isEqualToString:", CFSTR("Book")))
          {
            v57 = (id)*MEMORY[0x1E0DAF810];
          }
          else
          {
            -[ATStoreAssetLink _storeKindForAsset:](self, "_storeKindForAsset:", v6);
            v57 = (id)objc_claimAutoreleasedReturnValue();
          }
          v63 = v57;

          if (!v63)
          {
            v92 = *MEMORY[0x1E0CB2D50];
            v67 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "assetType");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "description");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "stringWithFormat:", CFSTR("No valid download kind for asset type %@. asset=%@"), v68, v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v70;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, v71);
            *v87 = (id)objc_claimAutoreleasedReturnValue();

            v7 = 0;
            goto LABEL_36;
          }
          v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF500]), "initWithDownloadKind:URLBagType:", v63, 0);
          v65 = objc_alloc_init(MEMORY[0x1E0DAF510]);
          objc_msgSend(v65, "setCellularDataStates:", 0);
          objc_msgSend(v64, "setPolicyRule:", v65);
          objc_msgSend(v8, "setDownloadPolicy:", v64);

        }
        goto LABEL_35;
      }
      objc_msgSend(v6, "icon");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "absoluteString");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forProperty:", v48, *MEMORY[0x1E0DAF9E8]);

      v25 = objc_alloc_init(MEMORY[0x1E0DAF4C0]);
      objc_msgSend(v8, "addAsset:forType:", v25, *MEMORY[0x1E0DAF7C0]);
    }

    goto LABEL_23;
  }
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4B8]), "initWithPersistentIdentifier:", objc_msgSend(v6, "storePID"));
LABEL_37:

  return v7;
}

- (id)_assetForDownload:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v22;
  ATStoreAssetLink *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CF7680]);
  objc_msgSend(v5, "setIsDownload:", 1);
  v6 = *MEMORY[0x1E0DAF988];
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0DAF988]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreAssetLink _dataClassForStoreKind:](self, "_dataClassForStoreKind:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataclass:", v8);

  objc_msgSend(v4, "valueForProperty:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreAssetLink _assetTypeForStoreKind:](self, "_assetTypeForStoreKind:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssetType:", v10);

  objc_msgSend(v5, "dataclass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("Book"));

  if ((_DWORD)v10
    || (objc_msgSend(v5, "dataclass"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Media")),
        v12,
        v13))
  {
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0DAF998]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v14);

  }
  else
  {
    ATStoreAssetLinkRaiseWithSerialABCReport(CFSTR("Unknown kind for download"), v4);
  }
  objc_msgSend(v5, "dataclass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Media"));

  if (v16)
    objc_msgSend(v5, "setVariantOptions:", &unk_1E928B948);
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0DAF970]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsRestore:", objc_msgSend(v17, "BOOLValue"));

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0DAFA00]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrettyName:", v18);

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0DAF9E8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v19);

  objc_msgSend(v5, "setStorePID:", objc_msgSend(v4, "persistentIdentifier"));
  _ATLogCategoryStoreDownloads();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138543874;
    v23 = self;
    v24 = 2114;
    v25 = v5;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_1D1868000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Created download asset=%{public}@ for SSDownload=%{public}@", (uint8_t *)&v22, 0x20u);
  }

  return v5;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (ATAssetLinkDelegate)delegate
{
  return (ATAssetLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadsByAsset, 0);
  objc_storeStrong((id *)&self->_assetsByStoreID, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
}

void __35__ATStoreAssetLink__enqueueAssets___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __43__ATStoreAssetLink__dataClassForStoreKind___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_dataClassForStoreKind__dataClassByKind;
  _dataClassForStoreKind__dataClassByKind = (uint64_t)v0;

  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Application"), *MEMORY[0x1E0DAF858]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Book"), *MEMORY[0x1E0DAF810]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF800]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF830]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF838]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF840]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF860]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF878]);
  return objc_msgSend((id)_dataClassForStoreKind__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF848]);
}

uint64_t __43__ATStoreAssetLink__assetTypeForStoreKind___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_assetTypeForStoreKind__assetTypeByStoreKind;
  _assetTypeForStoreKind__assetTypeByStoreKind = (uint64_t)v0;

  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("Audiobook"), *MEMORY[0x1E0DAF800]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("Movie"), *MEMORY[0x1E0DAF830]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("Music"), *MEMORY[0x1E0DAF838]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("MusicVideo"), *MEMORY[0x1E0DAF840]);
  v2 = *MEMORY[0x1E0DAF848];
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("Podcast"), *MEMORY[0x1E0DAF848]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("TVEpisode"), *MEMORY[0x1E0DAF860]);
  v3 = *MEMORY[0x1E0DAF878];
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("VideoPodcast"), *MEMORY[0x1E0DAF878]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("iTunesU"), v2);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("iTunesUVideo"), v3);
  return objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind, "setObject:forKeyedSubscript:", CFSTR("Application"), *MEMORY[0x1E0DAF858]);
}

void __49__ATStoreAssetLink__finishAsset_error_retryable___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
    objc_msgSend(WeakRetained, "assetLink:didFinishAsset:error:retryable:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

  }
}

void __52__ATStoreAssetLink__updateInstallProgress_forAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
    objc_msgSend(WeakRetained, "assetLink:didUpdateAsset:progress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

  }
}

void __60__ATStoreAssetLink_downloadManager_downloadStatesDidChange___block_invoke(id *a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id WeakRetained;
  id v21;
  void *v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a1[4];
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v2)
  {
    v4 = v2;
    v30 = *(_QWORD *)v32;
    v5 = *MEMORY[0x1E0DAF8B0];
    v27 = *MEMORY[0x1E0DAF898];
    v26 = *MEMORY[0x1E0DAF880];
    v25 = *MEMORY[0x1E0DAF8B8];
    *(_QWORD *)&v3 = 134218498;
    v24 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v32 != v30)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v7, "downloadPhaseIdentifier", v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "persistentIdentifier");
        v10 = (void *)*((_QWORD *)a1[5] + 2);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v8, "isEqualToString:", v5);
        if (v12)
        {
          if (v13)
          {
            objc_msgSend(v29, "addObject:", v7);
            _ATLogCategoryStoreDownloads();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v37 = v9;
              v38 = 2114;
              v39 = v12;
              _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "Got finished asset %lld, %{public}@", buf, 0x16u);
            }

            objc_msgSend(a1[5], "_finishAsset:error:retryable:", v12, 0, 1);
          }
          else if (objc_msgSend(v8, "isEqualToString:", v27))
          {
            objc_msgSend(v29, "addObject:", v7);
            objc_msgSend(v7, "failureError");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
            }
            _ATLogCategoryStoreDownloads();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              v37 = v9;
              v38 = 2114;
              v39 = v12;
              v40 = 2114;
              v41 = v15;
              _os_log_impl(&dword_1D1868000, v16, OS_LOG_TYPE_DEFAULT, "Got failed asset %lld, %{public}@ with download error %{public}@", buf, 0x20u);
            }

            objc_msgSend(a1[5], "_finishAsset:error:retryable:", v12, v15, 1);
          }
          else if (objc_msgSend(v8, "isEqualToString:", v26))
          {
            objc_msgSend(v29, "addObject:", v7);
            _ATLogCategoryStoreDownloads();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v37 = v9;
              v38 = 2114;
              v39 = v12;
              _os_log_impl(&dword_1D1868000, v17, OS_LOG_TYPE_DEFAULT, "Got canceled asset %lld, %{public}@", buf, 0x16u);
            }

            v18 = a1[5];
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_finishAsset:error:retryable:", v12, v19, 1);

          }
          else if (objc_msgSend(v8, "isEqualToString:", v25))
          {
            objc_msgSend(v12, "setInstallStarted:", 1);
            objc_msgSend(v12, "setInstalled:", 1);
            if (objc_msgSend(v12, "assetState") != 1)
            {
              objc_msgSend(v12, "setAssetState:", 1);
              WeakRetained = objc_loadWeakRetained((id *)a1[5] + 7);
              v21 = a1[5];
              v35 = v12;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "assetLink:didTransitionAssetStates:", v21, v22);

            }
            v23 = a1[5];
            objc_msgSend(v7, "percentComplete");
            objc_msgSend(v23, "_updateInstallProgress:forAsset:", v12);
          }
        }
        else if ((v13 & 1) != 0
               || (objc_msgSend(v8, "isEqualToString:", v27) & 1) != 0
               || objc_msgSend(v8, "isEqualToString:", v26))
        {
          objc_msgSend(v29, "addObject:", v7);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[6], "finishDownloads:", v29);
}

void __36__ATStoreAssetLink_prioritizeAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryStoreDownloads();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138543874;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Could not prioritize %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
    }

  }
}

void __33__ATStoreAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    _ATLogCategoryStoreDownloads();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = objc_msgSend(v2, "count");
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      v21 = 1024;
      v22 = v11;
      v23 = 2114;
      v24 = v2;
      _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Canceling %d downloads with store %{public}@", buf, 0x1Cu);
    }

    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __33__ATStoreAssetLink_cancelAssets___block_invoke_30;
    v14[3] = &unk_1E927E0D0;
    v14[4] = v12;
    objc_msgSend(v13, "cancelDownloads:completionBlock:", v2, v14);
  }

}

void __33__ATStoreAssetLink_cancelAssets___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryStoreDownloads();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Cancel failed with error: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __40__ATStoreAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v7, "dataclass");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("Media")))
        {
          objc_msgSend(v7, "assetType");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Podcast"));

        }
        else
        {
          v10 = 0;
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          _ATLogCategoryStoreDownloads();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v11, "downloadPhaseIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v28 = v13;
            v29 = 2114;
            v30 = v11;
            v31 = 2114;
            v32 = v14;
            v33 = 2114;
            v34 = v7;
            _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Matched enqueued download %{public}@ (%{public}@) for %{public}@", buf, 0x2Au);

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v7);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", v11, v7);
          v15 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "persistentIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v7, v16);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
          v17 = v2;
          v18 = v11;
          goto LABEL_19;
        }
        if (v10)
          v19 = 100;
        else
          v19 = 3;
        v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") + v20 < v19
          || *(_BYTE *)(a1 + 56))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
          v17 = v21;
          v18 = v7;
LABEL_19:
          objc_msgSend(v17, "addObject:", v18);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 40), "downloadManager:downloadStatesDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v2);
  objc_msgSend(*(id *)(a1 + 40), "_enqueueAssets:", v21);

}

void __25__ATStoreAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObserver:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__ATStoreAssetLink_close__block_invoke_2;
    block[3] = &unk_1E927E120;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

void __25__ATStoreAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLink:didCloseWithOutstandingAssets:", *(_QWORD *)(a1 + 32), 0);

}

void __24__ATStoreAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  _QWORD block[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:");
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "downloads");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    if (!v4)
      goto LABEL_20;
    v5 = v4;
    v6 = *(_QWORD *)v30;
    v25 = *MEMORY[0x1E0DAF8B0];
    v24 = *MEMORY[0x1E0DAF898];
    v23 = *MEMORY[0x1E0DAF880];
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        _ATLogCategoryStoreDownloads();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v8, "downloadPhaseIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v35 = v10;
          v36 = 2114;
          v37 = v8;
          v38 = 2114;
          v39 = v11;
          _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Found existing download: %{public}@ (%{public}@)", buf, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "_assetForDownload:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataclass");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("Media")))
        {

LABEL_17:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v8, v12);
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "persistentIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v12, v19);

          objc_msgSend(v3, "addObject:", v12);
          goto LABEL_18;
        }
        v14 = objc_msgSend(v12, "isRestore");

        if ((v14 & 1) != 0)
          goto LABEL_17;
        objc_msgSend(v8, "downloadPhaseIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(v15, "isEqualToString:", v24) & 1) != 0
          || objc_msgSend(v15, "isEqualToString:", v23))
        {
          v16 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          v33 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "finishDownloads:", v17);

        }
LABEL_18:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      if (!v5)
      {
LABEL_20:

        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(NSObject **)(v20 + 40);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __24__ATStoreAssetLink_open__block_invoke_10;
        block[3] = &unk_1E927E148;
        block[4] = v20;
        v28 = v3;
        v22 = v3;
        dispatch_async(v21, block);

        return;
      }
    }
  }
}

void __24__ATStoreAssetLink_open__block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetLink:didOpenWithPendingAssets:", v2, v3);

}

@end
