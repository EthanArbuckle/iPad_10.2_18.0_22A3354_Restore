@implementation GEOMapAccess

- (GEOMapAccess)init
{
  GEOMapAccess *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEOMapAccess;
  v2 = -[GEOMapRequestManager init](&v4, sel_init);
  if (v2)
  {
    if (-[GEOMapAccess init]::onceToken != -1)
      dispatch_once(&-[GEOMapAccess init]::onceToken, &__block_literal_global_214);
    v2->_useMapMatchingTilesetForRoads = 1;
    -[GEOMapAccess setCallbackQueue:](v2, "setCallbackQueue:", MEMORY[0x1E0C80D38]);
  }
  return v2;
}

void __20__GEOMapAccess_init__block_invoke()
{
  void *v0;
  GEOVectorTileDecoder *v1;

  v1 = objc_alloc_init(GEOVectorTileDecoder);
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerTileDecoder:", v1);

}

+ (BOOL)supportsRealisticMap
{
  return +[GEOMapAccess supportsRoadMapAccess](GEOMapAccess, "supportsRoadMapAccess");
}

+ (BOOL)supportsTransitMap
{
  return +[GEOMapAccess supportsTransitMapAccess](GEOMapAccess, "supportsTransitMapAccess");
}

+ (id)realisticMap
{
  GEOMapAccess *v2;

  if (+[GEOMapAccess supportsRoadMapAccess](GEOMapAccess, "supportsRoadMapAccess"))
    v2 = objc_alloc_init(GEOMapAccess);
  else
    v2 = 0;
  return v2;
}

+ (id)transitMap
{
  GEOMapAccess *v2;

  if (+[GEOMapAccess supportsTransitMapAccess](GEOMapAccess, "supportsTransitMapAccess"))
    v2 = objc_alloc_init(GEOMapAccess);
  else
    v2 = 0;
  return v2;
}

+ (id)map
{
  return objc_alloc_init(GEOMapAccess);
}

+ (BOOL)supportsRoadMapAccess
{
  void *v2;
  char v3;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsTileStyle:size:scale:", 53, 2, 0);

  return v3;
}

+ (BOOL)supportsTransitMapAccess
{
  void *v2;
  char v3;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "supportsTileStyle:size:scale:", 37, 2, 0) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "supportsTileStyle:size:scale:", 37, 0, 0);

  return v3;
}

+ (BOOL)supportsBuildingMapAccess
{
  void *v2;
  char v3;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsTileStyle:size:scale:", 11, 2, 0);

  return v3;
}

- (id)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  v5 = (OS_dispatch_queue *)a3;
  if (self->_callbackQueue != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_callbackQueue, a3);
    v5 = v6;
  }

}

- (unsigned)zoomLevel
{
  return -[GEOMapAccess roadsZoomLevel](self, "roadsZoomLevel");
}

- (unsigned)minZoomLevel
{
  return 1;
}

- (unsigned)maxZoomLevel
{
  return -[GEOMapAccess roadsZoomLevel](self, "roadsZoomLevel");
}

- (unsigned)maxTransitZoomLevel
{
  return -[GEOMapAccess transitZoomLevel](self, "transitZoomLevel");
}

- (BOOL)allowsNetworkTileLoad
{
  void *v2;
  void *v3;
  char v4;

  -[GEOMapAccess restrictions](self, "restrictions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "allowsNetworkTileLoad");
  else
    v4 = 0;

  return v4;
}

- (id)findClosestNamedFeaturesAtCoordinate:(id)a3 roadHandler:(id)a4 pointHandler:(id)a5 polygonHandler:(id)a6 completionHandler:(id)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  id v15;
  id v16;
  GEOMapFeatureFinder *v17;
  GEOMapFeatureFinder *v18;
  GEOMapFeatureFinder *v19;

  var1 = a3.var1;
  var0 = a3.var0;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[GEOMapFeatureFinder initWithMap:center:]([GEOMapFeatureFinder alloc], "initWithMap:center:", self, var0, var1);
  -[GEOMapFeatureFinder setIgnoreUnnamedFeatures:](v17, "setIgnoreUnnamedFeatures:", 1);
  -[GEOMapFeatureFinder findFeatures:pointHandler:polygonHandler:completionHandler:](v17, "findFeatures:pointHandler:polygonHandler:completionHandler:", v13, v14, v15, v16);
  if (-[GEOMapRequest isFinished](v17, "isFinished"))
    v18 = 0;
  else
    v18 = v17;
  v19 = v18;

  return v19;
}

