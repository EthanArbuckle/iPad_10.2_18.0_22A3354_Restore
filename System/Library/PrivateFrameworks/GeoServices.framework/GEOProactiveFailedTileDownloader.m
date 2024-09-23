@implementation GEOProactiveFailedTileDownloader

- (unsigned)reason
{
  return 5;
}

- (GEOProactiveFailedTileDownloader)initWithDiskCache:(id)a3 tileRequesterCreationBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOProactiveFailedTileDownloader *v13;
  GEOProactiveFailedTileDownloader *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "devicePostureCountry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "devicePostureRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetProactiveTileDownloadLog();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)GEOProactiveFailedTileDownloader;
  v13 = -[GEOBatchTileRequester initWithCountryCode:region:auditToken:requestOptions:log:logPrefix:tileRequesterCreationBlock:](&v16, sel_initWithCountryCode_region_auditToken_requestOptions_log_logPrefix_tileRequesterCreationBlock_, v9, v10, v11, 96, v12, CFSTR("[PreviouslyFailed]"), v8);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_diskCache, a3);
    v13->_batchSize = +[GEOProactiveTileDownloader maximumDownloadBatchSize](GEOProactiveTileDownloader, "maximumDownloadBatchSize");
    -[GEOProactiveFailedTileDownloader _determineKeysToUpdate](v13, "_determineKeysToUpdate");
    v14 = v13;
  }

  return v13;
}

- (void)_determineKeysToUpdate
{
  double Current;
  double v4;
  GEOTileDB *diskCache;
  uint64_t UInteger;
  OS_dispatch_queue *isolationQueue;
  _QWORD v8[5];

  Current = CFAbsoluteTimeGetCurrent();
  v4 = Current - GEOConfigGetDouble(GeoServicesConfig_CellSaverStaleThresholdInSeconds, (uint64_t)off_1EDF4D588);
  dispatch_group_enter((dispatch_group_t)self->super._preparationGroup);
  diskCache = self->_diskCache;
  UInteger = GEOConfigGetUInteger(GeoServicesConfig_CellSaverMaxStaleTilesToUpdate, (uint64_t)off_1EDF4D598);
  isolationQueue = self->super._isolationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__GEOProactiveFailedTileDownloader__determineKeysToUpdate__block_invoke;
  v8[3] = &unk_1E1C126A0;
  v8[4] = self;
  -[GEOTileDB getFailedTileKeysForProactiveLoadSince:maxCount:queue:callback:](diskCache, "getFailedTileKeysForProactiveLoadSince:maxCount:queue:callback:", UInteger, isolationQueue, v8, v4);
}

void __58__GEOProactiveFailedTileDownloader__determineKeysToUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), a2);
  v4 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = objc_msgSend(v4, "count");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));

}

- (uint64_t)cancelKey:(uint64_t)a3
{
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  objc_super v9;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  dispatch_group_wait(a1[4], 0xFFFFFFFFFFFFFFFFLL);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = a1[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__GEOProactiveFailedTileDownloader_cancelKey___block_invoke;
  block[3] = &unk_1E1C00A50;
  block[4] = a1;
  block[5] = &v11;
  block[6] = a3;
  dispatch_async_and_wait(v5, block);
  v9.receiver = a1;
  v9.super_class = (Class)GEOProactiveFailedTileDownloader;
  v6 = -[GEOBatchTileRequester cancelKey:](&v9, sel_cancelKey_, a3);
  if (*((_BYTE *)v12 + 24))
    v7 = 1;
  else
    v7 = v6;
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __46__GEOProactiveFailedTileDownloader_cancelKey___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 192), "containsKey:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    return objc_msgSend(*(id *)(a1[4] + 192), "removeKey:", a1[6]);
  return result;
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
  v16[2] = __73__GEOProactiveFailedTileDownloader_determineNextBatchWithQueue_callback___block_invoke;
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
  -[GEOProactiveFailedTileDownloader _addMoreKeysToListIfNeeded:completionHandler:](self, "_addMoreKeysToListIfNeeded:completionHandler:", v13, v16);

}

void __73__GEOProactiveFailedTileDownloader_determineNextBatchWithQueue_callback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__GEOProactiveFailedTileDownloader_determineNextBatchWithQueue_callback___block_invoke_2;
  v3[3] = &unk_1E1C126C8;
  v7 = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async(v2, v3);

}

uint64_t __73__GEOProactiveFailedTileDownloader_determineNextBatchWithQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_addMoreKeysToListIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  GEOTileKeyList *v8;
  unint64_t v9;
  _GEOTileKey *v10;
  NSObject *v11;
  GEOTileDB *diskCache;
  uint64_t v13;
  OS_dispatch_queue *isolationQueue;
  id v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  void (**v19)(_QWORD);
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count") < self->_batchSize && -[GEOTileKeyList count](self->_keysRemaining, "count"))
  {
    v8 = objc_alloc_init(GEOTileKeyList);
    if (self->_batchSize)
    {
      v9 = 0;
      do
      {
        if (!-[GEOTileKeyList count](self->_keysRemaining, "count"))
          break;
        v10 = -[GEOTileKeyList firstKey](self->_keysRemaining, "firstKey");
        -[GEOTileKeyList addKey:](v8, "addKey:", v10);
        -[GEOTileKeyList removeKey:](self->_keysRemaining, "removeKey:", v10);
        ++v9;
      }
      while (v9 < self->_batchSize);
    }
    v11 = dispatch_group_create();
    diskCache = self->_diskCache;
    v13 = MEMORY[0x1E0C809B0];
    isolationQueue = self->super._isolationQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __81__GEOProactiveFailedTileDownloader__addMoreKeysToListIfNeeded_completionHandler___block_invoke;
    v20[3] = &unk_1E1C126F0;
    v20[4] = self;
    v15 = v6;
    v21 = v15;
    -[GEOTileDB dataForKeys:reason:group:callbackQueue:dataHandler:](diskCache, "dataForKeys:reason:group:callbackQueue:dataHandler:", v8, 5, v11, isolationQueue, v20);
    v16 = self->super._isolationQueue;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __81__GEOProactiveFailedTileDownloader__addMoreKeysToListIfNeeded_completionHandler___block_invoke_2;
    block[3] = &unk_1E1BFFC90;
    block[4] = self;
    v18 = v15;
    v19 = v7;
    dispatch_group_notify(v11, v16, block);

  }
  else
  {
    v7[2](v7);
  }

}

uint64_t __81__GEOProactiveFailedTileDownloader__addMoreKeysToListIfNeeded_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
    objc_msgSend(*(id *)(a1 + 40), "addKey:", a2);
  return 1;
}

uint64_t __81__GEOProactiveFailedTileDownloader__addMoreKeysToListIfNeeded_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addMoreKeysToListIfNeeded:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysRemaining, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end
