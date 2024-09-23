@implementation GEONavRoutePreloadStrategy

- (GEONavRoutePreloadStrategy)init
{
  GEONavRoutePreloadStrategy *v2;
  uint64_t v3;
  OS_dispatch_queue *workQueue;
  GEOSimpleRoutePreloadCamera *v5;
  GEORoutePreloadCamera *camera;
  NSObject *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEONavRoutePreloadStrategy;
  v2 = -[GEONavRoutePreloadStrategy init](&v10, sel_init);
  if (v2)
  {
    v3 = geo_dispatch_queue_create();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(GEOSimpleRoutePreloadCamera);
    camera = v2->_camera;
    v2->_camera = (GEORoutePreloadCamera *)v5;

    v2->_maneuverSizeInMeters = GEOConfigGetDouble(GeoServicesConfig_ManeuverSizeInMeters, (uint64_t)off_1EDF4CE58);
    v2->_stepSizeInMeters = GEOConfigGetDouble(GeoServicesConfig_StepSizeInMeters, (uint64_t)off_1EDF4CE48);
    v2->_useCellularCoverage = GEOConfigGetBOOL(GeoServicesConfig_RoutePreloaderUseCellularCoverage, (uint64_t)off_1EDF4CE78);
    GEOGetRoutePreloaderLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v2->_signpostID = os_signpost_id_generate(v7);

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTileGroupObserver:queue:", v2, v2->_workQueue);

  }
  return v2;
}

- (void)performTearDown
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__GEONavRoutePreloadStrategy_performTearDown__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

uint64_t __45__GEONavRoutePreloadStrategy_performTearDown__block_invoke(uint64_t a1)
{
  void *v2;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeTileGroupObserver:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5
{
  -[GEONavRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:restrictions:](self, "addTileSetStyle:betweenZoom:andZoom:restrictions:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
}

- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5 restrictions:(unint64_t)a6
{
  uint64_t v7;
  NSMutableDictionary *v10;
  NSMutableDictionary *tileSetStyles;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  uint64_t v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  id v23;
  NSMutableDictionary *v24;
  void *v25;
  _GEONavRoutePreloadTileType *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  id v31;

  v7 = *(_QWORD *)&a5;
  if (!self->_tileSetStyles)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tileSetStyles = self->_tileSetStyles;
    self->_tileSetStyles = v10;

  }
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeTileGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeTileSetForTileType:scale:", a3, 0);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  v14 = v31;
  if (v31)
  {
    if ((a6 & 1) == 0
      || (+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "supportsAdvancedMap"),
          v15,
          v14 = v31,
          (v16 & 1) != 0))
    {
      if ((a6 & 2) != 0)
      {
        +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "supportsAdvancedMap");

        if (!v18)
          a6 ^= 2uLL;
        v14 = v31;
      }
      if ((_DWORD)v7 && (int)v7 >= (int)a4)
      {
        do
        {
          v19 = objc_msgSend(v14, "largestZoomLevelLEQ:inRect:", v7, 0.0, 0.0, 268435456.0, 268435456.0);
          v7 = (v19 - 1);
          if ((int)v19 >= 1)
          {
            v20 = self->_tileSetStyles;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v20, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v24 = self->_tileSetStyles;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v23, v25);

            }
            v26 = -[_GEONavRoutePreloadTileType initWithStyle:restrictions:]([_GEONavRoutePreloadTileType alloc], "initWithStyle:restrictions:", a3, a6);
            v27 = self->_tileSetStyles;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v27, "objectForKey:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v26);

          }
          v14 = v31;
        }
        while ((int)v19 > (int)a4);
      }
    }
  }

}

- (void)observedNetworkQualityDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *workQueue;
  _QWORD block[7];

  if (a3 == 1 && a4 != 1)
  {
    block[5] = v4;
    block[6] = v5;
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__GEONavRoutePreloadStrategy_observedNetworkQualityDidChangeFrom_to___block_invoke;
    block[3] = &unk_1E1C00178;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

uint64_t __69__GEONavRoutePreloadStrategy_observedNetworkQualityDidChangeFrom_to___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resetErrCounts");
  return objc_msgSend(*(id *)(a1 + 32), "_performNextRequests");
}

- (void)_resetErrCounts
{
  if (self->_anyErrors)
  {
    self->_anyErrors = 0;
    self->_mostRecentErrorTime = 0.0;
    -[NSMutableArray makeObjectsPerformSelector:](self->_steps, "makeObjectsPerformSelector:", sel_resetErrors);
  }
}

- (void)_retryFailuresWithErrorsReset:(BOOL)a3
{
  if (self->_enabled)
  {
    if (a3)
      -[GEONavRoutePreloadStrategy _resetErrCounts](self, "_resetErrCounts");
    -[GEONavRoutePreloadStrategy _performNextRequests](self, "_performNextRequests");
  }
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
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "[NavStrategy] Daemon crashed. Redoing everything.", v4, 2u);
    }

    -[GEONavRoutePreloadStrategy stop](self, "stop");
    -[GEONavRoutePreloadStrategy start](self, "start");
  }
}

