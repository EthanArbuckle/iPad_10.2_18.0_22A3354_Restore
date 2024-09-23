@implementation DNDSMetricsManager

- (DNDSMetricsManager)init
{
  DNDSMetricsManager *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  uint64_t v6;
  DNDSBackingStore *metricsBackingStore;
  void *v8;
  uint64_t v9;
  DNDSMutableMetricsRecord *metricsRecord;
  DNDSMutableMetricsRecord *v11;
  DNDSMutableMetricsRecord *v12;
  id v13;
  uint64_t v14;
  NSCalendar *calendar;
  NSCalendar *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DNDSMetricsManager;
  v2 = -[DNDSMetricsManager init](&v19, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.server.MetricsManager"));
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_metricsBackingStoreFileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSMetricsRecord backingStoreWithFileURL:](DNDSMetricsRecord, "backingStoreWithFileURL:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    metricsBackingStore = v2->_metricsBackingStore;
    v2->_metricsBackingStore = (DNDSBackingStore *)v6;

    -[DNDSBackingStore readRecordWithError:](v2->_metricsBackingStore, "readRecordWithError:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    metricsRecord = v2->_metricsRecord;
    v2->_metricsRecord = (DNDSMutableMetricsRecord *)v9;

    if (!v2->_metricsRecord)
    {
      v11 = objc_alloc_init(DNDSMutableMetricsRecord);
      v12 = v2->_metricsRecord;
      v2->_metricsRecord = v11;

    }
    v13 = objc_alloc(MEMORY[0x1E0C99D48]);
    v14 = objc_msgSend(v13, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v14;

    v16 = v2->_calendar;
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v16, "setTimeZone:", v17);

  }
  return v2;
}

- (void)assertionTaken:(id)a3 withClientDetails:(id)a4 lockState:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  DNDSMetricsManager *v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__DNDSMetricsManager_assertionTaken_withClientDetails_lockState___block_invoke;
  v13[3] = &unk_1E86A6928;
  v14 = v9;
  v15 = v8;
  v16 = self;
  v17 = a5;
  v11 = v8;
  v12 = v9;
  dispatch_async(queue, v13);

}

void __65__DNDSMetricsManager_assertionTaken_withClientDetails_lockState___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
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
  NSObject *v16;
  id v17;
  __CFString *v18;
  id v19;
  id v20;
  id v21;
  __CFString *v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[16];

  v2 = objc_msgSend(a1[4], "isUserInteractionClient");
  objc_msgSend(a1[5], "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.donotdisturb.control-center.module"));
  v23 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.private.Carousel.control-center.DND.state"));
  objc_msgSend(a1[5], "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lifetime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v26 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "scheduleIdentifier");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("none");
  }
  objc_msgSend(a1[6], "_calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "component:fromDate:", 32, v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1[6], "_calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "component:fromDate:", 512, v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = DNDSLogMetrics;
  if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Sending assertion taken event", buf, 2u);
  }
  v27 = v7;
  v28 = v15;
  v17 = v15;
  v18 = v22;
  v19 = v7;
  v20 = v5;
  v21 = v25;
  AnalyticsSendEventLazy();
  objc_msgSend(a1[6], "_aggregateMetricsWithEnabled:manuallyEnabled:numberOfNewSessions:numberOfNewManualSessions:controlCenterPhone:controlCenterWatch:type:mode:dayOfWeek:", 1, v2, 1, v2, v24, v23, v20, v21, v17);
  objc_msgSend(a1[6], "sendMetricsHeartbeatsIfNeeded");

}

id __65__DNDSMetricsManager_assertionTaken_withClientDetails_lockState___block_invoke_201(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[12];
  void *v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("manual");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v2;
  v14 = *(_OWORD *)(a1 + 32);
  v12[1] = CFSTR("mode");
  v12[2] = CFSTR("type");
  v15 = *(_QWORD *)(a1 + 48);
  v12[3] = CFSTR("source");
  v12[4] = CFSTR("controlCenterPhone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 89));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  v12[5] = CFSTR("controlCenterWatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 90));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  v12[6] = CFSTR("schedule");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 91));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v18 = v5;
  v19 = v6;
  v12[7] = CFSTR("scheduleIdentifier");
  v12[8] = CFSTR("hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  v12[9] = CFSTR("lockState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 64);
  v21 = v8;
  v22 = v9;
  v12[10] = CFSTR("weekday");
  v12[11] = CFSTR("version");
  v23 = &unk_1E86DE550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, v12, 12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)sendMetricsHeartbeatsIfNeeded
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__DNDSMetricsManager_sendMetricsHeartbeatsIfNeeded__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__DNDSMetricsManager_sendMetricsHeartbeatsIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendDailyHeartbeatIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_sendWeeklyHeartbeatIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_sendMonthlyHeartbeatIfNeeded");
}

