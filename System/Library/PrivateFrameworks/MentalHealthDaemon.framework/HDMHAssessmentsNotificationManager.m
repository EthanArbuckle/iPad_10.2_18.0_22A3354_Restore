@implementation HDMHAssessmentsNotificationManager

- (HDMHAssessmentsNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4
{
  return -[HDMHAssessmentsNotificationManager initWithProfile:settingsManager:restorableAlarm:promptedAssessmentsManager:unitTest_didEvaluateIfMaintenanceWorkIsNeeded:](self, "initWithProfile:settingsManager:restorableAlarm:promptedAssessmentsManager:unitTest_didEvaluateIfMaintenanceWorkIsNeeded:", a3, a4, 0, 0, 0);
}

- (HDMHAssessmentsNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 restorableAlarm:(id)a5 promptedAssessmentsManager:(id)a6 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDMHAssessmentsNotificationManager *v17;
  HDMHAssessmentsNotificationManager *v18;
  void *v19;
  void *v20;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *queue;
  void *v23;
  id WeakRetained;
  uint64_t v25;
  HDKeyValueDomain *assessmentNotificationStateKeyValueDomain;
  void *v27;
  char v28;
  id v29;
  id v30;
  id v32;
  objc_super v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)HDMHAssessmentsNotificationManager;
  v17 = -[HDMHAssessmentsNotificationManager init](&v33, sel_init);
  v18 = v17;
  if (v17)
  {
    v32 = v13;
    objc_storeWeak((id *)&v17->_profile, v12);
    objc_msgSend(v14, "eventHandlerQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      HKCreateSerialDispatchQueue();
      v21 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    queue = v18->_queue;
    v18->_queue = v21;

    v23 = (void *)MEMORY[0x24BE40AD0];
    WeakRetained = objc_loadWeakRetained((id *)&v18->_profile);
    objc_msgSend(v23, "hdmh_mentalHealthSyncedDefaultsDomainWithProfile:", WeakRetained);
    v25 = objc_claimAutoreleasedReturnValue();
    assessmentNotificationStateKeyValueDomain = v18->_assessmentNotificationStateKeyValueDomain;
    v18->_assessmentNotificationStateKeyValueDomain = (HDKeyValueDomain *)v25;

    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isAppleWatch");

    if (!v14 && (v28 & 1) == 0)
    {
      v29 = objc_alloc(MEMORY[0x24BE40BB0]);
      v30 = objc_loadWeakRetained((id *)&v18->_profile);
      v14 = (id)objc_msgSend(v29, "initWithProfile:clientIdentifier:eventHandlerQueue:", v30, CFSTR("HDMHAssessmentsNotificationManager"), v18->_queue);

    }
    if (v16)
      -[HDMHAssessmentsNotificationManager setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:](v18, "setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:", v16);
    v18->_queue_hasEnqueuedMaintenanceWork = 0;
    objc_storeStrong((id *)&v18->_restorableAlarm, v14);
    objc_storeStrong((id *)&v18->_settingsManager, a4);
    objc_storeStrong((id *)&v18->_promptedAssessmentsManager, a6);
    objc_msgSend(v12, "registerProfileReadyObserver:queue:", v18, v18->_queue);
    v13 = v32;
  }

  return v18;
}

- (void)_queue_start
{
  const __CFString *v5;

  v5 = CFSTR("NO");
  if ((a2 & 1) != 0)
    v5 = CFSTR("YES");
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_2416F5000, log, OS_LOG_TYPE_DEBUG, "[%{public}@] Assessments notifications enabled: %{public}@", buf, 0x16u);

}

void __50__HDMHAssessmentsNotificationManager__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
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
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_2416F5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating notification manager", v6, 0xCu);

  }
  -[HDRestorableAlarm invalidate](self->_restorableAlarm, "invalidate", *(_OWORD *)v6);
  -[HKMHSettingsManager removeObserver:](self->_settingsManager, "removeObserver:", self);
  -[HDMHPromptedAssessmentsManaging unregisterObserver:](self->_promptedAssessmentsManager, "unregisterObserver:", self);
}

