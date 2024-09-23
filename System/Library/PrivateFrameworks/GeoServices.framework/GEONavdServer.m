@implementation GEONavdServer

- (GEONavdServer)init
{
  GEONavdServer *v2;
  NSObject *v3;
  GEONavigationServer *v4;
  GEONavigationServer *navigationServer;
  uint64_t v6;
  NSXPCListener *pushNavigationStateListener;
  uint64_t v8;
  NSXPCListener *getNavigationStateListener;
  NSObject *v10;
  NSXPCListener *v11;
  NSXPCListener *v12;
  NSXPCListener *monitorDestinationListener;
  objc_super v15;
  uint8_t buf[4];
  NSXPCListener *v17;
  __int16 v18;
  NSXPCListener *v19;
  __int16 v20;
  NSXPCListener *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)GEONavdServer;
  v2 = -[GEONavdServer init](&v15, sel_init);
  if (v2)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Initializing NavdServer", buf, 2u);
    }

    if (!v2->_navigationServer)
    {
      v4 = objc_alloc_init(GEONavigationServer);
      navigationServer = v2->_navigationServer;
      v2->_navigationServer = v4;

    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.navigationServer"));
    pushNavigationStateListener = v2->_pushNavigationStateListener;
    v2->_pushNavigationStateListener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v2->_pushNavigationStateListener, "setDelegate:", v2);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.navigationListener"));
    getNavigationStateListener = v2->_getNavigationStateListener;
    v2->_getNavigationStateListener = (NSXPCListener *)v8;

    -[NSXPCListener setDelegate:](v2->_getNavigationStateListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_pushNavigationStateListener, "resume");
    -[NSXPCListener resume](v2->_monitorDestinationListener, "resume");
    -[NSXPCListener resume](v2->_getNavigationStateListener, "resume");
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdServer");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = v2->_pushNavigationStateListener;
      v11 = v2->_getNavigationStateListener;
      monitorDestinationListener = v2->_monitorDestinationListener;
      *(_DWORD *)buf = 138478339;
      v17 = v11;
      v18 = 2113;
      v19 = v12;
      v20 = 2113;
      v21 = monitorDestinationListener;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "geonavd server initialized all listeners: %{private}@, %{private}@, %{private}@", buf, 0x20u);
    }

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_pushNavigationStateListener, "invalidate");
  -[NSXPCListener invalidate](self->_getNavigationStateListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)GEONavdServer;
  -[GEONavdServer dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *pushNavigationStateListener;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v13;
  uint8_t buf[2];

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  pushNavigationStateListener = self->_pushNavigationStateListener;
  if (pushNavigationStateListener == v6)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdServer");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "Push State Listener: Connection created.";
      v11 = buf;
      goto LABEL_7;
    }
LABEL_8:

    -[GEONavigationServer shouldAcceptNewConnection:shouldCreateNavigationPeer:](self->_navigationServer, "shouldAcceptNewConnection:shouldCreateNavigationPeer:", v7, pushNavigationStateListener != v6);
    goto LABEL_9;
  }
  if (self->_getNavigationStateListener == v6)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdServer");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = 0;
      v10 = "Get State Listener: Connection created.";
      v11 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, v10, v11, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationServer, 0);
  objc_storeStrong((id *)&self->_monitorDestinationListener, 0);
  objc_storeStrong((id *)&self->_getNavigationStateListener, 0);
  objc_storeStrong((id *)&self->_pushNavigationStateListener, 0);
}

@end