- (id)findClosestRoadAtCoordinate:(id)a3 roadHandler:(id)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  GEOMapFeatureFinder *v11;
  GEOMapFeatureFinder *v12;
  GEOMapFeatureFinder *v13;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOMapFeatureFinder initWithMap:center:]([GEOMapFeatureFinder alloc], "initWithMap:center:", self, var0, var1);
  -[GEOMapFeatureFinder findFeatures:pointHandler:polygonHandler:completionHandler:](v11, "findFeatures:pointHandler:polygonHandler:completionHandler:", v9, 0, 0, v10);
  if (-[GEOMapRequest isFinished](v11, "isFinished"))
    v12 = 0;
  else
    v12 = v11;
  v13 = v12;

  return v13;
}

- (id)findRoadEdgesWithin:(double)a3 of:(id)a4 edgeHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  GEOMapEdgeRoadFinder *v13;
  GEOMapEdgeRoadFinder *v14;
  GEOMapEdgeRoadFinder *v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  v13 = -[GEOMapEdgeRoadFinder initWithMap:center:radius:]([GEOMapEdgeRoadFinder alloc], "initWithMap:center:radius:", self, var0, var1, a3);
  -[GEOMapRequest setCompletionHandler:](v13, "setCompletionHandler:", v12);
  -[GEOMapEdgeFinder findEdges:](v13, "findEdges:", v11);
  if (-[GEOMapRequest isFinished](v13, "isFinished"))
    v14 = 0;
  else
    v14 = v13;
  v15 = v14;

  return v15;
}

- (id)findRoadsWithin:(double)a3 of:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__GEOMapAccess_findRoadsWithin_of_handler_completionHandler___block_invoke;
  v15[3] = &unk_1E1C02BA8;
  v15[4] = self;
  v16 = v11;
  v12 = v11;
  -[GEOMapAccess findRoadEdgesWithin:of:edgeHandler:completionHandler:](self, "findRoadEdgesWithin:of:edgeHandler:completionHandler:", v15, a6, a3, var0, var1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __61__GEOMapAccess_findRoadsWithin_of_handler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessRoad *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessRoad *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessRoad alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessRoad initWithMap:roadEdge:](v4, "initWithMap:roadEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)findTransitEdgesWithin:(double)a3 of:(id)a4 edgeHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  GEOMapEdgeTransitFinder *v13;
  GEOMapEdgeTransitFinder *v14;
  GEOMapEdgeTransitFinder *v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  v13 = -[GEOMapEdgeTransitFinder initWithMap:center:radius:]([GEOMapEdgeTransitFinder alloc], "initWithMap:center:radius:", self, var0, var1, a3);
  -[GEOMapRequest setCompletionHandler:](v13, "setCompletionHandler:", v12);
  -[GEOMapEdgeFinder findEdges:](v13, "findEdges:", v11);
  if (-[GEOMapRequest isFinished](v13, "isFinished"))
    v14 = 0;
  else
    v14 = v13;
  v15 = v14;

  return v15;
}

