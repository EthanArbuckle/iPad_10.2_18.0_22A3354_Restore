@implementation ATConcreteAssetLink

- (ATConcreteAssetLink)initWithMessageLink:(id)a3
{
  id v5;
  ATConcreteAssetLink *v6;
  ATConcreteAssetLink *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *fileIOQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *callbackQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *readerQueue;
  dispatch_group_t v16;
  OS_dispatch_group *readersPendingStopGroup;
  uint64_t v18;
  NSMutableArray *outstandingAssets;
  uint64_t v20;
  NSMutableSet *readers;
  uint64_t v22;
  NSMutableSet *readersPendingStop;
  uint64_t v24;
  NSMutableDictionary *readersToAssetsMap;
  dispatch_semaphore_t v26;
  OS_dispatch_semaphore *pendingWriteSemaphore;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ATConcreteAssetLink;
  v6 = -[ATConcreteAssetLink init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageLink, a3);
    v8 = dispatch_queue_create("com.apple.AirTraffic.ATFoundation.ATConcreteAssetLink.accessQueue", 0);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.AirTraffic.ATFoundation.ATConcreteAssetLink.fileIOQueue", 0);
    fileIOQueue = v7->_fileIOQueue;
    v7->_fileIOQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.AirTraffic.ATFoundation.ATConcreteAssetLink.callbackQueue", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.AirTraffic.ATFoundation.ATConcreteAssetLink.streamReaderQueue", 0);
    readerQueue = v7->_readerQueue;
    v7->_readerQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_group_create();
    readersPendingStopGroup = v7->_readersPendingStopGroup;
    v7->_readersPendingStopGroup = (OS_dispatch_group *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    outstandingAssets = v7->_outstandingAssets;
    v7->_outstandingAssets = (NSMutableArray *)v18;

    v20 = objc_opt_new();
    readers = v7->_readers;
    v7->_readers = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    readersPendingStop = v7->_readersPendingStop;
    v7->_readersPendingStop = (NSMutableSet *)v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    readersToAssetsMap = v7->_readersToAssetsMap;
    v7->_readersToAssetsMap = (NSMutableDictionary *)v24;

    v26 = dispatch_semaphore_create(0);
    pendingWriteSemaphore = v7->_pendingWriteSemaphore;
    v7->_pendingWriteSemaphore = (OS_dispatch_semaphore *)v26;

    v7->_pendingWriteAmount = 0;
  }

  return v7;
}

- (BOOL)open
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ATConcreteAssetLink_open__block_invoke;
  block[3] = &unk_1E928CC80;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  return 1;
}

- (void)close
{
  NSObject *accessQueue;
  _QWORD v3[6];
  _QWORD v4[5];
  id v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__2066;
  v4[4] = __Block_byref_object_dispose__2067;
  v5 = 0;
  accessQueue = self->_accessQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__ATConcreteAssetLink_close__block_invoke;
  v3[3] = &unk_1E928CCA8;
  v3[4] = self;
  v3[5] = v4;
  dispatch_sync(accessQueue, v3);
  _Block_object_dispose(v4, 8);

}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v6;
  NSObject *readerQueue;
  uint64_t v8;
  NSObject *accessQueue;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  BOOL v27;
  _QWORD block[6];
  _QWORD v29[4];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2066;
  v34 = __Block_byref_object_dispose__2067;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  readerQueue = self->_readerQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E928CCA8;
  block[4] = self;
  block[5] = v29;
  dispatch_sync(readerQueue, block);
  accessQueue = self->_accessQueue;
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke_2;
  v23[3] = &unk_1E928CD10;
  v23[4] = self;
  v25 = v29;
  v27 = a4;
  v10 = v6;
  v24 = v10;
  v26 = &v30;
  dispatch_sync(accessQueue, v23);
  v11 = self->_readerQueue;
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke_3;
  v22[3] = &unk_1E928CCA8;
  v22[4] = self;
  v22[5] = &v30;
  dispatch_sync(v11, v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = (id)v31[5];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v36, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        -[ATConcreteAssetLink _requestAsset:](self, "_requestAsset:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++), (_QWORD)v18);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v36, 16);
    }
    while (v13);
  }

  v16 = (id)v31[5];
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);

  return v16;
}

