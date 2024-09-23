@implementation MODiagnosticReporter

- (void)configureWithOnboardingAndSettingsManager:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __74__MODiagnosticReporter_MOCore__configureWithOnboardingAndSettingsManager___block_invoke;
  v3[3] = &unk_25133F928;
  v3[4] = self;
  objc_msgSend(a3, "getDiagnosticReporterConfiguration:", v3);
}

uint64_t __74__MODiagnosticReporter_MOCore__configureWithOnboardingAndSettingsManager___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(result + 32), "_configureFromDictionary:", a2);
  return result;
}

+ (id)defaultReporter
{
  if (defaultReporter_onceToken != -1)
    dispatch_once(&defaultReporter_onceToken, &__block_literal_global_0);
  return (id)defaultReporter_reporter;
}

void __39__MODiagnosticReporter_defaultReporter__block_invoke()
{
  MODiagnosticReporter *v0;
  void *v1;

  v0 = objc_alloc_init(MODiagnosticReporter);
  v1 = (void *)defaultReporter_reporter;
  defaultReporter_reporter = (uint64_t)v0;

}

- (MODiagnosticReporter)init
{
  char *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MODiagnosticReporter;
  v2 = -[MODiagnosticReporter init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("MODiagnosticReporter", v4);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    *((_OWORD *)v2 + 1) = 0u;
    *((_OWORD *)v2 + 2) = 0u;
    v7 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = 0;

    *(_OWORD *)(v2 + 56) = xmmword_2422CD120;
    *((_QWORD *)v2 + 9) = 0x4024000000000000;
    *((_DWORD *)v2 + 20) = 0;
    *((_QWORD *)v2 + 11) = 4;

  }
  return (MODiagnosticReporter *)v2;
}

- (void)_notificationHandlerWithNotificationRef:(__CFUserNotification *)a3 andOptionFlags:(unint64_t)a4
{
  __CFUserNotification **p_notification;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void (**notificationAcceptanceCallback)(void);
  __CFRunLoop *Main;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_notification = &self->_notification;
  if (self->_notification != a3)
  {
    _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[MODiagnosticReporter _notificationHandlerWithNotificationRef:andOptionFlags:].cold.1();

  }
  _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_2422B0000, v8, OS_LOG_TYPE_DEFAULT, "Received response flags %@", (uint8_t *)&v13, 0xCu);

  }
  if ((a4 & 3) != 0)
  {
    self->_lastResult = 2;
  }
  else
  {
    self->_lastResult = 1;
    notificationAcceptanceCallback = (void (**)(void))self->_notificationAcceptanceCallback;
    if (notificationAcceptanceCallback)
      notificationAcceptanceCallback[2]();
  }
  Main = CFRunLoopGetMain();
  CFRunLoopRemoveSource(Main, self->_notificationSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  *p_notification = 0;
  p_notification[1] = 0;
  v12 = self->_notificationAcceptanceCallback;
  self->_notificationAcceptanceCallback = 0;

}

- (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 acceptButtonTitle:(id)a6 withAcceptanceBlock:(id)a7
{
  id v12;
  NSObject *v13;
  const __CFDictionary *v14;
  NSObject *v15;
  const __CFAllocator *v16;
  __CFUserNotification *v17;
  __CFRunLoopSource *RunLoopSource;
  void *v19;
  id notificationAcceptanceCallback;
  __CFRunLoop *Main;
  NSObject *v22;
  uint8_t buf[4];
  const __CFDictionary *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  if (!self->_notification)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDBD6D8], a4, *MEMORY[0x24BDBD6E0], a6, *MEMORY[0x24BDBD6F8], a5, *MEMORY[0x24BDBD6F0], 0);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_2422B0000, v15, OS_LOG_TYPE_DEFAULT, "Prompting diagnostic report notification with alert parameters %@", buf, 0xCu);
    }

    *(_DWORD *)buf = 0;
    v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v17 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 60.0, 0, (SInt32 *)buf, v14);
    self->_notification = v17;
    if (v17)
    {
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v16, v17, (CFUserNotificationCallBack)_MODiagnosticReporter_NotificationHandler, 0);
      self->_notificationSource = RunLoopSource;
      if (RunLoopSource)
      {
        v19 = (void *)objc_msgSend(v12, "copy");
        notificationAcceptanceCallback = self->_notificationAcceptanceCallback;
        self->_notificationAcceptanceCallback = v19;

        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_notificationSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
LABEL_15:

        goto LABEL_16;
      }
      self->_notification = 0;
      _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:].cold.2();
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:].cold.1((int *)buf, v22);
    }

    goto LABEL_15;
  }
  _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:].cold.3();

  self->_lastResult = 2;
