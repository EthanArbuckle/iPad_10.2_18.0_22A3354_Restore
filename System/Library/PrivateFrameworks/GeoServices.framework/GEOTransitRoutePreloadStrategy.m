@implementation GEOTransitRoutePreloadStrategy

- (GEOTransitRoutePreloadStrategy)init
{
  GEOTransitRoutePreloadStrategy *v2;
  uint64_t v3;
  OS_dispatch_queue *workQueue;
  NSObject *v5;
  double radialDistanceToImplicateTilesMeters;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)GEOTransitRoutePreloadStrategy;
  v2 = -[GEOTransitRoutePreloadStrategy init](&v9, sel_init);
  if (v2)
  {
    v3 = geo_dispatch_queue_create();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v2->_tilesRequested = 0;
    v2->_radialDistanceToImplicateTilesMeters = GEOConfigGetDouble(GeoServicesConfig_RadialDistanceToImplicateTransitTilesForACoordinate, (uint64_t)off_1EDF4CE68);
    v2->_stepSizeInMeters = GEOConfigGetDouble(GeoServicesConfig_StepSizeInMeters, (uint64_t)off_1EDF4CE48);
    GEOGetRoutePreloaderLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      radialDistanceToImplicateTilesMeters = v2->_radialDistanceToImplicateTilesMeters;
      *(_DWORD *)buf = 134217984;
      v11 = radialDistanceToImplicateTilesMeters;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Chosen radial distance to implicate tiles in meters: %f", buf, 0xCu);
    }

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTileGroupObserver:queue:", v2, v2->_workQueue);

  }
  return v2;
}

- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v7;
  NSMutableDictionary *v9;
  NSMutableDictionary *tileSetStyles;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  if (!self->_tileSetStyles)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tileSetStyles = self->_tileSetStyles;
    self->_tileSetStyles = v9;

  }
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTileGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeTileSetForTileType:scale:", v7, 0);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v5 && (int)v5 >= (int)a4)
  {
    do
    {
      v13 = objc_msgSend(v24, "largestZoomLevelLEQ:inRect:", v5, 0.0, 0.0, 268435456.0, 268435456.0);
      v5 = (v13 - 1);
      if ((int)v13 >= 1)
      {
        v14 = self->_tileSetStyles;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v18 = self->_tileSetStyles;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, v19);

        }
        v20 = self->_tileSetStyles;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v20, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v23);

      }
    }
    while ((int)v13 > (int)a4);
  }

}

- (void)observedNetworkQualityDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__GEOTransitRoutePreloadStrategy_observedNetworkQualityDidChangeFrom_to___block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __73__GEOTransitRoutePreloadStrategy_observedNetworkQualityDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryFailuresWithErrorsReset:", 1);
}

- (void)_retryFailuresWithErrorsReset:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  unint64_t v6;

  if (self->_enabled)
  {
    v3 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
    v6 = objc_msgSend(WeakRetained, "networkQuality");

    if (v6 >= 4)
    {
      if (v3)
        -[GEOTransitRoutePreloadStrategy _resetErrorCounts](self, "_resetErrorCounts");
      -[GEOTransitRoutePreloadStrategy _performNextRequests](self, "_performNextRequests");
    }
  }
}

- (void)_resetErrorCounts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[_GEOTransitRoutePreloaderData preloadBatches](self->_reserved, "preloadBatches", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 40) = 0;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)performTearDown
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__GEOTransitRoutePreloadStrategy_performTearDown__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

uint64_t __49__GEOTransitRoutePreloadStrategy_performTearDown__block_invoke(uint64_t a1)
{
  void *v2;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeTileGroupObserver:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

- (void)setTraits:(id)a3
{
  GEOMapServiceTraits *v5;
  GEOMapServiceTraits **p_traits;
  GEOMapServiceTraits *traits;
  GEOMapServiceTraits *v8;

  v5 = (GEOMapServiceTraits *)a3;
  traits = self->_traits;
  p_traits = &self->_traits;
  if (traits != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_traits, a3);
    v5 = v8;
  }

}

- (int64_t)tilesRequested
{
  return self->_tilesRequested;
}

- (void)setShouldPreloadEntireRoute:(BOOL)a3
{
  self->_shouldPreloadEntireRoute = a3;
}

- (void)updateWithRoute:(id)a3 routeMatch:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__GEOTransitRoutePreloadStrategy_updateWithRoute_routeMatch___block_invoke;
  block[3] = &unk_1E1C05D70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

_BYTE *__61__GEOTransitRoutePreloadStrategy_updateWithRoute_routeMatch___block_invoke(id *a1)
{
  id v2;
  double v3;
  double v4;
  _BYTE *result;

  objc_storeStrong((id *)a1[4] + 11, a1[5]);
  v2 = a1[6];
  if (v2)
  {
    v3 = (double)objc_msgSend(v2, "routeCoordinate");
    v4 = v3 + COERCE_FLOAT((unint64_t)objc_msgSend(a1[6], "routeCoordinate") >> 32);
  }
  else
  {
    v4 = 0.0;
  }
  *((double *)a1[4] + 13) = v4;
  result = a1[4];
  if (result[128])
  {
    objc_msgSend(result, "_stop");
    result = (_BYTE *)objc_msgSend(a1[4], "_start");
  }
  if (a1[6])
    return (_BYTE *)objc_msgSend(a1[4], "_performNextRequests");
  return result;
}

- (void)updateWithRouteMatch:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__GEOTransitRoutePreloadStrategy_updateWithRouteMatch___block_invoke;
  v7[3] = &unk_1E1BFFF48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

