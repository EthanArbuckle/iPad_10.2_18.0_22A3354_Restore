@implementation MTBaseAlarmWidgetProvider

- (MTBaseAlarmWidgetProvider)initWithAlarmStorage:(id)a3
{
  id v5;
  MTBaseAlarmWidgetProvider *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  objc_super v12;
  uint8_t buf[4];
  MTBaseAlarmWidgetProvider *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTBaseAlarmWidgetProvider;
  v6 = -[MTBaseAlarmWidgetProvider init](&v12, sel_init);
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    objc_msgSend(v5, "registerObserver:", v6);
    objc_storeStrong((id *)&v6->_alarmStorage, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.mobiletimerd.MTBaseAlarmWidgetProvider", v8);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v9;

  }
  return v6;
}

- (id)broadcastWidgetTimelineReload
{
  NSObject *v3;

  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[MTBaseAlarmWidgetProvider broadcastWidgetTimelineReload].cold.1((uint64_t)self, v3);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTBaseAlarmWidgetProvider"), 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reloadTimeline
{
  NSObject *v3;
  _QWORD block[5];

  -[MTBaseAlarmWidgetProvider serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MTBaseAlarmWidgetProvider_reloadTimeline__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __43__MTBaseAlarmWidgetProvider_reloadTimeline__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "throttleTimelineReload");
  if ((result & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastReloadRequestDate:", v3);

    return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "broadcastWidgetTimelineReload");
  }
  return result;
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  id v5;
  NSObject *v6;
  BOOL v7;
  int v8;
  MTBaseAlarmWidgetProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didAddAlarms", (uint8_t *)&v8, 0xCu);
  }

  v7 = -[MTBaseAlarmWidgetProvider bypassReloadForAlarms:](self, "bypassReloadForAlarms:", v5);
  if (!v7)
    -[MTBaseAlarmWidgetProvider reloadTimeline](self, "reloadTimeline");
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5;
  NSObject *v6;
  BOOL v7;
  int v8;
  MTBaseAlarmWidgetProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didRemoveAlarms", (uint8_t *)&v8, 0xCu);
  }

  v7 = -[MTBaseAlarmWidgetProvider bypassReloadForAlarms:](self, "bypassReloadForAlarms:", v5);
  if (!v7)
    -[MTBaseAlarmWidgetProvider reloadTimeline](self, "reloadTimeline");
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  NSObject *v6;
  int v7;
  MTBaseAlarmWidgetProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didDismissAlarm", (uint8_t *)&v7, 0xCu);
  }

  -[MTBaseAlarmWidgetProvider reloadTimeline](self, "reloadTimeline");
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  NSObject *v6;
  int v7;
  MTBaseAlarmWidgetProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didFireAlarm", (uint8_t *)&v7, 0xCu);
  }

  -[MTBaseAlarmWidgetProvider reloadTimeline](self, "reloadTimeline");
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  NSObject *v6;
  int v7;
  MTBaseAlarmWidgetProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didSnoozeAlarm", (uint8_t *)&v7, 0xCu);
  }

  -[MTBaseAlarmWidgetProvider reloadTimeline](self, "reloadTimeline");
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v5;
  NSObject *v6;
  BOOL v7;
  int v8;
  MTBaseAlarmWidgetProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didUpdateAlarms", (uint8_t *)&v8, 0xCu);
  }

  v7 = -[MTBaseAlarmWidgetProvider bypassReloadForAlarms:](self, "bypassReloadForAlarms:", v5);
  if (!v7)
    -[MTBaseAlarmWidgetProvider reloadTimeline](self, "reloadTimeline");
}

- (BOOL)bypassReloadForAlarms:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MTBaseAlarmWidgetProvider bypassReloadForAlarm:](self, "bypassReloadForAlarm:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)bypassReloadForAlarm:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v9;
  MTBaseAlarmWidgetProvider *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "shouldBypassWidgetReload");
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "alarmIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: alarm %{public}@ requested widget reload bypass", (uint8_t *)&v9, 0x16u);

    }
  }

  return v5;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (NSTimer)reloadTimer
{
  return self->_reloadTimer;
}

- (void)setReloadTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reloadTimer, a3);
}

- (NSDate)lastReloadRequestDate
{
  return self->_lastReloadRequestDate;
}

- (void)setLastReloadRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastReloadRequestDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReloadRequestDate, 0);
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)broadcastWidgetTimelineReload
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  v4 = 2082;
  v5 = "-[MTBaseAlarmWidgetProvider broadcastWidgetTimelineReload]";
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "Subclass %{public}@ has not implemented %{public}s", (uint8_t *)&v2, 0x16u);
}

@end