- (void)_aggregateMetricsWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfNewSessions:(int)a5 numberOfNewManualSessions:(int)a6 controlCenterPhone:(BOOL)a7 controlCenterWatch:(BOOL)a8 type:(id)a9 mode:(id)a10 dayOfWeek:(id)a11
{
  id v13;
  id v14;
  NSObject *v15;
  DNDSBackingStoreDictionaryContext *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  DNDSMutableDailyHeartbeatMetricsRecord *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  DNDSMutableWeeklyHeartbeatMetricsRecord *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  DNDSMutableMonthlyHeartbeatMetricsRecord *v32;
  DNDSMetricsManager *v33;
  DNDSBackingStoreDictionaryContext *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  _BOOL4 v63;
  int v65;
  int v66;
  _BOOL4 v67;
  int v68;
  _BOOL4 v69;
  int v70;
  int v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  id v81;
  uint8_t buf[16];

  v69 = a8;
  v67 = a7;
  v63 = a4;
  v62 = a3;
  v13 = a9;
  v14 = a10;
  v81 = a11;
  v15 = DNDSLogMetrics;
  if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Updating aggregated metrics", buf, 2u);
  }
  v65 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.one-hour"));
  v66 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.evening"));
  v68 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.morning"));
  v70 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.location"));
  v71 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.event"));
  v78 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.driving"));
  v79 = v14;
  v74 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DA8430]);
  v16 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _metricsDayStringForDate:](self, "_metricsDayStringForDate:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  -[DNDSMetricsRecord metricsByDay](self->_metricsRecord, "metricsByDay");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v18;
  objc_msgSend(v77, "valueForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[DNDSDailyHeartbeatMetricsRecord newWithDictionaryRepresentation:context:](DNDSDailyHeartbeatMetricsRecord, "newWithDictionaryRepresentation:context:", v19, v16);
  v21 = objc_msgSend(v20, "mutableCopy");

  v22 = (DNDSMutableDailyHeartbeatMetricsRecord *)v21;
  if (!v21)
    v22 = objc_alloc_init(DNDSMutableDailyHeartbeatMetricsRecord);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _metricsWeekStringForDate:](self, "_metricsWeekStringForDate:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  -[DNDSMetricsRecord metricsByWeek](self->_metricsRecord, "metricsByWeek");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)v24;
  objc_msgSend(v75, "valueForKey:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:context:](DNDSWeeklyHeartbeatMetricsRecord, "newWithDictionaryRepresentation:context:", v25, v16);
  v27 = (DNDSMutableWeeklyHeartbeatMetricsRecord *)objc_msgSend(v26, "mutableCopy");

  if (!v27)
    v27 = objc_alloc_init(DNDSMutableWeeklyHeartbeatMetricsRecord);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _metricsMonthStringForDate:](self, "_metricsMonthStringForDate:", v28);
  v29 = objc_claimAutoreleasedReturnValue();

  -[DNDSMetricsRecord metricsByMonth](self->_metricsRecord, "metricsByMonth");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)v29;
  objc_msgSend(v72, "valueForKey:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:context:](DNDSMonthlyHeartbeatMetricsRecord, "newWithDictionaryRepresentation:context:", v30, v16);
  v32 = (DNDSMutableMonthlyHeartbeatMetricsRecord *)objc_msgSend(v31, "mutableCopy");

  if (!v32)
    v32 = objc_alloc_init(DNDSMutableMonthlyHeartbeatMetricsRecord);
  v33 = self;
  if (v62)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabled:](v22, "setEnabled:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabled:](v27, "setEnabled:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabled:](v32, "setEnabled:", 1);
  }
  v34 = v16;
  if (v63)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setManuallyEnabled:](v22, "setManuallyEnabled:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setManuallyEnabled:](v27, "setManuallyEnabled:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setManuallyEnabled:](v32, "setManuallyEnabled:", 1);
  }
  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[DNDSHeartbeatMetricsRecord numberOfSessions](v22, "numberOfSessions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "numberWithInt:", objc_msgSend(v36, "intValue") + a5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableDailyHeartbeatMetricsRecord setNumberOfSessions:](v22, "setNumberOfSessions:", v37);

  v38 = (void *)MEMORY[0x1E0CB37E8];
  -[DNDSHeartbeatMetricsRecord numberOfSessions](v27, "numberOfSessions");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "numberWithInt:", objc_msgSend(v39, "intValue") + a5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableWeeklyHeartbeatMetricsRecord setNumberOfSessions:](v27, "setNumberOfSessions:", v40);

  v41 = (void *)MEMORY[0x1E0CB37E8];
  -[DNDSHeartbeatMetricsRecord numberOfSessions](v32, "numberOfSessions");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "numberWithInt:", objc_msgSend(v42, "intValue") + a5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableMonthlyHeartbeatMetricsRecord setNumberOfSessions:](v32, "setNumberOfSessions:", v43);

  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[DNDSHeartbeatMetricsRecord numberOfManualSessions](v22, "numberOfManualSessions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "numberWithInt:", objc_msgSend(v45, "intValue") + a6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableDailyHeartbeatMetricsRecord setNumberOfManualSessions:](v22, "setNumberOfManualSessions:", v46);

  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[DNDSHeartbeatMetricsRecord numberOfManualSessions](v27, "numberOfManualSessions");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "numberWithInt:", objc_msgSend(v48, "intValue") + a6);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableWeeklyHeartbeatMetricsRecord setNumberOfManualSessions:](v27, "setNumberOfManualSessions:", v49);

  v50 = (void *)MEMORY[0x1E0CB37E8];
  -[DNDSHeartbeatMetricsRecord numberOfManualSessions](v32, "numberOfManualSessions");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "numberWithInt:", objc_msgSend(v51, "intValue") + a6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableMonthlyHeartbeatMetricsRecord setNumberOfManualSessions:](v32, "setNumberOfManualSessions:", v52);

  if (v67)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledFromControlCenterPhone:](v22, "setEnabledFromControlCenterPhone:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledFromControlCenterPhone:](v27, "setEnabledFromControlCenterPhone:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledFromControlCenterPhone:](v32, "setEnabledFromControlCenterPhone:", 1);
  }
  if (v69)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledFromControlCenterWatch:](v22, "setEnabledFromControlCenterWatch:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledFromControlCenterWatch:](v27, "setEnabledFromControlCenterWatch:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledFromControlCenterWatch:](v32, "setEnabledFromControlCenterWatch:", 1);
  }
  if (v65)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledForOneHour:](v22, "setEnabledForOneHour:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledForOneHour:](v27, "setEnabledForOneHour:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledForOneHour:](v32, "setEnabledForOneHour:", 1);
  }
  if (v66)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledUntilEvening:](v22, "setEnabledUntilEvening:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledUntilEvening:](v27, "setEnabledUntilEvening:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledUntilEvening:](v32, "setEnabledUntilEvening:", 1);
  }
  if (v68)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledUntilMorning:](v22, "setEnabledUntilMorning:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledUntilMorning:](v27, "setEnabledUntilMorning:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledUntilMorning:](v32, "setEnabledUntilMorning:", 1);
  }
  if (v70)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledAtLocation:](v22, "setEnabledAtLocation:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledAtLocation:](v27, "setEnabledAtLocation:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledAtLocation:](v32, "setEnabledAtLocation:", 1);
  }
  if (v71)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledDuringEvent:](v22, "setEnabledDuringEvent:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledDuringEvent:](v27, "setEnabledDuringEvent:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledDuringEvent:](v32, "setEnabledDuringEvent:", 1);
  }
  if (v78)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledDrivingMode:](v22, "setEnabledDrivingMode:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledDrivingMode:](v27, "setEnabledDrivingMode:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledDrivingMode:](v32, "setEnabledDrivingMode:", 1);
  }
  if (v74)
  {
    -[DNDSMutableDailyHeartbeatMetricsRecord setEnabledSleepMode:](v22, "setEnabledSleepMode:", 1);
    -[DNDSMutableWeeklyHeartbeatMetricsRecord setEnabledSleepMode:](v27, "setEnabledSleepMode:", 1);
    -[DNDSMutableMonthlyHeartbeatMetricsRecord setEnabledSleepMode:](v32, "setEnabledSleepMode:", 1);
  }
  -[DNDSMutableDailyHeartbeatMetricsRecord setDayOfWeek:](v22, "setDayOfWeek:", v81);
  -[DNDSMetricsRecord metricsByDay](v33->_metricsRecord, "metricsByDay");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "mutableCopy");

  -[DNDSDailyHeartbeatMetricsRecord dictionaryRepresentationWithContext:](v22, "dictionaryRepresentationWithContext:", v16);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setValue:forKey:", v55, v80);

  -[DNDSMutableMetricsRecord setMetricsByDay:](v33->_metricsRecord, "setMetricsByDay:", v54);
  -[DNDSMetricsRecord metricsByWeek](v33->_metricsRecord, "metricsByWeek");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v56, "mutableCopy");

  -[DNDSHeartbeatMetricsRecord dictionaryRepresentationWithContext:](v27, "dictionaryRepresentationWithContext:", v16);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setValue:forKey:", v58, v76);

  -[DNDSMutableMetricsRecord setMetricsByWeek:](v33->_metricsRecord, "setMetricsByWeek:", v57);
  -[DNDSMetricsRecord metricsByMonth](v33->_metricsRecord, "metricsByMonth");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "mutableCopy");

  -[DNDSHeartbeatMetricsRecord dictionaryRepresentationWithContext:](v32, "dictionaryRepresentationWithContext:", v34);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setValue:forKey:", v61, v73);

  -[DNDSMutableMetricsRecord setMetricsByMonth:](v33->_metricsRecord, "setMetricsByMonth:", v60);
  -[DNDSMetricsManager _writeMetricsToStore:](v33, "_writeMetricsToStore:", v33->_metricsRecord);

}