uint64_t __55__GEOTransitRoutePreloadStrategy_updateWithRouteMatch___block_invoke(uint64_t a1)
{
  double v2;

  v2 = (double)objc_msgSend(*(id *)(a1 + 40), "routeCoordinate");
  *(double *)(*(_QWORD *)(a1 + 32) + 104) = v2
                                            + COERCE_FLOAT((unint64_t)objc_msgSend(*(id *)(a1 + 40), "routeCoordinate") >> 32);
  return objc_msgSend(*(id *)(a1 + 32), "_performNextRequests");
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)start
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__GEOTransitRoutePreloadStrategy_start__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __39__GEOTransitRoutePreloadStrategy_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  void *v3;
  void *v4;
  void *v5;
  _GEOTransitRoutePreloaderData *v6;
  _GEOTransitRoutePreloaderData *reserved;
  void *v8;
  void *v9;

  if (self->_enabled)
    -[GEOTransitRoutePreloadStrategy _stop](self, "_stop");
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GEOTileLoaderClientIdentifier(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openForClient:", v4);

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openServerConnection");

  if (!self->_tileSetStyles)
  {
    -[GEOTransitRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:](self, "addTileSetStyle:betweenZoom:andZoom:", 1, 13, 15);
    -[GEOTransitRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:](self, "addTileSetStyle:betweenZoom:andZoom:", 11, 13, 15);
    -[GEOTransitRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:](self, "addTileSetStyle:betweenZoom:andZoom:", 13, 13, 15);
    -[GEOTransitRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:](self, "addTileSetStyle:betweenZoom:andZoom:", 37, 13, 15);
  }
  self->_enabled = 1;
  v6 = objc_alloc_init(_GEOTransitRoutePreloaderData);
  reserved = self->_reserved;
  self->_reserved = v6;

  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GEOTileLoaderClientIdentifier(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginPreloadSessionOfSize:forClient:", 0, v9);

  self->_currentRoutePosition = 0.0;
  self->_endRoutePosition = 0.0;
  -[GEOTransitRoutePreloadStrategy _performNextRequests](self, "_performNextRequests");
}

- (void)stop
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__GEOTransitRoutePreloadStrategy_stop__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __38__GEOTransitRoutePreloadStrategy_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

- (void)_stop
{
  void *v3;
  id v4;
  id v5;

  if (self->_enabled)
  {
    self->_enabled = 0;
    -[GEOTransitRoutePreloadStrategy _cancelAllBatches](self, "_cancelAllBatches");
    +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    GEOTileLoaderClientIdentifier(self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "closeForClient:", v3);

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "closeServerConnection");

  }
}

- (void)_cancelAllBatches
{
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  GEOGetRoutePreloaderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "[TransitStrategy] Canceling all batches.", buf, 2u);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[_GEOTransitRoutePreloaderData preloadBatches](self->_reserved, "preloadBatches");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v4)
  {
    v22 = *(_QWORD *)v30;
    *(_QWORD *)&v5 = 138412290;
    v20 = v5;
    do
    {
      v23 = v4;
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i) + 24);
        if (v7 != 2 && v7 != 5)
        {
          v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          GEOGetRoutePreloaderLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)v24, "description");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v35 = v10;
            _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Cancelling batch: %@", buf, 0xCu);

          }
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend((id)v24, "tilesToLoad");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v11, "copy");

          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v26 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
                +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader", v20);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                GEOTileLoaderClientIdentifier(self);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "cancelKey:forClient:", v16, v18);

              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v13);
          }

          objc_msgSend(*(id *)(v24 + 120), "cancel");
          v19 = *(void **)(v24 + 120);
          *(_QWORD *)(v24 + 120) = 0;

          *(_QWORD *)(v24 + 24) = 5;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v4);
  }

}

- (PolylineCoordinate)_polylineCoordinateForDouble:(double)a3
{
  unsigned int v3;
  float v4;

  v3 = a3;
  v4 = a3 - (double)a3;
  if (v4 >= 1.0)
  {
    v3 += vcvtms_u32_f32(v4);
    v4 = v4 - (float)floorf(v4);
  }
  return (PolylineCoordinate)(v3 | ((unint64_t)LODWORD(v4) << 32));
}

- (void)_performNextRequests
{
  GEOComposedRoute *route;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Double;
  double v13;
  int downloadState;
  id WeakRetained;
  uint64_t v16;
  uint64_t v17;
  double stepSizeInMeters;
  double v19;
  uint64_t *v20;
  uint64_t *v21;
  double *v22;
  double *v23;
  double v24;
  double v25;
  PolylineCoordinate v26;
  unint64_t v27;
  unint64_t indexOfLastStepWithPreparedBatch;
  unint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (self->_enabled)
  {
    route = self->_route;
    if (route)
    {
      if (-[GEOComposedRoute pointCount](route, "pointCount") >= 2)
      {
        v4 = vcvtad_u64_f64(self->_currentRoutePosition);
        if (-[GEOComposedRoute pointCount](self->_route, "pointCount") <= v4)
          v5 = -[GEOComposedRoute pointCount](self->_route, "pointCount");
        else
          v5 = vcvtad_u64_f64(self->_currentRoutePosition);
        v6 = vcvtad_u64_f64(self->_endRoutePosition);
        if (-[GEOComposedRoute pointCount](self->_route, "pointCount") <= v6)
          v7 = -[GEOComposedRoute pointCount](self->_route, "pointCount");
        else
          v7 = vcvtad_u64_f64(self->_endRoutePosition);
        -[GEOComposedRoute distanceFromPointIndex:toPointIndex:](self->_route, "distanceFromPointIndex:toPointIndex:", 0, v5);
        v9 = v8 / 1000.0;
        -[GEOComposedRoute distanceFromPointIndex:toPointIndex:](self->_route, "distanceFromPointIndex:toPointIndex:", 0, v7);
        v11 = v10 / 1000.0;
        Double = GEOConfigGetDouble(GeoServicesConfig_TransitMaxDistanceAheadToPreload, (uint64_t)off_1EDF4CE38);
        if (self->_shouldPreloadEntireRoute)
        {
          -[GEOComposedRoute distance](self->_route, "distance", Double);
          Double = v13 / 1000.0;
        }
        if (v11 - v9 <= Double)
        {
          downloadState = self->_downloadState;
          WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
          v16 = objc_msgSend(WeakRetained, "networkQuality");
          v17 = 0;
          stepSizeInMeters = self->_stepSizeInMeters;
          while (_downloadTruthTable[v17] != v16)
          {
            v17 += 5;
            if (v17 == 35)
            {
              v19 = 0.0;
              goto LABEL_24;
            }
          }
          v20 = &_downloadTruthTable[v17];
          v21 = v20 + 3;
          if (v9 <= 10.0)
            v21 = v20 + 1;
          v22 = (double *)(v20 + 4);
          v23 = (double *)(v20 + 2);
          if (v9 > 10.0)
            v23 = v22;
          if (downloadState)
            v23 = (double *)v21;
          v19 = *v23 * 1000.0;
LABEL_24:

          if (self->_shouldPreloadEntireRoute)
          {
            -[GEOComposedRoute distance](self->_route, "distance");
            v25 = v24;
          }
          else
          {
            v25 = stepSizeInMeters * (double)(uint64_t)(v19 / stepSizeInMeters);
          }
          if (v25 > 2.22044605e-16)
          {
            v26 = -[GEOComposedRoute coordinateAtOffset:fromRouteCoordinate:](self->_route, "coordinateAtOffset:fromRouteCoordinate:", -[GEOTransitRoutePreloadStrategy _polylineCoordinateForDouble:](self, "_polylineCoordinateForDouble:", self->_currentRoutePosition), v25);
            self->_endRoutePosition = (float)((float)v26.index + v26.offset);
            v27 = -[GEOComposedRoute stepIndexForPointIndex:](self->_route, "stepIndexForPointIndex:", (unint64_t)self->_currentRoutePosition);
            indexOfLastStepWithPreparedBatch = self->_indexOfLastStepWithPreparedBatch;
            if (v27 > indexOfLastStepWithPreparedBatch)
              indexOfLastStepWithPreparedBatch = -[GEOComposedRoute stepIndexForPointIndex:](self->_route, "stepIndexForPointIndex:", (unint64_t)self->_currentRoutePosition);
            v29 = -[GEOComposedRoute stepIndexForPointIndex:](self->_route, "stepIndexForPointIndex:", (unint64_t)self->_endRoutePosition);
            if (indexOfLastStepWithPreparedBatch != v29
              || indexOfLastStepWithPreparedBatch != self->_indexOfLastStepWithPreparedBatch)
            {
              v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              v41 = 0u;
              -[GEOComposedRoute steps](self->_route, "steps", 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
              if (v32)
              {
                v33 = *(_QWORD *)v39;
                do
                {
                  for (i = 0; i != v32; ++i)
                  {
                    if (*(_QWORD *)v39 != v33)
                      objc_enumerationMutation(v31);
                    v35 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                    if (objc_msgSend(v35, "stepIndex") >= indexOfLastStepWithPreparedBatch)
                    {
                      if (objc_msgSend(v35, "stepIndex") > v29)
                        goto LABEL_46;
                      v36 = self->_indexOfLastStepWithPreparedBatch;
                      if (v36 <= objc_msgSend(v35, "stepIndex"))
                        v37 = objc_msgSend(v35, "stepIndex");
                      else
                        v37 = self->_indexOfLastStepWithPreparedBatch;
                      self->_indexOfLastStepWithPreparedBatch = v37;
                      if (objc_msgSend(v35, "pointCount") >= 2)
                        objc_msgSend(v30, "addObject:", v35);
                    }
                  }
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
                }
                while (v32);
              }
LABEL_46:

              -[GEOTransitRoutePreloadStrategy _makeBatchesForSteps:](self, "_makeBatchesForSteps:", v30);
              -[GEOTransitRoutePreloadStrategy _makeBatchForTilesAroundStationsForSteps:](self, "_makeBatchForTilesAroundStationsForSteps:", v30);

            }
            -[GEOTransitRoutePreloadStrategy _processBatches](self, "_processBatches");
          }
        }
      }
    }
  }
}

- (void)_ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__GEOTransitRoutePreloadStrategy__ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList___block_invoke;
  v15[3] = &unk_1E1C062A0;
  v15[4] = self;
  objc_msgSend(v4, "removeKeysMatchingPredicate:", v15);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[_GEOTransitRoutePreloaderData tilesLoadingOrLoaded](self->_reserved, "tilesLoadingOrLoaded", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addKey:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

}

uint64_t __113__GEOTransitRoutePreloadStrategy__ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "tilesLoadingOrLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsKey:", a2);

  return v4;
}

