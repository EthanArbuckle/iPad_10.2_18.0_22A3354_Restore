@implementation GEOCountryConfiguration

+ (GEOCountryConfiguration)sharedConfiguration
{
  if (qword_1ECDBBBD0 != -1)
    dispatch_once(&qword_1ECDBBBD0, &__block_literal_global_42);
  return (GEOCountryConfiguration *)(id)qword_1ECDBBBC8;
}

- (id)countryCodeWithSource:(unsigned int *)a3 updatedAtTime:(id *)a4
{
  uint64_t *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  geo_assert_not_isolated();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__17;
  v18 = __Block_byref_object_dispose__17;
  v19 = 0;
  geo_isolate_sync();
  v6 = v15;
  if (a3)
  {
    v7 = v15[5];
    if (v7)
      v8 = *(_DWORD *)(v7 + 8);
    else
      v8 = 1;
    *a3 = v8;
  }
  if (a4)
  {
    v9 = v6[5];
    if (v9)
    {
      v10 = *(id *)(v9 + 24);
      v6 = v15;
    }
    else
    {
      v10 = 0;
    }
    *a4 = v10;
  }
  v11 = (_QWORD *)v6[5];
  if (v11)
    v11 = (_QWORD *)v11[2];
  v12 = v11;
  _Block_object_dispose(&v14, 8);

  return v12;
}

- (NSString)countryCode
{
  return (NSString *)-[GEOCountryConfiguration countryCodeWithSource:updatedAtTime:](self, "countryCodeWithSource:updatedAtTime:", 0, 0);
}

void __46__GEOCountryConfiguration_sharedConfiguration__block_invoke()
{
  GEOCountryConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(GEOCountryConfiguration);
  v1 = (void *)qword_1ECDBBBC8;
  qword_1ECDBBBC8 = (uint64_t)v0;

}

- (GEOCountryConfiguration)init
{
  GEOCountryConfiguration *v2;
  uint64_t v3;
  geo_isolater *isolater;
  uint64_t v5;
  geo_isolater *currentCountrySupportsNavigationIsolater;
  void *v7;
  _GEOCountryConfigurationLocalProxy *v8;
  void *global_workloop;
  uint64_t v10;
  _GEOCountryConfigurationServerProxy *serverProxy;
  _GEOCountryConfigurationRemoteProxy *v12;
  void *v13;
  uint64_t v14;
  _GEOCountryConfigurationServerProxy *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)GEOCountryConfiguration;
  v2 = -[GEOCountryConfiguration init](&v19, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    v5 = geo_isolater_create();
    currentCountrySupportsNavigationIsolater = v2->_currentCountrySupportsNavigationIsolater;
    v2->_currentCountrySupportsNavigationIsolater = (geo_isolater *)v5;

    if ((_MergedGlobals_204 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x18D764E2C]();
      if (byte_1ECDBBBC1)
      {
        v8 = [_GEOCountryConfigurationLocalProxy alloc];
        global_workloop = (void *)geo_get_global_workloop();
        v10 = -[_GEOCountryConfigurationLocalProxy initWithDelegate:delegateQueue:](v8, "initWithDelegate:delegateQueue:", v2, global_workloop);
        serverProxy = v2->_serverProxy;
        v2->_serverProxy = (_GEOCountryConfigurationServerProxy *)v10;

        -[GEOCountryConfiguration updateCountryConfiguration:](v2, "updateCountryConfiguration:", 0);
      }
      else
      {
        v12 = [_GEOCountryConfigurationRemoteProxy alloc];
        v13 = (void *)geo_get_global_workloop();
        v14 = -[_GEOCountryConfigurationRemoteProxy initWithDelegate:delegateQueue:](v12, "initWithDelegate:delegateQueue:", v2, v13);
        v15 = v2->_serverProxy;
        v2->_serverProxy = (_GEOCountryConfigurationServerProxy *)v14;

      }
      objc_autoreleasePoolPop(v7);
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)geo_get_global_workloop();
      objc_msgSend(v16, "addTileGroupObserver:queue:", v2, v17);

    }
  }
  return v2;
}

- (id)defaultForKey:(id)a3 defaultValue:(id)a4
{
  return -[GEOCountryConfiguration defaultForKey:defaultValue:sourcePtr:](self, "defaultForKey:defaultValue:sourcePtr:", a3, a4, 0);
}

