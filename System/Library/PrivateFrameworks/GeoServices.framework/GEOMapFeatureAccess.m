@implementation GEOMapFeatureAccess

- (void)setAllowNetworkTileLoad:(BOOL)a3
{
  self->_allowNetworkTileLoad = a3;
}

- (GEOMapFeatureAccess)initWithQueue:(id)a3 memoryCacheCountLimit:(unint64_t)a4 memoryCacheCostLimit:(unint64_t)a5
{
  id v9;
  GEOMapFeatureAccess *v10;
  GEOTileLoaderConfiguration *v11;
  GEOVectorTileDecoder *v12;
  GEOTileLoader *v13;
  GEOTileLoader *tileLoader;
  GEOMapFeatureAccess *v15;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapFeatureAccess;
  v10 = -[GEOMapFeatureAccess init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(GEOTileLoaderConfiguration);
    -[GEOTileLoaderConfiguration setMemoryCacheCostLimit:](v11, "setMemoryCacheCostLimit:", a5);
    -[GEOTileLoaderConfiguration setMemoryCacheCountLimit:](v11, "setMemoryCacheCountLimit:", a4);
    v12 = objc_alloc_init(GEOVectorTileDecoder);
    v13 = -[GEOTileLoader initWithConfiguration:]([GEOTileLoader alloc], "initWithConfiguration:", v11);
    tileLoader = v10->_tileLoader;
    v10->_tileLoader = v13;

    -[GEOTileLoader registerTileDecoder:](v10->_tileLoader, "registerTileDecoder:", v12);
    objc_storeStrong((id *)&v10->_callbackQueue, a3);
    v10->_syncTimeout = 10.0;
    v15 = v10;

  }
  return v10;
}

- (GEOMapFeatureAccess)init
{
  return -[GEOMapFeatureAccess initWithQueue:](self, "initWithQueue:", MEMORY[0x1E0C80D38]);
}

- (GEOMapFeatureAccess)initWithQueue:(id)a3
{
  id v5;
  GEOMapFeatureAccess *v6;
  GEOMapFeatureAccess *v7;
  uint64_t v8;
  GEOTileLoader *tileLoader;
  objc_super v11;

  v5 = a3;
  if (initWithQueue__onceToken != -1)
    dispatch_once(&initWithQueue__onceToken, &__block_literal_global_3_5);
  v11.receiver = self;
  v11.super_class = (Class)GEOMapFeatureAccess;
  v6 = -[GEOMapFeatureAccess init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
    v8 = objc_claimAutoreleasedReturnValue();
    tileLoader = v7->_tileLoader;
    v7->_tileLoader = (GEOTileLoader *)v8;

    v7->_syncTimeout = 10.0;
  }

  return v7;
}

void __37__GEOMapFeatureAccess_initWithQueue___block_invoke()
{
  void *v0;
  GEOVectorTileDecoder *v1;

  v1 = objc_alloc_init(GEOVectorTileDecoder);
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerTileDecoder:", v1);

}

- (id)_openTileLoaderWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  do
    v5 = __ldaxr((unsigned int *)&_openTileLoaderWithCompletionHandler__counter);
  while (__stlxr(v5 + 1, (unsigned int *)&_openTileLoaderWithCompletionHandler__counter));
  v6 = (void *)MEMORY[0x1E0CB3940];
  GEOTileLoaderClientIdentifier(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@(%d)"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOTileLoader openForClient:](self->_tileLoader, "openForClient:", v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__GEOMapFeatureAccess__openTileLoaderWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E1C104D0;
  v13[4] = self;
  v14 = v8;
  v15 = v4;
  v9 = v4;
  v10 = v8;
  v11 = (void *)objc_msgSend(v13, "copy");

  return v11;
}

