@implementation MTAlarmScheduler

- (id)nextAlarm
{
  return -[MTAlarmScheduler nextAlarmIncludingBedtimeNotification:](self, "nextAlarmIncludingBedtimeNotification:", 0);
}

- (id)nextAlarmIncludingBedtimeNotification:(BOOL)a3
{
  void *v3;
  void *v4;

  -[MTAlarmScheduler nextScheduledAlarmIncludingBedtimeNotification:](self, "nextScheduledAlarmIncludingBedtimeNotification:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextScheduledAlarmIncludingBedtimeNotification:(BOOL)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  NSObject *v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  -[MTAlarmScheduler serializer](self, "serializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__MTAlarmScheduler_nextScheduledAlarmIncludingBedtimeNotification___block_invoke;
  v10[3] = &unk_1E39CCC38;
  v12 = &v14;
  v10[4] = self;
  v13 = a3;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "performBlock:", v10);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

intptr_t __67__MTAlarmScheduler_nextScheduledAlarmIncludingBedtimeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_nextScheduledAlertIncludingBedtimeNotification:", *(unsigned __int8 *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_nextScheduledAlertIncludingBedtimeNotification:(BOOL)a3
{
  MTScheduledList *scheduledAlarms;

  scheduledAlarms = self->_scheduledAlarms;
  if (a3)
    -[MTScheduledList nextScheduledAlertOrNotification](scheduledAlarms, "nextScheduledAlertOrNotification");
  else
    -[MTScheduledList nextScheduledAlert](scheduledAlarms, "nextScheduledAlert");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MTAlarmScheduler *v10;

  v6 = a4;
  v7 = a3;
  +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTAlarmScheduler.access-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTAlarmScheduler initWithStorage:notificationCenter:scheduler:defaults:](self, "initWithStorage:notificationCenter:scheduler:defaults:", v7, v6, v8, v9);

  return v10;
}

- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  MTAlarmScheduler *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[MTXPCScheduler xpcSchedulerWithEvent:](MTXPCScheduler, "xpcSchedulerWithEvent:", CFSTR("com.apple.MTAlarmScheduler.alarm-event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  MTCurrentDateProvider();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MTAlarmScheduler initWithStorage:notificationCenter:scheduler:defaults:schedulingDelegate:taskScheduler:currentDateProvider:](self, "initWithStorage:notificationCenter:scheduler:defaults:schedulingDelegate:taskScheduler:currentDateProvider:", v13, v12, v11, v10, v14, v15, v16);

  return v17;
}

- (MTAlarmScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6 schedulingDelegate:(id)a7 taskScheduler:(id)a8 currentDateProvider:(id)a9
{
  id v16;
  id v17;
  id v18;
  MTAlarmScheduler *v19;
  NSObject *v20;
  uint64_t v21;
  id currentDateProvider;
  MTScheduledList *v23;
  MTScheduledList *scheduledAlarms;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  MTAlarmScheduler *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v30 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v18 = a9;
  v31.receiver = self;
  v31.super_class = (Class)MTAlarmScheduler;
  v19 = -[MTAlarmScheduler init](&v31, sel_init);
  if (v19)
  {
    v26 = v17;
    MTLogForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    v21 = objc_msgSend(v18, "copy");
    currentDateProvider = v19->_currentDateProvider;
    v19->_currentDateProvider = (id)v21;

    objc_storeStrong((id *)&v19->_schedulingDelegate, a7);
    objc_storeStrong((id *)&v19->_taskScheduler, a8);
    objc_storeStrong((id *)&v19->_notificationCenter, a4);
    objc_storeStrong((id *)&v19->_defaults, a6);
    objc_storeStrong((id *)&v19->_storage, a3);
    objc_msgSend(v16, "registerObserver:", v19);
    v23 = -[MTScheduledList initWithDelegate:]([MTScheduledList alloc], "initWithDelegate:", v19);
    scheduledAlarms = v19->_scheduledAlarms;
    v19->_scheduledAlarms = v23;

    objc_storeStrong((id *)&v19->_serializer, a5);
    v17 = v26;
  }

  return v19;
}

- (void)rescheduleAlarmsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTAlarmScheduler serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MTAlarmScheduler_rescheduleAlarmsWithCompletion___block_invoke;
  v7[3] = &unk_1E39CB880;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __51__MTAlarmScheduler_rescheduleAlarmsWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleAlarmsWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)cleanDeliveredNotifications
{
  void *v3;
  char v4;
  id v5;

  -[MTAlarmScheduler notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTAlarmScheduler notificationCenter](self, "notificationCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllDeliveredNotifications");

  }
}

