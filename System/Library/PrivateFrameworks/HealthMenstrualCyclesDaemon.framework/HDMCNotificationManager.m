@implementation HDMCNotificationManager

- (HDMCNotificationManager)initWithProfile:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 deviceScopedStorageManager:(id)a6 notificationSyncManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDMCNotificationManager *v17;
  HDMCNotificationManager *v18;
  uint64_t v19;
  OS_dispatch_queue *queue;
  id v21;
  id v22;
  id v23;
  id WeakRetained;
  uint64_t v25;
  HDRestorableAlarm *scheduler;
  void *v27;
  id v28;
  uint64_t v29;
  HDKeyValueDomain *fertileWindowNotificationStateKeyValueDomain;
  HDMCOvulationConfirmationStateManager *v31;
  id v32;
  uint64_t v33;
  HDMCOvulationConfirmationStateManager *ovulationConfirmationStateManager;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  HDKeyValueDomain *unconfirmedDeviationStateKeyValueDomain;
  uint64_t v40;
  HDKeyValueDomain *deviationDismissalKeyValueDomain;
  id v43;
  objc_super v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)HDMCNotificationManager;
  v17 = -[HDMCNotificationManager init](&v44, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_analysisManager, a4);
    objc_storeWeak((id *)&v18->_profile, v12);
    HKCreateSerialDispatchQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v18->_notificationSyncManager, a7);
    v21 = objc_alloc(MEMORY[0x24BE40BB0]);
    v43 = v16;
    v22 = v15;
    v23 = v13;
    WeakRetained = objc_loadWeakRetained((id *)&v18->_profile);
    v25 = objc_msgSend(v21, "initWithProfile:clientIdentifier:eventHandlerQueue:", WeakRetained, CFSTR("HDMCNotificationManager"), v18->_queue);
    scheduler = v18->_scheduler;
    v18->_scheduler = (HDRestorableAlarm *)v25;

    objc_storeStrong((id *)&v18->_settingsManager, a5);
    objc_storeStrong((id *)&v18->_deviceScopedStorageManager, a6);
    v27 = (void *)MEMORY[0x24BE40AD0];
    v28 = objc_loadWeakRetained((id *)&v18->_profile);
    objc_msgSend(v27, "hdmc_syncedUnprotectedDomainWithProfile:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    fertileWindowNotificationStateKeyValueDomain = v18->_fertileWindowNotificationStateKeyValueDomain;
    v18->_fertileWindowNotificationStateKeyValueDomain = (HDKeyValueDomain *)v29;

    v31 = [HDMCOvulationConfirmationStateManager alloc];
    v32 = objc_loadWeakRetained((id *)&v18->_profile);
    v33 = -[HDMCOvulationConfirmationStateManager initWithProfile:settingsManager:queue:](v31, "initWithProfile:settingsManager:queue:", v32, v14, v18->_queue);
    ovulationConfirmationStateManager = v18->_ovulationConfirmationStateManager;
    v18->_ovulationConfirmationStateManager = (HDMCOvulationConfirmationStateManager *)v33;

    v35 = (void *)MEMORY[0x24BE40AD0];
    v36 = objc_loadWeakRetained((id *)&v18->_profile);
    v37 = v35;
    v13 = v23;
    v15 = v22;
    v16 = v43;
    objc_msgSend(v37, "hdmc_menstrualCyclesUnconfirmedDeviationNotificationStateSyncedUnprotectedDomainWithProfile:", v36);
    v38 = objc_claimAutoreleasedReturnValue();
    unconfirmedDeviationStateKeyValueDomain = v18->_unconfirmedDeviationStateKeyValueDomain;
    v18->_unconfirmedDeviationStateKeyValueDomain = (HDKeyValueDomain *)v38;

    objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", v12);
    v40 = objc_claimAutoreleasedReturnValue();
    deviationDismissalKeyValueDomain = v18->_deviationDismissalKeyValueDomain;
    v18->_deviationDismissalKeyValueDomain = (HDKeyValueDomain *)v40;

  }
  return v18;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HDMCNotificationManager_start__block_invoke;
  block[3] = &unk_24DB21D60;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __32__HDMCNotificationManager_start__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerObserver:queue:userInitiated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __32__HDMCNotificationManager_start__block_invoke_2;
  v8 = &unk_24DB21F18;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "beginReceivingEventsWithHandler:", &v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v5, v6, v7, v8);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:featureIdentifier:queue:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDD2E38], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllScheduledNotificationsIfNotEnabled");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __32__HDMCNotificationManager_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);

}

- (void)invalidate
{
  void *v3;
  id WeakRetained;

  -[HDMCAnalysisManager unregisterObserver:](self->_analysisManager, "unregisterObserver:", self);
  -[HDRestorableAlarm invalidate](self->_scheduler, "invalidate");
  -[HKMCSettingsManager removeObserver:](self->_settingsManager, "removeObserver:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (id)scheduledNotificationsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[HDRestorableAlarm allScheduledEventsWithError:](self->_scheduler, "allScheduledEventsWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59__HDMCNotificationManager_scheduledNotificationsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BE46BA8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "hdmc_categoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dueDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithCategory:dueDateComponents:", v5, v6);
  return v7;
}

