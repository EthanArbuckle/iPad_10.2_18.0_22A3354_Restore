@implementation MTAlarmSyncDataModel

- (MTAlarmSyncDataModel)initWithAlarmStorage:(id)a3 syncMetrics:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  MTAlarmSyncDataModel *v12;

  v6 = a4;
  v7 = a3;
  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[MTScheduler defaultPriority](MTScheduler, "defaultPriority"), -1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.MTAlarmSyncDataModel", v8);
  objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MTAlarmSyncDataModel initWithAlarmStorage:syncMetrics:syncServiceManagerBlock:serializer:serialQueue:](self, "initWithAlarmStorage:syncMetrics:syncServiceManagerBlock:serializer:serialQueue:", v7, v6, v11, v10, v9);

  return v12;
}

- (MTAlarmSyncDataModel)initWithAlarmStorage:(id)a3 syncMetrics:(id)a4 syncServiceManagerBlock:(id)a5 serializer:(id)a6 serialQueue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MTAlarmSyncDataModel *v17;
  NSObject *v18;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  MTAlarmSyncDataModel *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MTAlarmSyncDataModel;
  v17 = -[MTAlarmSyncDataModel init](&v21, sel_init);
  if (v17)
  {
    MTLogForCategory(6);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v17->_alarmStorage, a3);
    objc_storeStrong((id *)&v17->_serialQueue, a7);
    objc_storeStrong((id *)&v17->_serializer, a6);
    objc_storeStrong((id *)&v17->_syncMetrics, a4);
    -[MTAlarmSyncDataModel _setupSyncManagerWithBlock:](v17, "_setupSyncManagerWithBlock:", v14);
  }

  return v17;
}

+ (id)defaultBlock
{
  return &__block_literal_global_6;
}

MTSyncServiceManager *__36__MTAlarmSyncDataModel_defaultBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MTCompanionSyncStatusProvider *v3;
  MTCompanionSyncService *v4;
  MTSyncServiceManager *v5;
  void *v6;
  MTSyncServiceManager *v7;

  v2 = a2;
  if (+[MTCompanionSyncStatusProvider deviceSupportsSyncing](MTCompanionSyncStatusProvider, "deviceSupportsSyncing"))
  {
    v3 = objc_alloc_init(MTCompanionSyncStatusProvider);
    v4 = -[MTCompanionSyncService initWithSyncStatusProvider:]([MTCompanionSyncService alloc], "initWithSyncStatusProvider:", v3);
    v5 = [MTSyncServiceManager alloc];
    objc_msgSend(v2, "syncMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MTSyncServiceManager initWithSyncService:syncStatusProvider:syncDataModel:syncMetrics:](v5, "initWithSyncService:syncStatusProvider:syncDataModel:syncMetrics:", v4, v3, v2, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setupSyncManagerWithBlock:(id)a3
{
  MTSyncServiceManager *v4;
  MTSyncServiceManager *syncServiceManager;
  NSObject *v6;
  int v7;
  MTAlarmSyncDataModel *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  (*((void (**)(id, MTAlarmSyncDataModel *))a3 + 2))(a3, self);
  v4 = (MTSyncServiceManager *)objc_claimAutoreleasedReturnValue();
  syncServiceManager = self->_syncServiceManager;
  self->_syncServiceManager = v4;

  if (self->_syncServiceManager)
  {
    -[MTAlarmStorage registerObserver:](self->_alarmStorage, "registerObserver:", self);
  }
  else
  {
    MTLogForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ has no sync manager.", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)startSyncServices
{
  -[MTSyncServiceManager startSyncService](self->_syncServiceManager, "startSyncService");
}

- (void)stopSyncServices
{
  -[MTSyncServiceManager stopSyncService](self->_syncServiceManager, "stopSyncService");
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NAScheduler *serializer;
  _QWORD v13[5];
  id v14;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "isSleepAlarm"))
  {
    objc_msgSend(v7, "sourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarmSyncDataModel sourceIdentifier](self, "sourceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      serializer = self->_serializer;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __61__MTAlarmSyncDataModel_source_didDismissAlarm_dismissAction___block_invoke;
      v13[3] = &unk_1E39CB7B0;
      v13[4] = self;
      v14 = v8;
      -[NAScheduler performBlock:](serializer, "performBlock:", v13);

    }
  }

}

void __61__MTAlarmSyncDataModel_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  MTNewChildActivityForName(8);
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__MTAlarmSyncDataModel_source_didDismissAlarm_dismissAction___block_invoke_2;
  v4[3] = &unk_1E39CB7B0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  os_activity_apply(v2, v4);

}

void __61__MTAlarmSyncDataModel_source_didDismissAlarm_dismissAction___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmSyncDataModel - Syncing Alarm Dismiss", v8, 2u);
  }

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dismissedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTSyncDismiss syncDismissOfObjectWithIdentifier:dismissDate:date:](MTSyncDismiss, "syncDismissOfObjectWithIdentifier:dismissDate:date:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncChange:", v7);

}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NAScheduler *serializer;
  _QWORD v13[5];
  id v14;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "isSleepAlarm"))
  {
    objc_msgSend(v7, "sourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarmSyncDataModel sourceIdentifier](self, "sourceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      serializer = self->_serializer;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__MTAlarmSyncDataModel_source_didSnoozeAlarm_snoozeAction___block_invoke;
      v13[3] = &unk_1E39CB7B0;
      v13[4] = self;
      v14 = v8;
      -[NAScheduler performBlock:](serializer, "performBlock:", v13);

    }
  }

}

