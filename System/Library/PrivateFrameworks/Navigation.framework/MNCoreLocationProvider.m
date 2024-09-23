@implementation MNCoreLocationProvider

- (BOOL)coarseModeEnabled
{
  return self->_coarseModeEnabled;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  MNLocation *v12;
  NSObject *v13;
  MNCoreLocationProvider *v14;
  id WeakRetained;
  NSObject *v16;
  NSObject *v17;
  int v18;
  MNCoreLocationProvider *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = self;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "%p MNCoreLocationProvider locationManager:didUpdateLocations", (uint8_t *)&v18, 0xCu);
  }

  MNGetMNLocationProviderLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DidUpdateLocations", ", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(v5, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MNLocation initWithCLLocation:]([MNLocation alloc], "initWithCLLocation:", v11);
  -[CLLocation _navigation_setGtLog:](v12, "_navigation_setGtLog:", 1);
  MNGetPuckTrackingLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[MNLocation uuid](v12, "uuid");
    v14 = (MNCoreLocationProvider *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v14;
    _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_INFO, "[MN] [%@] - Received - from MNCoreLocationProvider", (uint8_t *)&v18, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "locationProvider:didUpdateLocation:", self, v12);

  v16 = v10;
  v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v17, OS_SIGNPOST_INTERVAL_END, v8, "DidUpdateLocations", ", (uint8_t *)&v18, 2u);
  }

}

- (MNCoreLocationProvider)init
{
  MNCoreLocationProvider *v2;
  MNCoreLocationProvider *v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  MNCoreLocationProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MNCoreLocationProvider;
  v2 = -[MNCoreLocationProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MNCoreLocationProvider _sharedInit](v2, "_sharedInit");
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = v3;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "%p -[MNCoreLocationProvider init]", buf, 0xCu);
    }

  }
  return v3;
}

- (MNCoreLocationProvider)initWithEffectiveBundle:(id)a3
{
  id v5;
  MNCoreLocationProvider *v6;
  MNCoreLocationProvider *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  MNCoreLocationProvider *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNCoreLocationProvider;
  v6 = -[MNCoreLocationProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[MNCoreLocationProvider _sharedInit](v6, "_sharedInit");
    objc_storeStrong((id *)&v7->_effectiveBundle, a3);
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v12 = v7;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "%p -[MNCoreLocationProvider initWithEffectiveBundle:] - %@", buf, 0x16u);
    }

  }
  return v7;
}

- (MNCoreLocationProvider)initWithEffectiveBundleIdentifier:(id)a3
{
  id v4;
  MNCoreLocationProvider *v5;
  MNCoreLocationProvider *v6;
  uint64_t v7;
  NSString *effectiveBundleIdentifier;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  MNCoreLocationProvider *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MNCoreLocationProvider;
  v5 = -[MNCoreLocationProvider init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MNCoreLocationProvider _sharedInit](v5, "_sharedInit");
    v7 = objc_msgSend(v4, "copy");
    effectiveBundleIdentifier = v6->_effectiveBundleIdentifier;
    v6->_effectiveBundleIdentifier = (NSString *)v7;

    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v13 = v6;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "%p -[MNCoreLocationProvider initWithEffectiveBundleIdentifier:] - %@", buf, 0x16u);
    }

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  char *WeakRetained;
  id v6;
  void *v7;
  NSObject *v8;
  objc_super v9;
  _QWORD v10[5];
  uint8_t buf[4];
  MNCoreLocationProvider *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  _BYTE v16[14];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dealloc should be called on the main thread"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = (MNCoreLocationProvider *)"-[MNCoreLocationProvider dealloc]";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNCoreLocationProvider.m";
      v15 = 1024;
      *(_DWORD *)v16 = 91;
      *(_WORD *)&v16[4] = 2080;
      *(_QWORD *)&v16[6] = "[NSThread isMainThread]";
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CLLocationManager stopUpdatingLocation](self->_clLocationManager, "stopUpdatingLocation");
  -[CLLocationManager stopUpdatingHeading](self->_clLocationManager, "stopUpdatingHeading");
  -[CLLocationManager setDelegate:](self->_clLocationManager, "setDelegate:", 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__MNCoreLocationProvider_dealloc__block_invoke;
  v10[3] = &unk_1E61D23C8;
  v10[4] = self;
  MNRunSynchronouslyOnMainThread(v10);
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_debug_initRunLoop);
    v6 = objc_loadWeakRetained((id *)&self->_debug_deinitRunLoop);
    *(_DWORD *)buf = 134218496;
    v12 = self;
    v13 = 2048;
    v14 = WeakRetained;
    v15 = 2048;
    *(_QWORD *)v16 = v6;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "%p CL manager created on %p, dealloced on %p", buf, 0x20u);

  }
  v9.receiver = self;
  v9.super_class = (Class)MNCoreLocationProvider;
  -[MNCoreLocationProvider dealloc](&v9, sel_dealloc);
}

