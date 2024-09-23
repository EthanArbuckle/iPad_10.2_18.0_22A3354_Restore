@implementation GEOTransitRouteUpdater

- (GEOTransitRouteUpdater)initWithDelegate:(id)a3 andInitialTTL:(double)a4
{
  id v6;
  GEOTransitRouteUpdater *v7;
  GEOTransitRouteUpdater *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: delegate != ((void *)0)", buf, 2u);
    }
    v8 = 0;
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)GEOTransitRouteUpdater;
  v7 = -[GEOTransitRouteUpdater init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v13 = a4;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "setting initialTTL to %f", buf, 0xCu);
    }

    +[GEOTransitRouteUpdateRequester sharedInstance](GEOTransitRouteUpdateRequester, "sharedInstance");
    self = (GEOTransitRouteUpdater *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdater setInitialDelay:](self, "setInitialDelay:", a4);
LABEL_6:

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[GEOTransitRouteUpdateRequester sharedInstance](GEOTransitRouteUpdateRequester, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterRouteUpdater:", self);

  v4.receiver = self;
  v4.super_class = (Class)GEOTransitRouteUpdater;
  -[GEOTransitRouteUpdater dealloc](&v4, sel_dealloc);
}

- (void)setRequests:(id)a3
{
  NSSet *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSSet *requests;
  NSSet *v9;
  int v10;
  GEOTransitRouteUpdater *v11;
  __int16 v12;
  NSSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (NSSet *)a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138478083;
    v11 = self;
    v12 = 2113;
    v13 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "setting requests for Updater %{private}@ to %{private}@", (uint8_t *)&v10, 0x16u);
  }

  +[GEOTransitRouteUpdateRequester sharedInstance](GEOTransitRouteUpdateRequester, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_active)
  {
    objc_msgSend(v6, "unregisterRouteUpdater:", self);
    requests = self->_requests;
    self->_requests = v4;

    objc_msgSend(v7, "registerRouteUpdater:", self);
  }
  else
  {
    v9 = self->_requests;
    self->_requests = v4;

  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  GEOTransitRouteUpdater *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_active != a3)
  {
    v3 = a3;
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = "inactive";
      if (v3)
        v6 = "active";
      v9 = 138478083;
      v10 = self;
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "setting Updater %{private}@ to %s", (uint8_t *)&v9, 0x16u);
    }

    +[GEOTransitRouteUpdateRequester sharedInstance](GEOTransitRouteUpdateRequester, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    self->_active = v3;
    if (v3)
      objc_msgSend(v7, "registerRouteUpdater:", self);
    else
      objc_msgSend(v7, "unregisterRouteUpdater:", self);

  }
}

- (GEOTransitRouteUpdaterDelegate)delegate
{
  return (GEOTransitRouteUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)requests
{
  return self->_requests;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
