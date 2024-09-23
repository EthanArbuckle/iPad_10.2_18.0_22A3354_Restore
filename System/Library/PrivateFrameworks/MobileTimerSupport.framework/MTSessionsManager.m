@implementation MTSessionsManager

- (_TtC18MobileTimerSupport23MTTimerSessionsProvider)timerProvider
{
  return self->_timerProvider;
}

- (BOOL)hasActiveTimerSession
{
  void *v2;
  char v3;

  -[MTSessionsManager timerProvider](self, "timerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveTimerSession");

  return v3;
}

- (BOOL)hasActiveAlarmSession
{
  void *v2;
  char v3;

  -[MTSessionsManager alarmProvider](self, "alarmProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveAlarmSession");

  return v3;
}

- (_TtC18MobileTimerSupport23MTAlarmSessionsProvider)alarmProvider
{
  return self->_alarmProvider;
}

- (MTSessionsManager)init
{
  MTSessionsManager *v2;
  MTSessionsManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTSessionsManager;
  v2 = -[MTSessionsManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MTSessionsManager localSetup](v2, "localSetup");
  return v3;
}

- (void)restoreAlarmSessionsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSessionsManager alarmProvider](self, "alarmProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restoreSessionsWithCompletion:", v4);

}

- (void)restoreTimerSessionsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSessionsManager timerProvider](self, "timerProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restoreSessionsWithCompletion:", v4);

}

- (void)localSetup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_new();
  -[MTSessionsManager setTimerProvider:](self, "setTimerProvider:", v3);

  v4 = (void *)objc_opt_new();
  -[MTSessionsManager setAlarmProvider:](self, "setAlarmProvider:", v4);

  v5 = (void *)objc_opt_new();
  -[MTSessionsManager setBaseProvider:](self, "setBaseProvider:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C90230]);
  -[MTSessionsManager setActivityCenter:](self, "setActivityCenter:", v6);

}

- (void)createSessionWithTimer:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MTSessionsManager_createSessionWithTimer___block_invoke;
  v3[3] = &unk_1E6F292A8;
  v3[4] = self;
  -[MTSessionsManager createSessionWithTimer:completion:](self, "createSessionWithTimer:completion:", a3, v3);
}

void __44__MTSessionsManager_createSessionWithTimer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__MTSessionsManager_createSessionWithTimer___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1B8D7F000, v6, OS_LOG_TYPE_INFO, "%{public}@ created session", (uint8_t *)&v8, 0xCu);
  }

}

- (void)createSessionWithTimer:(id)a3 completion:(id)a4
{
  -[MTSessionsManager createSessionWithTimer:forAlert:completion:](self, "createSessionWithTimer:forAlert:completion:", a3, 0, a4);
}

- (void)createSessionWithTimer:(id)a3 forAlert:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  MTSessionsManager *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = -[MTSessionsManager numberOfAvailableSessions](self, "numberOfAvailableSessions");
  if (v10 > 1)
  {
LABEL_18:
    -[MTSessionsManager timerProvider](self, "timerProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSessionsManager contextWithTimer:](self, "contextWithTimer:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createSessionWithContext:completion:forAlert:", v20, v9, v6);
    goto LABEL_19;
  }
  if (v6)
  {
    if (!v10)
    {
      MTLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "timerIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = self;
        v30 = 2114;
        v31 = v12;
        _os_log_impl(&dword_1B8D7F000, v11, OS_LOG_TYPE_INFO, "%{public}@ no sessions available for timer id: %{public}@, will try to end existing alerting session", buf, 0x16u);

      }
      -[MTSessionsManager currentAlertingSession](self, "currentAlertingSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MTLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v29 = self;
        v30 = 2114;
        v31 = v13;
        _os_log_impl(&dword_1B8D7F000, v14, OS_LOG_TYPE_INFO, "%{public}@ looked up current alerting session: %{public}@ ", buf, 0x16u);
      }

      MTLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v13)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v29 = self;
          v30 = 2114;
          v31 = v13;
          _os_log_impl(&dword_1B8D7F000, v16, OS_LOG_TYPE_INFO, "%{public}@ ending current alerting session: %{public}@ ", buf, 0x16u);
        }

        -[MTSessionsManager activityCenter](self, "activityCenter");
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject endActivity:](v16, "endActivity:", v13);
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[MTSessionsManager createSessionWithTimer:forAlert:completion:].cold.1((uint64_t)self, v16, v22, v23, v24, v25, v26, v27);
      }

    }
    goto LABEL_18;
  }
  MTLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[MTSessionsManager createSessionWithTimer:forAlert:completion:].cold.2((uint64_t)self, v8, v17);

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "timerID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("reached max limit for active sessions, dropping non alerting session for timer id:%@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTSessionError withDescription:](_TtC18MobileTimerSupport14MTSessionError, "withDescription:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v21);

LABEL_19:
}

