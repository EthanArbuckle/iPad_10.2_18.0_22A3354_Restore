@implementation ATStoreMediaAssetLink

- (ATStoreMediaAssetLink)init
{
  ATStoreMediaAssetLink *v2;
  ATStoreMediaAssetLink *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  dispatch_queue_t v6;
  OS_dispatch_queue *resumeQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *callbackQueue;
  uint64_t v10;
  NSMutableSet *enqueuedDownloadAssets;
  uint64_t v12;
  NSMutableSet *resumableAssets;
  uint64_t v14;
  NSMutableSet *cancelledAssets;
  uint64_t v16;
  NSMutableSet *enqueuedRestoreAssets;
  uint64_t v18;
  ATStoreDownloadService *downloadService;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ATStoreMediaAssetLink;
  v2 = -[ATStoreMediaAssetLink init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_resumeAssetDownloadsActivity = 0;
    v4 = dispatch_queue_create("com.apple.amp.AirTraffic.ATStoreMediaAssetLink.queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.amp.AirTraffic.ATStoreMediaAssetLink.resumeQueue", 0);
    resumeQueue = v3->_resumeQueue;
    v3->_resumeQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.amp.AirTraffic.ATStoreMediaAssetLink.callback", MEMORY[0x1E0C80D50]);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    enqueuedDownloadAssets = v3->_enqueuedDownloadAssets;
    v3->_enqueuedDownloadAssets = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    resumableAssets = v3->_resumableAssets;
    v3->_resumableAssets = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    cancelledAssets = v3->_cancelledAssets;
    v3->_cancelledAssets = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    enqueuedRestoreAssets = v3->_enqueuedRestoreAssets;
    v3->_enqueuedRestoreAssets = (NSMutableSet *)v16;

    +[ATStoreDownloadService sharedService](ATStoreDownloadService, "sharedService");
    v18 = objc_claimAutoreleasedReturnValue();
    downloadService = v3->_downloadService;
    v3->_downloadService = (ATStoreDownloadService *)v18;

  }
  return v3;
}

- (BOOL)open
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ATStoreMediaAssetLink_open__block_invoke;
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
  block[2] = __30__ATStoreMediaAssetLink_close__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[4];
  id v26;
  ATStoreMediaAssetLink *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  ATStoreMediaAssetLink *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__4320;
  v48 = __Block_byref_object_dispose__4321;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4320;
  v42 = __Block_byref_object_dispose__4321;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__4320;
  v36 = __Block_byref_object_dispose__4321;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ATStoreMediaAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E927E008;
  v8 = v6;
  v26 = v8;
  v27 = self;
  v31 = a4;
  v28 = &v44;
  v29 = &v32;
  v30 = &v38;
  dispatch_sync(queue, block);
  if (objc_msgSend((id)v33[5], "count"))
  {
    _ATLogCategoryStoreDownloads_Oversize();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)v33[5];
      *(_DWORD *)buf = 138543618;
      v52 = self;
      v53 = 2114;
      v54 = v10;
      _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Download paused reason changed for %{public}@", buf, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "assetLink:didUpdateDownloadPauseReasonForAssets:", self, v33[5]);

  }
  if (objc_msgSend((id)v39[5], "count"))
  {
    _ATLogCategoryStoreDownloads_Oversize();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)v39[5];
      v14 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 138543874;
      v52 = self;
      v53 = 2114;
      v54 = v13;
      v55 = 2048;
      v56 = v14;
      _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing %{public}@ (count=%lu) new assets", buf, 0x20u);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = (id)v39[5];
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v50, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          -[ATStoreDownloadService enqueueAsset:](self->_downloadService, "enqueueAsset:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v50, 16);
      }
      while (v16);
    }

  }
  v19 = (id)v45[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v19;
}

- (BOOL)canEnqueueAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  char v30;
  void *v31;
  char v32;
  int v33;
  int v34;
  void *v35;
  char v36;
  void *v38;
  void *v39;
  char v40;
  id v41;
  uint8_t buf[4];
  ATStoreMediaAssetLink *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "useNewDownloadService");

  if (!v6)
    goto LABEL_36;
  objc_msgSend(v4, "variantOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("AssetParts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9)
  {
    if ((v9 & 1) == 0)
      goto LABEL_36;
  }
  if ((objc_msgSend(v4, "bypassStore") & 1) != 0)
    goto LABEL_36;
  objc_msgSend(v4, "dataclass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Media")) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v4, "dataclass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("Book")))
  {

LABEL_8:
    goto LABEL_9;
  }
  if (!_os_feature_enabled_impl())
  {

    goto LABEL_36;
  }
  objc_msgSend(v4, "dataclass");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("Podcasts"));

  if ((v32 & 1) == 0)
    goto LABEL_36;