- (BOOL)canEnqueueAsset:(id)a3
{
  return 0;
}

- (void)cancelAssets:(id)a3
{
  id v4;
  NSObject *readerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  ATConcreteAssetLink *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2066;
  v11[4] = __Block_byref_object_dispose__2067;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  readerQueue = self->_readerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ATConcreteAssetLink_cancelAssets___block_invoke;
  block[3] = &unk_1E928CD60;
  v8 = v4;
  v9 = self;
  v10 = v11;
  v6 = v4;
  dispatch_async(readerQueue, block);

  _Block_object_dispose(v11, 8);
}

- (unint64_t)maximumBatchSize
{
  return 2;
}

- (BOOL)linkIsReady
{
  return -[ATMessageLink isOpen](self->_messageLink, "isOpen");
}

- (unint64_t)priority
{
  return 0;
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *callbackQueue;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  ATConcreteAssetLink *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[NSMutableArray containsObject:](self->_outstandingAssets, "containsObject:", v6))
  {
    _ATLogCategoryDeviceSync();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v15 = self;
      v16 = 2114;
      v17 = v6;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished asset %{public}@: %{public}@", buf, 0x20u);
    }

    +[ATAssetLinkPowerLogger sharedInstance](ATAssetLinkPowerLogger, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logAssetLinkOfType:didFinishAsset:withError:", 1, v6, v7);

    -[NSMutableArray removeObject:](self->_outstandingAssets, "removeObject:", v6);
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__ATConcreteAssetLink__finishAsset_withError___block_invoke;
    block[3] = &unk_1E928CD38;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(callbackQueue, block);

  }
}

- (id)_urlForWritingAsset:(id)a3 withFileName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataclass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathForDataclass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataclass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createAirlockForDataclasses:", v12);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  v31 = v5;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v14 = v6;
  }
  else
  {
    objc_msgSend(v5, "prettyName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v17;

  }
  v18 = 0;
  v19 = 0;
  do
  {
    if (v18)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "stringByDeletingPathExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pathExtension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@_%d.%@"), v21, v18, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = v14;
    }
    objc_msgSend(v9, "stringByAppendingPathComponent:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v13, "fileExistsAtPath:", v24);
    ++v18;

    v19 = v24;
  }
  while ((v25 & 1) != 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "writeToURL:options:error:", v26, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void)_requestAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ATMessageLink *messageLink;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  ATConcreteAssetLink *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v4, "storeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v7);

  _ATLogCategoryDeviceSync();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_1D19F1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Cloning %{public}@ to %{public}@ to request asset from the companion", buf, 0x20u);
  }

  v9 = objc_alloc(MEMORY[0x1E0CF76A0]);
  objc_msgSend(v4, "dataclass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializedAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithCommand:dataClass:parameters:", CFSTR("RequestAsset"), v10, v11);

  messageLink = self->_messageLink;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke;
  v15[3] = &unk_1E928CEC8;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  -[ATMessageLink sendRequest:withCompletion:](messageLink, "sendRequest:withCompletion:", v12, v15);

}