- (void)updateSessionWithTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[MTSessionsManager timerProvider](self, "timerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSessionsManager contextWithTimer:](self, "contextWithTimer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MTSessionsManager_updateSessionWithTimer___block_invoke;
  v7[3] = &unk_1E6F292D0;
  v7[4] = self;
  objc_msgSend(v5, "updateSessionWithContext:completion:", v6, v7);

}

void __44__MTSessionsManager_updateSessionWithTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__MTSessionsManager_updateSessionWithTimer___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B8D7F000, v5, OS_LOG_TYPE_INFO, "%{public}@ updated session", (uint8_t *)&v7, 0xCu);
  }

}

- (void)finishSessionWithTimer:(id)a3
{
  id v4;

  objc_msgSend(a3, "timerIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MTSessionsManager finishSessionWithTimerId:](self, "finishSessionWithTimerId:", v4);

}

- (void)finishSessionWithTimerId:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[MTSessionsManager timerProvider](self, "timerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__MTSessionsManager_finishSessionWithTimerId___block_invoke;
  v6[3] = &unk_1E6F292D0;
  v6[4] = self;
  objc_msgSend(v5, "finishSessionWithTimerId:completion:", v4, v6);

}

void __46__MTSessionsManager_finishSessionWithTimerId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__MTSessionsManager_finishSessionWithTimerId___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B8D7F000, v5, OS_LOG_TYPE_INFO, "%{public}@ finished session", (uint8_t *)&v7, 0xCu);
  }

}

- (void)finishSessionWithTimerId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTSessionsManager timerProvider](self, "timerProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishSessionWithTimerId:completion:", v7, v6);

}

- (id)activityIdForTimerId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTSessionsManager timerProvider](self, "timerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityIdForTimerIdWithTimerId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityIdForAlarmId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTSessionsManager alarmProvider](self, "alarmProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityIdForAlarmIdWithAlarmId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasTimerSessionWithId:(id)a3
{
  void *v3;
  BOOL v4;

  -[MTSessionsManager activityIdForTimerId:](self, "activityIdForTimerId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAlarmSessionWithId:(id)a3
{
  void *v3;
  BOOL v4;

  -[MTSessionsManager activityIdForAlarmId:](self, "activityIdForAlarmId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)supportsSessions
{
  return +[MTBaseSessionsProvider supportsSessions](_TtC18MobileTimerSupport22MTBaseSessionsProvider, "supportsSessions");
}

- (id)contextWithTimer:(id)a3
{
  id v4;
  _TtC18MobileTimerSupport12TimerContext *v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _TtC18MobileTimerSupport12TimerContext *v16;
  NSObject *v17;
  int v19;
  MTSessionsManager *v20;
  __int16 v21;
  _TtC18MobileTimerSupport12TimerContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [_TtC18MobileTimerSupport12TimerContext alloc];
  v6 = -[MTSessionsManager sessionStateForTimer:](self, "sessionStateForTimer:", v4);
  objc_msgSend(v4, "timerIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v9 = v8;
  objc_msgSend(v4, "remainingTime");
  v11 = v10;
  v12 = objc_msgSend(v4, "isFiring");
  objc_msgSend(v4, "nextTrigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "triggerDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[TimerContext initWithState:timerId:duration:remainingTime:firing:fireDate:title:](v5, "initWithState:timerId:duration:remainingTime:firing:fireDate:title:", v6, v7, v12, v14, v15, v9, v11);
  MTLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v19 = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_1B8D7F000, v17, OS_LOG_TYPE_INFO, "%{public}@ created timer context: %{public}@ ", (uint8_t *)&v19, 0x16u);
  }

  return v16;
}

- (int64_t)sessionStateForTimer:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "state");
  if ((unint64_t)(v3 - 1) > 3)
    return 3;
  else
    return qword_1B8DFF630[v3 - 1];
}

- (void)createSessionWithAlarm:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MTSessionsManager_createSessionWithAlarm___block_invoke;
  v3[3] = &unk_1E6F292A8;
  v3[4] = self;
  -[MTSessionsManager createSessionWithAlarm:completion:](self, "createSessionWithAlarm:completion:", a3, v3);
}

void __44__MTSessionsManager_createSessionWithAlarm___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__MTSessionsManager_createSessionWithAlarm___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1B8D7F000, v6, OS_LOG_TYPE_INFO, "%{public}@ created alarm session", (uint8_t *)&v8, 0xCu);
  }

}