- (void)_accumulateSteps
{
  unsigned int v3;
  unsigned int v4;
  double v5;
  double v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  double stepSizeInMeters;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double *v23;
  double *v24;
  double *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  double *v31;
  double *v32;
  double v33;
  NSMutableArray *v34;
  NSMutableArray *steps;
  GEOSPRMetroAvailabilityFetcher *v36;
  id WeakRetained;
  void *v38;
  GEOSPRMetroAvailabilityFetcher *v39;
  GEOSPRMetroAvailabilityFetcher *sprAvailabilityFetcher;
  void *v41;
  uint64_t v42;
  GEOMapAssetMetadataFetcher *v43;
  id v44;
  void *v45;
  GEOMapAssetMetadataFetcher *v46;
  GEOMapAssetMetadataFetcher *assetMetadataFetcher;
  id v48;
  char *v49;
  unint64_t v50;
  int v51;
  int v52;
  double *v53;
  int v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double *v59;
  double v60;
  double v61;
  int v62;
  int v63;
  double v64;
  double v65;
  double v66;
  double v67;
  int v68;
  double v69;
  double *v70;
  int v71;
  double *v72;
  double v73;
  double v74;
  double *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  double *v82;
  double v83;
  double v84;
  double v85;
  double *v86;
  double v87;
  double v88;
  id v89;
  uint64_t v90;
  void *v91;
  GEONavRoutePreloadStep *v92;
  id v93;
  void *v94;
  uint64_t v95;
  BOOL v96;
  id v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  double v101;
  double *v102;
  double *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  int v109;
  void *__p;
  double *v111;
  double *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t buf[4];
  uint64_t v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v3 = -[GEOComposedRoute pointCount](self->_route, "pointCount");
  if (v3 >= 2)
  {
    v4 = v3;
    -[GEOComposedRoute pointAt:](self->_route, "pointAt:", 0);
    v6 = GEOMapPointsPerMeterAtLatitude(v5);
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v7 = self->_tileSetStyles;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v113, v119, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v114;
      v10 = 15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v114 != v9)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
          if (v10 <= objc_msgSend(v12, "unsignedIntegerValue"))
            v10 = objc_msgSend(v12, "unsignedIntegerValue");
        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v113, v119, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 15;
    }

    stepSizeInMeters = self->_stepSizeInMeters;
    v14 = exp2(15.0 - (double)v10);
    __p = 0;
    v111 = 0;
    v112 = 0;
    std::vector<GEOLocationCoordinate2D>::reserve(&__p, v4);
    v15 = 0;
    v16 = stepSizeInMeters * fmin(v14, 1.0);
    v106 = 1.0 / v6;
    v101 = v16 / (1.0 / v6);
    do
    {
      -[GEOComposedRoute pointAt:](self->_route, "pointAt:", v15);
      v19 = GEOTilePointForCoordinate(v17, v18, 20.0);
      v21 = v19;
      v22 = v20;
      v23 = v111;
      if (v111 >= v112)
      {
        v25 = (double *)__p;
        v26 = ((char *)v111 - (_BYTE *)__p) >> 4;
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 60)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v28 = (char *)v112 - (_BYTE *)__p;
        if (((char *)v112 - (_BYTE *)__p) >> 3 > v27)
          v27 = v28 >> 3;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0)
          v29 = 0xFFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v112, v29);
          v25 = (double *)__p;
          v23 = v111;
        }
        else
        {
          v30 = 0;
        }
        v31 = (double *)&v30[16 * v26];
        *v31 = v21;
        *((_QWORD *)v31 + 1) = v22;
        v32 = v31;
        if (v23 != v25)
        {
          do
          {
            *((_OWORD *)v32 - 1) = *((_OWORD *)v23 - 1);
            v32 -= 2;
            v23 -= 2;
          }
          while (v23 != v25);
          v25 = (double *)__p;
        }
        v24 = v31 + 2;
        __p = v32;
        v111 = v31 + 2;
        v112 = (double *)&v30[16 * v29];
        if (v25)
          operator delete(v25);
      }
      else
      {
        *v111 = v19;
        *((_QWORD *)v23 + 1) = v20;
        v24 = v23 + 2;
      }
      v111 = v24;
      ++v15;
    }
    while (v15 != v4);
    -[GEOComposedRoute distance](self->_route, "distance");
    v34 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", vcvtpd_u64_f64(v33 / v16));
    steps = self->_steps;
    self->_steps = v34;

    if (!self->_sprAvailabilityFetcher)
    {
      v36 = [GEOSPRMetroAvailabilityFetcher alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
      objc_msgSend(WeakRetained, "auditToken");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[GEOSPRMetroAvailabilityFetcher initWithTileLoader:auditToken:forceDisableMetros:](v36, "initWithTileLoader:auditToken:forceDisableMetros:", 0, v38, self->_forceDisableMetros);
      sprAvailabilityFetcher = self->_sprAvailabilityFetcher;
      self->_sprAvailabilityFetcher = v39;

    }
    if (!self->_assetMetadataFetcher && self->_shouldLoadAssets)
    {
      +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "supportsASTC");

      v43 = [GEOMapAssetMetadataFetcher alloc];
      v44 = objc_loadWeakRetained((id *)&self->_preloader);
      objc_msgSend(v44, "auditToken");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[GEOMapAssetMetadataFetcher initWithTileLoader:auditToken:enableASTCTextures:](v43, "initWithTileLoader:auditToken:enableASTCTextures:", 0, v45, v42);
      assetMetadataFetcher = self->_assetMetadataFetcher;
      self->_assetMetadataFetcher = v46;

    }
    v48 = 0;
    v49 = (char *)__p;
    v50 = (unint64_t)((char *)v111 - (_BYTE *)__p) >> 4;
    v51 = v50 - 1;
    v52 = v51 & ~(v51 >> 31);
    v105 = (double)v52;
    v104 = v105 - v105;
    v53 = (double *)((char *)__p + 16 * v52);
    if ((int)v50 - 1 >= v52 + 1)
      v54 = v52 + 1;
    else
      v54 = v50 - 1;
    v102 = (double *)((char *)__p + 16 * v54);
    v103 = v53;
    v109 = 2;
    v55 = 0.0;
    v56 = 0.0;
    do
    {
      v57 = floor(v55);
      v58 = v55 - v57;
      v59 = (double *)&v49[16 * (int)v55];
      v60 = *v59;
      v61 = v59[1];
      if (v51 >= (int)v55 + 1)
        v62 = (int)v55 + 1;
      else
        v62 = v50 - 1;
      v63 = vcvtmd_s64_f64(v55 + 1.0);
      if ((int)v50 <= v63)
      {
        v81 = v62;
        v80 = v55 - v57;
        v76 = v61;
        v77 = v60;
        v65 = v56;
      }
      else
      {
        v64 = floor(v55 + 1.0);
        v65 = v56;
        v66 = v101;
        v67 = v55;
        do
        {
          v68 = v63;
          v69 = v67 - floor(v67);
          v70 = (double *)&v49[16 * (int)v67];
          if (v51 >= (int)v67 + 1)
            v71 = (int)v67 + 1;
          else
            v71 = v50 - 1;
          v72 = (double *)&v49[16 * v71];
          v73 = *v70 + (*v72 - *v70) * v69;
          v74 = v70[1] + (v72[1] - v70[1]) * v69;
          v75 = (double *)&v49[16 * v68];
          v77 = *v75;
          v76 = v75[1];
          v78 = sqrt((v74 - v76) * (v74 - v76) + (v73 - *v75) * (v73 - *v75));
          if (v78 >= v66)
          {
            v107 = v67 + v66 / v78 * (v64 - v67);
            v108 = v65 + v66;
            goto LABEL_57;
          }
          v67 = (double)v68;
          v65 = v65 + v78;
          v66 = v66 - v78;
          v79 = (double)v68 + 1.0;
          v64 = floor(v79);
          v63 = vcvtmd_s64_f64(v79);
        }
        while ((int)v50 > v63);
        v80 = v67 - v67;
        if (v51 >= v68 + 1)
          LODWORD(v81) = v68 + 1;
        else
          LODWORD(v81) = v50 - 1;
        v81 = (int)v81;
      }
      v82 = (double *)&v49[16 * v81];
      v83 = v77 + (*v82 - v77) * v80;
      v84 = v76 + (v82[1] - v76) * v80;
      v85 = v83 - (*v103 + (*v102 - *v103) * v104);
      --v109;
      v107 = v105;
      v108 = v65
           + sqrt((v84 - (v103[1] + (v102[1] - v103[1]) * v104)) * (v84 - (v103[1] + (v102[1] - v103[1]) * v104))+ v85 * v85);
LABEL_57:
      v86 = (double *)&v49[16 * v62];
      v88 = *v86;
      v87 = v86[1];
      if (v48)
      {
        v89 = v48;
        goto LABEL_60;
      }
      -[GEOComposedRoute stepAtIndex:](self->_route, "stepAtIndex:", 0);
      v89 = (id)objc_claimAutoreleasedReturnValue();
      if (v89)
      {
LABEL_60:
        while (objc_msgSend(v89, "endPointIndex") <= v55)
        {
          objc_msgSend(v89, "getNextStep");
          v90 = objc_claimAutoreleasedReturnValue();

          v89 = (id)v90;
          if (!v90)
            goto LABEL_62;
        }
      }
      else
      {
LABEL_62:
        -[GEOComposedRoute steps](self->_route, "steps");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "lastObject");
        v89 = (id)objc_claimAutoreleasedReturnValue();

      }
      v92 = [GEONavRoutePreloadStep alloc];
      v93 = objc_loadWeakRetained((id *)&self->_preloader);
      objc_msgSend(v93, "auditToken");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = -[GEONavRoutePreloadStep initWithAuditToken:highZoomMetrosAvailabilityFetcher:assetMetadataFetcher:preloaderSignpostID:](v92, "initWithAuditToken:highZoomMetrosAvailabilityFetcher:assetMetadataFetcher:preloaderSignpostID:", v94, self->_sprAvailabilityFetcher, self->_assetMetadataFetcher, self->_signpostID);

      v96 = v89 != v48 && v48 != 0;
      *(_BYTE *)(v95 + 76) = *(_BYTE *)(v95 + 76) & 0xFE | v96;
      v97 = v89;

      *(double *)(v95 + 24) = v55;
      *(long double *)(v95 + 8) = GEOCoordinate2DForMapPoint(v60 + (v88 - v60) * v58, v61 + (v87 - v61) * v58);
      *(_QWORD *)(v95 + 16) = v98;
      *(_DWORD *)(v95 + 72) = -[GEOComposedRoute estimatedCellularCoverageForOffset:](self->_route, "estimatedCellularCoverageForOffset:", v106 * v56);
      *(_DWORD *)(v95 + 68) = self->_stepGeneration;
      -[NSMutableArray addObject:](self->_steps, "addObject:", v95);

      v55 = v107;
      v56 = v108;
      v48 = v97;
    }
    while (v109 > 0);
    GEOGetRoutePreloaderLog();
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    {
      v100 = -[NSMutableArray count](self->_steps, "count");
      *(_DWORD *)buf = 134349056;
      v118 = v100;
      _os_log_impl(&dword_1885A9000, v99, OS_LOG_TYPE_DEBUG, "[NavStrategy] Partitioned route into %{public}llu batches", buf, 0xCu);
    }

    if (__p)
    {
      v111 = (double *)__p;
      operator delete(__p);
    }
  }
}

