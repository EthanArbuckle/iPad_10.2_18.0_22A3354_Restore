@implementation ATLegacyAssetLink

- (ATLegacyAssetLink)initWithMessageLink:(id)a3 hostVersion:(id)a4
{
  id v7;
  id v8;
  ATLegacyAssetLink *v9;
  objc_class *v10;
  const char *Name;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  dispatch_queue_t v14;
  OS_dispatch_queue *callbackQueue;
  NSMutableSet *v16;
  NSMutableSet *unqueuedAssets;
  NSMutableDictionary *v18;
  NSMutableDictionary *enqueuedAssetsByDataClass;
  NSMutableDictionary *v20;
  NSMutableDictionary *syncIDToItemPidMap;
  NSArray *v22;
  NSArray *supportedDataClasses;
  NSMutableArray *v24;
  NSMutableArray *readyDataClasses;
  uint64_t v26;
  NSString *hostVersion;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)ATLegacyAssetLink;
  v9 = -[ATLegacyAssetLink init](&v29, sel_init);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    Name = class_getName(v10);
    v12 = dispatch_queue_create(Name, 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.atc.legacyassetlink.callback", 0);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_messageLink, a3);
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    unqueuedAssets = v9->_unqueuedAssets;
    v9->_unqueuedAssets = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enqueuedAssetsByDataClass = v9->_enqueuedAssetsByDataClass;
    v9->_enqueuedAssetsByDataClass = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    syncIDToItemPidMap = v9->_syncIDToItemPidMap;
    v9->_syncIDToItemPidMap = v20;

    v22 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    supportedDataClasses = v9->_supportedDataClasses;
    v9->_supportedDataClasses = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    readyDataClasses = v9->_readyDataClasses;
    v9->_readyDataClasses = v24;

    v26 = objc_msgSend(v8, "copy");
    hostVersion = v9->_hostVersion;
    v9->_hostVersion = (NSString *)v26;

  }
  return v9;
}