- (id)findTransitLinksWithin:(double)a3 of:(id)a4 linkHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__GEOMapAccess_findTransitLinksWithin_of_linkHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E1C02BA8;
  v15[4] = self;
  v16 = v11;
  v12 = v11;
  -[GEOMapAccess findTransitEdgesWithin:of:edgeHandler:completionHandler:](self, "findTransitEdgesWithin:of:edgeHandler:completionHandler:", v15, a6, a3, var0, var1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __72__GEOMapAccess_findTransitLinksWithin_of_linkHandler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessTransitLink *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessTransitLink *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessTransitLink alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessTransitLink initWithMap:transitEdge:](v4, "initWithMap:transitEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)findTransitPointsWithin:(double)a3 of:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    -[GEOMapAccess _findTransitPointsWithin:of:type:pointHandler:completionHandler:](self, "_findTransitPointsWithin:of:type:pointHandler:completionHandler:", 15, v11, v12, a3, var0, var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)findTransitNodesWithin:(double)a3 of:(id)a4 nodeHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  GEOMapTransitPointFinder *v13;
  GEOMapTransitPointFinder *v14;
  GEOMapTransitPointFinder *v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v13 = -[GEOMapTransitPointFinder initWithMap:center:radius:]([GEOMapTransitPointFinder alloc], "initWithMap:center:radius:", self, var0, var1, a3);
    -[GEOMapRequest setCompletionHandler:](v13, "setCompletionHandler:", v12);
    -[GEOMapTransitPointFinder findTransitPointsOfType:nodeHandler:accessPointHandler:](v13, "findTransitPointsOfType:nodeHandler:accessPointHandler:", 14, v11, 0);
    if (-[GEOMapRequest isFinished](v13, "isFinished"))
      v14 = 0;
    else
      v14 = v13;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)findTransitStationsWithin:(double)a3 of:(id)a4 stationHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__GEOMapAccess_findTransitStationsWithin_of_stationHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E1C02B30;
    v16 = v11;
    -[GEOMapAccess _findTransitPointsWithin:of:type:pointHandler:completionHandler:](self, "_findTransitPointsWithin:of:type:pointHandler:completionHandler:", 4, v15, v12, a3, var0, var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __78__GEOMapAccess_findTransitStationsWithin_of_stationHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitStopsWithin:(double)a3 of:(id)a4 stopHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__GEOMapAccess_findTransitStopsWithin_of_stopHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E1C02B30;
    v16 = v11;
    -[GEOMapAccess _findTransitPointsWithin:of:type:pointHandler:completionHandler:](self, "_findTransitPointsWithin:of:type:pointHandler:completionHandler:", 2, v15, v12, a3, var0, var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __72__GEOMapAccess_findTransitStopsWithin_of_stopHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitHallsWithin:(double)a3 of:(id)a4 hallHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__GEOMapAccess_findTransitHallsWithin_of_hallHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E1C02B30;
    v16 = v11;
    -[GEOMapAccess _findTransitPointsWithin:of:type:pointHandler:completionHandler:](self, "_findTransitPointsWithin:of:type:pointHandler:completionHandler:", 8, v15, v12, a3, var0, var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __72__GEOMapAccess_findTransitHallsWithin_of_hallHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    -[GEOMapAccess _findTransitPointWithID:near:type:pointHandler:completionHandler:](self, "_findTransitPointWithID:near:type:pointHandler:completionHandler:", a3, 15, v11, v12, var0, var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)findTransitNodeWithID:(unint64_t)a3 near:(id)a4 nodeHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  GEOMapTransitPointFinder *v13;
  GEOMapTransitPointFinder *v14;
  GEOMapTransitPointFinder *v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v13 = -[GEOMapTransitPointFinder initWithMap:approxLocation:pointID:]([GEOMapTransitPointFinder alloc], "initWithMap:approxLocation:pointID:", self, a3, var0, var1);
    -[GEOMapRequest setCompletionHandler:](v13, "setCompletionHandler:", v12);
    -[GEOMapTransitPointFinder findTransitPointsOfType:nodeHandler:accessPointHandler:](v13, "findTransitPointsOfType:nodeHandler:accessPointHandler:", 14, v11, 0);
    if (-[GEOMapRequest isFinished](v13, "isFinished"))
      v14 = 0;
    else
      v14 = v13;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)findTransitStationWithID:(unint64_t)a3 near:(id)a4 stationHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__GEOMapAccess_findTransitStationWithID_near_stationHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E1C02B30;
    v16 = v11;
    -[GEOMapAccess _findTransitPointWithID:near:type:pointHandler:completionHandler:](self, "_findTransitPointWithID:near:type:pointHandler:completionHandler:", a3, 4, v15, v12, var0, var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __79__GEOMapAccess_findTransitStationWithID_near_stationHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitStopWithID:(unint64_t)a3 near:(id)a4 stopHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73__GEOMapAccess_findTransitStopWithID_near_stopHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E1C02B30;
    v16 = v11;
    -[GEOMapAccess _findTransitPointWithID:near:type:pointHandler:completionHandler:](self, "_findTransitPointWithID:near:type:pointHandler:completionHandler:", a3, 2, v15, v12, var0, var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __73__GEOMapAccess_findTransitStopWithID_near_stopHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitHallWithID:(unint64_t)a3 near:(id)a4 hallHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73__GEOMapAccess_findTransitHallWithID_near_hallHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E1C02B30;
    v16 = v11;
    -[GEOMapAccess _findTransitPointWithID:near:type:pointHandler:completionHandler:](self, "_findTransitPointWithID:near:type:pointHandler:completionHandler:", a3, 8, v15, v12, var0, var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __73__GEOMapAccess_findTransitHallWithID_near_hallHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findTransitPointWithParentID:(unint64_t)a3 near:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  GEOMapTransitPointFinder *v15;
  uint64_t v16;
  GEOMapTransitPointFinder *v17;
  GEOMapTransitPointFinder *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t *);
  void *v23;
  GEOMapAccess *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  var1 = a4.var1;
  var0 = a4.var0;
  v13 = a6;
  v14 = a7;
  if (v13)
  {
    v15 = -[GEOMapTransitPointFinder initWithMap:approxLocation:parentID:]([GEOMapTransitPointFinder alloc], "initWithMap:approxLocation:parentID:", self, a3, var0, var1);
    -[GEOMapRequest setCompletionHandler:](v15, "setCompletionHandler:", v14);
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __86__GEOMapAccess_findTransitPointWithParentID_near_type_pointHandler_completionHandler___block_invoke;
    v26[3] = &unk_1E1C21B90;
    v26[4] = self;
    v27 = v13;
    v20 = v16;
    v21 = 3221225472;
    v22 = __86__GEOMapAccess_findTransitPointWithParentID_near_type_pointHandler_completionHandler___block_invoke_2;
    v23 = &unk_1E1C21BB8;
    v24 = self;
    v25 = v27;
    -[GEOMapTransitPointFinder findTransitPointsOfType:nodeHandler:accessPointHandler:](v15, "findTransitPointsOfType:nodeHandler:accessPointHandler:", a5, v26, &v20);
    if (-[GEOMapRequest isFinished](v15, "isFinished", v20, v21, v22, v23, v24))
      v17 = 0;
    else
      v17 = v15;
    v18 = v17;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __86__GEOMapAccess_findTransitPointWithParentID_near_type_pointHandler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  v5 = (std::__shared_weak_count *)a2[1];
  v12 = *a2;
  v13 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  objc_msgSend(v2, "_transitPointForTransitMapNode:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);

  v9 = v13;
  if (v13)
  {
    v10 = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void __86__GEOMapAccess_findTransitPointWithParentID_near_type_pointHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessTransitAccessPoint *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessTransitAccessPoint *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessTransitAccessPoint alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessTransitAccessPoint initWithMap:accessPoint:](v4, "initWithMap:accessPoint:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)findBuildingsWithin:(double)a3 of:(id)a4 buildingHandler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  GEOMapBuildingFinder *v13;
  GEOMapBuildingFinder *v14;
  GEOMapBuildingFinder *v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v13 = -[GEOMapBuildingFinder initWithMap:centerCoordinate:radius:]([GEOMapBuildingFinder alloc], "initWithMap:centerCoordinate:radius:", self, var0, var1, a3);
    -[GEOMapRequest setCompletionHandler:](v13, "setCompletionHandler:", v12);
    -[GEOMapBuildingFinder findBuildingsWithHandler:](v13, "findBuildingsWithHandler:", v11);
    if (-[GEOMapRequest isFinished](v13, "isFinished"))
      v14 = 0;
    else
      v14 = v13;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)preloadRoadTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  void *v9;
  id v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a5;
  +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", self, var0, var1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletionHandler:", v10);
  objc_msgSend(v9, "findTiles:", 0);

}

- (void)preloadTransitTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  void *v9;
  id v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a5;
  +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", self, var0, var1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletionHandler:", v10);
  objc_msgSend(v9, "findTiles:", 0);

}

- (void)preloadBuildingTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  void *v9;
  id v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a5;
  +[GEOMapTileFinder buildingsTileFinderForMap:center:radius:](GEOMapTileFinder, "buildingsTileFinderForMap:center:radius:", self, var0, var1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletionHandler:", v10);
  objc_msgSend(v9, "findTiles:", 0);

}

- (BOOL)_hasLoadedTilesNearCoordinate:(id)a3 radius:(double)a4 zoomLevel:(unint64_t)a5 tileStyle:(int)a6 tileSize:(int)a7 tileScale:(int)a8
{
  uint64_t v8;
  char v9;
  char v11;
  double var1;
  double var0;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a8;
  v9 = a7;
  v11 = a5;
  var1 = a3.var1;
  var0 = a3.var0;
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__GEOMapAccess__hasLoadedTilesNearCoordinate_radius_zoomLevel_tileStyle_tileSize_tileScale___block_invoke;
  v20[3] = &unk_1E1C21BE0;
  v22 = &v28;
  v16 = v15;
  v21 = v16;
  v23 = &v24;
  v17 = (void *)MEMORY[0x18D765024](v20);
  GEOTileKeysForCoordinate(v11, a6, v9, v8, v17, var0, var1, a4);
  if (v29[3])
    v18 = *((_BYTE *)v25 + 24) != 0;
  else
    v18 = 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __92__GEOMapAccess__hasLoadedTilesNearCoordinate_radius_zoomLevel_tileStyle_tileSize_tileScale___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  char v6;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "cachedTileForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v3)
    v5 = *(_BYTE *)(v4 + 24) == 0;
  else
    v5 = 1;
  v6 = !v5;
  *(_BYTE *)(v4 + 24) = v6;

}

- (BOOL)hasLoadedRoadTilesNearCoordinate:(id)a3 radius:(double)a4
{
  double var1;
  double var0;
  uint64_t v8;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[GEOMapAccess useMapMatchingTilesetForRoads](self, "useMapMatchingTilesetForRoads"))
    v8 = 53;
  else
    v8 = 18;
  return -[GEOMapAccess _hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:](self, "_hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:", -[GEOMapAccess roadsZoomLevel](self, "roadsZoomLevel"), v8, 2, 0, var0, var1, a4);
}

- (BOOL)hasLoadedTransitTilesNearCoordinate:(id)a3 radius:(double)a4
{
  return -[GEOMapAccess _hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:](self, "_hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:", -[GEOMapAccess transitZoomLevel](self, "transitZoomLevel"), 37, 2, 0, a3.var0, a3.var1, a4);
}

- (BOOL)hasLoadedBuildingTilesNearCoordinate:(id)a3 radius:(double)a4
{
  return -[GEOMapAccess _hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:](self, "_hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:", -[GEOMapAccess buildingsZoomLevel](self, "buildingsZoomLevel"), 11, 2, 0, a3.var0, a3.var1, a4);
}

- (id)findRoadTilesWithin:(double)a3 of:(id)a4 tileHander:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", self, var0, var1, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompletionHandler:", v12);
  objc_msgSend(v13, "findTiles:", v11);
  if (objc_msgSend(v13, "isFinished"))
    v14 = 0;
  else
    v14 = v13;
  v15 = v14;

  return v15;
}

