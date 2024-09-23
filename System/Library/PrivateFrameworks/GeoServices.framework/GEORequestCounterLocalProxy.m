@implementation GEORequestCounterLocalProxy

- (void)placeCacheRegisterCacheResult:(unsigned __int8)a3 forApp:(id)a4 requestType:(int)a5 timestamp:(id)a6
{
  -[GEORequestCounterPersistence addPlaceCacheResultForApp:timestamp:requestTypeRaw:result:](self->_persistence, "addPlaceCacheResultForApp:timestamp:requestTypeRaw:result:", a4, a6, *(_QWORD *)&a5, a3);
}

- (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  GEORequestCounterPersistence *persistence;
  void *v11;

  v8 = a5;
  v9 = a4;
  if (-[GEORequestCounterLocalProxy countersEnabled](self, "countersEnabled"))
    persistence = self->_persistence;
  else
    persistence = 0;
  +[_GEOLocalRequestCounterTicket requestCounterTicketForType:auditToken:traits:persistence:](_GEOLocalRequestCounterTicket, "requestCounterTicketForType:auditToken:traits:persistence:", a3, v9, v8, persistence);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)countersEnabled
{
  return GEOConfigGetBOOL(GeoServicesConfig_RequestCounterEnabledDefault, (uint64_t)off_1EDF4D518);
}

- (GEORequestCounterLocalProxy)init
{
  void *v3;
  GEORequestCounterLocalProxy *v4;

  +[GEORequestCounterPersistence sharedInstance](GEORequestCounterPersistence, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GEORequestCounterLocalProxy initWithPersistence:](self, "initWithPersistence:", v3);

  return v4;
}

- (GEORequestCounterLocalProxy)initWithPersistence:(id)a3
{
  id v5;
  GEORequestCounterLocalProxy *v6;
  GEORequestCounterLocalProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORequestCounterLocalProxy;
  v6 = -[GEORequestCounterLocalProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistence, a3);
    -[GEORequestCounterPersistence setEnabled:](v7->_persistence, "setEnabled:", -[GEORequestCounterLocalProxy countersEnabled](v7, "countersEnabled"));
  }

  return v7;
}

- (void)setCountersEnabled:(BOOL)a3
{
  -[GEORequestCounterPersistence setEnabled:](self->_persistence, "setEnabled:");
  GEOConfigSetBOOL(GeoServicesConfig_RequestCounterEnabledDefault, (uint64_t)off_1EDF4D518);
}

- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  GEORequestCounterPersistence *persistence;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v10);
      v12 = v11;

      if (v12 >= 0.0)
      {
        persistence = self->_persistence;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __64__GEORequestCounterLocalProxy_readRequestsPerAppDuring_handler___block_invoke;
        v21[3] = &unk_1E1C02190;
        v22 = v8;
        -[GEORequestCounterPersistence countsDuring:withCompletion:](persistence, "countsDuring:withCompletion:", v7, v21);
        v15 = v22;
        goto LABEL_14;
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ needs a start date that is in the past"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138543362;
      v24 = v15;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ needs an interval that is not nil"), v19);
      v15 = objc_claimAutoreleasedReturnValue();

      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, v15);
        v17 = objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, NSObject *))v8 + 2))(v8, 0, v17);
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138543362;
      v24 = v15;
    }
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    goto LABEL_11;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v17 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v17;
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "%{public}@ needs a handler", buf, 0xCu);
LABEL_12:

  }
LABEL_14:

}

uint64_t __64__GEORequestCounterLocalProxy_readRequestsPerAppDuring_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)readRequestLogsDuring:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  GEORequestCounterPersistence *persistence;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v10);
      v12 = v11;

      if (v12 >= 0.0)
      {
        persistence = self->_persistence;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __61__GEORequestCounterLocalProxy_readRequestLogsDuring_handler___block_invoke;
        v21[3] = &unk_1E1C021B8;
        v22 = v8;
        -[GEORequestCounterPersistence logsDuring:withCompletion:](persistence, "logsDuring:withCompletion:", v7, v21);
        v15 = v22;
        goto LABEL_14;
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ needs a start date that is in the past"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138543362;
      v24 = v15;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ needs an interval that is not nil"), v19);
      v15 = objc_claimAutoreleasedReturnValue();

      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, v15);
        v17 = objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, NSObject *))v8 + 2))(v8, 0, v17);
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138543362;
      v24 = v15;
    }
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    goto LABEL_11;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterLocalProxy");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v17 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v17;
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "%{public}@ needs a handler", buf, 0xCu);
LABEL_12:

  }
