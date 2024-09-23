@implementation MNNavigationService

+ (id)sharedService
{
  if (qword_1ED0C3F08 != -1)
    dispatch_once(&qword_1ED0C3F08, &__block_literal_global_13);
  return (id)_MergedGlobals_25;
}

void __36__MNNavigationService_sharedService__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MNNavigationService initPrivate]([MNNavigationService alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_25;
  _MergedGlobals_25 = (uint64_t)v0;

}

- (id)initPrivate
{
  MNNavigationService *v2;
  void *v3;
  int v4;
  MNNavigationServiceRemoteProxy *v5;
  MNNavigationServiceRemoteProxy *remoteProxy;
  MNNavigationServiceRemoteProxy *v7;
  MNNavigationServiceLocalProxy *proxy;
  MNNavigationServiceLocalProxy *v9;
  MNNavigationServiceProxy *v10;
  MNObserverHashTable *v11;
  MNObserverHashTable *navigationObservers;
  uint64_t v13;
  MNUserOptions *cachedUserOptions;
  uint64_t v15;
  NSUUID *uuid;
  NSMutableDictionary *v17;
  NSMutableDictionary *disabledCapabilities;
  void *v19;
  void *v21;
  NSObject *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)MNNavigationService;
  v2 = -[MNNavigationService init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_navigation_isNavd");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MNNavigationService is not allowed on navd"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "-[MNNavigationService initPrivate]";
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Interfaces/MNNavigationService.m";
        v28 = 1024;
        v29 = 101;
        v30 = 2080;
        v31 = "![[NSProcessInfo processInfo] _navigation_isNavd]";
        v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

    }
    -[MNNavigationService _resetDetails](v2, "_resetDetails");
    if (+[MNNavigationService supportsNavigation](MNNavigationService, "supportsNavigation"))
    {
      if ((GEOConfigGetBOOL() & 1) != 0)
      {
        v5 = objc_alloc_init(MNNavigationServiceRemoteProxy);
        remoteProxy = v2->_remoteProxy;
        v2->_remoteProxy = v5;

        -[MNNavigationServiceRemoteProxy setDelegate:](v2->_remoteProxy, "setDelegate:", v2);
        v7 = v2->_remoteProxy;
        proxy = (MNNavigationServiceLocalProxy *)v2->_proxy;
        v2->_proxy = (MNNavigationServiceProxy *)v7;
      }
      else
      {
        v9 = objc_alloc_init(MNNavigationServiceLocalProxy);
        -[MNNavigationServiceLocalProxy setDelegate:](v9, "setDelegate:", v2);
        v10 = v2->_proxy;
        v2->_proxy = (MNNavigationServiceProxy *)v9;
        proxy = v9;

        -[MNNavigationServiceLocalProxy start](proxy, "start");
      }

    }
    v11 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEEDDE90);
    navigationObservers = v2->_navigationObservers;
    v2->_navigationObservers = v11;

    v13 = objc_opt_new();
    cachedUserOptions = v2->_cachedUserOptions;
    v2->_cachedUserOptions = (MNUserOptions *)v13;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    disabledCapabilities = v2->_disabledCapabilities;
    v2->_disabledCapabilities = v17;

    dispatch_get_global_queue(21, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    GEORegisterPListStateCaptureLegacy();

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)MNNavigationService;
  -[MNNavigationService dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MNNavigationService details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, details: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsNavigation
{
  return 1;
}

- (void)openForClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = (id)objc_opt_class();
    v9 = 2048;
    v10 = v4;
    v6 = v8;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "openForClient: '%@' (%p)", (uint8_t *)&v7, 0x16u);

  }
  -[MNNavigationServiceRemoteProxy openForClient:](self->_remoteProxy, "openForClient:", v4);

}

- (void)closeForClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  MNNavigationServiceRemoteProxy *remoteProxy;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MNNavigationServiceRemoteProxy isOpenForClient:](self->_remoteProxy, "isOpenForClient:", v4))
  {
    MNGetMNNavigationServiceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = (id)objc_opt_class();
      v11 = 2048;
      v12 = v4;
      v6 = v10;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "closeForClient: '%@' (%p)", (uint8_t *)&v9, 0x16u);

    }
    -[MNNavigationServiceRemoteProxy closeForClient:](self->_remoteProxy, "closeForClient:", v4);
    remoteProxy = self->_remoteProxy;
    if (remoteProxy && !-[MNNavigationServiceRemoteProxy clientCount](remoteProxy, "clientCount"))
    {
      MNGetMNNavigationServiceLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "No more open clients in current process", (uint8_t *)&v9, 2u);
      }

      -[MNNavigationService _resetDetails](self, "_resetDetails");
    }
  }

}

- (BOOL)isOpenForClient:(id)a3
{
  return -[MNNavigationServiceRemoteProxy isOpenForClient:](self->_remoteProxy, "isOpenForClient:", a3);
}

- (void)registerObserver:(id)a3
{
  -[MNObserverHashTable registerObserver:](self->_navigationObservers, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[MNObserverHashTable unregisterObserver:](self->_navigationObservers, "unregisterObserver:", a3);
}

- (id)ticketForDirectionsRequest:(id)a3
{
  id v4;
  MNNavigationServiceDirectionsRequestTicket *v5;
  void *v6;
  MNNavigationServiceDirectionsRequestTicket *v7;

  v4 = a3;
  v5 = [MNNavigationServiceDirectionsRequestTicket alloc];
  -[MNNavigationService _clientProxy](self, "_clientProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MNNavigationServiceDirectionsRequestTicket initWithProxy:request:](v5, "initWithProxy:request:", v6, v4);

  return v7;
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MNActiveRouteInfo *v17;
  MNActiveRouteInfo *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  MNGetMNNavigationServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v9;
    v26 = 2048;
    v27 = objc_msgSend(v7, "count");
    v28 = 1024;
    v29 = a4;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "%@ routes.count = %lud, selectedRouteIndex = %d", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = [MNActiveRouteInfo alloc];
        v18 = -[MNActiveRouteInfo initWithRoute:](v17, "initWithRoute:", v16, (_QWORD)v19);
        objc_msgSend(v10, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[MNNavigationServiceProxy setRoutesForPreview:selectedRouteIndex:](self->_proxy, "setRoutesForPreview:selectedRouteIndex:", v10, a4);
}

- (BOOL)startNavigationWithDetails:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableDictionary *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  NSObject *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  const __CFString *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  const __CFString *v46;
  id v47;
  uint8_t buf[4];
  _BYTE v49[10];
  const __CFString *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v49 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "startNavigationWithDetails:error:\n%@", buf, 0xCu);

  }
  if (-[MNNavigationService state](self, "state") < 3)
  {
    v12 = objc_msgSend(v6, "selectedRouteIndex");
    objc_msgSend(v6, "routes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 < v14)
    {
      v15 = objc_msgSend(v6, "navigationType");
      -[MNNavigationService details](self, "details");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDesiredNavigationType:", v15);

      objc_msgSend(v6, "routes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v6, "selectedRouteIndex"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "transportType");
      -[MNNavigationService details](self, "details");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDesiredTransportType:", v19);

      v21 = objc_msgSend(v6, "isResumingMultipointRoute");
      -[MNNavigationService details](self, "details");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setIsResumingMultipointRoute:", v21);

      -[MNNavigationServiceProxy startNavigationWithDetails:activeBlock:](self->_proxy, "startNavigationWithDetails:activeBlock:", v6, 0);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v23 = self->_disabledCapabilities;
      v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_disabledCapabilities, "objectForKey:", v28, (_QWORD)v41);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "count");

            if (v30)
              -[MNNavigationServiceProxy disableNavigationCapability:](self->_proxy, "disableNavigationCapability:", objc_msgSend(v28, "unsignedLongValue"));
          }
          v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v25);
      }
      v31 = 1;
      goto LABEL_31;
    }
    MNGetMNNavigationServiceLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(v6, "selectedRouteIndex");
      objc_msgSend(v6, "routes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v49 = v33;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v35;
      _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_ERROR, "MNStartNavigationDetails selectedRouteIndex is (%d), but only (%d) routes were provided", buf, 0xEu);

    }
    if (a4)
    {
      v46 = CFSTR("startNavigationDetails");
      v47 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v37 = 7;
LABEL_30:
      objc_msgSend(v36, "_navigation_errorWithCode:userInfo:", v37, v23);
      v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_32;
    }
  }
  else
  {
    MNGetMNNavigationServiceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = -[MNNavigationService state](self, "state");
      if (v10 - 1 > 5)
        v11 = CFSTR("Stopped");
      else
        v11 = off_1E61D2C90[v10 - 1];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v49 = v11;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "startNavigation called when navd is already navigating. navd state: %@", buf, 0xCu);
    }

    if (a4)
    {
      v50 = CFSTR("currentState");
      v38 = -[MNNavigationService state](self, "state");
      if (v38 - 1 > 5)
        v39 = CFSTR("Stopped");
      else
        v39 = off_1E61D2C90[v38 - 1];
      v51[0] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v37 = 6;
      goto LABEL_30;
    }
  }
  v31 = 0;
LABEL_32:

  return v31;
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 9)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E61D2BC0[a3 - 1];
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "stopNavigationWithReason: %@", (uint8_t *)&v7, 0xCu);
  }

  -[MNNavigationServiceProxy stopNavigationWithReason:](self->_proxy, "stopNavigationWithReason:", a3);
}

- (void)rerouteWithWaypoints:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "valueForKey:", CFSTR("navDisplayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "rerouteWithWaypoints: Number of waypoints is %lu, waypoints: %@", (uint8_t *)&v8, 0x16u);

  }
  -[MNNavigationServiceProxy rerouteWithWaypoints:](self->_proxy, "rerouteWithWaypoints:", v4);

}

- (void)insertWaypoint:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "navDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138477827;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "insertWaypoint: %{private}@", (uint8_t *)&v7, 0xCu);

  }
  -[MNNavigationServiceProxy insertWaypoint:](self->_proxy, "insertWaypoint:", v4);

}

- (void)removeWaypointAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MNNavigationService details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "waypoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 && v8 > a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = a3;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEFAULT, "removeWaypointAtIndex: %lu", (uint8_t *)&v11, 0xCu);
    }

    -[MNNavigationServiceProxy removeWaypointAtIndex:](self->_proxy, "removeWaypointAtIndex:", a3);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 134218240;
      v12 = a3;
      v13 = 2048;
      v14 = v8;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Invalid index for removeWaypointAtIndex: %lu, total number of waypoints: %lu", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (void)advanceToNextLeg
{
  NSObject *v3;
  uint8_t v4[16];

  MNGetMNNavigationServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "advanceToNextLeg", v4, 2u);
  }

  -[MNNavigationServiceProxy advanceToNextLeg](self->_proxy, "advanceToNextLeg");
}