- (void)_makeBatchForTilesAroundStationsForSteps:(id)a3
{
  _GEOTransitPreloadBatch *v4;
  GEOTileKeyList *v5;
  _GEOTransitPreloadCamera *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOMapServiceTicket *placeDataRequestTicketForBatch;
  void *v14;
  int64_t tilesRequested;
  id v16;

  v16 = a3;
  v4 = objc_alloc_init(_GEOTransitPreloadBatch);
  v5 = objc_alloc_init(GEOTileKeyList);
  v6 = objc_alloc_init(_GEOTransitPreloadCamera);
  for (i = 0; i < objc_msgSend(v16, "count"); ++i)
  {
    objc_msgSend(v16, "objectAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startingStop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endingStop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "latLng");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coordinate");
      -[_GEOTransitPreloadCamera implicateTilesForCoordinate:into:radialDistance:tileSetStyles:](v6, "implicateTilesForCoordinate:into:radialDistance:tileSetStyles:", v5, self->_tileSetStyles);

    }
    if (v10)
    {
      objc_msgSend(v10, "latLng");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "coordinate");
      -[_GEOTransitPreloadCamera implicateTilesForCoordinate:into:radialDistance:tileSetStyles:](v6, "implicateTilesForCoordinate:into:radialDistance:tileSetStyles:", v5, self->_tileSetStyles);

    }
  }
  -[GEOTransitRoutePreloadStrategy _ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:](self, "_ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:", v5);
  if (_MergedGlobals_21 != -1)
    dispatch_once(&_MergedGlobals_21, &__block_literal_global_248);
  v4->priority = _MergedGlobals_169;
  v4->status = 0;
  v4->generation = -[_GEOTransitRoutePreloaderData currentBatchGeneration](self->_reserved, "currentBatchGeneration");
  placeDataRequestTicketForBatch = v4->placeDataRequestTicketForBatch;
  v4->placeDataRequestTicketForBatch = 0;

  if (-[GEOTileKeyList count](v5, "count"))
  {
    -[_GEOTransitPreloadBatch setTilesToLoad:](v4, "setTilesToLoad:", v5);
    -[_GEOTransitRoutePreloaderData preloadBatches](self->_reserved, "preloadBatches");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v4);

    tilesRequested = self->_tilesRequested;
    self->_tilesRequested = -[GEOTileKeyList count](v5, "count") + tilesRequested;
  }
  else
  {
    -[_GEOTransitPreloadBatch setTilesToLoad:](v4, "setTilesToLoad:", 0);
  }

}

- (void)_makePreloadBatchForSteps:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GEOTransitRoutePreloadStrategy _makePreloadBatchForPlaceDataOnSteps:](self, "_makePreloadBatchForPlaceDataOnSteps:", v4);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "shouldPreloadWithHighPriority", (_QWORD)v13))
          v12 = v5;
        else
          v12 = v6;
        objc_msgSend(v12, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    if (_MergedGlobals_21 != -1)
      dispatch_once(&_MergedGlobals_21, &__block_literal_global_248);
    -[GEOTransitRoutePreloadStrategy _makePreloadBatchForTilesOnRouteWithSteps:andPriority:](self, "_makePreloadBatchForTilesOnRouteWithSteps:andPriority:", v5, _MergedGlobals_169, (_QWORD)v13);
  }
  if (objc_msgSend(v6, "count", (_QWORD)v13))
  {
    if (qword_1EDF4FC78 != -1)
      dispatch_once(&qword_1EDF4FC78, &__block_literal_global_249);
    -[GEOTransitRoutePreloadStrategy _makePreloadBatchForTilesOnRouteWithSteps:andPriority:](self, "_makePreloadBatchForTilesOnRouteWithSteps:andPriority:", v6, dword_1ECDBAB44);
  }

}

