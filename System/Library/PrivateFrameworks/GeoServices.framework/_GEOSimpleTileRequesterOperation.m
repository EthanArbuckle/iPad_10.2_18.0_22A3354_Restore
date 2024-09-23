@implementation _GEOSimpleTileRequesterOperation

- (uint64_t)key
{
  return *(_QWORD *)(a1 + 40);
}

- (_GEOSimpleTileRequesterOperation)localizationTile
{
  return self->_localizationTile;
}

- (void)setLocalizationTile:(id)a3
{
  objc_storeStrong((id *)&self->_localizationTile, a3);
}

- (void)clearAllRelatedOperations
{
  -[_GEOSimpleTileRequesterOperation setBaseTile:](self, "setBaseTile:", 0);
  -[_GEOSimpleTileRequesterOperation setLocalizationTile:](self, "setLocalizationTile:", 0);
}

- (void)setBaseTile:(id)a3
{
  objc_storeStrong((id *)&self->_baseTile, a3);
}

- (unsigned)priority
{
  return atomic_load(&self->_priority);
}

- (void)dataURLSession:(id)a3 shouldConvertDataTask:(id)a4 toDownloadTaskForEstimatedResponseSize:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  _GEOTileKey *p_key;
  char v17;
  void *v18;
  uint64_t v19;
  os_activity_scope_state_s v20;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  v20.opaque[0] = 0;
  v20.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v20);
  -[_GEOSimpleTileRequesterOperation baseTile](self, "baseTile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

LABEL_6:
    v12[2](v12, 0);
    goto LABEL_7;
  }
  -[_GEOSimpleTileRequesterOperation localizationTile](self, "localizationTile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_6;
  -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  p_key = &self->_key;
  v17 = objc_msgSend(v15, "tileDataIsCacheableForTileKey:", &self->_key);

  if ((v17 & 1) == 0)
    goto LABEL_6;
  -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shouldDownloadToDiskForTileKey:estimatedDataSize:", p_key, a5);

  v12[2](v12, v19);
LABEL_7:
  os_activity_scope_leave(&v20);

}

- (void)cancel
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpostID;
  const char *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  if (self->_isRunning)
  {
    -[_GEOSimpleTileRequesterOperation baseTile](self, "baseTile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      GEOGetTileLoadingLog();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      signpostID = self->_signpostID;
      if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v4))
        goto LABEL_10;
      *(_WORD *)v10 = 0;
      v7 = "Loc.RequestFromNetwork";
    }
    else
    {
      GEOGetTileLoadingLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v5 = v8;
      signpostID = self->_signpostID;
      if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v8))
        goto LABEL_10;
      *(_WORD *)v10 = 0;
      v7 = "RequestFromNetwork";
    }
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v5, OS_SIGNPOST_INTERVAL_END, signpostID, v7, "Result=Canceled", v10, 2u);
LABEL_10:

  }
  self->_isRunning = 0;
  -[_GEOSimpleTileRequesterOperation task](self, "task", *(_QWORD *)v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

  -[_GEOSimpleTileRequesterOperation setTask:](self, "setTask:", 0);
  os_activity_scope_leave(&state);
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void)start
{
  unsigned int v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpostID;
  const char *v9;
  NSObject *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t BOOL;
  void *v16;
  void *v17;
  GEODataURLSession *dataSession;
  GEODataURLSession *v19;
  GEODataURLSession *v20;
  void *v21;
  float v22;
  double v23;
  uint64_t v24;
  float v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  const char *v34;
  NSObject *v35;
  NSObject *delegateQueue;
  _QWORD block[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  v3 = -[_GEOSimpleTileRequesterOperation priority](self, "priority");
  -[_GEOSimpleTileRequesterOperation baseTile](self, "baseTile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    GEOGetTileLoadingLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v7 = v10;
    signpostID = self->_signpostID;
    if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
      goto LABEL_9;
    *(_DWORD *)buf = 134217984;
    v40 = (double)v3 / 4294967290.0;
    v9 = "RequestFromNetwork";
  }
  else
  {
    GEOGetTileLoadingLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    signpostID = self->_signpostID;
    if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6))
      goto LABEL_9;
    *(_DWORD *)buf = 134217984;
    v40 = (double)v3 / 4294967290.0;
    v9 = "Loc.RequestFromNetwork";
  }
  _os_signpost_emit_with_name_impl(&dword_1885A9000, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, v9, "Priority=%{signpost.description:attribute}f", buf, 0xCu);
