@implementation GEOStaleTileUpdater

- (unsigned)reason
{
  return 5;
}

- (GEOStaleTileUpdater)initWithDiskCache:(id)a3 manifestManager:(id)a4 tileRequesterCreationBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GEOStaleTileUpdater *v16;
  void *v17;
  GEOStaleTileUpdater *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "devicePostureCountry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "devicePostureRegion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetProactiveTileDownloadLog();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)GEOStaleTileUpdater;
  v16 = -[GEOBatchTileRequester initWithCountryCode:region:auditToken:requestOptions:log:logPrefix:tileRequesterCreationBlock:](&v20, sel_initWithCountryCode_region_auditToken_requestOptions_log_logPrefix_tileRequesterCreationBlock_, v12, v13, v14, 96, v15, CFSTR("[StaleTileUpdate]"), v11);

  if (v16)
  {
    v17 = v10;
    if (!v10)
    {
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v16->_manifestManager, v17);
    if (!v10)

    objc_storeStrong((id *)&v16->_diskCache, a3);
    v16->_batchSize = +[GEOProactiveTileDownloader maximumDownloadBatchSize](GEOProactiveTileDownloader, "maximumDownloadBatchSize");
    -[GEOStaleTileUpdater _determineStaleKeysToUpdate](v16, "_determineStaleKeysToUpdate");
    v18 = v16;
  }

  return v16;
}

- (void)_determineStaleKeysToUpdate
{
  double Current;
  double Double;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  GEOTileDB *diskCache;
  uint64_t UInteger;
  uint64_t v20;
  OS_dispatch_queue *isolationQueue;
  GEOStaleTileUpdater *v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  Double = GEOConfigGetDouble(GeoServicesConfig_CellSaverStaleThresholdInSeconds, (uint64_t)off_1EDF4D588);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = self;
  -[GEOResourceManifestManager activeTileGroup](self->_manifestManager, "activeTileGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tileSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (+[GEOProactiveTileDownloader shouldDownloadTileType:](GEOProactiveTileDownloader, "shouldDownloadTileType:", objc_msgSend(v12, "style")))
        {
          GEOGetProactiveTileDownloadLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v14 = objc_msgSend(v12, "style");
            *(_DWORD *)buf = 134217984;
            v29 = v14;
            _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "[StaleTileUpdate] Will attempt to download tiles for tileset: %{geo:TileSetStyle}llu", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ((objc_msgSend(v12, "style") & 0x3FFF | ((objc_msgSend(v12, "size") & 0xF) << 14) & 0xFFC3FFFF | ((objc_msgSend(v12, "scale") & 0xF) << 18)) << 8) | 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v9);
  }

  GEOGetProactiveTileDownloadLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v29 = v17;
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_INFO, "[StaleTileUpdate] Will schedule tile downloads for %llu tilesets", buf, 0xCu);
  }

  dispatch_group_enter((dispatch_group_t)v22->super._preparationGroup);
  diskCache = v22->_diskCache;
  UInteger = GEOConfigGetUInteger(GeoServicesConfig_CellSaverMaxStaleTilesToUpdate, (uint64_t)off_1EDF4D598);
  v20 = GEOConfigGetUInteger(GeoServicesConfig_CellSaverMaxSizeOfTilesToUpdate, (uint64_t)off_1EDF4D5A8);
  isolationQueue = v22->super._isolationQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__GEOStaleTileUpdater__determineStaleKeysToUpdate__block_invoke;
  v23[3] = &unk_1E1C126A0;
  v23[4] = v22;
  -[GEOTileDB getStaleTileKeysUsedSince:fromTileSets:maxCount:maxTotalSize:queue:callback:](diskCache, "getStaleTileKeysUsedSince:fromTileSets:maxCount:maxTotalSize:queue:callback:", v5, UInteger, v20, isolationQueue, v23, Current - Double);

}

void __50__GEOStaleTileUpdater__determineStaleKeysToUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 200), a2);
  v4 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(v4, "count");
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
  block[2] = __33__GEOStaleTileUpdater_cancelKey___block_invoke;
  block[3] = &unk_1E1C00A50;
  block[4] = a1;
  block[5] = &v11;
  block[6] = a3;
  dispatch_async_and_wait(v5, block);
  v9.receiver = a1;
  v9.super_class = (Class)GEOStaleTileUpdater;
  v6 = -[GEOBatchTileRequester cancelKey:](&v9, sel_cancelKey_, a3);
  if (*((_BYTE *)v12 + 24))
    v7 = 1;
  else
    v7 = v6;
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __33__GEOStaleTileUpdater_cancelKey___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 200), "containsKey:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    return objc_msgSend(*(id *)(a1[4] + 200), "removeKey:", a1[6]);
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
  v16[2] = __60__GEOStaleTileUpdater_determineNextBatchWithQueue_callback___block_invoke;
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
  -[GEOStaleTileUpdater _addMoreKeysToListIfNeeded:staleCachedETags:staleCachedData:completionHandler:](self, "_addMoreKeysToListIfNeeded:staleCachedETags:staleCachedData:completionHandler:", v13, v12, v11, v16);

}