- (void)updateDestination:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "navDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "updateDestination: %@", (uint8_t *)&v8, 0xCu);

  }
  -[MNNavigationService details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsDetour:", 1);

  -[MNNavigationServiceProxy updateDestination:](self->_proxy, "updateDestination:", v4);
}

- (void)resumeOriginalDestination
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  MNGetMNNavigationServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "resumeOriginalDestination", v5, 2u);
  }

  -[MNNavigationService details](self, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDetour:", 0);

  -[MNNavigationServiceProxy resumeOriginalDestination](self->_proxy, "resumeOriginalDestination");
}

- (void)forceReroute
{
  NSObject *v3;
  uint8_t v4[16];

  MNGetMNNavigationServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "forceReroute", v4, 2u);
  }

  -[MNNavigationServiceProxy forceReroute](self->_proxy, "forceReroute");
}

- (void)switchToRoute:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueRouteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "switchToRoute: %@ | %@", (uint8_t *)&v10, 0x16u);

  }
  -[MNNavigationService details](self, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routeInfoForRoute:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNNavigationServiceProxy switchToRoute:](self->_proxy, "switchToRoute:", v9);
}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  uint8_t buf[4];
  __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E61D2C10[(int)v4];
    }
    objc_msgSend(v6, "uniqueRouteID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "changeTransportType: %@ | route: %@", buf, 0x16u);

  }
  -[MNNavigationServiceProxy changeTransportType:route:](self->_proxy, "changeTransportType:route:", v4, v6);

}

- (void)switchToDestinationRoute
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MNNavigationService destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userProvidedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "source");
      if ((unint64_t)(v9 - 1) > 4)
        v10 = CFSTR("Unknown");
      else
        v10 = off_1E61D2C48[v9 - 1];
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "switchToDestinationRoute | destination route: %@ (%@) %@", (uint8_t *)&v11, 0x20u);

    }
    -[MNNavigationServiceProxy switchToDestinationRoute](self->_proxy, "switchToDestinationRoute");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "switchToDestinationRoute was called, but the destination does not lead to another route.", (uint8_t *)&v11, 2u);
    }

  }
}

- (void)setGuidanceType:(unint64_t)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("Full");
    if (a3 == 1)
      v9 = CFSTR("Low");
    if (a3 == 2)
      v9 = CFSTR("RoutePreview");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v10, 0x16u);

  }
  -[MNNavigationServiceProxy setGuidanceType:](self->_proxy, "setGuidanceType:", a3);
}

- (void)changeUserOptions:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v8, 0xCu);

  }
  -[MNNavigationService setCachedUserOptions:](self, "setCachedUserOptions:", v5);
  -[MNNavigationServiceProxy changeUserOptions:](self->_proxy, "changeUserOptions:", v5);

}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  NSObject *v6;
  id v7;
  __CFString *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 + 1 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), a3);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E61D2C70[a3 + 1];
    }
    *(_DWORD *)buf = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

  }
  -[MNNavigationServiceProxy setVoiceGuidanceLevelOverride:](self->_proxy, "setVoiceGuidanceLevelOverride:", a3);
}

- (void)repeatCurrentGuidance:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);

  }
  -[MNNavigationServiceProxy repeatCurrentGuidanceWithReply:](self->_proxy, "repeatCurrentGuidanceWithReply:", v5);

}

- (void)repeatCurrentTrafficAlert:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);

  }
  -[MNNavigationServiceProxy repeatCurrentGuidanceWithReply:](self->_proxy, "repeatCurrentGuidanceWithReply:", v5);

}

- (void)vibrateForPrompt:(unint64_t)a3 completion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MNGetMNNavigationServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v10, 0xCu);

  }
  -[MNNavigationServiceProxy vibrateForPrompt:withReply:](self->_proxy, "vibrateForPrompt:withReply:", a3, v7);

}

- (void)stopCurrentGuidancePrompt
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);

  }
  -[MNNavigationServiceProxy stopCurrentGuidancePrompt](self->_proxy, "stopCurrentGuidancePrompt");
}

- (int)headingOrientation
{
  void *v2;
  int v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "headingOrientation");

  return v3;
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v3;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v9, 0x12u);

  }
  -[MNNavigationService details](self, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeadingOrientation:", v3);

  -[MNNavigationServiceProxy setHeadingOrientation:](self->_proxy, "setHeadingOrientation:", v3);
}

- (BOOL)guidancePromptsEnabled
{
  void *v2;
  char v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "guidancePromptsEnabled");

  return v3;
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v9, 0x12u);

  }
  -[MNNavigationService details](self, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGuidancePromptsEnabled:", v3);

  -[MNNavigationServiceProxy setGuidancePromptsEnabled:](self->_proxy, "setGuidancePromptsEnabled:", v3);
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v8, 0x12u);

  }
  -[MNNavigationServiceProxy setIsDisplayingNavigationTray:](self->_proxy, "setIsDisplayingNavigationTray:", v3);
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "setIsConnectedToCarplay: %d", (uint8_t *)v6, 8u);
  }

  -[MNNavigationServiceProxy setIsConnectedToCarplay:](self->_proxy, "setIsConnectedToCarplay:", v3);
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = a3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v8, 0x12u);

  }
  -[MNNavigationServiceProxy setDisplayedStepIndex:](self->_proxy, "setDisplayedStepIndex:", a3);
}

- (void)setRideIndex:(unint64_t)a3 forSegmentIndex:(unint64_t)a4
{
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 1024;
    v13 = a3;
    v14 = 1024;
    v15 = a4;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "%@ %d, %d", (uint8_t *)&v10, 0x18u);

  }
  -[MNNavigationServiceProxy setRideIndex:forSegmentIndex:](self->_proxy, "setRideIndex:forSegmentIndex:", a3, a4);
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = a3;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "%@ [%g x %g]", (uint8_t *)&v10, 0x20u);

  }
  -[MNNavigationServiceProxy setJunctionViewImageWidth:height:](self->_proxy, "setJunctionViewImageWidth:height:", a3, a4);
}

- (void)disableNavigationCapability:(unint64_t)a3 reason:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  BOOL v11;
  __CFString *v12;
  char v13;
  __CFString *v14;
  const __CFString *v15;
  NSMutableDictionary *disabledCapabilities;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = a3;
      v9 = a3;
      while (1)
      {
        v10 = (const __CFString *)(((uint64_t)(v9 << 63) >> 63) & (unint64_t)CFSTR("ETA Updates"));
        if ((v9 & 2) != 0)
          v10 = CFSTR("Rerouting");
        v11 = (v9 & 4) == 0;
        v9 &= (v9 & 4) != 0 ? (v9 & 2 ^ 0xFFFFFFFFFFFFFFFELL) & 0xFFFFFFFFFFFFFFFALL : v9 & 2 ^ 0xFFFFFFFFFFFFFFFELL;
        v12 = v11 ? (__CFString *)v10 : CFSTR("Location Propagation");
        if ((v9 & 8) == 0)
          break;
        v13 = v9;
        v9 &= 0xFFFFFFFFFFFFFFF6;
        v12 = CFSTR("Sending CoreLocation Route Hints");
        if ((v13 & 0x10) != 0)
          goto LABEL_17;
LABEL_18:
        objc_msgSend(v8, "addObject:", v12);

        if (!v9)
        {
          objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" | "));
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

          a3 = v28;
          goto LABEL_21;
        }
      }
      if ((v9 & 0x10) == 0)
      {
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown flags (%d)"), v9);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_18;
      }
LABEL_17:
      v9 &= ~0x10uLL;
      v12 = CFSTR("Offline Management");
      goto LABEL_18;
    }
    v14 = CFSTR("None");
LABEL_21:
    v15 = CFSTR("Thermal Mitigation");
    if (!a4)
      v15 = CFSTR("Unknown");
    *(_DWORD *)buf = 138412546;
    v30 = v14;
    v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "disableNavigationCapability:%@ reason: %@", buf, 0x16u);

  }
  disabledCapabilities = self->_disabledCapabilities;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](disabledCapabilities, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setByAddingObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = self->_disabledCapabilities;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v20, v22);

  }
  else
  {
    v23 = self->_disabledCapabilities;
    v24 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithObject:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v26, v27);

    -[MNNavigationServiceProxy disableNavigationCapability:](self->_proxy, "disableNavigationCapability:", a3);
  }
}

- (void)enableNavigationCapability:(unint64_t)a3 reason:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  BOOL v11;
  __CFString *v12;
  char v13;
  __CFString *v14;
  const __CFString *v15;
  NSMutableDictionary *disabledCapabilities;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  NSMutableDictionary *v25;
  NSObject *v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      v26 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a3;
      while (1)
      {
        v10 = (const __CFString *)(((uint64_t)(v9 << 63) >> 63) & (unint64_t)CFSTR("ETA Updates"));
        if ((v9 & 2) != 0)
          v10 = CFSTR("Rerouting");
        v11 = (v9 & 4) == 0;
        v9 &= (v9 & 4) != 0 ? (v9 & 2 ^ 0xFFFFFFFFFFFFFFFELL) & 0xFFFFFFFFFFFFFFFALL : v9 & 2 ^ 0xFFFFFFFFFFFFFFFELL;
        v12 = v11 ? (__CFString *)v10 : CFSTR("Location Propagation");
        if ((v9 & 8) == 0)
          break;
        v13 = v9;
        v9 &= 0xFFFFFFFFFFFFFFF6;
        v12 = CFSTR("Sending CoreLocation Route Hints");
        if ((v13 & 0x10) != 0)
          goto LABEL_17;
LABEL_18:
        objc_msgSend(v8, "addObject:", v12);

        if (!v9)
        {
          objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" | "));
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v7 = v26;
          goto LABEL_21;
        }
      }
      if ((v9 & 0x10) == 0)
      {
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown flags (%d)"), v9);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_18;
      }
LABEL_17:
      v9 &= ~0x10uLL;
      v12 = CFSTR("Offline Management");
      goto LABEL_18;
    }
    v14 = CFSTR("None");
