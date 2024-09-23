@implementation DTActivityTraceTapLocalDelegate

- (DTActivityTraceTapLocalDelegate)initWithConfig:(id)a3
{
  id v5;
  DTActivityTraceTapLocalDelegate *v6;
  DTActivityTraceTapLocalDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTActivityTraceTapLocalDelegate;
  v6 = -[DTActivityTraceTapLocalDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
      sub_222BC6904();
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_harLoggingNotificationToken = -1;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[XRMobileAgentDock abandon](self->_dock, "abandon");
  v3.receiver = self;
  v3.super_class = (Class)DTActivityTraceTapLocalDelegate;
  -[DTActivityTraceTapLocalDelegate dealloc](&v3, sel_dealloc);
}

- (id)validateConfig
{
  void *v3;
  void *v4;
  __CFString *v5;
  DTTapStatusMemo *v6;
  __SecTask *v7;
  CFDictionaryRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  DTTapStatusMemo *v17;
  void *v18;
  uint64_t v19;
  DTTapStatusMemo *v21;
  __CFString *v22;
  __SecTask *cf;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CFErrorRef error;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[DTActivityTraceTapConfig predicateString](self->_config, "predicateString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", &stru_24EB2CF78) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_5;
    }
    v21 = [DTTapStatusMemo alloc];
    v5 = CFSTR("Internal error contains no diagnostics");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Predicate supplied to logging system appears invalid. %@."), CFSTR("Internal error contains no diagnostics"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DTTapStatusMemo initWithStatus:notice:](v21, "initWithStatus:notice:", 2147484148, v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

LABEL_5:
  if (!-[DTActivityTraceTapConfig mode](self->_config, "mode"))
  {
    v7 = SecTaskCreateFromSelf(0);
    if (v7)
    {
      v22 = v5;
      cf = v7;
      error = 0;
      v8 = SecTaskCopyValuesForEntitlements(v7, (CFArrayRef)&unk_24EB4E8D0, &error);
      if (v8)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = objc_msgSend(&unk_24EB4E8E8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v25;
          v11 = MEMORY[0x24BDBD1C8];
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(&unk_24EB4E8E8);
              v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqual:", v11);

              if ((v15 & 1) == 0)
              {
                v17 = [DTTapStatusMemo alloc];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Recording service missing '%@' entitlement."), v13);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = -[DTTapStatusMemo initWithStatus:notice:](v17, "initWithStatus:notice:", 2147484148, v18);

                v6 = (DTTapStatusMemo *)v19;
                goto LABEL_20;
              }
            }
            v9 = objc_msgSend(&unk_24EB4E8E8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_20:

      }
      CFRelease(cf);
      v5 = v22;
    }
  }

  return v6;
}

- (void)setTap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    sub_222BC692C();
  v5 = v4;
  objc_storeWeak((id *)&self->_tap, v4);

}

- (void)logLoaderNeedsFetchNow:(id)a3
{
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
  v3 = (id)objc_msgSend(WeakRetained, "fetchDataNow");

}

- (void)_setupHARDisabledByExternalClientNotifications
{
  int *p_harLoggingNotificationToken;
  NSObject *v3;
  uint32_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  p_harLoggingNotificationToken = &self->_harLoggingNotificationToken;
  if (self->_harLoggingNotificationToken == -1)
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_222B62B38;
    v5[3] = &unk_24EB29EA0;
    objc_copyWeak(&v6, &location);
    v4 = notify_register_dispatch("com.apple.CFNetwork.har-capture-update", p_harLoggingNotificationToken, v3, v5);

    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_222BC6954();
    }
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_tearDownHARDisabledNotifications
{
  int harLoggingNotificationToken;

  harLoggingNotificationToken = self->_harLoggingNotificationToken;
  if (harLoggingNotificationToken != -1)
  {
    notify_cancel(harLoggingNotificationToken);
    self->_harLoggingNotificationToken = -1;
  }
}