- (void)_cancelStep:(id)a3
{
  _BYTE *v3;

  v3 = a3;
  if ((v3[76] & 2) != 0)
    objc_msgSend(v3, "cancel");

}

- (void)_cancelAllSteps
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_steps;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[GEONavRoutePreloadStrategy _cancelStep:](self, "_cancelStep:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_loadStep:(id)a3 requireWiFi:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  GEONavRoutePreloadStrategy *v28;
  _QWORD v29[4];
  id v30;
  GEONavRoutePreloadStrategy *v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  GEONavRoutePreloadStrategy *v35;
  _QWORD v36[5];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "hasLifetimeError"))
  {
    GEOGetRoutePreloaderLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "[NavStrategy] Now loading previously failed batch %@", buf, 0xCu);
    }

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (void *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v8;

  -[GEORoutePreloadCamera implicateTilesForCoordinate:route:nearestRoutePointIdx:stepNearManeuever:into:stepSize:maneuverSize:tileSetStyles:](self->_camera, "implicateTilesForCoordinate:route:nearestRoutePointIdx:stepNearManeuever:into:stepSize:maneuverSize:tileSetStyles:", self->_route, *((_BYTE *)v6 + 76) & 1, *((_QWORD *)v6 + 4), self->_tileSetStyles, *((double *)v6 + 1), *((double *)v6 + 2), *((double *)v6 + 3), self->_stepSizeInMeters, self->_maneuverSizeInMeters);
  v10 = 152;
  if ((*((_BYTE *)v6 + 76) & 1) == 0)
    v10 = 168;
  -[GEORoutePreloadCamera implicateAssetMetadataTilesForCoordinate:size:](self->_camera, "implicateAssetMetadataTilesForCoordinate:size:", *((double *)v6 + 1), *((double *)v6 + 2), *(double *)((char *)&self->super.isa + v10));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)v6 + 5);
  *((_QWORD *)v6 + 5) = v11;

  v13 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke;
  v36[3] = &unk_1E1C062A0;
  v36[4] = self;
  v14 = (void *)MEMORY[0x18D765024](v36);
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_2;
  v33[3] = &unk_1E1C20298;
  v15 = v6;
  v34 = v15;
  v35 = self;
  v16 = (void *)MEMORY[0x18D765024](v33);
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_3;
  v29[3] = &unk_1E1C202C0;
  v17 = v15;
  v30 = v17;
  v31 = self;
  v32 = v4;
  v18 = (void *)MEMORY[0x18D765024](v29);
  v23 = v13;
  v24 = 3221225472;
  v25 = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_18;
  v26 = &unk_1E1BFFF48;
  v19 = v17;
  v27 = v19;
  v28 = self;
  v20 = (void *)MEMORY[0x18D765024](&v23);
  ++self->_currentLoadingSteps;
  GEOGetRoutePreloaderLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)*((_QWORD *)v6 + 3);
    *(_DWORD *)buf = 134218240;
    v38 = v22;
    v39 = 1024;
    v40 = v4;
    _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "[NavStrategy] Starting loading batch at route position %.1f. requireWiFi is %d", buf, 0x12u);
  }

  objc_msgSend(v19, "loadWithCallbackQueue:requireWiFi:willLoadHandler:progressHandler:finishedHandler:errorHandler:", self->_workQueue, v4, v14, v16, v20, v18, v23, v24, v25, v26);
}