LABEL_21:
    v15 = CFSTR("Thermal Mitigation");
    if (!a4)
      v15 = CFSTR("Unknown");
    *(_DWORD *)buf = 138412546;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "enableNavigationCapability:%@ reason: %@", buf, 0x16u);

  }
  disabledCapabilities = self->_disabledCapabilities;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](disabledCapabilities, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "containsObject:", v19);

    if (v20)
    {
      v21 = (void *)objc_msgSend(v18, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObject:", v22);

      if (objc_msgSend(v21, "count"))
      {
        v23 = self->_disabledCapabilities;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v21, v24);
      }
      else
      {
        -[MNNavigationServiceProxy enableNavigationCapability:](self->_proxy, "enableNavigationCapability:", a3);
        v25 = self->_disabledCapabilities;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v25, "removeObjectForKey:", v24);
      }

    }
  }

}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    GEOOfflineModeAsString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "changeOfflineMode: %@(%x)", (uint8_t *)&v9, 0x12u);

  }
  if (-[MNNavigationService isInNavigatingState](self, "isInNavigatingState"))
  {
    if (-[MNNavigationService navigationTransportType](self, "navigationTransportType") != 1)
      -[MNNavigationServiceProxy changeOfflineMode:](self->_proxy, "changeOfflineMode:", v3);
  }
  else
  {
    MNGetMNNavigationServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      GEOOfflineModeAsString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "changeOfflineMode: called with state %@ when the user is not navigating. This is an ERROR!! ", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (unint64_t)state
{
  void *v2;
  unint64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (BOOL)isInNavigatingState
{
  void *v2;
  BOOL v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "state") > 3;

  return v3;
}

- (int64_t)navigationType
{
  void *v2;
  int64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "navigationType");

  return v3;
}

- (int)navigationState
{
  void *v2;
  int v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "navigationState");

  return v3;
}

- (int)navigationTransportType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[MNNavigationService details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MNNavigationService details](self, "details");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentRoute");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "transportType");

  }
  else
  {
    v7 = 4;
  }

  return v7;
}

- (BOOL)isTrackingCurrentLocation
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentLocation");

  return v5;
}

- (BOOL)isInPreArrivalState
{
  void *v2;
  char v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInPreArrivalState");

  return v3;
}

- (NSString)currentVoiceLanguage
{
  void *v3;
  void *v4;

  if (-[MNNavigationService state](self, "state") == 4 || -[MNNavigationService state](self, "state") == 5)
  {
    -[MNNavigationService details](self, "details");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentVoiceLanguage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MNVoiceLanguageUtil systemDefaultVoiceLanguage](MNVoiceLanguageUtil, "systemDefaultVoiceLanguage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (unint64_t)voiceGuidanceLevel
{
  void *v2;
  unint64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceGuidanceLevel");

  return v3;
}

- (int64_t)desiredNavigationType
{
  void *v2;
  int64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "desiredNavigationType");

  return v3;
}

- (int)desiredTransportType
{
  void *v2;
  int v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "desiredTransportType");

  return v3;
}

- (BOOL)isResumingMultipointRoute
{
  void *v2;
  char v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResumingMultipointRoute");

  return v3;
}

- (BOOL)isApproachingWaypoint
{
  void *v2;
  char v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isApproachingWaypoint");

  return v3;
}

- (MNArrivalInfo)arrivalInfo
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrivalInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNArrivalInfo *)v3;
}

- (GEOComposedRoute)route
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRoute *)v3;
}

- (GEODirectionsRequest)currentRequest
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionsRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEODirectionsRequest *)v3;
}

- (GEODirectionsResponse)currentResponse
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionsResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEODirectionsResponse *)v3;
}

- (unint64_t)routeIndex
{
  void *v2;
  unint64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeIndex");

  return v3;
}

- (unint64_t)reconnectionRouteIndex
{
  void *v2;
  unint64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "reconnectionRouteIndex");

  return v3;
}

- (NSArray)alternateRoutes
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternateRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (GEOComposedRoute)originalRoute
{
  void *v3;
  void *v4;
  void *v5;

  -[MNNavigationService details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFollowingOriginalRoute") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[MNNavigationService details](self, "details");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalRoute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (GEOComposedRoute *)v4;
}

- ($212C09783140BCCD23384160D545CE0D)originalRouteDivergenceCoordinate
{
  void *v3;
  $212C09783140BCCD23384160D545CE0D v4;
  void *v5;

  -[MNNavigationService details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFollowingOriginalRoute"))
  {
    v4 = ($212C09783140BCCD23384160D545CE0D)*MEMORY[0x1E0D26A38];
  }
  else
  {
    -[MNNavigationService details](self, "details");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ($212C09783140BCCD23384160D545CE0D)objc_msgSend(v5, "lastOriginalRouteCoordinate");

  }
  return v4;
}

- (id)displayETAInfoForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MNNavigationService details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeInfoForRoute:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayETAInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)remainingDistanceInfoForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MNNavigationService details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeInfoForRoute:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "remainingDistanceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)batteryChargeInfoForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MNNavigationService details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeInfoForRoute:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "batteryChargeInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)alternateRouteIndexForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[MNNavigationService details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeInfoForRoute:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "alternateRouteIndex");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (id)etaRouteForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MNNavigationService details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeInfoForRoute:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "etaRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)realtimeUpdatesForRoutes:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v16;
  id obj;
  id v18;
  uint64_t v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v3;
    obj = v3;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v21)
    {
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v6 = self->_realtimeUpdates;
          v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v23 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                objc_msgSend(v11, "routeID", v16);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "uniqueRouteID");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v12, "isEqual:", v13);

                if (v14)
                {
                  objc_msgSend(v18, "addObject:", v11);
                  goto LABEL_17;
                }
              }
              v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v8)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v21);
    }

    v3 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)realtimeUpdatesForAllRoutes
{
  return self->_realtimeUpdates;
}

- (void)pauseRealtimeUpdates
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138477827;
    v7 = v5;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v6, 0xCu);

  }
  -[MNNavigationServiceProxy pauseRealtimeUpdatesForSubscriber:](self->_proxy, "pauseRealtimeUpdatesForSubscriber:", self->_uuid);
}

- (void)resumeRealtimeUpdates
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138477827;
    v7 = v5;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v6, 0xCu);

  }
  -[MNNavigationServiceProxy resumeRealtimeUpdatesForSubscriber:](self->_proxy, "resumeRealtimeUpdatesForSubscriber:", self->_uuid);
}

- (unint64_t)stepIndex
{
  void *v2;
  unint64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stepIndex");

  return v3;
}

- (unint64_t)displayedStepIndex
{
  void *v2;
  unint64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayedStepIndex");

  return v3;
}

- (MNLocation)lastLocation
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNLocation *)v3;
}

- (MNDisplayETAInfo)displayEtaInfo
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayETAInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNDisplayETAInfo *)v3;
}

- (MNRouteDistanceInfo)remainingDistanceInfo
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remainingDistanceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNRouteDistanceInfo *)v3;
}

- (MNBatteryChargeInfo)batteryChargeInfo
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "batteryChargeInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNBatteryChargeInfo *)v3;
}

- (double)distanceUntilSign
{
  void *v2;
  double v3;
  double v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceUntilSign");
  v4 = v3;

  return v4;
}

- (double)timeUntilSign
{
  void *v2;
  double v3;
  double v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeUntilSign");
  v4 = v3;

  return v4;
}

- (double)distanceUntilManeuver
{
  void *v2;
  double v3;
  double v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceUntilManeuver");
  v4 = v3;

  return v4;
}

- (double)timeUntilManeuver
{
  void *v2;
  double v3;
  double v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeUntilManeuver");
  v4 = v3;

  return v4;
}

- (unint64_t)targetLegIndex
{
  void *v2;
  unint64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "targetLegIndex");

  return v3;
}

- (GEOComposedWaypoint)nextWaypoint
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[MNNavigationService route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MNNavigationService targetLegIndex](self, "targetLegIndex");
  if (v3
    && (v5 = v4,
        objc_msgSend(v3, "legs"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5 < v7))
  {
    objc_msgSend(v3, "legs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return (GEOComposedWaypoint *)v10;
}

- (int64_t)upcomingAnchorPointIndex
{
  void *v2;
  int64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "upcomingAnchorPointIndex");

  return v3;
}

- (GEOComposedWaypoint)origin
{
  void *v2;
  void *v3;
  void *v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypoint *)v4;
}

- (GEOComposedWaypoint)originalOrigin
{
  void *v2;
  void *v3;
  void *v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypoint *)v4;
}

- (GEOComposedWaypoint)destination
{
  void *v2;
  void *v3;
  void *v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypoint *)v4;
}

- (NSString)destinationName
{
  void *v2;
  void *v3;

  -[MNNavigationService destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOComposedWaypoint)originalDestination
{
  void *v2;
  void *v3;
  void *v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypoint *)v4;
}

- (NSString)originalDestinationName
{
  void *v2;
  void *v3;

  -[MNNavigationService originalDestination](self, "originalDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isDetour
{
  void *v2;
  char v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDetour");

  return v3;
}

- (MNGuidanceLaneInfo)activeLaneInfo
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeLaneInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNGuidanceLaneInfo *)v3;
}

- (MNNavTrayGuidanceEvent)activeNavTrayGuidanceEvent
{
  return -[MNNavigationDetails activeNavTrayGuidanceEvent](self->_details, "activeNavTrayGuidanceEvent");
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeRouteHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOResumeRouteHandle *)v3;
}

- (GEOComposedRoute)alternateWalkingRoute
{
  void *v2;
  void *v3;
  void *v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundWalkingRouteInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRoute *)v4;
}

- (MNDisplayETAInfo)alternateWalkingRouteDisplayETAInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundWalkingRouteInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayETAInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNDisplayETAInfo *)v4;
}

- (MNVehicleParkingInfo)vehicleParkingInfo
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vehicleParkingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MNVehicleParkingInfo *)v3;
}

- (NSString)tracePath
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)traceDuration
{
  void *v2;
  double v3;
  double v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traceDuration");
  v4 = v3;

  return v4;
}

- (NSArray)traceBookmarks
{
  void *v2;
  void *v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traceBookmarks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isNavigatingFromTrace
{
  void *v2;
  double v3;
  BOOL v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traceDuration");
  v4 = v3 > 0.0;

  return v4;
}

- (BOOL)traceIsPlaying
{
  void *v2;
  char v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "traceIsPlaying");

  return v3;
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v8, 0x12u);

  }
  -[MNNavigationServiceProxy setTraceIsPlaying:](self->_proxy, "setTraceIsPlaying:", v3);
}

- (double)tracePosition
{
  void *v2;
  double v3;
  double v4;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracePosition");
  v4 = v3;

  return v4;
}

