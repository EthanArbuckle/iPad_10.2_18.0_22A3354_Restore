@implementation GEONavigationServerPeer

- (void)requestRoute
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  GEONavigationServerPeer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement && self->_wantsRoutes)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Route requested from: %@", (uint8_t *)&v5, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_requestRouteWithPeer:", self);

  }
}

- (void)requestETAUpdate
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  GEONavigationServerPeer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement && self->_wantsRoutes)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "ETA requested from: %@", (uint8_t *)&v5, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_requestETAWithPeer:", self);

  }
}

- (void)requestRouteSummary
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "route summary requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestRouteSummaryWithPeer:", self);

  }
}

- (void)requestTransitSummary
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "transit summary requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestTransitSummaryWithPeer:", self);

  }
}

- (void)requestGuidanceState
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "guidance state requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestGuidanceStateWithPeer:", self);

  }
}

- (void)requestActiveRouteDetailsData
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "active route details data requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestActiveRouteDetailsDataWithPeer:", self);

  }
}

- (void)requestStepIndex
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "step index requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestStepIndexWithPeer:", self);

  }
}

- (void)requestStepNameInfo
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "step name info requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestStepNameInfoWithPeer:", self);

  }
}

- (void)requestRideSelections
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "selected ride option requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestRideSelectionsWithPeer:", self);

  }
}

- (void)requestPositionFromSign
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "position from sign requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestPositionFromSignWithPeer:", self);

  }
}

- (void)requestPositionFromManeuver
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "position from maneuver requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestPositionFromManeuverWithPeer:", self);

  }
}

- (void)requestPositionFromDestination
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "position from destination requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestPositionFromDestinationWithPeer:", self);

  }
}

- (void)requestNavigationVoiceVolume
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_hasEntitlement)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = 138477827;
      v7 = WeakRetained;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "navigation voice volume requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);

    }
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "_requestNavigationVoiceVolumeWithPeer:", self);

  }
}

- (void)requestUpdates
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = 138477827;
    v6 = WeakRetained;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Does nothing but makes the connection alive. Updates requested from navigation peer and delegate:%{private}@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)setWantsRoutes:(BOOL)a3
{
  self->_wantsRoutes = a3;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[GEONavdClientInfo description](self->super._clientInfo, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v7 = v4;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "deallocating peer:%{private}@", buf, 0xCu);

  }
  v5.receiver = self;
  v5.super_class = (Class)GEONavigationServerPeer;
  -[GEONavigationServerPeer dealloc](&v5, sel_dealloc);
}

- (GEONavigationServer)delegate
{
  return (GEONavigationServer *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasEntitlement
{
  return self->_hasEntitlement;
}

- (void)setHasEntitlement:(BOOL)a3
{
  self->_hasEntitlement = a3;
}

- (BOOL)wantsRoutes
{
  return self->_wantsRoutes;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
