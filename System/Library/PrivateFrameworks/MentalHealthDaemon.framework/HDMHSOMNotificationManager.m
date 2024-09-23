@implementation HDMHSOMNotificationManager

- (HDMHSOMNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 typicalDayProvider:(id)a5
{
  return -[HDMHSOMNotificationManager initWithProfile:settingsManager:restorableAlarm:typicalDayProvider:unitTest_didEvaluateIfMaintenanceWorkIsNeeded:](self, "initWithProfile:settingsManager:restorableAlarm:typicalDayProvider:unitTest_didEvaluateIfMaintenanceWorkIsNeeded:", a3, a4, 0, a5, 0);
}

- (HDMHSOMNotificationManager)initWithProfile:(id)a3 settingsManager:(id)a4 restorableAlarm:(id)a5 typicalDayProvider:(id)a6 unitTest_didEvaluateIfMaintenanceWorkIsNeeded:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDMHSOMNotificationManager *v17;
  HDMHSOMNotificationManager *v18;
  void *v19;
  void *v20;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *queue;
  void *v23;
  char v24;
  id v25;
  id WeakRetained;
  id v28;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HDMHSOMNotificationManager;
  v17 = -[HDMHSOMNotificationManager init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    v28 = v13;
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

    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isAppleWatch");

    if (!v14 && (v24 & 1) == 0)
    {
      v25 = objc_alloc(MEMORY[0x24BE40BB0]);
      WeakRetained = objc_loadWeakRetained((id *)&v18->_profile);
      v14 = (id)objc_msgSend(v25, "initWithProfile:clientIdentifier:eventHandlerQueue:", WeakRetained, CFSTR("HDMHSOMNotificationManager"), v18->_queue);

    }
    if (v16)
      -[HDMHSOMNotificationManager setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:](v18, "setUnitTest_didEvaluateIfMaintenanceWorkIsNeeded:", v16);
    v18->_queue_hasEnqueuedMaintenanceWork = 0;
    objc_storeStrong((id *)&v18->_restorableAlarm, v14);
    objc_storeStrong((id *)&v18->_settingsManager, a4);
    objc_storeStrong((id *)&v18->_typicalDayProvider, a6);
    objc_msgSend(v12, "registerProfileReadyObserver:queue:", v18, v18->_queue);
    v13 = v28;
  }

  return v18;
}

- (void)_queue_start
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_5(&dword_2416F5000, "[%{public}@] Midday logging reminder enabled: %{public}@", v4, v5);

}

void __42__HDMHSOMNotificationManager__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_queue_registerForSignificantTimeChanges
{
  const char *v3;
  NSObject *queue;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend(CFSTR("SignificantTimeChangeNotification"), "UTF8String");
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __70__HDMHSOMNotificationManager__queue_registerForSignificantTimeChanges__block_invoke;
  v9 = &unk_2511A2118;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v3, &self->_significantTimeChangeToken, queue, &v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_didReceiveDayChangeNotification_, *MEMORY[0x24BDBC9E8], 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __70__HDMHSOMNotificationManager__queue_registerForSignificantTimeChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_significantTimeChangeOccurred");

}

- (void)didReceiveDayChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__HDMHSOMNotificationManager_didReceiveDayChangeNotification___block_invoke;
  block[3] = &unk_2511A1F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__HDMHSOMNotificationManager_didReceiveDayChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_significantTimeChangeOccurred");
}

- (void)_significantTimeChangeOccurred
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HKMHSettingsManager hasAnyStateOfMindReminderEnabled](self->_settingsManager, "hasAnyStateOfMindReminderEnabled"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)v6 = 138543362;
      *(_QWORD *)&v6[4] = objc_opt_class();
      v5 = *(id *)&v6[4];
      _os_log_impl(&dword_2416F5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rescheduling notifications for Calendar Day change", v6, 0xCu);

    }
    -[HDMHTypicalDayProviding rebuildTypicalDayProviderForCurrentDate](self->_typicalDayProvider, "rebuildTypicalDayProviderForCurrentDate", *(_OWORD *)v6);
    -[HDMHSOMNotificationManager _queue_rescheduleNotifications](self, "_queue_rescheduleNotifications");
  }
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v7 = 138543362;
    *(_QWORD *)&v7[4] = objc_opt_class();
    v5 = *(id *)&v7[4];
    _os_log_impl(&dword_2416F5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating notification manager", v7, 0xCu);

  }
  -[HDRestorableAlarm invalidate](self->_restorableAlarm, "invalidate", *(_OWORD *)v7);
  -[HKMHSettingsManager removeObserver:](self->_settingsManager, "removeObserver:", self);
  -[HDMHTypicalDayProviding removeObserver:](self->_typicalDayProvider, "removeObserver:", self);
  if (notify_is_valid_token(self->_significantTimeChangeToken))
  {
    notify_cancel(self->_significantTimeChangeToken);
    self->_significantTimeChangeToken = -1;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDBC9E8], 0);

}

