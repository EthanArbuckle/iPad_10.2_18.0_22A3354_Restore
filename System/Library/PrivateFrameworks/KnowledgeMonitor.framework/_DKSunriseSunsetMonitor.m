@implementation _DKSunriseSunsetMonitor

+ (id)eventStream
{
  return CFSTR("SunriseSunset");
}

+ (id)entitlements
{
  return &unk_24DA70F70;
}

- (_DKSunriseSunsetMonitor)init
{
  id v2;
  os_log_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_source_t v8;
  void *v9;
  NSObject *v10;
  CFIndex v11;
  id v12;
  NSObject *v13;
  id *v14;
  NSObject *v15;
  id *v16;
  _QWORD *v17;
  CFStringRef (__cdecl *v18)(const void *);
  CFStringRef (__cdecl *v19)(const void *);
  const __SCPreferences *v20;
  const __SCPreferences *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD v41[4];
  id *v42;
  _QWORD v43[4];
  id *v44;
  _QWORD block[4];
  id *v46;
  _QWORD handler[4];
  id v48;
  objc_super v49;
  SCPreferencesContext context;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v49.receiver = self;
  v49.super_class = (Class)_DKSunriseSunsetMonitor;
  v2 = -[_DKMonitor init](&v49, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.duetknowledged", "sunrisesunsetmonitor");
    v4 = (void *)*((_QWORD *)v2 + 23);
    *((_QWORD *)v2 + 23) = v3;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleForKey:", CFSTR("sunriseSunsetUpdateIntervalSeconds"));
    if (*(double *)&v6 == 0.0)
      v6 = kUpdateIntervalSeconds;
    else
      kUpdateIntervalSeconds = v6;
    *((_QWORD *)v2 + 20) = (unint64_t)*(double *)&v6;
    objc_msgSend(v2, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v7);
    v9 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v8;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 19), 0, 1000000000 * *((_QWORD *)v2 + 20), 1000000000 * *((_QWORD *)v2 + 20) / 0xAuLL);
    v10 = *((_QWORD *)v2 + 19);
    v11 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __31___DKSunriseSunsetMonitor_init__block_invoke;
    handler[3] = &unk_24DA66D10;
    v12 = v2;
    v48 = v12;
    dispatch_source_set_event_handler(v10, handler);
    objc_msgSend(v12, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __31___DKSunriseSunsetMonitor_init__block_invoke_2;
    block[3] = &unk_24DA66D10;
    v14 = (id *)v12;
    v46 = v14;
    dispatch_sync(v13, block);

    objc_msgSend(v14[21], "setDesiredAccuracy:", *MEMORY[0x24BDBFB68]);
    *((_DWORD *)v14 + 37) = 0;
    objc_msgSend(v14, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v43[0] = v11;
    v43[1] = 3221225472;
    v43[2] = __31___DKSunriseSunsetMonitor_init__block_invoke_3;
    v43[3] = &unk_24DA66D10;
    v16 = v14;
    v44 = v16;
    v17 = v43;
    v18 = (CFStringRef (__cdecl *)(const void *))os_transaction_create();
    context.version = v11;
    context.info = (void *)3221225472;
    context.retain = (const void *(__cdecl *)(const void *))__cd_dispatch_async_capture_tx_block_invoke_9;
    context.release = (void (__cdecl *)(const void *))&unk_24DA66E28;
    context.copyDescription = v18;
    v51 = v17;
    v19 = v18;
    dispatch_async(v15, &context);

    v20 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("com.apple.duetknowledged.sunrisesunset.airplaneMode"), CFSTR("com.apple.radios.plist"));
    v16[24] = v20;
    if (v20)
    {
      context.version = 0;
      memset(&context.retain, 0, 24);
      context.info = v16;
      if (SCPreferencesSetCallback(v20, (SCPreferencesCallBack)scRadioPreferencesCallBackHandler_0, &context))
      {
        v21 = (const __SCPreferences *)v16[24];
        objc_msgSend(v16, "queue");
        v22 = objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = SCPreferencesSetDispatchQueue(v21, v22);

        if (!(_DWORD)v21)
        {
          v23 = *((_QWORD *)v2 + 23);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[_DKSunriseSunsetMonitor init].cold.3(v23);
        }
      }
      else
      {
        v32 = *((_QWORD *)v2 + 23);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[_DKSunriseSunsetMonitor init].cold.2(v32);
      }
    }
    else
    {
      v24 = *((_QWORD *)v2 + 23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_DKSunriseSunsetMonitor init].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    v33 = *((_QWORD *)v2 + 23);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)MEMORY[0x24BDD16E0];
      v35 = *((unsigned int *)v14 + 37);
      v36 = v33;
      objc_msgSend(v34, "numberWithInt:", v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(context.version) = 138412290;
      *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v37;
      _os_log_impl(&dword_219056000, v36, OS_LOG_TYPE_DEFAULT, "Location authorization status: %@", (uint8_t *)&context, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v16, sel_respondToTimeChange_, *MEMORY[0x24BDBCBB8], 0);

    LODWORD(context.version) = 0;
    objc_msgSend(v16, "queue");
    v39 = objc_claimAutoreleasedReturnValue();
    v41[0] = v11;
    v41[1] = 3221225472;
    v41[2] = __31___DKSunriseSunsetMonitor_init__block_invoke_25;
    v41[3] = &unk_24DA670E8;
    v42 = v16;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", (int *)&context, v39, v41);

  }
  return (_DKSunriseSunsetMonitor *)v2;
}