- (BOOL)open
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__ATLegacyAssetLink_open__block_invoke;
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
  block[2] = __26__ATLegacyAssetLink_close__block_invoke;
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
  v16 = __Block_byref_object_copy__2099;
  v17 = __Block_byref_object_dispose__2100;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ATLegacyAssetLink_enqueueAssets_force___block_invoke;
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
  int v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v12;
  void *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "installOnly") & 1) != 0)
    goto LABEL_5;
  -[ATLegacyAssetLink supportedDataClasses](self, "supportedDataClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataclass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v4, "dataclass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Application")))
  {
    v9 = objc_msgSend(v4, "isRestore");

    if ((v9 & 1) != 0)
    {
LABEL_5:
      v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  if ((objc_msgSend(v4, "isLegacy") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "storeInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13 != 0;

  }
LABEL_6:

  return v10;
}

- (void)cancelAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLegacyAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__ATLegacyAssetLink_cancelAssets___block_invoke;
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
  NSObject *queue;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATLegacyMessageLink *messageLink;
  void *v15;
  _QWORD v16[5];
  _QWORD block[5];
  id v18;
  _BYTE *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryiTunesSync();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Prioritize %{public}@", buf, 0x16u);
  }

  if (-[NSMutableSet containsObject:](self->_unqueuedAssets, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_unqueuedAssets, "removeObject:", v4);
    -[NSMutableSet addObject:](self->_unqueuedAssets, "addObject:", v4);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__2099;
    v27 = __Block_byref_object_dispose__2100;
    v28 = 0;
    queue = self->_queue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__ATLegacyAssetLink_prioritizeAsset___block_invoke;
    block[3] = &unk_1E927E170;
    v19 = buf;
    block[4] = self;
    v8 = v4;
    v18 = v8;
    dispatch_sync(queue, block);
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      objc_msgSend(v8, "setIsPrioritized:", 1);
      v23 = CFSTR("AssetManifest");
      objc_msgSend(v8, "dataclass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v9;
      -[ATLegacyAssetLink _manifestEntryForATAsset:](self, "_manifestEntryForATAsset:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      messageLink = self->_messageLink;
      objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("PrioritizeAsset"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_2;
      v16[3] = &unk_1E927E0D0;
      v16[4] = self;
      -[ATLegacyMessageLink sendMessage:withCompletion:](messageLink, "sendMessage:withCompletion:", v15, v16);

    }
    _Block_object_dispose(buf, 8);

  }
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
  return 100;
}

- (void)setReadyDataClasses:(id)a3
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
  v7[2] = __41__ATLegacyAssetLink_setReadyDataClasses___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSArray)readyDataClasses
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
  v9 = __Block_byref_object_copy__2099;
  v10 = __Block_byref_object_dispose__2100;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ATLegacyAssetLink_readyDataClasses__block_invoke;
  v5[3] = &unk_1E927D590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)_handleFileCompleteMessage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLegacyAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ATLegacyAssetLink__handleFileCompleteMessage___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_handleFileErrorMessage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLegacyAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ATLegacyAssetLink__handleFileErrorMessage___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_handleFileProgressMessage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATLegacyAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *enqueuedAssetsByDataClass;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *syncIDToItemPidMap;
  void *v16;
  void *v17;
  NSObject *callbackQueue;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  enqueuedAssetsByDataClass = self->_enqueuedAssetsByDataClass;
  objc_msgSend(v6, "dataclass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](enqueuedAssetsByDataClass, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeObject:", v6);
  if (!objc_msgSend(v10, "count"))
  {
    v11 = self->_enqueuedAssetsByDataClass;
    objc_msgSend(v6, "dataclass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

  }
  objc_msgSend(v6, "storeInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syncID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    syncIDToItemPidMap = self->_syncIDToItemPidMap;
    objc_msgSend(v6, "storeInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "syncID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](syncIDToItemPidMap, "removeObjectForKey:", v17);

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ATLegacyAssetLink__finishAsset_withError___block_invoke;
  block[3] = &unk_1E927E198;
  block[4] = self;
  v22 = v6;
  v23 = v7;
  v19 = v7;
  v20 = v6;
  dispatch_async(callbackQueue, block);

}

- (id)_assetsForDataClass:(id)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_enqueuedAssetsByDataClass, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "identifier", (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if (v16)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    v17 = v8;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (id)_assetManifestForDataclasses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NSMutableDictionary allKeys](self->_enqueuedAssetsByDataClass, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v22 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v8);
        if (objc_msgSend(v4, "containsObject:", v9, v22))
        {
          v10 = v4;
          v11 = (void *)MEMORY[0x1E0C99DE8];
          -[NSMutableDictionary objectForKey:](self->_enqueuedAssetsByDataClass, "objectForKey:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          -[NSMutableDictionary objectForKey:](self->_enqueuedAssetsByDataClass, "objectForKey:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v27 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                if ((objc_msgSend(v19, "readyForStore") & 1) == 0)
                {
                  -[ATLegacyAssetLink _manifestEntryForATAsset:](self, "_manifestEntryForATAsset:", v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "addObject:", v20);

                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v16);
          }

          objc_msgSend(v23, "setObject:forKey:", v13, v9);
          v4 = v10;
          v7 = v22;
          v6 = v24;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  return v23;
}

- (void)_enqueueAndRequestAssets
{
  void *v3;
  void *v4;
  void *v5;
  ATLegacyAssetLink *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *readyDataClasses;
  void *v15;
  NSMutableSet *v16;
  NSMutableDictionary *enqueuedAssetsByDataClass;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *syncIDToItemPidMap;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  ATLegacyMessageLink *messageLink;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  const __CFString *v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_enqueuedAssetsByDataClass, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = self;
  v7 = self->_unqueuedAssets;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    v35 = v5;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v12, "dataclass", v35);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "containsObject:", v13) & 1) == 0)
        {
          readyDataClasses = v6->_readyDataClasses;
          objc_msgSend(v12, "dataclass");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(readyDataClasses) = -[NSMutableArray containsObject:](readyDataClasses, "containsObject:", v15);

          if (!(_DWORD)readyDataClasses)
            continue;
          v16 = v7;
          enqueuedAssetsByDataClass = v6->_enqueuedAssetsByDataClass;
          objc_msgSend(v12, "dataclass");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](enqueuedAssetsByDataClass, "objectForKey:", v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v13 = (void *)objc_opt_new();
            v19 = v6->_enqueuedAssetsByDataClass;
            objc_msgSend(v12, "dataclass");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v13, v20);

          }
          objc_msgSend(v12, "setAssetState:", 1);
          objc_msgSend(v13, "addObject:", v12);
          objc_msgSend(v37, "addObject:", v12);
          objc_msgSend(v12, "dataclass");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v21);

          objc_msgSend(v12, "storeInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "syncID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "longLongValue");

          if (v24)
          {
            syncIDToItemPidMap = v6->_syncIDToItemPidMap;
            objc_msgSend(v12, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "storeInfo");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "syncID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](syncIDToItemPidMap, "setObject:forKey:", v26, v28);

          }
          v7 = v16;
          v5 = v35;
        }

      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v9);
  }

  -[NSMutableSet minusSet:](v6->_unqueuedAssets, "minusSet:", v37);
  objc_msgSend(v36, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATLegacyAssetLink _assetManifestForDataclasses:](v6, "_assetManifestForDataclasses:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30 && objc_msgSend(v30, "count"))
  {
    messageLink = v6->_messageLink;
    v32 = (void *)MEMORY[0x1E0CF7690];
    v43 = CFSTR("AssetManifest");
    v44 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "messageWithName:parameters:", CFSTR("AssetManifest"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __45__ATLegacyAssetLink__enqueueAndRequestAssets__block_invoke;
    v38[3] = &unk_1E927E0D0;
    v38[4] = v6;
    -[ATLegacyMessageLink sendMessage:withCompletion:](messageLink, "sendMessage:withCompletion:", v34, v38);

  }
}

- (id)_manifestEntryForATAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  if (v8)
  {
    objc_msgSend(v4, "storeInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "syncID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("AssetID"));

  }
  else
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("AssetID"));
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isDownload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("IsDownload"));

  objc_msgSend(v4, "variantOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "variantOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithDictionary:", v14);

    if (-[NSString compare:options:](self->_hostVersion, "compare:options:", CFSTR("12.6.0.43"), 64) == NSOrderedAscending)
    {
      objc_msgSend(v4, "setLyricsEmbeddedInAsset:", 1);
      v16 = objc_msgSend(v4, "assetParts");
      objc_msgSend(v15, "removeObjectForKey:", CFSTR("AssetParts"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16 & 6 | 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("AssetParts"));

      _ATLogCategoryiTunesSync();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 134218498;
        v27 = v16;
        v28 = 2048;
        v29 = v16 & 6 | 1;
        v30 = 2114;
        v31 = v4;
        _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "updating parts from %lu to %lu for asset %{public}@", (uint8_t *)&v26, 0x20u);
      }

    }
    objc_msgSend(v4, "dataclass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Application"));

    if (v20)
      objc_msgSend(v15, "removeObjectForKey:", CFSTR("AssetParts"));
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("Variant"));

  }
  objc_msgSend(v4, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("AssetPath"));

  }
  objc_msgSend(v4, "assetType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v4, "assetType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("AssetType"));

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