- (void)_sendDailyHeartbeatIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  DNDSBackingStoreDictionaryContext *v11;
  void *v12;
  void *v13;
  id v14;
  DNDSMutableMetricsRecord *metricsRecord;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[16];

  -[DNDSMetricsRecord lastDailyHeartbeat](self->_metricsRecord, "lastDailyHeartbeat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _calendar](self, "_calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "compare:", v6);

  if (v7 == -1)
  {
    v8 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Sending daily metrics heartbeat", buf, 2u);
    }
    -[DNDSMetricsManager _dateForYesterday](self, "_dateForYesterday");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMetricsManager _metricsDayStringForDate:](self, "_metricsDayStringForDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, 0, 0);
    -[DNDSMetricsRecord metricsByDay](self->_metricsRecord, "metricsByDay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[DNDSDailyHeartbeatMetricsRecord newWithDictionaryRepresentation:context:](DNDSDailyHeartbeatMetricsRecord, "newWithDictionaryRepresentation:context:", v13, v11);

    if (v14)
    {
      v22 = v14;
      AnalyticsSendEventLazy();

    }
    metricsRecord = self->_metricsRecord;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMutableMetricsRecord setLastDailyHeartbeat:](metricsRecord, "setLastDailyHeartbeat:", v16);

    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMetricsManager _metricsDayStringForDate:](self, "_metricsDayStringForDate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSMetricsRecord metricsByDay](self->_metricsRecord, "metricsByDay");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v17, "setValue:forKey:", v21, v19);
    -[DNDSMutableMetricsRecord setMetricsByDay:](self->_metricsRecord, "setMetricsByDay:", v17);
    -[DNDSMetricsManager _writeMetricsToStore:](self, "_writeMetricsToStore:", self->_metricsRecord);

  }
}