- (id)_currentDate
{
  NSDate *unitTest_currentDateOverride;

  unitTest_currentDateOverride = self->_unitTest_currentDateOverride;
  if (unitTest_currentDateOverride)
    return unitTest_currentDateOverride;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_unitTest_didSkipNotificationForDueEvent:(id)a3 reason:(int64_t)a4
{
  void (**unitTest_didSkipNotificationForDueEventHandler)(id, id, int64_t);

  unitTest_didSkipNotificationForDueEventHandler = (void (**)(id, id, int64_t))self->_unitTest_didSkipNotificationForDueEventHandler;
  if (unitTest_didSkipNotificationForDueEventHandler)
    unitTest_didSkipNotificationForDueEventHandler[2](unitTest_didSkipNotificationForDueEventHandler, a3, a4);
}

- (void)didUpdateAnalysis:(id)a3
{
  id v4;
  int v5;
  HDKeyValueDomain *deviationDismissalKeyValueDomain;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  os_log_t *v11;
  NSInteger v12;
  void *v13;
  id v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  HDRestorableAlarm *scheduler;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[HKMCAnalysis isEqual:](self->_lastAnalysis, "isEqual:", v4);
  deviationDismissalKeyValueDomain = self->_deviationDismissalKeyValueDomain;
  v30 = 0;
  -[HDKeyValueDomain hdmc_unconfirmedDeviationDismissalDayIndexWithError:](deviationDismissalKeyValueDomain, "hdmc_unconfirmedDeviationDismissalDayIndexWithError:", &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v30;
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = v8 == 0;
  v11 = (os_log_t *)MEMORY[0x24BDD3030];
  if (!v10 && (_HKInitializeLogging(), os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR)))
  {
    -[HDMCNotificationManager didUpdateAnalysis:].cold.1();
    if (!v5)
      goto LABEL_12;
  }
  else if (!v5)
  {
    goto LABEL_12;
  }
  v12 = -[NSNumber integerValue](self->_lastDismissalDayIndex, "integerValue");
  if (v12 == objc_msgSend(v7, "integerValue"))
  {
    v27 = v9;
    -[HDMCNotificationManager scheduledNotificationsWithError:](self, "scheduledNotificationsWithError:", &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;

    _HKInitializeLogging();
    v15 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = (void *)objc_opt_class();
      v18 = (void *)MEMORY[0x24BDD16E0];
      v19 = v17;
      objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v17;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_21961B000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping notification reschedule from identical analysis, current notifications: %@, %@", buf, 0x20u);

    }
    v9 = v14;
    goto LABEL_15;
  }
LABEL_12:
  _HKInitializeLogging();
  v22 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    v24 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v32 = v24;
    v25 = v24;
    _os_log_impl(&dword_21961B000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rescheduling notifications based on analysis update", buf, 0xCu);

  }
  scheduler = self->_scheduler;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __45__HDMCNotificationManager_didUpdateAnalysis___block_invoke;
  v28[3] = &unk_24DB21F80;
  v28[4] = self;
  v29 = v4;
  -[HDRestorableAlarm checkForDueEventsWithCompletion:](scheduler, "checkForDueEventsWithCompletion:", v28);

LABEL_15:
}

void __45__HDMCNotificationManager_didUpdateAnalysis___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6;
  void *v7;

  v6 = a4;
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __45__HDMCNotificationManager_didUpdateAnalysis___block_invoke_cold_1(a1, v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_rescheduleNotificationsForAnalysis:", *(_QWORD *)(a1 + 40));

}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDMCNotificationManager _queue_notificationOrSensorInputSettingsDidChange](self, "_queue_notificationOrSensorInputSettingsDidChange");
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  HKMCAnalysis *lastAnalysis;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDMCNotificationManager _queue_notificationOrSensorInputSettingsDidChange](self, "_queue_notificationOrSensorInputSettingsDidChange");
  if (-[HKMCSettingsManager someNotificationsEnabled](self->_settingsManager, "someNotificationsEnabled"))
  {
    -[HDMCAnalysisManager currentAnalysis](self->_analysisManager, "currentAnalysis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x24BDD3030];
    v6 = *MEMORY[0x24BDD3030];
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v5;
        *(_DWORD *)v13 = 138543362;
        *(_QWORD *)&v13[4] = objc_opt_class();
        v8 = *(id *)&v13[4];
        _os_log_impl(&dword_21961B000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification settings changed: rescheduling notifications using current analysis", v13, 0xCu);

      }
      -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:](self, "_queue_rescheduleNotificationsForAnalysis:", v4, *(_OWORD *)v13);
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[HDMCNotificationManager settingsManagerDidUpdateNotificationSettings:].cold.1(v5);
    }

  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      *(_DWORD *)v13 = 138543362;
      *(_QWORD *)&v13[4] = objc_opt_class();
      v11 = *(id *)&v13[4];
      _os_log_impl(&dword_21961B000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications not enabled", v13, 0xCu);

    }
    lastAnalysis = self->_lastAnalysis;
    self->_lastAnalysis = 0;

    -[HDMCNotificationManager _queue_removeAllScheduledNotificationsIfNotEnabled](self, "_queue_removeAllScheduledNotificationsIfNotEnabled");
  }
}