- (id)scheduledNotificationsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[HDRestorableAlarm allScheduledEventsWithError:](self->_restorableAlarm, "allScheduledEventsWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__HDMHAssessmentsNotificationManager_scheduledNotificationsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BE65DD0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithCategory:", v5);
  return v6;
}

- (void)_setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (id)_currentDate
{
  NSDate *currentDateOverride;

  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
    return currentDateOverride;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  char v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = -[HKMHSettingsManager hasAnyAssessmentNotificationsEnabled](self->_settingsManager, "hasAnyAssessmentNotificationsEnabled");
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3038];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      v7 = v5;
      *(_DWORD *)v11 = 138543362;
      *(_QWORD *)&v11[4] = objc_opt_class();
      v8 = *(id *)&v11[4];
      _os_log_impl(&dword_2416F5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification settings changed: rescheduling notifications", v11, 0xCu);

    }
    -[HDMHAssessmentsNotificationManager _rescheduleNotifications](self, "_rescheduleNotifications", *(_OWORD *)v11);
  }
  else
  {
    if (v6)
    {
      v9 = v5;
      *(_DWORD *)v11 = 138543362;
      *(_QWORD *)&v11[4] = objc_opt_class();
      v10 = *(id *)&v11[4];
      _os_log_impl(&dword_2416F5000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications not enabled", v11, 0xCu);

    }
    -[HDMHAssessmentsNotificationManager _queue_removeAllScheduledNotifications](self, "_queue_removeAllScheduledNotifications", *(_OWORD *)v11);
  }
}

- (id)_requestFromAlarmEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE65D58];
  v6 = objc_msgSend(v4, "containsString:", *MEMORY[0x24BE65D58]);

  if (!v6
    || (objc_msgSend(MEMORY[0x24BDF8858], "hkmh_requestForCategoryIdentifier:", v5),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      -[HDMHAssessmentsNotificationManager _requestFromAlarmEvent:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  id v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  const char *v24;
  os_log_t v25;
  void *v26;
  os_log_t v27;
  void *v28;
  void *v29;
  id WeakRetained;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x24BDD3038];
  v7 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = v9;
    objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v9;
    v37 = 2114;
    v38 = v12;
    v39 = 2112;
    v40 = v5;
    _os_log_impl(&dword_2416F5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %{public}@ due events: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "features");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "chamomile");

  if ((v17 & 1) != 0)
  {
    if ((-[HKMHSettingsManager hasAnyAssessmentNotificationsEnabled](self->_settingsManager, "hasAnyAssessmentNotificationsEnabled") & 1) != 0)
    {
      objc_msgSend(v14, "currentDueDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hk_isBeforeDate:", v13);

      if (!v19)
      {
        -[HDMHAssessmentsNotificationManager _removeRelatedDeliveredHDMHNotificationsForEvent:](self, "_removeRelatedDeliveredHDMHNotificationsForEvent:", v14);
        -[HDMHAssessmentsNotificationManager _requestFromAlarmEvent:](self, "_requestFromAlarmEvent:", v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "notificationManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke;
        v33[3] = &unk_2511A2180;
        v33[4] = self;
        v34 = v29;
        v32 = v29;
        objc_msgSend(v31, "postNotificationWithRequest:completion:", v32, v33);

        goto LABEL_14;
      }
      _HKInitializeLogging();
      v20 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v36 = v22;
        v37 = 2112;
        v38 = v14;
        v23 = v22;
        v24 = "[%{public}@] Skipping sending notification for event due more than one day ago: %@";
LABEL_12:
        _os_log_impl(&dword_2416F5000, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);

      }
    }
    else
    {
      _HKInitializeLogging();
      v27 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v27;
        v28 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        v37 = 2112;
        v38 = v14;
        v23 = v28;
        v24 = "[%{public}@] Skipping sending notification for event; assessment notifications are not enabled and supported: %@";
        goto LABEL_12;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v25;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v36 = v26;
      v37 = 2112;
      v38 = v14;
      v23 = v26;
      v24 = "[%{public}@] Skipping sending notification for event; feature flag is not enabled: %@";
      goto LABEL_12;
    }
  }
LABEL_14:

}

