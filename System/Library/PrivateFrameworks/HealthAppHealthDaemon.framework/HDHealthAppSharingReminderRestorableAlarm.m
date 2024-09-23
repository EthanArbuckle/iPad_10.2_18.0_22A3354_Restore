@implementation HDHealthAppSharingReminderRestorableAlarm

- (HDHealthAppSharingReminderRestorableAlarm)initWithDaemon:(id)a3
{
  id v4;
  HDHealthAppSharingReminderRestorableAlarm *v5;
  HDHealthAppSharingReminderRestorableAlarm *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HDKeyValueDomain *sharingKeyValueDomain;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v11;
  void *v12;
  uint64_t v13;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *notificationManager;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDHealthAppSharingReminderRestorableAlarm;
  v5 = -[HDHealthAppSharingReminderRestorableAlarm init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = objc_alloc(MEMORY[0x24BE40AD0]);
    objc_msgSend(v4, "primaryProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithCategory:domainName:profile:", 1, CFSTR("HDHealthAppDaemonExtension"), v8);
    sharingKeyValueDomain = v6->_sharingKeyValueDomain;
    v6->_sharingKeyValueDomain = (HDKeyValueDomain *)v9;

    v11 = [_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager alloc];
    objc_msgSend(v4, "primaryProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HDHealthAppNotificationManager initWithProfile:](v11, "initWithProfile:", v12);
    notificationManager = v6->_notificationManager;
    v6->_notificationManager = (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *)v13;

  }
  return v6;
}

- (NSString)eventIdentifier
{
  return (NSString *)CFSTR("HAHealthAppSharingReminderRestorableAlarmEventIdentifier");
}

- (void)scheduleAlarmWithFallbackDate:(id)a3 restorableAlarmManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HDHealthAppSharingReminderRestorableAlarm sharingReminderDate](self, "sharingReminderDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (-[HDHealthAppSharingReminderRestorableAlarm sharingReminderFallbackNotificationDate:](self, "sharingReminderFallbackNotificationDate:", v6), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[HDHealthAppSharingReminderRestorableAlarm nextSharingReminderDateFromDate:](self, "nextSharingReminderDateFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduleAlarmEventWithHandler:dueDate:eventOptions:", self, v9, 1);
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_opt_class();
      v13 = v12;
      -[HDHealthAppSharingReminderRestorableAlarm eventIdentifier](self, "eventIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_23DB70000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduled alarm event %{public}@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      -[HDHealthAppSharingReminderRestorableAlarm scheduleAlarmWithFallbackDate:restorableAlarmManager:].cold.1(v15, self);
  }

}

- (void)removeScheduledAlarmWithRestorableAlarmManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HDHealthAppDefines sharingReminderNotificationIdentifier](_TtC21HealthAppHealthDaemon18HDHealthAppDefines, "sharingReminderNotificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthAppSharingReminderRestorableAlarm eventIdentifier](self, "eventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "removeAlarmEventWithIdentifier:error:", v6, &v14);

  v7 = v14;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3070];
  v9 = *MEMORY[0x24BDD3070];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDHealthAppSharingReminderRestorableAlarm removeScheduledAlarmWithRestorableAlarmManager:].cold.1();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v8;
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[HDHealthAppSharingReminderRestorableAlarm eventIdentifier](self, "eventIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_23DB70000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removed alarm event %{public}@", buf, 0x16u);

  }
  -[HDHealthAppNotificationManager removeNotificationWithIdentifier:](self->_notificationManager, "removeNotificationWithIdentifier:", v5);

}