- (void)setTracePosition:(double)a3
{
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);

  }
  -[MNNavigationServiceProxy setTracePosition:](self->_proxy, "setTracePosition:", a3);
}

- (void)setTracePlaybackSpeed:(double)a3
{
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@, %g", (uint8_t *)&v8, 0x16u);

  }
  -[MNNavigationServiceProxy setTracePlaybackSpeed:](self->_proxy, "setTracePlaybackSpeed:", a3);
}

- (void)recordTraceBookmarkAtCurrentPositionWthScreenshotData:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);

  }
  -[MNNavigationServiceProxy recordTraceBookmarkAtCurrentPositionWthScreenshotData:](self->_proxy, "recordTraceBookmarkAtCurrentPositionWthScreenshotData:", v5);

}

- (void)recordPedestrianTracePath:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);

  }
  -[MNNavigationServiceProxy recordPedestrianTracePath:](self->_proxy, "recordPedestrianTracePath:", v5);

}

- (int64_t)simulationType
{
  void *v2;
  int64_t v3;

  -[MNNavigationService details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "simulationType");

  return v3;
}

- (void)setSimulationSpeedOverride:(double)a3
{
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%@ [%g]", (uint8_t *)&v8, 0x16u);

  }
  -[MNNavigationServiceProxy setSimulationSpeedOverride:](self->_proxy, "setSimulationSpeedOverride:", a3);
}

- (void)setSimulationSpeedMultiplier:(double)a3
{
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%@ [%g]", (uint8_t *)&v8, 0x16u);

  }
  -[MNNavigationServiceProxy setSimulationSpeedMultiplier:](self->_proxy, "setSimulationSpeedMultiplier:", a3);
}

- (void)setSimulationPosition:(double)a3
{
  NSObject *v6;
  char *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%@ [%g]", (uint8_t *)&v10, 0x16u);

  }
  if (a3 < 0.0 || a3 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Only values between [0, 1] are valid."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "-[MNNavigationService setSimulationPosition:]";
      v12 = 2080;
      v13 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Navigation/Interfaces/MNNavigationService.m");
      v14 = 1024;
      v15 = 891;
      v16 = 2080;
      v17 = "0 <= position && position <= 1";
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v10, 0x30u);
    }

  }
  -[MNNavigationServiceProxy setSimulationPosition:](self->_proxy, "setSimulationPosition:", a3);
}

- (id)_clientProxy
{
  MNNavigationClientProxy *clientProxy;
  MNNavigationClientProxy *v4;
  MNNavigationClientProxy *v5;

  clientProxy = self->_clientProxy;
  if (!clientProxy)
  {
    v4 = objc_alloc_init(MNNavigationClientProxy);
    v5 = self->_clientProxy;
    self->_clientProxy = v4;

    clientProxy = self->_clientProxy;
  }
  return clientProxy;
}

- (void)_resetDetails
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)MEMORY[0x1B5E0E19C](self, a2);
  v4 = -[MNNavigationDetails initForServer:]([MNNavigationDetails alloc], "initForServer:", 0);
  -[MNNavigationService setDetails:](self, "setDetails:", v4);

  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "Resetting navigation details.", v6, 2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)navigationServiceProxy:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (a4 - 1 > 5)
      v12 = CFSTR("Stopped");
    else
      v12 = off_1E61D2C90[a4 - 1];
    if (a5 - 1 > 5)
      v13 = CFSTR("Stopped");
    else
      v13 = off_1E61D2C90[a5 - 1];
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)'%@' to '%@'", (uint8_t *)&v14, 0x20u);

  }
  -[MNObserverHashTable navigationService:willChangeFromState:toState:](self->_navigationObservers, "navigationService:willChangeFromState:toState:", self, a4, a5);
}

- (void)navigationServiceProxy:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (a4 - 1 > 5)
      v12 = CFSTR("Stopped");
    else
      v12 = off_1E61D2C90[a4 - 1];
    if (a5 - 1 > 5)
      v13 = CFSTR("Stopped");
    else
      v13 = off_1E61D2C90[a5 - 1];
    *(_DWORD *)buf = 138543874;
    v22 = v10;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)'%@' to '%@'", buf, 0x20u);

  }
  -[MNNavigationService details](self, "details");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setState:", a5);

  -[MNObserverHashTable navigationService:didChangeFromState:toState:](self->_navigationObservers, "navigationService:didChangeFromState:toState:", self, a4, a5);
  if (!a5)
  {
    -[MNNavigationService _resetDetails](self, "_resetDetails");
    v15 = -[MNNavigationServiceRemoteProxy interruptionCount](self->_remoteProxy, "interruptionCount");
    if (a4 >= 3)
    {
      if (v15)
      {
        -[MNNavigationServiceRemoteProxy interruptionDates](self->_remoteProxy, "interruptionDates", CFSTR("MNErrorInternalDescriptionKey"), CFSTR("MNErrorInterruptionDatesKey"), CFSTR("Interruptions to the navigation service were detected. Please file a Radar with a sysdiagnose."));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:userInfo:", 10, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNObserverHashTable navigationService:didFailWithError:](self->_navigationObservers, "navigationService:didFailWithError:", self, v18);

      }
    }
  }
}

- (void)navigationServiceProxy:(id)a3 didUpdateNavigationDetails:(id)a4
{
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  __CFString *v23;
  MNObserverHashTable *navigationObservers;
  void *v25;
  int v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v26, 0xCu);

  }
  -[MNNavigationService details](self, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "state");

  -[MNNavigationService details](self, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "navigationState");

  if (v10 != objc_msgSend(v6, "state"))
  {
    v13 = objc_msgSend(v6, "navigationType");
    -[MNNavigationService details](self, "details");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDesiredNavigationType:", v13);

    -[MNObserverHashTable navigationService:willChangeFromState:toState:](self->_navigationObservers, "navigationService:willChangeFromState:toState:", self, v10, objc_msgSend(v6, "state"));
  }
  if (v6)
  {
    -[MNNavigationService details](self, "details");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "copySerializableValuesFrom:", v6);

    MNGetMNNavigationServiceLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[MNNavigationService details](self, "details");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v17;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_INFO, "Updated navigation details: %@", (uint8_t *)&v26, 0xCu);

    }
    -[MNNavigationService details](self, "details");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "routeLookupIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = CFSTR("none");
    }
    MNGetMNNavigationServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = v20;
      _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_INFO, "Known route IDs: (%@)", (uint8_t *)&v26, 0xCu);
    }

  }
  if (v12 != objc_msgSend(v6, "navigationState"))
    -[MNObserverHashTable navigationService:didChangeNavigationState:](self->_navigationObservers, "navigationService:didChangeNavigationState:", self, objc_msgSend(v6, "navigationState"));
  if (v10 != objc_msgSend(v6, "state"))
  {
    -[MNObserverHashTable navigationService:didChangeFromState:toState:](self->_navigationObservers, "navigationService:didChangeFromState:toState:", self, v10, objc_msgSend(v6, "state"));
    if (objc_msgSend(v6, "state") == 2)
    {
      MNGetMNNavigationServiceLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(sel_navigationService_didUpdatePreviewRoutes_withSelectedRouteIndex_);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v26 = 138477827;
        v27 = v23;
        _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v26, 0xCu);

      }
      navigationObservers = self->_navigationObservers;
      objc_msgSend(v6, "previewRoutes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNObserverHashTable navigationService:didUpdatePreviewRoutes:withSelectedRouteIndex:](navigationObservers, "navigationService:didUpdatePreviewRoutes:withSelectedRouteIndex:", self, v25, objc_msgSend(v6, "selectedPreviewRouteIndex"));

    }
  }
  -[MNObserverHashTable navigationServiceDidSynchronize:](self->_navigationObservers, "navigationServiceDidSynchronize:", self);

}

- (void)navigationServiceProxyWillPauseNavigation:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceWillPause:](self->_navigationObservers, "navigationServiceWillPause:", self);
}

- (void)navigationServiceProxyWillResumeFromPauseNavigation:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceWillResumeFromPause:](self->_navigationObservers, "navigationServiceWillResumeFromPause:", self);
}

- (void)navigationServiceProxy:(id)a3 didFailWithError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNNavigationServiceProxy stopNavigationWithReason:](self->_proxy, "stopNavigationWithReason:", 1);
  -[MNObserverHashTable navigationService:didFailWithError:](self->_navigationObservers, "navigationService:didFailWithError:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[MNNavigationService details](self, "details");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "navigationState");
    if (v10 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E61D2CC0[(int)v10];
    }
    v12 = v11;
    if (v4 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E61D2CC0[(int)v4];
    }
    *(_DWORD *)buf = 138543874;
    v16 = v8;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ => %@", buf, 0x20u);

  }
  -[MNNavigationService details](self, "details");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNavigationState:", v4);

  -[MNObserverHashTable navigationService:didChangeNavigationState:](self->_navigationObservers, "navigationService:didChangeNavigationState:", self, v4);
}

- (void)navigationServiceProxy:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 1024;
    v15 = a4;
    v16 = 1024;
    v17 = a5;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d, %d", (uint8_t *)&v12, 0x18u);

  }
  -[MNNavigationService details](self, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayedStepIndex:", a4);

  -[MNObserverHashTable navigationService:didUpdateDisplayedStepIndex:segmentIndex:](self->_navigationObservers, "navigationService:didUpdateDisplayedStepIndex:segmentIndex:", self, a4, a5);
}

- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v12;
    v17 = 2048;
    v18 = a4;
    v19 = 2048;
    v20 = a5;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "(%{public}@)| %0.1f meters, %0.1f seconds", (uint8_t *)&v15, 0x20u);

  }
  -[MNNavigationService details](self, "details");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDistanceUntilManeuver:", a4);

  -[MNNavigationService details](self, "details");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeUntilManeuver:", a5);

  -[MNObserverHashTable navigationService:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:](self->_navigationObservers, "navigationService:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:", self, a6, a4, a5);
}

- (void)navigationServiceProxyDidFinishLocationUpdate:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEBUG, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceDidFinishLocationUpdate:](self->_navigationObservers, "navigationServiceDidFinishLocationUpdate:", self);
}

- (void)navigationServiceProxy:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 1024;
    v13 = a4;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)legIndex: %d", (uint8_t *)&v10, 0x12u);

  }
  -[MNNavigationService details](self, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsApproachingWaypoint:", 1);

  -[MNObserverHashTable navigationService:isApproachingEndOfLeg:](self->_navigationObservers, "navigationService:isApproachingEndOfLeg:", self, a4);
}

