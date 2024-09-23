@implementation ATAssetSessionTask

- (ATAssetSessionTask)init
{
  return (ATAssetSessionTask *)-[ATAssetSessionTask _initWithDataClass:assets:](self, "_initWithDataClass:assets:", 0, 0);
}

- (ATAssetSessionTask)initWithDataClass:(id)a3
{
  return (ATAssetSessionTask *)-[ATAssetSessionTask _initWithDataClass:assets:](self, "_initWithDataClass:assets:", a3, 0);
}

- (ATAssetSessionTask)initWithAssets:(id)a3
{
  return (ATAssetSessionTask *)-[ATAssetSessionTask _initWithDataClass:assets:](self, "_initWithDataClass:assets:", 0, a3);
}

- (id)_initWithDataClass:(id)a3 assets:(id)a4
{
  id v6;
  ATAssetSessionTask *v7;
  ATAssetSessionTask *v8;
  objc_class *v9;
  const char *Name;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSMutableOrderedSet *v13;
  NSMutableOrderedSet *remainingAssets;
  NSMutableSet *v15;
  NSMutableSet *failedAssets;
  NSMutableSet *v17;
  NSMutableSet *currentAssets;
  uint64_t v19;
  ATAssetLinkController *assetLinkController;
  dispatch_source_t v21;
  OS_dispatch_source *retryTimer;
  NSObject *v23;
  _QWORD handler[4];
  ATAssetSessionTask *v26;
  objc_super v27;

  v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ATAssetSessionTask;
  v7 = -[ATSessionTask initWithDataClass:](&v27, sel_initWithDataClass_, a3);
  v8 = v7;
  if (v7)
  {
    if (v6)
      -[NSMutableOrderedSet addObjectsFromArray:](v7->_remainingAssets, "addObjectsFromArray:", v6);
    v8->_recentFailedArrayIndex = 0;
    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    v11 = dispatch_queue_create(Name, 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    remainingAssets = v8->_remainingAssets;
    v8->_remainingAssets = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    failedAssets = v8->_failedAssets;
    v8->_failedAssets = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    currentAssets = v8->_currentAssets;
    v8->_currentAssets = v17;

    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    assetLinkController = v8->_assetLinkController;
    v8->_assetLinkController = (ATAssetLinkController *)v19;

    v8->_retryInterval = 10.0;
    v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v8->_queue);
    retryTimer = v8->_retryTimer;
    v8->_retryTimer = (OS_dispatch_source *)v21;

    dispatch_source_set_timer((dispatch_source_t)v8->_retryTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    v23 = v8->_retryTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __48__ATAssetSessionTask__initWithDataClass_assets___block_invoke;
    handler[3] = &unk_1E927E120;
    v26 = v8;
    dispatch_source_set_event_handler(v23, handler);
    dispatch_resume((dispatch_object_t)v8->_retryTimer);

  }
  return v8;
}

- (void)suspend
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ATAssetSessionTask_suspend__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ATAssetSessionTask_resume__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableOrderedSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  int v22;
  NSMutableOrderedSet *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *queue;
  _QWORD block[5];
  _QWORD v30[5];
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _BYTE *v42;
  _BYTE v43[128];
  uint8_t v44[128];
  _BYTE buf[40];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[ATSessionTask dataClass](self, "dataClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask dataClass](self, "dataClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientForDataclass:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__2819;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__2820;
      v46 = 0;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __27__ATAssetSessionTask_start__block_invoke;
      v40[3] = &unk_1E927D590;
      v41 = v6;
      v42 = buf;
      dispatch_client_sync(v41, v40);
      if (self->_filterPredicate)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "filteredArrayUsingPredicate:");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v7;

      }
      -[NSMutableOrderedSet addObjectsFromArray:](self->_remainingAssets, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

      _Block_object_dispose(buf, 8);
    }
    else
    {
      _ATLogCategoryFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[ATSessionTask dataClass](self, "dataClass");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ No ATClient for asset dataClass %{public}@", buf, 0x16u);

      }
    }

  }
  if (-[ATSessionTask totalItemCount](self, "totalItemCount"))
  {
    -[ATSessionTask setCompletedItemCount:](self, "setCompletedItemCount:", -[ATSessionTask totalItemCount](self, "totalItemCount")- -[NSMutableOrderedSet count](self->_remainingAssets, "count"));
    -[ATSessionTask setProgress:](self, "setProgress:", (float)((float)-[ATSessionTask completedItemCount](self, "completedItemCount")/ (float)-[ATSessionTask totalItemCount](self, "totalItemCount")));
  }
  else
  {
    -[ATSessionTask setTotalItemCount:](self, "setTotalItemCount:", -[NSMutableOrderedSet count](self->_remainingAssets, "count"));
    -[ATSessionTask setCompletedItemCount:](self, "setCompletedItemCount:", 0);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask setRecentlyFailedAssets:](self, "setRecentlyFailedAssets:", v11);

    -[ATSessionTask setTotalBytesTransferred:](self, "setTotalBytesTransferred:", &unk_1E928B7A0);
    -[ATSessionTask setTotalBytesToTransfer:](self, "setTotalBytesToTransfer:", &unk_1E928B7A0);
  }
  -[ATSessionTask totalBytesTransferred](self, "totalBytesTransferred");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue");

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = self->_remainingAssets;
  v15 = 0;
  v16 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v14);
        v15 += objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "totalBytes");
      }
      v16 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v16);
  }

  v19 = v15 + v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setTotalBytesToTransfer:](self, "setTotalBytesToTransfer:", v20);

  _ATLogCategoryFramework();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = -[NSMutableOrderedSet count](self->_remainingAssets, "count");
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v22;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v15;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v19;
    _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Preparing to transfer %d assets (%llu/%llu total bytes)", buf, 0x26u);
  }

  -[NSMutableSet removeAllObjects](self->_failedAssets, "removeAllObjects");
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v32 = 0u;
  v23 = self->_remainingAssets;
  v24 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v27, "setEnqueueSource:", 1);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __27__ATAssetSessionTask_start__block_invoke_12;
        v31[3] = &unk_1E927D460;
        v31[4] = self;
        objc_msgSend(v27, "setCompletionBlock:", v31);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __27__ATAssetSessionTask_start__block_invoke_4;
        v30[3] = &unk_1E927D488;
        v30[4] = self;
        objc_msgSend(v27, "setProgressBlock:", v30);
      }
      v24 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    }
    while (v24);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ATAssetSessionTask_start__block_invoke_7;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ATAssetSessionTask_cancel__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelAllAssets
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATAssetSessionTask_cancelAllAssets__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)sessionGroupingKey
{
  return CFSTR("ATAssetSessionTaskGroupingKey");
}