- (void)handleAlarmEvent:(id)a3 restorableAlarmManager:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id WeakRetained;
  void *v18;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  HDHealthAppSharingReminderRestorableAlarm *v28;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x24BDD3070];
  v12 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (void *)objc_opt_class();
    v15 = v14;
    objc_msgSend(v8, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v14;
    v44 = 2114;
    v45 = v16;
    _os_log_impl(&dword_23DB70000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received alarm event %{public}@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[HDHealthAppNotificationManager initWithProfile:]([_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager alloc], "initWithProfile:", v18);
  _HKInitializeLogging();
  v20 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v43 = v22;
    v23 = v22;
    _os_log_impl(&dword_23DB70000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating sharing reminder notification.", buf, 0xCu);

  }
  v41 = 0;
  -[HDHealthAppNotificationManager createSharingReminderNotificationAndReturnError:](v19, "createSharingReminderNotificationAndReturnError:", &v41);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v41;
  v26 = v25;
  if (!v24 || v25)
  {
    -[HDHealthAppSharingReminderRestorableAlarm _handleCompletionWithAlarmEvent:success:error:restorableAlarmManager:completion:](self, "_handleCompletionWithAlarmEvent:success:error:restorableAlarmManager:completion:", v8, 0, v25, v9, v10);
  }
  else
  {
    v27 = objc_loadWeakRetained((id *)&self->_daemon);
    v28 = self;
    v29 = v19;
    v30 = v18;
    v31 = v8;
    v32 = v10;
    v33 = v9;
    v34 = v27;
    objc_msgSend(v27, "primaryProfile");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "notificationManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v33;
    v10 = v32;
    v8 = v31;
    v18 = v30;
    v19 = v29;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __96__HDHealthAppSharingReminderRestorableAlarm_handleAlarmEvent_restorableAlarmManager_completion___block_invoke;
    v37[3] = &unk_250E7E0D8;
    v37[4] = v28;
    v38 = v8;
    v39 = v9;
    v40 = v10;
    objc_msgSend(v36, "postNotificationWithRequest:completion:", v24, v37);

  }
}

uint64_t __96__HDHealthAppSharingReminderRestorableAlarm_handleAlarmEvent_restorableAlarmManager_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletionWithAlarmEvent:success:error:restorableAlarmManager:completion:", *(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_handleCompletionWithAlarmEvent:(id)a3 success:(BOOL)a4 error:(id)a5 restorableAlarmManager:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  os_log_t *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  os_log_t *v29;
  id v30;
  void *v31;
  int v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v10 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, id))a7;
  _HKInitializeLogging();
  v16 = (os_log_t *)MEMORY[0x24BDD3070];
  v17 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = (void *)objc_opt_class();
    v20 = v19;
    objc_msgSend(v12, "eventIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v36 = v19;
    v37 = 2114;
    v38 = v21;
    v39 = 1024;
    v40 = v10;
    v41 = 2114;
    v42 = v13;
    _os_log_impl(&dword_23DB70000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling completion of alarm event %{public}@ success: %d error: %{public}@", buf, 0x26u);

    v16 = (os_log_t *)MEMORY[0x24BDD3070];
  }
  -[HDHealthAppSharingReminderRestorableAlarm currentDate](self, "currentDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v34 = v13;
    v23 = -[HDHealthAppSharingReminderRestorableAlarm setSharingReminderDate:error:](self, "setSharingReminderDate:error:", v22, &v34);
    v24 = v34;

    _HKInitializeLogging();
    v25 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v36 = v27;
      v37 = 2112;
      v38 = v22;
      v39 = 1026;
      v40 = v23;
      v33 = v12;
      v28 = v14;
      v29 = v16;
      v30 = v27;
      _os_log_impl(&dword_23DB70000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updated sharing reminder date to %@ successfully: %{public}d", buf, 0x1Cu);

      v16 = v29;
      v14 = v28;
      v12 = v33;

    }
    if (v23)
    {
      -[HDHealthAppSharingReminderRestorableAlarm nextSharingReminderDateFromDate:](self, "nextSharingReminderDateFromDate:", v22);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rescheduleAlarmEvent:dueDate:", v12, v31);

      v32 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    v24 = v13;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    -[HDHealthAppSharingReminderRestorableAlarm _handleCompletionWithAlarmEvent:success:error:restorableAlarmManager:completion:].cold.1();
  v32 = 0;
LABEL_12:
  v15[2](v15, v32 & v10, v24);

}

- (id)sharingReminderDate
{
  HDKeyValueDomain *sharingKeyValueDomain;
  void *v3;
  id v4;
  id v5;
  id v7;

  sharingKeyValueDomain = self->_sharingKeyValueDomain;
  v7 = 0;
  -[HDKeyValueDomain dateForKey:error:](sharingKeyValueDomain, "dateForKey:error:", CFSTR("HAHealthAppSharingReminderDateNotifiedKey"), &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      -[HDHealthAppSharingReminderRestorableAlarm sharingReminderDate].cold.1();
    v5 = 0;
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (id)sharingReminderFallbackNotificationDate:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  _BOOL4 v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE40AD0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 100, CFSTR("com.apple.Health.SharingEntries"), v7);

  v35 = 0;
  objc_msgSend(v8, "dateForKey:error:", CFSTR("SharingReminderNotificationDate"), &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;
  v11 = v10;
  v12 = 0;
  if (v9)
    v13 = v10 == 0;
  else
    v13 = 0;
  if (!v13)
    goto LABEL_11;
  v34 = 0;
  v14 = -[HDHealthAppSharingReminderRestorableAlarm setSharingReminderDate:error:](self, "setSharingReminderDate:error:", v9, &v34);
  v15 = v34;
  v16 = v15;
  if (!v14)
  {
    v12 = v15;
LABEL_11:
    v21 = v4;
    if (!v21)
    {
      -[HDHealthAppSharingReminderRestorableAlarm currentDate](self, "currentDate");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v22 = (void *)*MEMORY[0x24BDD3070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v24 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v37 = v24;
        v38 = 2112;
        v39 = v21;
        v25 = v24;
        _os_log_impl(&dword_23DB70000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] No fallback date found, using current date as backup to the backup: %@", buf, 0x16u);

      }
    }
    v33 = v12;
    v26 = -[HDHealthAppSharingReminderRestorableAlarm setSharingReminderDate:error:](self, "setSharingReminderDate:error:", v21, &v33);
    v16 = v33;

    _HKInitializeLogging();
    v27 = (void *)*MEMORY[0x24BDD3070];
    v28 = *MEMORY[0x24BDD3070];
    if (v26)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v27;
        v30 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v37 = v30;
        v38 = 2114;
        v39 = v21;
        v31 = v30;
        _os_log_impl(&dword_23DB70000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set sharing reminder date to fallback date: %{public}@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[HDHealthAppSharingReminderRestorableAlarm sharingReminderFallbackNotificationDate:].cold.1();
    }
    goto LABEL_19;
  }
  _HKInitializeLogging();
  v17 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v37 = v19;
    v38 = 2114;
    v39 = v9;
    v20 = v19;
    _os_log_impl(&dword_23DB70000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set sharing reminder date to existing date: %{public}@", buf, 0x16u);

  }
  v21 = v9;
LABEL_19:

  return v21;
}

- (id)nextSharingReminderDateFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HDHealthAppSharingReminderRestorableAlarm sharingReminderRefreshIntervalDateComponents](self, "sharingReminderRefreshIntervalDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sharingReminderRefreshIntervalDateComponents
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v2, "setMonth:", 6);
  return v2;
}

- (BOOL)setSharingReminderDate:(id)a3 error:(id *)a4
{
  return -[HDKeyValueDomain setDate:forKey:error:](self->_sharingKeyValueDomain, "setDate:forKey:error:", a3, CFSTR("HAHealthAppSharingReminderDateNotifiedKey"), a4);
}

- (id)currentDate
{
  NSDate *unitTest_currentDate;

  unitTest_currentDate = self->_unitTest_currentDate;
  if (unitTest_currentDate)
    return unitTest_currentDate;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setUnitTest_userNotificationCenter:(id)a3
{
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v4;
  id WeakRetained;
  void *v6;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v7;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *notificationManager;
  id v9;

  v9 = a3;
  v4 = [_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v7 = -[HDHealthAppNotificationManager initWithProfile:userNotificationCenter:](v4, "initWithProfile:userNotificationCenter:", v6, v9);
  else
    v7 = -[HDHealthAppNotificationManager initWithProfile:](v4, "initWithProfile:", v6);
  notificationManager = self->_notificationManager;
  self->_notificationManager = v7;

}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (UNUserNotificationCenter)unitTest_userNotificationCenter
{
  return self->_unitTest_userNotificationCenter;
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_currentDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_unitTest_userNotificationCenter, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_sharingKeyValueDomain, 0);
}

- (void)scheduleAlarmWithFallbackDate:(void *)a1 restorableAlarmManager:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v3 = OUTLINED_FUNCTION_4(a1);
  v4 = (void *)objc_opt_class();
  v5 = v4;
  objc_msgSend(a2, "eventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_23DB70000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Could not fetch sharing reminder date for %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)removeScheduledAlarmWithRestorableAlarmManager:.cold.1()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_5();
  v14 = *MEMORY[0x24BDAC8D0];
  v4 = v3;
  v5 = (void *)OUTLINED_FUNCTION_3();
  v6 = v5;
  objc_msgSend(v1, "eventIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = v0;
  _os_log_error_impl(&dword_23DB70000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Could not remove alarm event %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

- (void)_handleCompletionWithAlarmEvent:success:error:restorableAlarmManager:completion:.cold.1()
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
  OUTLINED_FUNCTION_2(&dword_23DB70000, v4, v5, "[%{public}@] Error setting date: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)sharingReminderDate
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
  OUTLINED_FUNCTION_2(&dword_23DB70000, v4, v5, "[%{public}@] Could not fetch sharing reminder date: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)sharingReminderFallbackNotificationDate:.cold.1()
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
  OUTLINED_FUNCTION_2(&dword_23DB70000, v4, v5, "[%{public}@] Could not set sharing reminder date: %{public}@. Will try again on handling alarm event.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

@end