- (id)_requestFromAlarmEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(v3, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hkmc_requestForCategoryIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDMCNotificationManager _requestFromAlarmEvent:].cold.1();
  }

  return v6;
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HDMCNotificationSyncManager *notificationSyncManager;
  uint64_t v17;
  id v18;
  int v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  HDMCNotificationManager *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  NSObject *v79;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  HDMCOvulationConfirmationStateManager *ovulationConfirmationStateManager;
  void *v92;
  id v93;
  HDMCOvulationConfirmationStateManager *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i;
  uint64_t v105;
  id WeakRetained;
  void *v107;
  NSObject *queue;
  void *v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  uint64_t v114;
  id v115;
  id v116;
  void *v117;
  id v118;
  id v119;
  char v120;
  id v121;
  HDMCNotificationManager *v122;
  id obj;
  _QWORD block[4];
  id v125;
  id v126;
  HDMCNotificationManager *v127;
  _QWORD v128[6];
  id v129;
  NSObject *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  id v141;
  _BYTE v142[128];
  uint8_t v143[128];
  uint8_t buf[4];
  void *v145;
  __int16 v146;
  void *v147;
  __int16 v148;
  id v149;
  uint64_t v150;

  v150 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3030];
  v122 = self;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_opt_class();
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = v10;
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v145 = v10;
    v146 = 2114;
    v147 = v13;
    v148 = 2112;
    v149 = v7;
    _os_log_impl(&dword_21961B000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %{public}@ due events: %@", buf, 0x20u);

    self = v122;
  }
  -[HDMCNotificationManager _currentDate](self, "_currentDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingTimeInterval:", -86400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  notificationSyncManager = self->_notificationSyncManager;
  v141 = 0;
  -[HDMCNotificationSyncManager holdInstructionCategoryIdentifiersWithError:](notificationSyncManager, "holdInstructionCategoryIdentifiersWithError:", &v141);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v141;
  v118 = (id)v17;
  if (!v17)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:].cold.4();
    v118 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  }
  v110 = v6;
  v19 = -[HKMCSettingsManager someNotificationsEnabledAndSupported](self->_settingsManager, "someNotificationsEnabledAndSupported");
  v20 = v19;
  if (v19)
  {
    -[HDMCDeviceScopedStorageManager accountDevicesInfoWithError:](self->_deviceScopedStorageManager, "accountDevicesInfoWithError:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v21, "shouldFireNotifications");

  }
  else
  {
    v120 = 0;
  }
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  obj = v7;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v143, 16);
  v117 = v15;
  v109 = v18;
  if (!v22)
  {
    v119 = 0;
    v115 = 0;
    v116 = 0;
    goto LABEL_64;
  }
  v23 = v22;
  v119 = 0;
  v115 = 0;
  v116 = 0;
  v24 = *(_QWORD *)v138;
  v114 = *MEMORY[0x24BE46A60];
  do
  {
    v25 = 0;
    do
    {
      if (*(_QWORD *)v138 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v25);
      if ((v20 & 1) == 0)
      {
        _HKInitializeLogging();
        v36 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
        {
          v37 = v36;
          v38 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v145 = v38;
          v146 = 2112;
          v147 = v26;
          v39 = v38;
          _os_log_impl(&dword_21961B000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for event; notifications are not enabled and supported: %@",
            buf,
            0x16u);

        }
        v33 = self;
        v34 = v26;
        v35 = 0;
        goto LABEL_27;
      }
      if ((v120 & 1) == 0)
      {
        _HKInitializeLogging();
        v40 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
        {
          v41 = v40;
          v42 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v145 = v42;
          v146 = 2112;
          v147 = v26;
          v43 = v42;
          _os_log_impl(&dword_21961B000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for event; other health devices have a higher algorithm version: %@",
            buf,
            0x16u);

        }
        v33 = self;
        v34 = v26;
        v35 = 1;
        goto LABEL_27;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * v25), "currentDueDate", v109);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "hk_isBeforeDate:", v15);

      if (v28)
      {
        _HKInitializeLogging();
        v29 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          v31 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v145 = v31;
          v146 = 2112;
          v147 = v26;
          v32 = v31;
          _os_log_impl(&dword_21961B000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for event due more than one day ago: %@", buf, 0x16u);

        }
        v33 = self;
        v34 = v26;
        v35 = 2;
LABEL_27:
        -[HDMCNotificationManager _unitTest_didSkipNotificationForDueEvent:reason:](v33, "_unitTest_didSkipNotificationForDueEvent:reason:", v34, v35, v109);
        goto LABEL_28;
      }
      v44 = (void *)MEMORY[0x219A3147C]();
      objc_msgSend(v26, "hdmc_categoryIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v118, "containsObject:", v45))
      {
        _HKInitializeLogging();
        v46 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
        {
          v47 = v46;
          v48 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v145 = v48;
          v146 = 2114;
          v147 = v45;
          v49 = v48;
          _os_log_impl(&dword_21961B000, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification due to hold: %{public}@", buf, 0x16u);

          v15 = v117;
        }
        -[HDMCNotificationManager _unitTest_didSkipNotificationForDueEvent:reason:](self, "_unitTest_didSkipNotificationForDueEvent:reason:", v26, 3);
        goto LABEL_60;
      }
      if (objc_msgSend(v45, "isEqualToString:", v114))
      {
        if (v116)
        {
          objc_msgSend(v116, "currentDueDate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "currentDueDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v50, "hk_isBeforeDate:", v51);

          if (v52)
          {
            _HKInitializeLogging();
            v53 = (void *)*MEMORY[0x24BDD3030];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
            {
              v54 = v53;
              v55 = (void *)objc_opt_class();
              v111 = v55;
              objc_msgSend(v26, "eventIdentifier");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v145 = v55;
              v146 = 2112;
              v147 = v56;
              _os_log_impl(&dword_21961B000, v54, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for earlier event: %@", buf, 0x16u);

            }
            v57 = v26;

            v116 = v57;
          }
          v15 = v117;
        }
        else
        {
          v116 = v26;
        }
      }
      HKMCPeriodNotificationCategories();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "containsObject:", v45);

      if (!v59)
      {
        HKMCFertileWindowNotificationCategories();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "containsObject:", v45);

        if (v69)
        {
          if (v119)
          {
            objc_msgSend(v119, "currentDueDate");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "currentDueDate");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v70, "hk_isBeforeDate:", v71);

            if (v72)
            {
              _HKInitializeLogging();
              v73 = (void *)*MEMORY[0x24BDD3030];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
              {
                v74 = v73;
                v75 = (void *)objc_opt_class();
                v113 = v75;
                objc_msgSend(v26, "eventIdentifier");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v145 = v75;
                v146 = 2112;
                v147 = v76;
                _os_log_impl(&dword_21961B000, v74, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for earlier event: %@", buf, 0x16u);

              }
              v77 = v26;

              v119 = v77;
            }
            goto LABEL_54;
          }
          v119 = v26;
        }
        else
        {
          _HKInitializeLogging();
          v78 = (void *)*MEMORY[0x24BDD3030];
          self = v122;
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
            goto LABEL_60;
          v79 = v78;
          v80 = (void *)objc_opt_class();
          v81 = v80;
          objc_msgSend(v26, "eventIdentifier");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v145 = v80;
          v146 = 2112;
          v147 = v82;
          _os_log_error_impl(&dword_21961B000, v79, OS_LOG_TYPE_ERROR, "[%{public}@] Skipping sending notification for unknown event identifier type: %@", buf, 0x16u);

          v15 = v117;
        }
LABEL_59:
        self = v122;
        goto LABEL_60;
      }
      if (!v115)
      {
        v115 = v26;
        goto LABEL_59;
      }
      objc_msgSend(v115, "currentDueDate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentDueDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "hk_isBeforeDate:", v61);

      if (v62)
      {
        _HKInitializeLogging();
        v63 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
        {
          v64 = v63;
          v65 = (void *)objc_opt_class();
          v112 = v65;
          objc_msgSend(v26, "eventIdentifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v145 = v65;
          v146 = 2112;
          v147 = v66;
          _os_log_impl(&dword_21961B000, v64, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping sending notification for earlier event: %@", buf, 0x16u);

        }
        v67 = v26;

        v115 = v67;
      }
LABEL_54:
      self = v122;
      v15 = v117;
LABEL_60:

      objc_autoreleasePoolPop(v44);
LABEL_28:
      ++v25;
    }
    while (v23 != v25);
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v143, 16);
    v23 = v83;
  }
  while (v83);
LABEL_64:

  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  v85 = v110;
  if (!v116)
    goto LABEL_67;
  -[HDMCNotificationManager _requestFromAlarmEvent:](self, "_requestFromAlarmEvent:");
  v86 = objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    v87 = (void *)v86;
    objc_msgSend(v84, "addObject:", v86);