uint64_t __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  id WeakRetained;

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsKey:", a2);
  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addKey:", a2);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "incrementTileLoadStatistic:amount:", 0, 1);

  }
  return v4 ^ 1u;
}

void __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id WeakRetained;
  id v15;
  id v16;
  id v17;
  id v18;

  v9 = a5;
  v10 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 68) == *(_DWORD *)(v10 + 96))
  {
    v18 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "code") == -2
        && (objc_msgSend(v18, "domain"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            GEOErrorDomain(),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v11, "isEqualToString:", v12),
            v12,
            v11,
            v13))
      {
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
        objc_msgSend(WeakRetained, "incrementTileLoadStatistic:amount:", 3, 1);
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
        objc_msgSend(WeakRetained, "incrementTileLoadStatistic:amount:", 4, 1);
      }

      v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      objc_msgSend(v15, "preloadStrategy:failedToLoadTileKey:error:", *(_QWORD *)(a1 + 40), a2, v18);
    }
    else
    {
      if (a4 == 2)
      {
        ++*(_QWORD *)(v10 + 80);
        v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
        objc_msgSend(v16, "incrementTileLoadStatistic:amount:", 1, 1);

        v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
        objc_msgSend(v17, "incrementTileLoadStatistic:amount:", 5, a3);
      }
      else
      {
        v17 = objc_loadWeakRetained((id *)(v10 + 16));
        objc_msgSend(v17, "incrementTileLoadStatistic:amount:", 2, 1);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addKey:", a2);
      v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      objc_msgSend(v15, "preloadStrategy:loadedTileKey:source:sizeInBytes:", *(_QWORD *)(a1 + 40), a2, a4, a3);
    }

    v9 = v18;
  }

}

void __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  NSObject *WeakRetained;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  v31 = a3;
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 68) != *(_DWORD *)(v5 + 96))
    goto LABEL_43;
  --*(_QWORD *)(v5 + 104);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = v31;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (!v7)
  {
    v32 = 0;
    goto LABEL_28;
  }
  v32 = 0;
  v8 = *(_QWORD *)v44;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v44 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(v10, "domain", v30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        v14 = objc_msgSend(v10, "code");
        if (v14 > -3)
        {
          if (v14 == -2)
          {
            BYTE4(v32) = 1;
            continue;
          }
          if (v14 == -1)
          {
LABEL_22:
            GEOGetRoutePreloaderLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
              *(_DWORD *)buf = 134217984;
              v49 = v19;
              _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "[NavStrategy] Daemon died while handling batch at route position %.1f", buf, 0xCu);
            }

            v20 = *(_QWORD **)(a1 + 40);
            if (!v20[18])
            {
              objc_initWeak((id *)buf, v20);
              v37 = MEMORY[0x1E0C809B0];
              v38 = 3221225472;
              v39 = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_16;
              v40 = &unk_1E1C062F0;
              objc_copyWeak(&v42, (id *)buf);
              v41 = *(_QWORD *)(a1 + 40);
              v21 = geo_dispatch_timer_create_on_queue();
              v22 = *(_QWORD *)(a1 + 40);
              v23 = *(void **)(v22 + 144);
              *(_QWORD *)(v22 + 144) = v21;

              dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 144));
              objc_destroyWeak(&v42);
              objc_destroyWeak((id *)buf);
            }

            goto LABEL_43;
          }
        }
        else if (v14 == -7)
        {
          LOBYTE(v32) = 1;
        }
        else if (v14 == -15)
        {
          goto LABEL_22;
        }
        GEOGetRoutePreloaderLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
          v17 = *(unsigned __int8 *)(a1 + 48);
          *(_DWORD *)buf = 134218498;
          v49 = v16;
          v50 = 1024;
          v51 = v17;
          v52 = 2112;
          v53 = v10;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "[NavStrategy] Error preloading tiles for route position %.1f (requireWiFi:%d): %@", buf, 0x1Cu);
        }

      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v7)
      continue;
    break;
  }
LABEL_28:

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = v30;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "removeKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j), v30);
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    }
    while (v25);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 115) = 1;
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 40) + 128) = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "encounteredErrors:", v6);
  if ((v32 & 0x100000000) != 0)
  {
    GEOGetRoutePreloaderLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134217984;
      v49 = v29;
      _os_log_impl(&dword_1885A9000, WeakRetained, OS_LOG_TYPE_INFO, "[NavStrategy] Request at route position %.1f cancelled", buf, 0xCu);
    }
LABEL_41:

  }
  else if ((v32 & 1) != 0 && !*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    -[NSObject updateObservedNetworkPerformanceWithServerError](WeakRetained, "updateObservedNetworkPerformanceWithServerError");
    goto LABEL_41;
  }
  objc_msgSend(*(id *)(a1 + 40), "_performNextRequests", v30);
LABEL_43:

}

void __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_16(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  id v5;
  _QWORD *v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && WeakRetained[18])
  {
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 144));
    v4 = (void *)v6[18];
    v6[18] = 0;

  }
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_geodCrashed");

}

uint64_t __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_18(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 40);
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 68) == *(_DWORD *)(v1 + 96))
  {
    v2 = result;
    --*(_QWORD *)(v1 + 104);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(result + 40) + 16));
    objc_msgSend(WeakRetained, "updateObservedNetworkPerformanceForDownload:duration:", *(unsigned int *)(*(_QWORD *)(v2 + 32) + 64), *(double *)(*(_QWORD *)(v2 + 32) + 56) - *(double *)(*(_QWORD *)(v2 + 32) + 48));

    GEOGetRoutePreloaderLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD **)(v2 + 32);
      v6 = v5[3];
      objc_msgSend(v5, "networkDataRateKB");
      v8 = 134218240;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "[NavStrategy] Finished loading batch at route position %.1f. Data rate is %.1fKB/s", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(v2 + 40), "_resetErrCounts");
    return objc_msgSend(*(id *)(v2 + 40), "_performNextRequests");
  }
  return result;
}

- (void)_cancelRequestsBehindCurrentPosition
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double currentRoutePosition;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_steps;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (!v4)
    goto LABEL_16;
  v5 = 0;
  v6 = *(_QWORD *)v12;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
      v9 = *(double *)(v8 + 24);
      currentRoutePosition = self->_currentRoutePosition;
      if (v9 < currentRoutePosition && (*(_BYTE *)(v8 + 76) & 2) != 0)
      {
        -[GEONavRoutePreloadStrategy _cancelStep:](self, "_cancelStep:", (_QWORD)v11);
        ++v5;
      }
      else if (v9 > currentRoutePosition)
      {
        goto LABEL_13;
      }
      ++v7;
    }
    while (v4 != v7);
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  }
  while (v4);