LABEL_9:
  objc_msgSend(v4, "storeInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_36;
  objc_msgSend(v4, "assetType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Music")) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v4, "assetType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "isEqualToString:", CFSTR("MusicVideo"));

  }
  objc_msgSend(v4, "assetType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Audiobook"));

  objc_msgSend(v4, "storeInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "redownloadParams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  objc_msgSend(v4, "storeInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "endpointType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  if (!v14)
  {
    if (v17)
      goto LABEL_31;
    goto LABEL_32;
  }
  if (!objc_msgSend(v4, "isRestore"))
    goto LABEL_27;
  if (v23 == 2 && !v20)
    goto LABEL_36;
  if (v23 > 1)
  {
LABEL_27:
    v33 = objc_msgSend(v4, "isRestore");
    if (v23 - 3 < 0xFFFFFFFFFFFFFFFELL)
      v34 = 1;
    else
      v34 = v33;
    if ((v34 & (v17 ^ 1) & 1) == 0)
    {
LABEL_31:
      if (!v20)
        goto LABEL_36;
    }
LABEL_32:
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
LABEL_33:
      v30 = 1;
      goto LABEL_37;
    }
    objc_msgSend(v4, "dataclass");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("Book"));

    if ((v36 & 1) == 0)
    {
      if (!_os_feature_enabled_impl())
        goto LABEL_33;
      objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "isWatch"))
      {

        goto LABEL_33;
      }
      objc_msgSend(v4, "assetType");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("Audiobook"));

      if ((v40 & 1) == 0)
        goto LABEL_33;
    }
LABEL_36:
    v30 = 0;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v25, "DSIDForUserIdentity:outError:", v24, &v41);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v41;

  if (!v26 || v27)
  {
    _ATLogCategoryStoreDownloads();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v43 = self;
      v44 = 2114;
      v45 = v4;
      v46 = 2114;
      v47 = v27;
      _os_log_impl(&dword_1D1868000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not get DSID for active account. (asset=%{public}@, error=%{public}@)", buf, 0x20u);
    }
    v30 = 0;
  }
  else
  {
    objc_msgSend(v4, "storeInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "DSID");
    v29 = objc_claimAutoreleasedReturnValue();

    if (v26 == v29)
    {
      v30 = 1;
      v29 = v26;
    }
    else
    {
      v30 = -[NSObject isEqual:](v26, "isEqual:", v29);
    }
  }

LABEL_37:
  return v30;
}

- (void)cancelAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[4];
  id v16;
  ATStoreMediaAssetLink *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4320;
  v23 = __Block_byref_object_dispose__4321;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ATStoreMediaAssetLink_cancelAssets___block_invoke;
  block[3] = &unk_1E927E170;
  v6 = v4;
  v16 = v6;
  v17 = self;
  v18 = &v19;
  dispatch_sync(queue, block);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)v20[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        -[ATStoreDownloadService cancelAsset:](self->_downloadService, "cancelAsset:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v25, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v19, 8);
}

- (void)prioritizeAsset:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__ATStoreMediaAssetLink_prioritizeAsset___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (unint64_t)priority
{
  return 50;
}

- (unint64_t)maximumBatchSize
{
  return 20;
}

- (BOOL)linkIsReady
{
  return 1;
}

- (void)ATStoreDownloadService:(id)a3 didChangeStateForAsset:(id)a4 oldState:(int64_t)a5 newState:(int64_t)a6
{
  id v8;
  void *v9;
  NSObject *callbackQueue;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a4;
  objc_msgSend(v8, "setAssetState:", -[ATStoreMediaAssetLink _ATAssetStateForStoreDownloadState:](self, "_ATAssetStateForStoreDownloadState:", a6));
  if (a6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CF21E0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logAssetLinkOfType:didBeginDownloadingAsset:", 0, v8);

  }
  callbackQueue = self->_callbackQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__ATStoreMediaAssetLink_ATStoreDownloadService_didChangeStateForAsset_oldState_newState___block_invoke;
  v12[3] = &unk_1E927E148;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  dispatch_async(callbackQueue, v12);

}

- (void)ATStoreDownloadService:(id)a3 didUpdateProgressForAsset:(id)a4 progress:(float)a5
{
  id v7;
  NSObject *callbackQueue;
  id v9;
  _QWORD block[5];
  id v11;
  float v12;

  v7 = a4;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__ATStoreMediaAssetLink_ATStoreDownloadService_didUpdateProgressForAsset_progress___block_invoke;
  block[3] = &unk_1E927E030;
  block[4] = self;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  dispatch_async(callbackQueue, block);

}

- (void)ATStoreDownloadService:(id)a3 didFinishAsset:(id)a4 withError:(id)a5 cancelPendingAssetsInBatch:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  -[ATStoreMediaAssetLink _finishAsset:error:cancelPendingAssetsInBatch:](self, "_finishAsset:error:cancelPendingAssetsInBatch:", v10, v9, v6);
  objc_msgSend(MEMORY[0x1E0CF21E0], "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logAssetLinkOfType:didFinishAsset:withError:", 0, v10, v9);

}