LABEL_67:
    if (v115)
    {
      -[HDMCNotificationManager _requestFromAlarmEvent:](self, "_requestFromAlarmEvent:");
      v88 = objc_claimAutoreleasedReturnValue();
      if (v88)
      {
        v89 = (void *)v88;
        objc_msgSend(v84, "addObject:", v88);

        goto LABEL_70;
      }
    }
    else
    {
LABEL_70:
      if (!v119)
        goto LABEL_84;
      v90 = objc_msgSend(v119, "hdmc_fertileWindowEndDayIndex");
      ovulationConfirmationStateManager = self->_ovulationConfirmationStateManager;
      v136 = 0;
      -[HDMCOvulationConfirmationStateManager scheduledNotificationFertileWindowEndDayIndexWithEvent:error:](ovulationConfirmationStateManager, "scheduledNotificationFertileWindowEndDayIndexWithEvent:error:", v119, &v136);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v136;
      if (v92 && objc_msgSend(v92, "integerValue"))
      {
        v90 = objc_msgSend(v92, "integerValue");
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:].cold.3();
      }
      v94 = self->_ovulationConfirmationStateManager;
      v135 = v93;
      -[HDMCOvulationConfirmationStateManager scheduledNotificationDaysShiftedFromCalendarMethodWithEvent:error:](v94, "scheduledNotificationDaysShiftedFromCalendarMethodWithEvent:error:", v119, &v135, v109);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v135;

      if (!v95)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:].cold.2();
      }
      v97 = (void *)MEMORY[0x24BDF8858];
      objc_msgSend(v119, "hdmc_categoryIdentifier");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "hkmc_requestForCategoryIdentifier:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", v98, v90, v95);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (v99)
      {
        objc_msgSend(v84, "addObject:", v99);
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCNotificationManager _queue_alarm:didReceiveDueEvents:].cold.1();
      }

      if (v99)
      {
LABEL_84:
        v100 = dispatch_group_create();
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        v134 = 0u;
        v121 = v84;
        v101 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v131, v142, 16);
        if (v101)
        {
          v102 = v101;
          v103 = *(_QWORD *)v132;
          do
          {
            for (i = 0; i != v102; ++i)
            {
              if (*(_QWORD *)v132 != v103)
                objc_enumerationMutation(v121);
              v105 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i);
              dispatch_group_enter(v100);
              WeakRetained = objc_loadWeakRetained((id *)&v122->_profile);
              objc_msgSend(WeakRetained, "notificationManager");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v128[0] = MEMORY[0x24BDAC760];
              v128[1] = 3221225472;
              v128[2] = __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke;
              v128[3] = &unk_24DB21FA8;
              v128[4] = v122;
              v128[5] = v105;
              v129 = v119;
              v130 = v100;
              objc_msgSend(v107, "postNotificationWithRequest:completion:", v105, v128);

            }
            v102 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v131, v142, 16);
          }
          while (v102);
        }

        queue = v122->_queue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_208;
        block[3] = &unk_24DB21FD0;
        v85 = v110;
        v125 = v110;
        v126 = obj;
        v127 = v122;
        dispatch_group_async(v100, queue, block);

        v15 = v117;
      }
    }
  }

}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  void *v25;
  uint64_t v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  id WeakRetained;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  uint64_t v69;
  const __CFString *v70;
  void *v71;
  unsigned int v72;
  const __CFString *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "categoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE46A68];
    v9 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE46A68]);

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_currentDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v79 = 0;
      v12 = objc_msgSend(v11, "hdmc_setUpdatedFertileWindowNotificationFireDate:error:", v10, &v79);
      v13 = v79;
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x24BDD3030];
      v15 = *MEMORY[0x24BDD3030];
      if ((v12 & 1) != 0)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v14;
          v17 = (void *)objc_opt_class();
          v18 = v17;
          HKSensitiveLogItem();
          v19 = v5;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v81 = v17;
          v82 = 2112;
          v83 = v20;
          _os_log_impl(&dword_21961B000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully saved date fired for update fertile window notification in key value domain with date: %@", buf, 0x16u);

          v5 = v19;
        }
        objc_msgSend(*(id *)(a1 + 32), "_triggerImmediateSyncWithReason:", CFSTR("hdmc_setUpdatedFertileWindowNotificationFireDate"));
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_5(a1 + 32, v14);
      }

    }
    v23 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    v24 = (id *)(a1 + 32);
    v25 = *(void **)(v23 + 64);
    v26 = *(_QWORD *)(v23 + 40);
    v78 = 0;
    v27 = objc_msgSend(v25, "transitionToFiredNotificationStateWithRequest:settingsManager:error:", v22, v26, &v78);
    v28 = v78;
    if ((v27 & 1) == 0)
    {
      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_4(a1 + 32, v29);
    }
    objc_msgSend(*(id *)(a1 + 40), "content");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "categoryIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BE46A60]);

    if (v32)
    {
      v33 = (void *)*((_QWORD *)*v24 + 9);
      v77 = 0;
      objc_msgSend(v33, "hdmc_menstrualCyclesUnconfirmedDeviationNotificationGetStateWithError:", &v77);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v77;
      if (v34)
      {
        v36 = v28;
        objc_msgSend(*v24, "_currentDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "computeFiredStateWithCurrentDayIndex:", objc_msgSend(v37, "hk_dayIndexWithCalendar:", v38));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          v40 = (void *)*((_QWORD *)*v24 + 9);
          v76 = 0;
          v41 = objc_msgSend(v40, "hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:error:", v39, &v76);
          v42 = v76;
          if ((v41 & 1) != 0)
          {
            objc_msgSend(*v24, "_triggerImmediateSyncWithReason:", CFSTR("UnconfirmedDeviationNotificationSetValuesWithState"));
          }
          else
          {
            _HKInitializeLogging();
            v45 = (void *)*MEMORY[0x24BDD3030];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
              __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_3(a1 + 32, v45);
          }

        }
        else
        {
          _HKInitializeLogging();
          v44 = (void *)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
            __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_2(a1 + 32, v44);
        }

        v28 = v36;
      }
      else
      {
        _HKInitializeLogging();
        v43 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(a1 + 32, v43);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "hdmc_categoryIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v46, "isEqualToString:", v8) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "hdmc_categoryIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "content");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "categoryIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v47, "isEqualToString:", v49);

      if (v50)
      {
        v74 = (void *)MEMORY[0x24BE46BB8];
        objc_msgSend(*(id *)(a1 + 40), "content");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "categoryIdentifier");
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v52;
        v54 = CFSTR("nil");
        if (v52)
          v54 = (const __CFString *)v52;
        v73 = v54;
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(WeakRetained, "notificationManager");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v56, "areHealthNotificationsAuthorized");
        v75 = v5;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "hdmc_fertileWindowDayShift"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)MEMORY[0x24BDD16E0];
        v58 = v28;
        v59 = objc_msgSend(*(id *)(a1 + 48), "hdmc_fertileWindowEndDayIndex");
        objc_msgSend(*(id *)(a1 + 32), "_currentDate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v59 - objc_msgSend(v60, "hk_dayIndexWithCalendar:", v61);
        v28 = v58;
        objc_msgSend(v57, "numberWithInteger:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "submitMetricForCategory:areHealthNotificationsAuthorized:numberOfDaysShiftedForFertileWindow:numberOfDaysOffsetFromFertileWindowEnd:numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:internalLiveOnCycleFactorOverrideEnabled:", v73, v72, v71, v63, 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "internalCycleFactorsOverrideEnabled"));

        v5 = v75;
        goto LABEL_40;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "_notificationCategoriesWithBasicAnalytics");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "content");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "categoryIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v64, "containsObject:", v66);

    if (!v67)
    {
LABEL_41:

      goto LABEL_42;
    }
    v68 = (void *)MEMORY[0x24BE46BB8];
    objc_msgSend(*(id *)(a1 + 40), "content");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "categoryIdentifier");
    v69 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v69;
    if (v69)
      v70 = (const __CFString *)v69;
    else
      v70 = CFSTR("nil");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "notificationManager");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "submitMetricForCategory:areHealthNotificationsAuthorized:internalLiveOnCycleFactorOverrideEnabled:", v70, objc_msgSend(v56, "areHealthNotificationsAuthorized"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "internalCycleFactorsOverrideEnabled"));