- (void)_makePreloadBatchForPlaceDataOnSteps:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  _GEOTransitPreloadBatch *v9;
  unint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  GEOMapServiceTicket *placeDataRequestTicketForBatch;
  void *v37;
  BOOL v38;
  void *v39;
  id v40;
  unint64_t UInteger;
  void *v42;
  unint64_t v43;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  UInteger = GEOConfigGetUInteger(GeoServicesConfig_PreloadBatchMuidCountThreshold, (uint64_t)off_1EDF4CE18);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v4 = v40;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v48 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v5);
  }

  v43 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0.0;
  while (v43 < objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v12;
    if (!v9)
      v9 = objc_alloc_init(_GEOTransitPreloadBatch);
    objc_msgSend(v12, "startingStop");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endingStop");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      -[GEOComposedRoute getHallForStop:](self->_route, "getHallForStop:");
      v13 = objc_claimAutoreleasedReturnValue();
      -[GEOComposedRoute getStationForHall:](self->_route, "getStationForHall:", v13);
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    if (v45)
    {
      -[GEOComposedRoute getHallForStop:](self->_route, "getHallForStop:");
      v16 = objc_claimAutoreleasedReturnValue();
      -[GEOComposedRoute getStationForHall:](self->_route, "getStationForHall:", v16);
      v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    if (objc_msgSend(v46, "hasMuid"))
    {
      -[_GEOTransitPreloadBatch placeDatasToLoad](v9, "placeDatasToLoad");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

      v11 = fmax(v11, (double)objc_msgSend(v42, "startTime"));
      ++v10;
    }
    if (objc_msgSend(v45, "hasMuid"))
    {
      -[_GEOTransitPreloadBatch placeDatasToLoad](v9, "placeDatasToLoad");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

      if (v43 + 1 >= objc_msgSend(v3, "count"))
      {
        -[GEOComposedRoute suggestedRoute](self->_route, "suggestedRoute");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "absEndTime");
      }
      else
      {
        objc_msgSend(v3, "objectAtIndex:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "startTime");
      }
      v25 = v24;

      v11 = fmax(v11, (double)v25);
      ++v10;
    }
    if (objc_msgSend(v14, "hasMuid"))
    {
      -[_GEOTransitPreloadBatch placeDatasToLoad](v9, "placeDatasToLoad");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v27);

      ++v10;
    }
    if (objc_msgSend(v17, "hasMuid"))
    {
      -[_GEOTransitPreloadBatch placeDatasToLoad](v9, "placeDatasToLoad");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v29);

      ++v10;
    }
    if (objc_msgSend(v15, "hasMuid"))
    {
      -[_GEOTransitPreloadBatch placeDatasToLoad](v9, "placeDatasToLoad");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v31);

      ++v10;
    }
    if (objc_msgSend(v18, "hasMuid"))
    {
      -[_GEOTransitPreloadBatch placeDatasToLoad](v9, "placeDatasToLoad");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v33);

      ++v10;
    }
    if (v10 >= UInteger
      || (objc_msgSend(v3, "lastObject"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = v42 == v34,
          v34,
          v35))
    {
      -[_GEOTransitPreloadBatch setTilesToLoad:](v9, "setTilesToLoad:", 0);
      if (qword_1EDF4FC78 != -1)
        dispatch_once(&qword_1EDF4FC78, &__block_literal_global_249);
      v9->priority = dword_1ECDBAB44;
      v9->status = 0;
      v9->generation = -[_GEOTransitRoutePreloaderData currentBatchGeneration](self->_reserved, "currentBatchGeneration");
      placeDataRequestTicketForBatch = v9->placeDataRequestTicketForBatch;
      v9->placeDataRequestTicketForBatch = 0;

      v9->endTimeForScheduleFreshness = v11;
      -[_GEOTransitPreloadBatch placeDatasToLoad](v9, "placeDatasToLoad");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count") == 0;

      if (!v38)
      {
        -[_GEOTransitRoutePreloaderData preloadBatches](self->_reserved, "preloadBatches");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v9);

      }
      v9 = 0;
      v10 = 0;
    }

    ++v43;
  }
  if (v9)

}

