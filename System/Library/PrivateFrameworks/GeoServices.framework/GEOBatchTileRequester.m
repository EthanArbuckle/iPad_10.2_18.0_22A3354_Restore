@implementation GEOBatchTileRequester

- (GEOBatchTileRequester)init
{
  GEOBatchTileRequester *result;

  result = (GEOBatchTileRequester *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOBatchTileRequester)initWithCountryCode:(id)a3 region:(id)a4 auditToken:(id)a5 requestOptions:(unint64_t)a6 log:(id)a7 logPrefix:(id)a8 tileRequesterCreationBlock:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  GEOBatchTileRequester *v20;
  id v21;
  uint64_t v22;
  OS_dispatch_queue *isolationQueue;
  dispatch_group_t v24;
  OS_dispatch_group *preparationGroup;
  uint64_t global_queue;
  OS_dispatch_queue *delegateQueue;
  uint64_t v28;
  NSString *countryCode;
  uint64_t v30;
  NSString *regionCode;
  uint64_t v32;
  NSString *logPrefix;
  uint64_t v34;
  id tileRequesterCreationBlock;
  GEOBatchTileRequester *v36;
  objc_super v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v39.receiver = self;
  v39.super_class = (Class)GEOBatchTileRequester;
  v20 = -[GEOBatchTileRequester init](&v39, sel_init);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.GeoServices.%@"), objc_opt_class());
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v21, "UTF8String");
    geo_dispatch_queue_create_with_workloop_qos();
    v22 = objc_claimAutoreleasedReturnValue();
    isolationQueue = v20->_isolationQueue;
    v20->_isolationQueue = (OS_dispatch_queue *)v22;

    v24 = dispatch_group_create();
    preparationGroup = v20->_preparationGroup;
    v20->_preparationGroup = (OS_dispatch_group *)v24;

    global_queue = geo_get_global_queue();
    delegateQueue = v20->_delegateQueue;
    v20->_delegateQueue = (OS_dispatch_queue *)global_queue;

    v28 = objc_msgSend(v14, "copy");
    countryCode = v20->_countryCode;
    v20->_countryCode = (NSString *)v28;

    v30 = objc_msgSend(v15, "copy");
    regionCode = v20->_regionCode;
    v20->_regionCode = (NSString *)v30;

    objc_storeStrong((id *)&v20->_auditToken, a5);
    objc_storeStrong((id *)&v20->_log, a7);
    v32 = objc_msgSend(v18, "copy");
    logPrefix = v20->_logPrefix;
    v20->_logPrefix = (NSString *)v32;

    v34 = objc_msgSend(v19, "copy");
    tileRequesterCreationBlock = v20->_tileRequesterCreationBlock;
    v20->_tileRequesterCreationBlock = (id)v34;

    v20->_paused = 1;
    v20->_requestOptions = a6;
    v36 = v20;

  }
  return v20;
}

- (unsigned)reason
{
  return 0;
}

- (unint64_t)numberOfTilesConsidered
{
  return 0;
}

- (void)resume
{
  NSObject *preparationGroup;
  NSObject *isolationQueue;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  preparationGroup = self->_preparationGroup;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__GEOBatchTileRequester_resume__block_invoke;
  block[3] = &unk_1E1C01158;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_group_notify(preparationGroup, isolationQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__GEOBatchTileRequester_resume__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *((_BYTE *)WeakRetained + 73))
  {
    *((_BYTE *)WeakRetained + 73) = 0;
    v3 = WeakRetained;
    if (objc_msgSend(*((id *)WeakRetained + 12), "count"))
      objc_msgSend(v3, "_startRequesterForKeys:staleCachedETags:staleCachedData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
    else
      objc_msgSend(v3, "_requestNextBatch");
    WeakRetained = v3;
  }

}

- (void)pause
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__GEOBatchTileRequester_pause__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

void __30__GEOBatchTileRequester_pause__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(v2 + 24);
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "%{public}@ Pausing.", buf, 0xCu);
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 73) = 1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "cancel");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__GEOBatchTileRequester_cancel__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __31__GEOBatchTileRequester_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__GEOBatchTileRequester_cancel__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __31__GEOBatchTileRequester_cancel__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didFinishWithError:", v8);

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__GEOBatchTileRequester_cancel__block_invoke_3;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v9;
  dispatch_async(v10, block);
}