- (void)_handleStopOfHARRecordingCausedByUser
{
  id WeakRetained;
  DTTapStatusMemo *v4;

  v4 = -[DTTapStatusMemo initWithStatus:notice:]([DTTapStatusMemo alloc], "initWithStatus:notice:", 2147484148, CFSTR("HTTP Recording stopped by the target device"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
  objc_msgSend(WeakRetained, "_handleStatusMemo:", v4);

  -[DTActivityTraceTapLocalDelegate _tearDownHARDisabledNotifications](self, "_tearDownHARDisabledNotifications");
  -[DVTDeviceGlobalStatusIndicator deactivate](self->_recordingStatusIndicator, "deactivate");
  -[DTActivityTraceTapLocalDelegate tearDownHARTimer](self, "tearDownHARTimer");
  -[DTActivityTraceTapLocalDelegate updateHARLogPrefsWithIsEnabled:](self, "updateHARLogPrefsWithIsEnabled:", 0);

}

- (void)_handleHARExternalNotificationChange
{
  const __CFString *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (const __CFString *)*MEMORY[0x24BDBD570];
  v4 = (unint64_t)CFPreferencesCopyValue(CFSTR("har-capture-global"), CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  v5 = (unint64_t)CFPreferencesCopyValue(CFSTR("har-capture-pid-specific"), CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), v3);
  if (v4 | v5)
  {
    if (v5)
      CFRelease((CFTypeRef)v5);
    if (v4)
      CFRelease((CFTypeRef)v4);
  }
  else
  {
    -[DTActivityTraceTapLocalDelegate _handleStopOfHARRecordingCausedByUser](self, "_handleStopOfHARRecordingCausedByUser");
  }
}

- (void)initializeHARTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *harLoggingTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  harLoggingTimer = self->_harLoggingTimer;
  self->_harLoggingTimer = v3;

  v5 = self->_harLoggingTimer;
  v6 = dispatch_walltime(0, 55000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v7 = self->_harLoggingTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = sub_222B62DA0;
  handler[3] = &unk_24EB27E30;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_harLoggingTimer);
}

- (void)tearDownHARTimer
{
  dispatch_source_cancel((dispatch_source_t)self->_harLoggingTimer);
}

- (void)updateHARLogPrefsWithIsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  const __CFString *v11;
  const void *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60C98]), "initWithName:", CFSTR("com.apple.CFNetwork"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60C90]), "initWithName:subsystem:", CFSTR("HAR"), v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60C98]), "initWithName:", CFSTR("com.apple.CFNetwork.Instruments"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60C90]), "initWithName:subsystem:", CFSTR("HTTP Transactions"), v7);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 60.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0x100000);
    v11 = (const __CFString *)*MEMORY[0x24BDBD570];
    CFPreferencesSetValue(CFSTR("har-body-size-limit"), v10, CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
    if (-[DTActivityTraceTapConfig targetPID](self->_config, "targetPID") == -3)
    {
      CFPreferencesSetValue(CFSTR("har-capture-global"), v9, CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), v11);
      v12 = 0;
      v13 = CFSTR("har-capture-pid-specific");
    }
    else
    {
      CFPreferencesSetValue(CFSTR("har-capture-pid-specific"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[DTActivityTraceTapConfig targetPID](self->_config, "targetPID")), CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), v11);
      v13 = CFSTR("har-capture-global");
      v12 = v9;
    }
    CFPreferencesSetValue(CFSTR("har-capture-pid-date"), v12, CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), v11);
    CFPreferencesSetValue(v13, 0, CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), v11);
    if (notify_post("com.apple.CFNetwork.har-capture-update")
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to post notification to start HAR logging", buf, 2u);
    }
    objc_msgSend(v6, "setPersistedLevel:", 0);
    objc_msgSend(v6, "setEnabledLevel:", 2);
    objc_msgSend(v8, "setSignpostEnabled:", 1);

  }
  else
  {
    v14 = (const __CFString *)*MEMORY[0x24BDBD570];
    CFPreferencesSetValue(CFSTR("har-body-size-limit"), 0, CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
    CFPreferencesSetValue(CFSTR("har-capture-global"), 0, CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), v14);
    CFPreferencesSetValue(CFSTR("har-capture-pid-specific"), 0, CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), v14);
    CFPreferencesSetValue(CFSTR("har-capture-pid-date"), 0, CFSTR("com.apple.CFNetwork"), CFSTR("mobile"), v14);
    if (notify_post("com.apple.CFNetwork.har-capture-update")
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to post notification to stop HAR logging", v15, 2u);
    }
    objc_msgSend(v6, "reset");
    objc_msgSend(v8, "reset");
  }

}