void __59__MTAlarmSyncDataModel_source_didSnoozeAlarm_snoozeAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  MTNewChildActivityForName(9);
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__MTAlarmSyncDataModel_source_didSnoozeAlarm_snoozeAction___block_invoke_2;
  v4[3] = &unk_1E39CB7B0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  os_activity_apply(v2, v4);

}

void __59__MTAlarmSyncDataModel_source_didSnoozeAlarm_snoozeAction___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmSyncDataModel - Syncing Alarm Snooze", v8, 2u);
  }

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "snoozeFireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTSyncSnooze syncSnoozeOfObjectWithIdentifier:snoozeDate:date:](MTSyncSnooze, "syncSnoozeOfObjectWithIdentifier:snoozeDate:date:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncChange:", v7);

}

- (id)dataFileName
{
  return CFSTR("AlarmSync.data");
}

- (void)applyChange:(id)a3
{
  id v4;
  NAScheduler *serializer;
  id v6;
  _QWORD v7[4];
  id v8;
  MTAlarmSyncDataModel *v9;

  v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MTAlarmSyncDataModel_applyChange___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

uint64_t __36__MTAlarmSyncDataModel_applyChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "syncType");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 40), "_performAction:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_performAction:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTAlarmSyncDataModel *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ performing action %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MTAlarmSyncDataModel _performDismiss:](self, "_performDismiss:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTAlarmSyncDataModel _performSnooze:](self, "_performSnooze:", v4);
  }

}

- (void)_performDismiss:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  MTNewChildActivityForName(8);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MTAlarmSyncDataModel__performDismiss___block_invoke;
  block[3] = &unk_1E39CB7B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  os_activity_apply(v5, block);

}

void __40__MTAlarmSyncDataModel__performDismiss___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmSyncDataModel - Applying Alarm Dismiss", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "alarmStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "syncIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dismissDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:", v4, v5, 5, 0, *(_QWORD *)(a1 + 32));

}

- (void)_performSnooze:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  MTNewChildActivityForName(9);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MTAlarmSyncDataModel__performSnooze___block_invoke;
  block[3] = &unk_1E39CB7B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  os_activity_apply(v5, block);

}

void __39__MTAlarmSyncDataModel__performSnooze___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmSyncDataModel - Applying Alarm Snooze", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "alarmStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "syncIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "snoozeDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:", v4, v5, 2, 0, *(_QWORD *)(a1 + 32));

}

- (id)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isFromOtherDevice
{
  return 1;
}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = objc_opt_class();
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----%{public}@-----", (uint8_t *)&v7, 0xCu);
  }

  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarmSyncDataModel syncServiceManager](self, "syncServiceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = (uint64_t)v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Alarm Sync Manager: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[MTAlarmSyncDataModel syncServiceManager](self, "syncServiceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "printDiagnostics");

}

- (id)gatherDiagnostics
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[MTAlarmSyncDataModel syncServiceManager](self, "syncServiceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Alarm Sync Managers"));

  -[MTAlarmSyncDataModel syncServiceManager](self, "syncServiceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MTAlarmSyncDataModel syncServiceManager](self, "syncServiceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gatherDiagnostics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v8);

  }
  return v3;
}

- (MTSyncServiceManager)syncServiceManager
{
  return self->_syncServiceManager;
}

- (void)setSyncServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncServiceManager, a3);
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
  objc_storeStrong((id *)&self->_alarmStorage, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (MTMetrics)syncMetrics
{
  return self->_syncMetrics;
}

- (void)setSyncMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_syncMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncMetrics, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_syncServiceManager, 0);
}

@end