- (void)dealloc
{
  NSObject *updateTimer;
  OS_dispatch_source *v4;
  void *v5;
  __SCPreferences *radioPrefs;
  void *v7;
  objc_super v8;

  -[_DKSunriseSunsetMonitor deactivate](self, "deactivate");
  if (self->_enabled)
  {
    updateTimer = self->_updateTimer;
    if (updateTimer)
    {
      dispatch_source_cancel(updateTimer);
      dispatch_resume((dispatch_object_t)self->_updateTimer);
      self->_enabled = 0;
      v4 = self->_updateTimer;
      self->_updateTimer = 0;

    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  radioPrefs = self->_radioPrefs;
  if (radioPrefs)
    CFRelease(radioPrefs);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BDBCBB8], 0);

  v8.receiver = self;
  v8.super_class = (Class)_DKSunriseSunsetMonitor;
  -[_DKMonitor dealloc](&v8, sel_dealloc);
}

- (id)loadState
{
  return 0;
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKSunriseSunsetMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v3, sel_instantMonitorNeedsActivation))
  {
    self->_enabled = 1;
    dispatch_resume((dispatch_object_t)self->_updateTimer);
  }
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKSunriseSunsetMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v5, sel_instantMonitorNeedsDeactivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31___DKSunriseSunsetMonitor_stop__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

    -[_DKSunriseSunsetMonitor deactivate](self, "deactivate");
  }
}

- (id)contextDictionaryWithGeoAlmanac:(id)a3 authorizationStatus:(int)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
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
  void **v26;
  void **v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[8];
  _QWORD v43[8];
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a4 && a4 != 3)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "sunriseSunsetAvailabilityStatusKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v24;
    v47[0] = &unk_24DA710B0;
    v25 = (void *)MEMORY[0x24BDBCE70];
    v26 = (void **)v47;
    v27 = &v46;