- (void)_rescheduleAlarmsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  MTAlarmScheduler *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTAlarmScheduler storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allAlarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2050;
    v11 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ rescheduling %{public}ld alarms", (uint8_t *)&v8, 0x16u);
  }

  -[MTScheduledList reset](self->_scheduledAlarms, "reset");
  -[MTAlarmScheduler _scheduleAlarms:withCompletion:](self, "_scheduleAlarms:withCompletion:", v6, v4);

}

- (void)scheduleAlarms:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTAlarmScheduler serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__MTAlarmScheduler_scheduleAlarms___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __35__MTAlarmScheduler_scheduleAlarms___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    v11 = 138543618;
    v12 = v3;
    v13 = 2050;
    v14 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}ld alarms", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_additionalAlarmsToScheduleForAlarms:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v5, "count");
    v11 = 138543618;
    v12 = v7;
    v13 = 2050;
    v14 = v8;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}ld additional alarms", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "arrayByAddingObjectsFromArray:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_scheduleAlarms:withCompletion:", v10, 0);

}

- (id)_additionalAlarmsToScheduleForAlarms:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__MTAlarmScheduler__additionalAlarmsToScheduleForAlarms___block_invoke;
  v11[3] = &unk_1E39CCB20;
  v11[4] = &v12;
  v11[5] = &v16;
  objc_msgSend(v4, "na_each:", v11);
  if (*((unsigned __int8 *)v17 + 24) == *((unsigned __int8 *)v13 + 24))
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[MTAlarmScheduler storage](self, "storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sleepAlarms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __57__MTAlarmScheduler__additionalAlarmsToScheduleForAlarms___block_invoke_2;
    v10[3] = &unk_1E39CCB48;
    v10[4] = &v16;
    objc_msgSend(v8, "na_filter:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __57__MTAlarmScheduler__additionalAlarmsToScheduleForAlarms___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "isSleepAlarm");
  v4 = v6;
  if (v3)
  {
    if (objc_msgSend(v6, "isSingleTimeAlarm"))
      v5 = *(_QWORD *)(a1 + 32);
    else
      v5 = *(_QWORD *)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) = 1;
    v4 = v6;
  }

}

uint64_t __57__MTAlarmScheduler__additionalAlarmsToScheduleForAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
  return objc_msgSend(a2, "isSingleTimeAlarm") ^ v2;
}

- (void)_scheduleAlarms:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD block[5];
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  MTAlarmScheduler *v52;
  __int16 v53;
  _BYTE v54[14];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = a4;
  kdebug_trace();
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarmScheduler _lastAlarmTriggerDate](self, "_lastAlarmTriggerDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -900.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v9;
  if (objc_msgSend(v8, "mtIsBeforeOrSameAsDate:", v9))
  {
    MTLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v52 = self;
      v53 = 1024;
      *(_DWORD *)v54 = 15;
      *(_WORD *)&v54[4] = 2114;
      *(_QWORD *)&v54[6] = v9;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ fired last alarm more than %d minutes ago.  Seeing if we have to fire any alarms we missed since %{public}@", buf, 0x1Cu);
    }

    v11 = v9;
  }
  else
  {
    v12 = objc_msgSend(v8, "mtIsAfterDate:", v7);
    MTLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v52 = self;
        _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ the last alarm fire date is ahead of the current date (probably because we went back in time).", buf, 0xCu);
      }

      v15 = v7;
      -[MTAlarmScheduler _setLastAlarmTriggerDate:](self, "_setLastAlarmTriggerDate:", v15);
      goto LABEL_13;
    }
    if (v14)
    {
      *(_DWORD *)buf = 138543874;
      v52 = self;
      v53 = 1024;
      *(_DWORD *)v54 = 15;
      *(_WORD *)&v54[4] = 2114;
      *(_QWORD *)&v54[6] = v8;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ fired last alarm less than %d minutes ago.  Seeing if we have to fire any alarms we missed since %{public}@", buf, 0x1Cu);
    }

    v11 = v8;
  }
  v15 = v11;