void __60__GEOMapFeatureAccess__openTileLoaderWithCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1[4] + 16), "closeForClient:", a1[5]);
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (id)_requestParameters
{
  _GEOMapFeatureAccessRequestParameters *v3;

  v3 = objc_alloc_init(_GEOMapFeatureAccessRequestParameters);
  -[_GEOMapFeatureAccessRequestParameters setTileLoader:](v3, "setTileLoader:", self->_tileLoader);
  -[_GEOMapFeatureAccessRequestParameters setQueue:](v3, "setQueue:", self->_callbackQueue);
  -[_GEOMapFeatureAccessRequestParameters setAuditToken:](v3, "setAuditToken:", self->_auditToken);
  -[_GEOMapFeatureAccessRequestParameters setAllowNetworkTileLoad:](v3, "setAllowNetworkTileLoad:", self->_allowNetworkTileLoad);
  -[_GEOMapFeatureAccessRequestParameters setFlipNegativeTravelDirectionRoads:](v3, "setFlipNegativeTravelDirectionRoads:", self->_flipNegativeTravelDirectionRoads);
  -[_GEOMapFeatureAccessRequestParameters setVisitDoubleTravelDirectionRoadsTwice:](v3, "setVisitDoubleTravelDirectionRoadsTwice:", self->_visitDoubleTravelDirectionRoadsTwice);
  -[_GEOMapFeatureAccessRequestParameters setAllowStaleData:](v3, "setAllowStaleData:", self->_allowStaleData);
  -[_GEOMapFeatureAccessRequestParameters setPreferStaleData:](v3, "setPreferStaleData:", self->_preferStaleData);
  -[_GEOMapFeatureAccessRequestParameters setAllowOfflineData:](v3, "setAllowOfflineData:", self->_allowOfflineData);
  -[_GEOMapFeatureAccessRequestParameters setJoinAllRoadsByMuid:](v3, "setJoinAllRoadsByMuid:", self->_joinAllRoadsByMuid);
  -[_GEOMapFeatureAccessRequestParameters setCachedTilesCallbackImmediately:](v3, "setCachedTilesCallbackImmediately:", self->_cachedTilesCallbackImmediately);
  return v3;
}

- (id)findRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  uint64_t v13;
  GEOMapFeatureRoadFinder *v14;
  void *v15;
  GEOMapFeatureRoadFinder *v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[16];
  uint8_t buf[16];

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = [GEOMapFeatureRoadFinder alloc];
    -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v14, "initWithRequestParameters:", v15);

    -[GEOMapFeatureRoadFinder findRoadsNear:radius:handler:completionHandler:](v16, "findRoadsNear:radius:handler:completionHandler:", v11, v13, var0, var1, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)v13;
  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "-[GEOMapFeatureAccess findRoadsNear:] requires a handler", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: handler != ((void *)0)", v20, 2u);
    }
    v17 = 0;
  }

  return v17;
}

- (id)findRoadWithID:(unint64_t)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  GEOMapFeatureRoadFinder *v11;
  void *v12;
  GEOMapFeatureRoadFinder *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = [GEOMapFeatureRoadFinder alloc];
    -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

    -[GEOMapFeatureRoadFinder findRoadWithID:handler:completionHandler:](v13, "findRoadWithID:handler:completionHandler:", a3, v8, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)v10;
  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "-[GEOMapFeatureAccess findRoadWithID:] requires a handler", v17, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)findRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  uint64_t v13;
  GEOMapFeatureRoadFinder *v14;
  void *v15;
  GEOMapFeatureRoadFinder *v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[16];

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = [GEOMapFeatureRoadFinder alloc];
    -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v14, "initWithRequestParameters:", v15);

    -[GEOMapFeatureRoadFinder findRoadWithMuid:nearCoordinate:handler:completionHandler:](v16, "findRoadWithMuid:nearCoordinate:handler:completionHandler:", a3, v11, v13, var0, var1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)v13;
  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "-[GEOMapFeatureAccess findRoadWithMuid:] requires a handler", v20, 2u);
    }

    v17 = 0;
  }

  return v17;
}