LABEL_13:

  if (v5)
  {
    GEOGetRoutePreloaderLog();
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v5;
      _os_log_impl(&dword_1885A9000, &v3->super.super, OS_LOG_TYPE_INFO, "[NavStrategy] Canceled %lu steps because they are behind the current position", buf, 0xCu);
    }
LABEL_16:

  }
}

- (void)_performTileRequestsWithCurrentRoutePositionStepIndex:(int64_t)a3 firstErrorStepIndex:(int64_t)a4 firstLoadStepIndex:(int64_t)a5 loadStepsAhead:(int64_t)a6 loadStepsAheadIfNoWiFi:(int64_t)a7
{
  int64_t v9;
  _BOOL4 anyErrors;
  int64_t v13;
  double stepSizeInMeters;
  uint64_t v15;
  NSObject *v16;
  int downloadState;
  id WeakRetained;
  uint64_t v19;
  const char *v20;
  const char *v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  _BOOL4 v25;
  NSMutableArray *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t i;
  double v32;
  int64_t v33;
  int64_t v34;
  _BOOL4 v35;
  int v36;
  uint64_t v37;
  BOOL v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  NSObject *v50;
  double v51;
  NSObject *v52;
  double v53;
  id v54;
  BOOL v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  os_signpost_id_t v59;
  NSObject *v60;
  _BOOL4 v61;
  unint64_t v62;
  double v63;
  double Current;
  double beginTime;
  NSMutableArray *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  NSObject *v71;
  unint64_t tilesLoadedFromNetwork;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  os_signpost_id_t signpostID;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  double v87;
  __int16 v88;
  _BYTE v89[28];
  __int16 v90;
  double v91;
  _BYTE v92[128];
  uint64_t v93;

  v9 = a5;
  v93 = *MEMORY[0x1E0C80C00];
  anyErrors = self->_anyErrors;
  if (a4 < 0 && self->_anyErrors)
  {
    anyErrors = 0;
    self->_anyErrors = 0;
    self->_mostRecentErrorTime = 0.0;
  }
  if ((a5 & 0x8000000000000000) == 0)
  {
    v13 = a5 - a3;
    stepSizeInMeters = self->_stepSizeInMeters;
    v15 = -[NSMutableArray count](self->_steps, "count");
    GEOGetRoutePreloaderLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      downloadState = self->_downloadState;
      WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
      v19 = objc_msgSend(WeakRetained, "networkQuality");
      v20 = "waiting";
      if (!downloadState)
        v20 = "active";
      if ((unint64_t)(v19 - 1) > 6)
        v21 = "unknown";
      else
        v21 = off_1E1C202E0[v19 - 1];
      v23 = self->_stepSizeInMeters;
      *(_DWORD *)buf = 136316162;
      v87 = *(double *)&v20;
      v88 = 2080;
      *(_QWORD *)v89 = v21;
      *(_WORD *)&v89[8] = 2048;
      *(double *)&v89[10] = stepSizeInMeters * (double)v13 / 1000.0;
      *(_WORD *)&v89[18] = 2048;
      *(double *)&v89[20] = v23 * (double)a6 / 1000.0;
      v90 = 2048;
      v91 = v23 * (double)a7 / 1000.0;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "[NavStrategy] Download state %s. Network quality %s. Currently loading %.1fKM ahead. Can load %.0fKM ahead, %.0fKM if wifi doesn't work.", buf, 0x34u);

    }
    if (v13 > a6)
    {
      if (self->_downloadState != 1)
      {
        GEOGetRoutePreloaderLog();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);

        if (v25)
        {
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v26 = self->_steps;
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
          if (v27)
          {
            v29 = *(_QWORD *)v78;
            v30 = 0.0;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v78 != v29)
                  objc_enumerationMutation(v26);
                LODWORD(v28) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i) + 64);
                v28 = (double)*(unint64_t *)&v28;
                v30 = v30 + v28;
              }
              v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
            }
            while (v27);
            v32 = v30 * 0.000000953674316;
          }
          else
          {
            v32 = 0.0;
          }

          GEOGetRoutePreloaderLog();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v87 = v32;
            _os_log_impl(&dword_1885A9000, v73, OS_LOG_TYPE_DEBUG, "[NavStrategy] Beyond load limit. Waiting. %.1fMB loaded so far.", buf, 0xCu);
          }

        }
      }
      self->_downloadState = 1;
      GEOGetRoutePreloaderLog();
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = v74;
      signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1885A9000, v75, OS_SIGNPOST_INTERVAL_END, signpostID, "NavStrategy.Active", (const char *)&unk_189D97683, buf, 2u);
      }

      return;
    }
    if (a6 + a3 >= v15 - 1)
      v33 = v15 - 1;
    else
      v33 = a6 + a3;
    if (a7 + a3 >= v15 - 1)
      v34 = v15 - 1;
    else
      v34 = a7 + a3;
    if (v33 >= v9)
    {
      v37 = -1;
      do
      {
        if (self->_currentLoadingSteps > 1)
          break;
        -[NSMutableArray objectAtIndex:](self->_steps, "objectAtIndex:", v9);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "okToLoad"))
        {
          GEOGetRoutePreloaderLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            v45 = -[NSMutableArray count](self->_steps, "count");
            *(_DWORD *)buf = 134349312;
            v87 = *(double *)&v9;
            v88 = 2050;
            *(_QWORD *)v89 = v45;
            _os_log_impl(&dword_1885A9000, v44, OS_LOG_TYPE_DEBUG, "[NavStrategy] Loading batch %{public}llu / %{public}llu", buf, 0x16u);
          }

          -[GEONavRoutePreloadStrategy _loadStep:requireWiFi:](self, "_loadStep:requireWiFi:", v43, v9 > v34);
          v37 = v9;
        }

        ++v9;
      }
      while (v33 + 1 != v9);
      v36 = self->_downloadState;
      v35 = v37 >= 0;
      if (v36 == 1 && (v37 & 0x8000000000000000) == 0)
      {
        GEOGetRoutePreloaderLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v46, OS_LOG_TYPE_DEBUG, "[NavStrategy] Transition to download state 'active'", buf, 2u);
        }

        GEOGetRoutePreloaderLog();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v47;
        v49 = self->_signpostID;
        if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1885A9000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v49, "NavStrategy.Active", (const char *)&unk_189D97683, buf, 2u);
        }

        self->_downloadState = 0;
        goto LABEL_63;
      }
    }
    else
    {
      v35 = 0;
      v36 = self->_downloadState;
      v37 = -1;
    }
    if (v36)
      v38 = 0;
    else
      v38 = v37 == v33;
    if (v38)
    {
      GEOGetRoutePreloaderLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v39, OS_LOG_TYPE_DEBUG, "[NavStrategy] Transition to download state 'waiting'", buf, 2u);
      }

      self->_downloadState = 1;
      GEOGetRoutePreloaderLog();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v40;
      v42 = self->_signpostID;
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1885A9000, v41, OS_SIGNPOST_INTERVAL_END, v42, "NavStrategy.Active", (const char *)&unk_189D97683, buf, 2u);
      }

    }
    if (!v35)
      return;