- (id)_keyForATAssetInReaderMap:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "assetParts");

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%ld-%@"), v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  objc_storeStrong((id *)&self->_pendingWriteSemaphore, 0);
  objc_storeStrong((id *)&self->_readersPendingStopGroup, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_fileIOQueue, 0);
  objc_storeStrong((id *)&self->_readerQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_readersToAssetsMap, 0);
  objc_storeStrong((id *)&self->_readersPendingStop, 0);
  objc_storeStrong((id *)&self->_readers, 0);
  objc_storeStrong((id *)&self->_outstandingAssets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageLink, 0);
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 72);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_2;
  v12[3] = &unk_1E928CD88;
  v13 = v6;
  v14 = v5;
  v15 = v7;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  uint64_t *v58;
  _QWORD *v59;
  _QWORD v60[5];
  id v61;
  id v62;
  uint64_t *v63;
  _QWORD v64[4];
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  uint64_t v81;
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32)
    || (objc_msgSend(*(id *)(a1 + 40), "error"), v2 = (void *)objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    _ATLogCategoryDeviceSync();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v4 = *(void **)(a1 + 56);
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v73 = v5;
      v74 = 2114;
      v75 = v4;
      v76 = 2114;
      v77 = v6;
      v78 = 2114;
      v79 = v7;
      _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Finishing %{public}@ because of stream error %{public}@ response error %{public}@", buf, 0x2Au);

    }
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 48), "_finishAsset:withError:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_finishAsset:withError:", v9, v10);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "setAssetState:", 1);
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    v82[0] = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetLink:didTransitionAssetStates:", v12, v13);

    +[ATAssetLinkPowerLogger sharedInstance](ATAssetLinkPowerLogger, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logAssetLinkOfType:didBeginDownloadingAsset:", 1, *(_QWORD *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 40), "parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("_AssetClientParams"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
      objc_msgSend(*(id *)(a1 + 56), "setClientParams:", v47);
    objc_msgSend(*(id *)(a1 + 40), "parameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("_AssetFileName"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "parameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("_AssetSize"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(*(id *)(a1 + 56), "setTotalBytes:", objc_msgSend(v48, "unsignedLongLongValue"));
      objc_msgSend(*(id *)(a1 + 56), "setBytesRemaining:", objc_msgSend(*(id *)(a1 + 56), "totalBytes"));
    }
    _ATLogCategoryDeviceSync();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v73 = v19;
      v74 = 2114;
      v75 = v20;
      v76 = 2050;
      v77 = objc_msgSend(v48, "unsignedLongLongValue");
      v78 = 2114;
      v79 = v46;
      _os_log_impl(&dword_1D19F1000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ starting download of asset %{public}@. size=%{public}lld, name=%{public}@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 48), "_urlForWritingAsset:withFileName:", *(_QWORD *)(a1 + 56), v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "writeToURL:options:error:", v21, 0, 0);

    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__2066;
    v70 = __Block_byref_object_dispose__2067;
    v65 = 0;
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v21, &v65);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v65;
    v71 = v23;
    if (v67[5])
    {
      objc_msgSend(v21, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setPath:", v24);

      v25 = objc_alloc(MEMORY[0x1E0D4D0E8]);
      objc_msgSend(*(id *)(a1 + 40), "dataStream");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithInputStream:queue:", v26, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72));

      objc_msgSend(*(id *)(a1 + 48), "_keyForATAssetInReaderMap:", *(_QWORD *)(a1 + 56));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x2020000000;
      v64[3] = 0;
      v29 = MEMORY[0x1E0C809B0];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_38;
      v60[3] = &unk_1E928CDB0;
      v60[4] = *(_QWORD *)(a1 + 48);
      v63 = &v66;
      v61 = *(id *)(a1 + 56);
      v30 = v28;
      v62 = v30;
      v31 = (void *)MEMORY[0x1D8230E64](v60);
      v55[0] = v29;
      v55[1] = 3221225472;
      v55[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_42;
      v55[3] = &unk_1E928CE50;
      v55[4] = *(_QWORD *)(a1 + 48);
      v56 = *(id *)(a1 + 56);
      v58 = &v66;
      v59 = v64;
      v32 = v31;
      v57 = v32;
      objc_msgSend(v27, "setDidReadDataBlock:", v55);
      v52[0] = v29;
      v52[1] = 3221225472;
      v52[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_46;
      v52[3] = &unk_1E928CE78;
      v33 = *(void **)(a1 + 56);
      v52[4] = *(_QWORD *)(a1 + 48);
      v53 = v33;
      v34 = v32;
      v54 = v34;
      objc_msgSend(v27, "setDidFinishReadingBlock:", v52);
      v49[0] = v29;
      v49[1] = 3221225472;
      v49[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_47;
      v49[3] = &unk_1E928CEA0;
      v35 = *(void **)(a1 + 56);
      v49[4] = *(_QWORD *)(a1 + 48);
      v50 = v35;
      v36 = v34;
      v51 = v36;
      objc_msgSend(v27, "setDidEncounterErrorBlock:", v49);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "addObject:", v27);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "setObject:forKey:", v27, v30);
      _ATLogCategoryDeviceSync();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = *(_QWORD *)(a1 + 48);
        v39 = *(_QWORD *)(a1 + 56);
        v40 = *(void **)(v38 + 40);
        v41 = *(_QWORD *)(v38 + 56);
        *(_DWORD *)buf = 138544386;
        v73 = v38;
        v74 = 2114;
        v75 = v27;
        v76 = 2114;
        v77 = v39;
        v78 = 2114;
        v79 = v40;
        v80 = 2114;
        v81 = v41;
        _os_log_impl(&dword_1D19F1000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding reader %{public}@ for %{public}@ activeReaders %{public}@, readerToAssetMap %{public}@", buf, 0x34u);
      }

      objc_msgSend(v27, "start");
      _Block_object_dispose(v64, 8);

    }
    else
    {
      _ATLogCategoryDeviceSync();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = *(_QWORD *)(a1 + 48);
        v44 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        v73 = v43;
        v74 = 2114;
        v75 = v44;
        v76 = 2114;
        v77 = (uint64_t)v45;
        _os_log_impl(&dword_1D19F1000, v42, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get file handle for writing asset %{public}@ - error %{public}@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 48), "_finishAsset:withError:", *(_QWORD *)(a1 + 56), v45);
    }
    _Block_object_dispose(&v66, 8);

  }
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_38(uint64_t a1, void *a2, int a3)
{
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  NSObject *v36;
  id v37;
  id v38;
  _QWORD block[5];
  id v40;
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 80);
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_2_39;
  block[3] = &unk_1E928CD60;
  v41 = *(_QWORD *)(a1 + 56);
  block[4] = v6;
  v40 = v7;
  v10 = a2;
  dispatch_barrier_sync(v8, block);
  objc_msgSend(*(id *)(a1 + 32), "_finishAsset:withError:", *(_QWORD *)(a1 + 40), v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v11 + 16))
  {
    _ATLogCategoryDeviceSync();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v43 = v21;
      v44 = 2114;
      v45 = v22;
      _os_log_impl(&dword_1D19F1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Not handling completion block for %{public}@ as the link is already closed", buf, 0x16u);
    }
    goto LABEL_20;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(v11 + 56), "objectForKey:");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      _ATLogCategoryDeviceSync();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 32);
        v25 = *(_QWORD *)(a1 + 40);
        v26 = *(_QWORD *)(v24 + 40);
        *(_DWORD *)buf = 138543874;
        v43 = v24;
        v44 = 2114;
        v45 = v25;
        v46 = 2114;
        v47 = v26;
        _os_log_impl(&dword_1D19F1000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not materialize reader for %{public}@ - active readers %{public}@", buf, 0x20u);
      }

      v13 = 0;
      goto LABEL_20;
    }
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 32);
    if (a3)
    {
      if ((objc_msgSend(*(id *)(v14 + 48), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 48));
        dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 96));
        _ATLogCategoryDeviceSync();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(_QWORD *)(a1 + 32);
          v33 = *(_QWORD *)(a1 + 40);
          v34 = *(_QWORD *)(v32 + 48);
          *(_DWORD *)buf = 138543874;
          v43 = v32;
          v44 = 2114;
          v45 = v33;
          v46 = 2114;
          v47 = v34;
          _os_log_impl(&dword_1D19F1000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping stream reader for %{public}@ readersPendingStop %{public}@", buf, 0x20u);
        }

        v35[0] = v9;
        v35[1] = 3221225472;
        v35[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_40;
        v35[3] = &unk_1E928CD88;
        v35[4] = *(_QWORD *)(a1 + 32);
        v13 = v13;
        v36 = v13;
        v37 = *(id *)(a1 + 48);
        v38 = *(id *)(a1 + 40);
        -[NSObject stopWithCompletion:](v13, "stopWithCompletion:", v35);

        goto LABEL_20;
      }
      _ATLogCategoryDeviceSync();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v43 = v16;
        v44 = 2114;
        v45 = v17;
        v18 = "%{public}@ Reader for %{public}@ is already pending stop";
        v19 = v15;
        v20 = 22;