- (void)_makePreloadBatchForTilesOnRouteWithSteps:(id)a3 andPriority:(unsigned int)a4
{
  unsigned int v6;
  _GEOTransitPreloadBatch *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  void **p_begin;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  double *v20;
  char *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double *v28;
  double *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  double *v37;
  _OWORD *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  int v50;
  double v51;
  int v52;
  double v53;
  int v54;
  int v55;
  int v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double *v61;
  int v62;
  double *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  float64x2_t *v80;
  GEOLatLng *v81;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  char *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v84;
  char *begin;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v92;
  NSObject *v93;
  uint64_t v94;
  GEOMapServiceTicket *placeDataRequestTicketForBatch;
  void *v96;
  int64_t tilesRequested;
  id v98;
  unsigned int v99;
  id obj;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _GEOTransitPreloadCamera *v104;
  GEOTileKeyList *v105;
  float64x2_t v106;
  double *__p;
  double *v108;
  char *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  void *v114;
  char *v115;
  char *v116;
  uint8_t buf[32];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v98 = a3;
  v6 = -[GEOComposedRoute pointCount](self->_route, "pointCount");
  v105 = objc_alloc_init(GEOTileKeyList);
  v7 = objc_alloc_init(_GEOTransitPreloadBatch);
  v114 = 0;
  v115 = 0;
  v116 = 0;
  -[GEOComposedRoute pointAt:](self->_route, "pointAt:", 0);
  v9 = GEOMapPointsPerMeterAtLatitude(v8);
  v104 = objc_alloc_init(_GEOTransitPreloadCamera);
  v99 = a4;
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  obj = v98;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
  if (v10)
  {
    v11 = 500.0 / (1.0 / v9);
    v101 = *(_QWORD *)v111;
    p_begin = (void **)&v7->coords.__begin_;
    do
    {
      v13 = 0;
      v102 = v10;
      do
      {
        if (*(_QWORD *)v111 != v101)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v13);
        memset(buf, 0, 24);
        v15 = objc_msgSend(v14, "pointRange");
        __p = 0;
        v108 = 0;
        v109 = 0;
        v103 = v13;
        if (!v16 || ((v17 = v15, v18 = v15 + v16, v15 < v15 + v16) ? (v19 = v15 + v16 - 1 >= v6) : (v19 = 1), v19))
        {
          v20 = 0;
          v21 = 0;
        }
        else
        {
          do
          {
            -[GEOComposedRoute pointAt:](self->_route, "pointAt:", v17);
            v24 = GEOTilePointForCoordinate(v22, v23, 20.0);
            v26 = v24;
            v27 = v25;
            v28 = v108;
            if (v108 >= (double *)v109)
            {
              v29 = __p;
              v30 = ((char *)v108 - (char *)__p) >> 4;
              v31 = v30 + 1;
              if ((unint64_t)(v30 + 1) >> 60)
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              v32 = v109 - (char *)__p;
              if ((v109 - (char *)__p) >> 3 > v31)
                v31 = v32 >> 3;
              if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0)
                v33 = 0xFFFFFFFFFFFFFFFLL;
              else
                v33 = v31;
              if (v33)
              {
                v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v109, v33);
                v29 = __p;
                v28 = v108;
              }
              else
              {
                v34 = 0;
              }
              v35 = &v34[16 * v30];
              *(double *)v35 = v26;
              *((_QWORD *)v35 + 1) = v27;
              v36 = v35;
              if (v28 != v29)
              {
                do
                {
                  *((_OWORD *)v36 - 1) = *((_OWORD *)v28 - 1);
                  v36 -= 16;
                  v28 -= 2;
                }
                while (v28 != v29);
                v29 = __p;
              }
              v21 = v35 + 16;
              __p = (double *)v36;
              v109 = &v34[16 * v33];
              if (v29)
                operator delete(v29);
            }
            else
            {
              *v108 = v24;
              *((_QWORD *)v108 + 1) = v25;
              v21 = (char *)(v108 + 2);
            }
            v108 = (double *)v21;
            ++v17;
          }
          while (v17 != v18);
          v20 = __p;
        }
        std::vector<GEOLocationCoordinate2D>::reserve((void **)buf, (v21 - (char *)v20) >> 4);
        v37 = __p;
        v38 = *(_OWORD **)&buf[8];
        while (v37 != v108)
        {
          if ((unint64_t)v38 >= *(_QWORD *)&buf[16])
          {
            v39 = ((uint64_t)v38 - *(_QWORD *)buf) >> 4;
            if ((unint64_t)(v39 + 1) >> 60)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v40 = (uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 3;
            if (v40 <= v39 + 1)
              v40 = v39 + 1;
            if (*(_QWORD *)&buf[16] - *(_QWORD *)buf >= 0x7FFFFFFFFFFFFFF0uLL)
              v41 = 0xFFFFFFFFFFFFFFFLL;
            else
              v41 = v40;
            if (v41)
              v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&buf[16], v41);
            else
              v42 = 0;
            v43 = &v42[16 * v39];
            *(_OWORD *)v43 = *(_OWORD *)v37;
            v45 = *(char **)buf;
            v44 = *(char **)&buf[8];
            v46 = v43;
            if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
            {
              do
              {
                *((_OWORD *)v46 - 1) = *((_OWORD *)v44 - 1);
                v46 -= 16;
                v44 -= 16;
              }
              while (v44 != v45);
              v44 = *(char **)buf;
            }
            v38 = v43 + 16;
            *(_QWORD *)buf = v46;
            *(_QWORD *)&buf[8] = v43 + 16;
            *(_QWORD *)&buf[16] = &v42[16 * v41];
            if (v44)
              operator delete(v44);
          }
          else
          {
            *v38++ = *(_OWORD *)v37;
          }
          *(_QWORD *)&buf[8] = v38;
          v37 += 2;
        }
        v47 = *(_QWORD *)buf;
        v48 = ((unint64_t)v38 - *(_QWORD *)buf) >> 4;
        v49 = v48 - 1;
        if ((int)v48 <= 1)
          v50 = 1;
        else
          v50 = ((unint64_t)v38 - *(_QWORD *)buf) >> 4;
        v51 = (double)(v50 - 1);
        v52 = 2;
        v53 = 0.0;
        do
        {
          v54 = (int)v53;
          if (v49 >= (int)v53 + 1)
            v55 = v54 + 1;
          else
            v55 = v48 - 1;
          v56 = vcvtmd_s64_f64(v53 + 1.0);
          if ((int)v48 <= v56)
          {
LABEL_64:
            --v52;
            v68 = v51;
          }
          else
          {
            v57 = floor(v53 + 1.0);
            v58 = v11;
            v59 = v53;
            while (1)
            {
              v60 = v59 - floor(v59);
              v61 = (double *)(v47 + 16 * (int)v59);
              v62 = v49 >= (int)v59 + 1 ? (int)v59 + 1 : v48 - 1;
              v63 = (double *)(v47 + 16 * v62);
              v64 = *v61 + (*v63 - *v61) * v60;
              v65 = v61[1] + (v63[1] - v61[1]) * v60;
              v66 = sqrt((v65 - *(double *)(v47 + 16 * v56 + 8)) * (v65 - *(double *)(v47 + 16 * v56 + 8))+ (v64 - *(double *)(v47 + 16 * v56)) * (v64 - *(double *)(v47 + 16 * v56)));
              if (v66 >= v58)
                break;
              v59 = (double)v56;
              v58 = v58 - v66;
              v67 = (double)v56 + 1.0;
              v57 = floor(v67);
              v56 = vcvtmd_s64_f64(v67);
              if ((int)v48 <= v56)
                goto LABEL_64;
            }
            v68 = v59 + v58 / v66 * (v57 - v59);
          }
          v106 = vmlaq_n_f64(*(float64x2_t *)(v47 + 16 * v54), vsubq_f64(*(float64x2_t *)(v47 + 16 * v55), *(float64x2_t *)(v47 + 16 * v54)), v53 - floor(v53));
          v69 = GEOCoordinate2DForMapPoint(v106.f64[0], v106.f64[1]);
          v71 = v70;
          -[_GEOTransitPreloadCamera implicateTilesForCoordinate:into:radialDistance:tileSetStyles:](v104, "implicateTilesForCoordinate:into:radialDistance:tileSetStyles:", v105, self->_tileSetStyles);
          v72 = v115;
          if (v115 >= v116)
          {
            v74 = (char *)v114;
            v75 = (v115 - (_BYTE *)v114) >> 4;
            v76 = v75 + 1;
            if ((unint64_t)(v75 + 1) >> 60)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v77 = v116 - (_BYTE *)v114;
            if ((v116 - (_BYTE *)v114) >> 3 > v76)
              v76 = v77 >> 3;
            if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF0)
              v78 = 0xFFFFFFFFFFFFFFFLL;
            else
              v78 = v76;
            if (v78)
            {
              v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v116, v78);
              v74 = (char *)v114;
              v72 = v115;
            }
            else
            {
              v79 = 0;
            }
            v80 = (float64x2_t *)&v79[16 * v75];
            *v80 = v106;
            v73 = (char *)&v80[1];
            if (v72 != v74)
            {
              do
              {
                v80[-1] = *((float64x2_t *)v72 - 1);
                --v80;
                v72 -= 16;
              }
              while (v72 != v74);
              v74 = (char *)v114;
            }
            v114 = v80;
            v115 = v73;
            v116 = &v79[16 * v78];
            if (v74)
              operator delete(v74);
          }
          else
          {
            *(float64x2_t *)v115 = v106;
            v73 = v72 + 16;
          }
          v115 = v73;
          v81 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v69, v71);
          -[NSMutableArray addObject:](v7->_latLngToLoad, "addObject:", v81);
          end = (char *)v7->coords.__end_;
          value = v7->coords.__end_cap_.__value_;
          if (end >= (char *)value)
          {
            begin = (char *)*p_begin;
            v86 = (end - (_BYTE *)*p_begin) >> 4;
            v87 = v86 + 1;
            if ((unint64_t)(v86 + 1) >> 60)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v88 = value - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)begin;
            if (v88 >> 3 > v87)
              v87 = v88 >> 3;
            if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF0)
              v89 = 0xFFFFFFFFFFFFFFFLL;
            else
              v89 = v87;
            if (v89)
            {
              v90 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v7->coords.__end_cap_, v89);
              begin = (char *)v7->coords.__begin_;
              end = (char *)v7->coords.__end_;
            }
            else
            {
              v90 = 0;
            }
            v91 = &v90[16 * v86];
            *(double *)v91 = v69;
            *((double *)v91 + 1) = v71;
            v92 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v91;
            if (end != begin)
            {
              do
              {
                *((_OWORD *)v92 - 1) = *((_OWORD *)end - 1);
                v92 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v92 - 16);
                end -= 16;
              }
              while (end != begin);
              begin = (char *)*p_begin;
            }
            v84 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v91 + 16);
            v7->coords.__begin_ = v92;
            v7->coords.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v91 + 16);
            v7->coords.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v90[16 * v89];
            if (begin)
              operator delete(begin);
          }
          else
          {
            *(double *)end = v69;
            *((double *)end + 1) = v71;
            v84 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(end + 16);
          }
          v7->coords.__end_ = v84;

          v53 = v68;
        }
        while (v52 > 0);
        if (__p)
          operator delete(__p);
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        v13 = v103 + 1;
      }
      while (v103 + 1 != v102);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
    }
    while (v10);
  }

  GEOGetRoutePreloaderLog();
  v93 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    v94 = -[GEOTileKeyList count](v105, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v94;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = (v115 - (_BYTE *)v114) >> 4;
    _os_log_impl(&dword_1885A9000, v93, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Accumulated list has: %lu tiles for %lu points", buf, 0x16u);
  }

  -[GEOTransitRoutePreloadStrategy _ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:](self, "_ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:", v105);
  -[_GEOTransitPreloadBatch setPlaceDatasToLoad:](v7, "setPlaceDatasToLoad:", 0);
  v7->priority = v99;
  v7->status = 0;
  placeDataRequestTicketForBatch = v7->placeDataRequestTicketForBatch;
  v7->placeDataRequestTicketForBatch = 0;

  if (-[GEOTileKeyList count](v105, "count"))
  {
    -[_GEOTransitPreloadBatch setTilesToLoad:](v7, "setTilesToLoad:", v105);
    -[_GEOTransitRoutePreloaderData preloadBatches](self->_reserved, "preloadBatches");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "addObject:", v7);

    -[_GEOTransitRoutePreloaderData setCamera:](self->_reserved, "setCamera:", v104);
    tilesRequested = self->_tilesRequested;
    self->_tilesRequested = -[GEOTileKeyList count](v105, "count") + tilesRequested;
  }
  else
  {
    -[_GEOTransitPreloadBatch setTilesToLoad:](v7, "setTilesToLoad:", 0);
  }

  if (v114)
  {
    v115 = (char *)v114;
    operator delete(v114);
  }

}

