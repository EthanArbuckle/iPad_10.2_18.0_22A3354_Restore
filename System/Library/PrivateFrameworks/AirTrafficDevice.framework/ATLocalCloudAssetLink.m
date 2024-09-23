@implementation ATLocalCloudAssetLink

- (ATLocalCloudAssetLink)initWithMessageLink:(id)a3
{
  id v5;
  ATLocalCloudAssetLink *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  uint64_t v11;
  NSMutableOrderedSet *queuedAssets;
  uint64_t v13;
  NSMutableDictionary *activeRequests;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATLocalCloudAssetLink;
  v6 = -[ATLocalCloudAssetLink init](&v16, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.atc.ATLocalCloudAssetLink", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.atc.ATLocalCloudAssetLink.callback", 0);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_messageLink, a3);
    -[ATConcreteMessageLink addObserver:](v6->_messageLink, "addObserver:", v6);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v11 = objc_claimAutoreleasedReturnValue();
    queuedAssets = v6->_queuedAssets;
    v6->_queuedAssets = (NSMutableOrderedSet *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v13 = objc_claimAutoreleasedReturnValue();
    activeRequests = v6->_activeRequests;
    v6->_activeRequests = (NSMutableDictionary *)v13;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ATLocalCloudAssetLink;
  -[ATLocalCloudAssetLink dealloc](&v2, sel_dealloc);
}

- (BOOL)open
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ATLocalCloudAssetLink_open__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
  return self->_open;
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ATLocalCloudAssetLink_close__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4678;
  v17 = __Block_byref_object_dispose__4679;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ATLocalCloudAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E927E170;
  block[4] = self;
  v11 = v5;
  v12 = &v13;
  v7 = v5;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)canEnqueueAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  if (!-[ATLegacyMessageLink hostSupportsLocalCloudDownloads](self->_messageLink, "hostSupportsLocalCloudDownloads")
    || !objc_msgSend(v4, "isDownload"))
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "storeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "longLongValue"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v4, "storeInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sagaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  if (!v9)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v10 = 1;
LABEL_8:

  return v10;
}

- (void)cancelAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLocalCloudAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ATLocalCloudAssetLink_cancelAssets___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

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
  v7[2] = __41__ATLocalCloudAssetLink_prioritizeAsset___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (unint64_t)maximumBatchSize
{
  return -1;
}

- (BOOL)linkIsReady
{
  return self->_open;
}

- (unint64_t)priority
{
  return 150;
}

- (void)messageLinkWasInitialized:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAssetLink:", self);

  -[ATLocalCloudAssetLink open](self, "open");
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *callbackQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATLocalCloudAssetLink *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ATLocalCloudAssetLink__finishAsset_withError___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(callbackQueue, block);

}

- (void)_handleLocalCloudDownloadResponse:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLocalCloudAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ATLocalCloudAssetLink__handleLocalCloudDownloadResponse___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_requestNextDownload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
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
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_queuedAssets, 0);
  objc_storeStrong((id *)&self->_messageLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

void __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
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
  ATLocalCloudAssetRequest *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") <= 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectEnumerator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", v3);
      v20 = objc_alloc_init(ATLocalCloudAssetRequest);
      -[ATLocalCloudAssetRequest setAsset:](v20, "setAsset:", v3);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[ATLocalCloudAssetRequest setStartTime:](v20, "setStartTime:");
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(v3, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v20, v5);

      objc_msgSend(v3, "setAssetState:", 1);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
      v7 = *(_QWORD *)(a1 + 32);
      v25[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "assetLink:didTransitionAssetStates:", v7, v8);

      v23[0] = CFSTR("AssetID");
      objc_msgSend(v3, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v9;
      v23[1] = CFSTR("Dataclass");
      objc_msgSend(v3, "dataclass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v10;
      v23[2] = CFSTR("DSID");
      objc_msgSend(v3, "storeInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cloudDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v12;
      v23[3] = CFSTR("StoreSagaId");
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "storeInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sagaID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithLongLong:", objc_msgSend(v15, "longLongValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("LocalCloudDownloadRequest"), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke_2;
      v21[3] = &unk_1E927E1C0;
      v21[4] = *(_QWORD *)(a1 + 32);
      v22 = v3;
      objc_msgSend(v18, "sendMessage:withCompletion:", v19, v21);

    }
  }
}

void __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke_3;
  block[3] = &unk_1E927E198;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __45__ATLocalCloudAssetLink__requestNextDownload__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _ATLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_ERROR, "failed to send asset request message. err=%@", (uint8_t *)&v8, 0xCu);
    }

    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_finishAsset:withError:", v5, v6);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "close");
  }
  return objc_msgSend(*(id *)(a1 + 40), "_requestNextDownload");
}

