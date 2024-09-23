@implementation ATDeviceSyncSessionAssetTask

- (ATDeviceSyncSessionAssetTask)initWithDataClass:(id)a3 onMessageLink:(id)a4
{
  ATDeviceSyncSessionAssetTask *v4;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *clientAssetsRemaining;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *clientAssetsInProgress;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *serverAssetsInProgress;
  uint64_t v11;
  NSMutableArray *finishedAssets;
  uint64_t v13;
  ATAssetLinkController *assetController;
  uint64_t v15;
  NSMutableDictionary *detailedProgress;
  uint64_t v17;
  NSMutableDictionary *syncProgresByAssetType;
  NSMutableSet *v19;
  NSMutableSet *assetStreams;
  objc_class *v21;
  const char *Name;
  dispatch_queue_t v23;
  OS_dispatch_queue *workQueue;
  uint64_t v25;
  NSMapTable *assetToBytesMap;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)ATDeviceSyncSessionAssetTask;
  v4 = -[ATDeviceSyncSessionTask initWithDataClass:onMessageLink:](&v42, sel_initWithDataClass_onMessageLink_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    clientAssetsRemaining = v4->_clientAssetsRemaining;
    v4->_clientAssetsRemaining = v5;

    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    clientAssetsInProgress = v4->_clientAssetsInProgress;
    v4->_clientAssetsInProgress = v7;

    v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    serverAssetsInProgress = v4->_serverAssetsInProgress;
    v4->_serverAssetsInProgress = v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    finishedAssets = v4->_finishedAssets;
    v4->_finishedAssets = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    assetController = v4->_assetController;
    v4->_assetController = (ATAssetLinkController *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    detailedProgress = v4->_detailedProgress;
    v4->_detailedProgress = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    syncProgresByAssetType = v4->_syncProgresByAssetType;
    v4->_syncProgresByAssetType = (NSMutableDictionary *)v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    assetStreams = v4->_assetStreams;
    v4->_assetStreams = v19;

    v4->_addedTransportUpgradeException = 0;
    v4->_totalAssetSize = 0;
    v4->_retrySendingAssetMetricsCount = 0;
    v21 = (objc_class *)objc_opt_class();
    Name = class_getName(v21);
    v23 = dispatch_queue_create(Name, 0);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v25 = objc_claimAutoreleasedReturnValue();
    assetToBytesMap = v4->_assetToBytesMap;
    v4->_assetToBytesMap = (NSMapTable *)v25;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    +[ATClientController sharedInstance](ATClientController, "sharedInstance", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allClients");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v39 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (objc_msgSend(v33, "conformsToProtocol:", &unk_1EFC7B550))
          {
            objc_msgSend(v33, "assetDataClass");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATSessionTask dataClass](v4, "dataClass");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v34, "isEqualToString:", v35);

            if (v36)
            {
              objc_storeWeak((id *)&v4->_assetClient, v33);
              goto LABEL_13;
            }
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v30)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v4;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[ATDeviceSyncSessionTask queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[ATDeviceSyncSessionTask queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ATDeviceSyncSessionAssetTask_cancel__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)sessionGroupingKey
{
  return CFSTR("ATDeviceSyncSessionAssetTaskGroupingKey");
}

- (void)updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)a4
{
  void *v6;
  double v7;
  void *v8;
  id v9;

  -[ATSessionTask setCompletedItemCount:](self, "setCompletedItemCount:", a3);
  -[ATSessionTask setTotalItemCount:](self, "setTotalItemCount:", a4);
  -[ATSessionTask totalBytesToTransfer](self, "totalBytesToTransfer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "unsignedLongLongValue"))
  {
    -[ATSessionTask totalBytesTransferred](self, "totalBytesTransferred");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (double)(unint64_t)objc_msgSend(v6, "unsignedLongLongValue");
    -[ATSessionTask totalBytesToTransfer](self, "totalBytesToTransfer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask setProgress:](self, "setProgress:", v7 / (double)(unint64_t)objc_msgSend(v8, "unsignedLongLongValue"));

  }
  else
  {
    -[ATSessionTask setProgress:](self, "setProgress:", 0.0);
  }

}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATDeviceSyncSessionAssetTask *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ATDeviceSyncSessionTask queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ATDeviceSyncSessionAssetTask_messageLink_didReceiveRequest___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)assetLinkController:(id)a3 didFinishAsset:(id)a4
{
  -[ATDeviceSyncSessionAssetTask _handleFinishedAsset:](self, "_handleFinishedAsset:", a4);
}

- (void)assetLinkController:(id)a3 didProcessFinishedAsset:(id)a4
{
  -[ATDeviceSyncSessionAssetTask _handleFinishedAsset:](self, "_handleFinishedAsset:", a4);
}

- (void)assetLinkController:(id)a3 didUpdateAsset:(id)a4
{
  -[ATDeviceSyncSessionAssetTask _handleUpdatedAsset:](self, "_handleUpdatedAsset:", a4);
}

- (void)_handleFinishedAsset:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  -[ATDeviceSyncSessionTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ATDeviceSyncSessionAssetTask__handleFinishedAsset___block_invoke;
  block[3] = &unk_1E927E148;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  dispatch_sync(v5, block);

  -[ATDeviceSyncSessionTask queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __53__ATDeviceSyncSessionAssetTask__handleFinishedAsset___block_invoke_2;
  v10[3] = &unk_1E927E148;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, v10);

}

- (void)_handleUpdatedAsset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ATDeviceSyncSessionTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ATDeviceSyncSessionAssetTask__handleUpdatedAsset___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleBeginAssetTaskRequest:(id)a3 onMessagLink:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  ATDetailedProgressInfoForAssetType *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  id obja;
  ATDeviceSyncSessionAssetTask *v69;
  _QWORD v70[5];
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  _BYTE v96[128];
  _QWORD v97[2];
  _QWORD v98[2];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assetClient);

  if (WeakRetained)
  {
    v59 = v7;
    objc_msgSend(v6, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("_BeginAssetTaskTotalCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v6, "parameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("_BeginAssetTaskDetailedCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("InstalledAssetMetrics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKey:", CFSTR("InstalledMediaAssetMetrics"));
    v60 = v6;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("_BeginAssetTaskTrackByteCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedLongLongValue");

    _ATLogCategoryDeviceSync();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v85 = self;
      v86 = 2048;
      v87 = v11;
      v88 = 2048;
      v89 = v18;
      v90 = 2114;
      v91 = (uint64_t)v13;
      v92 = 2114;
      v93 = (uint64_t)v15;
      _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: peer is going to request %lu assets, %llu total bytes (for track assets), detailed counts=%{public}@ installedAssetMetrics=%{public}@", buf, 0x34u);
    }
    v57 = v11;
    v58 = v15;

    v56 = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask setTotalBytesToTransfer:](self, "setTotalBytesToTransfer:", v20);

    objc_msgSend(&unk_1E928B770, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(&unk_1E928B788, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v24, "unsignedIntegerValue");

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v65 = v13;
    objc_msgSend(v13, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
    v69 = self;
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v80 != v27)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
          v97[0] = CFSTR("TotalCount");
          objc_msgSend(v65, "objectForKey:", v29, v54);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v97[1] = CFSTR("CompletedCount");
          v98[0] = v30;
          v98[1] = &unk_1E928B758;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          self = v69;
          -[NSMutableDictionary setObject:forKey:](v69->_detailedProgress, "setObject:forKey:", v31, v29);

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
      }
      while (v26);
    }

    objc_msgSend(v61, "objectForKey:", CFSTR("DetailedRequestInfoByAssetType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKey:", CFSTR("DetailedDownloadInfoByAssetType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v33, "mutableCopy");

    _ATLogCategoryDeviceSync();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v85 = self;
      v86 = 2114;
      v87 = (uint64_t)v32;
      v88 = 2114;
      v89 = (uint64_t)v66;
      _os_log_impl(&dword_1D1868000, v34, OS_LOG_TYPE_ERROR, "%{public}@: detailedRequestDict %{public}@, detailedDownloadDict %{public}@", buf, 0x20u);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(v32, "allKeys");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v75, v96, 16);
    if (obja)
    {
      v63 = *(_QWORD *)v76;
      v64 = v32;
      do
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(_QWORD *)v76 != v63)
            objc_enumerationMutation(v62);
          v36 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v32, "objectForKey:", v36, v54);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectForKey:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38)
          {
            objc_msgSend(v38, "objectForKey:", CFSTR("TotalAssetsToSync"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "unsignedLongLongValue");

            objc_msgSend(v39, "objectForKey:", CFSTR("TotalBytesToSync"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "unsignedLongLongValue");

            if (v37)
              goto LABEL_20;
          }
          else
          {
            v41 = 0;
            v43 = 0;
            if (v37)
            {
LABEL_20:
              objc_msgSend(v37, "objectForKey:", CFSTR("TotalAssetsToSync"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "unsignedLongLongValue");

              objc_msgSend(v37, "objectForKey:", CFSTR("TotalBytesToSync"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v46, "unsignedLongLongValue");

              goto LABEL_23;
            }
          }
          v45 = 0;
          v47 = 0;
LABEL_23:
          v48 = -[ATDetailedProgressInfoForAssetType initWithAssetType:assetCountToSync:byteCountToSync:assetCountSynced:byteCountSyned:]([ATDetailedProgressInfoForAssetType alloc], "initWithAssetType:assetCountToSync:byteCountToSync:assetCountSynced:byteCountSyned:", v36, v45 + v41, v47 + v43, v41, v43);
          -[NSMutableDictionary setObject:forKey:](v69->_syncProgresByAssetType, "setObject:forKey:", v48, v36);
          _ATLogCategoryDeviceSync();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544642;
            v85 = v69;
            v86 = 2114;
            v87 = (uint64_t)v36;
            v88 = 2048;
            v89 = v41;
            v90 = 2048;
            v91 = v43;
            v92 = 2048;
            v93 = v45;
            v94 = 2048;
            v95 = v47;
            _os_log_impl(&dword_1D1868000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@: asset type %{public}@ downloaded asset count %llu, downloaded byte count %llu, asset count to download %llu byte count to download %llu", buf, 0x3Eu);
          }

          v32 = v64;
        }
        obja = (id)objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v75, v96, 16);
      }
      while (obja);
    }

    -[ATDeviceSyncSessionAssetTask _updateProperties](v69, "_updateProperties");
    -[ATSessionTask setTotalItemCount:](v69, "setTotalItemCount:", -[ATSessionTask totalItemCount](v69, "totalItemCount") + v57);
    v6 = v60;
    objc_msgSend(v60, "responseWithError:parameters:", 0, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __74__ATDeviceSyncSessionAssetTask__handleBeginAssetTaskRequest_onMessagLink___block_invoke_135;
    v70[3] = &unk_1E927D030;
    v70[4] = v69;
    v71 = v50;
    v72 = v55;
    v73 = v54;
    v74 = v56;
    v51 = v50;
    v7 = v59;
    objc_msgSend(v59, "sendResponse:withCompletion:", v51, v70);

    v52 = v65;
    v53 = v58;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseWithError:parameters:", v52, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __74__ATDeviceSyncSessionAssetTask__handleBeginAssetTaskRequest_onMessagLink___block_invoke;
    v83[3] = &unk_1E927E0D0;
    v83[4] = self;
    objc_msgSend(v7, "sendResponse:withCompletion:", v53, v83);
    -[ATDeviceSyncSessionAssetTask _finishTaskWithError:](self, "_finishTaskWithError:", 0);
  }

}

- (void)_handleEndAssetTaskRequest:(id)a3 onMessagLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 requestsComplete;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("_EndAssetTaskError"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10 && !self->_requestsComplete)
  {
    _ATLogCategoryDeviceSync();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2048;
      v23 = v10;
      _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: cancelling due to error on the peer. err=%ld", buf, 0x16u);
    }

    -[ATDeviceSyncSessionAssetTask cancel](self, "cancel");
  }
  else
  {
    self->_peerRequestsComplete = 1;
    requestsComplete = self->_requestsComplete;
    _ATLogCategoryDeviceSync();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (requestsComplete)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        v21 = self;
        _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: all asset transfers are completed - finishing task", buf, 0xCu);
      }

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), v10, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATDeviceSyncSessionAssetTask _finishTaskWithError:](self, "_finishTaskWithError:", v14);

      }
      else
      {
        -[ATDeviceSyncSessionAssetTask _finishTaskWithError:](self, "_finishTaskWithError:", 0);
      }
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        v21 = self;
        _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: peer is finished - waiting for our assets to complete", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v7, "responseWithError:parameters:", 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__ATDeviceSyncSessionAssetTask__handleEndAssetTaskRequest_onMessagLink___block_invoke;
  v18[3] = &unk_1E927E1C0;
  v18[4] = self;
  v19 = v16;
  v17 = v16;
  objc_msgSend(v6, "sendResponse:withCompletion:", v17, v18);

}