LABEL_9:

  GEOMachAbsoluteTimeGetCurrent();
  self->_startTime = v11;
  -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_checksumMethod = objc_msgSend(v12, "checksumMethodForIncomingTileDataWithKey:", &self->_key);

  v13 = (void *)MEMORY[0x1E0CB39E0];
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isInternalInstall"))
    BOOL = GEOConfigGetBOOL(GeoServicesConfig_AllowNonEVCerts, (uint64_t)off_1EDF4CFE8);
  else
    BOOL = 0;

  -[_GEOSimpleTileRequesterOperation URL](self, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsAnyHTTPSCertificate:forHost:", BOOL, v17);

  dataSession = self->_dataSession;
  if (dataSession)
  {
    v19 = dataSession;
  }
  else
  {
    +[GEODataURLSession sharedDataURLSession](GEODataURLSession, "sharedDataURLSession");
    v19 = (GEODataURLSession *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;
  if (self->_shouldDownloadToDisk)
  {
    -[_GEOSimpleTileRequesterOperation request](self, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = fmaxf(fminf((float)((float)((float)v3 * 2.3283e-10) * 0.78456) + 0.21544, 1.0), 0.21544);
    *(float *)&v23 = v22 * (float)(v22 * v22);
    -[GEODataURLSession downloadTaskWithRequest:priority:delegate:delegateQueue:](v20, "downloadTaskWithRequest:priority:delegate:delegateQueue:", v21, self, self->_delegateQueue, v23);
  }
  else
  {
    -[_GEOSimpleTileRequesterOperation request](self, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = fmaxf(fminf((float)((float)((float)v3 * 2.3283e-10) * 0.78456) + 0.21544, 1.0), 0.21544);
    *(float *)&v26 = v25 * (float)(v25 * v25);
    -[GEODataURLSession taskWithRequest:priority:delegate:delegateQueue:](v20, "taskWithRequest:priority:delegate:delegateQueue:", v21, self, self->_delegateQueue, v26);
  }
  v24 = objc_claimAutoreleasedReturnValue();
  -[_GEOSimpleTileRequesterOperation setTask:](self, "setTask:", v24);

  -[_GEOSimpleTileRequesterOperation task](self, "task");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = v27 == 0;

  if ((v24 & 1) != 0)
  {
    -[_GEOSimpleTileRequesterOperation baseTile](self, "baseTile");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      GEOGetTileLoadingLog();
      v35 = objc_claimAutoreleasedReturnValue();
      v32 = v35;
      v33 = self->_signpostID;
      if (v33 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v35))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v34 = "RequestFromNetwork";
    }
    else
    {
      GEOGetTileLoadingLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v33 = self->_signpostID;
      if (v33 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v31))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v34 = "Loc.RequestFromNetwork";
    }
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v32, OS_SIGNPOST_INTERVAL_END, v33, v34, "Result=Error", buf, 2u);
LABEL_28:

    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41___GEOSimpleTileRequesterOperation_start__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_async(delegateQueue, block);
    goto LABEL_29;
  }
  self->_isRunning = 1;
  -[_GEOSimpleTileRequesterOperation task](self, "task");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "start");

LABEL_29:
  os_activity_scope_leave(&state);
}

- (GEODataURLSessionTask)task
{
  return self->_task;
}

- (_GEOSimpleTileRequesterOperation)baseTile
{
  return self->_baseTile;
}