LABEL_15:
        _os_log_impl(&dword_1D19F1000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      objc_msgSend(*(id *)(v14 + 40), "removeObject:", v12);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
      _ATLogCategoryDeviceSync();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *(_QWORD *)(a1 + 32);
        v28 = *(_QWORD *)(a1 + 40);
        v29 = *(_QWORD *)(v27 + 40);
        v30 = *(_QWORD *)(v27 + 56);
        *(_DWORD *)buf = 138544130;
        v43 = v27;
        v44 = 2114;
        v45 = v28;
        v46 = 2114;
        v47 = v29;
        v48 = 2114;
        v49 = v30;
        v18 = "%{public}@ Removed reader for %{public}@ from our list - active readers %{public}@, readerMap %{public}@";
        v19 = v15;
        v20 = 42;
        goto LABEL_15;
      }
    }

LABEL_20:
  }

}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_42(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  unsigned int *v5;
  unsigned int v6;
  int v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1[4] + 32), "containsObject:", a1[5]))
  {
    v4 = objc_msgSend(v3, "length");
    v5 = (unsigned int *)(a1[4] + 104);
    do
    {
      v6 = __ldxr(v5);
      v7 = v6 + v4;
    }
    while (__stxr(v6 + v4, v5));
    v8 = *(NSObject **)(a1[4] + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_2_43;
    block[3] = &unk_1E928CE28;
    v21 = a1[7];
    v9 = v3;
    v10 = a1[4];
    v11 = (void *)a1[5];
    v18 = v9;
    v19 = v10;
    v12 = v11;
    v13 = a1[8];
    v20 = v12;
    v22 = v13;
    dispatch_async(v8, block);
    if (v7 >= 0x200000)
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 112), 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    _ATLogCategoryDeviceSync();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = a1[4];
      v16 = a1[5];
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_1D19F1000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ handling didReadDataBlock for %{public}@ that's not in our list", buf, 0x16u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }

}