void __59__ATLocalCloudAssetLink__handleLocalCloudDownloadResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id WeakRetained;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AssetID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("ErrorCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _ATLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v3;
      _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "ignoring unexpected identifier in local cloud response '%@'", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("Data"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("EOF"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("AssetProgress"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("_AssetFileName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataclass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createAirlockForDataclasses:", v15);

    objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataclass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pathForDataclass:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v12;
    objc_msgSend(v12, "pathExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathExtension:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v20;
    v43 = v18;
    objc_msgSend(v18, "stringByAppendingPathComponent:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("FileSize"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "fileHandle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = 0;
      if (v22)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dataclass");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "createAirlockForDataclasses:", v25);

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeItemAtPath:error:", v21, 0);

        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        objc_msgSend(v27, "writeToFile:options:error:", v21, 0, &v48);
        v10 = v48;

        objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setFileHandle:", v28);

        if (!v28)
        {
          _ATLogCategoryDefault();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v50 = (uint64_t)v6;
            _os_log_impl(&dword_1D1868000, v39, OS_LOG_TYPE_ERROR, "failed to create file handle for asset %@", buf, 0xCu);
          }

          v40 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 13, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "_finishAsset:withError:", v6, v41);

          v32 = v45;
          goto LABEL_19;
        }
      }
      objc_msgSend(v5, "fileHandle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "writeData:", v9);

    }
    else
    {
      v10 = 0;
      v4 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
    v31 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v47, "doubleValue");
    objc_msgSend(WeakRetained, "assetLink:didUpdateAsset:progress:", v31, v6);

    v32 = v45;
    if (objc_msgSend(v45, "BOOLValue"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v34 = v33;
      objc_msgSend(v5, "startTime");
      v36 = v35;
      _ATLogCategoryDefault();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = objc_msgSend(v46, "longLongValue");
        *(_DWORD *)buf = 138412802;
        v50 = (uint64_t)v6;
        v51 = 2048;
        v52 = v34 - v36;
        v53 = 2048;
        v54 = (double)v38 / (v34 - v36);
        _os_log_impl(&dword_1D1868000, v37, OS_LOG_TYPE_DEFAULT, "finished asset %@ in %.2f seconds (%f b/s)", buf, 0x20u);
      }

      objc_msgSend(v6, "setPath:", v21);
      objc_msgSend(*(id *)(a1 + 40), "_finishAsset:withError:", v6, 0);
    }
LABEL_19:

    goto LABEL_20;
  }
  _ATLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v50 = objc_msgSend(v4, "longValue");
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_ERROR, "received error in local cloud response. errorCode=%ld", buf, 0xCu);
  }

  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), objc_msgSend(v4, "integerValue"), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_finishAsset:withError:", v6, v9);
LABEL_8:
  v10 = 0;
LABEL_20:

}

uint64_t __48__ATLocalCloudAssetLink__finishAsset_withError___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;

  objc_msgSend(a1[4], "setAssetState:", 2);
  v2 = (void *)*((_QWORD *)a1[5] + 6);
  objc_msgSend(a1[4], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_msgSend(a1[5], "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v8 = objc_msgSend(v7, "code") != 3 && objc_msgSend(a1[6], "code") != 16;
  objc_msgSend(v4, "assetLink:didFinishAsset:error:retryable:", v5, v6, v7, v8);

  return objc_msgSend(a1[5], "_requestNextDownload");
}

uint64_t __41__ATLocalCloudAssetLink_prioritizeAsset___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
  }
  return result;
}