void __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "categoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE65D58]);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "_currentDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v23 = 0;
      v11 = objc_msgSend(v10, "hdmh_setUpdatedPeriodicPromptedAssessmentNotificationFireDate:error:", v9, &v23);
      v12 = v23;
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x24BDD3038];
      v14 = *MEMORY[0x24BDD3038];
      if ((v11 & 1) != 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v13;
          v16 = (void *)objc_opt_class();
          v17 = v16;
          HKSensitiveLogItem();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v16;
          v26 = 2112;
          v27 = v18;
          _os_log_impl(&dword_2416F5000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully saved date fired for periodic prompted assessment notification in key value domain with date: %@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "_triggerImmediateSyncWithReason:", CFSTR("hdmh_setUpdatedPeriodicPromptedAssessmentNotificationFireDate"));
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(a1 + 32, v13);
      }

    }
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(NSObject **)(v20 + 24);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_202;
    v22[3] = &unk_2511A1F30;
    v22[4] = v20;
    dispatch_async(v21, v22);
  }
  else
  {
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_2(a1, v19);
  }

}

uint64_t __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_202(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleNotifications");
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
  v11[2] = __70__HDMHAssessmentsNotificationManager__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_2511A2180;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v6, "syncWithRequest:reason:completion:", v9, v10, v11);

}

void __70__HDMHAssessmentsNotificationManager__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
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
  v6 = (void *)*MEMORY[0x24BDD3038];
  v7 = *MEMORY[0x24BDD3038];
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
      _os_log_impl(&dword_2416F5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __70__HDMHAssessmentsNotificationManager__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6);
  }

}

- (void)_removeRelatedDeliveredHDMHNotificationsForEvent:(id)a3
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE65DD0], "assessmentsNotificationCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDeliveredNotificationsWithIdentifiers:", v4);

}

- (void)_queue_rescheduleNotifications
{
  HDRestorableAlarm *restorableAlarm;
  _QWORD v3[5];

  restorableAlarm = self->_restorableAlarm;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__HDMHAssessmentsNotificationManager__queue_rescheduleNotifications__block_invoke;
  v3[3] = &unk_2511A21A8;
  v3[4] = self;
  -[HDRestorableAlarm checkForDueEventsWithCompletion:](restorableAlarm, "checkForDueEventsWithCompletion:", v3);
}

void __68__HDMHAssessmentsNotificationManager__queue_rescheduleNotifications__block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6;
  void *v7;

  v6 = a4;
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke_cold_1(a1, v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "_rescheduleNotifications");

}

- (void)_rescheduleNotifications
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

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_0(&dword_2416F5000, v4, v5, "[%{public}@] Error scheduling new events: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (id)_eventsToSchedule
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[HKMHSettingsManager periodicPromptedAssessmentNotificationsEnabled](self->_settingsManager, "periodicPromptedAssessmentNotificationsEnabled"))
  {
    -[HDMHAssessmentsNotificationManager _periodicAssessmentEvent](self, "_periodicAssessmentEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v3, "addObject:", v4);

  }
  return v3;
}

- (void)_queue_removeAllScheduledNotificationsIfNotEnabled
{
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HKMHSettingsManager hasAnyAssessmentNotificationsEnabled](self->_settingsManager, "hasAnyAssessmentNotificationsEnabled"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_impl(&dword_2416F5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Aborting maintenance removal of notifications because notifications are enabled", (uint8_t *)&v6, 0xCu);

    }
  }
  else
  {
    -[HDMHAssessmentsNotificationManager _queue_removeAllScheduledNotifications](self, "_queue_removeAllScheduledNotifications");
  }
}