uint64_t __37__ATConcreteAssetLink__requestAsset___block_invoke_46(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryDeviceSync();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished reading asset %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_47(_QWORD *a1, void *a2)
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
  _ATLogCategoryDeviceSync();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not sync %{public}@ - error %{public}@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_2_43(uint64_t a1)
{
  int v2;
  unsigned int *v3;
  int v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "writeData:", *(_QWORD *)(a1 + 32));
  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = (unsigned int *)(*(_QWORD *)(a1 + 40) + 104);
  do
    v4 = __ldxr(v3);
  while (__stxr(v4 - v2, v3));
  if (v4 >= 0x200000 && v4 - v2 < 0x200000)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 112));
  v5 = *(void **)(a1 + 48);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 72);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_3;
  v10[3] = &unk_1E928CE00;
  v11 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v7;
  v13 = v9;
  v14 = v8;
  dispatch_async(v6, v10);

}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_3(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "bytesRemaining"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setBytesRemaining:", objc_msgSend(*(id *)(a1 + 32), "bytesRemaining") - objc_msgSend(*(id *)(a1 + 40), "length"));
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v2 - *(double *)(v3 + 24) > 0.5)
    {
      *(double *)(v3 + 24) = v2;
      v4 = *(_QWORD *)(a1 + 48);
      v5 = *(NSObject **)(v4 + 88);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __37__ATConcreteAssetLink__requestAsset___block_invoke_4;
      v6[3] = &unk_1E928CDD8;
      v6[4] = v4;
      v7 = *(id *)(a1 + 32);
      dispatch_async(v5, v6);

    }
  }
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLink:didUpdateAsset:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (double)(objc_msgSend(*(id *)(a1 + 40), "totalBytes")/ (unint64_t)objc_msgSend(*(id *)(a1 + 40), "bytesRemaining")));

}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_2_39(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "closeFile");
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    _ATLogCategoryDeviceSync();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1D19F1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Closing write fileHandle for %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __37__ATConcreteAssetLink__requestAsset___block_invoke_40(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 72));
  objc_msgSend(*(id *)(a1[4] + 40), "removeObject:", a1[5]);
  objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[6]);
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 96));
  _ATLogCategoryDeviceSync();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[7];
    v5 = *(_QWORD *)(v3 + 40);
    v6 = *(_QWORD *)(v3 + 56);
    v7 = 138544130;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing stop message for %{public}@ - active readers %{public}@, readerMap %{public}@", (uint8_t *)&v7, 0x2Au);
  }

}