void __31__GEOBatchTileRequester_cancel__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "batchTileRequesterDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)_finish
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__GEOBatchTileRequester__finish__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __32__GEOBatchTileRequester__finish__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = v2[3];
    v6 = v2[15];
    v5 = v2[16];
    v7 = v2[14];
    *(_DWORD *)buf = 138544130;
    v12 = v4;
    v13 = 2048;
    v14 = v7;
    v15 = 2048;
    v16 = v5;
    v17 = 2048;
    v18 = v6;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "%{public}@ Finished. Successfully downloaded %llu tiles (%{bytes}llu), failed to download %llu tiles", buf, 0x2Au);
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "didFinishWithError:", v2[22]);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__GEOBatchTileRequester__finish__block_invoke_8;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v8;
  dispatch_async(v9, block);
}

void __32__GEOBatchTileRequester__finish__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "batchTileRequesterDidFinish:", *(_QWORD *)(a1 + 32));

}

- (uint64_t)cancelKey:(uint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = *(NSObject **)(a1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__GEOBatchTileRequester_cancelKey___block_invoke;
  block[3] = &unk_1E1C00A50;
  block[4] = a1;
  block[5] = &v9;
  block[6] = a3;
  dispatch_async_and_wait(v5, block);
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __35__GEOBatchTileRequester_cancelKey___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 96), "containsKey:", a1[6]);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    --*(_QWORD *)(a1[4] + 104);
    v2 = *(void **)(a1[4] + 88);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_BYTE *)a1[6] & 0x7F);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelKey:", a1[6]);

  }
}

- (void)_requestNextBatch
{
  OS_dispatch_queue *isolationQueue;
  _QWORD v4[5];
  id v5;
  id location;

  if (!self->_canceled)
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__GEOBatchTileRequester__requestNextBatch__block_invoke;
    v4[3] = &unk_1E1C22050;
    v4[4] = self;
    objc_copyWeak(&v5, &location);
    -[GEOBatchTileRequester determineNextBatchWithQueue:callback:](self, "determineNextBatchWithQueue:callback:", isolationQueue, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __42__GEOBatchTileRequester__requestNextBatch__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 72))
  {
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v11, "_startRequesterForKeys:staleCachedETags:staleCachedData:", v7, v8, v9);
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(NSObject **)(v12 + 16);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(v12 + 24);
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "%{public}@ No more tiles to request. Done.", (uint8_t *)&v15, 0xCu);
      }
      objc_msgSend(v11, "_finish");
    }
  }

}

