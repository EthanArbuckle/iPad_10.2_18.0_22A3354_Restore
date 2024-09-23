@implementation MTNextAlarmManager

- (MTNextAlarmManager)init
{
  MTNextAlarmManager *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  MTNextAlarmManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MTNextAlarmManager;
  v2 = -[MTNextAlarmManager init](&v9, sel_init);
  if (v2)
  {
    MTLogForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v2;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@...", buf, 0xCu);
    }

    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTNextAlarmManager.accessqueue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTNextAlarmManager setSerializer:](v2, "setSerializer:", v4);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTNextAlarmManager setNextAlarms:](v2, "setNextAlarms:", v5);

    v6 = (void *)objc_opt_new();
    -[MTNextAlarmManager setAlarmManager:](v2, "setAlarmManager:", v6);

    -[MTNextAlarmManager calculateNextAlarms](v2, "calculateNextAlarms");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleAlarmsDidChange, CFSTR("MTAlarmManagerFiringAlarmChanged"), v2->_alarmManager);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleAlarmsDidChange, CFSTR("MTAlarmManagerNextAlarmChanged"), v2->_alarmManager);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleAlarmsDidChange, CFSTR("MTAlarmManagerAlarmsChanged"), v2->_alarmManager);

  }
  return v2;
}

- (void)calculateNextAlarms
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__MTNextAlarmManager_calculateNextAlarms__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

void __41__MTNextAlarmManager_calculateNextAlarms__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "alarmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarmsSyncIncludingSleepAlarm:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "na_map:", &__block_literal_global_50);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNextAlarms:", v7);

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    MTLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "nextAlarms");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ calling update handler with %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "updateHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nextAlarms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v13);

  }
}

uint64_t __41__MTNextAlarmManager_calculateNextAlarms__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

id __41__MTNextAlarmManager_calculateNextAlarms__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "nextFireDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFireDate:", v4);

  objc_msgSend(v2, "alarmIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v5);

  objc_msgSend(v3, "setIsSleepAlarm:", objc_msgSend(v2, "isSleepAlarm"));
  objc_msgSend(v2, "displayTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setTitle:", v6);
  return v3;
}

- (void)_handleAlarmsDidChange
{
  NSObject *v3;
  int v4;
  MTNextAlarmManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ _handleAlarmsDidChange", (uint8_t *)&v4, 0xCu);
  }

  -[MTNextAlarmManager calculateNextAlarms](self, "calculateNextAlarms");
}

- (NSSet)nextAlarms
{
  return self->_nextAlarms;
}

- (void)setNextAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_nextAlarms, a3);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_nextAlarms, 0);
}

@end
