@implementation MNHybridLocationProvider

- (BOOL)coarseModeEnabled
{
  return -[MNCoreLocationProvider coarseModeEnabled](self->_coreLocationProvider, "coarseModeEnabled");
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
  id v5;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MNGetPuckTrackingLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "uuid");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNHybridLocationProvider::locationProvider:didUpdateLocation:", (uint8_t *)&v12, 0xCu);

  }
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = -[MNHybridLocationProvider mode](self, "mode");
    v10 = CFSTR("Default");
    if (v9 == 1)
      v10 = CFSTR("Leeching");
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "Received location while in %@ mode:%@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v5, "setIsLeeched:", self->_mode == 1);
  -[MNHybridLocationProvider delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationProvider:didUpdateLocation:", self, v5);

}

- (MNLocationProviderDelegate)delegate
{
  return (MNLocationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MNHybridLocationProvider)init
{
  MNHybridLocationProvider *v2;
  MNCoreLocationProvider *v3;
  MNCoreLocationProvider *coreLocationProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNHybridLocationProvider;
  v2 = -[MNHybridLocationProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MNCoreLocationProvider);
    coreLocationProvider = v2->_coreLocationProvider;
    v2->_coreLocationProvider = v3;

    -[MNHybridLocationProvider _sharedInit](v2, "_sharedInit");
  }
  return v2;
}

- (MNHybridLocationProvider)initWithEffectiveBundle:(id)a3
{
  id v4;
  MNHybridLocationProvider *v5;
  MNCoreLocationProvider *v6;
  MNCoreLocationProvider *coreLocationProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNHybridLocationProvider;
  v5 = -[MNHybridLocationProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = -[MNCoreLocationProvider initWithEffectiveBundle:]([MNCoreLocationProvider alloc], "initWithEffectiveBundle:", v4);
    coreLocationProvider = v5->_coreLocationProvider;
    v5->_coreLocationProvider = v6;

    -[MNHybridLocationProvider _sharedInit](v5, "_sharedInit");
  }

  return v5;
}

- (MNHybridLocationProvider)initWithEffectiveBundleIdentifier:(id)a3
{
  id v4;
  MNHybridLocationProvider *v5;
  MNCoreLocationProvider *v6;
  MNCoreLocationProvider *coreLocationProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNHybridLocationProvider;
  v5 = -[MNHybridLocationProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = -[MNCoreLocationProvider initWithEffectiveBundleIdentifier:]([MNCoreLocationProvider alloc], "initWithEffectiveBundleIdentifier:", v4);
    coreLocationProvider = v5->_coreLocationProvider;
    v5->_coreLocationProvider = v6;

    -[MNHybridLocationProvider _sharedInit](v5, "_sharedInit");
  }

  return v5;
}