- (void)_queue_removeAllScheduledNotifications
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

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_0(&dword_2416F5000, v4, v5, "[%{public}@] Error removing all scheduled notifications: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  HDMHAssessmentsNotificationManager *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[HDMHAssessmentsNotificationManager unitTest_didEvaluateIfMaintenanceWorkIsNeeded](self, "unitTest_didEvaluateIfMaintenanceWorkIsNeeded");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, _BOOL8))(v5 + 16))(v5, v3);
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3048];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3048], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v10 = 138543874;
      v11 = (id)objc_opt_class();
      v12 = 2048;
      v13 = self;
      v14 = 1024;
      v15 = v3;
      v9 = v11;
      _os_log_impl(&dword_2416F5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Did evaluate for maintenance work: %d", (uint8_t *)&v10, 0x1Cu);

    }
  }

}

- (void)profileDidBecomeReady:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  OS_dispatch_queue *v9;
  _QWORD v10[5];

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[HDMHAssessmentsNotificationManager _queue_start](self, "_queue_start");
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isProtectedDataAvailable");
  if ((_DWORD)v5)
  {
    -[HDMHAssessmentsNotificationManager _queue_enqueueMaintenanceRemovalIfNeeded](self, "_queue_enqueueMaintenanceRemovalIfNeeded");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_queue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__HDMHAssessmentsNotificationManager_profileDidBecomeReady___block_invoke;
    v10[3] = &unk_2511A1F30;
    v10[4] = self;
    objc_msgSend(v8, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", v9, v10);

  }
}

uint64_t __60__HDMHAssessmentsNotificationManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueMaintenanceRemovalIfNeeded");
}

- (void)_queue_enqueueMaintenanceRemovalIfNeeded
{
  void *v3;
  void *v4;
  OS_dispatch_queue *queue;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_queue_hasEnqueuedMaintenanceWork
    || (-[HKMHSettingsManager hasAnyAssessmentNotificationsEnabled](self->_settingsManager, "hasAnyAssessmentNotificationsEnabled") & 1) != 0)
  {
    -[HDMHAssessmentsNotificationManager _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:](self, "_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:", 0);
  }
  else
  {
    v3 = (void *)MEMORY[0x24BE40AF8];
    -[HDMHAssessmentsNotificationManager maintenanceOperationName](self, "maintenanceOperationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v10[4] = self;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __78__HDMHAssessmentsNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke;
    v11[3] = &unk_2511A1F30;
    v11[4] = self;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __78__HDMHAssessmentsNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2;
    v10[3] = &unk_2511A1F30;
    objc_msgSend(v3, "maintenanceOperationWithName:queue:synchronousBlock:canceledBlock:", v4, queue, v11, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maintenanceWorkCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enqueueMaintenanceOperation:", v6);

    self->_queue_hasEnqueuedMaintenanceWork = 1;
    -[HDMHAssessmentsNotificationManager _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:](self, "_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:", 1);

  }
}

uint64_t __78__HDMHAssessmentsNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_runMaintenanceRemoval");
}

void __78__HDMHAssessmentsNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;

  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
    __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2_cold_1(a1, v2);
}

- (void)_queue_runMaintenanceRemoval
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_2416F5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing maintenance work: notifications not enabled and supported", v6, 0xCu);

  }
  -[HDMHAssessmentsNotificationManager _queue_removeAllScheduledNotificationsIfNotEnabled](self, "_queue_removeAllScheduledNotificationsIfNotEnabled", *(_OWORD *)v6);
  self->_queue_hasEnqueuedMaintenanceWork = 0;
}