- (void)_processBatches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_downloadState = 1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_GEOTransitRoutePreloaderData preloadBatches](self->_reserved, "preloadBatches", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v8 = v7[3];
        v9 = v8 == 5 || v8 == 0;
        if (v9 && v7[5] <= 4uLL)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v6), "placeDatasToLoad");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count") == 0;

          if (v11)
          {
            objc_msgSend(v7, "tilesToLoad");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count") == 0;

            if (v13)
              -[GEOTransitRoutePreloadStrategy _processedFinishedBatch:withPartialStatus:](self, "_processedFinishedBatch:withPartialStatus:", v7, 2);
            else
              -[GEOTransitRoutePreloadStrategy _loadTilesForBatch:](self, "_loadTilesForBatch:", v7);
          }
          else
          {
            -[GEOTransitRoutePreloadStrategy _loadPlacecardsForBatch:](self, "_loadPlacecardsForBatch:", v7);
          }
          self->_downloadState = 0;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (void)_processedFinishedBatch:(id)a3 withPartialStatus:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "tilesToLoad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    objc_msgSend(v9, "placeDatasToLoad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      a4 = 2;
  }
  v9[3] = a4;
  -[GEOTransitRoutePreloadStrategy _performNextRequests](self, "_performNextRequests");

}

- (void)_loadTilesForBatch:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *workQueue;
  id v16;
  GEOTileKeyList *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  GEOTileKeyList *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  GEOTileKeyList *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unsigned int *v46;
  GEOTransitRoutePreloadStrategy *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  id v61;
  GEOTileKeyList *v62;
  id v63;
  unsigned int *v64;
  id v65;
  id v66;
  id v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  _QWORD v76[3];
  int v77;
  _QWORD v78[5];
  id v79;
  _QWORD v80[4];
  id v81;
  GEOTransitRoutePreloadStrategy *v82;
  _QWORD v83[5];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke;
  v83[3] = &unk_1E1C062C8;
  v47 = self;
  v83[4] = self;
  v38 = (void *)MEMORY[0x18D765024](v83);
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_2;
  v80[3] = &unk_1E1C06318;
  v5 = v4;
  v81 = v5;
  v82 = self;
  v39 = (void *)MEMORY[0x18D765024](v80);
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_3;
  v78[3] = &unk_1E1BFFF48;
  v78[4] = self;
  v46 = (unsigned int *)v5;
  v79 = v46;
  v40 = (void *)MEMORY[0x18D765024](v78);
  *((_QWORD *)v46 + 3) = 1;
  objc_msgSend(v46, "tilesToLoad");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v37, "count");
  GEOTileLoaderClientIdentifier(self);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v43);
  v42 = -[GEOTileKeyList initWithMaxCapacity:]([GEOTileKeyList alloc], "initWithMaxCapacity:", v43);
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v77 = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v75[3] = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
  objc_msgSend(WeakRetained, "incrementTileLoadStatistic:amount:", 0, objc_msgSend(v37, "count"));

  v7 = objc_loadWeakRetained((id *)&self->_preloader);
  objc_msgSend(v7, "auditToken");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v8 = v37;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v72 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
        +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v46[28];
        workQueue = v47->_workQueue;
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_109;
        v60[3] = &unk_1E1C06340;
        v68 = v75;
        v60[4] = v47;
        v61 = v41;
        v62 = v42;
        v69 = v76;
        v65 = v38;
        v16 = v8;
        v63 = v16;
        v64 = v46;
        v70 = v43;
        v66 = v39;
        v67 = v40;
        objc_msgSend(v13, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", v12, v14, v44, 519, 3, v45, workQueue, 0, v60);

      }
      v9 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    }
    while (v9);
  }

  v17 = objc_alloc_init(GEOTileKeyList);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v86, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v57 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
        +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "activeTileGroup");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E1E80F38);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "regionalResourceKeysForTileKey:scale:scenarios:", v22, 0, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v85, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v53;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v53 != v29)
                objc_enumerationMutation(v27);
              -[GEOTileKeyList addKey:](v17, "addKey:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k));
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v85, 16);
          }
          while (v28);
        }

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v86, 16);
    }
    while (v19);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v31 = v17;
  v32 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v48, v84, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v49;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v49 != v33)
          objc_enumerationMutation(v31);
        v35 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * m);
        +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", v35, v46[28], v44, 3, 3, v45, v47->_workQueue, 0, &__block_literal_global_44);

      }
      v32 = -[GEOTileKeyList countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v48, v84, 16);
    }
    while (v32);
  }

  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v76, 8);

}