void __46__ATConcreteAssetLink__finishAsset_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLink:didFinishAsset:error:retryable:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

}

void __36__ATConcreteAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", v7))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j);
        v14 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0, (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_finishAsset:withError:", v13, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

}

uint64_t __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
    return;
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v2 >= 2)
  {
    if (!*(_BYTE *)(a1 + 64))
      return;
LABEL_10:
    if (!objc_msgSend(*(id *)(a1 + 40), "count"))
      return;
    goto LABEL_11;
  }
  if (*(_BYTE *)(a1 + 64))
    goto LABEL_10;
  v3 = 2 - v2;
  v4 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v3 >= v4)
    v5 = v4;
  else
    v5 = v3;
  if (v5)
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

uint64_t __43__ATConcreteAssetLink_enqueueAssets_force___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __28__ATConcreteAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[4];
  __int128 v26;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 16))
  {
    v3 = *(NSObject **)(v1 + 72);
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__ATConcreteAssetLink_close__block_invoke_2;
    block[3] = &unk_1E928CCA8;
    v5 = *(_QWORD *)(a1 + 40);
    block[4] = v1;
    block[5] = v5;
    dispatch_sync(v3, block);
    _ATLogCategoryDeviceSync();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
      *(_DWORD *)buf = 138543618;
      v29 = v7;
      v30 = 2048;
      v31 = v8;
      _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Closing .... outstanding asset count:%ld", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObserver:");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = 0;

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v25[0] = v4;
      v25[1] = 3221225472;
      v25[2] = __28__ATConcreteAssetLink_close__block_invoke_11;
      v25[3] = &unk_1E928CCA8;
      v26 = *(_OWORD *)(a1 + 32);
      dispatch_async(*(dispatch_queue_t *)(v26 + 88), v25);
    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 72);
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __28__ATConcreteAssetLink_close__block_invoke_2_12;
    v24[3] = &unk_1E928CC80;
    v24[4] = v13;
    dispatch_sync(v14, v24);
    dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 96), 0xFFFFFFFFFFFFFFFFLL);
    _ATLogCategoryDeviceSync();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_impl(&dword_1D19F1000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished waiting for readers to process their stop messages", buf, 0xCu);
    }

    dispatch_barrier_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72), &__block_literal_global_2095);
    _ATLogCategoryDeviceSync();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_impl(&dword_1D19F1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished waiting for readerQueue to drain", buf, 0xCu);
    }

    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(NSObject **)(v19 + 72);
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __28__ATConcreteAssetLink_close__block_invoke_15;
    v23[3] = &unk_1E928CC80;
    v23[4] = v19;
    dispatch_sync(v20, v23);
    _ATLogCategoryDeviceSync();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v29 = v22;
      _os_log_impl(&dword_1D19F1000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Wrapped up ...", buf, 0xCu);
    }

  }
}

uint64_t __28__ATConcreteAssetLink_close__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

void __28__ATConcreteAssetLink_close__block_invoke_11(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLink:didCloseWithOutstandingAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __28__ATConcreteAssetLink_close__block_invoke_2_12(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138543618;
    v13 = v4;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", v9, v13) & 1) == 0)
        {
          _ATLogCategoryDeviceSync();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v13;
            v20 = v11;
            v21 = 2114;
            v22 = v9;
            _os_log_impl(&dword_1D19F1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping reader for assetID/Part %{public}@", buf, 0x16u);
          }

          dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 96));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = v7;
          v14[1] = 3221225472;
          v14[2] = __28__ATConcreteAssetLink_close__block_invoke_13;
          v14[3] = &unk_1E928CC80;
          v14[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend(v12, "stopWithCompletion:", v14);

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);
  }

}

uint64_t __28__ATConcreteAssetLink_close__block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryDeviceSync();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(v3 + 40), "count");
    v6 = 138543618;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing %ld readers from our collection", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

void __28__ATConcreteAssetLink_close__block_invoke_13(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 96));
}

void __27__ATConcreteAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__ATConcreteAssetLink_open__block_invoke_2;
    block[3] = &unk_1E928CC80;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

void __27__ATConcreteAssetLink_open__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "assetLink:didOpenWithPendingAssets:", *(_QWORD *)(a1 + 32), 0);

}

@end
