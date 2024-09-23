@implementation MTSleepModeStateMachineState

- (void)updateState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[MTSleepModeStateMachineState updateModeKeepOffUntilDateIfNecessary](self, "updateModeKeepOffUntilDateIfNecessary");
  -[MTSleepModeStateMachineState determineNextState:](self, "determineNextState:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v6);

}

- (void)updateModeKeepOffUntilDateIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTSleepModeStateMachineState *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keepOffUntilDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v4, "mtIsBeforeDate:", v6))
  {
    -[MTSleepModeStateMachineState nextSleepModeStartDateAfterDate:](self, "nextSleepModeStartDateAfterDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToDate:", v7) & 1) == 0)
    {
      MTLogForCategory(7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating keep off until date: %{public}@", (uint8_t *)&v11, 0x16u);
      }

      -[MTStateMachineState stateMachine](self, "stateMachine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTStateMachineState stateMachine](self, "stateMachine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stateMachine:keepSleepModeOffUntilDate:", v10, v7);

    }
  }

}

- (id)determineNextState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  __CFString *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v29;
  __CFString *v30;
  int v31;
  MTSleepModeStateMachineState *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keepOffUntilDate");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !objc_msgSend(v6, "mtIsBeforeDate:", v8))
  {
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sleepAlarm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      MTLogForCategory(7);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 138543618;
        v32 = self;
        v33 = 2114;
        v34 = CFSTR("sleep mode");
        _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ no sleep alarm, turning off %{public}@ if it's on", (uint8_t *)&v31, 0x16u);
      }
      goto LABEL_24;
    }
    if ((objc_msgSend(v10, "sleepSchedule") & 1) != 0)
    {
      if ((objc_msgSend(v10, "sleepMode") & 1) != 0)
      {
        -[MTStateMachineState stateMachine](self, "stateMachine");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isUserAsleep");

        if (v14)
        {
          if (!v3
            || (objc_msgSend(v10, "bedtimeReminder"), (v15 = objc_claimAutoreleasedReturnValue()) == 0)
            || (v16 = (void *)v15, v17 = objc_msgSend(v10, "bedtimeReminderMinutes"), v16, v17))
          {
            MTLogForCategory(7);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "alarmIDString");
              v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v31 = 138543874;
              v32 = self;
              v33 = 2114;
              v34 = CFSTR("sleep mode");
              v35 = 2114;
              v36 = v19;
              _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ turning on %{public}@ if it's not on for alarm %{public}@", (uint8_t *)&v31, 0x20u);

            }
            -[MTStateMachineState stateMachine](self, "stateMachine");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[MTSleepModeStateMachineState nextSleepModeEndDate](self, "nextSleepModeEndDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "onStateWithSleepModeEndDate:", v21);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_26;
          }
          MTLogForCategory(7);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "alarmIDString");
            v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v31 = 138543874;
            v32 = self;
            v33 = 2114;
            v34 = CFSTR("sleep mode");
            v35 = 2114;
            v36 = v30;
            _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ waiting 60 seconds before turning on %{public}@ for alarm %{public}@", (uint8_t *)&v31, 0x20u);

          }
          -[MTStateMachineState stateMachine](self, "stateMachine");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "waitingState");
          v27 = objc_claimAutoreleasedReturnValue();
LABEL_25:
          v11 = (void *)v27;
LABEL_26:

          goto LABEL_27;
        }
        MTLogForCategory(7);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "alarmIDString");
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v31 = 138543874;
          v32 = self;
          v33 = 2114;
          v34 = v23;
          v35 = 2114;
          v36 = CFSTR("sleep mode");
          v24 = "%{public}@ not in sleep window for alarm %{public}@, turning off %{public}@ if it's on";
          goto LABEL_20;
        }
      }
      else
      {
        MTLogForCategory(7);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "alarmIDString");
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v31 = 138544130;
          v32 = self;
          v33 = 2114;
          v34 = CFSTR("sleep mode");
          v35 = 2114;
          v36 = v23;
          v37 = 2114;
          v38 = CFSTR("sleep mode");
          v24 = "%{public}@ %{public}@ not enabled for alarm %{public}@, turning off %{public}@ if it's on";
          v25 = v22;
          v26 = 42;
          goto LABEL_23;
        }
      }
    }
    else
    {
      MTLogForCategory(7);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "alarmIDString");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v31 = 138543874;
        v32 = self;
        v33 = 2114;
        v34 = v23;
        v35 = 2114;
        v36 = CFSTR("sleep mode");
        v24 = "%{public}@ sleep schedule for %{public}@ not enabled, turning off %{public}@ if it's on";
LABEL_20:
        v25 = v22;
        v26 = 32;
LABEL_23:
        _os_log_impl(&dword_19AC4E000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v31, v26);

      }
    }
LABEL_24:

    -[MTStateMachineState stateMachine](self, "stateMachine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "offState");
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  MTLogForCategory(7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138543874;
    v32 = self;
    v33 = 2114;
    v34 = v8;
    v35 = 2114;
    v36 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ We are before keep off until date: %{public}@, turning off %{public}@ if it's on", (uint8_t *)&v31, 0x20u);
  }

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userRequestedOffStateWithKeepOffUntilDate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v11;
}

- (void)sleepModeEnabled:(BOOL)a3 userRequested:(BOOL)a4 date:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  MTSleepModeStateMachineState *v20;
  uint64_t v21;

  v5 = a4;
  v6 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v6)
  {
    -[MTSleepModeStateMachineState nextSleepModeEndDate](self, "nextSleepModeEndDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v10 = objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "onStateWithSleepModeEndDate:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      -[MTStateMachineState stateMachine](self, "stateMachine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTStateMachineState stateMachine](self, "stateMachine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "offState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enterState:", v18);

      goto LABEL_9;
    }
    -[MTSleepModeStateMachineState nextSleepModeStartDateAfterDate:](self, "nextSleepModeStartDateAfterDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "mtIsAfterDate:", v14);

    if (!v15)
    {
      MTLogForCategory(7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138543362;
        v20 = self;
        _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring user requested off because it's for previous sleep window", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_7;
    }
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v10 = objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userRequestedOffStateWithKeepOffUntilDate:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v12;
  -[NSObject enterState:](v10, "enterState:", v12);

LABEL_7:
LABEL_9:

}

- (void)userWokeUp
{
  void *v3;
  void *v4;
  id v5;

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "offState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v4);

}

- (id)nextSleepModeEndDate
{
  void *v3;
  void *v4;
  void *v5;

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSleepModeStateMachineState nextSleepModeEndDateAfterDate:](self, "nextSleepModeEndDateAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextSleepModeEndDateAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextExpectedWakeUpDateAfterDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nextSleepModeStartDate
{
  void *v3;
  void *v4;
  void *v5;

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSleepModeStateMachineState nextSleepModeStartDateAfterDate:](self, "nextSleepModeStartDateAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextSleepModeStartDateAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextExpectedBedtimeDateAfterDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
