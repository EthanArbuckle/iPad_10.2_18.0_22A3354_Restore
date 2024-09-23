@implementation GAXTimeRestrictionManager

- (GAXTimeRestrictionManager)initWithAssertedAccessQueue:(id)a3
{
  id v4;
  NSObject *v5;
  GAXTimeRestrictionManager *v6;
  GAXTimeRestrictionManager *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  if ((objc_msgSend(v4, "canWriteInCurrentExecutionThread") & 1) == 0)
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[GAXTimeRestrictionManager initWithAssertedAccessQueue:].cold.1(v4);

  }
  v11.receiver = self;
  v11.super_class = (Class)GAXTimeRestrictionManager;
  v6 = -[GAXTimeRestrictionManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GAXTimeRestrictionManager setAssertedAccessQueue:](v6, "setAssertedAccessQueue:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GAXTimeRestrictionManager setAlarmTimers:](v7, "setAlarmTimers:", v8);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GAXTimeRestrictionManager setAlarmDurationsInSeconds:](v7, "setAlarmDurationsInSeconds:", v9);

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GAXTimeRestrictionManager isActive](self, "isActive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GAXTimeRestrictionManager isPaused](self, "isPaused"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("GAXTimeRestrictionManager<%p>. active:%@ paused:%@\n"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GAXTimeRestrictionManager startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  -[GAXTimeRestrictionManager startTime](self, "startTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("  start time:%@ s (absolute:%@ s)\n"), v10, v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 + (double)-[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("  expiration duration:%@ s (absolute:%@ s)\n"), v12, v13);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[GAXTimeRestrictionManager alarmDurationsInSeconds](self, "alarmDurationsInSeconds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 + (double)objc_msgSend(v19, "integerValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("  alarm:%@ s (absolute:%@ s)\n"), v19, v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  return v6;
}

- (int64_t)remainingTimeInSeconds
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;

  -[GAXTimeRestrictionManager assertedAccessQueue](self, "assertedAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canReadInCurrentExecutionThread");

  if ((v4 & 1) == 0)
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[GAXTimeRestrictionManager remainingTimeInSeconds].cold.1(self);

  }
  -[GAXTimeRestrictionManager startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = fabs(v7);

  v9 = -[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds");
  return (uint64_t)((double)v9 - v8) & ~((uint64_t)((double)v9 - v8) >> 63);
}

- (void)beginWithDuration:(int64_t)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[GAXTimeRestrictionManager assertedAccessQueue](self, "assertedAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canWriteInCurrentExecutionThread");

  if ((v6 & 1) == 0)
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[GAXTimeRestrictionManager beginWithDuration:].cold.2(self);

  }
  if (-[GAXTimeRestrictionManager isActive](self, "isActive"))
  {
    GAXLogTimeRestrictions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "Can't begin time restriction, it's already active", (uint8_t *)&v15, 2u);
    }
  }
  else if (a3 <= 0)
  {
    GAXLogTimeRestrictions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "Can't begin time restriction, specified duration is too short: %{public}@", (uint8_t *)&v15, 0xCu);

    }
  }
  else
  {
    -[GAXTimeRestrictionManager setExpirationDurationInSeconds:](self, "setExpirationDurationInSeconds:", 60 * a3);
    -[GAXTimeRestrictionManager setActive:](self, "setActive:", 1);
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "guidedAccessOverrideTimeRestrictionDuration");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSObject doubleValue](v8, "doubleValue");
      -[GAXTimeRestrictionManager setExpirationDurationInSeconds:](self, "setExpirationDurationInSeconds:", (uint64_t)v10);
      GAXLogTimeRestrictions();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v12;
        _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_INFO, "App Time restriction is being overridden with internal value: %{public}@", (uint8_t *)&v15, 0xCu);

      }
    }
    -[GAXTimeRestrictionManager _addAlarmForDuration:](self, "_addAlarmForDuration:", a3);
    -[GAXTimeRestrictionManager _scheduleTimers](self, "_scheduleTimers");
  }

  GAXLogTimeRestrictions();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[GAXTimeRestrictionManager beginWithDuration:].cold.1();

}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_18C62B000, v0, v1, "  TimeRestrictions: Was Asked to Cancel: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)pause
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_18C62B000, v0, v1, "  TimeRestrictions: Was Asked to Pause: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_18C62B000, v0, v1, "  TimeRestrictions: Was Asked to Resume: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_addAlarmForDuration:(int64_t)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[GAXTimeRestrictionManager assertedAccessQueue](self, "assertedAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canWriteInCurrentExecutionThread");

  if ((v6 & 1) == 0)
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[GAXTimeRestrictionManager beginWithDuration:].cold.2(self);

  }
  v8 = -1.0;
  v9 = 30.0;
  if (a3 >= 6)
  {
    if ((unint64_t)a3 >= 0xD)
    {
      if ((unint64_t)a3 >= 0x14)
      {
        v9 = dbl_18C737200[(unint64_t)a3 < 0x1E];
        if ((unint64_t)a3 >= 0x1E)
          v8 = 60.0;
        else
          v8 = 30.0;
        goto LABEL_14;
      }
      v8 = 30.0;
      v10 = 0x405E000000000000;
    }
    else
    {
      v10 = 0x404E000000000000;
    }
    v9 = *(double *)&v10;
  }
