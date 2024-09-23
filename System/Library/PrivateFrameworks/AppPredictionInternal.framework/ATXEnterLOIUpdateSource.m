@implementation ATXEnterLOIUpdateSource

- (ATXEnterLOIUpdateSource)init
{
  void *v3;
  id v4;
  void *v5;
  ATXEnterLOIUpdateSource *v6;

  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v6 = -[ATXEnterLOIUpdateSource initWithLocationManager:userDefaults:](self, "initWithLocationManager:userDefaults:", v3, v5);

  return v6;
}

- (ATXEnterLOIUpdateSource)initWithLocationManager:(id)a3 userDefaults:(id)a4
{
  id v7;
  id v8;
  ATXEnterLOIUpdateSource *v9;
  ATXEnterLOIUpdateSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXEnterLOIUpdateSource;
  v9 = -[ATXEnterLOIUpdateSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationManager, a3);
    objc_storeStrong((id *)&v10->_userDefaults, a4);
  }
  -[ATXEnterLOIUpdateSource _start](v10, "_start");

  return v10;
}

- (void)_start
{
  -[ATXEnterLOIUpdateSource updateMonitoredRegionsIfNecessaryWithReply:](self, "updateMonitoredRegionsIfNecessaryWithReply:", 0);
  -[ATXEnterLOIUpdateSource _registerNotificationListeners](self, "_registerNotificationListeners");
}

- (void)_registerNotificationListeners
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_locationManagerDidEnterRegion_, *MEMORY[0x1E0D80E88], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_locationManagerDidExitRegion_, *MEMORY[0x1E0D80E90], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D80E88], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D80E90], 0);

  v4.receiver = self;
  v4.super_class = (Class)ATXEnterLOIUpdateSource;
  -[ATXEnterLOIUpdateSource dealloc](&v4, sel_dealloc);
}

- (void)updateMonitoredRegionsIfNecessaryWithReply:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  double v7;
  double v8;
  ATXLocationManagerProtocol *locationManager;
  _QWORD v10[5];
  void (**v11)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ATXEnterLOIUpdateSourceLastRefreshDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[ATXEnterLOIUpdateSource now](self, "now"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "timeIntervalSinceDate:", v6),
        v8 = v7,
        v6,
        v8 <= 86400.0))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    locationManager = self->_locationManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__ATXEnterLOIUpdateSource_updateMonitoredRegionsIfNecessaryWithReply___block_invoke;
    v10[3] = &unk_1E82E5F98;
    v10[4] = self;
    v11 = v4;
    -[ATXLocationManagerProtocol fetchAllLocationsOfInterest:](locationManager, "fetchAllLocationsOfInterest:", v10);

  }
}

void __70__ATXEnterLOIUpdateSource_updateMonitoredRegionsIfNecessaryWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  for (i = 0; i != 4; ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "_regionIdentifierForLocationOfInterestType:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stopMonitoringRegionWithIdentifier:", v5);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v8; ++j)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "_regionIdentifierForLocationOfInterestType:", objc_msgSend(v11, "type", (_QWORD)v19));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc(MEMORY[0x1E0C9E368]);
        objc_msgSend(v11, "coordinate");
        v14 = (void *)objc_msgSend(v13, "initWithCenter:radius:identifier:", v12);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "beginMonitoringRegion:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = *(_QWORD **)(a1 + 32);
  v16 = (void *)v15[3];
  objc_msgSend(v15, "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("ATXEnterLOIUpdateSourceLastRefreshDate"));

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

- (void)locationManagerDidEnterRegion:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0D80E98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v8;
    v12 = 2080;
    v13 = "-[ATXEnterLOIUpdateSource locationManagerDidEnterRegion:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - %s: did enter region %@", (uint8_t *)&v10, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tryUpdatePredictionsImmediatelyWithReason:", 8);

}

- (void)locationManagerDidExitRegion:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0D80E98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v8;
    v12 = 2080;
    v13 = "-[ATXEnterLOIUpdateSource locationManagerDidExitRegion:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - %s: did enter region %@", (uint8_t *)&v10, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tryUpdatePredictionsDefaultIntervalWithReason:", 9);

}

- (id)_regionIdentifierForLocationOfInterestType:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D80DC8], "stringForLOIType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.duetexpertd.%@"), v3);

  return v4;
}

- (NSDate)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (NSDate *)(id)objc_opt_new();
}

- (ATXUpdatePredictionsDelegate)delegate
{
  return (ATXUpdatePredictionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ATXLocationManagerProtocol)locationManager
{
  return self->_locationManager;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
