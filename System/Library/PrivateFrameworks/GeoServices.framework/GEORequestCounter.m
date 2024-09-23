@implementation GEORequestCounter

- (void)placeCacheRegisterCacheResult:(unsigned __int8)a3 forApp:(id)a4 requestType:(int)a5 timestamp:(id)a6
{
  -[GEORequestCounterProtocol placeCacheRegisterCacheResult:forApp:requestType:timestamp:](self->_proxy, "placeCacheRegisterCacheResult:forApp:requestType:timestamp:", a3, a4, *(_QWORD *)&a5, a6);
}

+ (id)sharedCounter
{
  if (qword_1ECDBB988 != -1)
    dispatch_once(&qword_1ECDBB988, &__block_literal_global_384);
  return (id)qword_1ECDBB980;
}

- (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5
{
  return (id)-[GEORequestCounterProtocol requestCounterTicketForType:auditToken:traits:](self->_proxy, "requestCounterTicketForType:auditToken:traits:", a3, a4, a5);
}

+ (void)useProxy:(Class)a3
{
  _proxyClass = (uint64_t)a3;
}

+ (void)useLocalProxy
{
  objc_msgSend(a1, "useProxy:", objc_opt_class());
}

+ (void)useRemoteProxy
{
  objc_msgSend(a1, "useProxy:", objc_opt_class());
}

void __34__GEORequestCounter_sharedCounter__block_invoke()
{
  GEORequestCounter *v0;
  void *v1;

  v0 = objc_alloc_init(GEORequestCounter);
  v1 = (void *)qword_1ECDBB980;
  qword_1ECDBB980 = (uint64_t)v0;

}

- (GEORequestCounter)init
{
  GEORequestCounter *v2;
  objc_class *v3;
  GEORequestCounterProtocol *v4;
  GEORequestCounterProtocol *proxy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORequestCounter;
  v2 = -[GEORequestCounter init](&v7, sel_init);
  if (v2)
  {
    v3 = (objc_class *)_proxyClass;
    if (!_proxyClass)
    {
      objc_msgSend((id)objc_opt_class(), "useRemoteProxy");
      v3 = (objc_class *)_proxyClass;
    }
    v4 = (GEORequestCounterProtocol *)objc_alloc_init(v3);
    proxy = v2->_proxy;
    v2->_proxy = v4;

  }
  return v2;
}

- (BOOL)countersEnabled
{
  return -[GEORequestCounterProtocol countersEnabled](self->_proxy, "countersEnabled");
}

- (void)setCountersEnabled:(BOOL)a3
{
  -[GEORequestCounterProtocol setCountersEnabled:](self->_proxy, "setCountersEnabled:", a3);
}

- (void)readRequestsPerAppSince:(id)a3 handler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0CB3588];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v8, v11);

  -[GEORequestCounter readRequestsPerAppDuring:handler:](self, "readRequestsPerAppDuring:handler:", v10, v7);
}

- (void)readRequestLogsSince:(id)a3 handler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0CB3588];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v8, v11);

  -[GEORequestCounter readRequestLogsDuring:handler:](self, "readRequestLogsDuring:handler:", v10, v7);
}

- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  GEORequestCounterProtocol *proxy;
  _QWORD v19[4];
  NSObject *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
        proxy = self->_proxy;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __54__GEORequestCounter_readRequestsPerAppDuring_handler___block_invoke;
        v19[3] = &unk_1E1C02190;
        v20 = v8;
        -[GEORequestCounterProtocol readRequestsPerAppDuring:handler:](proxy, "readRequestsPerAppDuring:handler:", v7, v19);
        v16 = v20;
        goto LABEL_13;
      }
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      v15 = "%{public}@ needs a start date that is in the past";
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -12);
        v16 = objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, NSObject *))v8 + 2))(v8, 0, v16);
        goto LABEL_13;
      }
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      v15 = "%{public}@ needs an interval that is not nil";
    }
    _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_11;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v17;
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "%{public}@ needs a handler", buf, 0xCu);

  }
LABEL_13:

}

uint64_t __54__GEORequestCounter_readRequestsPerAppDuring_handler___block_invoke(uint64_t a1)
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
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  GEORequestCounterProtocol *proxy;
  _QWORD v19[4];
  NSObject *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
        proxy = self->_proxy;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __51__GEORequestCounter_readRequestLogsDuring_handler___block_invoke;
        v19[3] = &unk_1E1C021B8;
        v20 = v8;
        -[GEORequestCounterProtocol readRequestLogsDuring:handler:](proxy, "readRequestLogsDuring:handler:", v7, v19);
        v16 = v20;
        goto LABEL_13;
      }
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      v15 = "%{public}@ needs a start date that is in the past";
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -12);
        v16 = objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, NSObject *))v8 + 2))(v8, 0, v16);
        goto LABEL_13;
      }
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      v15 = "%{public}@ needs an interval that is not nil";
    }
    _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_11;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v17;
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "%{public}@ needs a handler", buf, 0xCu);

  }
LABEL_13:

}

uint64_t __51__GEORequestCounter_readRequestLogsDuring_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearCounters
{
  -[GEORequestCounterProtocol clearCounters](self->_proxy, "clearCounters");
}

- (void)startedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4
{
  -[GEORequestCounterProtocol startedProactiveTileDownloadForIdentifier:policy:](self->_proxy, "startedProactiveTileDownloadForIdentifier:policy:", a3, a4);
}

- (void)finishedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4 tilesConsidered:(unsigned int)a5 tileDownloadAttempts:(unsigned int)a6 successes:(unsigned int)a7 failures:(unsigned int)a8 bytesDownloaded:(unint64_t)a9
{
  -[GEORequestCounterProtocol finishedProactiveTileDownloadForIdentifier:policy:tilesConsidered:tileDownloadAttempts:successes:failures:bytesDownloaded:](self->_proxy, "finishedProactiveTileDownloadForIdentifier:policy:tilesConsidered:tileDownloadAttempts:successes:failures:bytesDownloaded:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
}

- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4
{
  -[GEORequestCounterProtocol readProactiveTileDownloadsSince:handler:](self->_proxy, "readProactiveTileDownloadsSince:handler:", a3, a4);
}

- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
  -[GEORequestCounterProtocol recordRoutePreloadSessionAt:transportType:tilesPreloaded:tilesUsed:tilesMissed:](self->_proxy, "recordRoutePreloadSessionAt:transportType:tilesPreloaded:tilesUsed:tilesMissed:", a3, a4, a5, a6, a7);
}

- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
  -[GEORequestCounterProtocol fetchRoutePreloadSessionsFrom:completion:completionQueue:](self->_proxy, "fetchRoutePreloadSessionsFrom:completion:completionQueue:", a3, a4, a5);
}

- (id)externalRequestCounterTicketForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6
{
  return (id)-[GEORequestCounterProtocol externalRequestCounterTicketForType:subtype:source:appId:](self->_proxy, "externalRequestCounterTicketForType:subtype:source:appId:", a3, a4, a5, a6);
}

- (void)externalRequestsCount:(id)a3
{
  -[GEORequestCounterProtocol externalRequestsCount:](self->_proxy, "externalRequestsCount:", a3);
}

- (void)placeCacheGetCounts:(unint64_t)a3 forApp:(id)a4 inTimeRange:(id)a5 ofType:(int)a6 handler:(id)a7
{
  -[GEORequestCounterProtocol placeCacheGetCounts:forApp:inTimeRange:ofType:handler:](self->_proxy, "placeCacheGetCounts:forApp:inTimeRange:ofType:handler:", a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