void __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 128))
  {
    objc_msgSend(*(id *)(v3 + 16), "tilesReceived");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addKey:", a3);

  }
}

void __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  id obj;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v6 = a4;
  GEOGetRoutePreloaderLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v47 = objc_msgSend(v30, "count");
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "[TransitStrategy] Tile Preloader failed with %lu keys", buf, 0xCu);
  }
  v31 = a1;

  GEOGetRoutePreloaderLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v9 + 48);
    v10 = *(_QWORD *)(v9 + 56);
    *(_DWORD *)buf = 134218240;
    v47 = v11;
    v48 = 2048;
    v49 = v10;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Total bytes loaded: (%lu) from network: (%lu)", buf, 0x16u);
  }

  v44 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  obj = v30;
  v12 = 0;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v42;
LABEL_7:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v14)
        objc_enumerationMutation(obj);
      v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v15);
      objc_msgSend(v6, "objectAtIndex:", 0, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if (!v20)
        goto LABEL_22;
      v21 = objc_msgSend(v17, "code");
      if (v21 > -3)
      {
        if (v21 != -2)
        {
          if (v21 == -1)
          {
LABEL_27:
            v26 = *(_QWORD **)(v31 + 40);
            if (!v26[12])
            {
              objc_initWeak((id *)buf, v26);
              v35 = MEMORY[0x1E0C809B0];
              v36 = 3221225472;
              v37 = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_106;
              v38 = &unk_1E1C062F0;
              objc_copyWeak(&v40, (id *)buf);
              v39 = *(_QWORD *)(v31 + 40);
              v27 = geo_dispatch_timer_create_on_queue();
              v28 = *(_QWORD *)(v31 + 40);
              v29 = *(void **)(v28 + 96);
              *(_QWORD *)(v28 + 96) = v27;

              dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(v31 + 40) + 96));
              objc_destroyWeak(&v40);
              objc_destroyWeak((id *)buf);
            }

            v25 = obj;
            goto LABEL_30;
          }
          goto LABEL_22;
        }
        v23 = *(void **)(*(_QWORD *)(v31 + 40) + 16);
        if (!v23)
          goto LABEL_18;
        objc_msgSend(v23, "tilesLoadingOrLoaded");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeKey:", v16);
      }
      else
      {
        if (v21 != -7)
        {
          if (v21 == -15)
            goto LABEL_27;
          goto LABEL_22;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(v31 + 40) + 16), "tilesLoadingOrLoaded");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeKey:", v16);
      }

LABEL_18:
      v12 = 1;
LABEL_22:

      if (v13 == ++v15)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v13)
          goto LABEL_7;
        break;
      }
    }
  }

  objc_msgSend(*(id *)(v31 + 32), "tilesToLoad");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_2_107;
  v33[3] = &unk_1E1C062A0;
  v34 = obj;
  objc_msgSend(v24, "removeKeysMatchingPredicate:", v33);

  if ((v12 & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(v31 + 32) + 24) = 0;
    ++*(_QWORD *)(*(_QWORD *)(v31 + 32) + 40);
    objc_msgSend(*(id *)(v31 + 40), "_retryFailuresWithErrorsReset:", 0);
  }
  v25 = v34;
LABEL_30:

}

void __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_106(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  id v5;
  _QWORD *v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && WeakRetained[12])
  {
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 96));
    v4 = (void *)v6[12];
    v6[12] = 0;

  }
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_geodCrashed");

}

uint64_t __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_2_107(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsKey:", a2) ^ 1;
}

uint64_t __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 128))
  {
    v1 = result;
    GEOGetRoutePreloaderLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(v1 + 40), "tilesToLoad");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134217984;
      v9 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Tile Preloader finished with %lu keys", (uint8_t *)&v8, 0xCu);

    }
    GEOGetRoutePreloaderLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(v1 + 40);
      v7 = *(_QWORD *)(v5 + 48);
      v6 = *(_QWORD *)(v5 + 56);
      v8 = 134218240;
      v9 = v7;
      v10 = 2048;
      v11 = v6;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Total bytes loaded: (%lu) from network: (%lu)", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(v1 + 40), "setTilesToLoad:", 0);
    return objc_msgSend(*(id *)(v1 + 32), "_processedFinishedBatch:withPartialStatus:", *(_QWORD *)(v1 + 40), 3);
  }
  return result;
}