- (void)_finishAsset:(id)a3 error:(id)a4 cancelPendingAssetsInBatch:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *queue;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *callbackQueue;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  ATStoreMediaAssetLink *v21;
  id v22;
  id v23;
  _QWORD *v24;
  BOOL v25;
  _QWORD block[4];
  id v27;
  ATStoreMediaAssetLink *v28;
  id v29;
  _QWORD *v30;
  BOOL v31;
  _QWORD v32[3];
  char v33;

  v8 = a3;
  v9 = a4;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 1;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ATStoreMediaAssetLink__finishAsset_error_cancelPendingAssetsInBatch___block_invoke;
  block[3] = &unk_1E927E058;
  v12 = v8;
  v27 = v12;
  v28 = self;
  v13 = v9;
  v29 = v13;
  v30 = v32;
  v31 = a5;
  dispatch_sync(queue, block);
  callbackQueue = self->_callbackQueue;
  v17 = v11;
  v18 = 3221225472;
  v19 = __71__ATStoreMediaAssetLink__finishAsset_error_cancelPendingAssetsInBatch___block_invoke_33;
  v20 = &unk_1E927E058;
  v21 = self;
  v24 = v32;
  v15 = v12;
  v22 = v15;
  v16 = v13;
  v23 = v16;
  v25 = a5;
  dispatch_async(callbackQueue, &v17);
  -[ATStoreMediaAssetLink _setupActivityToResumeDownloads](self, "_setupActivityToResumeDownloads", v17, v18, v19, v20, v21);

  _Block_object_dispose(v32, 8);
}

- (int64_t)_ATAssetStateForStoreDownloadState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4)
    return 0;
  else
    return qword_1D19CF7C0[a3 - 2];
}

- (void)_setupActivityToResumeDownloads
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_canEnqueueAssetUnderCurrentEnvironmentConditions:(id)a3 didUpdatePauseReason:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  char v12;
  BOOL v13;
  int v15;
  ATStoreMediaAssetLink *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "isRestore"))
  {
    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isNetworkConstrained");

    if (!v9 || (objc_msgSend(v6, "allowDownloadOnConstrainedNetwork") & 1) != 0)
      goto LABEL_11;
    if (a4)
      *a4 = (objc_msgSend(v6, "downloadPauseReason") & 2) == 0;
    objc_msgSend(v6, "setDownloadPauseReason:", objc_msgSend(v6, "downloadPauseReason") | 2);
    _ATLogCategoryStoreDownloads();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v6;
      v11 = "%{public}@ disallowing download of %{public}@ as the network is constrained";
LABEL_16:
      _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x16u);
    }