- (void)_handleAssetRequest:(id)a3 onMessagLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id WeakRetained;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CF7680];
    objc_msgSend(v6, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetWithSerializedAsset:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _ATLogCategoryDeviceSync();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - processing download request for asset %{public}@", buf, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_assetClient);
    if (WeakRetained)
    {
      if ((objc_msgSend(v12, "isDownload") & 1) != 0)
      {
        -[NSMutableOrderedSet addObject:](self->_serverAssetsInProgress, "addObject:", v12);
        -[ATDeviceSyncSessionAssetTask _updateTaskDescription](self, "_updateTaskDescription");
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_2;
        v24[3] = &unk_1E927D180;
        v24[4] = self;
        v25 = v12;
        v26 = v6;
        v27 = v7;
        objc_msgSend(WeakRetained, "getDataForAsset:withCompletion:", v25, v24);

LABEL_17:
        goto LABEL_18;
      }
      _ATLogCategoryDeviceSync();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v29 = self;
        v30 = 2114;
        v31 = v12;
        _os_log_impl(&dword_1D1868000, v22, OS_LOG_TYPE_ERROR, "%{public}@ - received unsupported upload request for asset %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "responseWithError:parameters:", v23, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = &__block_literal_global_142;
    }
    else
    {
      _ATLogCategoryDeviceSync();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "dataclass");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = self;
        v30 = 2114;
        v31 = v18;
        _os_log_impl(&dword_1D1868000, v17, OS_LOG_TYPE_ERROR, "%{public}@ - no client handles asset data class '%{public}@'", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "responseWithError:parameters:", v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = &__block_literal_global_140;
    }
    objc_msgSend(v7, "sendResponse:withCompletion:", v20, v21);

    goto LABEL_17;
  }
  _ATLogCategoryDeviceSync();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_ERROR, "%{public}@ - Rejecting asset request with no params: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 23, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseWithError:parameters:", v16, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sendResponse:withCompletion:", v12, &__block_literal_global_1889);
LABEL_18:

}

- (void)_handleUpdateSessionTaskRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *detailedProgress;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("_TotalItemCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("_CompletedItemCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("SyncedAssetATAssetType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v35 = v11;
    objc_msgSend(v6, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("ATLibraryIdentifierForAsset"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("AssetDownloadedWithError"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "parameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("AssetProgress"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "parameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("FileSize"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v37 = objc_msgSend(v18, "unsignedLongLongValue");
    else
      v37 = 0;
    v36 = v9;
    if (v20)
      v34 = objc_msgSend(v20, "unsignedLongLongValue");
    else
      v34 = 0;
    v21 = v13;
    -[NSMutableDictionary objectForKey:](self->_syncProgresByAssetType, "objectForKey:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v7;
    if (v16)
      v24 = objc_msgSend(v16, "BOOLValue") ^ 1;
    else
      v24 = 1;
    _ATLogCategoryDeviceSync();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544642;
      v40 = self;
      v41 = 2114;
      v42 = v38;
      v43 = 2114;
      v44 = v21;
      v45 = 1024;
      v46 = v24;
      v47 = 2048;
      v48 = v34;
      v49 = 2048;
      v50 = v37;
      _os_log_impl(&dword_1D1868000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Asset id %{public}@ finished - type:%{public}@, succeeded:%d, fileSize:%llu, deltaBytes:%llu", buf, 0x3Au);
    }

    if (v22)
      objc_msgSend(v22, "updateAsset:syncedWithSuccess:bytesDownloaded:", v38, v24, v37);

    v11 = v35;
    v9 = v36;
    v7 = v23;
    v13 = v21;
  }
  -[ATDeviceSyncSessionAssetTask updateProgressWithCount:totalItemCount:](self, "updateProgressWithCount:totalItemCount:", objc_msgSend(v11, "unsignedIntegerValue"), objc_msgSend(v9, "unsignedIntegerValue"));
  objc_msgSend(v6, "parameters");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", CFSTR("_DetailedProgress"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (NSMutableDictionary *)objc_msgSend(v27, "mutableCopy");
  detailedProgress = self->_detailedProgress;
  self->_detailedProgress = v28;

  -[ATDeviceSyncSessionAssetTask _updateProperties](self, "_updateProperties");
  objc_msgSend(v6, "responseWithError:parameters:", 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendResponse:withCompletion:", v30, 0);

  if (v9 == v11)
  {
    _ATLogCategoryDeviceSync();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = self;
      _os_log_impl(&dword_1D1868000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: all downloads complete - waiting for task to finish", buf, 0xCu);
    }

    if (self->_addedTransportUpgradeException)
    {
      -[ATDeviceSyncSessionTask messageLink](self, "messageLink");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "socket");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeTransportUpgradeException");

      self->_addedTransportUpgradeException = 0;
    }
  }

}

- (void)_handleInstalledAssetMetricsChanged:(id)a3 onMessageLink:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  ATDetailedProgressInfoForAssetType *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  ATDetailedProgressInfoForAssetType *v40;
  ATDetailedProgressInfoForAssetType *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  NSMutableDictionary *syncProgresByAssetType;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t m;
  uint64_t v56;
  ATDetailedProgressInfoForAssetType *v57;
  void *v58;
  void *v59;
  void *v60;
  id obj;
  id obja;
  void *v63;
  void *v64;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint8_t v86[128];
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("InstalledMediaAssetMetrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _ATLogCategoryDeviceSync_Oversize();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v88 = self;
    v89 = 2114;
    v90 = v8;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Installed media metrics changed - media metrics dict %{public}@", buf, 0x16u);
  }

  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("KeepLocalAssetByteCountForSyncSettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");
    objc_msgSend(v8, "objectForKey:", CFSTR("DownloadedAssetByteCountForSyncSettings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedLongLongValue");

    objc_msgSend(v8, "objectForKey:", CFSTR("DetailedRequestInfoByAssetType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("DetailedDownloadInfoByAssetType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v14;
    v60 = v8;
    v63 = v15;
    if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
    {
      v66 = v13 + v11;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v6, v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      objc_msgSend(v15, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v76 != v19)
              objc_enumerationMutation(obj);
            v21 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
            objc_msgSend(v63, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKey:", CFSTR("TotalBytesToSync"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "unsignedLongLongValue");

            objc_msgSend(v22, "objectForKey:", CFSTR("TotalAssetsToSync"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "unsignedLongLongValue");

            v27 = -[ATDetailedProgressInfoForAssetType initWithAssetType:assetCountToSync:byteCountToSync:assetCountSynced:byteCountSyned:]([ATDetailedProgressInfoForAssetType alloc], "initWithAssetType:assetCountToSync:byteCountToSync:assetCountSynced:byteCountSyned:", v21, v26, v66, v26, v24);
            objc_msgSend(v16, "setObject:forKey:", v27, v21);

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
        }
        while (v18);
      }

      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      objc_msgSend(v64, "allKeys");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v72 != v30)
              objc_enumerationMutation(obja);
            v32 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
            objc_msgSend(v64, "objectForKey:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKey:", CFSTR("TotalBytesToSync"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "unsignedLongLongValue");

            objc_msgSend(v33, "objectForKey:", CFSTR("TotalAssetsToSync"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "unsignedLongLongValue");

            objc_msgSend(v33, "objectForKey:", CFSTR("TotalBytesSynced"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "unsignedLongLongValue");

            objc_msgSend(v16, "objectForKey:", v32);
            v40 = (ATDetailedProgressInfoForAssetType *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              v41 = v40;
              -[ATDetailedProgressInfoForAssetType updateAssetsToDownload:](v40, "updateAssetsToDownload:", v37);
              -[ATDetailedProgressInfoForAssetType updateBytesDownloaded:](v41, "updateBytesDownloaded:", v39);
              -[ATDetailedProgressInfoForAssetType updateBytesToDownload:](v41, "updateBytesToDownload:", v35);
            }
            else
            {
              v41 = -[ATDetailedProgressInfoForAssetType initWithAssetType:assetCountToSync:byteCountToSync:assetCountSynced:byteCountSyned:]([ATDetailedProgressInfoForAssetType alloc], "initWithAssetType:assetCountToSync:byteCountToSync:assetCountSynced:byteCountSyned:", v32, v37, v66, 0, v39);
              objc_msgSend(v16, "setObject:forKey:", v41, v32);
            }

          }
          v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
        }
        while (v29);
      }

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(v16, "allKeys");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v68;
        do
        {
          for (k = 0; k != v44; ++k)
          {
            if (*(_QWORD *)v68 != v45)
              objc_enumerationMutation(v42);
            v47 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
            syncProgresByAssetType = self->_syncProgresByAssetType;
            objc_msgSend(v16, "objectForKey:", v47);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](syncProgresByAssetType, "setObject:forKey:", v49, v47);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
        }
        while (v44);
      }

      v6 = v58;
      v5 = v59;
    }
    else
    {
      -[NSMutableDictionary allKeys](self->_syncProgresByAssetType, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v51 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
      if (!v51)
        goto LABEL_32;
      v52 = v51;
      v53 = v6;
      v54 = *(_QWORD *)v80;
      do
      {
        for (m = 0; m != v52; ++m)
        {
          if (*(_QWORD *)v80 != v54)
            objc_enumerationMutation(v16);
          v56 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * m);
          v57 = -[ATDetailedProgressInfoForAssetType initWithAssetType:assetCountToSync:byteCountToSync:]([ATDetailedProgressInfoForAssetType alloc], "initWithAssetType:assetCountToSync:byteCountToSync:", v56, 0, 0);
          -[NSMutableDictionary setObject:forKey:](self->_syncProgresByAssetType, "setObject:forKey:", v57, v56);

        }
        v52 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
      }
      while (v52);
      v6 = v53;
    }
    v8 = v60;
    v15 = v63;
LABEL_32:

    -[ATDeviceSyncSessionAssetTask _updateProperties](self, "_updateProperties");
  }
  objc_msgSend(v5, "responseWithError:parameters:", 0, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendResponse:withCompletion:", v50, 0);

}

- (void)_handleAssetDownloadProgressed:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  ATDeviceSyncSessionAssetTask *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("AssetProgress"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  objc_msgSend(v6, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("AssetType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_syncProgresByAssetType, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _ATLogCategoryDeviceSync();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543874;
      v18 = self;
      v19 = 2114;
      v20 = v12;
      v21 = 2048;
      v22 = v10;
      _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating sync progress for asset type: %{public}@, bytesDownloaded:%llu", (uint8_t *)&v17, 0x20u);
    }

    objc_msgSend(v13, "updateBytesDownloaded:", v10);
    -[ATDeviceSyncSessionAssetTask _updateProperties](self, "_updateProperties");
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_ERROR, "%{public}@: No ATDetailedProgressInfoForAssetType for assetType: %{public}@", (uint8_t *)&v17, 0x16u);
    }

  }
  objc_msgSend(v6, "responseWithError:parameters:", 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendResponse:withCompletion:", v16, 0);

}

- (void)_assetRequestsCompletedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ATDeviceSyncSessionAssetTask *v9;

  v4 = a3;
  -[ATDeviceSyncSessionTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_updateDetailedProgressForCompletedAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "variantOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AssetParts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_detailedProgress, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("CompletedCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue") + 1;

    objc_msgSend(v7, "objectForKey:", CFSTR("TotalCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    v15[0] = CFSTR("TotalCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("CompletedCount");
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_detailedProgress, "setObject:forKey:", v14, v6);
  }

}

- (void)_updateProperties
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  v3 = (void *)-[NSMutableDictionary copy](self->_detailedProgress, "copy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR("DetailedProgress"));

  -[ATDeviceSyncSessionAssetTask _serializedAssetSyncProgressFromAssetCacheDictionary:](self, "_serializedAssetSyncProgressFromAssetCacheDictionary:", self->_syncProgresByAssetType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("DetailedProgressByAssetType"));

  -[ATThroughputCalculator throughput](self->_throughputCalculator, "throughput");
  if (v5 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("AverageThroughput"));

  }
  -[ATSessionTask setProperties:](self, "setProperties:", v7);

}

- (void)_updateTaskDescription
{
  NSObject *v3;
  _QWORD block[5];

  -[ATDeviceSyncSessionTask queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ATDeviceSyncSessionAssetTask__updateTaskDescription__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_finishTaskWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ATDeviceSyncSessionTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ATDeviceSyncSessionAssetTask__finishTaskWithError___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_serializedAssetRequestsFromRequestDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          +[ATDetailedRequestInfoForAssetType serializedRequestInfoFromATDetailedRequestInfoForAssetType:](ATDetailedRequestInfoForAssetType, "serializedRequestInfoFromATDetailedRequestInfoForAssetType:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v12, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v7);
  }

  _ATLogCategoryDeviceSync();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: serializedAssetsDictionary %{public}@", buf, 0x16u);
  }

  return v4;
}

- (id)_serializedAssetSyncProgressFromAssetCacheDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          +[ATDetailedProgressInfoForAssetType serializedProgressInfoFromATDetailedProgressInfoForAssetType:](ATDetailedProgressInfoForAssetType, "serializedProgressInfoFromATDetailedProgressInfoForAssetType:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v12, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v7);
  }

  _ATLogCategoryDeviceSync();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: serializedProgressDictionary %{public}@", buf, 0x16u);
  }

  return v4;
}

- (void)_sendUpdatedInstallMetrics
{
  NSObject *v3;
  _QWORD block[5];

  -[ATDeviceSyncSessionTask queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_updateCachedInstalledAssetMetricsWithNewMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSDictionary *v21;
  NSObject *v22;
  NSDictionary *installedAssetMetrics;
  NSDictionary *v24;
  NSDictionary *v25;
  NSDictionary *v26;
  NSDictionary *itemsWithEstimatedFileSize;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  ATDeviceSyncSessionAssetTask *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v46;
  __int16 v47;
  NSDictionary *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("InstalledMediaAssetMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DetailedRequestInfoByAssetType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v7 = v6;
    v34 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v34)
    {
      v28 = v6;
      v29 = v5;
      v30 = v4;
      v31 = *(_QWORD *)v42;
      v32 = v7;
      v33 = self;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v7);
          v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_progressMap, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKey:](v7, "objectForKey:", v9);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "getContributors");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v36 = v10;
          objc_msgSend(v10, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v38 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
                objc_msgSend(v11, "objectForKey:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v19)
                  -[NSDictionary addObject:](v12, "addObject:", v18);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
            }
            while (v15);
          }

          _ATLogCategoryDeviceSync();
          v20 = objc_claimAutoreleasedReturnValue();
          self = v33;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v46 = v33;
            v47 = 2114;
            v48 = v12;
            v49 = 2114;
            v50 = v9;
            _os_log_impl(&dword_1D1868000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing progress for %{public}@ asetType %{public}@ as they are cancelled assets", buf, 0x20u);
          }

          objc_msgSend(v36, "removeObjectsForKeys:", v12);
          v7 = v32;
        }
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v34);
      v5 = v29;
      v4 = v30;
      v6 = v28;
    }
  }
  else
  {
    -[NSMutableDictionary removeAllObjects](self->_progressMap, "removeAllObjects");
    _ATLogCategoryDeviceSync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v46 = self;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: No active downloads - clearing our progress map", buf, 0xCu);
    }
  }

  -[ATDeviceSyncSessionAssetTask _prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:](self, "_prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:", v4);
  v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  _ATLogCategoryDeviceSync_Oversize();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    installedAssetMetrics = self->_installedAssetMetrics;
    *(_DWORD *)buf = 138543874;
    v46 = self;
    v47 = 2114;
    v48 = installedAssetMetrics;
    v49 = 2114;
    v50 = v4;
    _os_log_impl(&dword_1D1868000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating installed asset metrics from %{public}@ to %{public}@", buf, 0x20u);
  }

  v24 = self->_installedAssetMetrics;
  self->_installedAssetMetrics = v21;
  v25 = v21;

  -[NSDictionary objectForKey:](self->_installedAssetMetrics, "objectForKey:", CFSTR("ItemsWithEstimatedFileSize"));
  v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  itemsWithEstimatedFileSize = self->_itemsWithEstimatedFileSize;
  self->_itemsWithEstimatedFileSize = v26;

}