void __38__ATLocalCloudAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  uint64_t v9;
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
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "containsObject:", v7);
        v9 = *(_QWORD *)(a1 + 40);
        if (v8)
        {
          objc_msgSend(*(id *)(v9 + 40), "removeObject:", v7);
          v10 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_finishAsset:withError:", v7, v11);
        }
        else
        {
          v12 = *(void **)(v9 + 48);
          objc_msgSend(v7, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v14 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
            objc_msgSend(v7, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "removeObjectForKey:", v15);

            v26[0] = CFSTR("AssetID");
            objc_msgSend(v7, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v16;
            v26[1] = CFSTR("Dataclass");
            objc_msgSend(v7, "dataclass");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v26[2] = CFSTR("ErrorCode");
            v27[1] = v17;
            v27[2] = &unk_1E928B848;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
            objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("LocalCloudDownloadCancelRequest"), v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __38__ATLocalCloudAssetLink_cancelAssets___block_invoke_50;
            v21[3] = &unk_1E927E1C0;
            v21[4] = *(_QWORD *)(a1 + 40);
            v21[5] = v7;
            objc_msgSend(v19, "sendMessage:withCompletion:", v20, v21);

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v4);
  }

}

void __38__ATLocalCloudAssetLink_cancelAssets___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  __int128 v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __38__ATLocalCloudAssetLink_cancelAssets___block_invoke_2;
  block[3] = &unk_1E927E198;
  v8 = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

void __38__ATLocalCloudAssetLink_cancelAssets___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_finishAsset:withError:", v3, v4);

  if (a1[6])
  {
    _ATLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[6];
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "failed to send asset cancelled message. err=%@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1[4] + 32), "close");
  }
}

uint64_t __45__ATLocalCloudAssetLink_enqueueAssets_force___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 56) && *(_QWORD *)(v1 + 32))
  {
    v2 = result;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(result + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
LABEL_5:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 40), "addObject:", v8, (_QWORD)v10);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40), "addObject:", v8);
        v9 = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 40), "count");
        if (v9 >= objc_msgSend(*(id *)(v2 + 32), "maximumBatchSize"))
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v5)
            goto LABEL_5;
          break;
        }
      }
    }

    return objc_msgSend(*(id *)(v2 + 32), "_requestNextDownload");
  }
  return result;
}

void __30__ATLocalCloudAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 56))
  {
    objc_msgSend(*(id *)(v1 + 48), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8), "asset");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 16, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_finishAsset:withError:", v10, v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);
    }

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObserver:");
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 32);
    *(_QWORD *)(v14 + 32) = 0;

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 8);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __30__ATLocalCloudAssetLink_close__block_invoke_2;
    v19[3] = &unk_1E927E148;
    v19[4] = v16;
    v20 = v12;
    v18 = v12;
    dispatch_async(v17, v19);

  }
}

void __30__ATLocalCloudAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "assetLink:didCloseWithOutstandingAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __29__ATLocalCloudAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  _QWORD v8[4];
  id v9;
  id location;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 56))
  {
    *(_BYTE *)(v1 + 56) = 1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__ATLocalCloudAssetLink_open__block_invoke_2;
    v8[3] = &unk_1E927E0F8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "setHandlerForMessage:handler:", CFSTR("LocalCloudDownloadResponse"), v8);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __29__ATLocalCloudAssetLink_open__block_invoke_3;
    block[3] = &unk_1E927E120;
    block[4] = v5;
    dispatch_async(v6, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __29__ATLocalCloudAssetLink_open__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleLocalCloudDownloadResponse:", v4);

}

void __29__ATLocalCloudAssetLink_open__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "assetLink:didOpenWithPendingAssets:", *(_QWORD *)(a1 + 32), 0);

}

@end
