@implementation GEOMapDataSubscriptionTileDownloader

+ (NSString)loggingDescription
{
  return (NSString *)CFSTR("tiles");
}

- (GEOMapDataSubscriptionTileDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 reason:(unsigned __int8)a5 requestOptions:(unint64_t)a6 auditToken:(id)a7 manifestManager:(id)a8 delegate:(id)a9 delegateQueue:(id)a10 log:(id)a11 logPrefix:(id)a12 tileRequesterCreationBlock:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  GEOMapDataSubscriptionTileDownloader *v24;
  GEOMapDataSubscriptionTileDownloader *v25;
  _GEOMapDataSubscriptionBatchTileRequester *v26;
  void *v27;
  uint64_t v28;
  _GEOMapDataSubscriptionBatchTileRequester *batchRequester;
  GEOMapDataSubscriptionTileDownloader *v30;
  unsigned int v32;
  id v34;
  id v35;
  objc_super v36;

  v32 = a5;
  v35 = a3;
  v34 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v36.receiver = self;
  v36.super_class = (Class)GEOMapDataSubscriptionTileDownloader;
  v24 = -[GEOMapDataSubscriptionTileDownloader init](&v36, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_diskCache, a4);
    objc_storeWeak((id *)&v25->_delegate, v19);
    objc_storeStrong((id *)&v25->_delegateQueue, a10);
    v26 = [_GEOMapDataSubscriptionBatchTileRequester alloc];
    objc_msgSend(v22, "stringByAppendingString:", CFSTR(" [Tile]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[_GEOMapDataSubscriptionBatchTileRequester initWithSubscription:diskCache:reason:auditToken:requestOptions:manifestManager:log:logPrefix:tileRequesterCreationBlock:](v26, "initWithSubscription:diskCache:reason:auditToken:requestOptions:manifestManager:log:logPrefix:tileRequesterCreationBlock:", v35, v34, v32, v17, a6, v18, v21, v27, v23);
    batchRequester = v25->_batchRequester;
    v25->_batchRequester = (_GEOMapDataSubscriptionBatchTileRequester *)v28;

    -[GEOBatchTileRequester setDelegate:](v25->_batchRequester, "setDelegate:", v25);
    -[GEOBatchTileRequester setDelegateQueue:](v25->_batchRequester, "setDelegateQueue:", v20);
    v30 = v25;
  }

  return v25;
}

- (GEOMapDataSubscription)subscription
{
  return -[_GEOMapDataSubscriptionBatchTileRequester subscription](self->_batchRequester, "subscription");
}

- (NSProgress)progress
{
  return -[_GEOMapDataSubscriptionBatchTileRequester progress](self->_batchRequester, "progress");
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_delegateQueue, a3);
  v5 = a3;
  -[GEOBatchTileRequester setDelegateQueue:](self->_batchRequester, "setDelegateQueue:", v5);

}

- (void)resume
{
  -[GEOBatchTileRequester resume](self->_batchRequester, "resume");
}

- (void)pause
{
  -[GEOBatchTileRequester pause](self->_batchRequester, "pause");
}

- (void)cancel
{
  -[GEOBatchTileRequester cancel](self->_batchRequester, "cancel");
}

- (unint64_t)numberOfTilesConsidered
{
  return -[_GEOMapDataSubscriptionBatchTileRequester numberOfTilesConsidered](self->_batchRequester, "numberOfTilesConsidered");
}

- (unint64_t)numberOfTilesAttempted
{
  return -[GEOBatchTileRequester numberOfTilesAttempted](self->_batchRequester, "numberOfTilesAttempted");
}

- (unint64_t)successfulTiles
{
  return -[GEOBatchTileRequester successfulTiles](self->_batchRequester, "successfulTiles");
}

- (unint64_t)failedTiles
{
  return -[GEOBatchTileRequester failedTiles](self->_batchRequester, "failedTiles");
}

- (unint64_t)bytesDownloaded
{
  return -[GEOBatchTileRequester bytesDownloaded](self->_batchRequester, "bytesDownloaded");
}

- (void)batchTileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(unsigned int)a5 tileSet:(unsigned int)a6 etag:(void *)a7 forKey:(uint64_t)a8 userInfo:(uint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v34[0] = a9;
  v34[1] = a10;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a11;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (_GEOTileResponseIsCacheable((unsigned __int8 *)v34, v17))
  {
    v18 = *(void **)(a1 + 40);
    objc_msgSend(v14, "countryCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "region");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "devicePostureCountry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "devicePostureRegion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = _GEOTileResponseIsAllowableForKey((uint64_t)v34, v18, v19, v20, v21, v22);

    if ((_DWORD)v18)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CachedDataWasCurrent"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = v23;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = objc_msgSend(v23, "BOOLValue");
      else
        v24 = 0;
      v25 = objc_msgSend(v14, "reason");
      v26 = *(void **)(a1 + 32);
      v27 = v34[0] & 0x7F;
      objc_msgSend((id)a1, "subscription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v30) = v24;
      LOBYTE(v30) = v25;
      objc_msgSend(v26, "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:forSubscriptionWithIdentifier:", v15, v34, a5, a6, v27, v16, v30, v29);

    }
  }

}

- (void)batchTileRequester:(uint64_t)a3 failedToLoadKey:(uint64_t)a4 error:(uint64_t)a5
{
  id v7;
  void *v8;

  v7 = a6;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v7;

}

- (void)batchTileRequesterDidFinish:(id)a3
{
  NSError *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_delegateQueue);
  v4 = self->_firstError;
  -[GEOMapDataSubscriptionTileDownloader delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloader:didFinishWithError:", self, v4);

}

- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate
{
  return (GEOMapDataSubscriptionDataDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_batchRequester, 0);
}

@end
