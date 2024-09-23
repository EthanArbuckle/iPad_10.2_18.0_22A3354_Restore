@implementation HDHealthAppRestorableAlarmManager

- (HDHealthAppRestorableAlarmManager)initWithDaemon:(id)a3
{
  id v4;
  HDHealthAppRestorableAlarmManager *v5;
  HDHealthAppRestorableAlarmManager *v6;
  _HKWeakObserversMap *v7;
  _HKWeakObserversMap *alarmHandlers;
  uint64_t v9;
  OS_dispatch_queue *queue;
  id v11;
  void *v12;
  uint64_t v13;
  HDRestorableAlarm *scheduler;
  id WeakRetained;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDHealthAppRestorableAlarmManager;
  v5 = -[HDHealthAppRestorableAlarmManager init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = (_HKWeakObserversMap *)objc_alloc_init(MEMORY[0x24BDD4248]);
    alarmHandlers = v6->_alarmHandlers;
    v6->_alarmHandlers = v7;

    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(MEMORY[0x24BE40BB0]);
    objc_msgSend(v4, "primaryProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithProfile:clientIdentifier:eventHandlerQueue:", v12, CFSTR("HDHealthAppDaemonExtension"), v6->_queue);
    scheduler = v6->_scheduler;
    v6->_scheduler = (HDRestorableAlarm *)v13;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    objc_msgSend(WeakRetained, "registerForDaemonReady:", v6);

  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HDRestorableAlarm *scheduler;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v7 = v12;
    _os_log_impl(&dword_23DB70000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] reported daemon ready", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  scheduler = self->_scheduler;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__HDHealthAppRestorableAlarmManager_daemonReady___block_invoke;
  v9[3] = &unk_250E7E4B8;
  objc_copyWeak(&v10, (id *)buf);
  -[HDRestorableAlarm beginReceivingEventsWithHandler:](scheduler, "beginReceivingEventsWithHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __49__HDHealthAppRestorableAlarmManager_daemonReady___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)createAlarmEventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5
{
  return (id)-[HDRestorableAlarm eventWithIdentifier:dueDate:eventOptions:](self->_scheduler, "eventWithIdentifier:dueDate:eventOptions:", a3, a4, a5);
}

- (void)scheduleAlarmEventWithHandler:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5
{
  -[HDHealthAppRestorableAlarmManager _scheduleAlarmEventWithHandler:dueDate:eventOptions:completion:](self, "_scheduleAlarmEventWithHandler:dueDate:eventOptions:completion:", a3, a4, a5, 0);
}

- (void)_scheduleAlarmEventWithHandler:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "eventIdentifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[HDHealthAppRestorableAlarmManager createAlarmEventWithIdentifier:dueDate:eventOptions:](self, "createAlarmEventWithIdentifier:dueDate:eventOptions:", v14, v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDHealthAppRestorableAlarmManager setHandlerForAlarmEvent:handler:](self, "setHandlerForAlarmEvent:handler:", v13, v12);
  -[HDHealthAppRestorableAlarmManager scheduleAlarmEvent:completion:](self, "scheduleAlarmEvent:completion:", v13, v10);

}

- (void)setHandlerForAlarmEvent:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HDHealthAppRestorableAlarmManager_setHandlerForAlarmEvent_handler___block_invoke;
  block[3] = &unk_250E7E4E0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __69__HDHealthAppRestorableAlarmManager_setHandlerForAlarmEvent_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "eventIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:queue:forKey:", v2, v4, v5);

}

- (void)scheduleAlarmEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HDHealthAppRestorableAlarmManager_scheduleAlarmEvent_completion___block_invoke;
  block[3] = &unk_250E7E508;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __67__HDHealthAppRestorableAlarmManager_scheduleAlarmEvent_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleAlarmEvent:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)rescheduleAlarmEvent:(id)a3 dueDate:(id)a4
{
  -[HDHealthAppRestorableAlarmManager _rescheduleAlarmEvent:dueDate:completion:](self, "_rescheduleAlarmEvent:dueDate:completion:", a3, a4, 0);
}

- (void)_rescheduleAlarmEvent:(id)a3 dueDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__HDHealthAppRestorableAlarmManager__rescheduleAlarmEvent_dueDate_completion___block_invoke;
  v15[3] = &unk_250E7E530;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __78__HDHealthAppRestorableAlarmManager__rescheduleAlarmEvent_dueDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAlarmEvent:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createAlarmEventWithIdentifier:dueDate:eventOptions:", v3, *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "eventOptions"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleAlarmEvent:completion:", v4, *(_QWORD *)(a1 + 56));
}