LABEL_13:
  v41 = v8;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v17)
    goto LABEL_39;
  v18 = v17;
  v19 = *(_QWORD *)v47;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v47 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
      if (objc_msgSend(v21, "isSnoozed")
        && (objc_msgSend(v21, "snoozeFireDate"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "mtIsBeforeDate:", v15),
            v22,
            v23))
      {
        v24 = (void *)objc_msgSend(v21, "mutableCopy");
        if ((objc_msgSend(v21, "repeats") & 1) != 0 || (objc_msgSend(v21, "isSleepAlarm") & 1) != 0)
        {
          MTLogForCategory(3);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v24, "alarmID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = self;
            v53 = 2114;
            *(_QWORD *)v54 = v26;
            _os_log_impl(&dword_19AC4E000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing fire date for really old snoozed alarm %{public}@", buf, 0x16u);

          }
          objc_msgSend(v24, "setSnoozeFireDate:", 0);
          if (v24)
            goto LABEL_31;
        }
        else
        {
          MTLogForCategory(3);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v24, "alarmID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = self;
            v53 = 2114;
            *(_QWORD *)v54 = v33;
            _os_log_impl(&dword_19AC4E000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting really old snoozed alarm %{public}@ to disabled", buf, 0x16u);

          }
          objc_msgSend(v24, "setEnabled:", 0);
          if (v24)
            goto LABEL_31;
        }
      }
      else if (objc_msgSend(v21, "isFiring"))
      {
        objc_msgSend(v21, "firedDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceDate:", v27);
        v29 = v28;

        if (v29 > 172800.0)
        {
          v24 = (void *)objc_msgSend(v21, "mutableCopy");
          MTLogForCategory(3);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v24, "alarmID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = self;
            v53 = 2114;
            *(_QWORD *)v54 = v31;
            _os_log_impl(&dword_19AC4E000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing fire date for really old firing alarm %{public}@", buf, 0x16u);

          }
          objc_msgSend(v24, "setFiredDate:", 0);
          if (v24)
          {
LABEL_31:
            -[MTAlarmStorage updateAlarm:withCompletion:source:](self->_storage, "updateAlarm:withCompletion:source:", v24, 0, self);

          }
        }
      }
      ++v20;
    }
    while (v18 != v20);
    v34 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    v18 = v34;
  }
  while (v34);
LABEL_39:

  MTNewChildActivityForName(11);
  v35 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MTAlarmScheduler__scheduleAlarms_withCompletion___block_invoke;
  block[3] = &unk_1E39CCB70;
  block[4] = self;
  v43 = v16;
  v44 = v15;
  v45 = v39;
  v36 = v39;
  v37 = v15;
  v38 = v16;
  os_activity_apply(v35, block);

}

void __51__MTAlarmScheduler__scheduleAlarms_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 138543618;
    v14 = v3;
    v15 = 2050;
    v16 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}lu alarms", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "scheduledAlarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__MTAlarmScheduler__scheduleAlarms_withCompletion___block_invoke_18;
  v11[3] = &unk_1E39CC398;
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v5, "schedule:afterDate:withCompletion:", v6, v7, v11);

  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(v9 + 24);
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled alarms: %{public}@", buf, 0x16u);
  }

}

uint64_t __51__MTAlarmScheduler__scheduleAlarms_withCompletion___block_invoke_18(uint64_t a1)
{
  uint64_t result;

  kdebug_trace();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)unscheduleAlarms:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTAlarmScheduler serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__MTAlarmScheduler_unscheduleAlarms___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __37__MTAlarmScheduler_unscheduleAlarms___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_unscheduleAlarms:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_additionalAlarmsToScheduleForAlarms:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_scheduleAlarms:withCompletion:", v2, 0);

}

- (void)_unscheduleAlarms:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  MTNewChildActivityForName(11);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MTAlarmScheduler__unscheduleAlarms___block_invoke;
  block[3] = &unk_1E39CB7B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  os_activity_apply(v5, block);

}

void __38__MTAlarmScheduler__unscheduleAlarms___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 138543618;
    v10 = v3;
    v11 = 2050;
    v12 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ unscheduling %{public}lu alarms", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "scheduledAlarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unschedule:", *(_QWORD *)(a1 + 40));

  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 24);
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled alarms: %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)scheduledListDidChange:(id)a3 withCompletion:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  MTAlarmScheduler *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MTAlarmScheduler _queue_updateNextAlarmTimerWithCompletion:](self, "_queue_updateNextAlarmTimerWithCompletion:", a4);
  -[MTAlarmScheduler scheduledAlarms](self, "scheduledAlarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextScheduledAlertOrNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "scheduleable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ next alarm changed: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  MTLogForCategory(9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_INFO, "MTAlarmScheduler - Changing Next Alarm", (uint8_t *)&v12, 2u);
  }

  -[MTAlarmScheduler delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheduler:didChangeNextAlarm:", self, v6);

}