LABEL_63:
    GEOGetRoutePreloaderLog();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      v51 = self->_stepSizeInMeters * (double)(v37 - a3) / 1000.0;
      *(_DWORD *)buf = 134217984;
      v87 = v51;
      _os_log_impl(&dword_1885A9000, v50, OS_LOG_TYPE_DEBUG, "[NavStrategy] Now at %.1fKM ahead.", buf, 0xCu);
    }

    return;
  }
  if (self->_currentLoadingSteps)
  {
    GEOGetRoutePreloaderLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "[NavStrategy] No more steps to load, but still have some in-progress.", buf, 2u);
    }

  }
  else if (anyErrors)
  {
    GEOGetRoutePreloaderLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v52, OS_LOG_TYPE_DEBUG, "[NavStrategy] Done loading, with some errors.", buf, 2u);
    }

    v53 = CFAbsoluteTimeGetCurrent() - self->_mostRecentErrorTime;
    if (v53 > 60.0)
    {
      v54 = objc_loadWeakRetained((id *)&self->_preloader);
      v55 = objc_msgSend(v54, "networkQuality") == 1;

      if (!v55)
      {
        GEOGetRoutePreloaderLog();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v87 = v53;
          _os_log_impl(&dword_1885A9000, v56, OS_LOG_TYPE_INFO, "[NavStrategy] It has been %{public}.0fs since last error occurred. Clearing errors", buf, 0xCu);
        }

        -[GEONavRoutePreloadStrategy _retryFailuresWithErrorsReset:](self, "_retryFailuresWithErrorsReset:", 1);
      }
    }
  }
  else
  {
    self->_finished = 1;
    GEOGetRoutePreloaderLog();
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = v57;
    v59 = self->_signpostID;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v58, OS_SIGNPOST_INTERVAL_END, v59, "NavStrategy.Active", (const char *)&unk_189D97683, buf, 2u);
    }

    GEOGetRoutePreloaderLog();
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = os_log_type_enabled(v60, OS_LOG_TYPE_INFO);

    if (v61)
    {
      v62 = -[NSMutableArray count](self->_steps, "count");
      v63 = self->_stepSizeInMeters;
      Current = CFAbsoluteTimeGetCurrent();
      beginTime = self->_beginTime;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v66 = self->_steps;
      v67 = 0;
      v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
      if (v68)
      {
        v69 = *(_QWORD *)v82;
        do
        {
          for (j = 0; j != v68; ++j)
          {
            if (*(_QWORD *)v82 != v69)
              objc_enumerationMutation(v66);
            v67 += *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j) + 64);
          }
          v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
        }
        while (v68);
      }

      GEOGetRoutePreloaderLog();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        tilesLoadedFromNetwork = self->_tilesLoadedFromNetwork;
        *(_DWORD *)buf = 134218752;
        v87 = *(double *)&tilesLoadedFromNetwork;
        v88 = 1024;
        *(_DWORD *)v89 = v67;
        *(_WORD *)&v89[4] = 2048;
        *(double *)&v89[6] = v63 * (double)v62 / 1000.0;
        *(_WORD *)&v89[14] = 2048;
        *(double *)&v89[16] = Current - beginTime;
        _os_log_impl(&dword_1885A9000, v71, OS_LOG_TYPE_INFO, "[NavStrategy] Fully loaded. %llu tiles (%{bytes}u) loaded from network for %.1fKM in %.0fs", buf, 0x26u);
      }

    }
  }
}

- (void)_performNextRequests
{
  unsigned int v3;
  unsigned int v4;
  double v5;
  double v6;
  int downloadState;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  double stepSizeInMeters;
  double v12;
  double v13;
  uint64_t *v14;
  uint64_t *v15;
  double *v16;
  double *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t *v26;
  uint64_t *v27;
  double *v28;
  double *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  double Double;
  double v41;
  double v42;
  double v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _DWORD *v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  __int128 v57;
  uint64_t v58;
  int64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  unint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  unint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!self->_enabled
    || self->_finished
    || self->_currentLoadingSteps > 1
    || !-[NSMutableArray count](self->_steps, "count")
    || self->_geodCrashTimer)
  {
    return;
  }
  v3 = vcvtad_u64_f64(self->_currentRoutePosition);
  if (-[GEOComposedRoute pointCount](self->_route, "pointCount") <= v3)
    v4 = -[GEOComposedRoute pointCount](self->_route, "pointCount");
  else
    v4 = vcvtad_u64_f64(self->_currentRoutePosition);
  -[GEOComposedRoute distanceFromPointIndex:toPointIndex:](self->_route, "distanceFromPointIndex:toPointIndex:", 0, v4);
  v6 = v5;
  downloadState = self->_downloadState;
  WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
  v9 = objc_msgSend(WeakRetained, "networkQuality");
  v10 = 0;
  stepSizeInMeters = self->_stepSizeInMeters;
  v12 = v6 / 1000.0;
  while (_downloadTruthTable[v10] != v9)
  {
    v10 += 5;
    if (v10 == 35)
    {
      v13 = 0.0;
      goto LABEL_20;
    }
  }
  v14 = &_downloadTruthTable[v10];
  v15 = v14 + 3;
  if (v12 <= 10.0)
    v15 = v14 + 1;
  v16 = (double *)(v14 + 4);
  v17 = (double *)(v14 + 2);
  if (v12 > 10.0)
    v17 = v16;
  if (downloadState)
    v17 = (double *)v15;
  v13 = *v17 * 1000.0;
LABEL_20:

  v18 = self->_downloadState;
  v19 = objc_loadWeakRetained((id *)&self->_preloader);
  v20 = objc_msgSend(v19, "networkQuality");
  v21 = 0;
  v63 = (uint64_t)(v13 / stepSizeInMeters);
  v22 = 4;
  v23 = 5;
  if (v20 != 7)
    v23 = v20;
  if (v20 != 6)
    v22 = v23;
  v24 = self->_stepSizeInMeters;
  while (_downloadTruthTable[v21] != v22)
  {
    v21 += 5;
    if (v21 == 35)
    {
      v25 = 0.0;
      goto LABEL_35;
    }
  }
  v26 = &_downloadTruthTable[v21];
  v27 = v26 + 3;
  if (v12 <= 10.0)
    v27 = v26 + 1;
  v28 = (double *)(v26 + 4);
  v29 = (double *)(v26 + 2);
  if (v12 > 10.0)
    v29 = v28;
  if (v18)
    v29 = (double *)v27;
  v25 = *v29 * 1000.0;