void __60__GEOStaleTileUpdater_determineNextBatchWithQueue_callback___block_invoke(uint64_t a1)
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
  v3[2] = __60__GEOStaleTileUpdater_determineNextBatchWithQueue_callback___block_invoke_2;
  v3[3] = &unk_1E1C126C8;
  v7 = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async(v2, v3);

}

uint64_t __60__GEOStaleTileUpdater_determineNextBatchWithQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_addMoreKeysToListIfNeeded:(id)a3 staleCachedETags:(id)a4 staleCachedData:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  GEOTileKeyList *v14;
  unint64_t batchSize;
  unint64_t v16;
  GEOTileKeyList *v17;
  unint64_t v18;
  _GEOTileKey *v19;
  dispatch_group_t v20;
  GEOTileDB *diskCache;
  id v22;
  id v23;
  id v24;
  GEOTileDB *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  OS_dispatch_queue *isolationQueue;
  id v31;
  void *v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  void (**v37)(_QWORD);
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  if (objc_msgSend(v10, "count") < self->_batchSize && -[GEOTileKeyList count](self->_keysRemaining, "count"))
  {
    v32 = v12;
    v14 = [GEOTileKeyList alloc];
    batchSize = self->_batchSize;
    if (batchSize >= -[GEOTileKeyList count](self->_keysRemaining, "count"))
      v16 = -[GEOTileKeyList count](self->_keysRemaining, "count");
    else
      v16 = self->_batchSize;
    v17 = -[GEOTileKeyList initWithCapacity:](v14, "initWithCapacity:", v16);
    if (self->_batchSize)
    {
      v18 = 0;
      do
      {
        if (!-[GEOTileKeyList count](self->_keysRemaining, "count"))
          break;
        v19 = -[GEOTileKeyList firstKey](self->_keysRemaining, "firstKey");
        -[GEOTileKeyList addKey:](v17, "addKey:", v19);
        -[GEOTileKeyList removeKey:](self->_keysRemaining, "removeKey:", v19);
        ++v18;
      }
      while (v18 < self->_batchSize);
    }
    v20 = dispatch_group_create();
    diskCache = self->_diskCache;
    isolationQueue = self->super._isolationQueue;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __101__GEOStaleTileUpdater__addMoreKeysToListIfNeeded_staleCachedETags_staleCachedData_completionHandler___block_invoke;
    v38[3] = &unk_1E1C14058;
    v38[4] = self;
    v31 = v11;
    v22 = v11;
    v39 = v22;
    v23 = v32;
    v40 = v23;
    v24 = v10;
    v41 = v24;
    v25 = diskCache;
    v26 = v20;
    -[GEOTileDB dataForKeys:reason:group:callbackQueue:dataHandler:](v25, "dataForKeys:reason:group:callbackQueue:dataHandler:", v17, 5, v20, isolationQueue, v38);
    v27 = self->super._isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__GEOStaleTileUpdater__addMoreKeysToListIfNeeded_staleCachedETags_staleCachedData_completionHandler___block_invoke_2;
    block[3] = &unk_1E1C20940;
    block[4] = self;
    v34 = v24;
    v28 = v22;
    v11 = v31;
    v35 = v28;
    v29 = v23;
    v12 = v32;
    v36 = v29;
    v37 = v13;
    dispatch_group_notify(v26, v27, block);

  }
  else
  {
    v13[2](v13);
  }

}

uint64_t __101__GEOStaleTileUpdater__addMoreKeysToListIfNeeded_staleCachedETags_staleCachedData_completionHandler___block_invoke(id *a1, uint64_t a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  void *v11;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
LABEL_5:
    objc_msgSend(a1[7], "addKey:", a2);
    goto LABEL_6;
  }
  if ((a4 & 1) == 0)
  {
    if (v10)
    {
      objc_msgSend(a1[5], "setObject:forKey:", v10, a2);
      objc_msgSend(a1[6], "setObject:forKey:", v9, a2);
    }
    goto LABEL_5;
  }
LABEL_6:

  return 1;
}

uint64_t __101__GEOStaleTileUpdater__addMoreKeysToListIfNeeded_staleCachedETags_staleCachedData_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addMoreKeysToListIfNeeded:staleCachedETags:staleCachedData:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysRemaining, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end