LABEL_40:

    goto LABEL_41;
  }
  _HKInitializeLogging();
  v21 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_6(a1, v21);
LABEL_42:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_208(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v4 = objc_msgSend(v2, "removeEvents:error:", v3, &v13);
  v5 = v13;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 40);
      v10 = v8;
      v11 = objc_msgSend(v9, "count");
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v15 = v8;
      v16 = 2048;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_21961B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error removing %ld due events (%@) after firing notification: %{public}@", buf, 0x2Au);

    }
  }

}

- (id)_notificationCategoriesWithBasicAnalytics
{
  void *v2;
  void *v3;
  void *v4;

  HKMCAllNotificationCategories();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCSensorBasedFertileWindowNotificationCategories();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByExcludingObjectsInArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_periodEventFromNotificationCategory:(id)a3 notificationFireDayIndex:(int64_t)a4
{
  HKMCSettingsManager *settingsManager;
  id v7;
  void *v8;
  void *v9;

  settingsManager = self->_settingsManager;
  v7 = a3;
  -[HKMCSettingsManager hdmc_dateComponentsForMenstruationNotificationOnDayIndex:](settingsManager, "hdmc_dateComponentsForMenstruationNotificationOnDayIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRestorableAlarm eventWithIdentifier:dueDateComponents:eventOptions:](self->_scheduler, "eventWithIdentifier:dueDateComponents:eventOptions:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_queue_rescheduleNotificationsForAnalysis:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  os_log_t *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id WeakRetained;
  void *v46;
  void *v47;
  char v48;
  HDKeyValueDomain *unconfirmedDeviationStateKeyValueDomain;
  void *v50;
  id v51;
  HDKeyValueDomain *deviationDismissalKeyValueDomain;
  void *v53;
  NSObject *v54;
  os_log_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  NSObject *v67;
  void *v68;
  id v69;
  void *v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  HDKeyValueDomain *v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  HDRestorableAlarm *scheduler;
  void *v84;
  void *v85;
  void *v86;
  os_log_t v87;
  NSObject *v88;
  void *v89;
  os_log_t *v90;
  void *v91;
  NSObject *v92;
  id v93;
  void *v94;
  void *v95;
  char v96;
  HDKeyValueDomain *fertileWindowNotificationStateKeyValueDomain;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  void *v108;
  NSObject *v109;
  os_log_t *v110;
  os_log_t v111;
  NSObject *v112;
  void *v113;
  id v114;
  HDMCOvulationConfirmationStateManager *ovulationConfirmationStateManager;
  HKMCSettingsManager *settingsManager;
  HDRestorableAlarm *v117;
  void *v118;
  id v119;
  os_log_t v120;
  NSObject *v121;
  void *v122;
  void *v123;
  id v124;
  NSObject *v125;
  HDRestorableAlarm *v126;
  void *v127;
  void *v128;
  id v129;
  HDMCNotificationSyncManager *notificationSyncManager;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  os_log_t v135;
  NSObject *v136;
  void *v137;
  id v138;
  id v139;
  void *v140;
  void *v141;
  NSObject *v142;
  NSObject *v143;
  id v144;
  id v145;
  os_log_t v146;
  os_log_t v147;
  os_log_t v148;
  NSObject *v149;
  os_log_t log;
  NSObject *logb;
  os_log_t logc;
  os_log_t loga;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id v164;
  id v165;
  id v166;
  os_log_t v167;
  id v168;
  id v169;
  uint64_t v170;
  uint8_t buf[4];
  void *v172;
  __int16 v173;
  os_log_t v174;
  __int16 v175;
  void *v176;
  __int16 v177;
  void *v178;
  uint64_t v179;

  v179 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDMCNotificationManager _currentDate](self, "_currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v7 = -[HKMCSettingsManager menstruationNotificationsEnabled](self->_settingsManager, "menstruationNotificationsEnabled");
  v8 = (os_log_t *)MEMORY[0x24BDD3030];
  if (v7)
  {
    objc_msgSend(v4, "hdmc_beforePeriodStartNotification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = v9;
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "category");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMCNotificationManager _periodEventFromNotificationCategory:notificationFireDayIndex:](self, "_periodEventFromNotificationCategory:notificationFireDayIndex:", v11, objc_msgSend(v10, "fireOnDayIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "currentDueDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hk_isAfterDate:", v5);

      if (v14)
      {
        objc_msgSend(v6, "addObject:", v12);
      }
      else
      {
        _HKInitializeLogging();
        v15 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          v17 = (void *)objc_opt_class();
          v18 = v17;
          objc_msgSend(v160, "category");
          v19 = v6;
          v20 = v8;
          v21 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v172 = v17;
          v173 = 2112;
          v174 = v21;
          _os_log_impl(&dword_21961B000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

          v8 = v20;
          v6 = v19;

        }
      }

    }
    objc_msgSend(v4, "hdmc_afterPeriodStartNotification");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "category");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMCNotificationManager _periodEventFromNotificationCategory:notificationFireDayIndex:](self, "_periodEventFromNotificationCategory:notificationFireDayIndex:", v24, objc_msgSend(v23, "fireOnDayIndex"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "currentDueDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "hk_isAfterDate:", v5);

      if (v27)
      {
        objc_msgSend(v6, "addObject:", v25);
      }
      else
      {
        _HKInitializeLogging();
        v28 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          v30 = (void *)objc_opt_class();
          v31 = v30;
          objc_msgSend(v23, "category");
          v32 = v5;
          v33 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v172 = v30;
          v173 = 2112;
          v174 = v33;
          _os_log_impl(&dword_21961B000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

          v5 = v32;
        }
      }

    }
    objc_msgSend(v4, "hdmc_afterPeriodEndNotification");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      objc_msgSend(v34, "category");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMCNotificationManager _periodEventFromNotificationCategory:notificationFireDayIndex:](self, "_periodEventFromNotificationCategory:notificationFireDayIndex:", v36, objc_msgSend(v35, "fireOnDayIndex"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "currentDueDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "hk_isAfterDate:", v5);

      if (v39)
      {
        objc_msgSend(v6, "addObject:", v37);
      }
      else
      {
        _HKInitializeLogging();
        v40 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
        {
          v41 = v40;
          v42 = (void *)objc_opt_class();
          v156 = v5;
          v43 = v42;
          objc_msgSend(v35, "category");
          v44 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v172 = v42;
          v173 = 2112;
          v174 = v44;
          _os_log_impl(&dword_21961B000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

          v5 = v156;
        }
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "behavior");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isAppleWatch");

    if ((v48 & 1) == 0)
    {
      v157 = v5;
      unconfirmedDeviationStateKeyValueDomain = self->_unconfirmedDeviationStateKeyValueDomain;
      v169 = 0;
      -[HDKeyValueDomain hdmc_menstrualCyclesUnconfirmedDeviationNotificationGetStateWithError:](unconfirmedDeviationStateKeyValueDomain, "hdmc_menstrualCyclesUnconfirmedDeviationNotificationGetStateWithError:", &v169);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v169;
      if (!v50)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:].cold.5();
      }

      deviationDismissalKeyValueDomain = self->_deviationDismissalKeyValueDomain;
      v168 = 0;
      -[HDKeyValueDomain hdmc_unconfirmedDeviationDismissalDayIndexWithError:](deviationDismissalKeyValueDomain, "hdmc_unconfirmedDeviationDismissalDayIndexWithError:", &v168);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v168;
      v55 = v54;
      if (v53 || !v54)
      {
        if (v50)
        {
          objc_storeStrong((id *)&self->_lastDismissalDayIndex, v53);
          -[HDMCNotificationManager _currentDate](self, "_currentDate");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMCSettingsManager menstruationNotificationTimeOfDay](self->_settingsManager, "menstruationNotificationTimeOfDay");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = v53;
          objc_msgSend(v50, "computeNewStateFromAnalysis:dismissalDayIndex:currentDate:unconfirmedDeviationNotificationTimeOfDay:", v4, v53, v56, v57);
          v58 = objc_claimAutoreleasedReturnValue();

          v59 = v58;
          -[NSObject scheduledNotificationFireDayIndex](v58, "scheduledNotificationFireDayIndex");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
          {
            v61 = *MEMORY[0x24BE46A60];
            log = v59;
            -[NSObject scheduledNotificationFireDayIndex](v59, "scheduledNotificationFireDayIndex");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v146 = v61;
            -[HDMCNotificationManager _periodEventFromNotificationCategory:notificationFireDayIndex:](self, "_periodEventFromNotificationCategory:notificationFireDayIndex:", v61, objc_msgSend(v62, "integerValue"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v63, "currentDueDate");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "hk_isAfterDate:", v157);

            if (v65)
            {
              objc_msgSend(v6, "addObject:", v63);
            }
            else
            {
              _HKInitializeLogging();
              v66 = (void *)*MEMORY[0x24BDD3030];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
              {
                v67 = v66;
                v68 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v172 = v68;
                v173 = 2112;
                v174 = v146;
                v69 = v68;
                _os_log_impl(&dword_21961B000, v67, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

              }
            }

            v59 = log;
          }
          if (objc_msgSend(v50, "isEqual:", v59))
          {
            _HKInitializeLogging();
            v70 = (void *)*MEMORY[0x24BDD3030];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
            {
              logb = v70;
              v71 = v59;
              v72 = (void *)objc_opt_class();
              v147 = v72;
              HKSensitiveLogItem();
              v73 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v172 = v72;
              v59 = v71;
              v173 = 2114;
              v174 = v73;
              _os_log_impl(&dword_21961B000, logb, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviation notification state unchanged: %{public}@", buf, 0x16u);

            }
            v53 = v154;
          }
          else
          {
            v74 = self->_unconfirmedDeviationStateKeyValueDomain;
            v167 = v55;
            v75 = -[HDKeyValueDomain hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:error:](v74, "hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:error:", v59, &v167);
            v148 = v167;

            v53 = v154;
            if (v75)
            {
              _HKInitializeLogging();
              v76 = (void *)*MEMORY[0x24BDD3030];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
              {
                v143 = v76;
                v77 = (void *)objc_opt_class();
                v144 = v77;
                HKSensitiveLogItem();
                v142 = objc_claimAutoreleasedReturnValue();
                HKSensitiveLogItem();
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDKeyValueDomain domainName](self->_unconfirmedDeviationStateKeyValueDomain, "domainName");
                logc = v59;
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v172 = v77;
                v173 = 2114;
                v174 = v142;
                v175 = 2114;
                v176 = v78;
                v177 = 2114;
                v178 = v79;
                _os_log_impl(&dword_21961B000, v143, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully transitioned old state: %{public}@ -> new state: %{public}@ in key value domain: %{public}@", buf, 0x2Au);

                v59 = logc;
                v53 = v154;

              }
              -[HDMCNotificationManager _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("UnconfirmedDeviationNotificationSetValuesWithState"), v142);
            }
            v55 = v148;
          }

        }
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:].cold.4();
      }

      v5 = v157;
    }

    v8 = (os_log_t *)MEMORY[0x24BDD3030];
  }
  if (-[HKMCSettingsManager fertileWindowNotificationsEnabled](self->_settingsManager, "fertileWindowNotificationsEnabled"))
  {
    objc_msgSend(v4, "hdmc_beforeFertileWindowStartNotification");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v80;
    if (v80)
    {
      -[HKMCSettingsManager hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:](self->_settingsManager, "hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:", objc_msgSend(v80, "fireOnDayIndex"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      scheduler = self->_scheduler;
      objc_msgSend(v81, "category");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDRestorableAlarm eventWithIdentifier:dueDateComponents:eventOptions:](scheduler, "eventWithIdentifier:dueDateComponents:eventOptions:", v84, v82, 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v85, "currentDueDate");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v84) = objc_msgSend(v86, "hk_isAfterDate:", v5);

      if ((_DWORD)v84)
      {
        objc_msgSend(v6, "addObject:", v85);
      }
      else
      {
        _HKInitializeLogging();
        v87 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          v88 = v87;
          v89 = (void *)objc_opt_class();
          v158 = v89;
          objc_msgSend(v81, "category");
          v161 = v6;
          v90 = v8;
          v91 = v5;
          v92 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v172 = v89;
          v173 = 2112;
          v174 = v92;
          _os_log_impl(&dword_21961B000, v88, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

          v5 = v91;
          v8 = v90;
          v6 = v161;

        }
      }

    }
    v93 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v93, "daemon");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "behavior");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "isAppleWatch");

    if ((v96 & 1) == 0)
    {
      fertileWindowNotificationStateKeyValueDomain = self->_fertileWindowNotificationStateKeyValueDomain;
      v166 = 0;
      -[HDKeyValueDomain hdmc_updatedFertileWindowNotificationFireDateWithError:](fertileWindowNotificationStateKeyValueDomain, "hdmc_updatedFertileWindowNotificationFireDateWithError:", &v166);
      v98 = objc_claimAutoreleasedReturnValue();
      v99 = v166;
      v100 = v99;
      v162 = (void *)v98;
      if (v98 || !v99)
      {
        -[HKMCSettingsManager fertileWindowNotificationTimeOfDay](self->_settingsManager, "fertileWindowNotificationTimeOfDay");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hdmc_fertileWindowDidUpdateDueToSensorDataNotificationForNotificationFireDate:lastFiredDate:fertileWindowNotificationTimeOfDay:", v5, v98, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        if (v102)
        {
          -[HKMCSettingsManager hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:](self->_settingsManager, "hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:", objc_msgSend(v102, "fireOnDayIndex"));
          v103 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "eventIdentifierFromUpdateFertileWindowNotification");
          loga = (os_log_t)objc_claimAutoreleasedReturnValue();
          v155 = (void *)v103;
          -[HDRestorableAlarm eventWithIdentifier:dueDateComponents:eventOptions:](self->_scheduler, "eventWithIdentifier:dueDateComponents:eventOptions:");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "currentDueDate");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = v5;
          v106 = objc_msgSend(v105, "hk_isAfterDate:", v5);

          if (v106)
          {
            objc_msgSend(v6, "addObject:", v104);
          }
          else
          {
            _HKInitializeLogging();
            v107 = (void *)*MEMORY[0x24BDD3030];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
            {
              v149 = v107;
              v108 = (void *)objc_opt_class();
              v145 = v108;
              objc_msgSend(v102, "category");
              v109 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v172 = v108;
              v173 = 2112;
              v174 = v109;
              _os_log_impl(&dword_21961B000, v149, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %@", buf, 0x16u);

            }
          }

          v5 = v159;
          v8 = (os_log_t *)MEMORY[0x24BDD3030];
        }

      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:].cold.3();
      }
      _HKInitializeLogging();
      v110 = v8;
      v111 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v112 = v111;
        v113 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v172 = v113;
        v114 = v113;
        _os_log_impl(&dword_21961B000, v112, OS_LOG_TYPE_DEFAULT, "[%{public}@] Computing scheduled events for ovulation confirmation", buf, 0xCu);

      }
      ovulationConfirmationStateManager = self->_ovulationConfirmationStateManager;
      settingsManager = self->_settingsManager;
      v117 = self->_scheduler;
      v165 = v100;
      -[HDMCOvulationConfirmationStateManager eventsToScheduleForAnalysis:settingsManager:scheduler:error:](ovulationConfirmationStateManager, "eventsToScheduleForAnalysis:settingsManager:scheduler:error:", v4, settingsManager, v117, &v165);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = v165;

      if (v118)
      {
        objc_msgSend(v6, "addObjectsFromArray:", v118);
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v110, OS_LOG_TYPE_ERROR))
          -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:].cold.2();
      }

      v8 = v110;
    }

  }
  _HKInitializeLogging();
  v120 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v121 = v120;
    v122 = (void *)objc_opt_class();
    v123 = (void *)MEMORY[0x24BDD16E0];
    v124 = v122;
    objc_msgSend(v123, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v125 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v172 = v122;
    v173 = 2114;
    v174 = v125;
    v175 = 2112;
    v176 = v6;
    _os_log_impl(&dword_21961B000, v121, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling %{public}@ events: %@", buf, 0x20u);

  }
  v126 = self->_scheduler;
  v127 = (void *)objc_msgSend(v6, "copy");
  v164 = 0;
  -[HDRestorableAlarm replaceAllScheduledEventsWithEvents:error:](v126, "replaceAllScheduledEventsWithEvents:error:", v127, &v164);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v164;

  if (v128)
  {
    notificationSyncManager = self->_notificationSyncManager;
    objc_msgSend(v4, "latestSampleInfo");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCNotificationSyncManager sendNotificationInstructionsForSchedulingChanges:sampleInfo:](notificationSyncManager, "sendNotificationInstructionsForSchedulingChanges:sampleInfo:", v128, v131);

    objc_storeStrong((id *)&self->_lastAnalysis, a3);
    -[HDMCNotificationManager _currentDate](self, "_currentDate");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v4, "isEarliestNotificationScheduledAfterDate:gregorianCalendar:", v132, v133);

    if (v134)
    {
      _HKInitializeLogging();
      v135 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v136 = v135;
        v137 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v172 = v137;
        v138 = v137;
        _os_log_impl(&dword_21961B000, v136, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing all previous period notifications from notification center", buf, 0xCu);

      }
      v139 = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(v139, "notificationManager");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = *MEMORY[0x24BE46A80];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v170, 1);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "removeDeliveredNotificationsWithIdentifiers:", v141);

    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[HDMCNotificationManager _queue_rescheduleNotificationsForAnalysis:].cold.1();
  }

}