- (void)_startRequesterForKeys:(id)a3 staleCachedETags:(id)a4 staleCachedData:(id)a5
{
  GEOTileKeyList *v8;
  GEOTileKeyList *v9;
  GEOTileKeyList *remainingKeysForActiveRequesters;
  GEOTileKeyMap *v11;
  GEOTileKeyMap *currentStaleETags;
  GEOTileKeyMap *v13;
  GEOTileKeyMap *currentStaleData;
  GEOTileKeyMap *v15;
  GEOTileKeyList *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  _BYTE *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  GEOTileKeyList *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  GEOBatchTileRequester *v36;
  NSMutableDictionary *activeRequesters;
  uint64_t v38;
  NSMutableDictionary *v39;
  uint64_t k;
  void *v41;
  void *v42;
  GEOTileKeyMap *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  uint64_t v49;
  void *v50;
  GEOTileRequest *v51;
  void *v52;
  void *v53;
  GEOApplicationAuditToken *auditToken;
  unint64_t requestOptions;
  GEOTileRequest *v56;
  void *v57;
  void *v58;
  NSObject *log;
  NSString *logPrefix;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  NSObject *v68;
  NSString *v69;
  GEOTileKeyList *v70;
  GEOApplicationAuditToken *v71;
  uint64_t v72;
  GEOTileKeyList *v73;
  uint64_t v74;
  GEOTileKeyMap *v75;
  GEOBatchTileRequester *v76;
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  void *v81;
  GEOTileKeyList *obj;
  int obja;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t v104[128];
  uint8_t buf[4];
  NSString *v106;
  __int16 v107;
  int v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v8 = (GEOTileKeyList *)a3;
  v78 = a4;
  v77 = a5;
  if (!self->_canceled)
  {
    if (self->_remainingKeysForActiveRequesters != v8)
    {
      v9 = (GEOTileKeyList *)-[GEOTileKeyList copy](v8, "copy");
      remainingKeysForActiveRequesters = self->_remainingKeysForActiveRequesters;
      self->_remainingKeysForActiveRequesters = v9;

      self->_numberOfTilesAttempted += -[GEOTileKeyList count](v8, "count");
      v11 = (GEOTileKeyMap *)objc_msgSend(v78, "copy");
      currentStaleETags = self->_currentStaleETags;
      self->_currentStaleETags = v11;

      v13 = (GEOTileKeyMap *)objc_msgSend(v77, "copy");
      currentStaleData = self->_currentStaleData;
      self->_currentStaleData = v13;

    }
    if (!self->_paused)
    {
      v76 = self;
      v15 = -[GEOTileKeyMap initWithMapType:capacity:]([GEOTileKeyMap alloc], "initWithMapType:capacity:", 0, -[GEOTileKeyList count](v8, "count"));
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v73 = v8;
      v16 = v8;
      v17 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v101;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v101 != v19)
              objc_enumerationMutation(v16);
            -[GEOTileKeyMap setObject:forKey:](v15, "setObject:forKey:", &unk_1E1E81F58, *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i));
          }
          v18 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
        }
        while (v18);
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      obj = v16;
      v22 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v97;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v97 != v24)
              objc_enumerationMutation(obj);
            v26 = *(_BYTE **)(*((_QWORD *)&v96 + 1) + 8 * j);
            v27 = *v26 & 0x7F;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v29)
            {
              v30 = objc_alloc_init(GEOTileKeyList);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v27);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, v31);

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addKey:", v26);

          }
          v23 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
        }
        while (v23);
      }

      GEOMachAbsoluteTimeGetCurrent();
      v35 = v34;
      v36 = v76;
      activeRequesters = v76->_activeRequesters;
      if (!activeRequesters)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v76->_activeRequesters;
        v76->_activeRequesters = (NSMutableDictionary *)v38;

        activeRequesters = v76->_activeRequesters;
      }
      -[NSMutableDictionary removeAllObjects](activeRequesters, "removeAllObjects");
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v80 = v21;
      v75 = v15;
      v79 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
      if (v79)
      {
        v74 = *(_QWORD *)v93;
        do
        {
          for (k = 0; k != v79; ++k)
          {
            if (*(_QWORD *)v93 != v74)
              objc_enumerationMutation(v80);
            v41 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * k);
            obja = objc_msgSend(v41, "unsignedIntValue");
            v81 = v41;
            objc_msgSend(v80, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = -[GEOTileKeyMap initWithMapType:capacity:]([GEOTileKeyMap alloc], "initWithMapType:capacity:", 0, objc_msgSend(v42, "count"));
            v88 = 0u;
            v89 = 0u;
            v90 = 0u;
            v91 = 0u;
            v44 = v42;
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
            if (v45)
            {
              v46 = v45;
              v47 = *(_QWORD *)v89;
              do
              {
                for (m = 0; m != v46; ++m)
                {
                  if (*(_QWORD *)v89 != v47)
                    objc_enumerationMutation(v44);
                  v49 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * m);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GEOTileKeyMap setObject:forKey:](v43, "setObject:forKey:", v50, v49);

                }
                v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
              }
              while (v46);
            }

            v51 = [GEOTileRequest alloc];
            +[GEOResourceManifestConfiguration defaultConfiguration](GEOResourceManifestConfiguration, "defaultConfiguration");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v76;
            auditToken = v76->_auditToken;
            requestOptions = v76->_requestOptions;
            BYTE1(v72) = -[GEOBatchTileRequester reason](v76, "reason");
            LOBYTE(v72) = 1;
            v71 = auditToken;
            v15 = v75;
            v56 = -[GEOTileRequest initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:](v51, "initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:", v44, v52, v53, v78, v77, v75, 0, v43, 0, v71, requestOptions, 0, v72);

            (*((void (**)(void))v76->_tileRequesterCreationBlock + 2))();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v57;
            if (v57)
            {
              objc_msgSend(v57, "setDeviceCountry:", v76->_countryCode);
              objc_msgSend(v58, "setDeviceRegion:", v76->_regionCode);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v76->_activeRequesters, "setObject:forKeyedSubscript:", v58, v81);
            }
            else
            {
              log = v76->_log;
              if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
              {
                logPrefix = v76->_logPrefix;
                *(_DWORD *)buf = 138543618;
                v106 = logPrefix;
                v107 = 1024;
                v108 = obja;
                _os_log_impl(&dword_1885A9000, log, OS_LOG_TYPE_INFO, "%{public}@ No matching requester for provider ID %d. Not fetching tiles of that type", buf, 0x12u);
              }
            }

          }
          v79 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
        }
        while (v79);
      }

      if (-[NSMutableDictionary count](v36->_activeRequesters, "count"))
      {
        v61 = (void *)-[NSMutableDictionary copy](v36->_activeRequesters, "copy");
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v62 = v61;
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v85;
          do
          {
            for (n = 0; n != v64; ++n)
            {
              if (*(_QWORD *)v85 != v65)
                objc_enumerationMutation(v62);
              objc_msgSend(v62, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * n));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "start");

            }
            v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
          }
          while (v64);
        }

        v8 = v73;
        v15 = v75;
      }
      else
      {
        v68 = v36->_log;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          v69 = v36->_logPrefix;
          *(_DWORD *)buf = 138543362;
          v106 = v69;
          _os_log_impl(&dword_1885A9000, v68, OS_LOG_TYPE_INFO, "%{public}@ Zero keys in batch matched to valid requester classes. Moving on to next batch", buf, 0xCu);
        }
        v70 = v36->_remainingKeysForActiveRequesters;
        v36->_remainingKeysForActiveRequesters = 0;

        -[GEOBatchTileRequester _requestNextBatch](v36, "_requestNextBatch");
        v8 = v73;
      }

    }
  }

}

