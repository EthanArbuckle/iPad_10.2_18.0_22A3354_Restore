@implementation _GEOCountryConfigurationLocalProxy

- (void)updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82___GEOCountryConfigurationLocalProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke;
  block[3] = &unk_1E1BFFC90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *scheduledUpdateTimer;
  OS_dispatch_source *v9;
  BOOL v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  scheduledUpdateTimer = self->_scheduledUpdateTimer;
  if (scheduledUpdateTimer)
  {
    dispatch_source_cancel(scheduledUpdateTimer);
    v9 = self->_scheduledUpdateTimer;
    self->_scheduledUpdateTimer = 0;

  }
  v19 = 0;
  v10 = -[_GEOCountryConfigurationLocalProxy _checkThrottlerOrScheduleUpdate:](self, "_checkThrottlerOrScheduleUpdate:", &v19);
  v11 = v19;
  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_2;
    v13[3] = &unk_1E1C061D0;
    v13[4] = self;
    v15 = v7;
    v14 = v6;
    -[_GEOCountryConfigurationLocalProxy _determineCurrentCountryCode:](self, "_determineCurrentCountryCode:", v13);

    v12 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke;
    block[3] = &unk_1E1BFF970;
    v18 = v7;
    v17 = v11;
    dispatch_async(v6, block);

    v12 = v18;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_determineCurrentCountryCode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  CoreTelephonyClient *telephonyClient;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *queue;
  id v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  void *v20;
  id v21[7];
  uint8_t v22[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_24;
  if (qword_1ECDBBBD8 != -1)
    dispatch_once(&qword_1ECDBBBD8, &__block_literal_global_226);
  if (byte_1ECDBBBC2 && self->_telephonyClient && self->_telephonyServerConnection)
  {
    *(_QWORD *)v22 = 0;
    v23 = v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__17;
    v26 = __Block_byref_object_dispose__17;
    v27 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v21[1] = (id)MEMORY[0x1E0C809B0];
    v21[2] = (id)3221225472;
    v21[3] = __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke_2;
    v21[4] = &unk_1E1BFF920;
    v21[5] = self;
    v21[6] = v22;
    geo_isolate_sync();
    v6 = *((_QWORD *)v23 + 5);
    if (v6)
    {
      telephonyClient = self->_telephonyClient;
      v21[0] = 0;
      v8 = (void *)-[CoreTelephonyClient copyMobileCountryCode:error:](telephonyClient, "copyMobileCountryCode:error:", v6, v21);
      v9 = v21[0];
      if (v8)
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("000")) & 1) == 0)
        {
          v20 = 0;
          if (!geo_CTServerConnectionCopyISOForMCC((uint64_t)self->_telephonyServerConnection, (uint64_t)v8, (uint64_t)&v20))
          {
            v10 = v20;
            if (v20)
            {
              GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
              v11 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v10, "uppercaseString");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138478083;
                v29 = v12;
                v30 = 2113;
                v31 = v8;
                _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Found country code '%{private}@' for current MCC (%{private}@)", buf, 0x16u);

              }
              queue = self->_queue;
              v17[0] = v5;
              v17[1] = 3221225472;
              v17[2] = __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke_229;
              v17[3] = &unk_1E1BFF970;
              v18 = v10;
              v19 = v4;
              v14 = v10;
              dispatch_async(queue, v17);

              _Block_object_dispose(v22, 8);
              goto LABEL_24;
            }
          }
        }
      }
      else
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v9;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "No active MCC found: %{public}@", buf, 0xCu);
        }

      }
    }
    else
    {
      v9 = 0;
    }
    _Block_object_dispose(v22, 8);

  }
  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "Pinging server to determine current country code", v22, 2u);
  }

  -[_GEOCountryConfigurationLocalProxy _determineGeoIPCountryCode:](self, "_determineGeoIPCountryCode:", v4);
LABEL_24:

}