- (NSArray)supportedDataClasses
{
  return self->_supportedDataClasses;
}

- (void)setSupportedDataClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ATLegacyAssetLinkProgressDelegate)progressDelegate
{
  return (ATLegacyAssetLinkProgressDelegate *)objc_loadWeakRetained((id *)&self->_progressDelegate);
}

- (void)setProgressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_progressDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressDelegate);
  objc_storeStrong((id *)&self->_supportedDataClasses, 0);
  objc_storeStrong((id *)&self->_hostVersion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_readyDataClasses, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncIDToItemPidMap, 0);
  objc_storeStrong((id *)&self->_messageLink, 0);
  objc_storeStrong((id *)&self->_enqueuedAssetsByDataClass, 0);
  objc_storeStrong((id *)&self->_unqueuedAssets, 0);
}

uint64_t __45__ATLegacyAssetLink__enqueueAndRequestAssets__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "close");
  return result;
}

void __44__ATLegacyAssetLink__finishAsset_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = objc_msgSend(v4, "code") != 3 && objc_msgSend(*(id *)(a1 + 48), "code") != 16;
  objc_msgSend(v6, "assetLink:didFinishAsset:error:retryable:", v2, v3, v4, v5);

}

void __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD block[7];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("Dataclass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("AssetProgress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("AssetID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  v27 = v10;
  objc_msgSend(*(id *)(a1 + 40), "_assetsForDataClass:identifier:", v2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v32;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v16 = v5;
        *(float *)&v13 = v16;
        objc_msgSend(v19, "setDownloadProgress:", v13);
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(NSObject **)(v20 + 64);
        block[0] = v17;
        block[1] = 3221225472;
        block[2] = __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke_2;
        block[3] = &unk_1E927DAC8;
        block[4] = v20;
        block[5] = v19;
        *(double *)&block[6] = v5;
        dispatch_async(v21, block);
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("OverallProgress"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 40), "progressDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v25 = *(_QWORD *)(a1 + 40);
      v26 = *(NSObject **)(v25 + 64);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke_3;
      v28[3] = &unk_1E927E148;
      v28[4] = v25;
      v29 = v22;
      dispatch_async(v26, v28);

    }
  }

}