- (void)_queue_updateNextAlarmTimerWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  unint64_t v6;
  void *v7;
  double v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  uint8_t buf[4];
  MTAlarmScheduler *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)&v6 = COERCE_DOUBLE(-[MTScheduledList numberOfScheduledAlertsAndNotifications](self->_scheduledAlarms, "numberOfScheduledAlertsAndNotifications"));
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2050;
    v22 = *(double *)&v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ has %{public}ld scheduled alerts and notifications", buf, 0x16u);
  }

  -[MTAlarmScheduler _nextTriggerDateForScheduling](self, "_nextTriggerDateForScheduling");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -10.0);
  v8 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  if (v8 == 0.0)
  {
    -[MTAlarmScheduler _queue_unregisterTimer](self, "_queue_unregisterTimer");
    if (!v4)
      goto LABEL_20;
    goto LABEL_19;
  }
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling persistent timer for next alert at %{public}@", buf, 0x16u);
  }

  (*((void (**)(void))self->_currentDateProvider + 2))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&v8, "timeIntervalSinceDate:", v10);
  v12 = v11;

  if (v12 <= 0.0)
  {
    MTLogForCategory(3);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer should have fired.  Triggering it now", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__MTAlarmScheduler__queue_updateNextAlarmTimerWithCompletion___block_invoke;
    v17[3] = &unk_1E39CC398;
    v18 = v4;
    -[MTAlarmScheduler _queue_fireTriggeredAlarmsWithCompletionBlock:](self, "_queue_fireTriggeredAlarmsWithCompletionBlock:", v17);

    goto LABEL_20;
  }
  MTLogForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12 <= 60.0)
  {
    if (!v14)
      goto LABEL_18;
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2048;
    v22 = v12;
    v15 = "%{public}@ Timer will fire %f seconds from now";
  }
  else
  {
    if (!v14)
      goto LABEL_18;
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2048;
    v22 = v12 / 60.0;
    v15 = "%{public}@ Timer will fire %f minutes from now";
  }
  _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
LABEL_18:

  kdebug_trace();
  -[MTSchedulingDelegate scheduleTimerForSeconds:](self->_schedulingDelegate, "scheduleTimerForSeconds:", v12);
  kdebug_trace();
  if (v4)
LABEL_19:
    v4[2](v4);
LABEL_20:

}

uint64_t __62__MTAlarmScheduler__queue_updateNextAlarmTimerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_queue_unregisterTimer
{
  NSObject *v3;
  int v4;
  MTAlarmScheduler *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Unscheduling persistent timer.", (uint8_t *)&v4, 0xCu);
  }

  -[MTSchedulingDelegate unscheduleTimer](self->_schedulingDelegate, "unscheduleTimer");
}

+ (id)_intervalToCheckForAlarmsToFireBeforeDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "dateByAddingTimeInterval:", 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -900.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v4);
  return v6;
}

- (void)_queue_triggerDidFireForAlarmWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTAlarmScheduler *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm timer fired", (uint8_t *)&v6, 0xCu);
  }

  -[MTAlarmScheduler _queue_unregisterTimer](self, "_queue_unregisterTimer");
  -[MTAlarmScheduler _queue_fireTriggeredAlarmsWithCompletionBlock:](self, "_queue_fireTriggeredAlarmsWithCompletionBlock:", v4);

}

- (BOOL)_shouldPostNotificationForScheduledAlarm:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  MTAlarmScheduler *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isVisible");
  if ((v5 & 1) == 0)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "scheduleable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trigger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = self;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ is for non-visible event %{public}@", (uint8_t *)&v11, 0x20u);

    }
  }

  return v5;
}