- (void)createSessionWithAlarm:(id)a3 completion:(id)a4
{
  -[MTSessionsManager createSessionWithAlarm:forAlert:completion:](self, "createSessionWithAlarm:forAlert:completion:", a3, 0, a4);
}

- (void)createSessionWithAlarm:(id)a3 forAlert:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  MTSessionsManager *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = -[MTSessionsManager numberOfAvailableSessions](self, "numberOfAvailableSessions");
  if (v10 > 1)
  {
LABEL_16:
    -[MTSessionsManager alarmProvider](self, "alarmProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSessionsManager contextWithAlarm:](self, "contextWithAlarm:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createSessionWithContext:completion:forAlert:", v19, v9, v6);
    goto LABEL_17;
  }
  if (v6)
  {
    if (!v10)
    {
      MTLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "alarmIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = self;
        v29 = 2114;
        v30 = v12;
        _os_log_impl(&dword_1B8D7F000, v11, OS_LOG_TYPE_INFO, "%{public}@ no sessions available for alarm id: %{public}@, will try to end existing alerting session", buf, 0x16u);

      }
      -[MTSessionsManager currentAlertingSession](self, "currentAlertingSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MTLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v28 = self;
          v29 = 2114;
          v30 = v13;
          _os_log_impl(&dword_1B8D7F000, v15, OS_LOG_TYPE_INFO, "%{public}@ ending current alerting session: %{public}@ ", buf, 0x16u);
        }

        -[MTSessionsManager activityCenter](self, "activityCenter");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject endActivity:](v15, "endActivity:", v13);
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[MTSessionsManager createSessionWithTimer:forAlert:completion:].cold.1((uint64_t)self, v15, v21, v22, v23, v24, v25, v26);
      }

    }
    goto LABEL_16;
  }
  MTLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[MTSessionsManager createSessionWithAlarm:forAlert:completion:].cold.2((uint64_t)self, v8, v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "alarmIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("reached max limit for active sessions, dropping non alerting session for alarm id:%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTSessionError withDescription:](_TtC18MobileTimerSupport14MTSessionError, "withDescription:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v20);

LABEL_17:
}

- (void)updateSessionWithAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[MTSessionsManager alarmProvider](self, "alarmProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSessionsManager contextWithAlarm:](self, "contextWithAlarm:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MTSessionsManager_updateSessionWithAlarm___block_invoke;
  v7[3] = &unk_1E6F292D0;
  v7[4] = self;
  objc_msgSend(v5, "updateSessionWithContext:completion:", v6, v7);

}

void __44__MTSessionsManager_updateSessionWithAlarm___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__MTSessionsManager_updateSessionWithAlarm___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B8D7F000, v5, OS_LOG_TYPE_INFO, "%{public}@ updated alarm session", (uint8_t *)&v7, 0xCu);
  }

}