void __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLink:didUpdateAsset:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

}

void __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "progressDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  objc_msgSend(v3, "assetLink:didUpdateOverallProgress:", v2);

}

void __45__ATLegacyAssetLink__handleFileErrorMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("Dataclass"));
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("ErrorIsVisible"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("ErrorCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("AssetID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v3)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, CFSTR("ATLegacyAssetLinkErrorIsVisibleKey"));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), (int)objc_msgSend(v4, "intValue", v4), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 40), "_assetsForDataClass:identifier:", v2, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(a1 + 40), "_finishAsset:withError:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v12);
        objc_msgSend(*(id *)(a1 + 40), "_enqueueAndRequestAssets");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

void __48__ATLegacyAssetLink__handleFileCompleteMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *log;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("Dataclass"));
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("AssetID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("AssetPath"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  v34 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 40), "_assetsForDataClass:identifier:", v2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  _ATLogCategoryiTunesSync();
  log = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v41 = v11;
      v42 = 1024;
      v43 = objc_msgSend(v8, "count");
      v44 = 2114;
      v45 = v8;
      _os_log_impl(&dword_1D1868000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Matched %d assets: %{public}@", buf, 0x1Cu);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    log = v8;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v12)
    {
      v13 = v12;
      v29 = v8;
      v30 = v7;
      v31 = v3;
      v14 = *(_QWORD *)v36;
      while (1)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(log);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (objc_msgSend(v16, "isDownload", v29, v30, v31))
            objc_msgSend(v16, "setPath:", v32);
          objc_msgSend(v16, "setBypassStore:", 1);
          objc_msgSend(v16, "dataclass");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Application"));

          if (v18)
            objc_msgSend(v16, "setCompletedAssetParts:", 1);
          objc_msgSend(v16, "dataclass");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("Application")) & 1) != 0)
            goto LABEL_19;
          objc_msgSend(v16, "dataclass");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("Media"));

          if ((v21 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "processCompletedAsset:", v16);
LABEL_19:

          }
          objc_msgSend(*(id *)(a1 + 40), "_finishAsset:withError:", v16, 0);
          +[ATClientController sharedInstance](ATClientController, "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "clientForDataclass:", v34);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("Metadata"));
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)v24;
            v26 = objc_opt_respondsToSelector();

            if ((v26 & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("Metadata"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("Anchor"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "metadataUpdate:forAsset:withNewAnchor:", v27, v16, v28);

            }
          }
          objc_msgSend(*(id *)(a1 + 40), "_enqueueAndRequestAssets");

        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (!v13)
        {
          v7 = v30;
          v3 = v31;
          v8 = v29;
          break;
        }
      }
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 138543362;
    v41 = v7;
    _os_log_impl(&dword_1D1868000, log, OS_LOG_TYPE_DEFAULT, "ignoring transfer completion for unknown asset %{public}@", buf, 0xCu);
  }

}

void __37__ATLegacyAssetLink_readyDataClasses__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __41__ATLegacyAssetLink_setReadyDataClasses___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_enqueueAndRequestAssets");
}

void __37__ATLegacyAssetLink_prioritizeAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataclass");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_assetsForDataClass:identifier:", v7, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_3;
  v7[3] = &unk_1E927E148;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _ATLogCategoryiTunesSync();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_ERROR, "failed to send asset cancelled message. err=%{public}@", buf, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(NSObject **)(v4 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_39;
    block[3] = &unk_1E927E120;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "close");
}