LABEL_31:
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "sunriseSunsetAvailabilityStatusKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v24;
    v45 = &unk_24DA710C8;
    v25 = (void *)MEMORY[0x24BDBCE70];
    v26 = &v45;
    v27 = &v44;
    goto LABEL_31;
  }
  v7 = objc_msgSend(v5, "isDayLightForTime:", CFAbsoluteTimeGetCurrent());
  objc_msgSend(MEMORY[0x24BE1B180], "sunriseSunsetAvailabilityStatusKey");
  v8 = objc_claimAutoreleasedReturnValue();
  v42[0] = v8;
  v43[0] = &unk_24DA710E0;
  objc_msgSend(MEMORY[0x24BE1B180], "currentSunriseKey");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v40;
  objc_msgSend(v6, "sunrise");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v9;
  v43[1] = v9;
  objc_msgSend(MEMORY[0x24BE1B180], "currentSunsetKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v38;
  objc_msgSend(v6, "sunset");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v11;
  v43[2] = v11;
  objc_msgSend(MEMORY[0x24BE1B180], "nextSunriseKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v36;
  objc_msgSend(v6, "nextSunrise");
  v13 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v37 = v12;
  v39 = v10;
  v30 = (void *)v13;
  v43[3] = v13;
  objc_msgSend(MEMORY[0x24BE1B180], "nextSunsetKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v34;
  objc_msgSend(v6, "nextSunset");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v8;
  v29 = (void *)v14;
  v43[4] = v14;
  objc_msgSend(MEMORY[0x24BE1B180], "previousSunriseKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v33;
  objc_msgSend(v6, "previousSunrise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[5] = v17;
  objc_msgSend(MEMORY[0x24BE1B180], "previousSunsetKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v18;
  objc_msgSend(v6, "previousSunset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[6] = v20;
  objc_msgSend(MEMORY[0x24BE1B180], "isDaylightKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  if (!v16)

  v24 = v41;
  if (!v15)

  if (!v35)
  if (!v37)

  if (!v39)
LABEL_32:

  return v23;
}

- (BOOL)currentSunriseSunsetTimes:(id)a3 differsFromPreviousTimes:(id)a4 byInterval:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
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
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BE1B180], "sunriseSunsetAvailabilityStatusKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "sunriseSunsetAvailabilityStatusKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if (!v13)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x24BE1B180], "isDaylightKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "isDaylightKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqual:", v17);

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "currentSunriseKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B180], "currentSunriseKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B180], "nextSunriseKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B180], "nextSunriseKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B180], "previousSunriseKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B180], "previousSunriseKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 1;
    if ((v20 == 0) != (v22 != 0) && (v28 == 0) != (v30 != 0) && (v24 == 0) != (v26 != 0))
    {
      if (!v22 || (objc_msgSend(v22, "timeIntervalSinceDate:", v20), fabs(v31) < a5))
      {
        if (!v30 || (objc_msgSend(v30, "timeIntervalSinceDate:", v28), fabs(v32) < a5))
        {
          if (!v26 || (objc_msgSend(v26, "timeIntervalSinceDate:", v24), fabs(v33) < a5))
            v34 = 0;
        }
      }
    }

  }
  else
  {
LABEL_13:
    v34 = 1;
  }

  return v34;
}

- (void)unprotectedUpdateSunriseSunsetTime:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *log;
  NSObject *v8;
  NSDictionary *previousDataDictionary;
  void *v10;
  void *v11;
  int authorizationStatus;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSDictionary *v21;
  double v22;
  double v23;
  NSDictionary **p_previousDataDictionary;
  _BOOL4 v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  NSDictionary *v30;
  NSObject *updateTimer;
  dispatch_time_t v32;
  int v33;
  void *v34;
  __int16 v35;
  NSDictionary *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_enabled)
  {
    dispatch_suspend((dispatch_object_t)self->_updateTimer);
    -[CLLocationManager stopUpdatingLocation](self->_manager, "stopUpdatingLocation");
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      -[CLLocationManager location](self->_manager, "location");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (self->_awaitingLocationAfterDisabledAirplaneMode)
      goto LABEL_6;
    if (!-[_DKSunriseSunsetMonitor isAirplaneModeEnabled](self, "isAirplaneModeEnabled") || v6)
    {
      if (v6)
        goto LABEL_21;
    }
    else if (self->_authorizationStatus == 3)
    {
LABEL_6:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        -[_DKSunriseSunsetMonitor unprotectedUpdateSunriseSunsetTime:].cold.1(log);
      goto LABEL_33;
    }
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_219056000, v8, OS_LOG_TYPE_DEFAULT, "Location unknown", (uint8_t *)&v33, 2u);
    }
    previousDataDictionary = self->_previousDataDictionary;
    objc_msgSend(MEMORY[0x24BE1B180], "currentSunriseKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](previousDataDictionary, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      authorizationStatus = self->_authorizationStatus;

      if (authorizationStatus == 3)
      {
        v13 = self->_log;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          _os_log_impl(&dword_219056000, v13, OS_LOG_TYPE_DEFAULT, "Attempt to request location", (uint8_t *)&v33, 2u);
        }
        -[CLLocationManager startUpdatingLocation](self->_manager, "startUpdatingLocation");
        -[_DKSunriseSunsetMonitor contextDictionaryWithGeoAlmanac:authorizationStatus:](self, "contextDictionaryWithGeoAlmanac:authorizationStatus:", 0, self->_authorizationStatus);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE1B170], "userContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE1B180], "keyPathForSunriseSunsetDataDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v15);
        goto LABEL_32;
      }
    }