- (id)_prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v4, "objectForKey:", CFSTR("InstalledMediaAssetMetrics"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("DetailedRequestInfoByAssetType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATDeviceSyncSessionAssetTask _serializedAssetsToDownloadDictionaryWithUpdatedProgressFromDownloadDictionary:](self, "_serializedAssetsToDownloadDictionaryWithUpdatedProgressFromDownloadDictionary:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKey:", CFSTR("DetailedDownloadInfoByAssetType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATDeviceSyncSessionAssetTask _serializedDownloadedAssetsDictionaryFromDownloadedAssetsDictionary:](self, "_serializedDownloadedAssetsDictionaryFromDownloadedAssetsDictionary:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("DetailedRequestInfoByAssetType"));
      objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("DetailedDownloadInfoByAssetType"));
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("InstalledMediaAssetMetrics"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_getMetricsWithCurrentProgressForInflightAssetsFromAssetMetrics:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSObject *v19;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "objectForKey:", CFSTR("InstalledMediaAssetMetrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKey:", CFSTR("DetailedRequestInfoByAssetType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = v7;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v27)
  {
    v21 = v5;
    v22 = v3;
    v23 = 0;
    v24 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v8);
        v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v26, "objectForKey:", v10, v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_progressMap, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v12, "allValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v13);
              v16 += objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "unsignedLongLongValue");
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          }
          while (v15);
        }
        else
        {
          v16 = 0;
        }

        _ATLogCategoryDeviceSync();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v37 = v16;
          v38 = 2114;
          v39 = v10;
          _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "Updating bytes downloaded to %llu for assetType %{public}@", buf, 0x16u);
        }

        if (v16 && v11)
        {
          objc_msgSend(v11, "updateBytesSynced:", v16);
          v23 = 1;
        }

      }
      v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v27);

    v5 = v21;
    v3 = v22;
    if ((v23 & 1) != 0)
    {
      objc_msgSend(v21, "setObject:forKey:", v26, CFSTR("DetailedRequestInfoByAssetType"));
      objc_msgSend(v22, "setObject:forKey:", v21, CFSTR("InstalledMediaAssetMetrics"));
    }
  }
  else
  {

  }
  return v3;
}

- (id)_serializedAssetsToDownloadDictionaryWithUpdatedProgressFromDownloadDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATDetailedRequestInfoForAssetType serializedRequestInfoFromATDetailedRequestInfoForAssetType:](ATDetailedRequestInfoForAssetType, "serializedRequestInfoFromATDetailedRequestInfoForAssetType:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_serializedDownloadedAssetsDictionaryFromDownloadedAssetsDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATDetailedRequestInfoForAssetType serializedRequestInfoFromATDetailedRequestInfoForAssetType:](ATDetailedRequestInfoForAssetType, "serializedRequestInfoFromATDetailedRequestInfoForAssetType:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_getRawInstalledAssetMetricsFromAssetClient
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  ATDeviceSyncSessionAssetTask *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_assetClient);
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    _ATLogCategoryDeviceSync();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v12 = 138543362;
    v13 = self;
    v8 = "%{public}@: no ATAssetClient to get installed asset metrics";
LABEL_9:
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
    goto LABEL_13;
  }
  if (!objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EFC7B5B0))
  {
    _ATLogCategoryDeviceSync();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v12 = 138543362;
    v13 = self;
    v8 = "%{public}@: client doesn't conform to ATClient";
    goto LABEL_9;
  }
  v5 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject installedAssetMetrics](v5, "installedAssetMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATDeviceSyncSessionAssetTask _getMetricsWithCurrentProgressForInflightAssetsFromAssetMetrics:](self, "_getMetricsWithCurrentProgressForInflightAssetsFromAssetMetrics:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  _ATLogCategoryDeviceSync();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = self;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: client doesn't respond to selector", (uint8_t *)&v12, 0xCu);
  }

LABEL_13:
  v7 = 0;
LABEL_14:

  _ATLogCategoryDeviceSync_Oversize();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: raw installed asset metrics: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  return v7;
}

- (void)_loadInstalledAssetMetricsFromSyncClient
{
  NSDictionary *v3;
  NSDictionary *installedAssetMetrics;
  void *v5;
  NSDictionary *v6;
  NSDictionary *itemsWithEstimatedFileSize;
  id v8;

  -[ATDeviceSyncSessionAssetTask _getRawInstalledAssetMetricsFromAssetClient](self, "_getRawInstalledAssetMetricsFromAssetClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSyncSessionAssetTask _prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:](self, "_prepareInstalledAssetMetricsWithSerializedOutputFromClientMetrics:", v8);
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  installedAssetMetrics = self->_installedAssetMetrics;
  self->_installedAssetMetrics = v3;

  -[NSDictionary objectForKey:](self->_installedAssetMetrics, "objectForKey:", CFSTR("InstalledMediaAssetMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ItemsWithEstimatedFileSize"));
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  itemsWithEstimatedFileSize = self->_itemsWithEstimatedFileSize;
  self->_itemsWithEstimatedFileSize = v6;

}

- (unint64_t)_bytesDownloadedForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  ATDeviceSyncSessionAssetTask *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableDictionary objectForKey:](self->_progressMap, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "objectForKey:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
        _ATLogCategoryDeviceSync();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "shortDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543874;
          v16 = self;
          v17 = 2048;
          v18 = v11;
          v19 = 2114;
          v20 = v13;
          _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %llu bytes have been reported downloaded for %{public}@", (uint8_t *)&v15, 0x20u);

        }
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_removeAssetFromProgressMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  ATDeviceSyncSessionAssetTask *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableDictionary objectForKey:](self->_progressMap, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        _ATLogCategoryDeviceSync();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "shortDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138543618;
          v12 = self;
          v13 = 2114;
          v14 = v10;
          _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed %{public}@ from our progress map", (uint8_t *)&v11, 0x16u);

        }
        objc_msgSend(v8, "removeObjectForKey:", v6);
      }

    }
  }

}