- (void)_queue_removeAllScheduledNotificationsIfNotEnabled
{
  id WeakRetained;
  void *v4;
  OS_dispatch_queue *queue;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__HDMCNotificationManager__queue_removeAllScheduledNotificationsIfNotEnabled__block_invoke;
  v6[3] = &unk_24DB21D60;
  v6[4] = self;
  objc_msgSend(v4, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v6);

}

void __77__HDMCNotificationManager__queue_removeAllScheduledNotificationsIfNotEnabled__block_invoke(uint64_t a1)
{
  uint64_t v1;
  os_log_t *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  os_log_t v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1 + 32;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "someNotificationsEnabled") & 1) == 0)
  {
    _HKInitializeLogging();
    v2 = (os_log_t *)MEMORY[0x24BDD3030];
    v3 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543362;
      v21 = (id)objc_opt_class();
      v5 = v21;
      _os_log_impl(&dword_21961B000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all scheduled and delivered notifications: notifications not enabled and supported", buf, 0xCu);

    }
    v6 = *(void **)(*(_QWORD *)v1 + 104);
    v17 = 0;
    v7 = objc_msgSend(v6, "removeAllEventsWithError:", &v17);
    v8 = v17;
    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      v9 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
        __77__HDMCNotificationManager__queue_removeAllScheduledNotificationsIfNotEnabled__block_invoke_cold_1(v1, v9);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)v1 + 8));
    objc_msgSend(WeakRetained, "notificationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE46A78];
    v19[0] = *MEMORY[0x24BE46A80];
    v19[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeDeliveredNotificationsWithIdentifiers:", v13);

    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)v1 + 8));
    objc_msgSend(v14, "notificationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BE46A88];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeDeliveredNotificationsWithIdentifiers:", v16);

  }
}