- (void)tileRequester:(uint64_t)a3 receivedData:(void *)a4 tileEdition:(int)a5 tileSetDB:(int)a6 tileSet:(uint64_t)a7 etag:(void *)a8 forKey:(__int128)a9 userInfo:(void *)a10
{
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  int v30;
  int v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v33 = a9;
  v14 = a4;
  v15 = a8;
  v16 = a10;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CachedDataWasCurrent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    ++*(_QWORD *)(a1 + 112);
    goto LABEL_5;
  }
  v18 = objc_msgSend(v17, "BOOLValue");

  ++*(_QWORD *)(a1 + 112);
  if ((v18 & 1) == 0)
  {
LABEL_5:
    v19 = objc_msgSend(v14, "length");
    goto LABEL_6;
  }
  v19 = 0;
LABEL_6:
  *(_QWORD *)(a1 + 128) += v19;
  objc_msgSend(*(id *)(a1 + 96), "removeKey:", &v33);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("GEOTileLoadResultHTTPStatusCode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntValue");

  objc_msgSend((id)a1, "downloadDidSucceedForTile:downloadSize:httpStatus:", &v33, objc_msgSend(v14, "length"), v21);
  v22 = *(NSObject **)(a1 + 48);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __103__GEOBatchTileRequester_tileRequester_receivedData_tileEdition_tileSetDB_tileSet_etag_forKey_userInfo___block_invoke;
  v26[3] = &unk_1E1C22078;
  v26[4] = a1;
  v27 = v14;
  v30 = a5;
  v31 = a6;
  v32 = v33;
  v28 = v15;
  v29 = v16;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  dispatch_async(v22, v26);

}