LABEL_17:

    v13 = 0;
    goto LABEL_18;
  }
  +[ATRestoreManager sharedManager](ATRestoreManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasProperNetworkConditions") & 1) == 0)
  {
    v12 = objc_msgSend(v6, "isPrioritized");

    if ((v12 & 1) != 0)
      goto LABEL_11;
    if (a4)
      *a4 = (objc_msgSend(v6, "downloadPauseReason") & 4) == 0;
    objc_msgSend(v6, "setDownloadPauseReason:", objc_msgSend(v6, "downloadPauseReason") | 4);
    _ATLogCategoryStoreDownloads();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v6;
      v11 = "%{public}@ disallowing restore of %{public}@ due to current network conditions";
      goto LABEL_16;
    }
    goto LABEL_17;
  }

LABEL_11:
  v13 = 1;
LABEL_18:

  return v13;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  if (objc_msgSend(a3, "isRemoteServerLikelyReachable"))
    -[ATStoreMediaAssetLink _setupActivityToResumeDownloads](self, "_setupActivityToResumeDownloads");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadService, 0);
  objc_storeStrong((id *)&self->_downloadsPendingEnqueue, 0);
  objc_storeStrong((id *)&self->_resumableAssets, 0);
  objc_storeStrong((id *)&self->_cancelledAssets, 0);
  objc_storeStrong((id *)&self->_enqueuedRestoreAssets, 0);
  objc_storeStrong((id *)&self->_enqueuedDownloadAssets, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_resumeQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 96) && !objc_msgSend(*(id *)(v1 + 48), "count"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
      v3 = dispatch_time(0, 5000000000);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(NSObject **)(v4 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_2;
      block[3] = &unk_1E927E120;
      block[4] = v4;
      dispatch_after(v3, v5, block);
    }
  }
}

void __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD block[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4320;
  v24 = __Block_byref_object_dispose__4321;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRemoteServerLikelyReachable");

  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_3;
  block[3] = &unk_1E927E080;
  block[4] = v4;
  block[5] = &v30;
  block[6] = &v26;
  block[7] = &v20;
  dispatch_sync(v6, block);
  if (!*((_DWORD *)v31 + 6))
  {
    v7 = *((_DWORD *)v27 + 6) ? v3 : 0;
    if (v7 == 1)
    {
      _ATLogCategoryStoreDownloads_Oversize();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = v21[5];
        *(_DWORD *)buf = 138543618;
        v35 = v9;
        v36 = 2114;
        v37 = v10;
        _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming downloads for %{public}@", buf, 0x16u);
      }

      v11 = *(void **)(a1 + 32);
      objc_msgSend((id)v21[5], "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "enqueueAssets:force:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(NSObject **)(v14 + 24);
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_34;
      v17[3] = &unk_1E927E148;
      v17[4] = v14;
      v18 = v13;
      v16 = v13;
      dispatch_sync(v15, v17);

    }
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_3(_QWORD *a1)
{
  *(_BYTE *)(a1[4] + 96) = 0;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 48), "count");
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 72), "count");
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 72));
}

void __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_34(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minusSet:", v3);

  _ATLogCategoryStoreDownloads_Oversize();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 72);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Remaining downloads to resume %{public}@", (uint8_t *)&v7, 0x16u);
  }

}

void __71__ATStoreMediaAssetLink__finishAsset_error_cancelPendingAssetsInBatch___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "resumeData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "count");
  if (v2
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0
    && v3 <= 4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addObject:", *(_QWORD *)(a1 + 32));
    _ATLogCategoryStoreDownloads();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v18 = 138543618;
      v19 = v5;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Caching resumeData for %{public}@", (uint8_t *)&v18, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "removeObject:", *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 48);
  if (!v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObject:", *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(a1 + 48);
  }
  if (v7)
    v8 = v2 == 0;
  else
    v8 = 1;
  v10 = v8 || v3 > 4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
  _ATLogCategoryStoreDownloads();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v2 != 0;
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v15 = "finished";
    else
      v15 = "resumable";
    v16 = objc_msgSend(*(id *)(v13 + 72), "count");
    v17 = *(unsigned __int8 *)(a1 + 64);
    v18 = 138544642;
    v19 = v13;
    v20 = 2114;
    v21 = v14;
    v22 = 2080;
    v23 = v15;
    v24 = 1024;
    v25 = v12;
    v26 = 1024;
    v27 = v16;
    v28 = 1024;
    v29 = v17;
    _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ treating %{public}@ as %s - hasResumeData %d, pendingResumeAssetCount %d, cancelPendingAssetsInBatch=%d", (uint8_t *)&v18, 0x32u);
  }

}