- (id)findRoadsFromPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureIntersectedRoadFinder *v11;
  void *v12;
  GEOMapFeatureIntersectedRoadFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureIntersectedRoadFinder findRoadsAtPreviousIntersectionOf:desiredRoadDirectionality:handler:completionHandler:](v13, "findRoadsAtPreviousIntersectionOf:desiredRoadDirectionality:handler:completionHandler:", v9, 2, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findRoadsToPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureIntersectedRoadFinder *v11;
  void *v12;
  GEOMapFeatureIntersectedRoadFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureIntersectedRoadFinder findRoadsAtPreviousIntersectionOf:desiredRoadDirectionality:handler:completionHandler:](v13, "findRoadsAtPreviousIntersectionOf:desiredRoadDirectionality:handler:completionHandler:", v9, 3, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findRoadsFromNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureIntersectedRoadFinder *v11;
  void *v12;
  GEOMapFeatureIntersectedRoadFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureIntersectedRoadFinder findRoadsAtNextIntersectionOf:desiredRoadDirectionality:handler:completionHandler:](v13, "findRoadsAtNextIntersectionOf:desiredRoadDirectionality:handler:completionHandler:", v9, 2, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findRoadsToNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureIntersectedRoadFinder *v11;
  void *v12;
  GEOMapFeatureIntersectedRoadFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureIntersectedRoadFinder findRoadsAtNextIntersectionOf:desiredRoadDirectionality:handler:completionHandler:](v13, "findRoadsAtNextIntersectionOf:desiredRoadDirectionality:handler:completionHandler:", v9, 3, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findAllRoadsAtPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureIntersectedRoadFinder *v11;
  void *v12;
  GEOMapFeatureIntersectedRoadFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureIntersectedRoadFinder findRoadsAtPreviousIntersectionOf:desiredRoadDirectionality:handler:completionHandler:](v13, "findRoadsAtPreviousIntersectionOf:desiredRoadDirectionality:handler:completionHandler:", v9, self->_flipNegativeTravelDirectionRoads, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findAllRoadsAtNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureIntersectedRoadFinder *v11;
  void *v12;
  GEOMapFeatureIntersectedRoadFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureIntersectedRoadFinder findRoadsAtNextIntersectionOf:desiredRoadDirectionality:handler:completionHandler:](v13, "findRoadsAtNextIntersectionOf:desiredRoadDirectionality:handler:completionHandler:", v9, self->_flipNegativeTravelDirectionRoads, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findRoadsFromJunction:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureIntersectedRoadFinder *v11;
  void *v12;
  GEOMapFeatureIntersectedRoadFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureIntersectedRoadFinder findRoadsAtJunction:desiredRoadDirectionality:handler:completionHandler:](v13, "findRoadsAtJunction:desiredRoadDirectionality:handler:completionHandler:", v9, 2, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findRoadsToJunction:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureIntersectedRoadFinder *v11;
  void *v12;
  GEOMapFeatureIntersectedRoadFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureIntersectedRoadFinder findRoadsAtJunction:desiredRoadDirectionality:handler:completionHandler:](v13, "findRoadsAtJunction:desiredRoadDirectionality:handler:completionHandler:", v9, 3, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findTransitStopsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__GEOMapFeatureAccess_findTransitStopsNear_radius_handler_completionHandler___block_invoke;
  v15[3] = &unk_1E1C119D0;
  v16 = v11;
  v12 = v11;
  -[GEOMapFeatureAccess _findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:](self, "_findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:", 2, v15, a6, var0, var1, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __77__GEOMapFeatureAccess_findTransitStopsNear_radius_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitHallsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__GEOMapFeatureAccess_findTransitHallsNear_radius_handler_completionHandler___block_invoke;
  v15[3] = &unk_1E1C119D0;
  v16 = v11;
  v12 = v11;
  -[GEOMapFeatureAccess _findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:](self, "_findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:", 4, v15, a6, var0, var1, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __77__GEOMapFeatureAccess_findTransitHallsNear_radius_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitStationsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__GEOMapFeatureAccess_findTransitStationsNear_radius_handler_completionHandler___block_invoke;
  v15[3] = &unk_1E1C119D0;
  v16 = v11;
  v12 = v11;
  -[GEOMapFeatureAccess _findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:](self, "_findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:", 8, v15, a6, var0, var1, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __80__GEOMapFeatureAccess_findTransitStationsNear_radius_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  void *v12;
  GEOMapFeatureTransitPointFinder *v13;
  void *v14;
  GEOMapFeatureTransitPointFinder *v15;
  void *v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [GEOMapFeatureTransitPointFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v13, "initWithRequestParameters:", v14);

  -[GEOMapFeatureTransitPointFinder findTransitPointWithID:near:handler:completionHandler:](v15, "findTransitPointWithID:near:handler:completionHandler:", a3, v11, v12, var0, var1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_findTransitPointsOfType:(unint64_t)a3 nearCoordinate:(id)a4 radius:(double)a5 handler:(id)a6 completionHandler:(id)a7
{
  double var1;
  double var0;
  id v13;
  void *v14;
  GEOMapFeatureTransitPointFinder *v15;
  void *v16;
  GEOMapFeatureTransitPointFinder *v17;
  void *v18;

  var1 = a4.var1;
  var0 = a4.var0;
  v13 = a6;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [GEOMapFeatureTransitPointFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v15, "initWithRequestParameters:", v16);

  -[GEOMapFeatureTransitPointFinder findTransitPointsOfType:near:radius:handler:completionHandler:](v17, "findTransitPointsOfType:near:radius:handler:completionHandler:", a3, v13, v14, var0, var1, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)findTransitLinksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  void *v12;
  GEOMapFeatureTransitLinkFinder *v13;
  void *v14;
  GEOMapFeatureTransitLinkFinder *v15;
  void *v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [GEOMapFeatureTransitLinkFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v13, "initWithRequestParameters:", v14);

  -[GEOMapFeatureTransitLinkFinder findTransitLinksNear:radius:handler:completionHandler:](v15, "findTransitLinksNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)findTransitHallForStop:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__GEOMapFeatureAccess_findTransitHallForStop_handler_completionHandler___block_invoke;
  v12[3] = &unk_1E1C119D0;
  v13 = v8;
  v9 = v8;
  -[GEOMapFeatureAccess _findParentOfTransitPoint:handler:completionHandler:](self, "_findParentOfTransitPoint:handler:completionHandler:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __72__GEOMapFeatureAccess_findTransitHallForStop_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitStationForHall:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__GEOMapFeatureAccess_findTransitStationForHall_handler_completionHandler___block_invoke;
  v12[3] = &unk_1E1C119D0;
  v13 = v8;
  v9 = v8;
  -[GEOMapFeatureAccess _findParentOfTransitPoint:handler:completionHandler:](self, "_findParentOfTransitPoint:handler:completionHandler:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __75__GEOMapFeatureAccess_findTransitStationForHall_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitStopsForHall:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__GEOMapFeatureAccess_findTransitStopsForHall_handler_completionHandler___block_invoke;
  v12[3] = &unk_1E1C119D0;
  v13 = v8;
  v9 = v8;
  -[GEOMapFeatureAccess _findChildrenOfTransitPoint:handler:completionHandler:](self, "_findChildrenOfTransitPoint:handler:completionHandler:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __73__GEOMapFeatureAccess_findTransitStopsForHall_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitHallsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__GEOMapFeatureAccess_findTransitHallsForStation_handler_completionHandler___block_invoke;
  v12[3] = &unk_1E1C119D0;
  v13 = v8;
  v9 = v8;
  -[GEOMapFeatureAccess _findChildrenOfTransitPoint:handler:completionHandler:](self, "_findChildrenOfTransitPoint:handler:completionHandler:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __76__GEOMapFeatureAccess_findTransitHallsForStation_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitAccessPointsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureTransitPointFinder *v11;
  void *v12;
  GEOMapFeatureTransitPointFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureTransitPointFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureTransitPointFinder findTransitAccessPointsForStation:handler:completionHandler:](v13, "findTransitAccessPointsForStation:handler:completionHandler:", v9, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_findParentOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureTransitPointFinder *v11;
  void *v12;
  GEOMapFeatureTransitPointFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureTransitPointFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureTransitPointFinder findParentOfTransitPoint:handler:completionHandler:](v13, "findParentOfTransitPoint:handler:completionHandler:", v9, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_findChildrenOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  GEOMapFeatureTransitPointFinder *v11;
  void *v12;
  GEOMapFeatureTransitPointFinder *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [GEOMapFeatureTransitPointFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v11, "initWithRequestParameters:", v12);

  -[GEOMapFeatureTransitPointFinder findTransitPointsWithParent:handler:completionHandler:](v13, "findTransitPointsWithParent:handler:completionHandler:", v9, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)findTransitGeometryForPoint:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  GEOMapFeatureTransitPointFinder *v8;
  void *v9;
  GEOMapFeatureTransitPointFinder *v10;
  void *v11;

  v6 = a3;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [GEOMapFeatureTransitPointFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v8, "initWithRequestParameters:", v9);

  -[GEOMapFeatureTransitPointFinder findGeometryForTransitPoint:completionHandler:](v10, "findGeometryForTransitPoint:completionHandler:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)findBuildingsNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 handler:(id)a6 completionHandler:(id)a7
{
  uint64_t v8;
  double var1;
  double var0;
  id v13;
  void *v14;
  GEOMapFeatureBuildingFinder *v15;
  void *v16;
  GEOMapFeatureBuildingFinder *v17;
  void *v18;

  v8 = *(_QWORD *)&a5;
  var1 = a3.var1;
  var0 = a3.var0;
  v13 = a6;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [GEOMapFeatureBuildingFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v15, "initWithRequestParameters:", v16);

  -[GEOMapFeatureBuildingFinder findBuildingsNear:radius:tileSetStyle:handler:completionHandler:](v17, "findBuildingsNear:radius:tileSetStyle:handler:completionHandler:", v8, v13, v14, var0, var1, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)findBuildingsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  void *v12;
  GEOMapFeatureBuildingFinder *v13;
  void *v14;
  GEOMapFeatureBuildingFinder *v15;
  void *v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [GEOMapFeatureBuildingFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v13, "initWithRequestParameters:", v14);

  -[GEOMapFeatureBuildingFinder findBuildingsNear:radius:handler:completionHandler:](v15, "findBuildingsNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)findRunningTrackFlagsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  void *v12;
  GEOMapFeatureRunningTrackFinder *v13;
  void *v14;
  GEOMapFeatureRunningTrackFinder *v15;
  void *v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [GEOMapFeatureRunningTrackFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v13, "initWithRequestParameters:", v14);

  -[GEOMapFeatureRunningTrackFinder findRunningTrackFlagsNear:radius:handler:completionHandler:](v15, "findRunningTrackFlagsNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)findRunningTracksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  void *v12;
  GEOMapFeatureRunningTrackFinder *v13;
  void *v14;
  GEOMapFeatureRunningTrackFinder *v15;
  void *v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [GEOMapFeatureRunningTrackFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v13, "initWithRequestParameters:", v14);

  -[GEOMapFeatureRunningTrackFinder findRunningTracksNear:radius:handler:completionHandler:](v15, "findRunningTracksNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)findRaytracingDataNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  void *v12;
  GEOMapFeatureRayTracingFinder *v13;
  void *v14;
  GEOMapFeatureRayTracingFinder *v15;
  void *v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [GEOMapFeatureRayTracingFinder alloc];
  -[GEOMapFeatureAccess _requestParameters](self, "_requestParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v13, "initWithRequestParameters:", v14);

  -[GEOMapFeatureRayTracingFinder findRaytracingDataNear:radius:handler:completionHandler:](v15, v11, v12, var0, var1, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)preloadRoadTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__GEOMapFeatureAccess_preloadRoadTilesNear_radius_completionHandler___block_invoke;
  v11[3] = &unk_1E1C10038;
  v12 = v9;
  v10 = v9;
  -[GEOMapFeatureAccess preloadRoadTilesNear:radius:preloadToDiskOnly:completionHandler:](self, "preloadRoadTilesNear:radius:preloadToDiskOnly:completionHandler:", 0, v11, var0, var1, a4);

}

uint64_t __69__GEOMapFeatureAccess_preloadRoadTilesNear_radius_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)preloadTransitTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__GEOMapFeatureAccess_preloadTransitTilesNear_radius_completionHandler___block_invoke;
  v11[3] = &unk_1E1C10038;
  v12 = v9;
  v10 = v9;
  -[GEOMapFeatureAccess preloadTransitTilesNear:radius:preloadToDiskOnly:completionHandler:](self, "preloadTransitTilesNear:radius:preloadToDiskOnly:completionHandler:", 0, v11, var0, var1, a4);

}

uint64_t __72__GEOMapFeatureAccess_preloadTransitTilesNear_radius_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__GEOMapFeatureAccess_preloadBuildingTilesNear_radius_completionHandler___block_invoke;
  v11[3] = &unk_1E1C10038;
  v12 = v9;
  v10 = v9;
  -[GEOMapFeatureAccess preloadBuildingTilesNear:radius:preloadToDiskOnly:completionHandler:](self, "preloadBuildingTilesNear:radius:preloadToDiskOnly:completionHandler:", 0, v11, var0, var1, a4);

}

uint64_t __73__GEOMapFeatureAccess_preloadBuildingTilesNear_radius_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)preloadRoadTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6
{
  -[GEOMapFeatureAccess _preloadTilesNear:radius:preloadToDiskOnly:tileSetStyle:tileScale:completionHandler:](self, "_preloadTilesNear:radius:preloadToDiskOnly:tileSetStyle:tileScale:completionHandler:", a5, 53, 0, a6, a3.var0, a3.var1, a4);
}

- (void)preloadTransitTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6
{
  -[GEOMapFeatureAccess _preloadTilesNear:radius:preloadToDiskOnly:tileSetStyle:tileScale:completionHandler:](self, "_preloadTilesNear:radius:preloadToDiskOnly:tileSetStyle:tileScale:completionHandler:", a5, 37, 0, a6, a3.var0, a3.var1, a4);
}

- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6
{
  -[GEOMapFeatureAccess _preloadTilesNear:radius:preloadToDiskOnly:tileSetStyle:tileScale:completionHandler:](self, "_preloadTilesNear:radius:preloadToDiskOnly:tileSetStyle:tileScale:completionHandler:", a5, 11, 0, a6, a3.var0, a3.var1, a4);
}

- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 preloadToDiskOnly:(BOOL)a6 completionHandler:(id)a7
{
  -[GEOMapFeatureAccess _preloadTilesNear:radius:preloadToDiskOnly:tileSetStyle:tileScale:completionHandler:](self, "_preloadTilesNear:radius:preloadToDiskOnly:tileSetStyle:tileScale:completionHandler:", a6, 11, 0, a7, a3.var0, a3.var1, a4);
}

- (id)roadTileKeysNear:(id)a3 radius:(double)a4
{
  double var1;
  double var0;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v7;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 53, 0);
  return _GEOTileKeysForCoordinate(HIDWORD(*(unint64_t *)&v7), 53, *(_QWORD *)&v7, 0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))GEOVoltaireTileKeyMake, var0, var1, a4);
}

- (void)_preloadTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 tileSetStyle:(int)a6 tileScale:(int)a7 completionHandler:(id)a8
{
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  double var1;
  double var0;
  id v15;
  void *v16;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v17;
  _GEOMapFeatureAccessRequestParameters *v18;
  GEOMapFeatureTileFinder *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a6;
  v10 = a5;
  var1 = a3.var1;
  var0 = a3.var0;
  v15 = a8;
  -[GEOMapFeatureAccess _openTileLoaderWithCompletionHandler:](self, "_openTileLoaderWithCompletionHandler:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", v9, v8);
  v18 = objc_alloc_init(_GEOMapFeatureAccessRequestParameters);
  -[_GEOMapFeatureAccessRequestParameters setTileLoader:](v18, "setTileLoader:", self->_tileLoader);
  -[_GEOMapFeatureAccessRequestParameters setAllowNetworkTileLoad:](v18, "setAllowNetworkTileLoad:", 1);
  -[_GEOMapFeatureAccessRequestParameters setQueue:](v18, "setQueue:", self->_callbackQueue);
  -[_GEOMapFeatureAccessRequestParameters setAuditToken:](v18, "setAuditToken:", self->_auditToken);
  v19 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:]([GEOMapFeatureTileFinder alloc], "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v17), v17, v8, v9, v18);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __107__GEOMapFeatureAccess__preloadTilesNear_radius_preloadToDiskOnly_tileSetStyle_tileScale_completionHandler___block_invoke;
  v23[3] = &unk_1E1C119F8;
  v24 = v16;
  v25 = v15;
  v20 = v15;
  v21 = v16;
  v22 = -[GEOMapFeatureTileFinder preloadTilesAround:radius:preloadToDiskOnly:completionHandler:](v19, "preloadTilesAround:radius:preloadToDiskOnly:completionHandler:", v10, v23, var0, var1, a4);

}

void __107__GEOMapFeatureAccess__preloadTilesNear_radius_preloadToDiskOnly_tileSetStyle_tileScale_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    v5 = v8;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
    v5 = v8;
  }

}

- (void)clearAllTiles
{
  -[GEOTileLoader clearAllCaches](self->_tileLoader, "clearAllCaches");
}

- (void)_clearStandardTilesWithType:(int)a3
{
  GEOTileLoader *tileLoader;
  _QWORD v4[4];
  int v5;

  tileLoader = self->_tileLoader;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__GEOMapFeatureAccess__clearStandardTilesWithType___block_invoke;
  v4[3] = &__block_descriptor_36_e720_B16__0r___GEOTileKey_b7b1_____GEOStandardTileKey_b40b6b26b26b14b4b4___GEOGloriaQuadIDTileKey_b6b64b14b4______b10b10b12_I____GEORegionalResourceKey_b32b8b6b8b8b1b57___GEOSputnikMetadataKey_b32b24b14b8b42___GEOFlyoverKey_b6b26b26b8b24b14b8b8___GEOTransitLineSelectionKey_b6b25b25b64___GEOPolygonSelectionKey_b6b25b25b64___GEORoadSelectionKey_b6b25b25b64___GEOContourLinesKey_b6b26b26b4b8b50___GEOTileOverlayKey_b6b26b26b8b32b16b6___GEOIdentifiedResourceKey_QCCb1b39___GEOMuninMeshKey_b64b32b16b5b3___GEOVisualLocalizationTrackKey_SCb16b6b26b26b22___GEOVisualLocalizationMetadataKey_b6b9b25b6b26b26b22___GEOVisualLocalizationDataKey_QCb5b21b21b1___GEOS2TileKey_b6b26b26b3b14b4b4b37___GEOLiveTileKey_b6b26b26b14b4b4b4b36___8l;
  v5 = a3;
  -[GEOTileLoader clearCachedTilesMatchingBlock:](tileLoader, "clearCachedTilesMatchingBlock:", v4);
}

BOOL __51__GEOMapFeatureAccess__clearStandardTilesWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(_BYTE *)a2 & 0x7F) == 2 && *(unsigned __int16 *)(a2 + 13) >> 2 == *(_DWORD *)(a1 + 32);
}

- (void)clearRoadTiles
{
  -[GEOMapFeatureAccess _clearStandardTilesWithType:](self, "_clearStandardTilesWithType:", 53);
}

- (void)clearTransitTiles
{
  -[GEOMapFeatureAccess _clearStandardTilesWithType:](self, "_clearStandardTilesWithType:", 37);
  -[GEOMapFeatureAccess _clearStandardTilesWithType:](self, "_clearStandardTilesWithType:", 1);
}

- (void)clearBuildingTiles
{
  -[GEOMapFeatureAccess _clearStandardTilesWithType:](self, "_clearStandardTilesWithType:", 11);
  -[GEOMapFeatureAccess _clearStandardTilesWithType:](self, "_clearStandardTilesWithType:", 73);
}

- (void)clearRunningTrackTiles
{
  -[GEOMapFeatureAccess _clearStandardTilesWithType:](self, "_clearStandardTilesWithType:", 62);
}

- (void)setJoinAllRoadsByMuid:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  if (a3 && self->_cachedTilesCallbackImmediately)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: (joinAllRoadsByMuid && _cachedTilesCallbackImmediately) == NO", buf, 2u);
    }
    GEOGetGEOMapFeatureAccessLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "joinAllRoadsByMuid and cachdTilesCallbackImmediately cannot both be set", v4, 2u);
    }

  }
  else
  {
    self->_joinAllRoadsByMuid = a3;
  }
}

