@implementation MTSleepCoordinatorStateMachineState

- (void)updateState
{
  void *v3;
  id v4;

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSleepCoordinatorStateMachineState updateStateForSleepAlarm:](self, "updateStateForSleepAlarm:", v3);

}

- (void)updateStateForSleepAlarm:(id)a3
{
  void *v4;
  id v5;

  -[MTSleepCoordinatorStateMachineState determineNextStateForSleepAlarm:](self, "determineNextStateForSleepAlarm:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enterState:", v5);

}

- (id)determineNextStateForSleepAlarm:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  void *v38;
  int v39;
  MTSleepCoordinatorStateMachineState *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(v5, "sleepSchedule") & 1) != 0)
    {
      if (objc_msgSend(v5, "isFiring"))
      {
        MTLogForCategory(7);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v39 = 138543362;
          v40 = self;
          _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ haven't dismissed morning alarm yet so we're sleeping", (uint8_t *)&v39, 0xCu);
        }

        -[MTStateMachineState stateMachine](self, "stateMachine");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "asleepState");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_msgSend(v5, "nextTriggersAfterDate:includeBedtime:", v7, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "triggerType") == 5)
      {
        MTLogForCategory(7);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "triggerDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138543618;
          v40 = self;
          v41 = 2114;
          v42 = v17;
          v18 = "%{public}@ wake up alarm was snoozed (%{public}@) so we're sleeping";
LABEL_22:
          _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v39, 0x16u);

          goto LABEL_23;
        }
        goto LABEL_23;
      }
      if (objc_msgSend(v15, "triggerType") == 4 || objc_msgSend(v15, "triggerType") == 8)
      {
        MTLogForCategory(7);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "triggerDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138543618;
          v40 = self;
          v41 = 2114;
          v42 = v17;
          v18 = "%{public}@ next trigger is for wake up (%{public}@) so we're sleeping";
          goto LABEL_22;
        }
LABEL_23:

        -[MTStateMachineState stateMachine](self, "stateMachine");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "asleepState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
        goto LABEL_14;
      }
      objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "triggerDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "triggerDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "triggerDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v24, "mtIsBeforeDate:", v19)
          && objc_msgSend(v22, "mtIsAfterDate:", v24)
          && objc_msgSend(v22, "mtIsBeforeDate:", v19))
        {
          MTLogForCategory(7);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v39 = 138543874;
            v40 = self;
            v41 = 2114;
            v42 = v22;
            v43 = 2114;
            v44 = v24;
            v26 = "%{public}@ bedtime reminder was snoozed (%{public}@) for after the bedtime: (%{public}@). it is curren"
                  "tly before bedtime and the snooze date";
            v27 = v25;
            v28 = 32;
LABEL_37:
            _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v39, v28);
            goto LABEL_38;
          }
          goto LABEL_38;
        }
        if (objc_msgSend(v24, "mtIsAfterDate:", v19)
          && objc_msgSend(v22, "mtIsBeforeDate:", v24)
          && objc_msgSend(v22, "mtIsBeforeDate:", v19))
        {
          MTLogForCategory(7);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v39 = 138543618;
            v40 = self;
            v41 = 2114;
            v42 = v22;
            v26 = "%{public}@ bedtime reminder was snoozed (%{public}@) for after the bedtime. it is currently past bedti"
                  "me but before the snooze date.";
            v27 = v25;
            v28 = 22;
            goto LABEL_37;
          }