- (void)navigationServiceProxy:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543875;
    v13 = v10;
    v14 = 2113;
    v15 = v11;
    v16 = 1024;
    v17 = a5;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)%{private}@ | legIndex: %d", (uint8_t *)&v12, 0x1Cu);

  }
  -[MNObserverHashTable navigationService:didEnterPreArrivalStateForWaypoint:endOfLegIndex:](self->_navigationObservers, "navigationService:didEnterPreArrivalStateForWaypoint:endOfLegIndex:", self, v8, a5);

}

- (void)navigationServiceProxy:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543875;
    v13 = v10;
    v14 = 2113;
    v15 = v11;
    v16 = 1024;
    v17 = a5;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)%{private}@ | legIndex: %d", (uint8_t *)&v12, 0x1Cu);

  }
  -[MNObserverHashTable navigationService:didArriveAtWaypoint:endOfLegIndex:](self->_navigationObservers, "navigationService:didArriveAtWaypoint:endOfLegIndex:", self, v8, a5);

}

- (void)navigationServiceProxy:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  MNGetMNNavigationServiceLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (a6 - 1 > 5)
      v15 = CFSTR("Unknown");
    else
      v15 = off_1E61D2D08[a6 - 1];
    v18 = 138544131;
    v19 = v12;
    v20 = 2113;
    v21 = v13;
    v22 = 1024;
    v23 = a5;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@)%{private}@ | legIndex: %d | reason: %@", (uint8_t *)&v18, 0x26u);

  }
  -[MNNavigationService details](self, "details");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIsApproachingWaypoint:", 0);

  -[MNNavigationService details](self, "details");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIsInPreArrivalState:", 0);

  -[MNObserverHashTable navigationService:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:](self->_navigationObservers, "navigationService:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", self, v10, a5, a6);
}

- (void)navigationServiceProxyDidEnterPreArrivalState:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v8, 0xCu);

  }
  -[MNNavigationService details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsInPreArrivalState:", 1);

  -[MNObserverHashTable navigationServiceDidEnterPreArrivalState:](self->_navigationObservers, "navigationServiceDidEnterPreArrivalState:", self);
}

- (void)navigationServiceProxyDidArrive:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceDidArrive:](self->_navigationObservers, "navigationServiceDidArrive:", self);
}

- (void)navigationServiceProxy:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  MNGetMNNavigationServiceLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v12;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v16, 0xCu);

  }
  -[MNNavigationService details](self, "details");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProceedToRouteDistance:", a4);

  -[MNNavigationService details](self, "details");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisplayString:", v10);

  -[MNNavigationService details](self, "details");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClosestStepIndex:", a6);

  -[MNObserverHashTable navigationService:didUpdateProceedToRouteDistance:displayString:closestStepIndex:](self->_navigationObservers, "navigationService:didUpdateProceedToRouteDistance:displayString:closestStepIndex:", self, v10, a6, a4);
}

- (void)navigationServiceProxy:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v15, 0xCu);

  }
  -[MNNavigationService details](self, "details");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDistanceUntilSign:", a4);

  -[MNNavigationService details](self, "details");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeUntilSign:", a5);

  -[MNObserverHashTable navigationService:didUpdateDistanceUntilSign:timeUntilSign:forStepIndex:](self->_navigationObservers, "navigationService:didUpdateDistanceUntilSign:timeUntilSign:forStepIndex:", self, a6, a4, a5);
}

- (void)navigationServiceProxy:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v11, 0xCu);

  }
  -[MNObserverHashTable navigationService:willAnnounce:inSeconds:](self->_navigationObservers, "navigationService:willAnnounce:inSeconds:", self, a4, a5);
}

- (void)navigationServiceProxy:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10;
  uint64_t v11;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v10 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a6;
  v24 = *MEMORY[0x1E0C80C00];
  v16 = a7;
  v17 = a5;
  v18 = a4;
  MNGetMNNavigationServiceLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v20;
    _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_INFO, "(%{public}@)", buf, 0xCu);

  }
  LOBYTE(v21) = a10;
  -[MNObserverHashTable navigationService:displayPrimaryStep:instructions:shieldType:shieldText:drivingSide:maneuverStepIndex:isSynthetic:](self->_navigationObservers, "navigationService:displayPrimaryStep:instructions:shieldType:shieldText:drivingSide:maneuverStepIndex:isSynthetic:", self, v18, v17, v11, v16, v10, a9, v21);

}

- (void)navigationServiceProxy:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:displayManeuverAlertForAnnouncementStage:](self->_navigationObservers, "navigationService:displayManeuverAlertForAnnouncementStage:", self, a4);
}

- (void)navigationServiceProxy:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a6;
  v21 = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v15 = a5;
  v16 = a4;
  MNGetMNNavigationServiceLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v18;
    _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v19, 0xCu);

  }
  -[MNObserverHashTable navigationService:displaySecondaryStep:instructions:shieldType:shieldText:drivingSide:](self->_navigationObservers, "navigationService:displaySecondaryStep:instructions:shieldType:shieldText:drivingSide:", self, v16, v15, v9, v14, v8);

}

- (void)navigationServiceProxyHideSecondaryStep:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceDidHideSecondaryStep:](self->_navigationObservers, "navigationServiceDidHideSecondaryStep:", self);
}

- (void)navigationServiceProxyBeginGuidanceUpdate:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceBeginGuidanceUpdate:](self->_navigationObservers, "navigationServiceBeginGuidanceUpdate:", self);
}

- (void)navigationServiceProxyEndGuidanceUpdate:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceEndGuidanceUpdate:](self->_navigationObservers, "navigationServiceEndGuidanceUpdate:", self);
}

- (void)navigationServiceProxy:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "secondarySign");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      objc_msgSend(v5, "primarySign");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "secondarySign");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(navigationServiceProxy:updateSignsWithInfo:) %@ / %@", (uint8_t *)&v11, 0x16u);

LABEL_6:
    }
  }
  else if (v8)
  {
    objc_msgSend(v5, "primarySign");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(navigationServiceProxy:updateSignsWithInfo:) %@", (uint8_t *)&v11, 0xCu);
    goto LABEL_6;
  }

  -[MNObserverHashTable navigationService:updateSignsWithInfo:](self->_navigationObservers, "navigationService:updateSignsWithInfo:", self, v5);
}

- (void)navigationServiceProxy:(id)a3 updateSignsWithARInfo:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "(navigationServiceProxy:updateSignsWithARInfo:) %@", (uint8_t *)&v7, 0xCu);
  }

  -[MNObserverHashTable navigationService:updateSignsWithARInfo:](self->_navigationObservers, "navigationService:updateSignsWithARInfo:", self, v5);
}

- (void)navigationServiceProxy:(id)a3 usePersistentDisplay:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:usePersistentDisplay:](self->_navigationObservers, "navigationService:usePersistentDisplay:", self, v4);
}

- (void)navigationServiceProxy:(id)a3 showLaneDirections:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(%{public}@)%@, %@", (uint8_t *)&v10, 0x20u);

  }
  -[MNNavigationDetails setActiveLaneInfo:](self->_details, "setActiveLaneInfo:", v6);
  -[MNObserverHashTable navigationService:showLaneDirections:](self->_navigationObservers, "navigationService:showLaneDirections:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 hideLaneDirectionsForId:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(%{public}@)%@", (uint8_t *)&v15, 0x16u);

  }
  -[MNNavigationDetails activeLaneInfo](self->_details, "activeLaneInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v6);

  if ((v11 & 1) == 0)
  {
    MNGetMNNavigationServiceLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[MNNavigationDetails activeLaneInfo](self->_details, "activeLaneInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "Requested to remove active lane info with ID %@, but active info was %@", (uint8_t *)&v15, 0x16u);

    }
  }
  -[MNNavigationDetails setActiveLaneInfo:](self->_details, "setActiveLaneInfo:", 0);
  -[MNObserverHashTable navigationService:hideLaneDirectionsForId:](self->_navigationObservers, "navigationService:hideLaneDirectionsForId:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 showJunctionView:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:showJunctionView:](self->_navigationObservers, "navigationService:showJunctionView:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 hideJunctionViewForId:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:hideJunctionViewForId:](self->_navigationObservers, "navigationService:hideJunctionViewForId:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d", (uint8_t *)&v10, 0x12u);

  }
  -[MNNavigationService details](self, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGuidancePromptsEnabled:", v4);

  -[MNObserverHashTable navigationService:didEnableGuidancePrompts:](self->_navigationObservers, "navigationService:didEnableGuidancePrompts:", self, v4);
}

- (void)navigationServiceProxy:(id)a3 newGuidanceEventFeedback:(id)a4
{
  -[MNObserverHashTable navigationService:newGuidanceEventFeedback:](self->_navigationObservers, "navigationService:newGuidanceEventFeedback:", self, a4);
}

- (void)navigationServiceProxy:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  -[MNObserverHashTable navigationService:updatedGuidanceEventFeedback:](self->_navigationObservers, "navigationService:updatedGuidanceEventFeedback:", self, a4);
}

- (void)navigationServiceProxy:(id)a3 didReceiveRouteSignalStrength:(unint64_t)a4
{
  -[MNObserverHashTable navigationService:didReceiveRouteSignalStrength:](self->_navigationObservers, "navigationService:didReceiveRouteSignalStrength:", self, a4);
}

- (void)navigationServiceProxy:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MNObserverHashTable *navigationObservers;
  void *v17;
  void *v18;
  MNObserverHashTable *v19;
  void *v20;
  MNObserverHashTable *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v8;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ | route ID: %@", (uint8_t *)&v25, 0x20u);

  }
  -[MNNavigationService details](self, "details");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateETATrafficForRoute:", v6);

  -[MNNavigationService details](self, "details");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "routeInfoForID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    navigationObservers = self->_navigationObservers;
    objc_msgSend(v15, "etaResponse");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "route");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNObserverHashTable navigationService:didUpdateETAResponse:forRoute:](navigationObservers, "navigationService:didUpdateETAResponse:forRoute:", self, v17, v18);

    v19 = self->_navigationObservers;
    objc_msgSend(v15, "routeID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNObserverHashTable navigationService:didUpdateTrafficForRouteID:](v19, "navigationService:didUpdateTrafficForRouteID:", self, v20);

    v21 = self->_navigationObservers;
    objc_msgSend(v15, "route");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mutableData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "route");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNObserverHashTable navigationService:didUpdateMutableData:forRoute:](v21, "navigationService:didUpdateMutableData:forRoute:", self, v23, v24);

  }
}