LABEL_14:

}

uint64_t __61__GEORequestCounterLocalProxy_readRequestLogsDuring_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearCounters
{
  -[GEORequestCounterPersistence purgeAllCounts](self->_persistence, "purgeAllCounts");
}

- (void)startedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4
{
  -[GEORequestCounterPersistence startedProactiveTileDownloadForIdentifier:policy:](self->_persistence, "startedProactiveTileDownloadForIdentifier:policy:", a3, a4);
}

- (void)finishedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4 tilesConsidered:(unsigned int)a5 tileDownloadAttempts:(unsigned int)a6 successes:(unsigned int)a7 failures:(unsigned int)a8 bytesDownloaded:(unint64_t)a9
{
  -[GEORequestCounterPersistence finishedProactiveTileDownloadForIdentifier:policy:tilesConsidered:tileDownloadAttempts:successes:failures:bytesDownloaded:](self->_persistence, "finishedProactiveTileDownloadForIdentifier:policy:tilesConsidered:tileDownloadAttempts:successes:failures:bytesDownloaded:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
}

- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4
{
  -[GEORequestCounterPersistence readProactiveTileDownloadsSince:handler:](self->_persistence, "readProactiveTileDownloadsSince:handler:", a3, a4);
}

- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
  -[GEORequestCounterPersistence recordRoutePreloadSessionAt:transportType:tilesPreloaded:tilesUsed:tilesMissed:](self->_persistence, "recordRoutePreloadSessionAt:transportType:tilesPreloaded:tilesUsed:tilesMissed:", a3, a4, a5, a6, a7);
}

- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
  -[GEORequestCounterPersistence fetchRoutePreloadSessionsFrom:completion:completionQueue:](self->_persistence, "fetchRoutePreloadSessionsFrom:completion:completionQueue:", a3, a4, a5);
}

- (id)externalRequestCounterTicketForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6
{
  return +[_GEOLocalExternalRequestCounterTicket externalRequestCounterForType:subtype:source:appId:persistence:](_GEOLocalExternalRequestCounterTicket, "externalRequestCounterForType:subtype:source:appId:persistence:", a3, a4, a5, a6, self->_persistence);
}

- (void)externalRequestsCount:(id)a3
{
  id v4;
  void *v5;
  GEORequestCounterPersistence *persistence;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    persistence = self->_persistence;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__GEORequestCounterLocalProxy_externalRequestsCount___block_invoke;
    v7[3] = &unk_1E1C0F758;
    v8 = v4;
    -[GEORequestCounterPersistence externalRequestsCount:](persistence, "externalRequestsCount:", v7);

  }
}

uint64_t __53__GEORequestCounterLocalProxy_externalRequestsCount___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)placeCacheGetCounts:(unint64_t)a3 forApp:(id)a4 inTimeRange:(id)a5 ofType:(int)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  GEORequestCounterLocalProxy *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  GEORequestCounterPersistence *persistence;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  int v38;
  BOOL v39;
  BOOL v40;
  _QWORD v41[4];
  id v42;
  int v43;
  BOOL v44;
  BOOL v45;
  _QWORD v46[4];
  id v47;
  BOOL v48;
  _QWORD v49[4];
  int v50;
  BOOL v51;

  v12 = a4;
  v13 = a5;
  v28 = a7;
  if (!v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v15 = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v14, "initWithStartDate:endDate:", v16, v17);

    self = v15;
  }
  v18 = objc_msgSend(v12, "length", v28) == 0;
  v19 = MEMORY[0x1E0C809B0];
  switch(a3)
  {
    case 0uLL:
      v20 = &__block_literal_global_17_0;
      v21 = &__block_literal_global_115;
      break;
    case 1uLL:
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_4;
      v49[3] = &__block_descriptor_37_e52___GEORequestCounterCacheResults_20__0__NSString_8i16l;
      v51 = a6 == 0;
      v50 = a6;
      v20 = (void *)MEMORY[0x18D765024](v49);
      v21 = &__block_literal_global_19;
      break;
    case 2uLL:
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_6;
      v46[3] = &unk_1E1C0F800;
      v48 = v18;
      v47 = v12;
      v20 = (void *)MEMORY[0x18D765024](v46);

      v21 = &__block_literal_global_21_0;
      break;
    case 3uLL:
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_8;
      v41[3] = &unk_1E1C0F828;
      v44 = v18;
      v42 = v12;
      v45 = a6 == 0;
      v43 = a6;
      v20 = (void *)MEMORY[0x18D765024](v41);

      v21 = &__block_literal_global_23_0;
      break;
    default:
      v21 = 0;
      v20 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  persistence = self->_persistence;
  v33[0] = v19;
  v33[1] = 3221225472;
  v33[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_9;
  v33[3] = &unk_1E1C0F850;
  v39 = a6 == 0;
  v38 = a6;
  v40 = v18;
  v34 = v12;
  v36 = v21;
  v35 = v22;
  v37 = v20;
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_28;
  v30[3] = &unk_1E1C0F878;
  v31 = v35;
  v32 = v29;
  v24 = v35;
  v25 = v29;
  v26 = v20;
  v27 = v12;
  -[GEORequestCounterPersistence getPlaceCacheResultsInTimeRange:rawCounts:complete:](persistence, "getPlaceCacheResultsInTimeRange:rawCounts:complete:", v13, v33, v30);

}

uint64_t __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%d"), a2, a3);
}