LABEL_21:
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      v18 = self->_authorizationStatus;
      v19 = v16;
      objc_msgSend(v17, "numberWithInt:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_previousDataDictionary;
      v33 = 138412546;
      v34 = v20;
      v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_219056000, v19, OS_LOG_TYPE_DEFAULT, "Not requesting location (%@, %@)", (uint8_t *)&v33, 0x16u);

    }
    if (v6)
    {
      v14 = (void *)objc_opt_new();
      objc_msgSend(v6, "coordinate");
      v23 = v22;
      objc_msgSend(v6, "coordinate");
      objc_msgSend(v14, "calculateAstronomicalTimeForLocation:altitudeInDegrees:", v23);
    }
    else
    {
      v14 = 0;
    }
    -[_DKSunriseSunsetMonitor contextDictionaryWithGeoAlmanac:authorizationStatus:](self, "contextDictionaryWithGeoAlmanac:authorizationStatus:", v14, self->_authorizationStatus);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    p_previousDataDictionary = &self->_previousDataDictionary;
    v25 = -[_DKSunriseSunsetMonitor currentSunriseSunsetTimes:differsFromPreviousTimes:byInterval:](self, "currentSunriseSunsetTimes:differsFromPreviousTimes:byInterval:", v15, self->_previousDataDictionary, 5.0);
    v26 = self->_log;
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        v33 = 138412290;
        v34 = v15;
        _os_log_impl(&dword_219056000, v26, OS_LOG_TYPE_DEFAULT, "Saving new values: %@", (uint8_t *)&v33, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BE1B170], "userContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForSunriseSunsetDataDictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v15, v29);

      objc_storeStrong((id *)p_previousDataDictionary, v15);
    }
    else if (v27)
    {
      v30 = *p_previousDataDictionary;
      v33 = 138412546;
      v34 = v15;
      v35 = 2112;
      v36 = v30;
      _os_log_impl(&dword_219056000, v26, OS_LOG_TYPE_DEFAULT, "Not saving new values: %@ (Old=%@)", (uint8_t *)&v33, 0x16u);
    }
LABEL_32:

LABEL_33:
    updateTimer = self->_updateTimer;
    v32 = dispatch_time(0, 1000000000 * self->_updateInterval);
    dispatch_source_set_timer(updateTimer, v32, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * self->_updateInterval / 0xA);
    dispatch_resume((dispatch_object_t)self->_updateTimer);
  }

}

- (void)respondToTimeChange:(id)a3
{
  NSObject *log;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219056000, log, OS_LOG_TYPE_DEFAULT, "Time changed; reevaluating sunrise/sunset times", buf, 2u);
  }
  -[_DKMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47___DKSunriseSunsetMonitor_respondToTimeChange___block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_sync(v5, block);

}

- (void)respondToAirplaneModeStatusChanged
{
  BOOL v3;

  if (self->_authorizationStatus == 3)
  {
    v3 = -[_DKSunriseSunsetMonitor isAirplaneModeEnabled](self, "isAirplaneModeEnabled");
    self->_awaitingLocationAfterDisabledAirplaneMode = !v3;
    if (!v3)
      -[CLLocationManager startUpdatingLocation](self->_manager, "startUpdatingLocation");
  }
  else
  {
    self->_awaitingLocationAfterDisabledAirplaneMode = 0;
  }
}