LABEL_16:

}

- (void)reportIncident:(id)a3 subtype:(id)a4 context:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  MODiagnosticReporter *v11;
  double Current;
  unint64_t lastResult;
  BOOL v14;
  double v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  __CFString *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_isInternalBuild)
  {
    if (self->_onboardingStatus || self->_forceNotification)
    {
      if (self->_isOnboardedOnJournalStudy || self->_forceNotification)
      {
        if (self->_avoidNotification)
        {
          _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
          v11 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
            -[MODiagnosticReporter reportIncident:subtype:context:].cold.4();
        }
        else
        {
          Current = CFAbsoluteTimeGetCurrent();
          v11 = self;
          objc_sync_enter(v11);
          lastResult = v11->_lastResult;
          if (lastResult)
            v14 = 0;
          else
            v14 = v11->_timeOfLastIncident <= 0.0;
          if (v11->_forceNotification || v14)
            goto LABEL_21;
          v15 = Current - v11->_timeOfLastIncident;
          v16 = lastResult == 1;
          v17 = 64;
          if (v16)
            v17 = 56;
          if (v15 > *(double *)((char *)&v11->super.isa + v17))
          {
LABEL_21:
            v11->_timeOfLastIncident = Current;
            -[MODiagnosticReporter _saveTimeOfLastIncident](v11, "_saveTimeOfLastIncident");
            objc_sync_exit(v11);

            _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v37 = v9;
              v38 = 2112;
              v39 = v10;
              _os_log_impl(&dword_2422B0000, v18, OS_LOG_TYPE_DEFAULT, "MODiagnosticReporter reporting incident [subtype=%@,context=%@]", buf, 0x16u);
            }

            if (v8 == CFSTR("XPCInterruption"))
              v19 = CFSTR("The connection with %@ has been interrupted. Please tap \"Accept\" to proceed to Tap-to-Radar");
            else
              v19 = CFSTR("Process %@ appears to hang. Please tap \"Accept\" to proceed to Tap-to-Radar");
            objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "processName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v19, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\nSubtype: %@\nContext: %@"), v22, v9, v10);
            v23 = objc_claimAutoreleasedReturnValue();

            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __55__MODiagnosticReporter_reportIncident_subtype_context___block_invoke;
            v32[3] = &unk_25133F9E0;
            v32[4] = v11;
            v33 = v8;
            v34 = v9;
            v35 = v10;
            -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:](v11, "showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:", CFSTR("Issue Detected"), v23, CFSTR("Cancel"), CFSTR("Accept"), v32);

            v11 = (MODiagnosticReporter *)v23;
          }
          else
          {
            _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11->_lastResult);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11->_timeOfLastIncident);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11->_refractoryPeriodAfterAcceptance);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11->_refractoryPeriodAfterRejection);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_onboardingStatus);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413570;
              v37 = v30;
              v38 = 2112;
              v39 = v31;
              v40 = 2112;
              v41 = v26;
              v42 = 2112;
              v43 = v27;
              v44 = 2112;
              v45 = v28;
              v46 = 2112;
              v47 = v29;
              _os_log_debug_impl(&dword_2422B0000, v24, OS_LOG_TYPE_DEBUG, "MODiagnosticReporter states [_lastResult=%@, _timeOfLastIncident=%@, interval=%@, _refractoryPeriodAfterAcceptance=%@, _refractoryPeriodAfterRejection=%@, _onboardingStatus=%@]", buf, 0x3Eu);

            }
            _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[MODiagnosticReporter reportIncident:subtype:context:].cold.3();

            objc_sync_exit(v11);
          }
        }
      }
      else
      {
        _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
        v11 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
          -[MODiagnosticReporter reportIncident:subtype:context:].cold.2();
      }
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
      v11 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
        -[MODiagnosticReporter reportIncident:subtype:context:].cold.1();
    }

  }
}