void __33__MNCoreLocationProvider_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 96), v4);

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MNCoreLocationProvider *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218498;
    v7 = self;
    v8 = 2112;
    v9 = objc_opt_class();
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "%p -[MNCoreLocationProvider setDelegate:] - %@ %p", (uint8_t *)&v6, 0x20u);
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)_sharedInit
{
  double v2;

  v2 = *MEMORY[0x1E0C9E498];
  self->_distanceFilter = *(double *)MEMORY[0x1E0C9E480];
  self->_desiredAccuracy = v2;
  self->_matchInfoEnabled = 1;
  self->_authorizationStatus = 0;
  self->_coarseModeEnabled = 0;
}

- (void)setCLParameters:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (self->_clLocationManager)
    -[MNCoreLocationProvider _updateForCLParameters:](self, "_updateForCLParameters:", v5);
  else
    objc_storeStrong((id *)&self->_clParameters, a3);

}

- (void)_createCLLocationManager
{
  NSObject *v3;
  NSBundle *effectiveBundle;
  NSString *effectiveBundleIdentifier;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  char *WeakRetained;
  CLLocationManager *clLocationManager;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  MNCoreLocationProvider *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  _BYTE v28[28];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Should be main thread"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = (MNCoreLocationProvider *)"-[MNCoreLocationProvider _createCLLocationManager]";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNCoreLocationProvider.m";
      v27 = 1024;
      *(_DWORD *)v28 = 134;
      *(_WORD *)&v28[4] = 2080;
      *(_QWORD *)&v28[6] = "[NSThread isMainThread]";
      *(_WORD *)&v28[14] = 2112;
      *(_QWORD *)&v28[16] = v14;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  if (!self->_clLocationManager)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      effectiveBundle = self->_effectiveBundle;
      effectiveBundleIdentifier = self->_effectiveBundleIdentifier;
      *(_DWORD *)buf = 134218499;
      v24 = self;
      v25 = 2113;
      v26 = (const char *)effectiveBundle;
      v27 = 2113;
      *(_QWORD *)v28 = effectiveBundleIdentifier;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p Creating with effective bundle: %{private}@ | identifier: %{private}@", buf, 0x20u);
    }

    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    v22 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__MNCoreLocationProvider__createCLLocationManager__block_invoke;
    v16[3] = &unk_1E61D1B10;
    v16[4] = self;
    v16[5] = &v17;
    MNRunSynchronouslyOnMainThread(v16);
    v6 = (void *)v18[5];
    if (!v6)
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v24 = self;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "%p CLLocationManager failed to init!", buf, 0xCu);
      }

      v6 = (void *)v18[5];
    }
    objc_msgSend(v6, "setDistanceFilter:", self->_distanceFilter);
    objc_msgSend((id)v18[5], "setDesiredAccuracy:", self->_desiredAccuracy);
    objc_msgSend((id)v18[5], "setMatchInfoEnabled:", self->_matchInfoEnabled);
    objc_storeStrong((id *)&self->_clLocationManager, (id)v18[5]);
    -[MNCoreLocationProvider _updateForCLParameters:](self, "_updateForCLParameters:", self->_clParameters);
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_debug_initRunLoop);
      clLocationManager = self->_clLocationManager;
      objc_msgSend((id)v18[5], "distanceFilter");
      v12 = v11;
      objc_msgSend((id)v18[5], "desiredAccuracy");
      *(_DWORD *)buf = 134219011;
      v24 = self;
      v25 = 2048;
      v26 = WeakRetained;
      v27 = 2113;
      *(_QWORD *)v28 = clLocationManager;
      *(_WORD *)&v28[8] = 2048;
      *(_QWORD *)&v28[10] = v12;
      *(_WORD *)&v28[18] = 2048;
      *(_QWORD *)&v28[20] = v13;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "%p CLLocationManager created on %p | %{private}@ | distanceFilter: %g | desiredAccuracy: %g", buf, 0x34u);

    }
    _Block_object_dispose(&v17, 8);

  }
}