- (void)_fireScheduledAlarm:(id)a3 firedDate:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  MTAlarmStorage *storage;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  MTAlarmScheduler *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (-[MTScheduledList isScheduled:](self->_scheduledAlarms, "isScheduled:", v8))
  {
    MTLogForCategory(9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_INFO, "MTAlarmScheduler - Firing Alarm", buf, 2u);
    }

    MTLogForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "scheduleable");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "alarmID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v14;
      v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ fired (scheduled fire date: %{public}@)", buf, 0x20u);

    }
    -[MTScheduledList _unscheduleObject:](self->_scheduledAlarms, "_unscheduleObject:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      MTLogForCategory(3);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v38 = self;
        v39 = 2114;
        v40 = v8;
        _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ first dismissing related notifications for %{public}@", buf, 0x16u);
      }

      -[MTNotificationCenter dismissRelatedNotificationsForScheduledAlarm:](self->_notificationCenter, "dismissRelatedNotificationsForScheduledAlarm:", v8);
    }
    v16 = -[MTAlarmScheduler _shouldPostNotificationForScheduledAlarm:](self, "_shouldPostNotificationForScheduledAlarm:", v8);
    MTLogForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543618;
        v38 = self;
        v39 = 2114;
        v40 = v8;
        _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ post notification for %{public}@", buf, 0x16u);
      }

      -[MTNotificationCenter postNotificationForScheduledAlarm:completionBlock:](self->_notificationCenter, "postNotificationForScheduledAlarm:completionBlock:", v8, v10);
    }
    else
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543618;
        v38 = self;
        v39 = 2114;
        v40 = v8;
        _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ not posting notification for %{public}@", buf, 0x16u);
      }

      v10[2](v10);
    }
    -[MTAlarmScheduler _setLastAlarmTriggerDate:](self, "_setLastAlarmTriggerDate:", v9);
    objc_msgSend(v8, "scheduleable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v8, "trigger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isBedtimeRelated");

    if (v25)
      objc_msgSend(v23, "setBedtimeFiredDate:", v9);
    else
      objc_msgSend(v23, "setFiredDate:", v9);
    objc_msgSend(v8, "trigger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isForSnooze");

    if (v27)
    {
      objc_msgSend(v8, "trigger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isForGoToBed");

      if (v29)
        objc_msgSend(v23, "setBedtimeSnoozeFireDate:", 0);
      else
        objc_msgSend(v23, "setSnoozeFireDate:", 0);
    }
    if ((objc_msgSend(v23, "repeats") & 1) == 0 && (objc_msgSend(v23, "isSleepAlarm") & 1) == 0)
    {
      MTLogForCategory(3);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v23, "alarmID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = self;
        v39 = 2114;
        v40 = v31;
        _os_log_impl(&dword_19AC4E000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting non-repeating alarm %{public}@ to disabled", buf, 0x16u);

      }
      objc_msgSend(v23, "setEnabled:", 0);
    }
    storage = self->_storage;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke;
    v34[3] = &unk_1E39CCB98;
    v34[4] = self;
    v35 = v23;
    v36 = v8;
    v33 = v23;
    -[MTAlarmStorage updateAlarm:withCompletion:source:](storage, "updateAlarm:withCompletion:source:", v33, v34, self);

  }
  else
  {
    MTLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "scheduleable");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = self;
      v39 = 2114;
      v40 = v21;
      _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ was supposed to fire but is no longer scheduled", buf, 0x16u);

    }
    v10[2](v10);
  }

}

void __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke_2;
  v6[3] = &unk_1E39CCA78;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "alarmWithIdentifier:withCompletion:", v3, v6);

}

void __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTScheduledObject scheduledObjectForScheduleable:trigger:](MTScheduledObject, "scheduledObjectForScheduleable:trigger:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheduler:didFireAlarm:", *(_QWORD *)(a1 + 40), v6);

  objc_msgSend(*(id *)(a1 + 40), "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke_3;
  v9[3] = &unk_1E39CB858;
  v9[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "performBlock:", v9);

}