- (id)_updateProgressAndGetFileProgressParamsForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  NSDictionary *itemsWithEstimatedFileSize;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  ATDeviceSyncSessionAssetTask *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "assetParts") & 1) != 0)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v6 = 0;
LABEL_24:

      goto LABEL_25;
    }
    -[NSMutableDictionary objectForKey:](self->_progressMap, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_progressMap, "setObject:forKey:", v9, v8);
    }
    v10 = objc_msgSend(v5, "totalBytes");
    v11 = v10;
    if (!v10)
    {
      itemsWithEstimatedFileSize = self->_itemsWithEstimatedFileSize;
      objc_msgSend(v5, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](itemsWithEstimatedFileSize, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v14, "unsignedLongLongValue");
    }
    objc_msgSend(v9, "objectForKey:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedLongLongValue");

    v17 = objc_msgSend(v5, "bytesRemaining");
    if (!v10)
    {
      if (v11 < v17)
      {
        _ATLogCategoryDeviceSync();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v29 = self;
          v30 = 2048;
          v31 = v11;
          v32 = 2114;
          v33 = v19;
          v34 = 2048;
          v35 = objc_msgSend(v5, "bytesRemaining");
          _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Undercalculated fileSize (%llu) for %{public}@ - bytesRemaining (%llu) ", buf, 0x2Au);

        }
        v20 = v11;
        goto LABEL_17;
      }
      v17 = objc_msgSend(v5, "bytesRemaining");
    }
    v20 = v11 - v17;
LABEL_17:
    if (v20 >= v16)
      v21 = v20 - v16;
    else
      v21 = 0;
    if (!v16 || (v6 = 0, v21 >= 0x40000))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v22, v7);

      v23 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, CFSTR("FileSize"), v25, CFSTR("AssetProgress"), v26, CFSTR("ATBytesDownloadedForAsset"), v8, CFSTR("AssetType"), v7, CFSTR("ATLibraryIdentifierForAsset"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_24;
  }
  v6 = 0;
LABEL_25:

  return v6;
}

- (void)_updateProgressWithBytesTransferred:(unint64_t)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(v6, "assetParts") & 1) != 0)
  {
    -[ATSessionTask totalBytesTransferred](self, "totalBytesTransferred");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongLongValue");

    -[ATSessionTask totalBytesToTransfer](self, "totalBytesToTransfer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    if (v8 + a3 >= v10)
      v11 = v10;
    else
      v11 = v8 + a3;
    objc_msgSend(v6, "assetType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NSMutableDictionary objectForKey:](self->_syncProgresByAssetType, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "updateBytesDownloaded:", a3);

    }
    -[ATDeviceSyncSessionAssetTask _updateProperties](self, "_updateProperties");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask setTotalBytesTransferred:](self, "setTotalBytesTransferred:", v15);

    if (v10)
      v16 = (double)v11 / (double)v10;
    else
      v16 = 0.0;
    -[ATSessionTask setProgress:](self, "setProgress:", v16);
    _ATLogCategoryDeviceSync();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[ATSessionTask progress](self, "progress");
      v19 = 134218752;
      v20 = v10;
      v21 = 2048;
      v22 = v11;
      v23 = 2048;
      v24 = v18;
      v25 = 2048;
      v26 = -[ATSessionTask completedItemCount](self, "completedItemCount");
      _os_log_impl(&dword_1D1868000, v17, OS_LOG_TYPE_DEFAULT, "total bytes to transfer:%llu, bytes transferred so far:%llu, progress:%f, completed asset count:%lu", (uint8_t *)&v19, 0x2Au);
    }

  }
}

- (void)_shouldDeviceReportSyncProgress
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 deviceShouldReportSyncProgress;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE buf[32];
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v3 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v20 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getNRPairedDeviceRegistryClass_block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E927E328;
    v22 = &v17;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)buf);
    v3 = (void *)v18[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    *(_QWORD *)&buf[24] = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
    {
      v9 = NanoRegistryLibrary();
      v8 = dlsym(v9, "NRWatchOSVersionForRemoteDevice");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(buf, 8);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NRProductVersionWatchOS __ATDeviceSyncSessionAssetTaskNRWatchOSVersionForRemoteDevice(NRDevice *__strong)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("ATDeviceSyncSessionAssetTask.m"), 27, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v10 = ((uint64_t (*)(id))v8)(v7);

    self->_deviceShouldReportSyncProgress = v10 < 0x40000;
  }
  else
  {
    _ATLogCategoryDeviceSync();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Paired Sync Registry reports no active paired device", buf, 0xCu);
    }

    v10 = -1;
  }
  _ATLogCategoryDeviceSync();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    deviceShouldReportSyncProgress = self->_deviceShouldReportSyncProgress;
    *(_DWORD *)buf = 138543874;
    if (deviceShouldReportSyncProgress)
      v14 = "will";
    else
      v14 = "will not";
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v14;
    _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Paired Device is running %u - companion %s report asset metrics", buf, 0x1Cu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedAssets, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_progressMap, 0);
  objc_storeStrong((id *)&self->_assetToBytesMap, 0);
  objc_storeStrong((id *)&self->_throughputCalculator, 0);
  objc_storeStrong((id *)&self->_assetStreams, 0);
  objc_storeStrong((id *)&self->_itemsWithEstimatedFileSize, 0);
  objc_storeStrong((id *)&self->_installedAssetMetrics, 0);
  objc_storeStrong((id *)&self->_syncProgresByAssetType, 0);
  objc_storeStrong((id *)&self->_detailedProgress, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_serverAssetsInProgress, 0);
  objc_storeStrong((id *)&self->_clientAssetsInProgress, 0);
  objc_storeStrong((id *)&self->_clientAssetsRemaining, 0);
  objc_destroyWeak((id *)&self->_assetClient);
}

void __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    _ATLogCategoryDeviceSync();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v12 = v3;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Not sending installed metrics as the task is cancelled/finished", buf, 0xCu);
    }
  }
  else
  {
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending updated installed metrics", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_getRawInstalledAssetMetricsFromAssetClient");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_updateCachedInstalledAssetMetricsWithNewMetrics:", v2);
    v6 = objc_alloc(MEMORY[0x1E0CF76A0]);
    objc_msgSend(*(id *)(a1 + 32), "dataClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithCommand:dataClass:parameters:", CFSTR("AssetMetrics"), v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));

    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_168;
    v10[3] = &unk_1E927CFE0;
    v10[4] = v9;
    objc_msgSend(v9, "sendRequest:withCompletion:", v8, v10);

  }
}

void __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_168(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_2;
  block[3] = &unk_1E927E198;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  dispatch_time_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    _ATLogCategoryDeviceSync();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v17 = 138543362;
      v18 = v3;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Not handling asset metrics response as the link is closed.", (uint8_t *)&v17, 0xCu);
    }
LABEL_5:

    return;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = 0;
      return;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_DWORD *)(v5 + 296);
  if (v6 > 2)
  {
    _ATLogCategoryDeviceSync();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296);
      v17 = 138544130;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      v23 = 1024;
      v24 = v16;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Error %{public}@, response error %{public}@ sending updated asset metrics - will NOT try sending metrics again, _retrySendingAssetMetricsCount=%d", (uint8_t *)&v17, 0x26u);

    }
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 296) = v6 + 1;
  _ATLogCategoryDeviceSync();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296);
    v17 = 138544130;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v10;
    v23 = 1024;
    v24 = v11;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Error %{public}@, response error %{public}@ sending updated asset metrics - will try again in 1 second, _retrySendingAssetMetricsCount=%d", (uint8_t *)&v17, 0x26u);

  }
  v12 = dispatch_time(0, 1000000000);
  dispatch_after(v12, MEMORY[0x1E0C80D38], &__block_literal_global_170);
}

void __58__ATDeviceSyncSessionAssetTask__sendUpdatedInstallMetrics__block_invoke_169()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.atc.installedassetmetricschanged"), 0, 0, 1u);
}