- (id)defaultForKey:(id)a3 defaultValue:(id)a4 sourcePtr:(int64_t *)a5
{
  return -[GEOCountryConfiguration defaultForKey:defaultValue:sourcePtr:decoder:](self, "defaultForKey:defaultValue:sourcePtr:decoder:", a3, a4, a5, 0);
}

uint64_t __50__GEOCountryConfiguration__resetSupportedFeatures__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 57) = 0;
  return result;
}

void __60__GEOCountryConfiguration_serverProxy_countryCodeDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  -[GEOCountryConfiguration _countryCodeOnIsolationQueue](*(_QWORD **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__GEOCountryConfiguration_countryCodeWithSource_updatedAtTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[GEOCountryConfiguration _countryCodeOnIsolationQueue](*(_QWORD **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (_QWORD)_countryCodeOnIsolationQueue
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      _GEOReadStoredCountryCodeWithFallback();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[2];
      v1[2] = v3;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (void)serverProxy:(id)a3 countryCodeDidChange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD block[11];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__17;
  v14[4] = __Block_byref_object_dispose__17;
  v15 = 0;
  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v17 = v7;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Country code changed: %{private}@", buf, 0xCu);
  }

  -[GEOCountryConfiguration _resetSupportedFeatures]((uint64_t)self);
  v9 = MEMORY[0x1E0C809B0];
  block[6] = MEMORY[0x1E0C809B0];
  block[7] = 3221225472;
  block[8] = __60__GEOCountryConfiguration_serverProxy_countryCodeDidChange___block_invoke;
  block[9] = &unk_1E1BFF8F8;
  block[10] = self;
  v10 = v7;
  v12 = v10;
  v13 = v14;
  geo_isolate_sync();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __60__GEOCountryConfiguration_serverProxy_countryCodeDidChange___block_invoke_2;
  block[3] = &unk_1E1C00760;
  block[4] = self;
  block[5] = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v14, 8);
}

- (uint64_t)_resetSupportedFeatures
{
  if (result)
  {
    geo_assert_not_isolated();
    geo_isolate_sync_data();
    geo_assert_not_isolated();
    return geo_isolate_sync_data();
  }
  return result;
}

void __60__GEOCountryConfiguration_serverProxy_countryCodeDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    v12[0] = CFSTR("DeviceCountryCode");
    v3 = *(id *)(v2 + 16);
    v13[0] = v3;
    v12[1] = CFSTR("DeviceCountryCodeSource");
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v4)
      v5 = *(unsigned int *)(v4 + 8);
    else
      v5 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    v12[2] = CFSTR("DeviceCountryCodeLastUpdated");
    v7 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v7)
      v7 = (_QWORD *)v7[3];
    v13[2] = v7;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = v7;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("GEOCountryConfigurationCountryCodeDidChangeNotification"), *(_QWORD *)(a1 + 32), v10);

}

void __50__GEOCountryConfiguration__resetSupportedFeatures__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
}

- (void)updateCountryConfiguration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__GEOCountryConfiguration_updateCountryConfiguration___block_invoke;
  v6[3] = &unk_1E1C03638;
  v7 = v4;
  v5 = v4;
  -[GEOCountryConfiguration updateCountryConfiguration:callbackQueue:](self, "updateCountryConfiguration:callbackQueue:", v6, MEMORY[0x1E0C80D38]);

}

- (void)updateCountryConfiguration:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  atomic_flag *p_isUpdating;
  unsigned __int8 v12;
  _GEOCountryConfigurationServerProxy *serverProxy;
  void *global_workloop;
  _QWORD v15[10];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[5] = MEMORY[0x1E0C809B0];
  v15[6] = 3221225472;
  v15[7] = __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke;
  v15[8] = &unk_1E1C00BB8;
  v15[9] = self;
  v9 = v6;
  v17 = v9;
  v10 = v7;
  v16 = v10;
  geo_isolate_sync_data();
  p_isUpdating = &self->_isUpdating;
  do
    v12 = __ldaxr((unsigned __int8 *)p_isUpdating);
  while (__stlxr(1u, (unsigned __int8 *)p_isUpdating));
  if ((v12 & 1) == 0)
  {
    serverProxy = self->_serverProxy;
    global_workloop = (void *)geo_get_global_workloop();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_2;
    v15[3] = &unk_1E1C00E10;
    v15[4] = self;
    -[_GEOCountryConfigurationServerProxy updateCountryCodeWithCallbackQueue:callback:](serverProxy, "updateCountryCodeWithCallbackQueue:callback:", global_workloop, v15);

  }
}