- (void)setMode:(unint64_t)a3
{
  double *p_nonLeechedDesiredAccuracy;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_mode != a3)
  {
    p_nonLeechedDesiredAccuracy = &self->_nonLeechedDesiredAccuracy;
    if (a3 == 1)
      p_nonLeechedDesiredAccuracy = (double *)MEMORY[0x1E0C9E4C8];
    -[MNHybridLocationProvider _setEffectiveAccuracy:](self, "_setEffectiveAccuracy:", *p_nonLeechedDesiredAccuracy);
    self->_mode = a3;
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = CFSTR("Default");
      if (a3 == 1)
        v7 = CFSTR("Leeching");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "Switched to %@ mode", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (double)distanceFilter
{
  return self->_distanceFilter;
}

- (void)setDistanceFilter:(double)a3
{
  _QWORD v4[4];
  id v5[2];
  id location;

  self->_distanceFilter = a3;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MNHybridLocationProvider_setDistanceFilter___block_invoke;
  v4[3] = &unk_1E61D7B30;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  MNRunAsynchronouslyOnMainThread(v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __46__MNHybridLocationProvider_setDistanceFilter___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "setDistanceFilter:", *(double *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[MNHybridLocationProvider setDistanceFilter:]_block_invoke";
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (double)desiredAccuracy
{
  return self->_effectiveAccuracy;
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_nonLeechedDesiredAccuracy = a3;
  if (!self->_mode)
    -[MNHybridLocationProvider _setEffectiveAccuracy:](self, "_setEffectiveAccuracy:");
}

- (void)_sharedInit
{
  -[MNHybridLocationProvider setDesiredAccuracy:](self, "setDesiredAccuracy:", *MEMORY[0x1E0C9E498]);
  -[MNHybridLocationProvider setDistanceFilter:](self, "setDistanceFilter:", *MEMORY[0x1E0C9E480]);
  -[MNCoreLocationProvider setDelegate:](self->_coreLocationProvider, "setDelegate:", self);
  -[MNCoreLocationProvider setMatchInfoEnabled:](self->_coreLocationProvider, "setMatchInfoEnabled:", 0);
}

- (void)_setEffectiveAccuracy:(double)a3
{
  _QWORD v4[4];
  id v5[2];
  id location;

  self->_effectiveAccuracy = a3;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MNHybridLocationProvider__setEffectiveAccuracy___block_invoke;
  v4[3] = &unk_1E61D7B30;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  MNRunAsynchronouslyOnMainThread(v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __50__MNHybridLocationProvider__setEffectiveAccuracy___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "setDesiredAccuracy:", *(double *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[MNHybridLocationProvider _setEffectiveAccuracy:]_block_invoke";
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (id)coreLocationProvider
{
  return self->_coreLocationProvider;
}

- (id)leechedLocationProvider
{
  return self->_coreLocationProvider;
}

- (void)startUpdatingLocation
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__MNHybridLocationProvider_startUpdatingLocation__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __49__MNHybridLocationProvider_startUpdatingLocation__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startUpdatingLocation");

}

- (void)stopUpdatingLocation
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__MNHybridLocationProvider_stopUpdatingLocation__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__MNHybridLocationProvider_stopUpdatingLocation__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopUpdatingLocation");

}

- (void)startUpdatingHeading
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__MNHybridLocationProvider_startUpdatingHeading__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__MNHybridLocationProvider_startUpdatingHeading__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startUpdatingHeading");

}

- (void)stopUpdatingHeading
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__MNHybridLocationProvider_stopUpdatingHeading__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __47__MNHybridLocationProvider_stopUpdatingHeading__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopUpdatingHeading");

}

- (void)startUpdatingVehicleSpeed
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__MNHybridLocationProvider_startUpdatingVehicleSpeed__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __53__MNHybridLocationProvider_startUpdatingVehicleSpeed__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startUpdatingVehicleSpeed");

}

- (void)stopUpdatingVehicleSpeed
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__MNHybridLocationProvider_stopUpdatingVehicleSpeed__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __52__MNHybridLocationProvider_stopUpdatingVehicleSpeed__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopUpdatingVehicleSpeed");

}

- (void)startUpdatingVehicleHeading
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__MNHybridLocationProvider_startUpdatingVehicleHeading__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __55__MNHybridLocationProvider_startUpdatingVehicleHeading__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startUpdatingVehicleHeading");

}

- (void)stopUpdatingVehicleHeading
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__MNHybridLocationProvider_stopUpdatingVehicleHeading__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __54__MNHybridLocationProvider_stopUpdatingVehicleHeading__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopUpdatingVehicleHeading");

}

- (void)resetForActiveTileGroupChanged
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__MNHybridLocationProvider_resetForActiveTileGroupChanged__block_invoke;
  v2[3] = &unk_1E61D2F90;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __58__MNHybridLocationProvider_resetForActiveTileGroupChanged__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetForActiveTileGroupChanged");

}

- (NSBundle)effectiveBundle
{
  return -[MNCoreLocationProvider effectiveBundle](self->_coreLocationProvider, "effectiveBundle");
}

- (void)setEffectiveBundle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MNHybridLocationProvider_setEffectiveBundle___block_invoke;
  v6[3] = &unk_1E61D1AE8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  MNRunAsynchronouslyOnMainThread(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __47__MNHybridLocationProvider_setEffectiveBundle___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEffectiveBundle:", *(_QWORD *)(a1 + 32));

}