- (void)promptedAssessmentsManagerDidUpdatePromptedAssessments:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v6 = v8;
    _os_log_impl(&dword_2416F5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Prompted assessments manager did update", (uint8_t *)&v7, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDMHAssessmentsNotificationManager _rescheduleNotifications](self, "_rescheduleNotifications");
}

- (id)_nextBehaviorBasedDateWithError:(id *)a3
{
  HDMHPromptedAssessmentsManaging *promptedAssessmentsManager;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  promptedAssessmentsManager = self->_promptedAssessmentsManager;
  v11 = 0;
  -[HDMHPromptedAssessmentsManaging promptedAssessmentsWithError:](promptedAssessmentsManager, "promptedAssessmentsWithError:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      -[HDMHAssessmentsNotificationManager _nextBehaviorBasedDateWithError:].cold.1();
    if (a3)
    {
      v7 = 0;
      *a3 = objc_retainAutorelease(v6);
    }
    else
    {
      _HKLogDroppedError();
      v7 = 0;
    }
  }
  else
  {
    objc_msgSend(v5, "hk_filter:", &__block_literal_global_211);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eligibilityStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

BOOL __70__HDMHAssessmentsNotificationManager__nextBehaviorBasedDateWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reason") == 1;
}

- (id)_nextRegularlyScheduledDateWithError:(id *)a3
{
  HDKeyValueDomain *assessmentNotificationStateKeyValueDomain;
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  HDMHPromptedAssessmentsManaging *promptedAssessmentsManager;
  uint64_t v11;
  void *v13;
  id v15;
  id v16;

  assessmentNotificationStateKeyValueDomain = self->_assessmentNotificationStateKeyValueDomain;
  v16 = 0;
  -[HDKeyValueDomain hdmh_updatedPeriodicPromptedAssessmentNotificationFireDateWithError:](assessmentNotificationStateKeyValueDomain, "hdmh_updatedPeriodicPromptedAssessmentNotificationFireDateWithError:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
    {
      -[HDMHAssessmentsNotificationManager _nextRegularlyScheduledDateWithError:].cold.1();
      if (a3)
        goto LABEL_14;
    }
    else if (a3)
    {
LABEL_14:
      v8 = objc_retainAutorelease(v8);
      v13 = 0;
      *a3 = v8;
      goto LABEL_20;
    }
    _HKLogDroppedError();
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  if (!v6)
    goto LABEL_19;

  promptedAssessmentsManager = self->_promptedAssessmentsManager;
  v15 = 0;
  v11 = -[HDMHPromptedAssessmentsManaging periodicAssessmentPromptCadenceInDaysWithError:](promptedAssessmentsManager, "periodicAssessmentPromptCadenceInDaysWithError:", &v15);
  v8 = v15;
  if (v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      -[HDMHAssessmentsNotificationManager _nextRegularlyScheduledDateWithError:].cold.2();
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    else
      _HKLogDroppedError();
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v6, (double)v11 * 60.0 * 60.0 * 24.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v13;
}

- (id)_periodicAssessmentEvent
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HDMHNotification *v17;
  uint64_t v18;
  HDMHNotification *v19;
  HDRestorableAlarm *restorableAlarm;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  -[HDMHAssessmentsNotificationManager _nextBehaviorBasedDateWithError:](self, "_nextBehaviorBasedDateWithError:", &v28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v28;
  if (v4)
  {
    v5 = v4;
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      -[HDMHAssessmentsNotificationManager _periodicAssessmentEvent].cold.2();
    v6 = 0;
  }
  else
  {
    v27 = 0;
    -[HDMHAssessmentsNotificationManager _nextRegularlyScheduledDateWithError:](self, "_nextRegularlyScheduledDateWithError:", &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v27;
    if (v5)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
        -[HDMHAssessmentsNotificationManager _periodicAssessmentEvent].cold.1();
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "laterDate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v9 = (os_log_t *)MEMORY[0x24BDD3038];
      v10 = (void *)*MEMORY[0x24BDD3038];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138544130;
        v30 = v12;
        v31 = 2112;
        v32 = v3;
        v33 = 2112;
        v34 = v7;
        v35 = 2112;
        v36 = v8;
        v13 = v12;
        _os_log_impl(&dword_2416F5000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Behavior Date: %@, Regular Date: %@, Selected Date: %@", buf, 0x2Au);

      }
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMHSettingsManager periodicPromptedAssessmentNotificationTimeOfDay](self->_settingsManager, "periodicPromptedAssessmentNotificationTimeOfDay");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v15, "hour"), objc_msgSend(v15, "minute"), objc_msgSend(v15, "second"), v8, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [HDMHNotification alloc];
        v18 = objc_msgSend(v8, "hk_dayIndexWithCalendar:", v14);
        v19 = -[HDMHNotification initWithFireOnDayIndex:dateComponents:category:](v17, "initWithFireOnDayIndex:dateComponents:category:", v18, v15, *MEMORY[0x24BE65D58]);
        restorableAlarm = self->_restorableAlarm;
        -[HDMHNotification eventIdentifier](v19, "eventIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDRestorableAlarm eventWithIdentifier:dueDate:eventOptions:](restorableAlarm, "eventWithIdentifier:dueDate:eventOptions:", v21, v16, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        _HKInitializeLogging();
        v22 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v30 = v24;
          v25 = v24;
          _os_log_impl(&dword_2416F5000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] No upcoming periodic prompted assessment.", buf, 0xCu);

        }
        v6 = 0;
      }

    }
  }

  return v6;
}