void __53__ATDeviceSyncSessionAssetTask__finishTaskWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  double v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  double v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  double *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  double v27;
  void *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  double v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0)
  {
    _ATLogCategoryDeviceSync();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(double *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v37 = v3;
      v4 = "%{public}@: is already finished";
LABEL_20:
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 256))
    {
      objc_msgSend((id)v5, "messageLink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "socket");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeTransportUpgradeException");

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 0;
      v5 = *(_QWORD *)(a1 + 32);
    }
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 176));

    if (WeakRetained)
    {
      v30 = MEMORY[0x1E0C809B0];
      v32 = __53__ATDeviceSyncSessionAssetTask__finishTaskWithError___block_invoke_2;
      v33 = &unk_1E927E148;
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      v11 = *(NSObject **)(v9 + 320);
      v31 = 3221225472;
      v34 = v9;
      v35 = v10;
      dispatch_sync(v11, &v30);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v30, v31, v32, v33, v34);
    v13 = v12 - *(double *)(*(_QWORD *)(a1 + 32) + 264);
    _ATLogCategoryDeviceSync();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v16 = v15 - *(double *)(*(_QWORD *)(a1 + 32) + 264);
      *(_DWORD *)buf = 134217984;
      v37 = v16;
      _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "Asset Task finished in %.2f seconds", buf, 0xCu);
    }

    v17 = (double)*(unint64_t *)(*(_QWORD *)(a1 + 32) + 272) / v13;
    _ATLogCategoryDeviceSync();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(double **)(a1 + 32);
      v20 = v19[39];
      v21 = objc_msgSend(v19, "totalItemCount");
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
      *(_DWORD *)buf = 134218752;
      v37 = v20;
      v38 = 2048;
      v39 = v21;
      v40 = 2048;
      v41 = v22;
      v42 = 2048;
      v43 = v17;
      _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "==> synced %lu/%lu total assets of %lld bytes total (%.2f bytes/s)", buf, 0x2Au);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "totalItemCount"))
    {
      objc_msgSend(*(id *)(a1 + 32), "messageLink");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "endpointType");

      if (!v24)
        ATReportEventAddDoubleToScalarKey();
    }
    objc_msgSend(*(id *)(a1 + 32), "totalItemCount");
    ATReportEventAddIntToScalarKey();
    ATReportEventAddIntToScalarKey();
    objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
    v25 = *(_QWORD *)(a1 + 40);
    _ATLogCategoryDeviceSync();
    v26 = objc_claimAutoreleasedReturnValue();
    v2 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = *(double *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "msv_description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2114;
        v39 = (uint64_t)v28;
        _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_ERROR, "%{public}@: finished. error=%{public}@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(double *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v37 = v29;
      v4 = "%{public}@: finished.";
      goto LABEL_20;
    }
  }

}

void __53__ATDeviceSyncSessionAssetTask__finishTaskWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  objc_msgSend(WeakRetained, "assetSyncDidCompleteWithError:", *(_QWORD *)(a1 + 40));

}

void __54__ATDeviceSyncSessionAssetTask__updateTaskDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "prettyName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v12);

        objc_msgSend(v11, "serializedAsset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v8);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v19, "prettyName", (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v20);

        objc_msgSend(v19, "serializedAsset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v16);
  }

  _ATLogCategoryDeviceSync();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v33 = v23;
    v34 = 2114;
    v35 = v2;
    _os_log_impl(&dword_1D1868000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemDescriptions=%{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCurrentItemDescriptions:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentItems:", v3);

}

void __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _ATLogCategoryDeviceSync();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "msv_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v5;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: all assets completed - waiting for clients to finish. error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: all assets completed - waiting for clients to finish.", buf, 0xCu);
  }

  dispatch_barrier_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 320), &__block_literal_global_161);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "removeObserver:");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("_EndAssetTaskError"));

  }
  v11 = objc_alloc(MEMORY[0x1E0CF76A0]);
  objc_msgSend(*(id *)(a1 + 40), "dataClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithCommand:dataClass:parameters:", CFSTR("EndAssetTask"), v12, v8);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke_2;
  v15[3] = &unk_1E927D660;
  v14 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = v14;
  objc_msgSend(v16, "sendRequest:withCompletion:", v13, v15);

}

void __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke_3;
  v11[3] = &unk_1E927D688;
  v12 = v6;
  v13 = v5;
  v8 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, v11);

}

void __65__ATDeviceSyncSessionAssetTask__assetRequestsCompletedWithError___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  _BYTE v23[10];
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32)
    || (objc_msgSend(*(id *)(a1 + 40), "error"), v2 = (void *)objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    _ATLogCategoryDeviceSync();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v5 = *(_QWORD *)(a1 + 32);
      v20 = 138543618;
      v21 = v4;
      v22 = 2114;
      *(_QWORD *)v23 = v5;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_ERROR, "%{public}@: failed to send request. err=%{public}@", (uint8_t *)&v20, 0x16u);
    }

    v6 = *(void **)(a1 + 48);
    if (*(_QWORD *)(a1 + 56) || *(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 48), "_finishTaskWithError:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_finishTaskWithError:", v17);

    }
  }
  else
  {
    v7 = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 300) = 1;
    objc_msgSend(*(id *)(a1 + 48), "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 48) + 301) && !*(_QWORD *)(a1 + 56))
      v7 = objc_msgSend(v8, "isCancelled");
    v10 = *(_QWORD *)(a1 + 56);
    _ATLogCategoryDeviceSync();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(unsigned __int8 *)(v13 + 301);
        v15 = objc_msgSend(v9, "isCancelled");
        objc_msgSend(*(id *)(a1 + 56), "msv_description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138544386;
        v21 = v13;
        v22 = 1024;
        *(_DWORD *)v23 = v7;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v14;
        v24 = 1024;
        v25 = v15;
        v26 = 2114;
        v27 = v16;
        _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_ERROR, "%{public}@: taskComplete:%d _peerRequestsComplete:%d, session cancelled:%d error=%{public}@", (uint8_t *)&v20, 0x28u);

      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 48);
      v19 = *(unsigned __int8 *)(v18 + 301);
      v20 = 138544130;
      v21 = v18;
      v22 = 1024;
      *(_DWORD *)v23 = v7;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = v19;
      v24 = 1024;
      v25 = objc_msgSend(v9, "isCancelled");
      _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: taskComplete:%d _peerRequestsComplete:%d, session cancelled:%d", (uint8_t *)&v20, 0x1Eu);
    }

    if (v7)
      objc_msgSend(*(id *)(a1 + 48), "_finishTaskWithError:", *(_QWORD *)(a1 + 56));

  }
}

void __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_3;
  block[3] = &unk_1E927D158;
  v11 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = v11;
  v17 = *(id *)(a1 + 48);
  v18 = v7;
  v19 = v9;
  v20 = v8;
  v21 = *(id *)(a1 + 56);
  v12 = v8;
  v13 = v9;
  v14 = v7;
  dispatch_async(v10, block);

}

void __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) += objc_msgSend(*(id *)(a1 + 40), "totalBytes");
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  objc_msgSend(*(id *)(a1 + 48), "responseWithError:parameters:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "addObject:");
    v3 = *(_QWORD *)(a1 + 72);
  }
  objc_msgSend(v2, "setDataStream:", v3);
  v4 = *(void **)(a1 + 72);
  if (v4)
    v5 = objc_msgSend(v4, "streamStatus");
  else
    v5 = 0;
  v6 = *(void **)(a1 + 80);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_4;
  v15[3] = &unk_1E927D0E0;
  v8 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v17 = v18;
  v16 = v8;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_6;
  v10[3] = &unk_1E927D130;
  v9 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v9;
  v13 = v18;
  v12 = *(id *)(a1 + 72);
  v14 = v5;
  objc_msgSend(v6, "sendResponse:withProgress:completion:", v2, v15, v10);

  _Block_object_dispose(v18, 8);
}

void __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_4(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;
  NSObject *v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD block[5];
  __int128 v10;
  uint64_t v11;

  v3 = *(_BYTE **)(a1 + 32);
  if (v3[302])
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_5;
    block[3] = &unk_1E927D0B8;
    v6 = *(_QWORD *)(a1 + 32);
    v11 = a2;
    block[4] = v6;
    v8 = *(_OWORD *)(a1 + 40);
    v7 = (id)v8;
    v10 = v8;
    dispatch_async(v5, block);

  }
}

void __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v5;
      v19 = 2114;
      v20 = v6;
      v21 = 2114;
      v22 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to send response for asset %{public}@. err=%{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_144;
  block[3] = &unk_1E927D108;
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v8;
  block[1] = 3221225472;
  v13 = v9;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v14 = v10;
  v16 = v11;
  dispatch_async(v7, block);

}

uint64_t __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_144(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[302])
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v3)
      objc_msgSend(v2, "_updateProgressWithBytesTransferred:forAsset:", v3, *(_QWORD *)(a1 + 40));
  }
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = objc_msgSend(v4, "streamStatus");
    if (*(_QWORD *)(a1 + 64))
    {
      v6 = v5;
      if (v5)
      {
        if (v5 <= 5)
        {
          _ATLogCategoryDeviceSync();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v8 = *(_QWORD *)(a1 + 32);
            v9 = *(_QWORD *)(a1 + 48);
            v10 = *(_QWORD *)(a1 + 64);
            v12 = 138544130;
            v13 = v8;
            v14 = 2114;
            v15 = v9;
            v16 = 2048;
            v17 = v10;
            v18 = 2048;
            v19 = v6;
            _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: input stream %{public}@ will not be closed originalStreamStatus:%lu currentStreamStatus:%lu", (uint8_t *)&v12, 0x2Au);
          }

        }
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "removeObject:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateTaskDescription");
}