- (NSString)effectiveBundleIdentifier
{
  return -[MNCoreLocationProvider effectiveBundleIdentifier](self->_coreLocationProvider, "effectiveBundleIdentifier");
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MNHybridLocationProvider_setEffectiveBundleIdentifier___block_invoke;
  v6[3] = &unk_1E61D1AE8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  MNRunAsynchronouslyOnMainThread(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __57__MNHybridLocationProvider_setEffectiveBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEffectiveBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

- (BOOL)isAuthorized
{
  return -[MNCoreLocationProvider isAuthorized](self->_coreLocationProvider, "isAuthorized");
}

- (int)headingOrientation
{
  return -[MNCoreLocationProvider headingOrientation](self->_coreLocationProvider, "headingOrientation");
}

- (void)setHeadingOrientation:(int)a3
{
  _QWORD v4[4];
  id v5;
  int v6;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MNHybridLocationProvider_setHeadingOrientation___block_invoke;
  v4[3] = &unk_1E61D7B58;
  objc_copyWeak(&v5, &location);
  v6 = a3;
  MNRunAsynchronouslyOnMainThread(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__MNHybridLocationProvider_setHeadingOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "coreLocationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeadingOrientation:", *(unsigned int *)(a1 + 40));

}

- (double)expectedGpsUpdateInterval
{
  double result;

  -[MNCoreLocationProvider expectedGpsUpdateInterval](self->_coreLocationProvider, "expectedGpsUpdateInterval");
  return result;
}

- (BOOL)isTracePlayer
{
  return -[MNCoreLocationProvider isTracePlayer](self->_coreLocationProvider, "isTracePlayer");
}

- (unint64_t)traceVersion
{
  return 0;
}

- (double)timeScale
{
  double result;

  -[MNCoreLocationProvider timeScale](self->_coreLocationProvider, "timeScale");
  return result;
}

- (void)startMonitoringForRegion:(id)a3
{
  -[MNCoreLocationProvider startMonitoringForRegion:](self->_coreLocationProvider, "startMonitoringForRegion:", a3);
}

- (void)stopMonitoringForRegion:(id)a3
{
  -[MNCoreLocationProvider stopMonitoringForRegion:](self->_coreLocationProvider, "stopMonitoringForRegion:", a3);
}

- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MNHybridLocationProvider delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationProvider:didUpdateHeading:", self, v5);

}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MNHybridLocationProvider delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationProvider:didReceiveError:", self, v5);

}

- (void)locationProviderDidChangeAuthorizationStatus:(id)a3
{
  id v4;

  -[MNHybridLocationProvider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationProviderDidChangeAuthorizationStatus:", self);

}

- (void)locationProvider:(id)a3 didChangeCoarseMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[MNHybridLocationProvider delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationProvider:didChangeCoarseMode:", self, v4);

}

- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3
{
  MNHybridLocationProvider *v3;
  void *v4;

  v3 = self;
  -[MNHybridLocationProvider delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "locationProviderShouldPauseLocationUpdates:", v3);

  return (char)v3;
}

- (void)locationProviderDidPauseLocationUpdates:(id)a3
{
  id v4;

  -[MNHybridLocationProvider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationProviderDidPauseLocationUpdates:", self);

}

- (void)locationProviderDidResumeLocationUpdates:(id)a3
{
  id v4;

  -[MNHybridLocationProvider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationProviderDidResumeLocationUpdates:", self);

}

- (void)locationProvider:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[MNHybridLocationProvider delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationProvider:didUpdateVehicleSpeed:timestamp:", self, v7, a4);

}

- (void)locationProvider:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[MNHybridLocationProvider delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationProvider:didUpdateVehicleHeading:timestamp:", self, v7, a4);

}

- (void)locationProvider:(id)a3 didEnterRegion:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MNHybridLocationProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MNHybridLocationProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationProvider:didEnterRegion:", self, v8);

  }
}

- (void)locationProvider:(id)a3 didExitRegion:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MNHybridLocationProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MNHybridLocationProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationProvider:didExitRegion:", self, v8);

  }
}

- (void)locationProvider:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[MNHybridLocationProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MNHybridLocationProvider delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationProvider:monitoringDidFailForRegion:withError:", self, v11, v7);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coreLocationProvider, 0);
}

@end