- (void)_queue_notificationOrSensorInputSettingsDidChange
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error clearing key value domain of update fertile window fire date: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD3A00]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3998]), "initWithPush:pull:lite:", 1, 0, 1);
  v9 = (void *)objc_msgSend(v7, "initWithChangesSyncRequest:", v8);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__HDMCNotificationManager__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_24DB21FF8;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v6, "syncWithRequest:reason:completion:", v9, v10, v11);

}

void __59__HDMCNotificationManager__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v11 = v9;
      _os_log_impl(&dword_21961B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __59__HDMCNotificationManager__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6);
  }

}

- (HDRestorableAlarm)scheduler
{
  return self->_scheduler;
}

- (NSDate)unitTest_currentDateOverride
{
  return self->_unitTest_currentDateOverride;
}

- (void)setUnitTest_currentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_currentDateOverride, a3);
}

- (id)unitTest_didSkipNotificationForDueEventHandler
{
  return self->_unitTest_didSkipNotificationForDueEventHandler;
}

- (void)setUnitTest_didSkipNotificationForDueEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didSkipNotificationForDueEventHandler, 0);
  objc_storeStrong((id *)&self->_unitTest_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_lastAnalysis, 0);
  objc_storeStrong((id *)&self->_lastDismissalDayIndex, 0);
  objc_storeStrong((id *)&self->_deviationDismissalKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_unconfirmedDeviationStateKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_ovulationConfirmationStateManager, 0);
  objc_storeStrong((id *)&self->_fertileWindowNotificationStateKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedStorageManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)didUpdateAnalysis:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving unconfirmed deviation dismiss day to determine rescheduling: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __45__HDMCNotificationManager_didUpdateAnalysis___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_3();
  v5 = OUTLINED_FUNCTION_0(v4);
  OUTLINED_FUNCTION_1(&dword_21961B000, v6, v7, "[%{public}@] Error checking for due events before rescheduling: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

- (void)settingsManagerDidUpdateNotificationSettings:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;

  v1 = OUTLINED_FUNCTION_4(a1);
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_21961B000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Notification settings changed: unable to reschedule notifications due to no current analysis", (uint8_t *)&v3, 0xCu);

}