- (id)unitTest_didEvaluateIfMaintenanceWorkIsNeeded
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (HDRestorableAlarm)restorableAlarm
{
  return self->_restorableAlarm;
}

- (HDMHPromptedAssessmentsManaging)promptedAssessmentsManager
{
  return self->_promptedAssessmentsManager;
}

- (void)setPromptedAssessmentsManager:(id)a3
{
  objc_storeStrong((id *)&self->_promptedAssessmentsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptedAssessmentsManager, 0);
  objc_storeStrong((id *)&self->_restorableAlarm, 0);
  objc_storeStrong(&self->unitTest_didEvaluateIfMaintenanceWorkIsNeeded, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_assessmentNotificationStateKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_requestFromAlarmEvent:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(v2);
  v3 = (id)OUTLINED_FUNCTION_3();
  objc_msgSend(v0, "eventIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_2416F5000, v4, v5, "[%{public}@] Could not create notification request from event identifier: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

void __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(uint64_t a1, void *a2)
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
  v5 = OUTLINED_FUNCTION_1(v4);
  OUTLINED_FUNCTION_0(&dword_2416F5000, v6, v7, "[%{public}@] Error saving date fired for periodic prompted assessment notification in key value domain: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

void __71__HDMHAssessmentsNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_8(a1, a2);
  v3 = (id)OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0(&dword_2416F5000, v4, v5, "[%{public}@] Error posting user notification for request %@: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

void __70__HDMHAssessmentsNotificationManager__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_8(a1, a2);
  v3 = (id)OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0(&dword_2416F5000, v4, v5, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)_nextBehaviorBasedDateWithError:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_0(&dword_2416F5000, v4, v5, "[%{public}@] Error requesting prompted assessments %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_nextRegularlyScheduledDateWithError:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_0(&dword_2416F5000, v4, v5, "[%{public}@] Error retrieving last fired date for last periodic prompted assessment notification from key value domain: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_nextRegularlyScheduledDateWithError:.cold.2()
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

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_0(&dword_2416F5000, v4, v5, "[%{public}@] Error retrieving cadence in days %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_periodicAssessmentEvent
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

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_0(&dword_2416F5000, v4, v5, "[%{public}@] Unable to get behavior date, not scheduling due to error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