- (id)remainingAssets
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2819;
  v10 = __Block_byref_object_dispose__2820;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ATAssetSessionTask_remainingAssets__block_invoke;
  v5[3] = &unk_1E927D590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATAssetSessionTask;
  -[ATSessionTask description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATAssetSessionTask remainingAssets](self, "remainingAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)assetLinkController:(id)a3 didFinishAsset:(id)a4
{
  id v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  if (!-[ATSessionTask isCancelled](self, "isCancelled"))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__ATAssetSessionTask_assetLinkController_didFinishAsset___block_invoke;
    v7[3] = &unk_1E927E148;
    v7[4] = self;
    v8 = v5;
    dispatch_async(queue, v7);

  }
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  id v6;
  NSMutableOrderedSet *remainingAssets;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t recentFailedArrayIndex;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t failedAssetsCount;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  int v32;
  NSMutableOrderedSet *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  int retryInterval;
  void *v41;
  NSObject *retryTimer;
  dispatch_time_t v43;
  int v44;
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint8_t buf[4];
  ATAssetSessionTask *v50;
  __int16 v51;
  _BYTE v52[18];
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  remainingAssets = self->_remainingAssets;
  v8 = a4;
  -[NSMutableOrderedSet removeObject:](remainingAssets, "removeObject:", v6);
  if (!v8)
  {
    -[ATSessionTask totalBytesTransferred](self, "totalBytesTransferred");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongLongValue");
    v15 = objc_msgSend(v6, "totalBytes") + v14;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask setTotalBytesTransferred:](self, "setTotalBytesTransferred:", v11);
LABEL_7:

    goto LABEL_8;
  }
  v9 = -[NSMutableSet count](self->_failedAssets, "count");
  -[NSMutableSet addObject:](self->_failedAssets, "addObject:", v6);
  if (v9 != -[NSMutableSet count](self->_failedAssets, "count"))
  {
    -[ATSessionTask recentlyFailedAssets](self, "recentlyFailedAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    recentFailedArrayIndex = self->_recentFailedArrayIndex;
    if (recentFailedArrayIndex >= 5)
    {
      recentFailedArrayIndex = 0;
      self->_recentFailedArrayIndex = 0;
    }
    objc_msgSend(v11, "setObject:atIndexedSubscript:", v6, recentFailedArrayIndex);
    ++self->_recentFailedArrayIndex;
    -[ATSessionTask setRecentlyFailedAssets:](self, "setRecentlyFailedAssets:", v11);
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v6, "setError:", v8);
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataclass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientForDataclass:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectForKey:", CFSTR("ATLegacyAssetLinkErrorIsVisibleKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && objc_msgSend(v20, "BOOLValue"))
    ++self->_failedAssetsCount;
  -[ATSessionTask setCompletedItemCount:](self, "setCompletedItemCount:", -[ATSessionTask totalItemCount](self, "totalItemCount")- (-[NSMutableOrderedSet count](self->_remainingAssets, "count")+ -[NSMutableSet count](self->_failedAssets, "count")));
  -[ATSessionTask setProgress:](self, "setProgress:", (float)((float)-[ATSessionTask completedItemCount](self, "completedItemCount")/ (float)-[ATSessionTask totalItemCount](self, "totalItemCount")));
  _ATLogCategoryFramework();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = -[ATSessionTask completedItemCount](self, "completedItemCount");
    v23 = -[ATSessionTask totalItemCount](self, "totalItemCount");
    failedAssetsCount = self->_failedAssetsCount;
    -[ATSessionTask totalBytesTransferred](self, "totalBytesTransferred");
    v46 = v6;
    v25 = v20;
    v26 = v18;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask totalBytesToTransfer](self, "totalBytesToTransfer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v50 = self;
    v51 = 2048;
    *(_QWORD *)v52 = v22;
    *(_WORD *)&v52[8] = 2048;
    *(_QWORD *)&v52[10] = v23;
    v53 = 2048;
    v54 = failedAssetsCount;
    v55 = 2112;
    v56 = v27;
    v57 = 2112;
    v58 = v28;
    _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed %lu/%lu assets (%lu failed, %@/%@ bytes transferred)", buf, 0x3Eu);

    v18 = v26;
    v20 = v25;
    v6 = v46;
  }

  if (-[NSMutableOrderedSet count](self->_remainingAssets, "count"))
  {
    v29 = -[NSMutableOrderedSet count](self->_remainingAssets, "count");
    _ATLogCategoryFramework();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29 > 5)
    {
      if (v31)
      {
        v44 = -[NSMutableOrderedSet count](self->_remainingAssets, "count");
        *(_DWORD *)buf = 138543618;
        v50 = self;
        v51 = 1024;
        *(_DWORD *)v52 = v44;
        v34 = "%{public}@ %d assets remaining.";
        v35 = v30;
        v36 = 18;
        goto LABEL_25;
      }
    }
    else if (v31)
    {
      v32 = -[NSMutableOrderedSet count](self->_remainingAssets, "count");
      v33 = self->_remainingAssets;
      *(_DWORD *)buf = 138543874;
      v50 = self;
      v51 = 1024;
      *(_DWORD *)v52 = v32;
      *(_WORD *)&v52[4] = 2114;
      *(_QWORD *)&v52[6] = v33;
      v34 = "%{public}@ %d assets remaining: %{public}@";
      v35 = v30;
      v36 = 28;
LABEL_25:
      _os_log_impl(&dword_1D1868000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    }

    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __45__ATAssetSessionTask__finishAsset_withError___block_invoke;
    v47[3] = &unk_1E927E120;
    v48 = v18;
    dispatch_client_async(v48, v47);

  }
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "queueForClient:", v18);
  v38 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_sync(v38, &__block_literal_global_2807);

  if (self->_retryUntilFinished)
  {
    _ATLogCategoryFramework_Oversize();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      retryInterval = (int)self->_retryInterval;
      -[ATSessionTask recentlyFailedAssets](self, "recentlyFailedAssets");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = self;
      v51 = 1024;
      *(_DWORD *)v52 = retryInterval;
      *(_WORD *)&v52[4] = 2114;
      *(_QWORD *)&v52[6] = v41;
      _os_log_impl(&dword_1D1868000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Re-querying client bundle for more assets in %d seconds. recentlyFailedAssets=%{public}@", buf, 0x1Cu);

    }
    self->_waitingForRetry = 1;
    retryTimer = self->_retryTimer;
    v43 = dispatch_time(0, (uint64_t)(self->_retryInterval * 1000000000.0));
    dispatch_source_set_timer(retryTimer, v43, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
  else
  {
    -[ATAssetSessionTask assetLinkController](self, "assetLinkController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "removeObserver:", self);

    -[ATSessionTask setFinished:](self, "setFinished:", 1);
  }
LABEL_27:

}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)shouldRetryAssetBlock
{
  return self->_shouldRetryAssetBlock;
}

- (void)setShouldRetryAssetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (ATAssetLinkController)assetLinkController
{
  return self->_assetLinkController;
}

- (void)setAssetLinkController:(id)a3
{
  objc_storeStrong((id *)&self->_assetLinkController, a3);
}

- (BOOL)retryUntilFinished
{
  return self->_retryUntilFinished;
}

- (void)setRetryUntilFinished:(BOOL)a3
{
  self->_retryUntilFinished = a3;
}

- (unint64_t)failedAssetsCount
{
  return self->_failedAssetsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLinkController, 0);
  objc_storeStrong(&self->_shouldRetryAssetBlock, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentAssets, 0);
  objc_storeStrong((id *)&self->_failedAssets, 0);
  objc_storeStrong((id *)&self->_remainingAssets, 0);
}