- (void)_requestFromAlarmEvent:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_12_0(v3);
  objc_msgSend(v0, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1(&dword_21961B000, v6, v7, "[%{public}@] Could not create notification request from event identifier: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_alarm:didReceiveDueEvents:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_12_0(v3);
  objc_msgSend(v0, "hdmc_categoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1(&dword_21961B000, v6, v7, "[%{public}@] Could not create notification request from event identifier: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_alarm:didReceiveDueEvents:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_4_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Could not retrieve scheduled notification days shifted from calendar window value:%@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_alarm:didReceiveDueEvents:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_4_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Could not retrieve scheduled notification fertile window end day index:%@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_alarm:didReceiveDueEvents:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error fetching hold instructions: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_7(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error retrieving current deviation notification state: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  OUTLINED_FUNCTION_7(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_12_0(v3);
  HKSensitiveLogItem();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Unknown error migrating to waiting state from scheduled state: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_7(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error updating deviation notification state: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_7(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_4_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error transitioning from scheduled state to fired state:%@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_7(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error saving date fired for update fertile window notification in key value domain: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __60__HDMCNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_13(a1, a2);
  v3 = (id)OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_8(&dword_21961B000, v4, v5, "[%{public}@] Error posting user notification for request %@: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_9_0();
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error scheduling new events on analysis change: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving ovulation confirmation events with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving last fired date for update fertile window notification from key value domain: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving unconfirmed deviation dismiss day: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_rescheduleNotificationsForAnalysis:.cold.5()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving unconfirmed deviation notification state: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __77__HDMCNotificationManager__queue_removeAllScheduledNotificationsIfNotEnabled__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_7(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error removing all scheduled notifications: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __59__HDMCNotificationManager__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_13(a1, a2);
  v3 = (id)OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_8(&dword_21961B000, v4, v5, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_9_0();
}

@end
