@implementation MTSleepModeStateMachineUserRequestedOffState

- (MTSleepModeStateMachineUserRequestedOffState)initWithKeepOffUntilDate:(id)a3 stateMachine:(id)a4
{
  id v7;
  MTSleepModeStateMachineUserRequestedOffState *v8;
  MTSleepModeStateMachineUserRequestedOffState *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTSleepModeStateMachineUserRequestedOffState;
  v8 = -[MTStateMachineState initWithStateMachine:](&v11, sel_initWithStateMachine_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_keepOffUntilDate, a3);

  return v9;
}

- (BOOL)isEqualToState:(id)a3
{
  MTSleepModeStateMachineUserRequestedOffState *v4;
  MTSleepModeStateMachineUserRequestedOffState *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MTSleepModeStateMachineUserRequestedOffState *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4
         && -[MTSleepModeStateMachineUserRequestedOffState isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[MTSleepModeStateMachineUserRequestedOffState keepOffUntilDate](self, "keepOffUntilDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSleepModeStateMachineUserRequestedOffState keepOffUntilDate](v5, "keepOffUntilDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToDate:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)didEnterWithPreviousState:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  MTSleepModeStateMachineUserRequestedOffState *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[MTSleepModeStateMachineUserRequestedOffState isEqualToState:](self, "isEqualToState:", a3))
  {
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "stateMachine:disengageSleepModeUserRequested:", v5, 1);

    if (v6)
    {
      MTLogForCategory(7);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = CFSTR("sleep mode");
        _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling manual %{public}@ invalidation", (uint8_t *)&v15, 0x16u);
      }

      -[MTStateMachineState stateMachine](self, "stateMachine");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isUserAsleep");

      MTLogForCategory(7);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          -[MTSleepModeStateMachineUserRequestedOffState keepOffUntilDate](self, "keepOffUntilDate");
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = 138543618;
          v16 = self;
          v17 = 2114;
          v18 = v12;
          _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Keeping off until: %{public}@", (uint8_t *)&v15, 0x16u);

        }
        -[MTStateMachineState stateMachine](self, "stateMachine");
        v10 = objc_claimAutoreleasedReturnValue();
        -[MTStateMachineState stateMachine](self, "stateMachine");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTSleepModeStateMachineUserRequestedOffState keepOffUntilDate](self, "keepOffUntilDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stateMachine:keepSleepModeOffUntilDate:](v10, "stateMachine:keepSleepModeOffUntilDate:", v13, v14);

      }
      else if (v11)
      {
        v15 = 138543362;
        v16 = self;
        _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Not in user sleep window", (uint8_t *)&v15, 0xCu);
      }

    }
  }
}

- (void)updateState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  MTSleepModeStateMachineUserRequestedOffState *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[MTSleepModeStateMachineState updateModeKeepOffUntilDateIfNecessary](self, "updateModeKeepOffUntilDateIfNecessary");
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTStateMachineState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keepOffUntilDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && !objc_msgSend(v6, "mtIsAfterDate:", v8))
  {
    MTLogForCategory(7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring updateState until keepOffUntilDate: %{public}@", buf, 0x16u);
    }

  }
  else
  {
    MTLogForCategory(7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ We are past keepOffUntilDate: %{public}@", buf, 0x16u);
    }

    v11.receiver = self;
    v11.super_class = (Class)MTSleepModeStateMachineUserRequestedOffState;
    -[MTSleepModeStateMachineState updateState:](&v11, sel_updateState_, v3);
  }

}

- (NSDate)keepOffUntilDate
{
  return self->_keepOffUntilDate;
}

- (void)setKeepOffUntilDate:(id)a3
{
  objc_storeStrong((id *)&self->_keepOffUntilDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepOffUntilDate, 0);
}

@end