- (void)navigationServiceProxy:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  -[MNObserverHashTable navigationService:didUpdateHeading:accuracy:](self->_navigationObservers, "navigationService:didUpdateHeading:accuracy:", self, a4, a5);
}

- (void)navigationServiceProxy:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  -[MNObserverHashTable navigationService:didUpdateMotionType:confidence:](self->_navigationObservers, "navigationService:didUpdateMotionType:confidence:", self, a4, a5);
}

- (void)navigationServiceProxy:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v10;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v14, 0xCu);

  }
  -[MNNavigationService details](self, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreviewRoutes:withSelectedRouteIndex:", v8, a5);

  -[MNNavigationService details](self, "details");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "previewRoutes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNObserverHashTable navigationService:didUpdatePreviewRoutes:withSelectedRouteIndex:](self->_navigationObservers, "navigationService:didUpdatePreviewRoutes:withSelectedRouteIndex:", self, v13, a5);
}

- (void)navigationServiceProxyWillReroute:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceWillReroute:](self->_navigationObservers, "navigationServiceWillReroute:", self);
}

- (void)navigationServiceProxy:(id)a3 didRerouteWithRoute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  MNObserverHashTable *navigationObservers;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v14 && (objc_msgSend(v14, "route"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    -[MNNavigationService details](self, "details");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCurrentRoute:withAlternateRoutes:", v14, v16);

    MNGetMNNavigationServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "routeID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v13;
      v22 = objc_msgSend(v16, "count");
      -[MNNavigationService details](self, "details");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "routeLookupIDs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "));
      v35 = a7;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v20;
      v38 = 2112;
      v39 = v21;
      v40 = 1024;
      v41 = v22;
      v13 = v34;
      v42 = 2112;
      v43 = v24;
      _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_DEFAULT, "(%@) %@ | alternate routes: %d\nKnown route IDs: (%@)", buf, 0x26u);

      a7 = v35;
    }

    -[MNNavigationService details](self, "details");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentRoute");
    v26 = objc_claimAutoreleasedReturnValue();

    -[MNNavigationService details](self, "details");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setLocation:", v15);

    -[MNObserverHashTable navigationService:didReroute:rerouteReason:](self->_navigationObservers, "navigationService:didReroute:rerouteReason:", self, v26, a7);
    objc_msgSend(v15, "routeID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      -[MNObserverHashTable navigationService:didUpdateMatchedLocation:](self->_navigationObservers, "navigationService:didUpdateMatchedLocation:", self, v15);
    navigationObservers = self->_navigationObservers;
    objc_msgSend(v14, "displayETAInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remainingDistanceInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "batteryChargeInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNObserverHashTable navigationService:didUpdateDisplayETA:remainingDistance:batteryChargeInfo:](navigationObservers, "navigationService:didUpdateDisplayETA:remainingDistance:batteryChargeInfo:", self, v30, v31, v32);

  }
  else
  {
    MNGetMNNavigationServiceLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v26, OS_LOG_TYPE_ERROR, "didRerouteWithRoute: was called with a null routeInfo or route", buf, 2u);
    }
  }

}

- (void)navigationServiceProxyDidCancelReroute:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v7, 0xCu);

  }
  -[MNObserverHashTable navigationServiceDidCancelReroute:](self->_navigationObservers, "navigationServiceDidCancelReroute:", self);
}

- (void)navigationServiceProxy:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MNObserverHashTable *navigationObservers;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MNNavigationService details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentRoute:withAlternateRoutes:", v6, 0);

  MNGetMNNavigationServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationService details](self, "details");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "routeLookupIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)\nKnown route IDs: (%@)", (uint8_t *)&v15, 0x16u);

  }
  navigationObservers = self->_navigationObservers;
  objc_msgSend(v6, "route");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNObserverHashTable navigationService:didUpdateRouteWithNewRideSelection:](navigationObservers, "navigationService:didUpdateRouteWithNewRideSelection:", self, v14);

}

- (void)navigationServiceProxy:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v5 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[MNNavigationService details](self, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundWalkingRouteInfo:", 0);

  -[MNNavigationService details](self, "details");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVehicleParkingInfo:", 0);

  -[MNNavigationService details](self, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCurrentRoute:withAlternateRoutes:", v8, 0);

  MNGetMNNavigationServiceLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationService details](self, "details");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "routeLookupIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v13;
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@)\nKnown route IDs: (%@)", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(v8, "route");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traffic");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNObserverHashTable navigationService:didSwitchToNewTransportType:newRoute:traffic:](self->_navigationObservers, "navigationService:didSwitchToNewTransportType:newRoute:traffic:", self, v5, v17, v18);

}

- (void)navigationServiceProxy:(id)a3 didFailRerouteWithError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v9, 0x16u);

  }
  -[MNObserverHashTable navigationService:failedRerouteWithErrorCode:](self->_navigationObservers, "navigationService:failedRerouteWithErrorCode:", self, objc_msgSend(v6, "code"));

}

- (void)navigationServiceProxy:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  MNObserverHashTable *navigationObservers;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(%@) count: %d"), v8, objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "route");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayETAInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("    %@ | %d minutes"), v17, objc_msgSend(v18, "displayRemainingMinutesToEndOfRoute"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v19);

        objc_msgSend(v14, "traffic");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v14, "traffic");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "routeID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v21, v22);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v11);
  }

  -[MNNavigationService details](self, "details");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlternateRoutes:", obj);

  v24 = (void *)MEMORY[0x1E0CB3940];
  -[MNNavigationService details](self, "details");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "routeLookupIDs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("Known route IDs: %@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v28);

  MNGetMNNavigationServiceLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v30;
    _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  navigationObservers = self->_navigationObservers;
  -[MNNavigationService details](self, "details");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "alternateRoutes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v37, "copy");
  -[MNObserverHashTable navigationService:didUpdateAlternateRoutes:traffics:](navigationObservers, "navigationService:didUpdateAlternateRoutes:traffics:", self, v33, v34);

}

- (void)navigationServiceProxy:(id)a3 didReceiveTrafficIncidentAlert:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  MNObserverHashTable *navigationObservers;
  id v17;
  _QWORD v18[4];
  id v19;
  MNNavigationService *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v6, "alertID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_geo_uuidForData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "alertType");
    objc_msgSend(v6, "etaResponseID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = v8;
    v23 = 2112;
    v24 = v11;
    v25 = 1024;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ | Type: %d | ResponseID: %@", buf, 0x26u);

  }
  -[MNNavigationService details](self, "details");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "updateWithTrafficIncidentAlert:", v6);

  navigationObservers = self->_navigationObservers;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__MNNavigationService_navigationServiceProxy_didReceiveTrafficIncidentAlert___block_invoke;
  v18[3] = &unk_1E61D2B78;
  v19 = v6;
  v20 = self;
  v17 = v6;
  -[MNObserverHashTable navigationService:didReceiveTrafficIncidentAlert:responseCallback:](navigationObservers, "navigationService:didReceiveTrafficIncidentAlert:responseCallback:", self, v17, v18);

}

uint64_t __77__MNNavigationService_navigationServiceProxy_didReceiveTrafficIncidentAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(*(id *)(a1 + 32), "alertID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geo_uuidForData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "acceptReroute: %d | %@", (uint8_t *)v9, 0x12u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "acceptReroute:forTrafficIncidentAlert:", a2, *(_QWORD *)(a1 + 32));
}

- (void)navigationServiceProxy:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v6;
  NSObject *v7;
  char *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v6, "alertID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_geo_uuidForData:", v10);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(%{public}@)%@", (uint8_t *)&v16, 0x16u);

  }
  -[MNNavigationService details](self, "details");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithTrafficIncidentAlert:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MNObserverHashTable navigationService:didUpdateTrafficIncidentAlert:](self->_navigationObservers, "navigationService:didUpdateTrafficIncidentAlert:", self, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find traffic incident alert to update"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "-[MNNavigationService navigationServiceProxy:didUpdateTrafficIncidentAlert:]";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Interfaces/MNNavigationService.m";
      v20 = 1024;
      v21 = 1372;
      v22 = 2080;
      v23 = "(existingAlert != nil)";
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v16, 0x30u);
    }

  }
}

- (void)navigationServiceProxy:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v6, "alertID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_geo_uuidForData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v18, 0x16u);

  }
  -[MNNavigationService details](self, "details");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeTrafficIncidentAlert:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MNObserverHashTable navigationService:didInvalidateTrafficIncidentAlert:](self->_navigationObservers, "navigationService:didInvalidateTrafficIncidentAlert:", self, v13);
  }
  else
  {
    MNGetMNNavigationServiceLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(v6, "alertID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_geo_uuidForData:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "Invalidate traffic incident alert did not find existing alert with ID %@", (uint8_t *)&v18, 0xCu);

    }
  }

}