- (id)scheduledNotificationsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[HDRestorableAlarm allScheduledEventsWithError:](self->_restorableAlarm, "allScheduledEventsWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __62__HDMHSOMNotificationManager_scheduledNotificationsWithError___block_invoke(uint64_t a1, void *a2)
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
  v4 = -[HKMHSettingsManager hasAnyStateOfMindReminderEnabled](self->_settingsManager, "hasAnyStateOfMindReminderEnabled");
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
    -[HDMHSOMNotificationManager _rescheduleNotifications](self, "_rescheduleNotifications", *(_OWORD *)v11);
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
    -[HDMHSOMNotificationManager _queue_removeAllScheduledNotifications](self, "_queue_removeAllScheduledNotifications", *(_OWORD *)v11);
  }
}

- (id)_requestFromAlarmEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE65D40];
  v7 = objc_msgSend(v5, "containsString:", *MEMORY[0x24BE65D40]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "eventIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE65D50];
    v9 = objc_msgSend(v8, "containsString:", *MEMORY[0x24BE65D50]);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v4, "eventIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *MEMORY[0x24BE65D48];
      v11 = objc_msgSend(v10, "containsString:", *MEMORY[0x24BE65D48]);

      if (!v11)
        goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x24BDF8858], "hkmh_requestForCategoryIdentifier:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_5:
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      -[HDMHSOMNotificationManager _requestFromAlarmEvent:].cold.1(v13, (uint64_t)self, v4);
    v12 = 0;
  }

  return v12;
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
    if ((-[HKMHSettingsManager hasAnyStateOfMindReminderEnabled](self->_settingsManager, "hasAnyStateOfMindReminderEnabled") & 1) != 0)
    {
      objc_msgSend(v14, "currentDueDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hk_isBeforeDate:", v13);

      if (!v19)
      {
        -[HDMHSOMNotificationManager _removeRelatedDeliveredHDMHNotificationsForEvent:](self, "_removeRelatedDeliveredHDMHNotificationsForEvent:", v14);
        -[HDMHSOMNotificationManager _requestFromAlarmEvent:](self, "_requestFromAlarmEvent:", v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "notificationManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke;
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
        v24 = "[%{public}@] Skipping sending notification for event; SOM notifications are not enabled and supported: %@";
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

void __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_206;
    block[3] = &unk_2511A1F30;
    block[4] = v6;
    dispatch_async(v7, block);
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(a1, v8, (uint64_t)v5);
  }

}

uint64_t __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_206(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleNotifications");
}

- (void)_removeRelatedDeliveredHDMHNotificationsForEvent:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE65DD0], "stateOfMindNotificationCategories", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDeliveredNotificationsWithIdentifiers:", v6);

}

- (void)_queue_rescheduleNotifications
{
  HDRestorableAlarm *restorableAlarm;
  _QWORD v3[5];

  restorableAlarm = self->_restorableAlarm;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke;
  v3[3] = &unk_2511A21A8;
  v3[4] = self;
  -[HDRestorableAlarm checkForDueEventsWithCompletion:](restorableAlarm, "checkForDueEventsWithCompletion:", v3);
}