- (GEOSimpleTileRequesterOperationDelegate)delegate
{
  return (GEOSimpleTileRequesterOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[_GEOSimpleTileRequesterOperation request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (GEODataRequest)request
{
  return self->_request;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setTileLoaderCreateTime:(double)a3
{
  self->_tileLoaderCreateTime = a3;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void)setShouldDownloadToDisk:(BOOL)a3
{
  self->_shouldDownloadToDisk = a3;
}

- (void)setRequestingBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_requestingBundleId, a3);
}

- (void)setPriority:(unsigned int)a3
{
  float v3;
  float v4;
  double v5;
  id v6;

  atomic_store(a3, &self->_priority);
  v3 = fmaxf(fminf((float)((float)((float)a3 * 2.3283e-10) * 0.78456) + 0.21544, 1.0), 0.21544);
  v4 = v3 * (float)(v3 * v3);
  -[_GEOSimpleTileRequesterOperation task](self, "task");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v4;
  objc_msgSend(v6, "setPriority:", v5);

}

- (void)setParentTileActivity:(id)a3
{
  objc_storeStrong((id *)&self->_parentTileActivity, a3);
}

- (uint64_t)setKey:(uint64_t)a3
{
  *(_QWORD *)(result + 40) = a3;
  *(_QWORD *)(result + 48) = a4;
  return result;
}

- (void)setDataSession:(id)a3
{
  objc_storeStrong((id *)&self->_dataSession, a3);
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (_GEOSimpleTileRequesterOperation)initWithRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  _GEOSimpleTileRequesterOperation *v12;
  _GEOSimpleTileRequesterOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_GEOSimpleTileRequesterOperation;
  v12 = -[_GEOSimpleTileRequesterOperation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_delegateQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_signpostID = -1;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleId, 0);
  objc_storeStrong((id *)&self->_dataSession, 0);
  objc_storeStrong((id *)&self->_parentTileActivity, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localizationTile, 0);
  objc_storeStrong((id *)&self->_baseTile, 0);
  objc_storeStrong((id *)&self->_responseEtag, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (_GEOSimpleTileRequesterOperation)init
{

  return 0;
}

- (unint64_t)contentLength
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_GEOSimpleTileRequesterOperation data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "length");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  _BOOL8 finished;
  GEODataURLSessionTask *task;
  NSUInteger v7;
  $C4D369C9F02205611300857CFD58F739 v8;
  __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  finished = self->_finished;
  task = self->_task;
  v7 = -[NSData length](self->_data, "length");
  v8 = -[GEODataRequest kind](self->_request, "kind");
  v9 = CFSTR("RASTER_STANDARD");
  switch(v8.var1.var0)
  {
    case 0:
      break;
    case 1:
      v9 = CFSTR("VECTOR_STANDARD");
      break;
    case 2:
      v9 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
      break;
    case 3:
      v9 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
      break;
    case 4:
      v9 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
      break;
    case 5:
      v9 = CFSTR("RASTER_STANDARD_BACKGROUND");
      break;
    case 6:
      v9 = CFSTR("RASTER_HYBRID");
      break;
    case 7:
      v9 = CFSTR("RASTER_SATELLITE");
      break;
    case 8:
      v9 = CFSTR("RASTER_TERRAIN");
      break;
    case 0xB:
      v9 = CFSTR("VECTOR_BUILDINGS");
      break;
    case 0xC:
      v9 = CFSTR("VECTOR_TRAFFIC");
      break;
    case 0xD:
      v9 = CFSTR("VECTOR_POI");
      break;
    case 0xE:
      v9 = CFSTR("SPUTNIK_METADATA");
      break;
    case 0xF:
      v9 = CFSTR("SPUTNIK_C3M");
      break;
    case 0x10:
      v9 = CFSTR("SPUTNIK_DSM");
      break;
    case 0x11:
      v9 = CFSTR("SPUTNIK_DSM_GLOBAL");
      break;
    case 0x12:
      v9 = CFSTR("VECTOR_REALISTIC");
      break;
    case 0x13:
      v9 = CFSTR("VECTOR_LEGACY_REALISTIC");
      break;
    case 0x14:
      v9 = CFSTR("VECTOR_ROADS");
      break;
    case 0x15:
      v9 = CFSTR("RASTER_VEGETATION");
      break;
    case 0x16:
      v9 = CFSTR("VECTOR_TRAFFIC_SKELETON");
      break;
    case 0x17:
      v9 = CFSTR("RASTER_COASTLINE_MASK");
      break;
    case 0x18:
      v9 = CFSTR("RASTER_HILLSHADE");
      break;
    case 0x19:
      v9 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
      break;
    case 0x1A:
      v9 = CFSTR("VECTOR_TRAFFIC_STATIC");
      break;
    case 0x1B:
      v9 = CFSTR("RASTER_COASTLINE_DROP_MASK");
      break;
    case 0x1C:
      v9 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
      break;
    case 0x1D:
      v9 = CFSTR("VECTOR_SPEED_PROFILES");
      break;
    case 0x1E:
      v9 = CFSTR("VECTOR_VENUES");
      break;
    case 0x1F:
      v9 = CFSTR("RASTER_DOWN_SAMPLED");
      break;
    case 0x20:
      v9 = CFSTR("RASTER_COLOR_BALANCED");
      break;
    case 0x21:
      v9 = CFSTR("RASTER_SATELLITE_NIGHT");
      break;
    case 0x22:
      v9 = CFSTR("SPUTNIK_VECTOR_BORDER");
      break;
    case 0x23:
      v9 = CFSTR("RASTER_SATELLITE_DIGITIZE");
      break;
    case 0x24:
      v9 = CFSTR("RASTER_HILLSHADE_PARKS");
      break;
    case 0x25:
      v9 = CFSTR("VECTOR_TRANSIT");
      break;
    case 0x26:
      v9 = CFSTR("RASTER_STANDARD_BASE");
      break;
    case 0x27:
      v9 = CFSTR("RASTER_STANDARD_LABELS");
      break;
    case 0x28:
      v9 = CFSTR("RASTER_HYBRID_ROADS");
      break;
    case 0x29:
      v9 = CFSTR("RASTER_HYBRID_LABELS");
      break;
    case 0x2A:
      v9 = CFSTR("FLYOVER_C3M_MESH");
      break;
    case 0x2B:
      v9 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
      break;
    case 0x2C:
      v9 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
      break;
    case 0x2D:
      v9 = CFSTR("RASTER_SATELLITE_ASTC");
      break;
    case 0x2E:
      v9 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
      break;
    case 0x2F:
      v9 = CFSTR("VECTOR_TRANSIT_SELECTION");
      break;
    case 0x30:
      v9 = CFSTR("VECTOR_COVERAGE");
      break;
    case 0x34:
      v9 = CFSTR("FLYOVER_METADATA");
      break;
    case 0x35:
      v9 = CFSTR("VECTOR_ROAD_NETWORK");
      break;
    case 0x36:
      v9 = CFSTR("VECTOR_LAND_COVER");
      break;
    case 0x37:
      v9 = CFSTR("VECTOR_DEBUG");
      break;
    case 0x38:
      v9 = CFSTR("VECTOR_STREET_POI");
      break;
    case 0x39:
      v9 = CFSTR("MUNIN_METADATA");
      break;
    case 0x3A:
      v9 = CFSTR("VECTOR_SPR_MERCATOR");
      break;
    case 0x3B:
      v9 = CFSTR("VECTOR_SPR_MODELS");
      break;
    case 0x3C:
      v9 = CFSTR("VECTOR_SPR_MATERIALS");
      break;
    case 0x3D:
      v9 = CFSTR("VECTOR_SPR_METADATA");
      break;
    case 0x3E:
      v9 = CFSTR("VECTOR_TRACKS");
      break;
    case 0x3F:
      v9 = CFSTR("VECTOR_RESERVED_2");
      break;
    case 0x40:
      v9 = CFSTR("VECTOR_STREET_LANDMARKS");
      break;
    case 0x41:
      v9 = CFSTR("COARSE_LOCATION_POLYGONS");
      break;
    case 0x42:
      v9 = CFSTR("VECTOR_SPR_ROADS");
      break;
    case 0x43:
      v9 = CFSTR("VECTOR_SPR_STANDARD");
      break;
    case 0x44:
      v9 = CFSTR("VECTOR_POI_V2");
      break;
    case 0x45:
      v9 = CFSTR("VECTOR_POLYGON_SELECTION");
      break;
    case 0x46:
      v9 = CFSTR("VL_METADATA");
      break;
    case 0x47:
      v9 = CFSTR("VL_DATA");
      break;
    case 0x48:
      v9 = CFSTR("PROACTIVE_APP_CLIP");
      break;
    case 0x49:
      v9 = CFSTR("VECTOR_BUILDINGS_V2");
      break;
    case 0x4A:
      v9 = CFSTR("POI_BUSYNESS");
      break;
    case 0x4B:
      v9 = CFSTR("POI_DP_BUSYNESS");
      break;
    case 0x4C:
      v9 = CFSTR("SMART_INTERFACE_SELECTION");
      break;
    case 0x4D:
      v9 = CFSTR("VECTOR_ASSETS");
      break;
    case 0x4E:
      v9 = CFSTR("SPR_ASSET_METADATA");
      break;
    case 0x4F:
      v9 = CFSTR("VECTOR_SPR_POLAR");
      break;
    case 0x50:
      v9 = CFSTR("SMART_DATA_MODE");
      break;
    case 0x51:
      v9 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
      break;
    case 0x52:
      v9 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
      break;
    case 0x53:
      v9 = CFSTR("VECTOR_TOPOGRAPHIC");
      break;
    case 0x54:
      v9 = CFSTR("VECTOR_POI_V2_UPDATE");
      break;
    case 0x55:
      v9 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
      break;
    case 0x56:
      v9 = CFSTR("VECTOR_TRAFFIC_V2");
      break;
    case 0x57:
      v9 = CFSTR("VECTOR_ROAD_SELECTION");
      break;
    case 0x58:
      v9 = CFSTR("VECTOR_REGION_METADATA");
      break;
    case 0x59:
      v9 = CFSTR("RAY_TRACING");
      break;
    case 0x5A:
      v9 = CFSTR("VECTOR_CONTOURS");
      break;
    case 0x5B:
      v9 = CFSTR("RASTER_SATELLITE_POLAR");
      break;
    case 0x5C:
      v9 = CFSTR("VMAP4_ELEVATION");
      break;
    case 0x5D:
      v9 = CFSTR("VMAP4_ELEVATION_POLAR");
      break;
    case 0x5E:
      v9 = CFSTR("CELLULAR_COVERAGE_PLMN");
      break;
    case 0x5F:
      v9 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
      break;
    case 0x60:
      v9 = CFSTR("UNUSED_96");
      break;
    case 0x61:
      v9 = CFSTR("UNUSED_97");
      break;
    case 0x62:
      v9 = CFSTR("UNUSED_98");
      break;
    case 0x63:
      v9 = CFSTR("UNUSED_99");
      break;
    case 0x64:
      v9 = CFSTR("UNUSED_100");
      break;
    case 0x65:
      v9 = CFSTR("UNUSED_101");
      break;
    case 0x66:
      v9 = CFSTR("UNUSED_102");
      break;
    case 0x67:
      v9 = CFSTR("UNUSED_103");
      break;
    case 0x68:
      v9 = CFSTR("UNUSED_104");
      break;
    case 0x69:
      v9 = CFSTR("UNUSED_105");
      break;
    case 0x6A:
      v9 = CFSTR("UNUSED_106");
      break;
    case 0x6B:
      v9 = CFSTR("UNUSED_107");
      break;
    case 0x6C:
      v9 = CFSTR("UNUSED_108");
      break;
    case 0x6D:
      v9 = CFSTR("UNUSED_109");
      break;
    case 0x6E:
      v9 = CFSTR("UNUSED_110");
      break;
    case 0x6F:
      v9 = CFSTR("UNUSED_111");
      break;
    case 0x70:
      v9 = CFSTR("UNUSED_112");
      break;
    case 0x71:
      v9 = CFSTR("UNUSED_113");
      break;
    case 0x72:
      v9 = CFSTR("UNUSED_114");
      break;
    case 0x73:
      v9 = CFSTR("UNUSED_115");
      break;
    case 0x74:
      v9 = CFSTR("UNUSED_116");
      break;
    case 0x75:
      v9 = CFSTR("UNUSED_117");
      break;
    case 0x76:
      v9 = CFSTR("UNUSED_118");
      break;
    case 0x77:
      v9 = CFSTR("UNUSED_119");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), HIDWORD(*(unint64_t *)&v8));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> {_finished: %d, _task: %@, data:%zu bytes, kind: %@, other: %d%d}"), v4, self, finished, task, v7, v9, self->_baseTile != 0, self->_localizationTile != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (double)elapsed
{
  void *v2;
  double v3;
  double v4;

  -[_GEOSimpleTileRequesterOperation task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elapsedTime");
  v4 = v3;

  return v4;
}

- (double)startTime
{
  return self->_startTime;
}

- (int)httpResponseStatusCode
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[_GEOSimpleTileRequesterOperation task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "httpResponseCode");

  return v5;
}

- (unint64_t)responseMaxAge
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_GEOSimpleTileRequesterOperation task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = GEOCacheControlMaxAgeFromResponse(v3);

  return v4;
}

- (BOOL)responseIsCacheable
{
  return 1;
}

- (NSURL)downloadedFileURL
{
  void *v2;
  void *v3;

  -[_GEOSimpleTileRequesterOperation task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadedFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int v40;
  id v41;
  id v42;
  void *v43;
  int v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t signpostID;
  uint64_t v50;
  int v51;
  const char *v52;
  char v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL8 v58;
  NSObject *v59;
  uint64_t v60;
  int v61;
  void *v62;
  int v63;
  void *v64;
  char v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  BOOL v74;
  NSObject *v75;
  NSObject *v76;
  os_signpost_id_t v77;
  uint64_t v78;
  int v79;
  const char *v80;
  NSObject *v81;
  uint64_t v82;
  int v83;
  void *v84;
  int v85;
  double v86;
  id v87;
  double v88;
  unsigned int v89;
  id v90;
  id v91;
  id v92;
  id v93;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  double v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  int v100;
  __int16 v101;
  double v102;
  __int16 v103;
  double v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  GEOMachAbsoluteTimeGetCurrent();
  self->_endTime = v8;
  self->_isRunning = 0;
  v9 = v7;
  -[_GEOSimpleTileRequesterOperation task](self, "task");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v9, "failedDueToCancel");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v9, "clientMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "networkMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "transactionMetrics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = 0.0;
      if (v13 && v14)
      {
        v17 = 0.0;
        v18 = 0.0;
        v19 = 0.0;
        v20 = 0.0;
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v15, "lastObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "connectEnd");
          v88 = v22;
          objc_msgSend(v21, "connectStart");
          v86 = v23;
          objc_msgSend(v21, "domainLookupEnd");
          v25 = v24;
          objc_msgSend(v21, "domainLookupStart");
          v27 = v26;
          objc_msgSend(v21, "requestEnd");
          v29 = v28;
          objc_msgSend(v21, "requestStart");
          v31 = v30;
          objc_msgSend(v21, "responseEnd");
          v33 = v32;
          objc_msgSend(v21, "responseStart");
          v35 = v34;
          objc_msgSend(v21, "secureConnectEnd");
          v37 = v36;
          objc_msgSend(v21, "secureConnectStart");
          v39 = v38;

          v19 = v25 - v27;
          v18 = v29 - v31;
          v17 = v33 - v35;
          v16 = v37 - v39;
          v20 = v88 - v86;
        }
      }
      else
      {
        v17 = 0.0;
        v18 = 0.0;
        v19 = 0.0;
        v20 = 0.0;
      }
      v89 = -[_GEOSimpleTileRequesterOperation priority](self, "priority");
      v92 = 0;
      v93 = 0;
      v40 = objc_msgSend(v9, "didValidateEntityTagForData:entityTag:", &v93, &v92);
      v41 = v93;
      v42 = v92;
      v43 = v42;
      if (v41)
        v44 = v40;
      else
        v44 = 0;
      if (v44 == 1)
      {
        -[_GEOSimpleTileRequesterOperation baseTile](self, "baseTile");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45 == 0;

        if (v46)
        {
          GEOGetTileLoadingLog();
          v59 = objc_claimAutoreleasedReturnValue();
          v48 = v59;
          signpostID = self->_signpostID;
          if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v59))
            goto LABEL_24;
          v60 = objc_msgSend(v9, "receivedDataLength");
          v61 = objc_msgSend(v13, "httpResponseCode");
          *(_DWORD *)buf = 134219776;
          v96 = (double)v89 / 4294967290.0;
          v97 = 2048;
          v98 = v60;
          v99 = 1024;
          v100 = v61;
          v101 = 2048;
          v102 = v20;
          v103 = 2048;
          v104 = v19;
          v105 = 2048;
          v106 = v18;
          v107 = 2048;
          v108 = v17;
          v109 = 2048;
          v110 = v16;
          v52 = "RequestFromNetwork";
        }
        else
        {
          GEOGetTileLoadingLog();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = v47;
          signpostID = self->_signpostID;
          if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v47))
            goto LABEL_24;
          v50 = objc_msgSend(v9, "receivedDataLength");
          v51 = objc_msgSend(v13, "httpResponseCode");
          *(_DWORD *)buf = 134219776;
          v96 = (double)v89 / 4294967290.0;
          v97 = 2048;
          v98 = v50;
          v99 = 1024;
          v100 = v51;
          v101 = 2048;
          v102 = v20;
          v103 = 2048;
          v104 = v19;
          v105 = 2048;
          v106 = v18;
          v107 = 2048;
          v108 = v17;
          v109 = 2048;
          v110 = v16;
          v52 = "Loc.RequestFromNetwork";
        }
        _os_signpost_emit_with_name_impl(&dword_1885A9000, v48, OS_SIGNPOST_INTERVAL_END, signpostID, v52, "Result=Success Priority=%{signpost.description:attribute}f TileSize=%{signpost.description:attribute}lu HttpStatus=%{signpost.description:attribute}u ConnectTime=%{signpost.description:attribute}f DNSTime=%{signpost.description:attribute}f RequestTime=%{signpost.description:attribute}f ResponseTime=%{signpost.description:attribute}f SSLTime=%{signpost.description:attribute}f", buf, 0x4Eu);