- (void)finishSessionWithAlarm:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "alarmIDString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MTSessionsManager finishSessionWithAlarmId:completion:](self, "finishSessionWithAlarmId:completion:", v7, v6);

}

- (void)finishSessionWithAlarmId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTSessionsManager alarmProvider](self, "alarmProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishSessionWithAlarmId:completion:", v7, v6);

}

- (id)contextWithAlarm:(id)a3
{
  id v3;
  _TtC18MobileTimerSupport12AlarmContext *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC18MobileTimerSupport12AlarmContext *v11;

  v3 = a3;
  v4 = [_TtC18MobileTimerSupport12AlarmContext alloc];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alarmIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "hour");
  v8 = objc_msgSend(v3, "minute");
  v9 = objc_msgSend(v3, "isSnoozed");
  v10 = objc_msgSend(v3, "isFiring");

  v11 = -[AlarmContext initWithTitle:alarmId:hour:min:isSnoozed:isFiring:](v4, "initWithTitle:alarmId:hour:min:isSnoozed:isFiring:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)activeAlarmSessions
{
  void *v2;
  void *v3;

  -[MTSessionsManager alarmProvider](self, "alarmProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAlarmSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)numberOfActiveSessions
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[MTSessionsManager alarmProvider](self, "alarmProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfActiveSessions");
  -[MTSessionsManager timerProvider](self, "timerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfActiveSessions") + v4;
  -[MTSessionsManager baseProvider](self, "baseProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "numberOfStopwatchSessions");

  return v8;
}

- (unint64_t)numberOfAvailableSessions
{
  return 5 - -[MTSessionsManager numberOfActiveSessions](self, "numberOfActiveSessions");
}

- (id)currentAlertingSession
{
  void *v3;
  void *v4;
  void *v5;

  -[MTSessionsManager alarmProvider](self, "alarmProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertingSessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MTSessionsManager timerProvider](self, "timerProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertingSessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)setTimerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_timerProvider, a3);
}

- (void)setAlarmProvider:(id)a3
{
  objc_storeStrong((id *)&self->_alarmProvider, a3);
}

- (_TtC18MobileTimerSupport22MTBaseSessionsProvider)baseProvider
{
  return self->_baseProvider;
}

- (void)setBaseProvider:(id)a3
{
  objc_storeStrong((id *)&self->_baseProvider, a3);
}

- (ACActivityCenter)activityCenter
{
  return self->_activityCenter;
}

- (void)setActivityCenter:(id)a3
{
  objc_storeStrong((id *)&self->_activityCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityCenter, 0);
  objc_storeStrong((id *)&self->_baseProvider, 0);
  objc_storeStrong((id *)&self->_alarmProvider, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
}

void __44__MTSessionsManager_createSessionWithTimer___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B8D7F000, v0, v1, "%{public}@ create session failed with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)createSessionWithTimer:(uint64_t)a3 forAlert:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1B8D7F000, a2, a3, "%{public}@ could not find any alerting sessions", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)createSessionWithTimer:(uint64_t)a1 forAlert:(void *)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "timerIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1B8D7F000, a3, v5, "%{public}@ reached max limit for active sessions, dropping non alerting session for timer id: %{public}@", v6);

  OUTLINED_FUNCTION_6();
}

void __44__MTSessionsManager_updateSessionWithTimer___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B8D7F000, v0, v1, "%{public}@ update session failed with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __46__MTSessionsManager_finishSessionWithTimerId___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B8D7F000, v0, v1, "%{public}@ finish session failed with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __44__MTSessionsManager_createSessionWithAlarm___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B8D7F000, v0, v1, "%{public}@ create alarm session failed with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)createSessionWithAlarm:(uint64_t)a1 forAlert:(void *)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "alarmIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1B8D7F000, a3, v5, "%{public}@ reached max limit for active sessions, dropping non alerting session for alarm id: %{public}@", v6);

  OUTLINED_FUNCTION_6();
}

void __44__MTSessionsManager_updateSessionWithAlarm___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B8D7F000, v0, v1, "%{public}@ update alarm session failed with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