- (BOOL)isAirplaneModeEnabled
{
  return -[_DKSunriseSunsetMonitor isAirplaneModeEnabledWithPreferences:](self, "isAirplaneModeEnabledWithPreferences:", -[_DKSunriseSunsetMonitor radioPrefs](self, "radioPrefs"));
}

- (BOOL)isAirplaneModeEnabledWithPreferences:(__SCPreferences *)a3
{
  BOOL v4;
  NSObject *log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    SCPreferencesLock(a3, 1u);
    v4 = SCPreferencesGetValue(a3, CFSTR("AirplaneMode")) == (CFPropertyListRef)*MEMORY[0x24BDBD270];
    SCPreferencesUnlock(a3);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[_DKSunriseSunsetMonitor isAirplaneModeEnabledWithPreferences:].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return v4;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD block[4];
  id v13;
  id v14;

  if (objc_msgSend(a3, "isEqual:", self->_manager))
  {
    if (self->_authorizationStatus != a4)
    {
      self->_authorizationStatus = a4;
      -[_DKMonitor queue](self, "queue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x24BDAC760];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __72___DKSunriseSunsetMonitor_locationManager_didChangeAuthorizationStatus___block_invoke;
      v11[3] = &unk_24DA66D10;
      v11[4] = self;
      v8 = v11;
      v9 = (void *)os_transaction_create();
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke_9;
      block[3] = &unk_24DA66E28;
      v13 = v9;
      v14 = v8;
      v10 = v9;
      dispatch_async(v6, block);

    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *log;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[8];
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v5 = a4;
  self->_awaitingLocationAfterDisabledAirplaneMode = 0;
  if (objc_msgSend(v5, "count"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219056000, log, OS_LOG_TYPE_INFO, "Obtained new location", buf, 2u);
    }
  }
  -[_DKMonitor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62___DKSunriseSunsetMonitor_locationManager_didUpdateLocations___block_invoke;
  v13[3] = &unk_24DA66D60;
  v13[4] = self;
  v14 = v5;
  v9 = v13;
  v10 = v5;
  v11 = (void *)os_transaction_create();
  *(_QWORD *)buf = v8;
  v16 = 3221225472;
  v17 = __cd_dispatch_async_capture_tx_block_invoke_9;
  v18 = &unk_24DA66E28;
  v19 = v11;
  v20 = v9;
  v12 = v11;
  dispatch_async(v7, buf);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  self->_awaitingLocationAfterDisabledAirplaneMode = 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_source)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateTimer, a3);
}

- (unint64_t)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(unint64_t)a3
{
  self->_updateInterval = a3;
}

- (CLLocationManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (NSDictionary)previousDataDictionary
{
  return self->_previousDataDictionary;
}

- (void)setPreviousDataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_previousDataDictionary, a3);
}

- (BOOL)awaitingLocationAfterDisabledAirplaneMode
{
  return self->_awaitingLocationAfterDisabledAirplaneMode;
}

- (void)setAwaitingLocationAfterDisabledAirplaneMode:(BOOL)a3
{
  self->_awaitingLocationAfterDisabledAirplaneMode = a3;
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_authorizationStatus = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (__SCPreferences)radioPrefs
{
  return self->_radioPrefs;
}

- (void)setRadioPrefs:(__SCPreferences *)a3
{
  self->_radioPrefs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_previousDataDictionary, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

- (void)init
{
  id v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v2 = SCError();
  SCErrorString(v2);
  OUTLINED_FUNCTION_0_6(&dword_219056000, v3, v4, "SCPreferencesSetDispatchQueue() failed: %s", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)unprotectedUpdateSunriseSunsetTime:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_219056000, log, OS_LOG_TYPE_DEBUG, "Didn't update information!", v1, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)isAirplaneModeEnabledWithPreferences:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_219056000, a1, a3, "SCPreferencesRef is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

@end