void __34__ATLegacyAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    v6 = 0x1E0CB3000uLL;
    v25 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "containsObject:", v8);
        v10 = *(_QWORD *)(a1 + 40);
        if (v9)
        {
          objc_msgSend(*(id *)(v10 + 8), "removeObject:", v8);
          v11 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(v6 + 1480), "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_finishAsset:withError:", v8, v12);
        }
        else
        {
          v13 = *(void **)(v10 + 16);
          objc_msgSend(v8, "dataclass");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "containsObject:", v8))
          {
            v15 = (void *)MEMORY[0x1E0C99D80];
            objc_msgSend(v8, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "dataclass");
            v17 = v4;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
            v19 = v2;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, CFSTR("AssetID"), v18, CFSTR("Dataclass"), v20, CFSTR("ErrorCode"), 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v17;
            v22 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
            objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("FileError"), v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __34__ATLegacyAssetLink_cancelAssets___block_invoke_2;
            v26[3] = &unk_1E927E1C0;
            v26[4] = *(_QWORD *)(a1 + 40);
            v26[5] = v8;
            v24 = v22;
            v2 = v19;
            v5 = v25;
            v6 = 0x1E0CB3000;
            objc_msgSend(v24, "sendMessage:withCompletion:", v23, v26);

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v4);
  }

}

void __34__ATLegacyAssetLink_cancelAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ATLegacyAssetLink_cancelAssets___block_invoke_3;
  block[3] = &unk_1E927E198;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, block);

}

void __34__ATLegacyAssetLink_cancelAssets___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    _ATLogCategoryiTunesSync();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = a1[4];
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_ERROR, "failed to send asset cancelled message. err=%{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1[5] + 24), "close");
  }
  v5 = (void *)a1[5];
  v4 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_finishAsset:withError:", v4, v6);

}

void __41__ATLegacyAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 40) && *(_QWORD *)(v1 + 24))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          objc_msgSend(v8, "dataclass", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsObject:", v8);

          if ((v12 & 1) == 0)
          {
            if ((objc_msgSend(v8, "isDownload") & 1) == 0)
            {
              objc_msgSend(v8, "dataclass");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Application"));

              if ((v14 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "copyAssetToAirlock:", v8);

              }
            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v8);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 32), "_enqueueAndRequestAssets");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
}

void __26__ATLegacyAssetLink_close__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v3);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(_QWORD *)(v10 + 24) = 0;

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 64);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __26__ATLegacyAssetLink_close__block_invoke_2;
    v15[3] = &unk_1E927E148;
    v15[4] = v12;
    v16 = v2;
    v14 = v2;
    dispatch_async(v13, v15);

  }
}

void __26__ATLegacyAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "assetLink:didCloseWithOutstandingAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __25__ATLegacyAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    *(_BYTE *)(v1 + 40) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObserver:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v4 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __25__ATLegacyAssetLink_open__block_invoke_2;
    v14[3] = &unk_1E927E0F8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v3, "setHandlerForMessage:handler:", CFSTR("FileComplete"), v14);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __25__ATLegacyAssetLink_open__block_invoke_3;
    v12[3] = &unk_1E927E0F8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v5, "setHandlerForMessage:handler:", CFSTR("FileError"), v12);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __25__ATLegacyAssetLink_open__block_invoke_4;
    v10[3] = &unk_1E927E0F8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "setHandlerForMessage:handler:", CFSTR("FileProgress"), v10);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 64);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __25__ATLegacyAssetLink_open__block_invoke_5;
    block[3] = &unk_1E927E120;
    block[4] = v7;
    dispatch_async(v8, block);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __25__ATLegacyAssetLink_open__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleFileCompleteMessage:", v4);

}

void __25__ATLegacyAssetLink_open__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleFileErrorMessage:", v4);

}

void __25__ATLegacyAssetLink_open__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleFileProgressMessage:", v4);

}

void __25__ATLegacyAssetLink_open__block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "assetLink:didOpenWithPendingAssets:", *(_QWORD *)(a1 + 32), 0);

}

@end