- (double)urlAuthenticationTimeToLive
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  geo_assert_not_isolated();
  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)updateProvidersForCurrentCountry
{
  -[GEOCountryConfiguration updateCountryConfiguration:](self, "updateCountryConfiguration:", 0);
}

- (id)defaultForKey:(id)a3 defaultValue:(id)a4 sourcePtr:(int64_t *)a5 decoder:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[GEOCountryConfiguration countryCode](self, "countryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCountryConfiguration _defaultForKey:inCountry:defaultValue:sourcePtr:decoder:]((uint64_t)self, v12, v13, v11, (unint64_t *)a5, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_defaultForKey:(void *)a3 inCountry:(void *)a4 defaultValue:(unint64_t *)a5 sourcePtr:(void *)a6 decoder:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v26;

  if (a1)
  {
    v10 = a6;
    v11 = a4;
    v12 = a2;
    v13 = a3;
    v14 = (void (**)(id, uint64_t))v10;
    if (v13)
    {
      v26 = 0;
      GEOGetDecodedDefaultWithSource(CFSTR("CountryProviders"), 0, &v26, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "objectForKey:", v12);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v14 && v17)
      {
        v14[2](v14, v17);
        v19 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v19;
      }
      if (v18)
        v20 = v26;
      else
        v20 = 0;

    }
    else
    {
      v20 = 0;
      v18 = 0;
    }

    v26 = 0;
    GEOGetDecodedDefaultWithSource(v12, v11, &v26, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v18;
    v23 = v22;
    if (!v22)
      goto LABEL_15;
    if (v20 > 9 || ((1 << v20) & 0x218) == 0)
    {
      v24 = v22;
      if (!a5)
        goto LABEL_18;
      goto LABEL_17;
    }
    v24 = v22;
    if (v26 - 1 <= 1)
    {
LABEL_15:
      v24 = v21;

      v20 = v26;
    }
    if (!a5)
    {
LABEL_18:

      return v24;
    }
LABEL_17:
    *a5 = v20;
    goto LABEL_18;
  }
  return 0;
}

void __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _GEOCountryConfigurationUpdateHandler *v5;

  if (!*(_QWORD *)(a1[4] + 32))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

  }
  if (a1[6])
  {
    v5 = objc_alloc_init(_GEOCountryConfigurationUpdateHandler);
    -[_GEOCountryConfigurationUpdateHandler setCallback:](v5, "setCallback:", a1[6]);
    -[_GEOCountryConfigurationUpdateHandler setCallbackQueue:](v5, "setCallbackQueue:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 32), "addObject:", v5);

  }
}

void __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSObject *global_workloop;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__17;
  v32 = __Block_byref_object_dispose__17;
  v33 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_59;
  v25 = &unk_1E1C00760;
  v26 = v4;
  v27 = &v28;
  geo_isolate_sync_data();
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)v29[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "callback");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (!v11)
        {
          objc_msgSend(v9, "callbackQueue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
            global_workloop = v12;
          else
            global_workloop = geo_get_global_workloop();
          v15 = global_workloop;

          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_2_60;
          v16[3] = &unk_1E1C00738;
          v16[4] = v9;
          v17 = v3;
          dispatch_async(v15, v16);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v34, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v28, 8);
}

uint64_t __54__GEOCountryConfiguration_updateCountryConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