- (BOOL)_checkThrottlerOrScheduleUpdate:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v12;
  double v13;
  uint8_t buf[4];
  double v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEODataRequestThrottler sharedThrottler](GEODataRequestThrottler, "sharedThrottler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowRequest:forClient:throttlerToken:error:", 1, v5, 0, a3);

  if ((v7 & 1) == 0)
  {
    v13 = 0.0;
    v12 = 0;
    +[GEODataRequestThrottler sharedThrottler](GEODataRequestThrottler, "sharedThrottler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getInfoForRequest:client:timeUntilNextReset:availableRequestCount:", 1, v5, &v13, &v12);

    if (v13 > 0.0)
      -[_GEOCountryConfigurationLocalProxy _scheduleUpdate:](self, "_scheduleUpdate:", v13);
    GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *a3;
      *(_DWORD *)buf = 134218242;
      v15 = v13;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Refusing to update country code again, will try again in %f seconds: %{public}@", buf, 0x16u);
    }

  }
  return v7;
}

- (_GEOCountryConfigurationLocalProxy)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  _GEOCountryConfigurationLocalProxy *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  geo_isolater *currentDataContextIsolation;
  NSObject *v13;
  _GEOCountryConfigurationLocalProxy *v14;
  _GEOCountryConfigurationLocalProxy *v15;
  _GEOCountryConfigurationLocalProxy *v17;
  _QWORD block[4];
  _GEOCountryConfigurationLocalProxy *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_GEOCountryConfigurationLocalProxy;
  v8 = -[_GEOCountryConfigurationLocalProxy init](&v20, sel_init);
  if (v8)
  {
    v9 = geo_dispatch_queue_create();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_delegateQueue, a4);
    v11 = geo_isolater_create();
    currentDataContextIsolation = v8->_currentDataContextIsolation;
    v8->_currentDataContextIsolation = (geo_isolater *)v11;

    v13 = v8->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke;
    block[3] = &unk_1E1BFF6F8;
    v14 = v8;
    v19 = v14;
    dispatch_async(v13, block);
    v17 = v14;
    geo_dispatch_async_qos();
    v15 = v17;

  }
  return v8;
}

- (void)dealloc
{
  NSObject *scheduledUpdateTimer;
  __CTServerConnection *telephonyServerConnection;
  void *v5;
  objc_super v6;

  GEOConfigRemoveBlockListener(self->_countryCodeOverrideChangeListener);
  scheduledUpdateTimer = self->_scheduledUpdateTimer;
  if (scheduledUpdateTimer)
    dispatch_source_cancel(scheduledUpdateTimer);
  telephonyServerConnection = self->_telephonyServerConnection;
  if (telephonyServerConnection)
    CFRelease(telephonyServerConnection);
  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeNetworkReachableObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)_GEOCountryConfigurationLocalProxy;
  -[_GEOCountryConfigurationLocalProxy dealloc](&v6, sel_dealloc);
}

- (void)servingNetworkChanged:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Cell network changed. Scheduling country code update", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___GEOCountryConfigurationLocalProxy_servingNetworkChanged___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)currentDataSimChanged:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  v3 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Current data sim changed", buf, 2u);
  }

  v5 = v3;
  geo_isolate_sync();

}

- (void)_reachabilityChanged:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v10 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Reachability changed: %{private}@", buf, 0xCu);
  }

  if (GEOConfigGetBOOL(GeoServicesConfig_CountryConfigurationRefreshOnReachability, (uint64_t)off_1EDF4D058))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59___GEOCountryConfigurationLocalProxy__reachabilityChanged___block_invoke;
    v7[3] = &unk_1E1C00738;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)_scheduleUpdate:(double)a3
{
  NSObject *scheduledUpdateTimer;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;

  scheduledUpdateTimer = self->_scheduledUpdateTimer;
  if (scheduledUpdateTimer)
  {
    dispatch_source_cancel(scheduledUpdateTimer);
    v5 = self->_scheduledUpdateTimer;
    self->_scheduledUpdateTimer = 0;

  }
  v6 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue();
  v7 = self->_scheduledUpdateTimer;
  self->_scheduledUpdateTimer = v6;

  dispatch_activate((dispatch_object_t)self->_scheduledUpdateTimer);
}