void __50__MNCoreLocationProvider__createCLLocationManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48))
  {
    v3 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bundlePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithEffectiveBundlePath:delegate:onQueue:", v4, *(_QWORD *)(a1 + 32), MEMORY[0x1E0C80D38]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else if (*(_QWORD *)(v2 + 56))
  {
    v8 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    v9 = objc_msgSend(v8, "initWithEffectiveBundleIdentifier:delegate:onQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 32), MEMORY[0x1E0C80D38]);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C9E3C8]);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 88), v15);

}

- (CLLocationManager)_clLocationManager
{
  CLLocationManager *clLocationManager;

  clLocationManager = self->_clLocationManager;
  if (!clLocationManager)
  {
    -[MNCoreLocationProvider _createCLLocationManager](self, "_createCLLocationManager");
    clLocationManager = self->_clLocationManager;
  }
  return clLocationManager;
}

- (void)_updateForCLParameters:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MNLocationProviderCLParameters *clParameters;
  int v8;
  MNCoreLocationProvider *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && self->_clLocationManager)
  {
    -[CLLocationManager setActivityType:](self->_clLocationManager, "setActivityType:", objc_msgSend(v4, "activityType"));
    -[CLLocationManager _setFusionInfoEnabled:](self->_clLocationManager, "_setFusionInfoEnabled:", objc_msgSend(v5, "fusionInfoEnabled"));
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218496;
      v9 = self;
      v10 = 1024;
      v11 = objc_msgSend(v5, "activityType");
      v12 = 1024;
      v13 = objc_msgSend(v5, "fusionInfoEnabled");
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider setting CL parameters: activityType:%d, fusionInfoEnabled:%d", (uint8_t *)&v8, 0x18u);
    }

    clParameters = self->_clParameters;
    self->_clParameters = 0;

  }
}

- (void)_updateAuthorizationStatus
{
  NSObject *v3;
  CLLocationManager *clLocationManager;
  int v5;
  NSObject *v6;
  int authorizationStatus;
  NSBundle *effectiveBundle;
  NSString *effectiveBundleIdentifier;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  MNCoreLocationProvider *v14;
  __int16 v15;
  _BYTE v16[14];
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = self;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider _updateAuthorizationStatus", buf, 0xCu);
  }

  clLocationManager = self->_clLocationManager;
  v5 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (clLocationManager)
  {
    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_updateAuthorizationStatus needs to be called on the main thread"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = (MNCoreLocationProvider *)"[NSThread isMainThread]";
        v15 = 2112;
        *(_QWORD *)v16 = v10;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }

    }
    self->_authorizationStatus = -[CLLocationManager authorizationStatus](self->_clLocationManager, "authorizationStatus");
    -[MNCoreLocationProvider _updateCoarseModeEnabled](self, "_updateCoarseModeEnabled");
    self->_hasQueriedAuthorization = 1;
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      authorizationStatus = self->_authorizationStatus;
      effectiveBundle = self->_effectiveBundle;
      effectiveBundleIdentifier = self->_effectiveBundleIdentifier;
      *(_DWORD *)buf = 134218755;
      v14 = self;
      v15 = 1024;
      *(_DWORD *)v16 = authorizationStatus;
      *(_WORD *)&v16[4] = 2113;
      *(_QWORD *)&v16[6] = effectiveBundle;
      v17 = 2113;
      v18 = effectiveBundleIdentifier;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%p CL authorization status: %d | bundle: %{private}@ | identifier: %{private}@", buf, 0x26u);
    }

  }
  else if (v5)
  {
    -[MNCoreLocationProvider _createCLLocationManager](self, "_createCLLocationManager");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MNCoreLocationProvider__updateAuthorizationStatus__block_invoke;
    block[3] = &unk_1E61D23C8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __52__MNCoreLocationProvider__updateAuthorizationStatus__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createCLLocationManager");
  return objc_msgSend(*(id *)(a1 + 32), "_updateAuthorizationStatus");
}

