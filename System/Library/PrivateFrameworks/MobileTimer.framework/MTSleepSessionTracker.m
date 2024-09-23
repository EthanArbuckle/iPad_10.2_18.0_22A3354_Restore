@implementation MTSleepSessionTracker

- (MTSleepSessionTracker)initWithAlarmStorage:(id)a3
{
  id v5;
  MTSleepSessionTracker *v6;
  NSObject *v7;
  uint64_t v8;
  MTAlarm *cachedAlarm;
  objc_super v11;
  uint8_t buf[4];
  MTSleepSessionTracker *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTSleepSessionTracker;
  v6 = -[MTSleepSessionTracker init](&v11, sel_init);
  if (v6)
  {
    MTLogForCategory(7);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_alarmStorage, a3);
    -[MTAlarmStorage sleepAlarm](v6->_alarmStorage, "sleepAlarm");
    v8 = objc_claimAutoreleasedReturnValue();
    cachedAlarm = v6->_cachedAlarm;
    v6->_cachedAlarm = (MTAlarm *)v8;

    v6->_alarmLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_alarmLock;
  void (**v4)(_QWORD);

  p_alarmLock = &self->_alarmLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_alarmLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_alarmLock);
}

- (void)prepare
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__MTSleepSessionTracker_prepare__block_invoke;
  v2[3] = &unk_1E39CB858;
  v2[4] = self;
  -[MTSleepSessionTracker _withLock:](self, "_withLock:", v2);
}

void __32__MTSleepSessionTracker_prepare__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sleepAlarm");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (BOOL)trackingEnabled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__MTSleepSessionTracker_trackingEnabled__block_invoke;
  v4[3] = &unk_1E39CC370;
  v4[4] = self;
  v4[5] = &v5;
  -[MTSleepSessionTracker _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__MTSleepSessionTracker_trackingEnabled__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if ((objc_msgSend((id)objc_opt_class(), "_trackingEnabledForSleepAlarm:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)) & 1) != 0)
      return;
    MTLogForCategory(7);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v6 = 138543362;
      v7 = v3;
      v4 = "%{public}@ feature not enabled";
LABEL_7:
      _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    MTLogForCategory(7);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543362;
      v7 = v5;
      v4 = "%{public}@ no alarm, disabling";
      goto LABEL_7;
    }
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

+ (BOOL)_trackingEnabledForSleepAlarm:(id)a3
{
  return 0;
}

- (MTAlarm)cachedAlarm
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__MTSleepSessionTracker_cachedAlarm__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTSleepSessionTracker _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (MTAlarm *)v2;
}

void __36__MTSleepSessionTracker_cachedAlarm__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setCachedAlarm:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__MTSleepSessionTracker_setCachedAlarm___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTSleepSessionTracker _withLock:](self, "_withLock:", v6);

}

void __40__MTSleepSessionTracker_setCachedAlarm___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)sleepCoordinator:(id)a3 sleepAlarmDidChange:(id)a4
{
  -[MTSleepSessionTracker setCachedAlarm:](self, "setCachedAlarm:", a4);
}

- (void)sleepCoordinator:(id)a3 bedtimeReminderWasConfirmed:(id)a4 sleepAlarm:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  MTSleepSessionTracker *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[MTSleepSessionTracker trackingEnabled](self, "trackingEnabled"))
  {
    MTLogForCategory(7);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = self;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ user confirmed bedtime reminder (%{public}@).  Starting session.", (uint8_t *)&v8, 0x16u);
    }

    -[MTSleepSessionTracker startSession](self, "startSession");
  }

}

- (void)sleepCoordinator:(id)a3 wakeUpAlarmWasDismissed:(id)a4 dismissAction:(unint64_t)a5 sleepAlarm:(id)a6
{
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  MTSleepSessionTracker *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (-[MTSleepSessionTracker trackingEnabled](self, "trackingEnabled"))
  {
    MTLogForCategory(7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      MTDismissAlarmActionDescription(a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ user woke up at %@ (%{public}@)", (uint8_t *)&v11, 0x20u);

    }
    -[MTSleepSessionTracker endSessionWithDate:reason:](self, "endSessionWithDate:reason:", v8, 0);
  }

}

- (Class)sessionClass
{
  return 0;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return 0;
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (MTSleepSessionTrackerDelegate)sleepSessionTrackerDelegate
{
  return (MTSleepSessionTrackerDelegate *)objc_loadWeakRetained((id *)&self->_sleepSessionTrackerDelegate);
}

- (void)setSleepSessionTrackerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sleepSessionTrackerDelegate, a3);
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
  objc_storeStrong((id *)&self->_alarmStorage, a3);
}

- (os_unfair_lock_s)alarmLock
{
  return self->_alarmLock;
}

- (void)setAlarmLock:(os_unfair_lock_s)a3
{
  self->_alarmLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_cachedAlarm, 0);
  objc_destroyWeak((id *)&self->_sleepSessionTrackerDelegate);
}

@end