double __54__GEOCountryConfiguration_urlAuthenticationTimeToLive__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double result;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 72))
  {
    -[GEOCountryConfiguration _countryCodeOnIsolationQueue](*(_QWORD **)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = *(void **)(v3 + 16);
    else
      v5 = 0;
    -[GEOCountryConfiguration _defaultForKey:inCountry:defaultValue:sourcePtr:decoder:](v2, CFSTR("GEOURLAuthenticationTTL"), v5, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0x40B0680000000000;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = v7;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;

    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(double *)(v2 + 64);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)zilchPointsSupported
{
  return GEOConfigGetBOOL(GeoServicesConfig_ZilchSupported, (uint64_t)off_1EDF4CD78);
}

+ (void)disableServerConnection
{
  _MergedGlobals_204 = 1;
}

+ (void)setUseLocalProxy:(BOOL)a3
{
  byte_1ECDBBBC1 = a3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTileGroupObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)GEOCountryConfiguration;
  -[GEOCountryConfiguration dealloc](&v5, sel_dealloc);
}

uint64_t __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_59(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

void __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_2_60(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (BOOL)countryCode:(id)a3 supportsFeature:(int64_t)a4
{
  id v5;
  uint64_t v6;
  __int128 *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  char v21;
  BOOL v22;
  char BOOLForCountryCode;
  BOOL v24;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  _OWORD v29[2];
  uint64_t v30;
  const __CFString *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  const __CFString *v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  const __CFString *v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  const __CFString *v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  const __CFString *v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  const __CFString *v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  const __CFString *v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  geo_assert_not_isolated();
  v6 = 0;
  v27 = 1;
  v28 = (uint64_t *)CFSTR("supportedCountriesDirections.plist");
  v7 = &GEOConfigKey_InvalidArray;
  v29[0] = GeoServicesConfig_SupportsDirections;
  v29[1] = GEOConfigKey_InvalidArray;
  v30 = 2;
  v31 = CFSTR("supportedCountriesTraffic.plist");
  v32 = GeoServicesConfig_SupportsTraffic;
  v33 = GEOConfigKey_InvalidArray;
  v34 = 3;
  v35 = CFSTR("supportedCountriesCarIntegration.plist");
  v36 = GeoServicesConfig_SupportsCarIntegration;
  v37 = GEOConfigKey_InvalidArray;
  v38 = 4;
  v39 = CFSTR("supportedCountriesCommute.plist");
  v40 = GeoServicesConfig_SupportsCommute;
  v41 = GEOConfigKey_InvalidArray;
  v42 = 5;
  v43 = 0;
  v44 = GeoServicesConfig_SupportsMetroTurnByTurn;
  v45 = GEOConfigKey_InvalidArray;
  v46 = 6;
  v47 = CFSTR("supportedCountriesEVDirections.plist");
  v48 = GeoServicesConfig_SupportsElectricVehicleRouting;
  v49 = GEOConfigKey_InvalidArray;
  v50 = 7;
  v51 = CFSTR("supportedCountriesAvoidStairs.plist");
  v52 = GeoServicesConfig_SupportsAvoidStairs;
  v53 = GEOConfigKey_InvalidArray;
  v54 = 8;
  v55 = 0;
  v56 = GeoServicesConfig_SupportsCustomRouteCreation;
  v57 = GeoServicesConfig_SupportedCountriesCustomRouteCreation;
  v58 = 9;
  v59 = CFSTR("supportedCountriesTopographicMap.plist");
  v62 = 10;
  v63 = CFSTR("supportedCountriesCuratedRoutes.plist");
  v60 = GeoServicesConfig_SupportsTopographicMap;
  v61 = GeoServicesConfig_SupportedCountriesTopographicMap;
  v64 = GeoServicesConfig_SupportsCuratedRoutes;
  v65 = GeoServicesConfig_SupportedCountriesCuratedRoutes;
  v8 = &GEOConfigKey_InvalidBOOL;
  while (*(uint64_t *)((char *)&v27 + v6 * 16) != a4)
  {
    v6 += 3;
    if (v6 == 30)
    {
      v9 = 0;
      v10 = (uint64_t *)&GEOConfigKey_InvalidArray + 1;
      v11 = &qword_1EDF51A18;
      goto LABEL_6;
    }
  }
  v12 = (char *)&v27 + v6 * 16;
  v9 = *(uint64_t *)((char *)&v27 + v6 * 16 + 8);
  v8 = (uint64_t *)&v29[v6];
  v11 = (uint64_t *)&v29[v6] + 1;
  v7 = (__int128 *)(v12 + 32);
  v10 = (uint64_t *)(v12 + 40);
LABEL_6:
  v13 = *v10;
  v14 = *(_QWORD *)v7;
  v15 = *v11;
  v16 = *v8;
  v27 = 0;
  v28 = &v27;
  *(_QWORD *)&v29[0] = 0x2020000000;
  BYTE8(v29[0]) = 0;
  if ((_DWORD)v16)
    v17 = v15 == 0;
  else
    v17 = 1;
  if (v17)
  {
    v18 = v14;
  }
  else if (_GEOConfigHasValue(v16, v15) || ((v18 = v14, (_DWORD)v14) ? (v22 = v13 == 0) : (v22 = 1), v22))
  {
    BOOLForCountryCode = GEOConfigGetBOOLForCountryCode(v16, v15, v5);
    *((_BYTE *)v28 + 24) = BOOLForCountryCode;
    if (!v9)
      goto LABEL_27;
LABEL_26:
    v26 = v5;
    geo_isolate_sync();

    goto LABEL_27;
  }
  if (v18)
    v19 = v13 == 0;
  else
    v19 = 1;
  if (!v19)
  {
    _getValue(v14, v13, 1, 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", v5);
    *((_BYTE *)v28 + 24) = v21;

  }
  if (v9)
    goto LABEL_26;
LABEL_27:
  v24 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);

  return v24;
}

void __55__GEOCountryConfiguration_countryCode_supportsFeature___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
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
  id v17;

  v2 = *(void **)(a1[4] + 40);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = a1[4];
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(a1[4] + 40);
  }
  objc_msgSend(v2, "objectForKey:", a1[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForResourceWithName:fallbackBundle:", a1[8], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithContentsOfURL:error:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *(void **)(a1[4] + 40);
      if (v11)
      {
LABEL_9:
        objc_msgSend(v12, "setObject:forKey:", v11, a1[8]);

        goto LABEL_10;
      }
    }
    else
    {
      v12 = *(void **)(a1[4] + 40);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[8]);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("SupportedCountries"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v13, "containsObject:", a1[5]);
  }
  else
  {
    objc_msgSend(v17, "objectForKey:", CFSTR("UnsupportedCountries"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v15, "containsObject:", a1[5]) ^ 1;

  }
}

- (BOOL)currentCountrySupportsFeature:(int64_t)a3
{
  void *v5;

  -[GEOCountryConfiguration countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[GEOCountryConfiguration countryCode:supportsFeature:](self, "countryCode:supportsFeature:", v5, a3);

  return a3;
}

- (BOOL)currentCountrySupportsNavigation
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[GEOCountryConfiguration _currentCountrySupportsNavigation](self, "_currentCountrySupportsNavigation");
  if (v2)
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsNavigation");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)_currentCountrySupportsNavigation
{
  char currentCountrySupportsNavigation;
  geo_isolater *v5;

  v5 = self->_currentCountrySupportsNavigationIsolater;
  _geo_isolate_lock_data();
  if (self->_determinedCurrentCountrySupportsNavigation)
  {
    currentCountrySupportsNavigation = self->_currentCountrySupportsNavigation;
  }
  else
  {
    currentCountrySupportsNavigation = GEOConfigGetBOOL(GeoServicesConfig_CanNavigate, (uint64_t)off_1EDF4CD88);
    self->_currentCountrySupportsNavigation = currentCountrySupportsNavigation;
    self->_determinedCurrentCountrySupportsNavigation = 1;
  }
  _geo_isolate_unlock();

  return currentCountrySupportsNavigation;
}

- (BOOL)currentCountrySupportsDirections
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 1);
}

- (BOOL)currentCountrySupportsTraffic
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 2);
}