void __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
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
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6(a1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_0(&dword_2416F5000, v4, v5, "[%{public}@] Error scheduling new events: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (id)_eventsToSchedule
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HDMHNotification *v20;
  HDMHSOMNotificationManager *v21;
  HDRestorableAlarm *restorableAlarm;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  __int128 v31;
  void *v32;
  int v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "chamomile");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMHSOMNotificationManager _currentDate](self, "_currentDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMHSOMNotificationManager _notificationDateComponentsByCategory](self, "_notificationDateComponentsByCategory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    *(_QWORD *)&v9 = 138543618;
    v31 = v9;
    do
    {
      v33 = v8;
      v37 = v7;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v10 = v32;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v11)
      {
        v12 = v11;
        v36 = *(_QWORD *)v39;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v39 != v36)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v13);
            objc_msgSend(v6, "nextDateAfterDate:matchingComponents:options:", v37, v14, 1024, v31);
            v15 = objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              _HKInitializeLogging();
              v25 = (void *)*MEMORY[0x24BDD3038];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
              {
                v27 = v25;
                v28 = (void *)objc_opt_class();
                *(_DWORD *)buf = v31;
                v43 = v28;
                v44 = 2112;
                v45 = v14;
                v29 = v28;
                _os_log_error_impl(&dword_2416F5000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Next Date nil for scheduleTime: %@", buf, 0x16u);

              }
              goto LABEL_16;
            }
            v16 = (void *)v15;
            v17 = v10;
            objc_msgSend(v10, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v6;
            v20 = -[HDMHNotification initWithFireOnDayIndex:dateComponents:category:]([HDMHNotification alloc], "initWithFireOnDayIndex:dateComponents:category:", objc_msgSend(v16, "hk_dayIndexWithCalendar:", v6), v14, v18);
            v21 = self;
            restorableAlarm = self->_restorableAlarm;
            -[HDMHNotification eventIdentifier](v20, "eventIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDRestorableAlarm eventWithIdentifier:dueDate:eventOptions:](restorableAlarm, "eventWithIdentifier:dueDate:eventOptions:", v23, v16, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v35, "addObject:", v24);
              objc_msgSend(v34, "addObject:", v16);
            }

            ++v13;
            self = v21;
            v10 = v17;
            v6 = v19;
          }
          while (v12 != v13);
          v12 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_16:

      v26 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v26, "setDay:", 1);
      objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v26, v37, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v33 + 1;
    }
    while (v33 != 6);

  }
  return v35;
}

- (id)_notificationDateComponentsByCategory
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if ((-[HKMHSettingsManager middayNotificationsEnabled](self->_settingsManager, "middayNotificationsEnabled") & 1) != 0
    || -[HKMHSettingsManager endOfDayNotificationsEnabled](self->_settingsManager, "endOfDayNotificationsEnabled"))
  {
    -[HDMHSOMNotificationManager _timeOfDayBasedNotifications](self, "_timeOfDayBasedNotifications");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  }
  -[HKMHSettingsManager customReminderSchedule](self->_settingsManager, "customReminderSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v9 = *MEMORY[0x24BE65D40];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEnabled"))
        {
          objc_msgSend(v11, "dateComponents");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            objc_msgSend(v11, "dateComponents");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v9, v14);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v27 = v17;
    v18 = v17;
    _os_log_impl(&dword_2416F5000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calculated all notification date components.", buf, 0xCu);

  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67__HDMHSOMNotificationManager__notificationDateComponentsByCategory__block_invoke;
  v21[3] = &unk_2511A21D0;
  v21[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v21);
  v19 = (void *)objc_msgSend(v3, "copy");

  return v19;
}

void __67__HDMHSOMNotificationManager__notificationDateComponentsByCategory__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    v10 = 138544130;
    v11 = v8;
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = objc_msgSend(v4, "hour");
    v16 = 2048;
    v17 = objc_msgSend(v4, "minute");
    _os_log_impl(&dword_2416F5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Type: %@, Time: %ld:%ld", (uint8_t *)&v10, 0x2Au);

  }
}

- (id)_timeOfDayBasedNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v18;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHTypicalDayProviding userStartOfDay](self->_typicalDayProvider, "userStartOfDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHTypicalDayProviding userEndOfDay](self->_typicalDayProvider, "userEndOfDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hk_isBeforeDate:", v5))
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_FAULT))
    {
      v18 = v9;
      v20 = 138543874;
      v21 = (id)objc_opt_class();
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      v19 = v21;
      _os_log_fault_impl(&dword_2416F5000, v18, OS_LOG_TYPE_FAULT, "[%{public}@] inferredStartOfDay is later than inferredEndOfDay. \n StartOfDay:%@ \n EndOfDay:%@", (uint8_t *)&v20, 0x20u);

    }
LABEL_11:

    goto LABEL_12;
  }
  if (-[HKMHSettingsManager middayNotificationsEnabled](self->_settingsManager, "middayNotificationsEnabled"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v5, v6);
    objc_msgSend(v10, "duration");
    objc_msgSend(v5, "dateByAddingTimeInterval:", v11 * 0.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 96, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BE65D50], v13);

  }
  if (-[HKMHSettingsManager endOfDayNotificationsEnabled](self->_settingsManager, "endOfDayNotificationsEnabled"))
  {
    v7 = v6;
    if (-[HDMHSOMNotificationManager _shouldEndOfDayBeShiftedToMidnightForDate:](self, "_shouldEndOfDayBeShiftedToMidnightForDate:", v7))
    {
      -[HDMHSOMNotificationManager _endOfCalendarDayForDate:](self, "_endOfCalendarDayForDate:", v5);
      v14 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v14;
    }
    objc_msgSend(v7, "dateByAddingTimeInterval:", -1200.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 96, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BE65D48], v16);

    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (BOOL)_shouldEndOfDayBeShiftedToMidnightForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 10800.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "hk_isBeforeDate:", v7);

  return v8;
}