LABEL_24:

        -[_GEOSimpleTileRequesterOperation setData:](self, "setData:", v41);
        -[_GEOSimpleTileRequesterOperation setResponseEtag:](self, "setResponseEtag:", v43);
        *(_WORD *)&self->_finished = 257;
        -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "shouldReportSuccessNetworkEventForTileKey:", &self->_key);

        if (v63)
          -[_GEOSimpleTileRequesterOperation _recordAnalyticsWithError:]((uint64_t)self, 0);
        -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "operationFinished:", self);

LABEL_27:
        v54 = v41;
        goto LABEL_28;
      }

      v91 = 0;
      v53 = objc_msgSend(v9, "validateTransportWithError:", &v91);
      v54 = v91;
      if ((v53 & 1) == 0)
      {
        -[_GEOSimpleTileRequesterOperation taskFailed:withError:]((uint64_t)self, v9, v54);
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(v9, "entityTag");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GEOSimpleTileRequesterOperation setResponseEtag:](self, "setResponseEtag:", v55);

      objc_msgSend(v9, "receivedData");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GEOSimpleTileRequesterOperation setData:](self, "setData:", v56);

      -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (objc_msgSend(v57, "shouldAllowEmptyDataForTileKey:", &self->_key) & 1) != 0 || self->_shouldDownloadToDisk;

      v90 = v54;
      v65 = objc_msgSend(v9, "validateTileResponse:error:", v58, &v90);
      v41 = v90;

      if ((v65 & 1) == 0)
      {
        -[_GEOSimpleTileRequesterOperation taskFailed:withError:]((uint64_t)self, v9, v41);
        v54 = v41;
        goto LABEL_28;
      }
      v87 = v9;
      -[_GEOSimpleTileRequesterOperation data](self, "data");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "length") == 0;

      if (v67)
      {

      }
      else
      {
        -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GEOSimpleTileRequesterOperation data](self, "data");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "verifyDataIntegrity:checksumMethod:", v69, self->_checksumMethod);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GEOSimpleTileRequesterOperation setData:](self, "setData:", v70);

        -[_GEOSimpleTileRequesterOperation data](self, "data");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v70) = v71 == 0;

        if ((_DWORD)v70)
        {
          GEOGetTileLoadingLog();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v72, OS_LOG_TYPE_ERROR, "Tile data did not pass integrity check.", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Tile data did not pass integrity check."));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[_GEOSimpleTileRequesterOperation setData:](self, "setData:", 0);
          -[_GEOSimpleTileRequesterOperation taskFailed:withError:]((uint64_t)self, v87, v43);
          goto LABEL_27;
        }
      }
      -[_GEOSimpleTileRequesterOperation baseTile](self, "baseTile");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73 == 0;

      if (v74)
      {
        GEOGetTileLoadingLog();
        v81 = objc_claimAutoreleasedReturnValue();
        v76 = v81;
        v77 = self->_signpostID;
        if (v77 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v81))
          goto LABEL_47;
        v82 = objc_msgSend(v87, "receivedDataLength");
        v83 = objc_msgSend(v13, "httpResponseCode");
        *(_DWORD *)buf = 134219776;
        v96 = (double)v89 / 4294967290.0;
        v97 = 2048;
        v98 = v82;
        v99 = 1024;
        v100 = v83;
        v101 = 2048;
        v102 = v20;
        v103 = 2048;
        v104 = v19;
        v105 = 2048;
        v106 = v18;
        v107 = 2048;
        v108 = v17;
        v109 = 2048;
        v110 = v16;
        v80 = "RequestFromNetwork";
      }
      else
      {
        GEOGetTileLoadingLog();
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = v75;
        v77 = self->_signpostID;
        if (v77 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v75))
          goto LABEL_47;
        v78 = objc_msgSend(v87, "receivedDataLength");
        v79 = objc_msgSend(v13, "httpResponseCode");
        *(_DWORD *)buf = 134219776;
        v96 = (double)v89 / 4294967290.0;
        v97 = 2048;
        v98 = v78;
        v99 = 1024;
        v100 = v79;
        v101 = 2048;
        v102 = v20;
        v103 = 2048;
        v104 = v19;
        v105 = 2048;
        v106 = v18;
        v107 = 2048;
        v108 = v17;
        v109 = 2048;
        v110 = v16;
        v80 = "Loc.RequestFromNetwork";
      }
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v76, OS_SIGNPOST_INTERVAL_END, v77, v80, "Result=Success Priority=%{signpost.description:attribute}f TileSize=%{signpost.description:attribute}lu HttpStatus=%{signpost.description:attribute}u ConnectTime=%{signpost.description:attribute}f DNSTime=%{signpost.description:attribute}f RequestTime=%{signpost.description:attribute}f ResponseTime=%{signpost.description:attribute}f SSLTime=%{signpost.description:attribute}f", buf, 0x4Eu);
LABEL_47:

      self->_finished = 1;
      -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "shouldReportSuccessNetworkEventForTileKey:", &self->_key);

      if (v85)
        -[_GEOSimpleTileRequesterOperation _recordAnalyticsWithError:]((uint64_t)self, 0);
      -[_GEOSimpleTileRequesterOperation delegate](self, "delegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "operationFinished:", self);
      goto LABEL_27;
    }
  }