LABEL_38:

          -[MTStateMachineState stateMachine](self, "stateMachine");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "awakeState");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_56:
          goto LABEL_24;
        }
        objc_msgSend(v9, "na_filter:", &__block_literal_global_4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "firstObject");
        v31 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v31;
        v9 = v30;
      }
      if (objc_msgSend(v15, "triggerType") == 7 && objc_msgSend(v5, "confirmedLastBedtimeReminder"))
      {
        MTLogForCategory(7);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "bedtimeDismissedDate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138543874;
          v40 = self;
          v41 = 2114;
          v42 = v33;
          v43 = 2114;
          v44 = v19;
          _os_log_impl(&dword_19AC4E000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ user confirmed go to bed notification (%{public}@) so we're sleeping until %{public}@", (uint8_t *)&v39, 0x20u);

        }
        -[MTStateMachineState stateMachine](self, "stateMachine");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "asleepState");
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_55;
      }
      if (objc_msgSend(v15, "triggerType") == 2 || objc_msgSend(v15, "triggerType") == 7)
      {
        if (objc_msgSend(v15, "triggerType") == 2)
        {
          MTLogForCategory(7);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "triggerDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 138543618;
            v40 = self;
            v41 = 2114;
            v42 = v36;
            v37 = "%{public}@ haven't seen go to bed reminder yet (%{public}@)";
LABEL_53:
            _os_log_impl(&dword_19AC4E000, v35, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v39, 0x16u);

            goto LABEL_54;
          }
          goto LABEL_54;
        }
        if (objc_msgSend(v15, "triggerType") == 7)
        {
          MTLogForCategory(7);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "triggerDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 138543618;
            v40 = self;
            v41 = 2114;
            v42 = v36;
            v37 = "%{public}@ not bedtime yet (%{public}@)";
            goto LABEL_53;
          }
LABEL_54:

          -[MTStateMachineState stateMachine](self, "stateMachine");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "awakeState");
          v34 = objc_claimAutoreleasedReturnValue();
LABEL_55:
          v13 = (void *)v34;
          goto LABEL_56;
        }
      }

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTSleepCoordinatorStateMachineState.m"), 127, CFSTR("Unhandled sleep window case!"));

      v13 = 0;
      goto LABEL_25;
    }
    MTLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138543362;
      v40 = self;
      v12 = "%{public}@ sleep schedule disabled";
      goto LABEL_11;
    }
  }
  else
  {
    MTLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138543362;
      v40 = self;
      v12 = "%{public}@ no sleep alarm, sleep disabled";
LABEL_11:
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v39, 0xCu);
    }
  }

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disabledState");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v13 = (void *)v10;
LABEL_14:

  return v13;
}

BOOL __71__MTSleepCoordinatorStateMachineState_determineNextStateForSleepAlarm___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "triggerType") == 8;
}

BOOL __71__MTSleepCoordinatorStateMachineState_determineNextStateForSleepAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "triggerType") == 3;
}

BOOL __71__MTSleepCoordinatorStateMachineState_determineNextStateForSleepAlarm___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "triggerType") == 7;
}

{
  return objc_msgSend(a2, "triggerType") != 3;
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
  objc_msgSend(v3, "awakeState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v4);

}

- (void)userWentToBed
{
  void *v3;
  void *v4;
  id v5;

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asleepState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v4);

}

- (void)userBedTimeReached:(id)a3
{
  NSObject *v4;
  int v5;
  MTSleepCoordinatorStateMachineState *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ bedtime reached, checking state", (uint8_t *)&v5, 0xCu);
  }

  -[MTSleepCoordinatorStateMachineState updateState](self, "updateState");
}

- (void)userWakeTimeReached:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  MTSleepCoordinatorStateMachineState *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEnabled") & 1) != 0)
  {
    -[MTSleepCoordinatorStateMachineState updateStateForSleepAlarm:](self, "updateStateForSleepAlarm:", v6);
  }
  else
  {
    MTLogForCategory(7);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ waketime reached but alarm not enabled, dismissing", (uint8_t *)&v10, 0xCu);
    }

    -[MTStateMachineState stateMachine](self, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stateMachine:dismissWakeUpAlarm:dismissAction:", v9, v4, 8);

  }
}

- (void)userWakeUpAlarmFired
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  MTSleepCoordinatorStateMachineState *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling alarm timeout", (uint8_t *)&v7, 0xCu);
  }

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateMachine:shouldScheduleAlarmTimeoutForSecondsFromNow:", v5, (double)(unint64_t)(60 * objc_msgSend(v6, "sleepTimeOutMinutes")));

  -[MTSleepCoordinatorStateMachineState updateState](self, "updateState");
}

- (void)wakeUpAlarmTimedOut
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  MTSleepCoordinatorStateMachineState *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm timeout occurred, dismissing", (uint8_t *)&v8, 0xCu);
  }

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateMachine:dismissWakeUpAlarm:dismissAction:", v5, v7, 7);

}

@end