- (void)_updateCoarseModeEnabled
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  MNCoreLocationProvider *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_clLocationManager)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider _updateCoarseModeEnabled", (uint8_t *)&v7, 0xCu);
    }

    v4 = (self->_authorizationStatus - 3) <= 1
      && -[CLLocationManager accuracyAuthorization](self->_clLocationManager, "accuracyAuthorization") == CLAccuracyAuthorizationReducedAccuracy;
    if (self->_coarseModeEnabled != v4)
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = CFSTR("YES");
        if (!self->_coarseModeEnabled)
          v6 = CFSTR("NO");
        v7 = 134218242;
        v8 = self;
        v9 = 2112;
        v10 = v6;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "%p CL Coarse Mode Enabled: %@", (uint8_t *)&v7, 0x16u);
      }

      self->_coarseModeEnabled = v4;
    }
  }
}

- (void)setDistanceFilter:(double)a3
{
  -[CLLocationManager setDistanceFilter:](self->_clLocationManager, "setDistanceFilter:", a3);
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_desiredAccuracy = a3;
  -[CLLocationManager setDesiredAccuracy:](self->_clLocationManager, "setDesiredAccuracy:");
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  self->_matchInfoEnabled = a3;
  -[CLLocationManager setMatchInfoEnabled:](self->_clLocationManager, "setMatchInfoEnabled:");
}

- (void)startUpdatingLocation
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  MNCoreLocationProvider *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_effectiveBundle && !self->_effectiveBundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bundle or bundle identifier must be set to create a CoreLocation provider."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = (MNCoreLocationProvider *)"_effectiveBundle != nil || _effectiveBundleIdentifier != nil";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

  }
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider startUpdatingLocation", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MNCoreLocationProvider_startUpdatingLocation__block_invoke;
  v6[3] = &unk_1E61D23C8;
  v6[4] = self;
  MNRunAsynchronouslyOnMainThread(v6);
}

uint64_t __47__MNCoreLocationProvider_startUpdatingLocation__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
  {
    objc_msgSend(v2, "_createCLLocationManager");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_updateAuthorizationStatus");
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthorized") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "Trying to start Navigation location updates without location authorization", (uint8_t *)&v7, 2u);
    }

  }
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "%p Calling startUpdatingLocation on CLLocationManager", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "startUpdatingLocation");
}

- (void)stopUpdatingLocation
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  MNCoreLocationProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider stopUpdatingLocation", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MNCoreLocationProvider_stopUpdatingLocation__block_invoke;
  v4[3] = &unk_1E61D23C8;
  v4[4] = self;
  MNRunAsynchronouslyOnMainThread(v4);
}

uint64_t __46__MNCoreLocationProvider_stopUpdatingLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stopUpdatingLocation");
}

- (void)requestLocation
{
  NSObject *v3;
  int v4;
  MNCoreLocationProvider *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider requestLocation", (uint8_t *)&v4, 0xCu);
  }

  -[CLLocationManager requestLocation](self->_clLocationManager, "requestLocation");
}

- (void)startUpdatingHeading
{
  NSObject *v3;
  void *v4;
  int v5;
  MNCoreLocationProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider startUpdatingHeading", (uint8_t *)&v5, 0xCu);
  }

  -[MNCoreLocationProvider _clLocationManager](self, "_clLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startUpdatingHeading");

}

- (void)stopUpdatingHeading
{
  NSObject *v3;
  int v4;
  MNCoreLocationProvider *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider stopUpdatingHeading", (uint8_t *)&v4, 0xCu);
  }

  -[CLLocationManager stopUpdatingHeading](self->_clLocationManager, "stopUpdatingHeading");
}

- (void)startUpdatingVehicleSpeed
{
  NSObject *v2;
  uint8_t v3[16];

  -[CLLocationManager startUpdatingVehicleSpeed](self->_clLocationManager, "startUpdatingVehicleSpeed");
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEBUG, "Starting vehicle speed updates", v3, 2u);
  }

}

- (void)stopUpdatingVehicleSpeed
{
  NSObject *v2;
  uint8_t v3[16];

  -[CLLocationManager stopUpdatingVehicleSpeed](self->_clLocationManager, "stopUpdatingVehicleSpeed");
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEBUG, "Stopping vehicle speed updates", v3, 2u);
  }

}

- (void)startUpdatingVehicleHeading
{
  NSObject *v2;
  uint8_t v3[16];

  -[CLLocationManager startUpdatingVehicleHeading](self->_clLocationManager, "startUpdatingVehicleHeading");
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEBUG, "Starting vehicle heading updates", v3, 2u);
  }

}