GEORequestCounterCacheResults *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  GEORequestCounterCacheResults *v5;

  v4 = a2;
  v5 = objc_alloc_init(GEORequestCounterCacheResults);
  -[GEORequestCounterCacheResults setAppId:](v5, "setAppId:", v4);

  -[GEORequestCounterCacheResults setRequestKindRaw:](v5, "setRequestKindRaw:", a3);
  return v5;
}

id __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_3(int a1, id a2)
{
  return a2;
}

GEORequestCounterCacheResults *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  GEORequestCounterCacheResults *v4;

  v3 = a2;
  v4 = objc_alloc_init(GEORequestCounterCacheResults);
  -[GEORequestCounterCacheResults setAppId:](v4, "setAppId:", v3);

  if (!*(_BYTE *)(a1 + 36))
    -[GEORequestCounterCacheResults setRequestKindRaw:](v4, "setRequestKindRaw:", *(unsigned int *)(a1 + 32));
  return v4;
}

uint64_t __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_5()
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
}

GEORequestCounterCacheResults *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  GEORequestCounterCacheResults *v5;

  v5 = objc_alloc_init(GEORequestCounterCacheResults);
  -[GEORequestCounterCacheResults setRequestKindRaw:](v5, "setRequestKindRaw:", a3);
  if (!*(_BYTE *)(a1 + 40))
    -[GEORequestCounterCacheResults setAppId:](v5, "setAppId:", *(_QWORD *)(a1 + 32));
  return v5;
}

const __CFString *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_7()
{
  return &stru_1E1C241D0;
}

GEORequestCounterCacheResults *__85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_8(uint64_t a1)
{
  GEORequestCounterCacheResults *v2;
  GEORequestCounterCacheResults *v3;

  v2 = objc_alloc_init(GEORequestCounterCacheResults);
  v3 = v2;
  if (!*(_BYTE *)(a1 + 44))
    -[GEORequestCounterCacheResults setAppId:](v2, "setAppId:", *(_QWORD *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 45))
    -[GEORequestCounterCacheResults setRequestKindRaw:](v3, "setRequestKindRaw:", *(unsigned int *)(a1 + 40));
  return v3;
}

void __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_9(uint64_t a1, void *a2, void *a3, int a4, int a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _DWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if ((*(_BYTE *)(a1 + 68) || *(_DWORD *)(a1 + 64) == a4)
    && (*(_BYTE *)(a1 + 69) || objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32))))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setStartTime:", v13);

        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setEndTime:", v14);

        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v11);
      }
      switch(a5)
      {
        case 0:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            v19[0] = 67109120;
            v19[1] = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid cache result: %d", (uint8_t *)v19, 8u);
          }
          break;
        case 1:
          objc_msgSend(v12, "setCacheHitCount:", objc_msgSend(v12, "cacheHitCount") + 1);
          break;
        case 2:
          objc_msgSend(v12, "setCacheMissCount:", objc_msgSend(v12, "cacheMissCount") + 1);
          break;
        case 3:
          objc_msgSend(v12, "setCacheExpiredCount:", objc_msgSend(v12, "cacheExpiredCount") + 1);
          break;
        default:
          break;
      }
      objc_msgSend(v12, "startTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "compare:", v15);

      if (v16 == -1)
        objc_msgSend(v12, "setStartTime:", v10);
      objc_msgSend(v12, "endTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v10, "compare:", v17);

      if (v18 == 1)
        objc_msgSend(v12, "setEndTime:", v10);

    }
  }

}

void __85__GEORequestCounterLocalProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
}

@end