- (BOOL)currentCountrySupportsRouteGenius
{
  _BOOL4 v3;

  v3 = -[GEOCountryConfiguration currentCountrySupportsTraffic](self, "currentCountrySupportsTraffic");
  if (v3)
    LOBYTE(v3) = -[GEOCountryConfiguration currentCountrySupportsNavigation](self, "currentCountrySupportsNavigation");
  return v3;
}

- (BOOL)currentCountrySupportsCarIntegration
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 3);
}

- (BOOL)currentCountrySupportsCommute
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 4);
}

- (BOOL)currentCountrySupportsElectricVehicleRouting
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 6);
}

- (BOOL)currentCountrySupportsAvoidStairs
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 7);
}

- (BOOL)currentCountrySupportsCustomRouteCreation
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 8);
}

- (BOOL)currentCountrySupportsTopographicMap
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 9);
}

- (BOOL)currentCountrySupportsCuratedRoutes
{
  return -[GEOCountryConfiguration currentCountrySupportsFeature:](self, "currentCountrySupportsFeature:", 10);
}

- (id)defaultForKey:(id)a3 defaultValue:(id)a4 decoder:(id)a5
{
  return -[GEOCountryConfiguration defaultForKey:defaultValue:sourcePtr:decoder:](self, "defaultForKey:defaultValue:sourcePtr:decoder:", a3, a4, 0, a5);
}

- (void)serverProxyProvidersDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Providers changed", buf, 2u);
  }

  -[GEOCountryConfiguration _resetSupportedFeatures]((uint64_t)self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__GEOCountryConfiguration_serverProxyProvidersDidChange___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57__GEOCountryConfiguration_serverProxyProvidersDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("GEOCountryConfigurationProvidersDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_currentCountrySupportsNavigationIsolater, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_updateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_countryCodeInfo, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

@end