uint64_t __45__ATAssetSessionTask__finishAsset_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetTransferEndedWithSuccess:", 1);
}

void __57__ATAssetSessionTask_assetLinkController_didFinishAsset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t (**v4)(_QWORD, _QWORD);
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "shouldRetryAssetBlock");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2
      && (v3 = (void *)v2,
          objc_msgSend(*(id *)(a1 + 32), "shouldRetryAssetBlock"),
          v4 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
          v5 = v4[2](v4, *(_QWORD *)(a1 + 40)),
          v4,
          v3,
          v5))
    {
      _ATLogCategoryFramework();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v16 = v7;
        v17 = 2114;
        v18 = v8;
        _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrying %{public}@ because of a recoverable error.", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "assetLinkController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enqueueAssets:", v10);

    }
    else
    {
      v12 = *(void **)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v11, "error");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_finishAsset:withError:", v11);

    }
  }
}

void __37__ATAssetSessionTask_remainingAssets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__ATAssetSessionTask_cancelAllAssets__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(v3 + 152), "count");
    v8 = 138543618;
    v9 = v3;
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling %d assets.", (uint8_t *)&v8, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 192) = 1;
  objc_msgSend(*(id *)(a1 + 32), "assetLinkController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "cancelAssets:withCompletion:", v7, 0);

}