void __71__ATStoreMediaAssetLink__finishAsset_error_cancelPendingAssetsInBatch___block_invoke_33(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = WeakRetained;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    objc_msgSend(WeakRetained, "assetLink:didFinishAsset:error:retryable:cancelPendingAssetsInBatch:", v4, v5, v3, 1, *(unsigned __int8 *)(a1 + 64));
  else
    objc_msgSend(WeakRetained, "assetLink:didPauseAsseDownload:error:", v4, v5, v3);

}

void __83__ATStoreMediaAssetLink_ATStoreDownloadService_didUpdateProgressForAsset_progress___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "assetLink:didUpdateAsset:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(float *)(a1 + 48));

}

void __89__ATStoreMediaAssetLink_ATStoreDownloadService_didChangeStateForAsset_oldState_newState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "assetLink:didTransitionAssetStates:", v3, v4);

}

uint64_t __41__ATStoreMediaAssetLink_prioritizeAsset___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "prioritizeAsset:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "prioritizeAsset:", *(_QWORD *)(a1 + 40));
  return result;
}

void __38__ATStoreMediaAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  int v8;
  id *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "containsObject:", v7, (_QWORD)v11);
        v9 = *(id **)(a1 + 40);
        if (v8 || (v10 = objc_msgSend(v9[7], "containsObject:", v7), v9 = *(id **)(a1 + 40), v10))
        {
          objc_msgSend(v9[8], "addObject:", v7);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
        }
        else
        {
          objc_msgSend(v9[9], "removeObject:", v7);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __45__ATStoreMediaAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  id *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (!v3)
    goto LABEL_26;
  v4 = v3;
  v5 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v18 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (objc_msgSend(v7, "isRestore", (_QWORD)v17)
        && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "containsObject:", v7)
        || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "containsObject:", v7))
      {
        v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
LABEL_19:
        objc_msgSend(*v8, "addObject:", v7);
        continue;
      }
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "count");
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "count") + v9;
      if (v10 >= objc_msgSend(*(id *)(a1 + 40), "maximumBatchSize"))
      {
        _ATLogCategoryStoreDownloads();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v22 = v16;
          v23 = 2114;
          v24 = v7;
          _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ not enqueuing %{public}@ as the link is at full capacity", buf, 0x16u);
        }

        goto LABEL_26;
      }
      if ((objc_msgSend(v7, "isPrioritized") & 1) != 0 || *(_BYTE *)(a1 + 72))
        goto LABEL_17;
      buf[0] = 0;
      v11 = objc_msgSend(*(id *)(a1 + 40), "_canEnqueueAssetUnderCurrentEnvironmentConditions:didUpdatePauseReason:", v7, buf);
      if ((v11 & 1) == 0 && buf[0])
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v7);
      if (v11)
      {
LABEL_17:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
        objc_msgSend(v7, "setDownloadPauseReason:", 0);
        v12 = objc_msgSend(v7, "isRestore");
        v13 = *(_QWORD *)(a1 + 40);
        v14 = (id *)(v13 + 48);
        v8 = (id *)(v13 + 56);
        if (!v12)
          v8 = v14;
        goto LABEL_19;
      }
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v4)
      continue;
    break;
  }
LABEL_26:

}

void __30__ATStoreMediaAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 0;
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
    objc_msgSend(v3, "unionSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    objc_msgSend(v3, "unionSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeDownloadObserver:");
    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterObserver:", *(_QWORD *)(a1 + 32));

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__ATStoreMediaAssetLink_close__block_invoke_2;
    v8[3] = &unk_1E927E148;
    v8[4] = v5;
    v9 = v3;
    v7 = v3;
    dispatch_async(v6, v8);

  }
}

void __30__ATStoreMediaAssetLink_close__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetLink:didCloseWithOutstandingAssets:", v2, v3);

}

void __29__ATStoreMediaAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addDownloadObserver:");
    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerObserver:", *(_QWORD *)(a1 + 32));

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__ATStoreMediaAssetLink_open__block_invoke_2;
    block[3] = &unk_1E927E120;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __29__ATStoreMediaAssetLink_open__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLink:didOpenWithPendingAssets:", *(_QWORD *)(a1 + 32), 0);

}

@end