void __103__GEOBatchTileRequester_tileRequester_receivedData_tileEdition_tileSetDB_tileSet_etag_forKey_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "batchTileRequester:receivedData:tileEdition:tileSet:etag:forKey:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));

}

- (void)tileRequester:(uint64_t)a3 receivedError:(void *)a4 forKey:(uint64_t)a5
{
  id v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v13 = a5;
  *((_QWORD *)&v13 + 1) = a6;
  v8 = a4;
  if (!*(_BYTE *)(a1 + 73))
  {
    objc_msgSend((id)a1, "downloadDidFailForTile:error:", &v13, v8);
    if (!*(_QWORD *)(a1 + 176))
      objc_storeStrong((id *)(a1 + 176), a4);
    ++*(_QWORD *)(a1 + 120);
    objc_msgSend(*(id *)(a1 + 96), "removeKey:", &v13);
    v9 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__GEOBatchTileRequester_tileRequester_receivedError_forKey___block_invoke;
    block[3] = &unk_1E1BFFCE0;
    block[4] = a1;
    v12 = v13;
    v11 = v8;
    dispatch_async(v9, block);

  }
}

void __60__GEOBatchTileRequester_tileRequester_receivedError_forKey___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  objc_msgSend(WeakRetained, "batchTileRequester:failedToLoadKey:error:", a1[4], a1[6], a1[7], a1[5]);

}

- (void)tileRequesterFinished:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  GEOTileKeyList *remainingKeysForActiveRequesters;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_paused)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_activeRequesters;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_activeRequesters, "objectForKeyedSubscript:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v12 = v10;

      if (!v12)
        goto LABEL_11;
      -[NSMutableDictionary removeObjectForKey:](self->_activeRequesters, "removeObjectForKey:", v12);
      if (!-[NSMutableDictionary count](self->_activeRequesters, "count"))
      {
        remainingKeysForActiveRequesters = self->_remainingKeysForActiveRequesters;
        self->_remainingKeysForActiveRequesters = 0;

        -[GEOBatchTileRequester _requestNextBatch](self, "_requestNextBatch");
      }
    }
    else
    {
LABEL_10:

LABEL_11:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: providerIDNumberToRemove != ((void *)0)", v14, 2u);
      }
      v12 = 0;
    }

  }
}

- (unint64_t)numberOfTilesAttempted
{
  return self->_numberOfTilesAttempted;
}

- (unint64_t)successfulTiles
{
  return self->_successfulTiles;
}

- (unint64_t)failedTiles
{
  return self->_failedTiles;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (GEOBatchTileRequesterDelegate)delegate
{
  return (GEOBatchTileRequesterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)region
{
  return self->_regionCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_currentStaleData, 0);
  objc_storeStrong((id *)&self->_currentStaleETags, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong(&self->_tileRequesterCreationBlock, 0);
  objc_storeStrong((id *)&self->_remainingKeysForActiveRequesters, 0);
  objc_storeStrong((id *)&self->_activeRequesters, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__GEOBatchTileRequester_SubclassOverrides__determineNextBatchWithQueue_callback___block_invoke;
  block[3] = &unk_1E1C01F48;
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)a3, block);

}

uint64_t __81__GEOBatchTileRequester_SubclassOverrides__determineNextBatchWithQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