void __66__MTAlarmScheduler__fireScheduledAlarm_firedDate_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scheduledAlarms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextScheduledAlertOrNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MTLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no next alarm", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduler:didChangeNextAlarm:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)_queue_fireTriggeredAlarmsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  MTNewChildActivityForName(10);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E39CB880;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  os_activity_apply(v5, block);

}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E39CB880;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performBlock:", v4);

}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id obj;
  void *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[6];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  double v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 24);
    *(_DWORD *)buf = 138543618;
    v49 = v3;
    v50 = 2114;
    v51 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduled alarms: %{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_intervalToCheckForAlarmsToFireBeforeDate:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v49 = v8;
    v50 = 2114;
    v51 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Find notifications with current trigger date in range %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "scheduledObjectsToFireInInterval:", v6);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v45;
    v13 = 0x1E39C9000;
    v36 = a1;
    do
    {
      v14 = 0;
      v15 = v5;
      do
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        objc_msgSend(v16, "trigger");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "triggerDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = 0.0;
        if (objc_msgSend(v5, "mtIsBeforeDate:", v18))
        {
          objc_msgSend(v18, "timeIntervalSinceDate:", v5);
          v19 = v20;
          MTLogForCategory(4);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v37 = v5;
            v22 = v11;
            v23 = v12;
            v24 = v10;
            v25 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v16, "scheduleable");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v49 = v25;
            v10 = v24;
            v12 = v23;
            v11 = v22;
            v5 = v37;
            v50 = 2114;
            v51 = (uint64_t)v27;
            v52 = 2048;
            v53 = v19;
            _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ should actually fire in %f seconds", buf, 0x20u);

            a1 = v36;
          }

          v13 = 0x1E39C9000uLL;
        }
        v28 = *(void **)(v13 + 3864);
        v42[0] = v10;
        v42[1] = 3221225472;
        v42[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_26;
        v42[3] = &unk_1E39CCBC0;
        v42[4] = *(_QWORD *)(a1 + 32);
        v42[5] = v16;
        v43 = v18;
        v29 = v18;
        objc_msgSend(v28, "taskWithIdentifier:delay:completableBlock:", CFSTR("com.apple.MTAlarmTask.fire"), v42, v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v30);

        ++v14;
        v15 = v5;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v11);
  }
  kdebug_trace();
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(a1 + 40);
  v33 = *(void **)(v31 + 64);
  v40[0] = v10;
  v40[1] = 3221225472;
  v40[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_3;
  v40[3] = &unk_1E39CB880;
  v40[4] = v31;
  v41 = v32;
  +[MTTaskGroup taskGroupWithTasks:completionBlock:](MTTaskGroup, "taskGroupWithTasks:completionBlock:", v39, v40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "scheduleTaskGroup:", v34);

}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  __int128 v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_2_27;
  v6[3] = &unk_1E39CCB70;
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

uint64_t __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_2_27(uint64_t a1)
{
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_fireScheduledAlarm:firedDate:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  uint64_t v8;
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v6 = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_4;
  v7 = &unk_1E39CCC10;
  v2 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v5 = 3221225472;
  v9 = v2;
  +[MTTask taskWithIdentifier:completableBlock:](MTTask, "taskWithIdentifier:completableBlock:", CFSTR("com.apple.MTAlarmTask.reschedule"), &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "scheduleTask:", v3, v4, v5, v6, v7, v8);

}

void __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fired all alarms.  Rescheduling.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_30;
  v8[3] = &unk_1E39CCBE8;
  v6 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v6, "rescheduleAlarmsWithCompletion:", v8);

}

uint64_t __66__MTAlarmScheduler__queue_fireTriggeredAlarmsWithCompletionBlock___block_invoke_30(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_lastAlarmTriggerDate
{
  MTPersistence *defaults;
  void *v3;
  void *v4;

  defaults = self->_defaults;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPersistence objectForKey:defaultValue:](defaults, "objectForKey:defaultValue:", CFSTR("MTAlarmLastTriggerDate"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setLastAlarmTriggerDate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTAlarmScheduler *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting last alarm trigger date to %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[MTPersistence setObject:forKey:](self->_defaults, "setObject:forKey:", v4, CFSTR("MTAlarmLastTriggerDate"));
}

- (id)nextTriggerDate
{
  return -[MTAlarmScheduler nextTriggerDateIncludingBedtimeNotification:](self, "nextTriggerDateIncludingBedtimeNotification:", 0);
}

- (id)nextTriggerDateIncludingBedtimeNotification:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[MTAlarmScheduler nextScheduledAlarmIncludingBedtimeNotification:](self, "nextScheduledAlarmIncludingBedtimeNotification:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_nextTriggerDateForScheduling
{
  void *v2;
  void *v3;
  void *v4;

  -[MTScheduledList nextScheduledObject](self->_scheduledAlarms, "nextScheduledObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sourceIdentifier
{
  return CFSTR("MTAlarmScheduler");
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  -[MTAlarmScheduler scheduleAlarms:](self, "scheduleAlarms:", a4);
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  MTAlarmScheduler *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 != self)
  {
    MTLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received update of alarms %{public}@.  Rescheduling them.", buf, 0x16u);
    }

    -[MTAlarmScheduler scheduleAlarms:](self, "scheduleAlarms:", v6);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__MTAlarmScheduler_source_didUpdateAlarms___block_invoke;
  v8[3] = &unk_1E39CC500;
  v8[4] = self;
  objc_msgSend(v6, "na_each:", v8);

}

void __43__MTAlarmScheduler_source_didUpdateAlarms___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "snoozeFireDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "alarmIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTUserNotificationCenter _snoozeCountdownIdentifier:](MTUserNotificationCenter, "_snoozeCountdownIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissNotificationsWithIdentifiers:", v10);

    }
  }

}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5;
  _QWORD v6[5];

  v5 = a4;
  -[MTAlarmScheduler unscheduleAlarms:](self, "unscheduleAlarms:", v5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MTAlarmScheduler_source_didRemoveAlarms___block_invoke;
  v6[3] = &unk_1E39CC500;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);

}