void __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_109(uint64_t a1, __int128 *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v25 = *a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  if (v12)
  {
    if (objc_msgSend(v12, "code", v25) == -2
      && (objc_msgSend(v12, "domain"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v15, "isEqualToString:", v16),
          v16,
          v15,
          v17))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      objc_msgSend(WeakRetained, "incrementTileLoadStatistic:amount:", 3, 1);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      objc_msgSend(WeakRetained, "incrementTileLoadStatistic:amount:", 4, 1);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    objc_msgSend(*(id *)(a1 + 48), "addKey:", &v25);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) += a4;
    objc_msgSend(v13, "objectForKey:", CFSTR("GEOTileLoadResultSource"), v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");

    v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    v22 = v21;
    if (v20 == 2)
      objc_msgSend(v21, "incrementTileLoadStatistic:amount:", 1, 1);
    else
      objc_msgSend(v21, "incrementTileLoadStatistic:amount:", 2, 1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    if (v20 == 2)
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 56) += a4;
    *(_QWORD *)(*(_QWORD *)(a1 + 64) + 48) += a4;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) == *(_QWORD *)(a1 + 112))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v23 = *(_QWORD *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 64), "tilesToLoad");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v23 + 16))(v23, v24, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    }
  }

}

- (void)_loadPlacecardsForBatch:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  _QWORD v14[5];
  id v15;
  id *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "placeDatasToLoad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    if (v4[3] != (id)2)
    {
      v7 = v4[4];
      if (v7 == (id)-[_GEOTransitRoutePreloaderData currentBatchGeneration](self->_reserved, "currentBatchGeneration"))
      {
        v4[3] = (id)1;
        GEOGetRoutePreloaderLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v6;
          _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Requesting PlaceData for IDs: %@", buf, 0xCu);
        }

        +[GEOMapService sharedService](GEOMapService, "sharedService");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)v4 + 16));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ticketForTransitIdentifiers:endDateForPlacecardSchedulesForThisBatch:traits:", v6, v10, self->_traits);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_storeStrong(v4 + 15, v11);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __58__GEOTransitRoutePreloadStrategy__loadPlacecardsForBatch___block_invoke;
        v14[3] = &unk_1E1C063B0;
        v14[4] = self;
        v15 = v6;
        v16 = v4;
        WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
        objc_msgSend(WeakRetained, "auditToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "submitWithHandler:auditToken:timeout:networkActivity:", v14, v13, 0, 0);

      }
    }
  }

}

void __58__GEOTransitRoutePreloadStrategy__loadPlacecardsForBatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __58__GEOTransitRoutePreloadStrategy__loadPlacecardsForBatch___block_invoke_2;
  block[3] = &unk_1E1C06388;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  block[1] = 3221225472;
  v14 = v5;
  v15 = v6;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v18 = *(id *)(a1 + 48);
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

uint64_t __58__GEOTransitRoutePreloadStrategy__loadPlacecardsForBatch___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  void *v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  GEOGetRoutePreloaderLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)v27 = 134217984;
    *(_QWORD *)&v27[4] = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Placecard Preloader received %lu placecards", v27, 0xCu);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    GEOGetRoutePreloaderLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v27 = 138412290;
      *(_QWORD *)&v27[4] = v5;
      v6 = "[TransitStrategy] Placecard preloader received errors: %@";
      v7 = v4;
      v8 = 12;
LABEL_17:
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, v6, v27, v8);
    }
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 48), "count");
    if (v9 == objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        v10 = 0;
        v11 = 0;
        do
        {
          objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_placeData");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "status");
          v16 = *(void **)(*(_QWORD *)(a1 + 56) + 16);
          if (v15)
          {
            objc_msgSend(v16, "placecardsMissed");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v12);
            v10 = 1;
          }
          else
          {
            objc_msgSend(v16, "placecardsReceived");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v12);
          }

          ++v11;
        }
        while (v11 < objc_msgSend(*(id *)(a1 + 48), "count"));
        v18 = *(_QWORD *)(a1 + 64);
        v19 = *(void **)(v18 + 120);
        *(_QWORD *)(v18 + 120) = 0;

        if ((v10 & 1) != 0)
          goto LABEL_19;
      }
      else
      {
        v25 = *(_QWORD *)(a1 + 64);
        v26 = *(void **)(v25 + 120);
        *(_QWORD *)(v25 + 120) = 0;

      }
      objc_msgSend(*(id *)(a1 + 64), "setPlaceDatasToLoad:", 0);
      return objc_msgSend(*(id *)(a1 + 56), "_processedFinishedBatch:withPartialStatus:", *(_QWORD *)(a1 + 64), 4);
    }
    GEOGetRoutePreloaderLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(*(id *)(a1 + 48), "count");
      v21 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)v27 = 134218240;
      *(_QWORD *)&v27[4] = v20;
      *(_WORD *)&v27[12] = 2048;
      *(_QWORD *)&v27[14] = v21;
      v6 = "[TransitStrategy] Place cards requested: (%lu) did not match place cards received: (%lu) and no error was returned either.";
      v7 = v4;
      v8 = 22;
      goto LABEL_17;
    }
  }

  v22 = *(_QWORD *)(a1 + 64);
  v23 = *(void **)(v22 + 120);
  *(_QWORD *)(v22 + 120) = 0;

LABEL_19:
  *(_QWORD *)(*(_QWORD *)(a1 + 64) + 24) = 0;
  ++*(_QWORD *)(*(_QWORD *)(a1 + 64) + 40);
  return objc_msgSend(*(id *)(a1 + 56), "_retryFailuresWithErrorsReset:", 0, *(_OWORD *)v27, *(_QWORD *)&v27[16], v28);
}

- (void)_geodCrashed
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_enabled)
  {
    GEOGetRoutePreloaderLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "[TransitStrategy] Daemon crashed. Redoing everything.", v4, 2u);
    }

    -[GEOTransitRoutePreloadStrategy stop](self, "stop");
    -[GEOTransitRoutePreloadStrategy start](self, "start");
  }
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  -[GEOTransitRoutePreloadStrategy _cancelAllBatches](self, "_cancelAllBatches", a3);
  if (self->_enabled)
  {
    -[GEOTransitRoutePreloadStrategy _stop](self, "_stop");
    -[GEOTransitRoutePreloadStrategy _start](self, "_start");
  }
}

- (GEORoutePreloader)preloader
{
  return (GEORoutePreloader *)objc_loadWeakRetained((id *)&self->_preloader);
}

- (void)setPreloader:(id)a3
{
  objc_storeWeak((id *)&self->_preloader, a3);
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileSetStyles, 0);
  objc_storeStrong((id *)&self->_geodCrashTimer, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_preloader);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_suggestedRoute, 0);
}

@end
