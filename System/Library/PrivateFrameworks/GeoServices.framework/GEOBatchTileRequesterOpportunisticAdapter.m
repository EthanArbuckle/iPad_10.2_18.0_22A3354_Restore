@implementation GEOBatchTileRequesterOpportunisticAdapter

+ (unint64_t)policy
{
  return 3;
}

- (GEOBatchTileRequesterOpportunisticAdapter)init
{
  GEOBatchTileRequesterOpportunisticAdapter *result;

  result = (GEOBatchTileRequesterOpportunisticAdapter *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOBatchTileRequesterOpportunisticAdapter)initWithSessionIdentifier:(id)a3 batchTileRequester:(id)a4 manifestManager:(id)a5 diskCache:(id)a6 requestCounter:(id)a7 requestCounterPolicy:(unsigned __int8)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  GEOBatchTileRequesterOpportunisticAdapter *v19;
  uint64_t v20;
  NSString *sessionIdentifier;
  GEOResourceManifestManager *v22;
  GEOResourceManifestManager *manifestManager;
  GEOBatchTileRequesterOpportunisticAdapter *v24;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)GEOBatchTileRequesterOpportunisticAdapter;
  v19 = -[GEOBatchTileRequesterOpportunisticAdapter init](&v26, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    sessionIdentifier = v19->_sessionIdentifier;
    v19->_sessionIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_requester, a4);
    objc_storeStrong((id *)&v19->_diskCache, a6);
    if (v16)
    {
      v22 = (GEOResourceManifestManager *)v16;
    }
    else
    {
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
      v22 = (GEOResourceManifestManager *)objc_claimAutoreleasedReturnValue();
    }
    manifestManager = v19->_manifestManager;
    v19->_manifestManager = v22;

    objc_storeStrong((id *)&v19->_requestCounter, a7);
    v19->_requestCounterPolicy = a8;
    v19->_started.lock._os_unfair_lock_opaque = 0;
    v19->_started.didRun = 0;
    -[GEOBatchTileRequester setDelegate:](v19->_requester, "setDelegate:", v19);
    v24 = v19;
  }

  return v19;
}

- (OS_dispatch_queue)delegateQueue
{
  return -[GEOBatchTileRequester delegateQueue](self->_requester, "delegateQueue");
}

- (void)setDelegateQueue:(id)a3
{
  -[GEOBatchTileRequester setDelegateQueue:](self->_requester, "setDelegateQueue:", a3);
}

- (void)resume
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__GEOBatchTileRequesterOpportunisticAdapter_resume__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  GEOOnce((uint64_t)&self->_started, v3);
  -[GEOBatchTileRequester resume](self->_requester, "resume");
}

uint64_t __51__GEOBatchTileRequesterOpportunisticAdapter_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "startedProactiveTileDownloadForIdentifier:policy:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)pause
{
  -[GEOBatchTileRequester pause](self->_requester, "pause");
}

- (void)cancel
{
  -[GEOBatchTileRequester cancel](self->_requester, "cancel");
}

- (unint64_t)bytesDownloaded
{
  return -[GEOBatchTileRequester bytesDownloaded](self->_requester, "bytesDownloaded");
}

- (void)batchTileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(uint64_t)a5 tileSet:(unsigned int)a6 etag:(void *)a7 forKey:(uint64_t)a8 userInfo:(uint64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  _BOOL4 IsAllowableForKey;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned int v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v38[0] = a9;
  v38[1] = a10;
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a11;
  if (_GEOTileResponseIsCacheable((unsigned __int8 *)v38, v19))
  {
    v36 = *(void **)(a1 + 24);
    objc_msgSend(v16, "countryCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "region");
    v37 = a6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "devicePostureCountry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "devicePostureRegion");
    v22 = v19;
    v23 = v16;
    v24 = a1;
    v25 = v18;
    v26 = v17;
    v27 = a5;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    IsAllowableForKey = _GEOTileResponseIsAllowableForKey((uint64_t)v38, v36, v35, v20, v21, v28);

    v30 = v27;
    v17 = v26;
    v18 = v25;
    v31 = v24;
    v16 = v23;
    v19 = v22;

    if (IsAllowableForKey)
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CachedDataWasCurrent"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = objc_msgSend(v32, "BOOLValue");
      else
        v33 = 0;
      BYTE1(v34) = v33;
      LOBYTE(v34) = objc_msgSend(v16, "reason");
      objc_msgSend(*(id *)(v31 + 32), "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:", v17, v38, v30, v37, v38[0] & 0x7F, v18, v34);

    }
  }

}

- (void)batchTileRequesterDidFinish:(id)a3
{
  id WeakRetained;

  -[GEORequestCounter finishedProactiveTileDownloadForIdentifier:policy:tilesConsidered:tileDownloadAttempts:successes:failures:bytesDownloaded:](self->_requestCounter, "finishedProactiveTileDownloadForIdentifier:policy:tilesConsidered:tileDownloadAttempts:successes:failures:bytesDownloaded:", self->_sessionIdentifier, self->_requestCounterPolicy, -[GEOBatchTileRequester numberOfTilesConsidered](self->_requester, "numberOfTilesConsidered", a3), -[GEOBatchTileRequester numberOfTilesAttempted](self->_requester, "numberOfTilesAttempted"), -[GEOBatchTileRequester successfulTiles](self->_requester, "successfulTiles"), -[GEOBatchTileRequester failedTiles](self->_requester, "failedTiles"), -[GEOBatchTileRequester bytesDownloaded](self->_requester, "bytesDownloaded"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dataSourceDidFinish:", self);

}

- (GEOOpportunisticDataSourceDelegate)delegate
{
  return (GEOOpportunisticDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestCounter, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