LABEL_14:
  -[GAXTimeRestrictionManager alarmDurationsInSeconds](self, "alarmDurationsInSeconds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  if (v8 > 0.0)
  {
    -[GAXTimeRestrictionManager alarmDurationsInSeconds](self, "alarmDurationsInSeconds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (void)_scheduleTimers
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GAXTimeRestrictionManager setStartTime:](self, "setStartTime:", v3);

  -[GAXTimeRestrictionManager startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  v7 = -[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds");
  v8 = objc_alloc(MEMORY[0x1E0CF3948]);
  -[GAXTimeRestrictionManager assertedAccessQueue](self, "assertedAccessQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTargetAccessQueue:", v9);

  v11 = -[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds");
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __44__GAXTimeRestrictionManager__scheduleTimers__block_invoke;
  v29[3] = &unk_1E24C4C38;
  v29[4] = self;
  objc_msgSend(v10, "afterDelay:processBlock:", v29, (double)v11);
  -[GAXTimeRestrictionManager setExpirationTimer:](self, "setExpirationTimer:", v10);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[GAXTimeRestrictionManager alarmDurationsInSeconds](self, "alarmDurationsInSeconds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = v6 + (double)v7;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v19 = v15 - (double)objc_msgSend(v18, "integerValue");
        if (v19 > v6)
        {
          v20 = objc_alloc(MEMORY[0x1E0CF3948]);
          -[GAXTimeRestrictionManager assertedAccessQueue](self, "assertedAccessQueue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithTargetAccessQueue:", v21);

          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __44__GAXTimeRestrictionManager__scheduleTimers__block_invoke_2;
          v24[3] = &unk_1E24C5200;
          v24[4] = self;
          v24[5] = v18;
          objc_msgSend(v22, "afterDelay:processBlock:", v24, v19 - v6);
          -[GAXTimeRestrictionManager alarmTimers](self, "alarmTimers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v22);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v14);
  }

}

void __44__GAXTimeRestrictionManager__scheduleTimers__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "alarmDurationsInSeconds");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "_removeAllTimers");
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeDidExpireForTimeRestriction:", *(_QWORD *)(a1 + 32));

}

void __44__GAXTimeRestrictionManager__scheduleTimers__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeAlarmDidOccurForTimeRestriction:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "alarmDurationsInSeconds");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)_removeAllTimers
{
  void *v3;
  char v4;
  NSObject *v5;

  -[GAXTimeRestrictionManager assertedAccessQueue](self, "assertedAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canWriteInCurrentExecutionThread");

  if ((v4 & 1) == 0)
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[GAXTimeRestrictionManager beginWithDuration:].cold.2(self);

  }
  -[GAXTimeRestrictionManager _removeAllAlarmTimers](self, "_removeAllAlarmTimers");
  -[GAXTimeRestrictionManager _removeExpirationTimer](self, "_removeExpirationTimer");
}

- (void)_removeExpirationTimer
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;

  -[GAXTimeRestrictionManager assertedAccessQueue](self, "assertedAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canWriteInCurrentExecutionThread");

  if ((v4 & 1) == 0)
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[GAXTimeRestrictionManager beginWithDuration:].cold.2(self);

  }
  -[GAXTimeRestrictionManager expirationTimer](self, "expirationTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[GAXTimeRestrictionManager setExpirationTimer:](self, "setExpirationTimer:", 0);
}

- (void)_removeAllAlarmTimers
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[GAXTimeRestrictionManager assertedAccessQueue](self, "assertedAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canWriteInCurrentExecutionThread");

  if ((v4 & 1) == 0)
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[GAXTimeRestrictionManager beginWithDuration:].cold.2(self);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[GAXTimeRestrictionManager alarmTimers](self, "alarmTimers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "cancel");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[GAXTimeRestrictionManager alarmTimers](self, "alarmTimers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (int64_t)expirationDurationInSeconds
{
  return self->_expirationDurationInSeconds;
}

- (void)setExpirationDurationInSeconds:(int64_t)a3
{
  self->_expirationDurationInSeconds = a3;
}

- (NSMutableSet)alarmDurationsInSeconds
{
  return self->_alarmDurationsInSeconds;
}

- (void)setAlarmDurationsInSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_alarmDurationsInSeconds, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (GAXTimeRestrictionManagerDelegate)delegate
{
  return (GAXTimeRestrictionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXAccessQueue)assertedAccessQueue
{
  return self->_assertedAccessQueue;
}

- (void)setAssertedAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assertedAccessQueue, a3);
}

- (AXAccessQueueTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (void)setExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_expirationTimer, a3);
}

- (NSMutableArray)alarmTimers
{
  return self->_alarmTimers;
}

- (void)setAlarmTimers:(id)a3
{
  objc_storeStrong((id *)&self->_alarmTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmTimers, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_assertedAccessQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_alarmDurationsInSeconds, 0);
}

- (void)initWithAssertedAccessQueue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "label");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_9(&dword_18C62B000, v2, v3, "This code must execute in a writing block on AXAccessQueue: %@", v4, v5, v6, v7, v8);

}

- (void)remainingTimeInSeconds
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "assertedAccessQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_9(&dword_18C62B000, v3, v4, "This code must execute in a reading (or writing) block on AXAccessQueue: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)beginWithDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_18C62B000, v0, v1, "  TimeRestrictions: Was Asked to Start: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)beginWithDuration:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "assertedAccessQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_9(&dword_18C62B000, v3, v4, "This code must execute in a writing block on AXAccessQueue: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

@end