- (void)start
{
  XRMobileAgentDock *v3;
  XRMobileAgentDock *dock;
  DTOSLogLoader *v5;
  DTOSLogLoader *loaderStop;
  DTActivityTraceTapLocalShuttle *v7;
  DTActivityTraceTapLocalShuttle *shuttle;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  DTActivityTraceTapConfig *config;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  DVTDeviceGlobalStatusIndicatorConfiguration *v33;
  DVTDeviceGlobalStatusIndicator *v34;
  DVTDeviceGlobalStatusIndicator *recordingStatusIndicator;
  DTTapStatusMemo *v36;
  DTTapStatusMemo *v37;
  int times;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id WeakRetained;
  DTActivityTraceTapLocalShuttle *v46;
  DTTapStatusMemo *v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  mach_timebase_info v51;
  _BOOL4 v52;
  DTOSLogLoaderConfiguration *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id location;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  mach_timebase_info info;
  _QWORD v63[4];
  id v64;
  _QWORD v65[5];
  _QWORD v66[7];

  v66[5] = *MEMORY[0x24BDAC8D0];
  v3 = (XRMobileAgentDock *)objc_opt_new();
  dock = self->_dock;
  self->_dock = v3;

  v5 = (DTOSLogLoader *)objc_opt_new();
  loaderStop = self->_loaderStop;
  self->_loaderStop = v5;

  -[DTOSLogLoader setDelegate:](self->_loaderStop, "setDelegate:", self);
  v7 = (DTActivityTraceTapLocalShuttle *)objc_opt_new();
  shuttle = self->_shuttle;
  self->_shuttle = v7;

  -[DTActivityTraceTapLocalShuttle setLoaderStop:](self->_shuttle, "setLoaderStop:", self->_loaderStop);
  -[DTActivityTraceTapLocalShuttle setOwnersDock:](self->_shuttle, "setOwnersDock:", self->_dock);
  -[DTActivityTraceTapConfig predicateString](self->_config, "predicateString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (-[DTActivityTraceTapConfig predicateString](self->_config, "predicateString"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "length"),
        v10,
        v9,
        v11))
  {
    v12 = (void *)MEMORY[0x24BDD1758];
    -[DTActivityTraceTapConfig predicateString](self->_config, "predicateString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", v13);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v57 = 0;
  }
  if (-[DTActivityTraceTapConfig onlySignposts](self->_config, "onlySignposts"))
  {
    v14 = 1;
  }
  else if (-[DTActivityTraceTapConfig signpostsAndLogs](self->_config, "signpostsAndLogs"))
  {
    v14 = 0;
  }
  else
  {
    v14 = 2;
  }
  v15 = -[DTActivityTraceTapConfig excludeInfo](self->_config, "excludeInfo");
  if (-[DTActivityTraceTapConfig excludeDebug](self->_config, "excludeDebug"))
    v16 = v15 | 2;
  else
    v16 = v15;
  v17 = -[DTActivityTraceTapConfig includeSenderInfo](self->_config, "includeSenderInfo");
  if (-[DTActivityTraceTapConfig includeWallTime](self->_config, "includeWallTime"))
    v17 |= 2uLL;
  v18 = -[DTActivityTraceTapConfig mode](self->_config, "mode");
  config = self->_config;
  v55 = v16;
  v56 = v14;
  if (v18)
  {
    v20 = -[DTActivityTraceTapConfig mode](config, "mode");
    v21 = 2 * (v20 == 1);
    if (v20 == 2)
      v21 = 3;
    v54 = v21;
    -[DTActivityTraceTapConfig processDetectionCallback](self->_config, "processDetectionCallback");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTActivityTraceTapLocalShuttle setProcessDetectionCallback:](self->_shuttle, "setProcessDetectionCallback:", v22);

  }
  else
  {
    v23 = -[DTTapConfig bufferMode](config, "bufferMode");
    if (v23 == 2)
    {
      -[DTActivityTraceTapLocalShuttle setFetchWindow:](self->_shuttle, "setFetchWindow:", (double)(2 * -[DTTapConfig windowSize](self->_config, "windowSize")) / 1000000000.0);
    }
    else if (v23 <= 1)
    {
      v54 = 1;
      goto LABEL_24;
    }
    v54 = 0;
  }
