@implementation MNTracePlayerETAUpdater

- (void)playETAUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MNSessionUpdateResponseInfo *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MNSessionUpdateManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateManager:willSendETARequest:", self, v6);

  objc_msgSend(v4, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MNSessionUpdateResponseInfo);
  -[MNSessionUpdateResponseInfo setRequest:](v10, "setRequest:", v7);
  -[MNSessionUpdateResponseInfo setResponse:](v10, "setResponse:", v8);
  -[MNSessionUpdateResponseInfo setError:](v10, "setError:", v9);
  -[MNSessionUpdateManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "routeInfoForUpdateManager:reason:", self, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "requestTimestamp");
      v15 = v14;
      objc_msgSend(v4, "responseTimestamp");
      *(_DWORD *)buf = 134218240;
      v33 = v15;
      v34 = 2048;
      v35 = v16;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Playing ETAU error from trace at timestamp %0.1fs | %0.1fs.", buf, 0x16u);
    }

    -[MNSessionUpdateManager _handleETAResponse:forRouteInfo:etaRoute:reason:](self, "_handleETAResponse:forRouteInfo:etaRoute:reason:", v10, v12, 0, 7);
  }
  else if (v8)
  {
    v31 = v8;
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "requestTimestamp");
      v19 = v18;
      objc_msgSend(v4, "responseTimestamp");
      *(_DWORD *)buf = 134218240;
      v33 = v19;
      v34 = 2048;
      v35 = v20;
      _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_DEFAULT, "Playing ETAU response from trace at timestamp %0.1fs | %0.1fs.", buf, 0x16u);
    }

    -[MNSessionUpdateManager delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "userLocationForUpdateManager:", self);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x1E0D26F98]);
    objc_msgSend(v12, "route");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "routeMatch");
    v29 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNSessionUpdateManager delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "targetLegIndex");
    -[MNSessionUpdateManager delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "prepareForRequest:route:routeMatch:targetLegIndex:state:", v7, v28, v23, v27, objc_msgSend(v25, "state"));

    v12 = v29;
    -[MNSessionUpdateManager _updateWaypointsForRequest:routeInfo:userLocation:etaRoute:](self, "_updateWaypointsForRequest:routeInfo:userLocation:etaRoute:", v7, v29, v30, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNSessionUpdateResponseInfo setWaypoints:](v10, "setWaypoints:", v26);
    -[MNSessionUpdateManager _handleETAResponse:forRouteInfo:etaRoute:reason:](self, "_handleETAResponse:forRouteInfo:etaRoute:reason:", v10, v29, v22, 7);

    v8 = v31;
  }

}

- (void)_updateForETARoute:(id)a3
{
  objc_msgSend(a3, "setValue:forKey:", 0, CFSTR("_serverDisplayETA"));
}

@end