- (BOOL)removeAlarmEventWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  HDRestorableAlarm *scheduler;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  id *v23;
  HDHealthAppRestorableAlarmManager *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  scheduler = self->_scheduler;
  v29 = 0;
  -[HDRestorableAlarm allScheduledEventsWithError:](scheduler, "allScheduledEventsWithError:", &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  v10 = v9;
  if (v9)
    v11 = 1;
  else
    v11 = v8 == 0;
  if (v11)
  {
    v12 = v9;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    v23 = a4;
    v24 = self;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v18, "eventIdentifier", v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v6);

          if ((v20 & 1) != 0)
          {
            -[HDHealthAppRestorableAlarmManager removeAlarmEvent:](v24, "removeAlarmEvent:", v18);

            v21 = 1;
            goto LABEL_22;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", v23, 118, CFSTR("Scheduled alarm event does not exist"));
  }
  v21 = 0;
LABEL_22:

  return v21;
}

- (void)removeAlarmEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HDHealthAppRestorableAlarmManager_removeAlarmEvent___block_invoke;
  v7[3] = &unk_250E7E558;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __54__HDHealthAppRestorableAlarmManager_removeAlarmEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAlarmEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _HKWeakObserversMap *alarmHandlers;
  void *v13;
  id obj;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        alarmHandlers = self->_alarmHandlers;
        objc_msgSend(v11, "eventIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke;
        v15[3] = &unk_250E7E5A8;
        v15[4] = v11;
        v15[5] = self;
        -[_HKWeakObserversMap notifyObserversOfKey:handler:](alarmHandlers, "notifyObserversOfKey:handler:", v13, v15);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

uint64_t __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleAlarmEvent:restorableAlarmManager:completion:", MEMORY[0x24BDAC760], 3221225472, __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke_2, &unk_250E7E580, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3070];
  v7 = *MEMORY[0x24BDD3070];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      v10 = *(void **)(a1 + 40);
      v11 = v9;
      objc_msgSend(v10, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handled alarm successfully %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke_2_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (void)_queue_scheduleAlarmEvent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  HDRestorableAlarm *scheduler;
  void *v9;
  int v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  scheduler = self->_scheduler;
  v26[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v10 = -[HDRestorableAlarm scheduleEvents:error:](scheduler, "scheduleEvents:error:", v9, &v19);
  v11 = v19;

  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x24BDD3070];
  v13 = *MEMORY[0x24BDD3070];
  if (v10)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    v14 = v12;
    v15 = (void *)objc_opt_class();
    v16 = v15;
    objc_msgSend(v6, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_23DB70000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduled next alarm %{public}@", buf, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = v12;
    v18 = (void *)objc_opt_class();
    v16 = v18;
    objc_msgSend(v6, "eventIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v18;
    v22 = 2114;
    v23 = v17;
    v24 = 2114;
    v25 = v11;
    _os_log_error_impl(&dword_23DB70000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Error scheduling next alarm %{public}@: %{public}@", buf, 0x20u);
LABEL_4:

  }
LABEL_6:
  if (v7)
    v7[2](v7);

}

- (void)_queue_removeAlarmEvent:(id)a3
{
  id v4;
  HDRestorableAlarm *scheduler;
  void *v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  scheduler = self->_scheduler;
  v23[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = -[HDRestorableAlarm removeEvents:error:](scheduler, "removeEvents:error:", v6, &v16);
  v8 = v16;

  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x24BDD3070];
  v10 = *MEMORY[0x24BDD3070];
  if (!v7)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = v9;
    v15 = (void *)objc_opt_class();
    v13 = v15;
    objc_msgSend(v4, "eventIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v15;
    v19 = 2114;
    v20 = v14;
    v21 = 2114;
    v22 = v8;
    _os_log_error_impl(&dword_23DB70000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error removing alarm %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v9;
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v4, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_23DB70000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removed alarm %{public}@", buf, 0x16u);
LABEL_4:

  }
LABEL_6:

}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_alarmHandlers, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

void __70__HDHealthAppRestorableAlarmManager__queue_alarm_didReceiveDueEvents___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = *(void **)(a1 + 40);
  v8 = v6;
  objc_msgSend(v7, "eventIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543874;
  v11 = v6;
  v12 = 2114;
  v13 = v9;
  v14 = 2114;
  v15 = a3;
  _os_log_error_impl(&dword_23DB70000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Alarm Event %{public}@ Handler Error: %{public}@", (uint8_t *)&v10, 0x20u);

}

@end