uint64_t __65__ATDeviceSyncSessionAssetTask__handleAssetRequest_onMessagLink___block_invoke_5(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 56);
  if (v1)
  {
    v2 = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) += v1;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) > 0x40000uLL)
    {
      result = objc_msgSend(*(id *)(result + 32), "_updateProgressWithBytesTransferred:forAsset:");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 0;
    }
  }
  return result;
}

void __72__ATDeviceSyncSessionAssetTask__handleEndAssetTaskRequest_onMessagLink___block_invoke(uint64_t a1, void *a2)
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
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send response. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_finishTaskWithError:", v3);
  }

}

void __74__ATDeviceSyncSessionAssetTask__handleBeginAssetTaskRequest_onMessagLink___block_invoke(uint64_t a1, void *a2)
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
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send response. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __74__ATDeviceSyncSessionAssetTask__handleBeginAssetTaskRequest_onMessagLink___block_invoke_135(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send response. err=%{public}@", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_finishTaskWithError:", v3);
  }
  else if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 256)
         && (*(_QWORD *)(a1 + 48) || *(_QWORD *)(a1 + 56) > 0x31uLL || *(_QWORD *)(a1 + 64) >= 0x100000uLL))
  {
    _ATLogCategoryDeviceSync();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 64);
      v13 = 138544130;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2048;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: adding transport upgrade exception to message link - #tracks: %lu, #artwork: %lu, #total bytes requested: %llu", (uint8_t *)&v13, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 32), "messageLink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "socket");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTransportUpgradeException");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 1;
  }

}

void __52__ATDeviceSyncSessionAssetTask__handleUpdatedAsset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v2 + 280))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0CF2238]);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 280);
      *(_QWORD *)(v4 + 280) = v3;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "resume");
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v2 + 288), "objectForKey:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "totalBytes"));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (id)v6;
    v7 = objc_msgSend(*(id *)(a1 + 40), "bytesRemaining");
    v8 = objc_msgSend(v13, "unsignedLongLongValue") - v7;
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 288);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, *(_QWORD *)(a1 + 40));

    LODWORD(v10) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "update:", (double)v8);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v12, "downloadProgress");
    objc_msgSend(WeakRetained, "assetSync:didUpdateProgress:", v12);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "addObject:", *(_QWORD *)(a1 + 40));
    if ((_DWORD)v10)
      objc_msgSend(*(id *)(a1 + 32), "_updateProperties");

  }
}

uint64_t __53__ATDeviceSyncSessionAssetTask__handleFinishedAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__ATDeviceSyncSessionAssetTask__handleFinishedAsset___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
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
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id *v34;
  unint64_t v35;
  NSObject *v36;
  _BOOL4 v37;
  id *v38;
  int v39;
  uint64_t v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  id *v44;
  int v45;
  _QWORD v47[3];
  _QWORD v48[3];
  uint8_t buf[4];
  id *v50;
  __int16 v51;
  _BYTE v52[18];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject domain](v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATError")) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "code");

      if (v5 != 16)
        goto LABEL_8;
      _ATLogCategoryDeviceSync();
      v2 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

LABEL_8:
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) += objc_msgSend(*(id *)(a1 + 40), "totalBytes");
        objc_msgSend(*(id *)(a1 + 32), "updateProgressWithCount:totalItemCount:", objc_msgSend(*(id *)(a1 + 32), "completedItemCount") + 1, objc_msgSend(*(id *)(a1 + 32), "totalItemCount"));
        objc_msgSend(*(id *)(a1 + 32), "_updateDetailedProgressForCompletedAsset:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 40), "error");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 312);
        v9 = (void *)MEMORY[0x1E0C99E08];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "completedItemCount", CFSTR("_CompletedItemCount")));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v10;
        v47[1] = CFSTR("_TotalItemCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "totalItemCount"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v11;
        v47[2] = CFSTR("_DetailedProgress");
        v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "copy");
        v48[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dictionaryWithDictionary:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "assetType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 40), "assetType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("SyncedAssetATAssetType"));

          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("ATLibraryIdentifierForAsset"));

        }
        v18 = objc_alloc(MEMORY[0x1E0CF76A0]);
        objc_msgSend(*(id *)(a1 + 32), "dataClass");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithCommand:dataClass:parameters:", CFSTR("UpdateAssetSessionTask"), v19, v14);

        objc_msgSend(*(id *)(a1 + 32), "sendRequest:withCompletion:", v20, 0);
        objc_msgSend(*(id *)(a1 + 40), "error");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
LABEL_24:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeObject:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "removeObject:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
          if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
          {
            v33 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count");
            v34 = *(id **)(a1 + 32);
            if (v33)
            {
              v35 = objc_msgSend(v34[23], "count");
              _ATLogCategoryDeviceSync();
              v36 = objc_claimAutoreleasedReturnValue();
              v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
              if (v35 > 5)
              {
                if (v37)
                {
                  v44 = *(id **)(a1 + 32);
                  v45 = objc_msgSend(v44[23], "count");
                  *(_DWORD *)buf = 138543618;
                  v50 = v44;
                  v51 = 1024;
                  *(_DWORD *)v52 = v45;
                  v41 = "%{public}@ %d assets remaining.";
                  v42 = v36;
                  v43 = 18;
                  goto LABEL_32;
                }
              }
              else if (v37)
              {
                v38 = *(id **)(a1 + 32);
                v39 = objc_msgSend(v38[23], "count");
                v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
                *(_DWORD *)buf = 138543874;
                v50 = v38;
                v51 = 1024;
                *(_DWORD *)v52 = v39;
                *(_WORD *)&v52[4] = 2114;
                *(_QWORD *)&v52[6] = v40;
                v41 = "%{public}@ %d assets remaining: %{public}@";
                v42 = v36;
                v43 = 28;
LABEL_32:
                _os_log_impl(&dword_1D1868000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
              }

              goto LABEL_34;
            }
            objc_msgSend(v34, "_assetRequestsCompletedWithError:", 0);
          }
LABEL_34:

          return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeObject:", *(_QWORD *)(a1 + 40));
        }
        v22 = (void *)v21;
        objc_msgSend(*(id *)(a1 + 40), "error");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "domain");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ATError")) & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "error");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "code");

          if (v26 != 2)
            goto LABEL_24;
          objc_msgSend(*(id *)(a1 + 32), "session");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          _ATLogCategoryDeviceSync();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = *(void **)(a1 + 32);
            objc_msgSend(v28, "error");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "error");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v50 = (id *)v28;
            v51 = 2114;
            *(_QWORD *)v52 = v29;
            *(_WORD *)&v52[8] = 2114;
            *(_QWORD *)&v52[10] = v30;
            _os_log_impl(&dword_1D1868000, v27, OS_LOG_TYPE_ERROR, "%{public}@: got cancelled asset. self.error=%{public}@, self.session.error=%{public}@", buf, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 32), "error");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(*(id *)(a1 + 40), "setError:", v23);
LABEL_23:

            goto LABEL_24;
          }
          objc_msgSend(v22, "error");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *(void **)(a1 + 40);
          if (v24)
          {
            objc_msgSend(v31, "setError:", v24);
          }
          else
          {
            objc_msgSend(v31, "error");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setError:", v32);

          }
        }

        goto LABEL_23;
      }
      v6 = *(id **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v6;
      v51 = 2114;
      *(_QWORD *)v52 = v3;
      *(_WORD *)&v52[8] = 2114;
      *(_QWORD *)&v52[10] = v7;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Will treat asset %{public}@ with error=%{public}@ as finished.", buf, 0x20u);

    }
    goto LABEL_7;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __62__ATDeviceSyncSessionAssetTask_messageLink_didReceiveRequest___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;

  objc_msgSend(*(id *)(a1 + 32), "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("BeginAssetTask"));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleBeginAssetTaskRequest:onMessagLink:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "command");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("EndAssetTask"));

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleEndAssetTaskRequest:onMessagLink:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "command");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("RequestAsset"));

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "_handleAssetRequest:onMessagLink:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "command");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UpdateAssetSessionTask"));

        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 40), "_handleUpdateSessionTaskRequest:onMessageLink:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "command");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("AssetMetrics"));

          if (v11)
          {
            objc_msgSend(*(id *)(a1 + 40), "_handleInstalledAssetMetricsChanged:onMessageLink:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "command");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("FileProgress"));

            if (v13)
              objc_msgSend(*(id *)(a1 + 40), "_handleAssetDownloadProgressed:onMessageLink:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
          }
        }
      }
    }
  }
}