LABEL_35:

  if (!v63)
    return;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v30 = self->_steps;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v31)
  {
    v32 = 0;
    v33 = *(_QWORD *)v65;
    v34 = -1;
    v35 = -1;
    while (2)
    {
      v36 = 0;
      v61 = v31 + v32;
      do
      {
        if (*(_QWORD *)v65 != v33)
          objc_enumerationMutation(v30);
        v37 = *(double **)(*((_QWORD *)&v64 + 1) + 8 * v36);
        if (v37[3] >= self->_currentRoutePosition)
        {
          if (v35 < 0)
            v35 = v32 + v36;
          if (v34 < 0 && objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v36), "hasError"))
            v34 = v32 + v36;
          if ((objc_msgSend(v37, "okToLoad") & 1) != 0)
          {
            v38 = v32 + v36;
            goto LABEL_54;
          }
        }
        ++v36;
      }
      while (v31 != v36);
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      v32 = v61;
      if (v31)
        continue;
      break;
    }
  }
  else
  {
    v34 = -1;
    v35 = -1;
  }
  v38 = -1;
LABEL_54:
  v60 = v38;

  v39 = (uint64_t)(v25 / v24);
  v62 = v35 & ~(v35 >> 63);
  if (!self->_useCellularCoverage
    || (Double = GEOConfigGetDouble(GeoServicesConfig_RoutePreloaderAvailableCellularCoverageMinDistance, (uint64_t)off_1EDF4CE88), v41 = self->_stepSizeInMeters, v42 = GEOConfigGetDouble(GeoServicesConfig_RoutePreloaderMaxCellularUnavailableDistance, (uint64_t)off_1EDF4CE98), v43 = self->_stepSizeInMeters, v58 = -[NSMutableArray count](self->_steps, "count"), v58 - v62 < 1))
  {
    v48 = v63;
    goto LABEL_91;
  }
  v45 = 0;
  v46 = vcvtpd_u64_f64(Double / v41);
  v59 = vcvtpd_u64_f64(v42 / v43);
  v47 = (v58 - v62) & ~((v58 - v62) >> 63);
  *(_QWORD *)&v44 = 134349568;
  v57 = v44;
  v48 = v63;
  while (1)
  {
    v49 = v62 + v45;
    -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v62 + v45, v57);
    v50 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v50[18] == 2)
      break;
LABEL_82:

    if (v45 < v48 && ++v45 < v47)
      continue;
    goto LABEL_91;
  }
  if ((uint64_t)(v48 - v63) <= v59)
  {
    v51 = v46 + v45;
    if (v46 + v45 <= v48)
    {
      if (v49 >= v60)
      {
        GEOGetRoutePreloaderLog();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349312;
          v69 = v45;
          v70 = 2050;
          v71 = v58;
          _os_log_impl(&dword_1885A9000, v55, OS_LOG_TYPE_DEBUG, "[NavStrategy] Batch %{public}llu / %{public}llu has estimated \"unavailable\" cellular coverage, but it is already contained within the range we intended to load", buf, 0x16u);
        }

      }
    }
    else
    {
      if (v49 >= v60)
      {
        GEOGetRoutePreloaderLog();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v57;
          v69 = v45;
          v70 = 2050;
          v71 = v58;
          v72 = 2048;
          v73 = v46;
          _os_log_impl(&dword_1885A9000, v52, OS_LOG_TYPE_DEBUG, "[NavStrategy] Batch %{public}llu / %{public}llu has estimated \"unavailable\" cellular coverage. Will load until %lu subsequent batches have cellular coverage", buf, 0x20u);
        }

      }
      if ((uint64_t)v48 <= v51)
        v53 = v46 + v45;
      else
        v53 = v48;
      if (v47 >= v53)
        v48 = v53;
      else
        v48 = (v58 - v62) & ~((v58 - v62) >> 63);
      if (v39 <= v51)
        v54 = v46 + v45;
      else
        v54 = v39;
      if (v47 < v54)
        v54 = (v58 - v62) & ~((v58 - v62) >> 63);
      if (v45 <= v39)
        v39 = v54;
    }
    goto LABEL_82;
  }
  if (v49 >= v60)
  {
    GEOGetRoutePreloaderLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v69 = v45;
      v70 = 2050;
      v71 = v58;
      _os_log_impl(&dword_1885A9000, v56, OS_LOG_TYPE_DEBUG, "[NavStrategy] Batch %{public}llu / %{public}llu has estimated \"unavailable\" cellular coverage, but we have exceeded our allowable extension range", buf, 0x16u);
    }

  }
LABEL_91:
  -[GEONavRoutePreloadStrategy _performTileRequestsWithCurrentRoutePositionStepIndex:firstErrorStepIndex:firstLoadStepIndex:loadStepsAhead:loadStepsAheadIfNoWiFi:](self, "_performTileRequestsWithCurrentRoutePositionStepIndex:firstErrorStepIndex:firstLoadStepIndex:loadStepsAhead:loadStepsAheadIfNoWiFi:", v62, v34, v60, v48, v39);
}