- (void)navigationServiceProxy:(id)a3 didDismissTrafficIncidentAlert:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v6, "alertID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_geo_uuidForData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v12, 0x16u);

  }
  -[MNObserverHashTable navigationService:didDismissTrafficIncidentAlert:](self->_navigationObservers, "navigationService:didDismissTrafficIncidentAlert:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 didUpdateTracePlaybackDetails:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MNNavigationTraceInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  MNObserverHashTable *navigationObservers;
  void *v23;
  double v24;
  double v25;
  void *v26;
  MNObserverHashTable *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MNObserverHashTable *v32;
  int v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  switch(objc_msgSend(v5, "eventType"))
  {
    case 0:
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v33 = 136315650;
        v34 = "-[MNNavigationService navigationServiceProxy:didUpdateTracePlaybackDetails:]";
        v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Interfaces/MNNavigationService.m";
        v37 = 1024;
        v38 = 1452;
        _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v33, 0x1Cu);
      }

      break;
    case 1:
      objc_msgSend(v5, "tracePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationService details](self, "details");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTracePath:", v7);

      objc_msgSend(v5, "traceDuration");
      v10 = v9;
      -[MNNavigationService details](self, "details");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTraceDuration:", v10);

      objc_msgSend(v5, "bookmarks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationService details](self, "details");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTraceBookmarks:", v12);

      -[MNNavigationService details](self, "details");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTraceIsPlaying:", 1);

      v15 = objc_alloc_init(MNNavigationTraceInfo);
      objc_msgSend(v5, "pedestrianTracePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationTraceInfo setPedestrianTracePath:](v15, "setPedestrianTracePath:", v16);

      objc_msgSend(v5, "pedestrianTraceStartRelativeTimestamp");
      -[MNNavigationTraceInfo setPedestrianTraceStartRelativeTimestamp:](v15, "setPedestrianTraceStartRelativeTimestamp:");
      -[MNObserverHashTable navigationService:didFinishLoadingTrace:](self->_navigationObservers, "navigationService:didFinishLoadingTrace:", self, v15);

      break;
    case 2:
      -[MNNavigationService details](self, "details");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTraceIsPlaying:", 1);

      -[MNObserverHashTable navigationServiceDidResumeTrace:](self->_navigationObservers, "navigationServiceDidResumeTrace:", self);
      break;
    case 3:
      -[MNNavigationService details](self, "details");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTraceIsPlaying:", 0);

      -[MNObserverHashTable navigationServiceDidPauseTrace:](self->_navigationObservers, "navigationServiceDidPauseTrace:", self);
      break;
    case 4:
      objc_msgSend(v5, "currentPosition");
      v20 = v19;
      -[MNNavigationService details](self, "details");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTracePosition:", v20);

      navigationObservers = self->_navigationObservers;
      -[MNNavigationService details](self, "details");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tracePosition");
      -[MNObserverHashTable navigationService:didPlayTracePosition:](navigationObservers, "navigationService:didPlayTracePosition:", self);
      goto LABEL_12;
    case 5:
      objc_msgSend(v5, "currentPosition");
      v25 = v24;
      -[MNNavigationService details](self, "details");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTracePosition:", v25);

      v27 = self->_navigationObservers;
      -[MNNavigationService details](self, "details");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tracePosition");
      -[MNObserverHashTable navigationService:didSeekToTracePosition:](v27, "navigationService:didSeekToTracePosition:", self);
      goto LABEL_12;
    case 6:
      objc_msgSend(v5, "bookmarks");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationService details](self, "details");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTraceBookmarks:", v28);

      -[MNObserverHashTable navigationService:didRecordTraceBookmarkWithID:](self->_navigationObservers, "navigationService:didRecordTraceBookmarkWithID:", self, objc_msgSend(v5, "recordedBookmarkID"));
      break;
    case 7:
      objc_msgSend(v5, "tracePath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationService details](self, "details");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTracePath:", v30);

      v32 = self->_navigationObservers;
      objc_msgSend(v5, "tracePath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNObserverHashTable navigationService:didStartRecordingTraceWithPath:](v32, "navigationService:didStartRecordingTraceWithPath:", self, v23);
LABEL_12:

      break;
    default:
      break;
  }

}

- (void)navigationServiceProxy:(id)a3 didActivateAudioSession:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:didActivateAudioSession:](self->_navigationObservers, "navigationService:didActivateAudioSession:", self, v4);
}

- (void)navigationServiceProxy:(id)a3 didStartSpeakingPrompt:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:didStartSpeakingPrompt:](self->_navigationObservers, "navigationService:didStartSpeakingPrompt:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 willProcessSpeechEvent:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:willProcessSpeechEvent:](self->_navigationObservers, "navigationService:willProcessSpeechEvent:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 didProcessSpeechEvent:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v11, 0xCu);

  }
  if (objc_msgSend(v6, "hasSpokenGuidance"))
  {
    -[MNNavigationService details](self, "details");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markAnnouncementSpoken:", v10);

  }
  -[MNObserverHashTable navigationService:didProcessSpeechEvent:](self->_navigationObservers, "navigationService:didProcessSpeechEvent:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 triggerHaptics:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = *(_QWORD *)&a4;
  v11 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:triggerHaptics:](self->_navigationObservers, "navigationService:triggerHaptics:", self, v4);
}

- (void)navigationServiceProxy:(id)a3 willRequestRealtimeUpdatesForRouteIDs:(id)a4
{
  -[MNObserverHashTable navigationService:willRequestRealtimeUpdatesForRouteIDs:](self->_navigationObservers, "navigationService:willRequestRealtimeUpdatesForRouteIDs:", self, a4);
}

- (void)navigationServiceProxy:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_realtimeUpdates, a4);
  v6 = a4;
  -[MNObserverHashTable navigationService:didReceiveRealtimeUpdates:](self->_navigationObservers, "navigationService:didReceiveRealtimeUpdates:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 didReceiveTransitAlert:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MNGetMNNavigationServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  -[MNObserverHashTable navigationService:didReceiveTransitAlert:](self->_navigationObservers, "navigationService:didReceiveTransitAlert:", self, v6);

}

- (void)navigationServiceProxy:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  -[MNNavigationService _updateWithCallback:](self, "_updateWithCallback:", a4);
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  MNNavigationService *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  const __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  MNNavigationService *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[6];
  _QWORD v79[6];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[4];
  _QWORD v83[4];
  _BYTE v84[128];
  _QWORD v85[6];
  _QWORD v86[8];

  v3 = self;
  v86[6] = *MEMORY[0x1E0C80C00];
  -[MNNavigationService route](self, "route", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x1E0CB3000uLL;
  v72 = v4;
  v73 = v3;
  if (v4)
  {
    v85[0] = CFSTR("routeID");
    v6 = v4;
    objc_msgSend(v4, "uniqueRouteID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E61D9090;
    v86[0] = v9;
    v85[1] = CFSTR("name");
    objc_msgSend(v6, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_1E61D9090;
    v86[1] = v12;
    v85[2] = CFSTR("legs");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "legs");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v14;
    v85[3] = CFSTR("segments");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "segments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v86[3] = v17;
    v85[4] = CFSTR("steps");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "steps");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v86[4] = v20;
    v85[5] = CFSTR("length");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "distance");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v86[5] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 6);
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v5 = 0x1E0CB3000;
    v3 = v73;

  }
  else
  {
    v71 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[MNNavigationService alternateRoutes](v3, "alternateRoutes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v75 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "uniqueRouteID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (v30)
          v32 = (const __CFString *)v30;
        else
          v32 = &stru_1E61D9090;
        -[__CFString addObject:](v23, "addObject:", v32);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v26);
  }

  -[MNNavigationService displayEtaInfo](v3, "displayEtaInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    v70 = v33;
    objc_msgSend(v33, "legInfos");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = v36;
    if (v36)
    {
      v82[0] = CFSTR("remainingMinutes");
      objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v36, "remainingMinutes"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = v37;
      v82[1] = CFSTR("displayETA");
      objc_msgSend(v36, "eta");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v38;
      if (v38)
        v40 = (const __CFString *)v38;
      else
        v40 = &stru_1E61D9090;
      v83[1] = v40;
      v82[2] = CFSTR("legIndex");
      objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v36, "legIndex"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v83[2] = v41;
      v82[3] = CFSTR("timeZone");
      objc_msgSend(v36, "timeZone");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "description");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v5;
      v45 = (void *)v43;
      if (v43)
        v46 = (const __CFString *)v43;
      else
        v46 = &stru_1E61D9090;
      v83[3] = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 4);
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v47 = 0;
      v44 = v5;
    }
    v80[0] = CFSTR("routeID");
    v34 = v70;
    objc_msgSend(v70, "routeID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "UUIDString");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v50;
    if (v50)
      v52 = (const __CFString *)v50;
    else
      v52 = &stru_1E61D9090;
    v81[0] = v52;
    v80[1] = CFSTR("legInfos");
    v53 = *(void **)(v44 + 2024);
    objc_msgSend(v70, "legInfos");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v55;
    v80[2] = CFSTR("legInfos[0]");
    if (v47)
      v57 = v47;
    else
      v57 = &stru_1E61D9090;
    v81[1] = v55;
    v81[2] = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v3 = v73;
    v5 = v44;
  }
  else
  {
    v48 = 0;
  }
  v78[0] = CFSTR("state");
  objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedInteger:", -[MNNavigationService state](v3, "state"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v58;
  v78[1] = CFSTR("navigationState");
  objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", -[MNNavigationService navigationState](v3, "navigationState"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v59;
  v78[2] = CFSTR("navigationType");
  objc_msgSend(*(id *)(v5 + 2024), "numberWithInteger:", -[MNNavigationService navigationType](v3, "navigationType"));
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v60;
  if (v71)
    v62 = v71;
  else
    v62 = &stru_1E61D9090;
  v79[2] = v60;
  v79[3] = v62;
  v78[3] = CFSTR("currentRoute");
  v78[4] = CFSTR("alternateRoutes");
  if (v23)
    v63 = v23;
  else
    v63 = &stru_1E61D9090;
  v78[5] = CFSTR("displayETA");
  if (v48)
    v64 = v48;
  else
    v64 = &stru_1E61D9090;
  v79[4] = v63;
  v79[5] = v64;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 6);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  return v65;
}

- (MNNavigationDetails)details
{
  return (MNNavigationDetails *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDetails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (MNObserverHashTable)navigationObservers
{
  return self->_navigationObservers;
}

- (void)setNavigationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_navigationObservers, a3);
}

- (MNUserOptions)cachedUserOptions
{
  return (MNUserOptions *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCachedUserOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUserOptions, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_disabledCapabilities, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_realtimeUpdates, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_navigationObservers, 0);
}

+ (unint64_t)clientInterfaceHash
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MNNavigationService_Internal__clientInterfaceHash__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0C3F18 != -1)
    dispatch_once(&qword_1ED0C3F18, block);
  return qword_1ED0C3F10;
}

uint64_t __52__MNNavigationService_Internal__clientInterfaceHash__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hashForProtocol:", &unk_1EEED23B0);
  qword_1ED0C3F10 = result;
  return result;
}

+ (unint64_t)daemonInterfaceHash
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MNNavigationService_Internal__daemonInterfaceHash__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0C3F28 != -1)
    dispatch_once(&qword_1ED0C3F28, block);
  return qword_1ED0C3F20;
}

uint64_t __52__MNNavigationService_Internal__daemonInterfaceHash__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hashForProtocol:", &unk_1EEED5B90);
  qword_1ED0C3F20 = result;
  return result;
}

+ (unint64_t)_hashForProtocol:(id)a3
{
  Protocol *v3;
  void *v4;
  objc_method_description *v5;
  objc_method_description *v6;
  unint64_t v7;
  char **p_types;
  void *v9;
  char *v10;
  unint64_t v11;
  unsigned int outCount;

  v3 = (Protocol *)a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v5 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount);
  v6 = v5;
  if (outCount)
  {
    v7 = 0;
    p_types = &v5->types;
    do
    {
      NSStringFromSelector(*(p_types - 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *p_types;
      p_types += 2;
      objc_msgSend(v4, "appendFormat:", CFSTR("%@%s"), v9, v10);

      ++v7;
    }
    while (v7 < outCount);
  }
  free(v6);
  v11 = objc_msgSend(v4, "hash");

  return v11;
}

- (void)_navigationServiceCallback_DidChangeVoiceGuidanceLevel:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "voiceGuidanceLevel");
    if ((unint64_t)(v8 + 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E61D2FD8[v8 + 1];
    }
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", buf, 0x16u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationService:didChangeVoiceGuidanceLevel:", self, objc_msgSend(v5, "voiceGuidanceLevel"));

}