LABEL_29:

  os_activity_scope_leave(&state);
}

- (void)_recordAnalyticsWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (a1)
  {
    v3 = a2;
    objc_msgSend((id)a1, "task");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v5, "copy");

    if ((GEOConfigGetBOOL(GeoServicesConfig_ReportTileNetworkEventDetails, (uint64_t)off_1EDF4CD68) & 1) != 0)
    {
      objc_msgSend((id)a1, "task");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "outgoingPayloadSize");
      objc_msgSend(v17, "networkMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRequestDataSize:", v7);

      objc_msgSend((id)a1, "task");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "incomingPayloadSize");
      objc_msgSend(v17, "networkMetrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setResponseDataSize:", v10);

      objc_msgSend((id)a1, "task");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "receivedRNFNotification");
      objc_msgSend(v17, "networkMetrics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRnfTriggered:", v13);

    }
    else
    {
      objc_msgSend(v17, "networkMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clearTransactionMetrics");
    }

    objc_msgSend(v17, "setQueuedTime:", *(double *)(a1 + 120) - *(double *)(a1 + 176));
    objc_msgSend((id)a1, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "additionalNetworkEventAnalyticsStatesForKey:", a1 + 40);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[GEONetworkEventDataRecorder recordNetworkEventDataForTileKey:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:](GEONetworkEventDataRecorder, "recordNetworkEventDataForTileKey:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), 0, v3, v17, v16);
  }
}