- (void)_determineGeoIPCountryCode:(id)a3
{
  id v4;
  GEOCancellable **p_geoIPLookupTask;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOApplicationAuditToken *v10;
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  p_geoIPLookupTask = &self->_geoIPLookupTask;
  -[GEOCancellable cancel](self->_geoIPLookupTask, "cancel");
  GEOGetURLWithSource(14, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestCounterTicketForType:auditToken:traits:", 1, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[GEOApplicationAuditToken initWithSecondaryIdentifier:]([GEOApplicationAuditToken alloc], "initWithSecondaryIdentifier:", CFSTR("com.apple.GeoServices.CountryCode"));
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__17;
  v22 = __Block_byref_object_dispose__17;
  v23 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65___GEOCountryConfigurationLocalProxy__determineGeoIPCountryCode___block_invoke;
  v15[3] = &unk_1E1C06180;
  v16 = v4;
  v17 = &v18;
  v15[4] = self;
  v12 = v4;
  +[GEODataURLSession asynchronousGetURL:kind:auditToken:requestCounterTicket:queue:completionHandler:](GEODataURLSession, "asynchronousGetURL:kind:auditToken:requestCounterTicket:queue:completionHandler:", v6, 1, v10, v9, queue, v15);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v19[5];
  v19[5] = v13;

  objc_storeStrong((id *)p_geoIPLookupTask, (id)v19[5]);
  _Block_object_dispose(&v18, 8);

}

- (void)_postNotificationsForOldInfo:(id)a3 newInfo:(id)a4
{
  _QWORD *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *delegateQueue;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  _BOOL4 v20;
  BOOL v21;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD block[5];
  id v27;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Country code changed. Informing delegate", buf, 2u);
  }

  v9 = MEMORY[0x1E0C809B0];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___GEOCountryConfigurationLocalProxy__postNotificationsForOldInfo_newInfo___block_invoke;
  block[3] = &unk_1E1C00738;
  block[4] = self;
  v11 = v7;
  v27 = v11;
  dispatch_async(delegateQueue, block);
  notify_post((const char *)GEOCountryConfigurationCountryCodeChangedDarwinNotification);
  _getValue(GeoServicesConfig_CountryProviders, (uint64_t)off_1EDF4CCA8, 1, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6)
    v14 = v6[2];
  else
    v14 = 0;
  objc_msgSend(v12, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v16 = v11[2];
  else
    v16 = 0;
  objc_msgSend(v13, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15)
    v19 = v17 == 0;
  else
    v19 = 1;
  if (v19)
  {
    v20 = v15 == 0;
    if (v17)
    {
      v21 = 1;
    }
    else
    {
      v20 = 0;
      v21 = v15 == 0;
    }
    if (v21 && !v20)
      goto LABEL_25;
  }
  else if ((objc_msgSend(v17, "isEqualToDictionary:", v15) & 1) != 0)
  {
    goto LABEL_25;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, "Country-specific networkDefaults changed. Informing delegate", buf, 2u);
  }

  v24 = self->_delegateQueue;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __75___GEOCountryConfigurationLocalProxy__postNotificationsForOldInfo_newInfo___block_invoke_248;
  v25[3] = &unk_1E1BFF6F8;
  v25[4] = self;
  dispatch_async(v24, v25);
  notify_post("com.apple.GeoServices.countryProvidersChanged");
LABEL_25:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoIPLookupTask, 0);
  objc_storeStrong((id *)&self->_currentDataContext, 0);
  objc_storeStrong((id *)&self->_currentDataContextIsolation, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong(&self->_countryCodeOverrideChangeListener, 0);
  objc_storeStrong((id *)&self->_scheduledUpdateTimer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