void __28__ATAssetSessionTask_cancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    _ATLogCategoryFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = objc_msgSend(*(id *)(v3 + 152), "count");
      *(_DWORD *)buf = 138543618;
      v18 = v3;
      v19 = 1024;
      v20 = v4;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling task with %d assets remaining.", buf, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "assetLinkController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "cancelAssets:withCompletion:", v7, 0);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 32), "assetLinkController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", *(_QWORD *)(a1 + 32));

    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientForDataclass:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __28__ATAssetSessionTask_cancel__block_invoke_32;
      v14[3] = &unk_1E927E148;
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 32);
      v15 = v12;
      v16 = v13;
      dispatch_client_async(v12, v14);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
    }

  }
}

uint64_t __28__ATAssetSessionTask_cancel__block_invoke_32(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "assetTransferEndedWithSuccess:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setFinished:", 1);
}

void __27__ATAssetSessionTask_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "outstandingAssetTransfersWithDownloadManager:", 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "outstandingAssetTransfers");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __27__ATAssetSessionTask_start__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void (*v21)(uint64_t);
  uint64_t *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD block[5];
  id v35;
  char v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ATIsPendingDownloadError();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 184);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ATAssetSessionTask_start__block_invoke_2;
  block[3] = &unk_1E927DA28;
  v36 = v5;
  block[4] = v6;
  v9 = v3;
  v35 = v9;
  dispatch_async(v7, block);
  if (!v5)
  {
    objc_msgSend(v9, "error");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_11;
    v13 = (void *)v12;
    objc_msgSend(v9, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ATError")) & 1) != 0)
    {
      objc_msgSend(v9, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "code");

      if (v17 != 2)
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 32), "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v9, "setError:", v13);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "session");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "error");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v9, "setError:", v29);
        }
        else
        {
          objc_msgSend(v9, "error");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setError:", v30);

        }
      }
    }
    else
    {

    }