- (void)setCachedTilesCallbackImmediately:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  if (a3 && self->_joinAllRoadsByMuid)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: (cachedTilesCallbackImmediately && _joinAllRoadsByMuid) == NO", buf, 2u);
    }
    GEOGetGEOMapFeatureAccessLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "joinAllRoadsByMuid and cachdTilesCallbackImmediately cannot both be set", v4, 2u);
    }

  }
  else
  {
    self->_cachedTilesCallbackImmediately = a3;
  }
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (BOOL)allowNetworkTileLoad
{
  return self->_allowNetworkTileLoad;
}

- (BOOL)flipNegativeTravelDirectionRoads
{
  return self->_flipNegativeTravelDirectionRoads;
}

- (void)setFlipNegativeTravelDirectionRoads:(BOOL)a3
{
  self->_flipNegativeTravelDirectionRoads = a3;
}

- (BOOL)visitDoubleTravelDirectionRoadsTwice
{
  return self->_visitDoubleTravelDirectionRoadsTwice;
}

- (void)setVisitDoubleTravelDirectionRoadsTwice:(BOOL)a3
{
  self->_visitDoubleTravelDirectionRoadsTwice = a3;
}

- (BOOL)allowStaleData
{
  return self->_allowStaleData;
}

- (void)setAllowStaleData:(BOOL)a3
{
  self->_allowStaleData = a3;
}

