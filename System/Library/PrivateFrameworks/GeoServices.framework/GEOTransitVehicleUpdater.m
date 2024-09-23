@implementation GEOTransitVehicleUpdater

- (GEOTransitVehicleUpdater)initWithDelegate:(id)a3
{
  id v4;
  GEOTransitVehicleUpdater *v5;
  GEOTransitVehicleUpdater *v6;
  objc_super v8;
  uint8_t buf[4];
  GEOTransitVehicleUpdater *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: delegate != ((void *)0)", buf, 2u);
    }
    v6 = 0;
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitVehicleUpdater;
  v5 = -[GEOTransitVehicleUpdater init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    self = (GEOTransitVehicleUpdater *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1885A9000, &self->super, OS_LOG_TYPE_INFO, "Created %@", buf, 0xCu);
    }
LABEL_5:

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  GEOTransitVehicleUpdater *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Deallocing %@", buf, 0xCu);
  }

  +[GEOTransitVehicleUpdateRequester sharedInstance](GEOTransitVehicleUpdateRequester, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterVehicleUpdater:", self);

  v5.receiver = self;
  v5.super_class = (Class)GEOTransitVehicleUpdater;
  -[GEOTransitVehicleUpdater dealloc](&v5, sel_dealloc);
}

- (void)setTripIDs:(id)a3
{
  NSSet *v5;
  NSSet *tripIDs;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _BOOL4 v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  GEOTransitVehicleUpdater *v16;
  __int16 v17;
  NSSet *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (NSSet *)a3;
  tripIDs = self->_tripIDs;
  if (tripIDs == v5 || -[NSSet isEqualToSet:](tripIDs, "isEqualToSet:", v5))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134218242;
      v14 = -[NSSet count](v5, "count");
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Setting %lu identical tripIds for %@, no action required", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = -[NSSet count](v5, "count");
      v10 = -[GEOTransitVehicleUpdater isActive](self, "isActive");
      v11 = CFSTR("No");
      v13 = 134218755;
      v14 = v9;
      v15 = 2112;
      if (v10)
        v11 = CFSTR("Yes");
      v16 = self;
      v17 = 2113;
      v18 = v5;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Setting %lu tripIds for %@ to %{private}@ (active:%@)", (uint8_t *)&v13, 0x2Au);
    }

    +[GEOTransitVehicleUpdateRequester sharedInstance](GEOTransitVehicleUpdateRequester, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (self->_active)
    {
      -[NSObject unregisterVehicleUpdater:](v12, "unregisterVehicleUpdater:", self);
      objc_storeStrong((id *)&self->_tripIDs, a3);
      -[NSObject registerVehicleUpdater:](v7, "registerVehicleUpdater:", self);
    }
    else
    {
      objc_storeStrong((id *)&self->_tripIDs, a3);
    }
  }

}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  GEOTransitVehicleUpdater *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("inactive");
    if (v3)
      v6 = CFSTR("active");
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@", (uint8_t *)&v9, 0x16u);
  }

  +[GEOTransitVehicleUpdateRequester sharedInstance](GEOTransitVehicleUpdateRequester, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  self->_active = v3;
  if (v3)
    objc_msgSend(v7, "registerVehicleUpdater:", self);
  else
    objc_msgSend(v7, "unregisterVehicleUpdater:", self);

}

- (GEOTransitVehicleUpdaterDelegate)delegate
{
  return (GEOTransitVehicleUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)tripIDs
{
  return self->_tripIDs;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
