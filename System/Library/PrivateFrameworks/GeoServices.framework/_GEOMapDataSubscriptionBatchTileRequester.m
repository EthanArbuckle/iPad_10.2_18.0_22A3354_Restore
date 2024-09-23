@implementation _GEOMapDataSubscriptionBatchTileRequester

- (_GEOMapDataSubscriptionBatchTileRequester)init
{
  _GEOMapDataSubscriptionBatchTileRequester *result;

  result = (_GEOMapDataSubscriptionBatchTileRequester *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEOMapDataSubscriptionBatchTileRequester)initWithSubscription:(id)a3 diskCache:(id)a4 reason:(unsigned __int8)a5 auditToken:(id)a6 requestOptions:(unint64_t)a7 manifestManager:(id)a8 log:(id)a9 logPrefix:(id)a10 tileRequesterCreationBlock:(id)a11
{
  id v16;
  id v17;
  id v18;
  GEOApplicationAuditToken *v19;
  GEOApplicationAuditToken *v20;
  void *v21;
  uint64_t v22;
  GEOApplicationAuditToken *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _GEOMapDataSubscriptionBatchTileRequester *v28;
  void *v29;
  void *v30;
  void *v31;
  GEOResourceManifestManager *manifestManager;
  char v33;
  _GEOMapDataSubscriptionBatchTileRequester *v34;
  NSDictionary *v35;
  id v36;
  uint64_t v37;
  GEOTileKeyEnumerator *tileKeysToLoad;
  uint64_t v39;
  NSProgress *progress;
  NSDictionary *dataTypeToDBTileSets;
  NSDictionary *v42;
  _GEOMapDataSubscriptionBatchTileRequester *v43;
  id v45;
  id v46;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  _GEOMapDataSubscriptionBatchTileRequester *v54;
  id v55;
  NSDictionary *v56;
  objc_super v57;

  v49 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v52 = a9;
  v51 = a10;
  v50 = a11;
  v19 = (GEOApplicationAuditToken *)v17;
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(v49, "_originatingBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22)
    {
      v23 = [GEOApplicationAuditToken alloc];
      objc_msgSend(v49, "_originatingBundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[GEOApplicationAuditToken initWithProxiedApplicationBundleId:](v23, "initWithProxiedApplicationBundleId:", v24);

    }
    else
    {
      v20 = 0;
    }
  }
  objc_msgSend(v16, "devicePostureCountry");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "devicePostureRegion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v20;
  if (!v20)
  {
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57.receiver = self;
  v57.super_class = (Class)_GEOMapDataSubscriptionBatchTileRequester;
  v28 = -[GEOBatchTileRequester initWithCountryCode:region:auditToken:requestOptions:log:logPrefix:tileRequesterCreationBlock:](&v57, sel_initWithCountryCode_region_auditToken_requestOptions_log_logPrefix_tileRequesterCreationBlock_, v25, v26, v27, a7, v52, v51, v50);
  if (!v20)

  if (v28)
  {
    objc_storeStrong((id *)&v28->_diskCache, a4);
    v29 = v18;
    if (!v18)
    {
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = v16;
    objc_storeStrong((id *)&v28->_manifestManager, v29);
    v45 = v18;
    if (!v18)

    v28->_batchSize = GEOConfigGetUInteger(GeoServicesConfig_CellSaverBatchSize, (uint64_t)off_1EDF4D4B8);
    objc_storeStrong((id *)&v28->_subscription, a3);
    v28->_reason = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    manifestManager = v28->_manifestManager;
    v33 = -[GEOMapDataSubscription dataTypes](v28->_subscription, "dataTypes");
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __166___GEOMapDataSubscriptionBatchTileRequester_initWithSubscription_diskCache_reason_auditToken_requestOptions_manifestManager_log_logPrefix_tileRequesterCreationBlock___block_invoke;
    v53[3] = &unk_1E1C14008;
    v34 = v28;
    v54 = v34;
    v55 = v30;
    v35 = v31;
    v56 = v35;
    v36 = v30;
    _GEOEnumerateTileSetsForSubscriptionDataTypes(manifestManager, v33, v53);
    GEOTileKeyEnumeratorContainingEnumerators(v36);
    v37 = objc_claimAutoreleasedReturnValue();
    tileKeysToLoad = v34->_tileKeysToLoad;
    v34->_tileKeysToLoad = (GEOTileKeyEnumerator *)v37;

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -[GEOTileKeyEnumerator count](v34->_tileKeysToLoad, "count"));
    v39 = objc_claimAutoreleasedReturnValue();
    progress = v34->_progress;
    v34->_progress = (NSProgress *)v39;

    dataTypeToDBTileSets = v34->_dataTypeToDBTileSets;
    v34->_dataTypeToDBTileSets = v35;
    v42 = v35;

    v43 = v34;
    v18 = v45;
    v16 = v46;
  }

  return v28;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unint64_t)numberOfTilesConsidered
{
  return self->_numberOfTilesOriginallyConsidered;
}

- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  GEOTileKeyList *v8;
  GEOTileKeyMap *v9;
  GEOTileKeyMap *v10;
  GEOTileKeyMap *v11;
  GEOTileKeyMap *v12;
  GEOTileKeyList *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GEOTileKeyList *v18;
  GEOTileKeyMap *v19;
  GEOTileKeyMap *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(GEOTileKeyList);
  v9 = -[GEOTileKeyMap initWithMapType:]([GEOTileKeyMap alloc], "initWithMapType:", 0);
  v10 = -[GEOTileKeyMap initWithMapType:]([GEOTileKeyMap alloc], "initWithMapType:", 0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82___GEOMapDataSubscriptionBatchTileRequester_determineNextBatchWithQueue_callback___block_invoke;
  v16[3] = &unk_1E1C06558;
  v20 = v10;
  v21 = v7;
  v17 = v6;
  v18 = v8;
  v19 = v9;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  v15 = v6;
  -[_GEOMapDataSubscriptionBatchTileRequester _addMoreKeysToListIfNeeded:cachedETags:cachedData:completionHandler:](self, "_addMoreKeysToListIfNeeded:cachedETags:cachedData:completionHandler:", v13, v12, v11, v16);

}

- (void)_addMoreKeysToListIfNeeded:(id)a3 cachedETags:(id)a4 cachedData:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  unint64_t v14;
  unint64_t batchSize;
  unint64_t v16;
  GEOTileKeyList *v17;
  GEOTileKeyEnumerator *tileKeysToLoad;
  GEOTileKeyList *v19;
  char v20;
  NSObject *v21;
  GEOTileDB *diskCache;
  id v23;
  id v24;
  id v25;
  OS_dispatch_queue *v26;
  NSObject *v27;
  OS_dispatch_queue *isolationQueue;
  id v29;
  void *v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  void (**v35)(_QWORD);
  char v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  uint8_t buf[8];
  _QWORD v42[4];
  GEOTileKeyList *v43;
  unint64_t v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  v14 = objc_msgSend(v10, "count");
  batchSize = self->_batchSize;
  if (v14 >= batchSize)
  {
    v13[2](v13);
  }
  else
  {
    v16 = batchSize - objc_msgSend(v10, "count");
    v17 = objc_alloc_init(GEOTileKeyList);
    tileKeysToLoad = self->_tileKeysToLoad;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke;
    v42[3] = &unk_1E1C14030;
    v19 = v17;
    v43 = v19;
    v44 = v16;
    v20 = -[GEOTileKeyEnumerator continueEnumeratingTileKeysWithBlock:](tileKeysToLoad, "continueEnumeratingTileKeysWithBlock:", v42);
    if (-[GEOTileKeyList count](v19, "count"))
    {
      self->_numberOfTilesOriginallyConsidered += -[GEOTileKeyList count](v19, "count");
      v21 = dispatch_group_create();
      v30 = v11;
      diskCache = self->_diskCache;
      isolationQueue = self->super._isolationQueue;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke_26;
      v37[3] = &unk_1E1C14058;
      v37[4] = self;
      v23 = v30;
      v38 = v23;
      v29 = v12;
      v24 = v12;
      v39 = v24;
      v25 = v10;
      v40 = v25;
      -[GEOTileDB dataForKeys:reason:group:callbackQueue:dataHandler:](diskCache, "dataForKeys:reason:group:callbackQueue:dataHandler:", v19, 5, v21, isolationQueue, v37);
      v26 = self->super._isolationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke_2;
      block[3] = &unk_1E1C06C08;
      v36 = v20;
      v35 = v13;
      block[4] = self;
      v32 = v25;
      v33 = v23;
      v34 = v24;
      v27 = v26;
      v12 = v29;
      v11 = v30;
      dispatch_group_notify(v21, v27, block);

    }
    else
    {
      if ((v20 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: finished", buf, 2u);
      }
      v13[2](v13);
    }

  }
}

- (uint64_t)downloadDidSucceedForTile:(uint64_t)a1 downloadSize:httpStatus:
{
  return objc_msgSend(*(id *)(a1 + 248), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 248), "completedUnitCount") + 1);
}

- (void)didFinishWithError:(id)a3
{
  id v4;
  NSObject *log;
  NSString *logPrefix;
  GEOMapDataSubscription *subscription;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEOTileDB *diskCache;
  void *v20;
  id v21;
  NSDictionary *obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  NSString *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v21 = 0;
    log = self->super._log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      logPrefix = self->super._logPrefix;
      subscription = self->_subscription;
      v8 = log;
      -[GEOMapDataSubscription identifier](subscription, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v37 = logPrefix;
      v38 = 2160;
      v39 = 1752392040;
      v40 = 2113;
      v41 = v9;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "%{public}@ Marking subscription '%{private, mask.hash}@' as fully-loaded", buf, 0x20u);

    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = self->_dataTypeToDBTileSets;
    v24 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v24)
    {
      v23 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(obj);
          v25 = v10;
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
          v12 = objc_msgSend(v11, "unsignedIntegerValue", v21);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          -[NSDictionary objectForKeyedSubscript:](self->_dataTypeToDBTileSets, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                v18 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "unsignedIntValue");
                diskCache = self->_diskCache;
                -[GEOMapDataSubscription identifier](self->_subscription, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[GEOTileDB setSubscriptionWithIdentifier:isFullyLoaded:forDataType:dataSubtype:version:](diskCache, "setSubscriptionWithIdentifier:isFullyLoaded:forDataType:dataSubtype:version:", v20, 1, v12, v18, 1);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v15);
          }

          v10 = v25 + 1;
        }
        while (v25 + 1 != v24);
        v24 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v24);
    }

    v4 = v21;
  }

}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_tileKeysToLoad, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_dataTypeToDBTileSets, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end