- (BOOL)preferStaleData
{
  return self->_preferStaleData;
}

- (void)setPreferStaleData:(BOOL)a3
{
  self->_preferStaleData = a3;
}

- (BOOL)allowOfflineData
{
  return self->_allowOfflineData;
}

- (void)setAllowOfflineData:(BOOL)a3
{
  self->_allowOfflineData = a3;
}

- (BOOL)joinAllRoadsByMuid
{
  return self->_joinAllRoadsByMuid;
}

- (BOOL)cachedTilesCallbackImmediately
{
  return self->_cachedTilesCallbackImmediately;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (double)syncTimeout
{
  return self->_syncTimeout;
}

- (void)setSyncTimeout:(double)a3
{
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  if (a3 <= 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: syncTimeout > 0", buf, 2u);
    }
    GEOGetGEOMapFeatureAccessLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "syncTimeout must be greater than 0", v4, 2u);
    }

  }
  else
  {
    self->_syncTimeout = a3;
  }
}

- (id)synchronousFindRoadsNear:(id)a3 radius:(double)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  $F24F406B2B787EFB06265DBA3D28CBD5 v9;
  double v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__GEOMapFeatureAccess_Sync__synchronousFindRoadsNear_radius___block_invoke;
  v8[3] = &unk_1E1C11A40;
  v8[4] = self;
  v9 = a3;
  v10 = a4;
  v5 = (void *)MEMORY[0x18D765024](v8, a2);
  -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__GEOMapFeatureAccess_Sync__synchronousFindRoadsNear_radius___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadsNear:radius:handler:completionHandler:", a2, a3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)synchronousFindRoadWithID:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__GEOMapFeatureAccess_Sync__synchronousFindRoadWithID___block_invoke;
  v8[3] = &unk_1E1C11A68;
  v8[4] = self;
  v8[5] = a3;
  v4 = (void *)MEMORY[0x18D765024](v8, a2);
  -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __55__GEOMapFeatureAccess_Sync__synchronousFindRoadWithID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadWithID:handler:completionHandler:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)synchronousFindRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  $F24F406B2B787EFB06265DBA3D28CBD5 v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__GEOMapFeatureAccess_Sync__synchronousFindRoadWithMuid_nearCoordinate___block_invoke;
  v9[3] = &unk_1E1C11A40;
  v9[4] = self;
  v9[5] = a3;
  v10 = a4;
  v5 = (void *)MEMORY[0x18D765024](v9, a2);
  -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __72__GEOMapFeatureAccess_Sync__synchronousFindRoadWithMuid_nearCoordinate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadWithMuid:nearCoordinate:handler:completionHandler:", *(_QWORD *)(a1 + 40), a2, a3, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)synchronousFindRoadsFromPreviousIntersectionOf:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  GEOMapFeatureAccess *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __76__GEOMapFeatureAccess_Sync__synchronousFindRoadsFromPreviousIntersectionOf___block_invoke;
  v12 = &unk_1E1C11A90;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x18D765024](&v9);
  -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v6, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __76__GEOMapFeatureAccess_Sync__synchronousFindRoadsFromPreviousIntersectionOf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadsFromPreviousIntersectionOf:handler:completionHandler:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)synchronousFindRoadsToPreviousIntersectionOf:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  GEOMapFeatureAccess *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __74__GEOMapFeatureAccess_Sync__synchronousFindRoadsToPreviousIntersectionOf___block_invoke;
  v12 = &unk_1E1C11A90;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x18D765024](&v9);
  -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v6, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __74__GEOMapFeatureAccess_Sync__synchronousFindRoadsToPreviousIntersectionOf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadsToPreviousIntersectionOf:handler:completionHandler:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)synchronousFindRoadsFromNextIntersectionOf:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  GEOMapFeatureAccess *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __72__GEOMapFeatureAccess_Sync__synchronousFindRoadsFromNextIntersectionOf___block_invoke;
  v12 = &unk_1E1C11A90;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x18D765024](&v9);
  -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v6, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __72__GEOMapFeatureAccess_Sync__synchronousFindRoadsFromNextIntersectionOf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadsFromNextIntersectionOf:handler:completionHandler:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)synchronousFindRoadsToNextIntersectionOf:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  GEOMapFeatureAccess *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __70__GEOMapFeatureAccess_Sync__synchronousFindRoadsToNextIntersectionOf___block_invoke;
  v12 = &unk_1E1C11A90;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x18D765024](&v9);
  -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v6, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __70__GEOMapFeatureAccess_Sync__synchronousFindRoadsToNextIntersectionOf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadsToNextIntersectionOf:handler:completionHandler:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)_synchronousFindWithHandler:(id)a3
{
  uint64_t (**v4)(id, void *, void *);
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _BOOL4 cachedTilesCallbackImmediately;
  NSObject *v10;
  void *v11;
  id v12;
  dispatch_time_t v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *, void *))a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_callbackQueue);
  v5 = (void *)geo_isolater_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__69;
  v26[4] = __Block_byref_object_dispose__69;
  v27 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke;
  v23[3] = &unk_1E1C11AB8;
  v7 = v5;
  v24 = v7;
  v25 = v26;
  v8 = (void *)MEMORY[0x18D765024](v23);
  cachedTilesCallbackImmediately = self->_cachedTilesCallbackImmediately;
  if (self->_cachedTilesCallbackImmediately)
  {
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke_3;
    v21[3] = &unk_1E1C00E10;
    v10 = dispatch_semaphore_create(0);
    v22 = v10;
    v11 = (void *)MEMORY[0x18D765024](v21);

  }
  v12 = (id)v4[2](v4, v8, v11);
  if (!cachedTilesCallbackImmediately)
  {
    v13 = dispatch_time(0, (uint64_t)(self->_syncTimeout * 1000000000.0));
    if (dispatch_semaphore_wait(v10, v13))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetGEOMapFeatureAccessLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = objc_msgSend(v14, "count");
        if (v16 < 2)
        {
          v17 = 0;
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v20 = (void *)v17;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Synchronous call to GEOMapFeatureAccess timed out. Caller:\n    %@", (uint8_t *)&buf, 0xCu);
        if (v16 >= 2)

      }
    }
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__69;
  v31 = __Block_byref_object_dispose__69;
  v32 = 0;
  geo_isolate_sync();
  v18 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v26, 8);
  return v18;
}

void __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  geo_isolate_sync();

}

uint64_t __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
}

intptr_t __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke_151(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ ($7E3FC3C8846FD6918BD0D88F3AA609C8)tileSetInfoForStyle:(int)a3 scale:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v9;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v9 = 2;
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_fromgeod_maximumZoomLevelForStyle:scale:outSize:", v5, v4, &v9);

  return ($7E3FC3C8846FD6918BD0D88F3AA609C8)(v9 | (unint64_t)(v7 << 32));
}

@end
