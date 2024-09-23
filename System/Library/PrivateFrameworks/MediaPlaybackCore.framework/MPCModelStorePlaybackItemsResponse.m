@implementation MPCModelStorePlaybackItemsResponse

- (MPCModelStorePlaybackItemsResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4 results:(id)a5 performanceMetrics:(id)a6
{
  id v11;
  id v12;
  id v13;
  MPCModelStorePlaybackItemsResponse *v14;
  MPCModelStorePlaybackItemsResponse *v15;
  id *p_personalizationResponse;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[MPModelResponse initWithRequest:](self, "initWithRequest:", a3);
  v15 = v14;
  if (v14)
  {
    p_personalizationResponse = (id *)&v14->_personalizationResponse;
    objc_storeStrong((id *)&v14->_personalizationResponse, a4);
    objc_msgSend(*p_personalizationResponse, "results");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (id)v17;
    else
      v19 = v12;
    -[MPModelResponse setResults:](v15, "setResults:", v19);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (*p_personalizationResponse)
    {
      objc_msgSend(v20, "addObserver:selector:name:object:", v15, sel__personalizationResponseDidInvalidateNotification_, *MEMORY[0x24BDDC3F8]);
      if ((objc_msgSend(*p_personalizationResponse, "isValid") & 1) == 0)
        -[MPCModelStorePlaybackItemsResponse _invalidate](v15, "_invalidate");
    }
    objc_storeStrong((id *)&v15->_performanceMetrics, a6);
    v22 = *MEMORY[0x24BDDC598];
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v15, sel__allowsExplicitContentDidChangeNotification_, v22, v23);

    objc_msgSend(v21, "addObserver:selector:name:object:", v15, sel__activeUserDidChangeNotification_, *MEMORY[0x24BEC84C0], 0);
  }

  return v15;
}

- (void)dealloc
{
  NSObject *invalidationTimer;
  objc_super v4;

  invalidationTimer = self->_invalidationTimer;
  if (invalidationTimer)
    dispatch_source_cancel(invalidationTimer);
  v4.receiver = self;
  v4.super_class = (Class)MPCModelStorePlaybackItemsResponse;
  -[MPCModelStorePlaybackItemsResponse dealloc](&v4, sel_dealloc);
}

- (void)_invalidate
{
  NSObject *invalidationTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  invalidationTimer = self->_invalidationTimer;
  if (invalidationTimer)
  {
    dispatch_source_cancel(invalidationTimer);
    v4 = self->_invalidationTimer;
    self->_invalidationTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)MPCModelStorePlaybackItemsResponse;
  -[MPModelResponse _invalidate](&v5, sel__invalidate);
}

- (id)equivalencySourceStoreAdamIDForLocalStoreAdamID:(int64_t)a3
{
  NSDictionary *localStoreAdamIDToEquivalencySourceStoreAdamIDMap;
  void *v4;
  void *v5;

  if (a3)
  {
    localStoreAdamIDToEquivalencySourceStoreAdamIDMap = self->_localStoreAdamIDToEquivalencySourceStoreAdamIDMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](localStoreAdamIDToEquivalencySourceStoreAdamIDMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_allowsExplicitContentDidChangeNotification:(id)a3
{
  self->_invalidForPersonalization = 0;
  -[MPCModelStorePlaybackItemsResponse _invalidate](self, "_invalidate", a3);
}

- (void)_mediaLibraryDidChangeNotification:(id)a3
{
  self->_invalidForPersonalization = 1;
  -[MPCModelStorePlaybackItemsResponse _invalidate](self, "_invalidate", a3);
}

- (void)_personalizationResponseDidInvalidateNotification:(id)a3
{
  self->_invalidForPersonalization = 1;
  -[MPCModelStorePlaybackItemsResponse _invalidate](self, "_invalidate", a3);
}

- (void)setInvalidationDate:(id)a3
{
  NSDate *v4;
  NSObject *invalidationTimer;
  OS_dispatch_source *v6;
  NSDate *v7;
  NSDate *invalidationDate;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  double v11;
  double v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = (NSDate *)a3;
  if (self->_invalidationDate != v4)
  {
    invalidationTimer = self->_invalidationTimer;
    if (invalidationTimer)
    {
      dispatch_source_cancel(invalidationTimer);
      v6 = self->_invalidationTimer;
      self->_invalidationTimer = 0;

    }
    v7 = (NSDate *)-[NSDate copy](v4, "copy");
    invalidationDate = self->_invalidationDate;
    self->_invalidationDate = v7;

    if (self->_invalidationDate)
    {
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      v10 = self->_invalidationTimer;
      self->_invalidationTimer = v9;

      -[NSDate timeIntervalSinceNow](self->_invalidationDate, "timeIntervalSinceNow");
      v12 = v11 * 1000000000.0;
      v13 = self->_invalidationTimer;
      v14 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
      dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)(uint64_t)v12 * 0.01));
      objc_initWeak(&location, self);
      v15 = self->_invalidationTimer;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __58__MPCModelStorePlaybackItemsResponse_setInvalidationDate___block_invoke;
      v16[3] = &unk_24CABA2F8;
      objc_copyWeak(&v17, &location);
      dispatch_source_set_event_handler(v15, v16);
      dispatch_resume((dispatch_object_t)self->_invalidationTimer);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

}

- (void)clearResults
{
  -[MPModelResponse setResults:](self, "setResults:", 0);
}

- (MPStoreLibraryPersonalizationResponse)_personalizationResponse
{
  return self->_personalizationResponse;
}

- (BOOL)isFinalResponse
{
  return self->_finalResponse;
}

- (void)setFinalResponse:(BOOL)a3
{
  self->_finalResponse = a3;
}

- (BOOL)isInvalidForPersonalization
{
  return self->_invalidForPersonalization;
}

- (NSDictionary)localStoreAdamIDToEquivalencySourceStoreAdamIDMap
{
  return self->_localStoreAdamIDToEquivalencySourceStoreAdamIDMap;
}

- (void)setLocalStoreAdamIDToEquivalencySourceStoreAdamIDMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)invalidationDate
{
  return self->_invalidationDate;
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_performanceMetrics, a3);
}

- (int64_t)_sonicSPIROpStorage
{
  return self->__sonicSPIROpStorage;
}

- (void)set_sonicSPIROpStorage:(int64_t)a3
{
  self->__sonicSPIROpStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_invalidationDate, 0);
  objc_storeStrong((id *)&self->_localStoreAdamIDToEquivalencySourceStoreAdamIDMap, 0);
  objc_storeStrong((id *)&self->_personalizationResponse, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
}

void __58__MPCModelStorePlaybackItemsResponse_setInvalidationDate___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[57] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidate");
    WeakRetained = v2;
  }

}

@end