id __49__DNDSMetricsManager__sendDailyHeartbeatIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[15];
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("manuallyEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "manuallyEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("numberOfSessions");
  objc_msgSend(*(id *)(a1 + 32), "numberOfSessions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("numberOfManualSessions");
  objc_msgSend(*(id *)(a1 + 32), "numberOfManualSessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  v18[4] = CFSTR("enabledFromControlCenterPhone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterPhone"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v13;
  v18[5] = CFSTR("enabledFromControlCenterWatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterWatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v2;
  v18[6] = CFSTR("enabledForOneHour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledForOneHour"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v3;
  v18[7] = CFSTR("enabledUntilEvening");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilEvening"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v4;
  v18[8] = CFSTR("enabledUntilMorning");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilMorning"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v5;
  v18[9] = CFSTR("enabledAtLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledAtLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v6;
  v18[10] = CFSTR("enabledDuringEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDuringEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v7;
  v18[11] = CFSTR("enabledDrivingMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDrivingMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v8;
  v18[12] = CFSTR("enabledSleepMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledSleepMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v9;
  v18[13] = CFSTR("dayOfWeek");
  objc_msgSend(*(id *)(a1 + 32), "dayOfWeek");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[14] = CFSTR("version");
  v19[13] = v10;
  v19[14] = &unk_1E86DE550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_sendWeeklyHeartbeatIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  DNDSBackingStoreDictionaryContext *v10;
  void *v11;
  void *v12;
  id v13;
  DNDSMutableMetricsRecord *metricsRecord;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[16];

  -[DNDSMetricsRecord lastWeeklyHeartbeat](self->_metricsRecord, "lastWeeklyHeartbeat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _startOfWeekWithDate:](self, "_startOfWeekWithDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compare:", v5);

  if (v6 == -1)
  {
    v7 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Sending weekly metrics heartbeat", buf, 2u);
    }
    -[DNDSMetricsManager _startOfLastWeek](self, "_startOfLastWeek");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMetricsManager _metricsWeekStringForDate:](self, "_metricsWeekStringForDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, 0, 0);
    -[DNDSMetricsRecord metricsByWeek](self->_metricsRecord, "metricsByWeek");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:context:](DNDSWeeklyHeartbeatMetricsRecord, "newWithDictionaryRepresentation:context:", v12, v10);

    if (v13)
    {
      v21 = v13;
      AnalyticsSendEventLazy();

    }
    metricsRecord = self->_metricsRecord;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMutableMetricsRecord setLastWeeklyHeartbeat:](metricsRecord, "setLastWeeklyHeartbeat:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMetricsManager _metricsWeekStringForDate:](self, "_metricsWeekStringForDate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSMetricsRecord metricsByWeek](self->_metricsRecord, "metricsByWeek");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v16, "setValue:forKey:", v20, v18);
    -[DNDSMutableMetricsRecord setMetricsByWeek:](self->_metricsRecord, "setMetricsByWeek:", v16);
    -[DNDSMetricsManager _writeMetricsToStore:](self, "_writeMetricsToStore:", self->_metricsRecord);

  }
}

id __50__DNDSMetricsManager__sendWeeklyHeartbeatIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[14];
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  v17[1] = CFSTR("manuallyEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "manuallyEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  v17[2] = CFSTR("numberOfSessions");
  objc_msgSend(*(id *)(a1 + 32), "numberOfSessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  v17[3] = CFSTR("numberOfManualSessions");
  objc_msgSend(*(id *)(a1 + 32), "numberOfManualSessions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v13;
  v17[4] = CFSTR("enabledFromControlCenterPhone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterPhone"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v2;
  v17[5] = CFSTR("enabledFromControlCenterWatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterWatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v3;
  v17[6] = CFSTR("enabledForOneHour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledForOneHour"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v4;
  v17[7] = CFSTR("enabledUntilEvening");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilEvening"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v5;
  v17[8] = CFSTR("enabledUntilMorning");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilMorning"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v6;
  v17[9] = CFSTR("enabledAtLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledAtLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v7;
  v17[10] = CFSTR("enabledDuringEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDuringEvent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v8;
  v17[11] = CFSTR("enabledDrivingMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDrivingMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v9;
  v17[12] = CFSTR("enabledSleepMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledSleepMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[13] = CFSTR("version");
  v18[12] = v10;
  v18[13] = &unk_1E86DE550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_sendMonthlyHeartbeatIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  DNDSBackingStoreDictionaryContext *v10;
  void *v11;
  void *v12;
  id v13;
  DNDSMutableMetricsRecord *metricsRecord;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[16];

  -[DNDSMetricsRecord lastMonthlyHeartbeat](self->_metricsRecord, "lastMonthlyHeartbeat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _startOfMonthWithDate:](self, "_startOfMonthWithDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compare:", v5);

  if (v6 == -1)
  {
    v7 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Sending monthly metrics heartbeat", buf, 2u);
    }
    -[DNDSMetricsManager _startOfLastMonth](self, "_startOfLastMonth");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMetricsManager _metricsMonthStringForDate:](self, "_metricsMonthStringForDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, 0, 0);
    -[DNDSMetricsRecord metricsByMonth](self->_metricsRecord, "metricsByMonth");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:context:](DNDSMonthlyHeartbeatMetricsRecord, "newWithDictionaryRepresentation:context:", v12, v10);

    if (v13)
    {
      v21 = v13;
      AnalyticsSendEventLazy();

    }
    metricsRecord = self->_metricsRecord;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMutableMetricsRecord setLastMonthlyHeartbeat:](metricsRecord, "setLastMonthlyHeartbeat:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMetricsManager _metricsMonthStringForDate:](self, "_metricsMonthStringForDate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSMetricsRecord metricsByMonth](self->_metricsRecord, "metricsByMonth");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v16, "setValue:forKey:", v20, v18);
    -[DNDSMutableMetricsRecord setMetricsByMonth:](self->_metricsRecord, "setMetricsByMonth:", v16);
    -[DNDSMetricsManager _writeMetricsToStore:](self, "_writeMetricsToStore:", self->_metricsRecord);

  }
}

id __51__DNDSMetricsManager__sendMonthlyHeartbeatIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[14];
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  v17[1] = CFSTR("manuallyEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "manuallyEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  v17[2] = CFSTR("numberOfSessions");
  objc_msgSend(*(id *)(a1 + 32), "numberOfSessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  v17[3] = CFSTR("numberOfManualSessions");
  objc_msgSend(*(id *)(a1 + 32), "numberOfManualSessions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v13;
  v17[4] = CFSTR("enabledFromControlCenterPhone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterPhone"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v2;
  v17[5] = CFSTR("enabledFromControlCenterWatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledFromControlCenterWatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v3;
  v17[6] = CFSTR("enabledForOneHour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledForOneHour"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v4;
  v17[7] = CFSTR("enabledUntilEvening");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilEvening"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v5;
  v17[8] = CFSTR("enabledUntilMorning");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledUntilMorning"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v6;
  v17[9] = CFSTR("enabledAtLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledAtLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v7;
  v17[10] = CFSTR("enabledDuringEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDuringEvent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v8;
  v17[11] = CFSTR("enabledDrivingMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledDrivingMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v9;
  v17[12] = CFSTR("enabledSleepMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enabledSleepMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[13] = CFSTR("version");
  v18[12] = v10;
  v18[13] = &unk_1E86DE550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_writeMetricsToStore:(id)a3
{
  DNDSBackingStore *metricsBackingStore;
  uint64_t v4;
  id v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  metricsBackingStore = self->_metricsBackingStore;
  v12 = 0;
  v4 = -[DNDSBackingStore writeRecord:error:](metricsBackingStore, "writeRecord:error:", a3, &v12);
  v5 = v12;
  if (v4)
  {
    if (v4 == 1)
    {
      v11 = DNDSLogMetrics;
      if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v5;
        v7 = "Metrics Failed to write store, but error can be ignored; error=%{public}@";
        v8 = v11;
        v9 = 12;
        goto LABEL_11;
      }
    }
    else if (v4 == 2)
    {
      v6 = DNDSLogMetrics;
      if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Metrics Wrote out store to file";
        v8 = v6;
        v9 = 2;
LABEL_11:
        _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    v10 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_ERROR))
      -[DNDSMetricsManager _writeMetricsToStore:].cold.1((uint64_t)v5, v10);
    _DNDSRequestRadar(CFSTR("Failed to write store"), v5, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/Metrics/DNDSMetricsManager.m"), 434);
  }

}

- (id)_metricsDayStringForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DNDSMetricsManager _dateFormatter](self, "_dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDateStyle:", 3);
  objc_msgSend(v5, "setTimeStyle:", 0);
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_metricsWeekStringForDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _startOfWeekWithDate:](self, "_startOfWeekWithDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _metricsDayStringForDate:](self, "_metricsDayStringForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_metricsMonthStringForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DNDSMetricsManager _dateFormatter](self, "_dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMMYYYY"));
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dateForYesterday
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "setDay:", -1);
  -[DNDSMetricsManager _calendar](self, "_calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v3, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_startOfWeekWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[DNDSMetricsManager _calendar](self, "_calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 540, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") - objc_msgSend(v6, "weekday") + 1);
  -[DNDSMetricsManager _calendar](self, "_calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_startOfLastWeek
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _startOfWeekWithDate:](self, "_startOfWeekWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMetricsManager _calendar](self, "_calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 540, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") - 7);
  -[DNDSMetricsManager _calendar](self, "_calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_startOfMonthWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[DNDSMetricsManager _calendar](self, "_calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 12, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMetricsManager _calendar](self, "_calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_startOfLastMonth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMetricsManager _startOfMonthWithDate:](self, "_startOfMonthWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMetricsManager _calendar](self, "_calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 12, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMonth:", objc_msgSend(v6, "month") - 1);
  -[DNDSMetricsManager _calendar](self, "_calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_calendar
{
  return self->_calendar;
}

- (id)_dateFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v2, "setLocale:", v3);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_metricsRecord, 0);
  objc_storeStrong((id *)&self->_metricsBackingStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_writeMetricsToStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Metrics Failed to write store, will request radar; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

@end