- (id)buildMapEdgeTransitFrom:(const TransitEdgePiece *)a3 edgeHandler:(id)a4
{
  id v6;
  GEOMapEdgeTransitBuilder *v7;
  GEOMapEdgeTransitBuilder *v8;
  GEOMapEdgeTransitBuilder *v9;

  v6 = a4;
  v7 = -[GEOMapEdgeTransitBuilder initWithMap:firstPiece:]([GEOMapEdgeTransitBuilder alloc], "initWithMap:firstPiece:", self, a3);
  -[GEOMapEdgeBuilder buildEdge:](v7, "buildEdge:", v6);
  if (-[GEOMapRequest isFinished](v7, "isFinished"))
    v8 = 0;
  else
    v8 = v7;
  v9 = v8;

  return v9;
}

- (id)_findTransitPointsWithin:(double)a3 of:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  GEOMapTransitPointFinder *v15;
  uint64_t v16;
  id v17;
  GEOMapTransitPointFinder *v18;
  GEOMapTransitPointFinder *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t *);
  void *v24;
  GEOMapAccess *v25;
  id v26;
  _QWORD v27[5];
  id v28;

  var1 = a4.var1;
  var0 = a4.var0;
  v13 = a6;
  v14 = a7;
  v15 = -[GEOMapTransitPointFinder initWithMap:center:radius:]([GEOMapTransitPointFinder alloc], "initWithMap:center:radius:", self, var0, var1, a3);
  -[GEOMapRequest setCompletionHandler:](v15, "setCompletionHandler:", v14);
  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __80__GEOMapAccess__findTransitPointsWithin_of_type_pointHandler_completionHandler___block_invoke;
  v27[3] = &unk_1E1C21B90;
  v27[4] = self;
  v28 = v13;
  v21 = v16;
  v22 = 3221225472;
  v23 = __80__GEOMapAccess__findTransitPointsWithin_of_type_pointHandler_completionHandler___block_invoke_2;
  v24 = &unk_1E1C21BB8;
  v25 = self;
  v17 = v28;
  v26 = v17;
  -[GEOMapTransitPointFinder findTransitPointsOfType:nodeHandler:accessPointHandler:](v15, "findTransitPointsOfType:nodeHandler:accessPointHandler:", a5, v27, &v21);
  if (-[GEOMapRequest isFinished](v15, "isFinished", v21, v22, v23, v24, v25))
    v18 = 0;
  else
    v18 = v15;
  v19 = v18;

  return v19;
}

