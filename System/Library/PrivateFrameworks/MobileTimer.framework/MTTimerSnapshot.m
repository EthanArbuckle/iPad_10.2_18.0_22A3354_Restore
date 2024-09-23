@implementation MTTimerSnapshot

- (MTTimerSnapshot)initWithStorage:(id)a3
{
  id v5;
  MTTimerSnapshot *v6;
  MTTimerSnapshot *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTTimerSnapshot;
  v6 = -[MTSnapshotScheduler initWithBundleID:](&v9, sel_initWithBundleID_, CFSTR("com.apple.mobiletimer"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    -[MTTimerStorage registerObserver:](v7->_storage, "registerObserver:", v7);
  }

  return v7;
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  NSObject *v5;
  int v6;
  MTTimerSnapshot *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer added - Request snapshot", (uint8_t *)&v6, 0xCu);
  }

  -[MTSnapshotScheduler scheduleSnapshot](self, "scheduleSnapshot");
}

- (void)source:(id)a3 didUpdateTimers:(id)a4
{
  NSObject *v5;
  int v6;
  MTTimerSnapshot *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer updated - Request snapshot", (uint8_t *)&v6, 0xCu);
  }

  -[MTSnapshotScheduler scheduleSnapshot](self, "scheduleSnapshot");
}

- (void)source:(id)a3 didRemoveTimers:(id)a4
{
  NSObject *v5;
  int v6;
  MTTimerSnapshot *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer removed - Request snapshot", (uint8_t *)&v6, 0xCu);
  }

  -[MTSnapshotScheduler scheduleSnapshot](self, "scheduleSnapshot");
}

- (MTTimerStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