LABEL_24:
  v53 = [DTOSLogLoaderConfiguration alloc];
  v52 = -[DTActivityTraceTapConfig enableBacktraceReplacement](self->_config, "enableBacktraceReplacement");
  v51 = -[DTActivityTraceTapConfig machTimebase](self->_config, "machTimebase");
  v50 = -[DTActivityTraceTapConfig machContinuousStart](self->_config, "machContinuousStart");
  -[DTActivityTraceTapConfig importedFileURL](self->_config, "importedFileURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTActivityTraceTapConfig importForcedStartDate](self->_config, "importForcedStartDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTActivityTraceTapConfig importForcedEndDate](self->_config, "importForcedEndDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTActivityTraceTapConfig processDetectionCallback](self->_config, "processDetectionCallback");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTActivityTraceTapConfig dynamicTracingEnabledSubsystems](self->_config, "dynamicTracingEnabledSubsystems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTActivityTraceTapConfig loggingSubsystemCategoryPairsToEnable](self->_config, "loggingSubsystemCategoryPairsToEnable");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTActivityTraceTapConfig signpostSubsystemCategoryPairsToEnable](self->_config, "signpostSubsystemCategoryPairsToEnable");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v49) = v27 != 0;
  v31 = -[DTOSLogLoaderConfiguration initWithFilterPredicate:signpostConfig:loaderExclusions:columnInclusions:mode:enableBacktraceReplacement:machTimebase:machContinuousStart:importedFileURL:importForcedStartDate:importForcedEndDate:trackPidToExecNameMapping:dynamicTracingEnabledSubsystems:logSubsystemCategoryPairsToEnable:signpostSubsystemCategoryPairsToEnable:](v53, "initWithFilterPredicate:signpostConfig:loaderExclusions:columnInclusions:mode:enableBacktraceReplacement:machTimebase:machContinuousStart:importedFileURL:importForcedStartDate:importForcedEndDate:trackPidToExecNameMapping:dynamicTracingEnabledSubsystems:logSubsystemCategoryPairsToEnable:signpostSubsystemCategoryPairsToEnable:", v57, v56, v55, v17, v54, v52, v51, v50, v24, v25, v26, v49, v28, v29, v30);

  v32 = (void *)v31;
  -[DTActivityTraceTapLocalShuttle setConfiguration:](self->_shuttle, "setConfiguration:", v31);
  if (-[DTActivityTraceTapConfig enableHTTPArchiveLogging](self->_config, "enableHTTPArchiveLogging"))
  {
    objc_initWeak(&location, self);
    v33 = -[DVTDeviceGlobalStatusIndicatorConfiguration initWithTitle:informationText:]([DVTDeviceGlobalStatusIndicatorConfiguration alloc], "initWithTitle:informationText:", CFSTR("HTTP Traffic is being recorded"), CFSTR("Recordings of HTTP traffic can contain sensitive information. If you did not ask to record HTTP traffic, tap Stop Recording."));
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = sub_222B638C8;
    v63[3] = &unk_24EB28000;
    objc_copyWeak(&v64, &location);
    +[DVTDeviceGlobalStatusIndicatorFactory deviceStatusIndicatorWithConfiguration:stoppedByUserBlock:](DVTDeviceGlobalStatusIndicatorFactory, "deviceStatusIndicatorWithConfiguration:stoppedByUserBlock:", v33, v63);
    v34 = (DVTDeviceGlobalStatusIndicator *)objc_claimAutoreleasedReturnValue();
    recordingStatusIndicator = self->_recordingStatusIndicator;
    self->_recordingStatusIndicator = v34;

    -[DVTDeviceGlobalStatusIndicator activateWithCompletionBlock:](self->_recordingStatusIndicator, "activateWithCompletionBlock:", 0);
    -[DTActivityTraceTapLocalDelegate initializeHARTimer](self, "initializeHARTimer");
    -[DTActivityTraceTapLocalDelegate updateHARLogPrefsWithIsEnabled:](self, "updateHARLogPrefsWithIsEnabled:", 1);
    -[DTActivityTraceTapLocalDelegate _setupHARDisabledByExternalClientNotifications](self, "_setupHARDisabledByExternalClientNotifications");
    objc_destroyWeak(&v64);

    objc_destroyWeak(&location);
  }
  v36 = [DTTapStatusMemo alloc];
  v37 = -[DTTapStatusMemo initWithStatus:notice:](v36, "initWithStatus:notice:", (unsigned __int16)DTActivityTraceTapDeviceTimeInfoMemoStatusCode | 0x90000000, CFSTR("Time Mapping"));
  v61 = 0;
  info = 0;
  v59 = 0;
  v60 = 0;
  location = 0;
  times = mach_get_times();
  if (!(times | mach_timebase_info(&info)))
  {
    v65[0] = DTActivityTraceTapDeviceTimeIntervalSince1970Key;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v59 / 1000000000.0 + (double)(uint64_t)location);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v39;
    v65[1] = DTActivityTraceTapDeviceMachContinuousTimeKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v60);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v40;
    v65[2] = DTActivityTraceTapDeviceMachAbsoluteTimeKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v61);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v41;
    v65[3] = DTActivityTraceTapDeviceMachTimebaseNumeratorKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", info.numer);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v42;
    v65[4] = DTActivityTraceTapDeviceMachTimebaseDenominatorKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", info.denom);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTTapStatusMemo setInfo:](v37, "setInfo:", v44);

    WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(WeakRetained, "_handleStatusMemo:", v37);

  }
  -[XRMobileAgent activateWithFinalDestination:ticket:](self->_shuttle, "activateWithFinalDestination:ticket:", self->_dock, 0);
  if (-[XRMobileAgentDock waitForAgentToDock](self->_dock, "waitForAgentToDock"))
  {
    -[XRMobileAgentDock dockedAgent](self->_dock, "dockedAgent");
    v46 = (DTActivityTraceTapLocalShuttle *)objc_claimAutoreleasedReturnValue();
    if (v46 != self->_shuttle)
      sub_222BC69DC();

    if (!-[DTActivityTraceTapLocalShuttle didPrepare](self->_shuttle, "didPrepare"))
    {
      v47 = -[DTTapStatusMemo initWithStatus:notice:]([DTTapStatusMemo alloc], "initWithStatus:notice:", 2147484563, CFSTR("Failed to prepare the logging system for recording."));
      v48 = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(v48, "_handleStatusMemo:", v47);
      goto LABEL_34;
    }
    -[DTActivityTraceTapLocalShuttle setShouldStart:](self->_shuttle, "setShouldStart:", 1);
    -[XRMobileAgentDock releaseDockedAgent](self->_dock, "releaseDockedAgent");
    -[XRMobileAgentDock waitForAgentToDock](self->_dock, "waitForAgentToDock");
    if (!-[DTActivityTraceTapLocalShuttle didStart](self->_shuttle, "didStart"))
    {
      v47 = -[DTTapStatusMemo initWithStatus:notice:]([DTTapStatusMemo alloc], "initWithStatus:notice:", 2147484558, CFSTR("Failed to start recording logging system data."));
      v48 = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(v48, "_handleStatusMemo:", v47);
LABEL_34:

    }
  }

}