void __80__GEOMapAccess__findTransitPointsWithin_of_type_pointHandler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  v5 = (std::__shared_weak_count *)a2[1];
  v12 = *a2;
  v13 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  objc_msgSend(v2, "_transitPointForTransitMapNode:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);

  v9 = v13;
  if (v13)
  {
    v10 = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void __80__GEOMapAccess__findTransitPointsWithin_of_type_pointHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessTransitAccessPoint *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessTransitAccessPoint *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessTransitAccessPoint alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessTransitAccessPoint initWithMap:accessPoint:](v4, "initWithMap:accessPoint:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)_findTransitPointWithID:(unint64_t)a3 near:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  GEOMapTransitPointFinder *v15;
  uint64_t v16;
  GEOMapTransitPointFinder *v17;
  GEOMapTransitPointFinder *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t *);
  void *v23;
  GEOMapAccess *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  var1 = a4.var1;
  var0 = a4.var0;
  v13 = a6;
  v14 = a7;
  if (v13)
  {
    v15 = -[GEOMapTransitPointFinder initWithMap:approxLocation:pointID:]([GEOMapTransitPointFinder alloc], "initWithMap:approxLocation:pointID:", self, a3, var0, var1);
    -[GEOMapRequest setCompletionHandler:](v15, "setCompletionHandler:", v14);
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __81__GEOMapAccess__findTransitPointWithID_near_type_pointHandler_completionHandler___block_invoke;
    v26[3] = &unk_1E1C21B90;
    v26[4] = self;
    v27 = v13;
    v20 = v16;
    v21 = 3221225472;
    v22 = __81__GEOMapAccess__findTransitPointWithID_near_type_pointHandler_completionHandler___block_invoke_2;
    v23 = &unk_1E1C21BB8;
    v24 = self;
    v25 = v27;
    -[GEOMapTransitPointFinder findTransitPointsOfType:nodeHandler:accessPointHandler:](v15, "findTransitPointsOfType:nodeHandler:accessPointHandler:", a5, v26, &v20);
    if (-[GEOMapRequest isFinished](v15, "isFinished", v20, v21, v22, v23, v24))
      v17 = 0;
    else
      v17 = v15;
    v18 = v17;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __81__GEOMapAccess__findTransitPointWithID_near_type_pointHandler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  v5 = (std::__shared_weak_count *)a2[1];
  v12 = *a2;
  v13 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  objc_msgSend(v2, "_transitPointForTransitMapNode:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);

  v9 = v13;
  if (v13)
  {
    v10 = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void __81__GEOMapAccess__findTransitPointWithID_near_type_pointHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessTransitAccessPoint *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessTransitAccessPoint *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessTransitAccessPoint alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessTransitAccessPoint initWithMap:accessPoint:](v4, "initWithMap:accessPoint:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)_transitPointForTransitMapNode:(shared_ptr<geo::MapNodeTransit>)a3
{
  uint64_t v3;
  MapNodeTransit *ptr;
  int v6;
  GEOMapAccessTransitStop *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  GEOMapAccessTransitStop *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  GEOMapAccessTransitStation *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  if (!*(_QWORD *)a3.__ptr_)
    goto LABEL_12;
  v3 = *(_QWORD *)(*(_QWORD *)a3.__ptr_ + 40);
  if (!v3)
    goto LABEL_12;
  ptr = a3.__ptr_;
  v6 = *(char *)(v3 + 272);
  if (v6 != 1)
  {
    if (!v6)
    {
      v7 = [GEOMapAccessTransitStop alloc];
      v8 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
      v23 = *(_QWORD *)ptr;
      v24 = v8;
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      v11 = -[GEOMapAccessTransitNodeBase initWithMap:node:](v7, "initWithMap:node:", self, &v23);
      v12 = v24;
      if (v24)
      {
        v13 = (unint64_t *)&v24->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        goto LABEL_20;
      }
      return v11;
    }
LABEL_12:
    v11 = 0;
    return v11;
  }
  v16 = [GEOMapAccessTransitStation alloc];
  v17 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v21 = *(_QWORD *)ptr;
  v22 = v17;
  if (v17)
  {
    v18 = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  v11 = -[GEOMapAccessTransitNodeBase initWithMap:node:](v16, "initWithMap:node:", self, &v21);
  v12 = v22;
  if (v22)
  {
    v20 = (unint64_t *)&v22->__shared_owners_;
    do
      v14 = __ldaxr(v20);
    while (__stlxr(v14 - 1, v20));
LABEL_20:
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11;
}

- (unint64_t)roadsZoomLevel
{
  void *v2;
  unint64_t v3;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mapMatchingZoomLevel");

  return v3;
}

- (unint64_t)transitZoomLevel
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "activeTileSetForTileType:scale:", 37, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maximumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);

  return v5;
}

- (unint64_t)buildingsZoomLevel
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "activeTileSetForTileType:scale:", 11, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maximumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);

  return v5;
}

- (GEOMapAccessRestrictions)restrictions
{
  return (GEOMapAccessRestrictions *)objc_loadWeakRetained((id *)&self->_restrictions);
}

- (void)setRestrictions:(id)a3
{
  objc_storeWeak((id *)&self->_restrictions, a3);
}

- (id)tileErrorHandler
{
  return self->_tileErrorHandler;
}

- (void)setTileErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)useMapMatchingTilesetForRoads
{
  return self->_useMapMatchingTilesetForRoads;
}

- (void)setUseMapMatchingTilesetForRoads:(BOOL)a3
{
  self->_useMapMatchingTilesetForRoads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tileErrorHandler, 0);
  objc_destroyWeak((id *)&self->_restrictions);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