LABEL_11:
    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataclass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clientForDataclass:", v19);
    v10 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isInstalled"))
    {
      objc_msgSend(v9, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_20;
        v33 = v8;
        v21 = __27__ATAssetSessionTask_start__block_invoke_17;
        v22 = &v33;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_20;
        v32 = v8;
        v21 = __27__ATAssetSessionTask_start__block_invoke_2_20;
        v22 = &v32;
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_20;
      v31 = v8;
      v21 = __27__ATAssetSessionTask_start__block_invoke_3;
      v22 = &v31;
    }
    v22[1] = 3221225472;
    v22[2] = (uint64_t)v21;
    v22[3] = (uint64_t)&unk_1E927E148;
    v23 = v10;
    v22[4] = (uint64_t)v23;
    v22[5] = (uint64_t)v9;
    dispatch_client_async(v23, v22);

LABEL_20:
    objc_msgSend(v9, "dataclass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", CFSTR("Application")))
    {
      objc_msgSend(v9, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D4E410]);

      if (!v27)
        goto LABEL_24;
      objc_msgSend(v9, "prettyName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ATDisplayErrorForAppInstall(v24, objc_msgSend(v9, "isRestore"));
    }

    goto LABEL_24;
  }
  _ATLogCategoryFramework();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v38 = v11;
    v39 = 2114;
    v40 = v9;
    _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Not hooking up %{public}@ as it's begin downloading by another source", buf, 0x16u);
  }
LABEL_24:

}

void __27__ATAssetSessionTask_start__block_invoke_4(uint64_t a1, void *a2, float a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  float v18;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 184);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ATAssetSessionTask_start__block_invoke_5;
  block[3] = &unk_1E927E030;
  block[4] = v6;
  v9 = v5;
  v17 = v9;
  v18 = a3;
  dispatch_async(v7, block);
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataclass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientForDataclass:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __27__ATAssetSessionTask_start__block_invoke_6;
    v13[3] = &unk_1E927E148;
    v14 = v12;
    v15 = v9;
    dispatch_client_async(v14, v13);

  }
}

void __27__ATAssetSessionTask_start__block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v3 + 192))
  {
    *(_BYTE *)(v3 + 217) = 0;
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = objc_msgSend(*(id *)(v5 + 152), "count");
      *(_DWORD *)buf = 138543618;
      v31 = v5;
      v32 = 1024;
      v33 = v6;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Preemptively cancelling %d assets at start.", buf, 0x12u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setError:", v15);

          objc_msgSend(v14, "completionBlock");
          v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v16)[2](v16, v14);

          v17 = *(void **)(a1 + 32);
          objc_msgSend(v14, "error");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_finishAsset:withError:", v14, v18);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

  }
  else
  {
    v19 = objc_msgSend(*(id *)(v3 + 152), "count");
    v20 = *(void **)(a1 + 32);
    if (v19)
    {
      objc_msgSend(v20, "assetLinkController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "assetLinkController");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      objc_msgSend(v24, "enqueueAssets:", v23);

    }
    else
    {
      objc_msgSend(v20, "setFinished:", 1);
    }
  }
}

uint64_t __27__ATAssetSessionTask_start__block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentItems:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "setProgress:", (float)((float)(*(float *)(a1 + 48)* (float)(1.0 / (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "totalItemCount")))+ (float)((float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "completedItemCount")/ (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "totalItemCount"))));
}

uint64_t __27__ATAssetSessionTask_start__block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  float v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "downloadProgress");
  return objc_msgSend(v1, "assetTransfer:updatedProgress:", v2, v3);
}

void __27__ATAssetSessionTask_start__block_invoke_2(uint64_t a1)
{
  id v2;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "allObjects");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentItems:", v2);

  }
}

void __27__ATAssetSessionTask_start__block_invoke_2_20(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetInstallSucceeded:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installCompleteForAssets:", v3);

}

void __27__ATAssetSessionTask_start__block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetInstallFailed:withError:", v3, v4);

  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installCompleteForAssets:", v6);

}

void __27__ATAssetSessionTask_start__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetTransfer:succeeded:withError:", v3, v4 == 0, v5);

  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installCompleteForAssets:", v7);

}

void __28__ATAssetSessionTask_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setSuspended:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 216))
    dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 208), 0, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
}

void __29__ATAssetSessionTask_suspend__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSuspended:", 1);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 208), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

uint64_t __48__ATAssetSessionTask__initWithDataClass_assets___block_invoke(uint64_t a1)
{
  *(double *)(*(_QWORD *)(a1 + 32) + 200) = *(double *)(*(_QWORD *)(a1 + 32) + 200) + 10.0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

@end