- (void)stop
{
  void *v3;
  void *v4;
  void *v5;
  DTTapStatusMemo *v6;
  id WeakRetained;
  DTTapStatusMemo *v8;
  id v9;

  -[XRMobileAgentDock dockedAgent](self->_dock, "dockedAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[XRMobileAgentDock waitForAgentToDock](self->_dock, "waitForAgentToDock");
  -[XRMobileAgentDock dockedAgent](self->_dock, "dockedAgent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DTActivityTraceTapLocalShuttle setShouldStop:](self->_shuttle, "setShouldStop:", 1);
    -[XRMobileAgentDock releaseDockedAgent](self->_dock, "releaseDockedAgent");
  }
  -[XRMobileAgentDock waitForAgentToDock](self->_dock, "waitForAgentToDock");
  -[XRMobileAgentDock dockedAgent](self->_dock, "dockedAgent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!-[DTActivityTraceTapLocalShuttle didStop](self->_shuttle, "didStop"))
    {
      v6 = -[DTTapStatusMemo initWithStatus:notice:]([DTTapStatusMemo alloc], "initWithStatus:notice:", 2281702326, CFSTR("Failed to stop the logging system recording."));
      WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(WeakRetained, "_handleStatusMemo:", v6);

    }
    -[XRMobileAgentDock releaseDockedAgent](self->_dock, "releaseDockedAgent");
    -[XRMobileAgentDock waitForAgentToDock](self->_dock, "waitForAgentToDock");
  }
  else
  {
    v8 = -[DTTapStatusMemo initWithStatus:notice:]([DTTapStatusMemo alloc], "initWithStatus:notice:", 2281702346, CFSTR("Internal agent failure."));
    v9 = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(v9, "_handleStatusMemo:", v8);

  }
  if (-[DTActivityTraceTapConfig enableHTTPArchiveLogging](self->_config, "enableHTTPArchiveLogging"))
  {
    -[DTActivityTraceTapLocalDelegate _tearDownHARDisabledNotifications](self, "_tearDownHARDisabledNotifications");
    -[DVTDeviceGlobalStatusIndicator deactivate](self->_recordingStatusIndicator, "deactivate");
    -[DTActivityTraceTapLocalDelegate tearDownHARTimer](self, "tearDownHARTimer");
    -[DTActivityTraceTapLocalDelegate updateHARLogPrefsWithIsEnabled:](self, "updateHARLogPrefsWithIsEnabled:", 0);
  }
}

- (BOOL)canFetchWhileArchiving
{
  return 0;
}

- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4
{
  DTActivityTraceTapMemo *v6;
  void *v7;
  DTActivityTraceTapMemo *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DTTapStatusMemo *v17;
  void *v18;
  DTTapStatusMemo *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  DTTapStatusMemo *v23;
  DTTapStatusMemo *v24;
  uint64_t v25;
  DTActivityTraceTapMemo *v26;
  void *v27;
  DTActivityTraceTapMemo *v28;
  DTTapStatusMemo *v29;
  void *v30;
  id v31;
  int v32;
  DTActivityTraceTapMemo *v33;
  int v34;
  DTTapStatusMemo *v35;
  void *v36;
  DTTapStatusMemo *v37;
  id v38;
  DTTapHeartbeatMemo *v39;
  unint64_t v40;
  char v41;
  void (**v42)(id, void *, uint64_t);

  v42 = (void (**)(id, void *, uint64_t))a4;
  if (a3 == 2)
  {
    if (!-[DTTapConfig discardHeartbeatsWhenPossible](self->_config, "discardHeartbeatsWhenPossible"))
      +[DTOSLogLoader heartbeat](DTOSLogLoader, "heartbeat");
    v9 = 1;
  }
  else
  {
    if (!a3)
    {
      v6 = [DTActivityTraceTapMemo alloc];
      v7 = (void *)objc_opt_new();
      v8 = -[DTActivityTraceTapMemo initWithData:](v6, "initWithData:", v7);

      -[DTTapDataMemo setFinalMemo:](v8, "setFinalMemo:", 1);
      v42[2](v42, v8, 1);
      goto LABEL_46;
    }
    v9 = 0;
  }
  -[XRMobileAgentDock dockedAgent](self->_dock, "dockedAgent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[XRMobileAgentDock waitForAgentToDock](self->_dock, "waitForAgentToDock");
  -[XRMobileAgentDock dockedAgent](self->_dock, "dockedAgent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_47;
  v40 = a3;
  v12 = 0;
  v8 = 0;
  v41 = 0;
  do
  {
    -[DTActivityTraceTapLocalShuttle setShouldFetch:](self->_shuttle, "setShouldFetch:", 1);
    -[XRMobileAgentDock releaseDockedAgent](self->_dock, "releaseDockedAgent");
    -[XRMobileAgentDock waitForAgentToDock](self->_dock, "waitForAgentToDock");
    -[DTActivityTraceTapLocalShuttle failureReason](self->_shuttle, "failureReason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "localizedFailureReason");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(v14, "localizedFailureReason");
      else
        objc_msgSend(v14, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [DTTapStatusMemo alloc];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fatal logging system error: %@"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[DTTapStatusMemo initWithStatus:notice:](v17, "initWithStatus:notice:", 2147484548, v18);

      WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(WeakRetained, "_handleStatusMemo:", v19);

    }
    v12 += -[DTActivityTraceTapLocalShuttle lostEventsSinceLastVisit](self->_shuttle, "lostEventsSinceLastVisit");
    -[DTActivityTraceTapLocalShuttle nextOutputBytes](self->_shuttle, "nextOutputBytes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v9)
    {

      if (!v22)
        goto LABEL_27;
      -[DTActivityTraceTapLocalShuttle nextOutputBytes](self->_shuttle, "nextOutputBytes");
      v23 = (DTTapStatusMemo *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v8)
        -[DTActivityTraceTapMemo appendData:](v8, "appendData:", v23);
      else
        v8 = (DTActivityTraceTapMemo *)-[DTTapStatusMemo mutableCopy](v23, "mutableCopy");
      goto LABEL_26;
    }
    v25 = objc_msgSend(v21, "length");

    if (v25)
    {
      v26 = [DTActivityTraceTapMemo alloc];
      -[DTActivityTraceTapLocalShuttle nextOutputBytes](self->_shuttle, "nextOutputBytes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[DTActivityTraceTapMemo initWithData:](v26, "initWithData:", v27);

      -[DTTapDataMemo setFinalMemo:](v28, "setFinalMemo:", -[DTActivityTraceTapLocalShuttle isFetchComplete](self->_shuttle, "isFetchComplete"));
      -[DTActivityTraceTapMemo setLastMachContinuousTimeSeen:](v28, "setLastMachContinuousTimeSeen:", -[DTActivityTraceTapLocalShuttle lastMachContinuousTime](self->_shuttle, "lastMachContinuousTime"));
      v42[2](v42, v28, -[DTTapDataMemo finalMemo](v28, "finalMemo"));

      v41 = 1;
    }
    if (v12)
    {
      v29 = [DTTapStatusMemo alloc];
      -[DTActivityTraceTapLocalDelegate noticeForRecordingMode:isAllProcesses:lossCount:](self, "noticeForRecordingMode:isAllProcesses:lossCount:", -[DTTapConfig bufferMode](self->_config, "bufferMode"), -[DTActivityTraceTapConfig isTargetAllProcesses](self->_config, "isTargetAllProcesses"), v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[DTTapStatusMemo initWithStatus:notice:](v29, "initWithStatus:notice:", 2281701476, v30);

      v31 = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(v31, "_handleStatusMemo:", v24);

      v12 = 0;
LABEL_26:

    }
LABEL_27:
    -[DTActivityTraceTapLocalShuttle setNextOutputBytes:](self->_shuttle, "setNextOutputBytes:", 0);
    -[DTActivityTraceTapLocalShuttle setLostEventsSinceLastVisit:](self->_shuttle, "setLostEventsSinceLastVisit:", 0);

  }
  while (!-[DTActivityTraceTapLocalShuttle isFetchComplete](self->_shuttle, "isFetchComplete"));
  -[DTActivityTraceTapLocalShuttle setShouldFetch:](self->_shuttle, "setShouldFetch:", 0);
  if (v8)
    v32 = v9;
  else
    v32 = 0;
  if (v32 == 1 && -[DTActivityTraceTapMemo length](v8, "length"))
  {
    v33 = -[DTActivityTraceTapMemo initWithData:]([DTActivityTraceTapMemo alloc], "initWithData:", v8);
    v41 = 1;
    -[DTTapDataMemo setFinalMemo:](v33, "setFinalMemo:", 1);
    -[DTActivityTraceTapMemo setLastMachContinuousTimeSeen:](v33, "setLastMachContinuousTimeSeen:", -[DTActivityTraceTapLocalShuttle lastMachContinuousTime](self->_shuttle, "lastMachContinuousTime"));
    v42[2](v42, v33, 1);

  }
  if (v12)
    v34 = v9;
  else
    v34 = 0;
  if (v34 == 1)
  {
    v35 = [DTTapStatusMemo alloc];
    -[DTActivityTraceTapLocalDelegate noticeForRecordingMode:isAllProcesses:lossCount:](self, "noticeForRecordingMode:isAllProcesses:lossCount:", -[DTTapConfig bufferMode](self->_config, "bufferMode"), -[DTActivityTraceTapConfig isTargetAllProcesses](self->_config, "isTargetAllProcesses"), v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[DTTapStatusMemo initWithStatus:notice:](v35, "initWithStatus:notice:", 2281701476, v36);

    v38 = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(v38, "_handleStatusMemo:", v37);

  }
  if ((v41 & 1) == 0)
  {
    if (v40 == 2)
    {
      v39 = -[DTTapHeartbeatMemo initWithTimestamp:]([DTTapHeartbeatMemo alloc], "initWithTimestamp:", -[DTActivityTraceTapLocalShuttle lastMachContinuousTime](self->_shuttle, "lastMachContinuousTime"));
    }
    else
    {
      if (v40 != 1)
        goto LABEL_46;
      v39 = -[DTActivityTraceTapMemo initWithData:]([DTActivityTraceTapMemo alloc], "initWithData:", v8);
      -[DTTapHeartbeatMemo setFinalMemo:](v39, "setFinalMemo:", 1);
    }
    v42[2](v42, v39, 1);

  }
LABEL_46:

LABEL_47:
}

- (id)noticeForRecordingMode:(unint64_t)a3 isAllProcesses:(BOOL)a4 lossCount:(unint64_t)a5
{
  const __CFString *v5;

  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      v5 = CFSTR("%llu log/signpost messages lost due to high rates in live mode recording. Try windowed recording mode.");
      goto LABEL_7;
    }
LABEL_6:
    v5 = CFSTR("%llu log/signpost messages lost due to high rates");
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_6;
  v5 = CFSTR("%llu log/signpost messages lost due to high rates. Try target specific process.");
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v5, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingStatusIndicator, 0);
  objc_storeStrong((id *)&self->_harLoggingTimer, 0);
  objc_storeStrong((id *)&self->_shuttle, 0);
  objc_storeStrong((id *)&self->_dock, 0);
  objc_storeStrong((id *)&self->_loaderStop, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_tap);
}

@end