- (id)_endOfCalendarDayForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  if (-[HKMHSettingsManager hasAnyStateOfMindReminderEnabled](self->_settingsManager, "hasAnyStateOfMindReminderEnabled"))
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
    -[HDMHSOMNotificationManager _queue_removeAllScheduledNotifications](self, "_queue_removeAllScheduledNotifications");
  }
}

- (void)_queue_removeAllScheduledNotifications
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6(a1);
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
  HDMHSOMNotificationManager *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[HDMHSOMNotificationManager unitTest_didEvaluateIfMaintenanceWorkIsNeeded](self, "unitTest_didEvaluateIfMaintenanceWorkIsNeeded");
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

- (void)typicalDayDidUpdate:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDMHSOMNotificationManager _rescheduleNotifications](self, "_rescheduleNotifications");
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
  -[HDMHSOMNotificationManager _queue_start](self, "_queue_start");
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isProtectedDataAvailable");
  if ((_DWORD)v5)
  {
    -[HDMHSOMNotificationManager _queue_enqueueMaintenanceRemovalIfNeeded](self, "_queue_enqueueMaintenanceRemovalIfNeeded");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_queue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__HDMHSOMNotificationManager_profileDidBecomeReady___block_invoke;
    v10[3] = &unk_2511A1F30;
    v10[4] = self;
    objc_msgSend(v8, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", v9, v10);

  }
}

uint64_t __52__HDMHSOMNotificationManager_profileDidBecomeReady___block_invoke(uint64_t a1)
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
    || (-[HKMHSettingsManager hasAnyStateOfMindReminderEnabled](self->_settingsManager, "hasAnyStateOfMindReminderEnabled") & 1) != 0)
  {
    -[HDMHSOMNotificationManager _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:](self, "_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:", 0);
  }
  else
  {
    v3 = (void *)MEMORY[0x24BE40AF8];
    -[HDMHSOMNotificationManager maintenanceOperationName](self, "maintenanceOperationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v10[4] = self;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke;
    v11[3] = &unk_2511A1F30;
    v11[4] = self;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2;
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
    -[HDMHSOMNotificationManager _unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:](self, "_unitTest_notifyDidEvaluateIfMaintenanceWorkIsNeeded:", 1);

  }
}

uint64_t __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_runMaintenanceRemoval");
}

void __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2(uint64_t a1)
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
  -[HDMHSOMNotificationManager _queue_removeAllScheduledNotificationsIfNotEnabled](self, "_queue_removeAllScheduledNotificationsIfNotEnabled", *(_OWORD *)v6);
  self->_queue_hasEnqueuedMaintenanceWork = 0;
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

- (HDMHTypicalDayProviding)typicalDayProvider
{
  return self->_typicalDayProvider;
}

- (void)setTypicalDayProvider:(id)a3
{
  objc_storeStrong((id *)&self->_typicalDayProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typicalDayProvider, 0);
  objc_storeStrong((id *)&self->_restorableAlarm, 0);
  objc_storeStrong(&self->unitTest_didEvaluateIfMaintenanceWorkIsNeeded, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_requestFromAlarmEvent:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  OUTLINED_FUNCTION_6(a1);
  v5 = (id)OUTLINED_FUNCTION_3();
  objc_msgSend(a3, "eventIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_2416F5000, v6, v7, "[%{public}@] Could not create notification request from event identifier: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_2();
}

void __63__HDMHSOMNotificationManager__queue_alarm_didReceiveDueEvents___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 40);
  v9 = 138543874;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2114;
  v14 = a3;
  v8 = v6;
  _os_log_error_impl(&dword_2416F5000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error posting user notification for request %@: %{public}@", (uint8_t *)&v9, 0x20u);

}

void __60__HDMHSOMNotificationManager__queue_rescheduleNotifications__block_invoke_cold_1(uint64_t a1, void *a2)
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
  OUTLINED_FUNCTION_0(&dword_2416F5000, v6, v7, "[%{public}@] Error checking for due events before rescheduling: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

void __70__HDMHSOMNotificationManager__queue_enqueueMaintenanceRemovalIfNeeded__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_2416F5000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Maintenance work canceled", (uint8_t *)&v4, 0xCu);

}

@end