- (void)_navigationServiceCallback_DidEndNavigation:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "reason");
    if ((unint64_t)(v8 - 1) > 9)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E61D2FF8[v8 - 1];
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v11, 0x16u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationService:didEndWithReason:", self, objc_msgSend(v5, "reason"));

}

- (void)_navigationServiceCallback_DidReceiveRoutingServiceError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "(%{public}@) %@", (uint8_t *)&v11, 0x16u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationService:didReceiveRoutingServiceError:", self, v10);

}

- (void)_navigationServiceCallback_DidUpdateArrivalInfo:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrivalInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v5, "arrivalInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationService details](self, "details");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setArrivalInfo:", v9);

  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrivalInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationService:didUpdateArrivalInfo:", self, v12);

}

- (void)_navigationServiceCallback_DidUpdateBackgroundWalkingRoute:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "routeInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "routeInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "routeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "routeInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayETAInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ | %@ | %@", buf, 0x2Au);

  }
  objc_msgSend(v5, "routeInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationService details](self, "details");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundWalkingRouteInfo:", v14);

  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationService alternateWalkingRoute](self, "alternateWalkingRoute");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationService:didUpdateAlternateWalkingRoute:", self, v17);

}

- (void)_navigationServiceCallback_DidUpdateDisplayETA:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  char *v17;
  void *v18;
  void *v19;
  char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  _BYTE v26[18];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "displayETAInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeDistanceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "batteryChargeInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MNGetMNNavigationServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v10;
    v23 = 2112;
    v24 = (const char *)v6;
    v25 = 2112;
    *(_QWORD *)v26 = v7;
    *(_WORD *)&v26[8] = 2112;
    *(_QWORD *)&v26[10] = v11;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_INFO, "(%{public}@)%@ | %@ | %@", (uint8_t *)&v21, 0x2Au);

  }
  -[MNNavigationService details](self, "details");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "routeInfoForID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "setDisplayETAInfo:", v6);
    objc_msgSend(v14, "setRemainingDistanceInfo:", v7);
    objc_msgSend(v14, "setBatteryChargeInfo:", v8);
    -[MNNavigationService navigationObservers](self, "navigationObservers");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject navigationService:didUpdateDisplayETA:remainingDistance:batteryChargeInfo:](v15, "navigationService:didUpdateDisplayETA:remainingDistance:batteryChargeInfo:", self, v6, v7, v8);
  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "-[MNNavigationService(CallbackHandling) _navigationServiceCallback_DidUpdateDisplayETA:]";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Navigation Service Internal/MNNavigationService+CallbackHandling.m";
      v25 = 1024;
      *(_DWORD *)v26 = 73;
      *(_WORD *)&v26[4] = 2080;
      *(_QWORD *)&v26[6] = "existingRouteInfo != nil";
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v21, 0x26u);
    }

    MNGetMNNavigationServiceLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "description");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationService details](self, "details");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "routeLookupIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v17;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "Error finding route: %@ | Known route IDs: (%@)", (uint8_t *)&v21, 0x16u);

    }
  }

}

- (void)_navigationServiceCallback_DidUpdateMatchedLocation:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MNGetPuckTrackingLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v7;
    v20 = 2080;
    v21 = "-[MNNavigationService(CallbackHandling) _navigationServiceCallback_DidUpdateMatchedLocation:]";
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in %s", (uint8_t *)&v18, 0x16u);

  }
  MNGetMNNavigationServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    v11 = v10;
    objc_msgSend(v5, "coordinate");
    v13 = v12;
    objc_msgSend(v5, "course");
    v15 = (int)v14;
    objc_msgSend(v5, "routeID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413314;
    v19 = v9;
    v20 = 2048;
    v21 = v11;
    v22 = 2048;
    v23 = v13;
    v24 = 1024;
    v25 = v15;
    v26 = 2112;
    v27 = v16;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "(%@) %0.6f, %0.6f | %d | route ID: %@", (uint8_t *)&v18, 0x30u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "navigationService:didUpdateMatchedLocation:", self, v5);

}

- (void)_navigationServiceCallback_DidUpdateNavTrayGuidance:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navTrayGuidanceEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v11, 0x16u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navTrayGuidanceEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationService:didUpdateNavTrayGuidance:", self, v10);

}

- (void)_navigationServiceCallback_DidUpdateResumeRouteHandle:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resumeRouteHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v11, 0x16u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeRouteHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationService:didUpdateResumeRouteHandle:", self, v10);

}

- (void)_navigationServiceCallback_DidUpdateStepIndex:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "stepIndex");
  v7 = objc_msgSend(v5, "segmentIndex");

  MNGetMNNavigationServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v7;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d, %d", (uint8_t *)&v11, 0x18u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationService:didUpdateStepIndex:segmentIndex:", self, v6, v7);

}

- (void)_navigationServiceCallback_DidUpdateTargetLegIndex:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = objc_msgSend(v5, "targetLegIndex");
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d", (uint8_t *)&v9, 0x12u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationService:didUpdateTargetLegIndex:", self, objc_msgSend(v5, "targetLegIndex"));

}

- (void)_navigationServiceCallback_DidUpdateUpcomingAnchorPointIndex:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = objc_msgSend(v5, "anchorPointIndex");
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d", (uint8_t *)&v9, 0x12u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationService:didUpdateUpcomingAnchorPointIndex:", self, objc_msgSend(v5, "anchorPointIndex"));

}

- (void)_navigationServiceCallback_DidUpdateVehicleParkingInfo:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vehicleParkingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v5, "vehicleParkingInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationService details](self, "details");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVehicleParkingInfo:", v9);

  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vehicleParkingInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationService:didUpdateVehicleParkingInfo:", self, v12);

}

- (void)_navigationServiceCallback_ShouldEnableIdleTimer:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = objc_msgSend(v5, "shouldEnable");
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%d", (uint8_t *)&v9, 0x12u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationService:shouldEnableIdleTimer:", self, objc_msgSend(v5, "shouldEnable"));

}

- (void)_navigationServiceCallback_WillEndNavigation:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "reason");
    if ((unint64_t)(v8 - 1) > 9)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E61D2FF8[v8 - 1];
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@", (uint8_t *)&v11, 0x16u);

  }
  -[MNNavigationService navigationObservers](self, "navigationObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationService:willEndWithReason:", self, objc_msgSend(v5, "reason"));

}

- (void)_navigationServiceCallback_WillStartNavigation:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MNGetMNNavigationServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "routeInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "route");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v18, "transportType");
    if (v7 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E61D3048[(int)v7];
    }
    v17 = v8;
    -[__CFString capitalizedString](v8, "capitalizedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "navigationType") - 1;
    if (v10 > 3)
      v11 = CFSTR("None");
    else
      v11 = off_1E61D3080[v10];
    objc_msgSend(v5, "routeInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "routeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationService details](self, "details");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "routeLookupIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v22 = v20;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@)%@ %@ | %@\nKnown route IDs: (%@)", buf, 0x34u);

  }
}

- (void)_updateWithCallback:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MNNavigationService details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithNavigationServiceCallbackParameters:", v4);

  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      MNGetMNNavigationServiceLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_FAULT, "MNNavigationService received \"Unknown\" type callback.", (uint8_t *)&v9, 2u);
      }

      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315650;
        v10 = "-[MNNavigationService(CallbackHandling) _updateWithCallback:]";
        v11 = 2080;
        v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Navigation Service Internal/MNNavigationService+CallbackHandling.m";
        v13 = 1024;
        v14 = 200;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v9, 0x1Cu);
      }
      goto LABEL_70;
    case 1:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidChangeVoiceGuidanceLevel:](self, "_navigationServiceCallback_DidChangeVoiceGuidanceLevel:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 2:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidEndNavigation:](self, "_navigationServiceCallback_DidEndNavigation:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidReceiveRoutingServiceError:](self, "_navigationServiceCallback_DidReceiveRoutingServiceError:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateArrivalInfo:](self, "_navigationServiceCallback_DidUpdateArrivalInfo:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateBackgroundWalkingRoute:](self, "_navigationServiceCallback_DidUpdateBackgroundWalkingRoute:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateDisplayETA:](self, "_navigationServiceCallback_DidUpdateDisplayETA:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateMatchedLocation:](self, "_navigationServiceCallback_DidUpdateMatchedLocation:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 8:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateNavTrayGuidance:](self, "_navigationServiceCallback_DidUpdateNavTrayGuidance:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 9:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateResumeRouteHandle:](self, "_navigationServiceCallback_DidUpdateResumeRouteHandle:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 10:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateStepIndex:](self, "_navigationServiceCallback_DidUpdateStepIndex:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 11:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateTargetLegIndex:](self, "_navigationServiceCallback_DidUpdateTargetLegIndex:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateUpcomingAnchorPointIndex:](self, "_navigationServiceCallback_DidUpdateUpcomingAnchorPointIndex:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_DidUpdateVehicleParkingInfo:](self, "_navigationServiceCallback_DidUpdateVehicleParkingInfo:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 14:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_ShouldEnableIdleTimer:](self, "_navigationServiceCallback_ShouldEnableIdleTimer:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 15:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_WillStartNavigation:](self, "_navigationServiceCallback_WillStartNavigation:", v4);
        goto LABEL_71;
      }
      MNGetMNNavigationServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_69;
      goto LABEL_70;
    case 16:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MNNavigationService _navigationServiceCallback_WillEndNavigation:](self, "_navigationServiceCallback_WillEndNavigation:", v4);
      }
      else
      {
        MNGetMNNavigationServiceLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
LABEL_69:
          MNNavigationServiceCallbackTypeAsString(objc_msgSend(v4, "type"));
          v8 = (char *)objc_claimAutoreleasedReturnValue();
          v9 = 138412546;
          v10 = v8;
          v11 = 2112;
          v12 = (const char *)objc_opt_class();
          _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_FAULT, "Callback parameters of type '%@' was received, but was not the expected subclass. Received '%@' instead.", (uint8_t *)&v9, 0x16u);

        }
LABEL_70:

      }
LABEL_71:

      return;
    default:
      goto LABEL_71;
  }
}

@end