- (void)stopUpdatingVehicleHeading
{
  NSObject *v2;
  uint8_t v3[16];

  -[CLLocationManager stopUpdatingVehicleHeading](self->_clLocationManager, "stopUpdatingVehicleHeading");
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEBUG, "Stopping vehicle heading updates", v3, 2u);
  }

}

- (void)resetForActiveTileGroupChanged
{
  NSObject *v3;
  int v4;
  MNCoreLocationProvider *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider resetForActiveTileGroupChanged", (uint8_t *)&v4, 0xCu);
  }

  -[MNCoreLocationProvider stopUpdatingLocation](self, "stopUpdatingLocation");
  -[MNCoreLocationProvider startUpdatingLocation](self, "startUpdatingLocation");
}

- (void)_resetForNewEffectiveBundle
{
  CLLocationManager *clLocationManager;
  double v4;
  double v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];
  uint8_t buf[4];
  MNCoreLocationProvider *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  clLocationManager = self->_clLocationManager;
  if (clLocationManager)
  {
    -[CLLocationManager desiredAccuracy](clLocationManager, "desiredAccuracy");
    v5 = v4;
    -[CLLocationManager setDelegate:](self->_clLocationManager, "setDelegate:", 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__MNCoreLocationProvider__resetForNewEffectiveBundle__block_invoke;
    v9[3] = &unk_1E61D23C8;
    v9[4] = self;
    MNRunSynchronouslyOnMainThread(v9);
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_debug_initRunLoop);
      v8 = objc_loadWeakRetained((id *)&self->_debug_deinitRunLoop);
      *(_DWORD *)buf = 134218496;
      v11 = self;
      v12 = 2048;
      v13 = WeakRetained;
      v14 = 2048;
      v15 = v8;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%p CL manager created on %p, dealloced on %p", buf, 0x20u);

    }
    -[MNCoreLocationProvider _updateAuthorizationStatus](self, "_updateAuthorizationStatus");
    -[MNCoreLocationProvider setDesiredAccuracy:](self, "setDesiredAccuracy:", v5);
  }
}

void __53__MNCoreLocationProvider__resetForNewEffectiveBundle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 96), v4);

}

- (NSBundle)effectiveBundle
{
  return self->_effectiveBundle;
}

- (void)setEffectiveBundle:(id)a3
{
  id v5;
  NSObject *v6;
  CLLocationManager *clLocationManager;
  int v8;
  MNCoreLocationProvider *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  CLLocationManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    clLocationManager = self->_clLocationManager;
    v8 = 134218499;
    v9 = self;
    v10 = 2113;
    v11 = v5;
    v12 = 2113;
    v13 = clLocationManager;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider setEffectiveBundle: %{private}@ | CL: %{private}@", (uint8_t *)&v8, 0x20u);
  }

  if ((objc_msgSend(v5, "isEqual:", self->_effectiveBundle) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_effectiveBundle, a3);
    -[MNCoreLocationProvider _resetForNewEffectiveBundle](self, "_resetForNewEffectiveBundle");
  }

}

- (NSString)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  CLLocationManager *clLocationManager;
  NSString *v7;
  NSString *effectiveBundleIdentifier;
  int v9;
  MNCoreLocationProvider *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  CLLocationManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clLocationManager = self->_clLocationManager;
    v9 = 134218499;
    v10 = self;
    v11 = 2113;
    v12 = v4;
    v13 = 2113;
    v14 = clLocationManager;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider setEffectiveBundleIdentifier: %{private}@ | CL: %{private}@", (uint8_t *)&v9, 0x20u);
  }

  if (!-[NSString isEqualToString:](self->_effectiveBundleIdentifier, "isEqualToString:", v4))
  {
    v7 = (NSString *)objc_msgSend(v4, "copy");
    effectiveBundleIdentifier = self->_effectiveBundleIdentifier;
    self->_effectiveBundleIdentifier = v7;

    if (self->_clLocationManager)
      -[MNCoreLocationProvider _resetForNewEffectiveBundle](self, "_resetForNewEffectiveBundle");
  }

}