- (void)taskFailed:(void *)a3 withError:
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  int v49;
  double v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int v66;
  id v67;
  uint8_t buf[4];
  double v69;
  __int16 v70;
  _BYTE v71[10];
  _BYTE v72[10];
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend((id)a1, "priority");
    objc_msgSend((id)a1, "baseTile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    GEOGetTileLoadingLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 136);
    if (v8)
    {
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        v12 = (double)v7 / 4294967290.0;
        objc_msgSend(v6, "domain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v69 = v12;
        v70 = 2112;
        *(_QWORD *)v71 = v13;
        *(_WORD *)&v71[8] = 2048;
        *(_QWORD *)v72 = objc_msgSend(v6, "code");
        v14 = "Loc.RequestFromNetwork";
LABEL_9:
        _os_signpost_emit_with_name_impl(&dword_1885A9000, v10, OS_SIGNPOST_INTERVAL_END, v11, v14, "Result=Error Priority=%f ErrorDomain=%@ ErrorCode=%li", buf, 0x20u);

      }
    }
    else if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v15 = (double)v7 / 4294967290.0;
      objc_msgSend(v6, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v69 = v15;
      v70 = 2112;
      *(_QWORD *)v71 = v13;
      *(_WORD *)&v71[8] = 2048;
      *(_QWORD *)v72 = objc_msgSend(v6, "code");
      v14 = "RequestFromNetwork";
      goto LABEL_9;
    }

    if (objc_msgSend(v6, "code") == -11
      && (objc_msgSend(v6, "domain"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v16, "isEqualToString:", v17),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      v19 = -11;
    }
    else
    {
      if (objc_msgSend(v6, "code") != -1001
        || (objc_msgSend(v6, "domain"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0C930A8]),
            v20,
            !v21))
      {
        v46 = v6;
        goto LABEL_25;
      }
      v19 = -19;
    }
    objc_msgSend(v5, "elapsedTime");
    v23 = v22;
    GEOGetTileLoadingLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v67 = v5;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      GEOStringForError(v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_DWORD *)(a1 + 144);
      objc_msgSend((id)a1, "elapsed");
      v28 = v27;
      objc_msgSend((id)a1, "timeout");
      v30 = v29;
      objc_msgSend((id)a1, "data");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "length");
      objc_msgSend(v5, "originalRequestURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v69 = *(double *)&v25;
      v70 = 1024;
      *(_DWORD *)v71 = v26;
      *(_WORD *)&v71[4] = 1024;
      *(_DWORD *)&v71[6] = 3;
      *(_WORD *)v72 = 2048;
      *(_QWORD *)&v72[2] = v28;
      v73 = 2048;
      v74 = v30;
      v75 = 2048;
      v76 = v32;
      v77 = 2112;
      v78 = v33;
      _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Task failed because of %{public}@, attempt %u/%u, taking %.3lf/%.3lf sec, size=%lu, URL=%@", buf, 0x40u);

      v5 = v67;
    }

    v34 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(sel_taskFailed_withError_);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    GEOStringForError(v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(unsigned int *)(a1 + 144);
    objc_msgSend((id)a1, "elapsed");
    v39 = v38;
    objc_msgSend((id)a1, "timeout");
    v41 = v40;
    objc_msgSend((id)a1, "data");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "length");
    objc_msgSend(v5, "originalRequestURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("%@ failed because of %@, attempt %u/%u, taking %.3lf/%.3lf sec, size=%lu, URL=%@"), v35, v36, v37, 3, v39, v41, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", v19, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)a1, "timeout");
    if (v23 < v47 && *(int *)(a1 + 144) <= 2)
    {
      objc_msgSend((id)a1, "delegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "shouldReportErrorNetworkEventWithRertryForTileKey:", a1 + 40);

      if (v49)
        -[_GEOSimpleTileRequesterOperation _recordAnalyticsWithError:](a1, v46);
      objc_msgSend((id)a1, "timeout");
      objc_msgSend((id)a1, "setTimeout:", v50 - v23);
      ++*(_DWORD *)(a1 + 144);
      objc_msgSend((id)a1, "start");
      v5 = v67;
LABEL_32:

      v6 = v46;
      goto LABEL_33;
    }

    v5 = v67;
LABEL_25:
    objc_msgSend(v46, "userInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = *MEMORY[0x1E0CB3300];
    objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3300]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v53)
    {
      v54 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(v46, "userInfo");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v54, "initWithDictionary:", v55);

      objc_msgSend(v5, "originalRequestURL");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "absoluteString");
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)v58;
      v60 = CFSTR("(nil)");
      if (v58)
        v60 = (__CFString *)v58;
      v61 = v60;

      objc_msgSend(v56, "setObject:forKeyedSubscript:", v61, v52);
      v62 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v46, "domain");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "errorWithDomain:code:userInfo:", v63, objc_msgSend(v46, "code"), v56);
      v64 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)v64;
    }
    objc_msgSend((id)a1, "delegate");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "shouldReportErrorNetworkEventForTileKey:", a1 + 40);

    if (v66)
      -[_GEOSimpleTileRequesterOperation _recordAnalyticsWithError:](a1, v46);
    objc_msgSend((id)a1, "delegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "operationFailed:error:", a1, v46);
    goto LABEL_32;
  }
LABEL_33:

}

- (GEODataURLSession)dataSession
{
  return self->_dataSession;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (OS_os_activity)parentTileActivity
{
  return self->_parentTileActivity;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (BOOL)finished
{
  return self->_finished;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSString)responseEtag
{
  return self->_responseEtag;
}

- (void)setResponseEtag:(id)a3
{
  objc_storeStrong((id *)&self->_responseEtag, a3);
}

- (BOOL)isExistingCachedDataCurrent
{
  return self->_existingCachedDataCurrent;
}

- (BOOL)shouldDownloadToDisk
{
  return self->_shouldDownloadToDisk;
}

- (NSString)requestingBundleId
{
  return self->_requestingBundleId;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (void)setRequestingBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_requestingBundleVersion, a3);
}

- (double)tileLoaderCreateTime
{
  return self->_tileLoaderCreateTime;
}

@end
