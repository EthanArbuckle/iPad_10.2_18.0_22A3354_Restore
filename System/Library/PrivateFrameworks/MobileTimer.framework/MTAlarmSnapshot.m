@implementation MTAlarmSnapshot

- (MTAlarmSnapshot)initWithStorage:(id)a3
{
  id v5;
  MTAlarmSnapshot *v6;
  MTAlarmSnapshot *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTAlarmSnapshot;
  v6 = -[MTSnapshotScheduler initWithBundleID:](&v9, sel_initWithBundleID_, CFSTR("com.apple.mobiletimer"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    -[MTAlarmStorage registerObserver:](v7->_storage, "registerObserver:", v7);
  }

  return v7;
}

+ (BOOL)shouldScheduleSnapshotForAlarms:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_5);
}

uint64_t __51__MTAlarmSnapshot_shouldScheduleSnapshotForAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSleepAlarm") ^ 1;
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  int v8;
  MTAlarmSnapshot *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "shouldScheduleSnapshotForAlarms:", v5);

  if (v6)
  {
    MTLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm added - Request snapshot", (uint8_t *)&v8, 0xCu);
    }

    -[MTSnapshotScheduler scheduleSnapshot](self, "scheduleSnapshot");
  }
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  int v8;
  MTAlarmSnapshot *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "shouldScheduleSnapshotForAlarms:", v5);

  if (v6)
  {
    MTLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm updated - Request snapshot", (uint8_t *)&v8, 0xCu);
    }

    -[MTSnapshotScheduler scheduleSnapshot](self, "scheduleSnapshot");
  }
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  int v8;
  MTAlarmSnapshot *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "shouldScheduleSnapshotForAlarms:", v5);

  if (v6)
  {
    MTLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm removed - Request snapshot", (uint8_t *)&v8, 0xCu);
    }

    -[MTSnapshotScheduler scheduleSnapshot](self, "scheduleSnapshot");
  }
}

- (MTAlarmStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