- (BOOL)isAuthorized
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MNCoreLocationProvider_isAuthorized__block_invoke;
  v4[3] = &unk_1E61D1B10;
  v4[4] = self;
  v4[5] = &v5;
  MNRunSynchronouslyOnMainThread(v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__MNCoreLocationProvider_isAuthorized__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 8))
  {
    objc_msgSend((id)result, "_updateAuthorizationStatus");
    result = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(_DWORD *)(result + 40) - 3) < 2;
  return result;
}

- (int)headingOrientation
{
  return -[CLLocationManager headingOrientation](self->_clLocationManager, "headingOrientation");
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  int v7;
  MNCoreLocationProvider *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider setHeadingOrientation: %d", (uint8_t *)&v7, 0x12u);
  }

  -[MNCoreLocationProvider _clLocationManager](self, "_clLocationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeadingOrientation:", v3);

}

- (double)expectedGpsUpdateInterval
{
  double result;

  -[CLLocationManager expectedGpsUpdateInterval](self->_clLocationManager, "expectedGpsUpdateInterval");
  return result;
}

- (BOOL)isTracePlayer
{
  return 0;
}

- (unint64_t)traceVersion
{
  return 0;
}

- (double)timeScale
{
  return 1.0;
}

- (void)startMonitoringForRegion:(id)a3
{
  -[CLLocationManager startMonitoringForRegion:](self->_clLocationManager, "startMonitoringForRegion:", a3);
}

- (void)stopMonitoringForRegion:(id)a3
{
  -[CLLocationManager stopMonitoringForRegion:](self->_clLocationManager, "stopMonitoringForRegion:", a3);
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  MNLocationProviderDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "locationProvider:didUpdateHeading:", self, v6);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138477827;
    v11 = v8;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "%{private}@", (uint8_t *)&v10, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "locationProvider:didReceiveError:", self, v6);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *v4;
  int authorizationStatus;
  id WeakRetained;
  id v7;
  int v8;
  MNCoreLocationProvider *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  self->_authorizationStatus = objc_msgSend(a3, "authorizationStatus");
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    authorizationStatus = self->_authorizationStatus;
    v8 = 134218240;
    v9 = self;
    v10 = 1024;
    v11 = authorizationStatus;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "%p MNCoreLocationProvider locationManagerDidChangeAuthorization: %d", (uint8_t *)&v8, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "locationProviderDidChangeAuthorizationStatus:", self);

  LODWORD(WeakRetained) = self->_coarseModeEnabled;
  -[MNCoreLocationProvider _updateCoarseModeEnabled](self, "_updateCoarseModeEnabled");
  if (self->_coarseModeEnabled != (_DWORD)WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "locationProvider:didChangeCoarseMode:", self, self->_coarseModeEnabled);

  }
}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "locationProviderShouldPauseLocationUpdates:", self);

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "locationProviderDidPauseLocationUpdates:", self);

  }
  else
  {
    objc_msgSend(v7, "startUpdatingLocation");
  }

}

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "locationProviderDidResumeLocationUpdates:", self);

}

- (void)locationManager:(id)a3 didUpdateVehicleSpeed:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  double v11;
  double v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "speed");
    v8 = v7;
    objc_msgSend(v5, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218243;
    v15 = v8;
    v16 = 2113;
    v17 = v9;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "Got vehicle speed: %g | %{private}@", (uint8_t *)&v14, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v5, "speed");
  v12 = v11;
  objc_msgSend(v5, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "locationProvider:didUpdateVehicleSpeed:timestamp:", self, v13, v12);

}

- (void)locationManager:(id)a3 didUpdateVehicleHeading:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  double v11;
  double v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "trueHeading");
    v8 = v7;
    objc_msgSend(v5, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218243;
    v15 = v8;
    v16 = 2113;
    v17 = v9;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "Got vehicle heading: %g | %{private}@", (uint8_t *)&v14, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v5, "trueHeading");
  v12 = v11;
  objc_msgSend(v5, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "locationProvider:didUpdateVehicleHeading:timestamp:", self, v13, v12);

}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "locationProvider:didEnterRegion:", self, v8);

  }
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "locationProvider:didExitRegion:", self, v8);

  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "locationProvider:monitoringDidFailForRegion:withError:", self, v11, v7);

  }
}

- (MNLocationProviderDelegate)delegate
{
  return (MNLocationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_debug_deinitRunLoop);
  objc_destroyWeak((id *)&self->_debug_initRunLoop);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveBundle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clParameters, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
}

@end