void __38__ATDeviceSyncSessionAssetTask_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE buf[18];
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0)
    return;
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  _ATLogCategoryDeviceSync();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(*(id *)(v10 + 184), "count");
    objc_msgSend(*(id *)(a1 + 32), "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v11;
    v31 = 2114;
    v32 = v5;
    v33 = 2114;
    v34 = v12;
    v35 = 2114;
    v36 = v13;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling task with %d assets remaining with error %{public}@, task error %{public}@, session error %{public}@ .", buf, 0x30u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "removeObserver:");
  objc_msgSend(v5, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("ATError")))
  {
    v15 = objc_msgSend(v5, "code");

    if (v15 == 8)
      goto LABEL_15;
  }
  else
  {

  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 208);
  objc_msgSend(*(id *)(v16 + 184), "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v17, "cancelAssets:withError:completion:", v19, v5, 0);

LABEL_15:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = *(id *)(*(_QWORD *)(a1 + 32) + 248);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        *(_OWORD *)buf = xmmword_1D19CF7F0;
        CFReadStreamSignalEvent();
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v22);
  }

  objc_msgSend(*(id *)(a1 + 32), "_assetRequestsCompletedWithError:", v5);
}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  _ATLogCategoryDeviceSync();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "Asset Task starting", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = v5;
    objc_msgSend(*(id *)(a1 + 32), "_shouldDeviceReportSyncProgress");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke_65;
    v8[3] = &unk_1E927D008;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "assetsToSyncWithCompletion:", v8);
  }
  else
  {
    if (v4)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "dataClass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: no ATAssetClient for data class %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_finishTaskWithError:", 0);
  }

}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  ATDetailedRequestInfoForAssetType *v18;
  uint64_t v19;
  void *v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  unint64_t v56;
  id obj;
  id obja;
  uint64_t v59;
  _QWORD v60[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  _QWORD v72[5];
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  _BYTE v76[10];
  __int16 v77;
  void *v78;
  __int16 v79;
  unint64_t v80;
  _QWORD v81[2];
  _QWORD v82[2];
  _BYTE v83[128];
  _BYTE v84[128];
  _DWORD v85[10];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v52 = v6;
  v53 = v5;
  if (v5)
  {
    _ATLogCategoryDeviceSync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v74 = v8;
      v75 = 2114;
      *(_QWORD *)v76 = v5;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_ERROR, "%{public}@: failed to load assets.err=%{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_assetRequestsCompletedWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "addObjectsFromArray:", v6);
    v59 = a1;
    objc_msgSend(*(id *)(a1 + 32), "updateProgressWithCount:totalItemCount:", 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v85, 0, 32);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v52;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
    if (v9)
    {
      v56 = 0;
      v10 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v68 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_copyWeak((id *)buf, (id *)(*(_QWORD *)(v59 + 32) + 176));
          objc_msgSend(v12, "setEnqueueSource:", 1);
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke_66;
          v65[3] = &unk_1E927CFB8;
          v65[4] = *(_QWORD *)(v59 + 32);
          objc_copyWeak(&v66, (id *)buf);
          objc_msgSend(v12, "setCompletionBlock:", v65);
          objc_msgSend(v12, "variantOptions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", CFSTR("AssetParts"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "charValue");

          ++v85[v15];
          if (v15 == 1)
          {
            v16 = objc_msgSend(v12, "totalBytes");
            objc_msgSend(v12, "assetType");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(v54, "objectForKey:", v17);
              v18 = (ATDetailedRequestInfoForAssetType *)objc_claimAutoreleasedReturnValue();
              if (!v18)
              {
                v18 = objc_alloc_init(ATDetailedRequestInfoForAssetType);
                objc_msgSend(v54, "setObject:forKey:", v18, v17);
              }
              v19 = objc_msgSend(v12, "totalBytes");
              objc_msgSend(v12, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[ATDetailedRequestInfoForAssetType updateBytesToSync:forItemIdentifier:](v18, "updateBytesToSync:forItemIdentifier:", v19, v20);

              -[ATDetailedRequestInfoForAssetType incrementAssetCountToSync](v18, "incrementAssetCountToSync");
            }

            v56 += v16;
          }
          objc_destroyWeak(&v66);
          objc_destroyWeak((id *)buf);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
      }
      while (v9);
    }
    else
    {
      v56 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    obja = (id)objc_claimAutoreleasedReturnValue();
    for (j = 0; j != 8; ++j)
    {
      if (v85[j])
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", j);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obja, "setObject:forKey:", v22, v24);

      }
    }
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(obja, "allKeys");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v61, v83, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v62;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v62 != v26)
            objc_enumerationMutation(v55);
          v28 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k);
          v81[0] = CFSTR("TotalCount");
          objc_msgSend(obja, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v81[1] = CFSTR("CompletedCount");
          v82[0] = v29;
          v82[1] = &unk_1E928B758;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 216), "setObject:forKey:", v30, v28);
        }
        v25 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v61, v83, 16);
      }
      while (v25);
    }

    v31 = *(_QWORD *)(v59 + 32);
    if (!*(_BYTE *)(v31 + 256))
    {
      v33 = v85[1];
      v32 = v85[2];
      if (v85[1] || v85[2] > 0x31u || v56 >= 0x100000)
      {
        _ATLogCategoryDeviceSync();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = *(_QWORD *)(v59 + 32);
          *(_DWORD *)buf = 138544386;
          v74 = v35;
          v75 = 1024;
          *(_DWORD *)v76 = v33;
          *(_WORD *)&v76[4] = 1024;
          *(_DWORD *)&v76[6] = v32;
          v77 = 2114;
          v78 = v54;
          v79 = 2048;
          v80 = v56;
          _os_log_impl(&dword_1D1868000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: adding transport upgrade exception to message link - #total tracks: %u, #artwork: %u, request by assetType: %{public}@, #total bytes requested: %llu", buf, 0x2Cu);
        }

        objc_msgSend(*(id *)(v59 + 32), "messageLink");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "socket");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addTransportUpgradeException");

        *(_BYTE *)(*(_QWORD *)(v59 + 32) + 256) = 1;
        v31 = *(_QWORD *)(v59 + 32);
      }
    }
    v71[0] = CFSTR("_BeginAssetTaskTotalCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v31 + 184), "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v38;
    v72[1] = obja;
    v71[1] = CFSTR("_BeginAssetTaskDetailedCount");
    v71[2] = CFSTR("DetailedRequestByAssetType");
    objc_msgSend(*(id *)(v59 + 32), "_serializedAssetRequestsFromRequestDictionary:", v54);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v39;
    v71[3] = CFSTR("_BeginAssetTaskTrackByteCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v72[3] = v40;
    v71[4] = CFSTR("InstalledAssetMetrics");
    v41 = *(_QWORD *)(*(_QWORD *)(v59 + 32) + 232);
    if (v41)
    {
      v42 = *(void **)(*(_QWORD *)(v59 + 32) + 232);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v72[4] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)

    v44 = objc_alloc(MEMORY[0x1E0CF76A0]);
    objc_msgSend(*(id *)(v59 + 32), "dataClass");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v44, "initWithCommand:dataClass:parameters:", CFSTR("BeginAssetTask"), v45, v43);

    v47 = *(void **)(v59 + 32);
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke_94;
    v60[3] = &unk_1E927CFE0;
    v60[4] = v47;
    objc_msgSend(v47, "sendRequest:withCompletion:", v46, v60);
    if (objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 184), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 208), "addObserver:");
      v48 = *(_QWORD *)(v59 + 32);
      v49 = *(void **)(v48 + 208);
      objc_msgSend(*(id *)(v48 + 184), "array");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v50, "copy");
      objc_msgSend(v49, "enqueueAssets:", v51);

    }
    else
    {
      objc_msgSend(*(id *)(v59 + 32), "_assetRequestsCompletedWithError:", 0);
    }

  }
}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 320);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATDeviceSyncSessionAssetTask_start__block_invoke_2;
  block[3] = &unk_1E927CF90;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  dispatch_async(v5, block);
  objc_destroyWeak(&v10);

}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    _ATLogCategoryDeviceSync();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_ERROR, "%{public}@: failed to send request. err=%{public}@", (uint8_t *)&v12, 0x16u);
    }

    v10 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v10, "_finishTaskWithError:", v6);
    }
    else
    {
      objc_msgSend(v5, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_finishTaskWithError:", v11);

    }
  }

}

void __37__ATDeviceSyncSessionAssetTask_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ATIsPendingDownloadError();

  if (v3)
  {
    _ATLogCategoryFramework();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1D1868000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@ Not hooking up %{public}@ as it's begin downloading by another source", buf, 0x16u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject assetSync:didCompleteWithError:](WeakRetained, "assetSync:didCompleteWithError:", v7, v8);

    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "installCompleteForAssets:", v10);

  }
}

@end