- (void)start
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__GEONavRoutePreloadStrategy_start__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __35__GEONavRoutePreloadStrategy_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpostID;
  void *v7;
  void *v8;
  void *v9;
  GEOTileKeyList *v10;
  GEOTileKeyList *tilesLoadingOrLoaded;
  GEOTileKeyList *v12;
  GEOTileKeyList *tilesReceived;
  unint64_t v14;
  double stepSizeInMeters;
  void *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  if (self->_enabled)
    -[GEONavRoutePreloadStrategy _stop](self, "_stop");
  GEOGetRoutePreloaderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "[NavStrategy] Starting...", buf, 2u);
  }

  GEOGetRoutePreloaderLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "NavStrategy.Active", (const char *)&unk_189D97683, v18, 2u);
  }

  self->_enabled = 1;
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GEOTileLoaderClientIdentifier(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openForClient:", v8);

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openServerConnection");

  if (!self->_tileSetStyles)
  {
    -[GEONavRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:restrictions:](self, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 1, 11, 15, 0);
    -[GEONavRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:restrictions:](self, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 53, 11, 15, 0);
    -[GEONavRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:restrictions:](self, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 11, 11, 15, 0);
    -[GEONavRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:restrictions:](self, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 13, 11, 15, 0);
    -[GEONavRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:restrictions:](self, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 22, 11, 15, 0);
    -[GEONavRoutePreloadStrategy addTileSetStyle:betweenZoom:andZoom:restrictions:](self, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 20, 11, 15, 0);
  }
  v10 = objc_alloc_init(GEOTileKeyList);
  tilesLoadingOrLoaded = self->_tilesLoadingOrLoaded;
  self->_tilesLoadingOrLoaded = v10;

  v12 = objc_alloc_init(GEOTileKeyList);
  tilesReceived = self->_tilesReceived;
  self->_tilesReceived = v12;

  *(_WORD *)&self->_anyErrors = 0;
  self->_mostRecentErrorTime = 0.0;
  self->_beginTime = CFAbsoluteTimeGetCurrent();
  ++self->_stepGeneration;
  self->_currentLoadingSteps = 0;
  -[GEONavRoutePreloadStrategy _accumulateSteps](self, "_accumulateSteps");
  self->_currentRoutePosition = 0.0;
  v14 = -[NSMutableArray count](self->_steps, "count");
  stepSizeInMeters = self->_stepSizeInMeters;
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GEOTileLoaderClientIdentifier(self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "beginPreloadSessionOfSize:forClient:", vcvtd_n_u64_f64(stepSizeInMeters * (double)v14 / 1000.0 * 70.0, 0xAuLL), v17);

  -[GEONavRoutePreloadStrategy _performNextRequests](self, "_performNextRequests");
}

- (void)stop
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__GEONavRoutePreloadStrategy_stop__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __34__GEONavRoutePreloadStrategy_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

- (void)_stop
{
  NSObject *v3;
  NSObject *geodCrashTimer;
  OS_dispatch_source *v5;
  _BOOL4 enabled;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t signpostID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *steps;
  GEOSPRMetroAvailabilityFetcher *sprAvailabilityFetcher;
  GEOTileKeyList *tilesLoadingOrLoaded;
  GEOTileKeyList *tilesReceived;
  uint8_t v19[16];
  uint8_t buf[16];

  GEOGetRoutePreloaderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "[NavStrategy] Stopping...", buf, 2u);
  }

  geodCrashTimer = self->_geodCrashTimer;
  if (geodCrashTimer)
  {
    dispatch_source_cancel(geodCrashTimer);
    v5 = self->_geodCrashTimer;
    self->_geodCrashTimer = 0;

  }
  enabled = self->_enabled;
  self->_enabled = 0;
  -[GEONavRoutePreloadStrategy _cancelAllSteps](self, "_cancelAllSteps");
  if (enabled)
  {
    if (!self->_downloadState && !self->_finished)
    {
      GEOGetRoutePreloaderLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_WORD *)v19 = 0;
        _os_signpost_emit_with_name_impl(&dword_1885A9000, v8, OS_SIGNPOST_INTERVAL_END, signpostID, "NavStrategy.Active", (const char *)&unk_189D97683, v19, 2u);
      }

    }
    +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GEOTileLoaderClientIdentifier(self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endPreloadSessionForClient:", v11);

    +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOTileLoaderClientIdentifier(self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "closeForClient:", v13);

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "closeServerConnection");

  }
  steps = self->_steps;
  self->_steps = 0;

  sprAvailabilityFetcher = self->_sprAvailabilityFetcher;
  self->_sprAvailabilityFetcher = 0;

  tilesLoadingOrLoaded = self->_tilesLoadingOrLoaded;
  self->_tilesLoadingOrLoaded = 0;

  tilesReceived = self->_tilesReceived;
  self->_tilesReceived = 0;

  *(_WORD *)&self->_anyErrors = 0;
  self->_mostRecentErrorTime = 0.0;
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
  block[2] = __57__GEONavRoutePreloadStrategy_updateWithRoute_routeMatch___block_invoke;
  block[3] = &unk_1E1C05D70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

_BYTE *__57__GEONavRoutePreloadStrategy_updateWithRoute_routeMatch___block_invoke(id *a1)
{
  id v2;
  double v3;
  double v4;
  _BYTE *result;

  objc_storeStrong((id *)a1[4] + 3, a1[5]);
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
  *((double *)a1[4] + 5) = v4;
  result = a1[4];
  if (result[160])
  {
    objc_msgSend(result, "_stop");
    result = (_BYTE *)objc_msgSend(a1[4], "_start");
  }
  if (a1[6])
  {
    objc_msgSend(a1[4], "_cancelRequestsBehindCurrentPosition");
    return (_BYTE *)objc_msgSend(a1[4], "_performNextRequests");
  }
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
  v7[2] = __51__GEONavRoutePreloadStrategy_updateWithRouteMatch___block_invoke;
  v7[3] = &unk_1E1BFFF48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

uint64_t __51__GEONavRoutePreloadStrategy_updateWithRouteMatch___block_invoke(uint64_t a1)
{
  double v2;

  v2 = (double)objc_msgSend(*(id *)(a1 + 40), "routeCoordinate");
  *(double *)(*(_QWORD *)(a1 + 32) + 40) = v2
                                           + COERCE_FLOAT((unint64_t)objc_msgSend(*(id *)(a1 + 40), "routeCoordinate") >> 32);
  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestsBehindCurrentPosition");
  return objc_msgSend(*(id *)(a1 + 32), "_performNextRequests");
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  -[GEONavRoutePreloadStrategy _cancelAllSteps](self, "_cancelAllSteps", a3);
  if (self->_enabled)
  {
    -[GEONavRoutePreloadStrategy _stop](self, "_stop");
    -[GEONavRoutePreloadStrategy _start](self, "_start");
  }
}

- (GEORoutePreloadCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  objc_storeStrong((id *)&self->_camera, a3);
}

- (GEORoutePreloader)preloader
{
  return (GEORoutePreloader *)objc_loadWeakRetained((id *)&self->_preloader);
}

- (void)setPreloader:(id)a3
{
  objc_storeWeak((id *)&self->_preloader, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (BOOL)shouldLoadAssets
{
  return self->_shouldLoadAssets;
}

- (void)setShouldLoadAssets:(BOOL)a3
{
  self->_shouldLoadAssets = a3;
}

- (BOOL)forceDisableMetros
{
  return self->_forceDisableMetros;
}

- (void)setForceDisableMetros:(BOOL)a3
{
  self->_forceDisableMetros = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_sprAvailabilityFetcher, 0);
  objc_storeStrong((id *)&self->_tileSetStyles, 0);
  objc_storeStrong((id *)&self->_geodCrashTimer, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_tilesReceived, 0);
  objc_storeStrong((id *)&self->_tilesLoadingOrLoaded, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_preloader);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