void __43__MTAlarmScheduler_source_didRemoveAlarms___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissNotificationsForAlarm:", v3);

}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  MTAlarmScheduler *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarmScheduler scheduleAlarms:](self, "scheduleAlarms:", v11);

    if (a5 != 1)
    {
      -[MTAlarmScheduler notificationCenter](self, "notificationCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[MTAlarmScheduler notificationCenter](self, "notificationCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dismissNotificationsForAlarm:includeSnooze:", v10, 0);

      }
      MTLogForCategory(3);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        v21 = self;
        v22 = 2114;
        v23 = v10;
        _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ posting snooze countdown notification for snoozed alarm %{public}@", (uint8_t *)&v20, 0x16u);
      }

      objc_msgSend(v10, "snoozeFireDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTTrigger triggerWithDate:triggerType:](MTTrigger, "triggerWithDate:triggerType:", v16, 6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTScheduledObject scheduledObjectForScheduleable:trigger:](MTScheduledObject, "scheduledObjectForScheduleable:trigger:", v10, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[MTAlarmScheduler notificationCenter](self, "notificationCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationForScheduledAlarm:completionBlock:", v18, &__block_literal_global_16);

    }
  }

}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MTAlarmScheduler *v12;
  unint64_t v13;

  v7 = a4;
  -[MTAlarmScheduler serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__MTAlarmScheduler_source_didDismissAlarm_dismissAction___block_invoke;
  v10[3] = &unk_1E39CBA08;
  v11 = v7;
  v12 = self;
  v13 = a5;
  v9 = v7;
  objc_msgSend(v8, "performBlock:", v10);

}

void __57__MTAlarmScheduler_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dismissNotificationsForAlarm:dismissAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    }
  }
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  if (a4 == 2)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MTAlarmScheduler.alarm-event"));
  else
    return 0;
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  MTAlarmScheduler *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  kdebug_trace();
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ handling notification %{public}@", buf, 0x16u);
  }

  -[MTAlarmScheduler serializer](self, "serializer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__MTAlarmScheduler_handleNotification_ofType_completion___block_invoke;
  v12[3] = &unk_1E39CB880;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "performBlock:", v12);

}

void __57__MTAlarmScheduler_handleNotification_ofType_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__MTAlarmScheduler_handleNotification_ofType_completion___block_invoke_2;
  v2[3] = &unk_1E39CC398;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_queue_triggerDidFireForAlarmWithCompletionBlock:", v2);

}

uint64_t __57__MTAlarmScheduler_handleNotification_ofType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTAlarmScheduler-----", (uint8_t *)&v6, 2u);
  }

  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarmScheduler scheduledAlarms](self, "scheduledAlarms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Scheduled Alarms: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (id)gatherDiagnostics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("Scheduled alarms");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[MTAlarmScheduler scheduledAlarms](self, "scheduledAlarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfScheduledAlerts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MTAlarmScheduleDelegate)delegate
{
  return (MTAlarmScheduleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTAlarmStorage)storage
{
  return self->_storage;
}

- (MTScheduledList)scheduledAlarms
{
  return self->_scheduledAlarms;
}

- (MTNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (MTSchedulingDelegate)schedulingDelegate
{
  return self->_schedulingDelegate;
}

- (MTTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (MTPersistence)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_schedulingDelegate, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_scheduledAlarms, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
