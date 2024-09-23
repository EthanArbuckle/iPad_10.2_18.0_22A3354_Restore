@implementation _MKOfflineRegionsOverlayManager

- (unsigned)sceneState
{
  return 1;
}

- (unsigned)sceneID
{
  return 0;
}

- (BOOL)isClusteringEnabled
{
  return 1;
}

- (unsigned)featureType
{
  return 1;
}

- (void)addObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_customFeatureDataSourceObservers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_customFeatureDataSourceObservers, "unregisterObserver:", a3);
}

- (id)annotationsInMapRect:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_currentCustomFeatures;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "coordinate", (_QWORD)v12);
        GEOMapPointForCoordinate();
        if (GEOMapRectContainsPoint())
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)clusterStyleAttributes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 5, 3, 6, 452, 0);
}

- (_MKOfflineRegionsOverlayManager)initWithMapView:(id)a3
{
  id v4;
  _MKOfflineRegionsOverlayManager *v5;
  _MKOfflineRegionsOverlayManager *v6;
  void *v7;
  uint64_t v8;
  NSString *offlineCohortId;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  GEOObserverHashTable *customFeatureDataSourceObservers;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  id WeakRetained;
  _MKOfflineRegionsOverlayManager *v22;
  _QWORD v24[4];
  id v25;
  _QWORD handler[4];
  id v27;
  id location;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_MKOfflineRegionsOverlayManager;
  v5 = -[_MKOfflineRegionsOverlayManager init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mapView, v4);
    objc_msgSend(MEMORY[0x1E0D26EF8], "currentProcessAuditToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "offlineCohortId");
    v8 = objc_claimAutoreleasedReturnValue();
    offlineCohortId = v6->_offlineCohortId;
    v6->_offlineCohortId = (NSString *)v8;

    geo_dispatch_queue_create_with_workloop_qos();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x1E0D272B8]);
    v13 = objc_msgSend(v12, "initWithProtocol:queue:", &unk_1EE079800, MEMORY[0x1E0C80D38]);
    customFeatureDataSourceObservers = v6->_customFeatureDataSourceObservers;
    v6->_customFeatureDataSourceObservers = (GEOObserverHashTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel__update, *MEMORY[0x1E0D26770], 0);

    objc_initWeak(&location, v6);
    v16 = (const char *)*MEMORY[0x1E0D26638];
    v17 = v6->_queue;
    v18 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __51___MKOfflineRegionsOverlayManager_initWithMapView___block_invoke;
    handler[3] = &unk_1E20D93F8;
    objc_copyWeak(&v27, &location);
    notify_register_dispatch(v16, &v6->_fullyLoadedSubscriptionsChangedNotifyToken, v17, handler);
    v19 = (const char *)*MEMORY[0x1E0D26640];
    v20 = v6->_queue;
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __51___MKOfflineRegionsOverlayManager_initWithMapView___block_invoke_2;
    v24[3] = &unk_1E20D93F8;
    objc_copyWeak(&v25, &location);
    notify_register_dispatch(v19, &v6->_subscriptionsChangedNotifyToken, v20, v24);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_mapView);
    objc_msgSend(WeakRetained, "_addCustomFeatureDataSource:", v6);

    -[_MKOfflineRegionsOverlayManager _update](v6, "_update");
    v22 = v6;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_update
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___MKOfflineRegionsOverlayManager__update__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setOverlay:(id)a3 customFeatures:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___MKOfflineRegionsOverlayManager__setOverlay_customFeatures___block_invoke;
  block[3] = &unk_1E20D7E80;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)dealloc
{
  int fullyLoadedSubscriptionsChangedNotifyToken;
  int subscriptionsChangedNotifyToken;
  id WeakRetained;
  objc_super v6;

  fullyLoadedSubscriptionsChangedNotifyToken = self->_fullyLoadedSubscriptionsChangedNotifyToken;
  if (fullyLoadedSubscriptionsChangedNotifyToken != -1)
  {
    notify_cancel(fullyLoadedSubscriptionsChangedNotifyToken);
    self->_fullyLoadedSubscriptionsChangedNotifyToken = -1;
  }
  subscriptionsChangedNotifyToken = self->_subscriptionsChangedNotifyToken;
  if (subscriptionsChangedNotifyToken != -1)
  {
    notify_cancel(subscriptionsChangedNotifyToken);
    self->_subscriptionsChangedNotifyToken = -1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  objc_msgSend(WeakRetained, "_removeCustomFeatureDataSource:", self);

  v6.receiver = self;
  v6.super_class = (Class)_MKOfflineRegionsOverlayManager;
  -[_MKOfflineRegionsOverlayManager dealloc](&v6, sel_dealloc);
}

- (void)_fetchFullyLoadedSubscriptionsForState:(id)a3 completionHandler:(id)a4
{
  id v5;
  GEOMapDataSubscriptionManager *subscriptionsManager;
  GEOMapDataSubscriptionManager *v7;
  GEOMapDataSubscriptionManager *v8;
  OS_dispatch_queue *queue;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  subscriptionsManager = self->_subscriptionsManager;
  if (!subscriptionsManager)
  {
    v7 = (GEOMapDataSubscriptionManager *)objc_alloc_init(MEMORY[0x1E0D27190]);
    v8 = self->_subscriptionsManager;
    self->_subscriptionsManager = v7;

    subscriptionsManager = self->_subscriptionsManager;
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke;
  v11[3] = &unk_1E20D94F0;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  -[GEOMapDataSubscriptionManager fetchAllSubscriptionsWithCallbackQueue:completionHandler:](subscriptionsManager, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", queue, v11);

}

- (void)setVisibility:(int64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    -[_MKOfflineRegionsOverlayManager _update](self, "_update");
  }
}

- (id)createDrawableForOverlay:(id)a3
{
  id v3;
  _MKMaskingPolygonOverlayRenderer *v4;

  v3 = a3;
  v4 = -[_MKMaskingPolygonOverlayRenderer initWithMultiPolygon:]([_MKMaskingPolygonOverlayRenderer alloc], "initWithMultiPolygon:", v3);

  -[_MKMaskingPolygonOverlayRenderer setStyle:](v4, "setStyle:", 1);
  return v4;
}

- (void)getClusterAnnotationTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  int v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v7 = a3;
    v8 = (void *)MEMORY[0x1E0CB3940];
    _MKLocalizedStringFromThisBundleFromTable(CFSTR("OFFLINE_REGION_CLUSTER_TITLE"), CFSTR("Offline"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, (v7 - 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    *a5 = CFSTR("und");
  }
}

- (void)getClusterImageTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocale:", v8);

  objc_msgSend(v10, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromNumber:", v9);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  *a5 = CFSTR("und");
}

- (id)globalAnnotations
{
  return 0;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFeatureDataSourceObservers, 0);
  objc_storeStrong((id *)&self->_currentCustomFeatures, 0);
  objc_storeStrong((id *)&self->_currentOverlay, 0);
  objc_storeStrong((id *)&self->_subscriptionsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_offlineCohortId, 0);
  objc_destroyWeak((id *)&self->_mapView);
}

@end