uint64_t __55__MODiagnosticReporter_reportIncident_subtype_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportIncidentAfterUserConsent:subtype:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)reportIncidentAfterUserConsent:(id)a3 subtype:(id)a4 context:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (void *)MEMORY[0x24BDD1760];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "processInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("[%@] %@ Detected"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeOfLastIncident);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Subtype: %@\n\nContext: %@\n\nApproximate timestamp: %@"), v11, v10, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("?Title=%@&Description=%@&Classification=%@&Reproducibility=%@&ComponentName=%@&ComponentVersion=%@&ComponentID=%@"), v15, v18, CFSTR("Crash/Hang/Data Loss"), CFSTR("I Didn't Try"), CFSTR("Journaling Suggestions"), CFSTR("All"), CFSTR("1330744"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tap-to-radar://new%@"), v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URLWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v22, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v24;
    _os_log_impl(&dword_2422B0000, v23, OS_LOG_TYPE_DEFAULT, "Triggering tap to radar with url [%@]", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "openURL:configuration:completionHandler:", v22, 0, &__block_literal_global_68);

}

void __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke_cold_1((uint64_t)v3, v4);

  }
}

- (double)maxTimeout
{
  return self->_maxTimeout;
}

- (void)_configureFromDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
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

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MODiagnosticReporter _configureFromDictionary:].cold.1((uint64_t)v4, v5, v6);

  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterRefractoryPeriodAfterAcceptance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "doubleValue");
      self->_refractoryPeriodAfterAcceptance = v9;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterRefractoryPeriodAfterRejection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      self->_refractoryPeriodAfterRejection = v12;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterAvoidNotification"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      self->_avoidNotification = objc_msgSend(v13, "BOOLValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterForceNotification"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      self->_forceNotification = objc_msgSend(v15, "BOOLValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterTimeOfLastNotification"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "doubleValue");
      self->_timeOfLastIncident = v19;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterIsInternalBuild"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      self->_isInternalBuild = objc_msgSend(v20, "BOOLValue");
    v29 = v11;
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterOnboardingStatus"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      self->_onboardingStatus = (int)objc_msgSend(v22, "intValue");
    v24 = v8;
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterMaxTimeout"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
      self->_maxTimeout = (double)(int)objc_msgSend(v25, "intValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterIsOnboardedOnJournalStudy"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      self->_isOnboardedOnJournalStudy = objc_msgSend(v27, "BOOLValue");

  }
}

- (void)_saveTimeOfLastIncident
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeOfLastIncident);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("DiagnosticReporterLastIncidentTime"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationAcceptanceCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_notificationHandlerWithNotificationRef:andOptionFlags:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2422B0000, v0, v1, "Unexpected notification handler call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)showUserNotificationWithTitle:(int *)a1 message:(NSObject *)a2 cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_2422B0000, a2, OS_LOG_TYPE_ERROR, "Could not create diagnostic reporter user notification (error:%i)", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_3();
}

- (void)showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2422B0000, v0, v1, "Could not create diagnostic reporter user notification runloop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2422B0000, v0, v1, "A notification is already being processed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportIncident:subtype:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_2422B0000, v0, v1, "Attempting to report MODiagnosticReporter incident but user is not onboarded in journaling suggestions. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportIncident:subtype:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_2422B0000, v0, v1, "Attempting to report MODiagnosticReporter incident but user is not onboarded in journal study. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportIncident:subtype:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2422B0000, v0, v1, "Attempting to report MODiagnosticReporter incident but recent incident is too close in the past. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportIncident:subtype:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_2422B0000, v0, v1, "Attempting to report MODiagnosticReporter incident but report feature is overriden as disabled. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2422B0000, a2, OS_LOG_TYPE_ERROR, "Launching TTR failed %@", (uint8_t *)&v2, 0xCu);
}

- (void)_configureFromDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5_0(&dword_2422B0000, a2, a3, "Received configuration %@", (uint8_t *)&v3);
}

@end
