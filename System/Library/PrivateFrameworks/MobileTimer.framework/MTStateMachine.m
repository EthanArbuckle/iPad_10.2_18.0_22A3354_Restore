@implementation MTStateMachine

- (MTStateMachine)initWithDelegate:(id)a3
{
  return -[MTStateMachine initWithDelegate:infoProvider:](self, "initWithDelegate:infoProvider:", a3, 0);
}

- (MTStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  id v6;
  id v7;
  MTStateMachine *v8;
  MTStateMachine *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTStateMachine;
  v8 = -[MTStateMachine init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_infoProvider, v7);
  }

  return v9;
}

- (void)enterState:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  MTStateMachineState *currentState;
  MTStateMachineState *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  MTStateMachineState *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTStateMachine currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[MTStateMachine stateMachineLog](self, "stateMachineLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[MTStateMachine stateMachineName](self, "stateMachineName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      currentState = self->_currentState;
      v12 = 138543874;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      v16 = 2114;
      v17 = currentState;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will enter state %@ with previous state %{public}@", (uint8_t *)&v12, 0x20u);

    }
    -[MTStateMachine currentState](self, "currentState");
    v9 = (MTStateMachineState *)objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState willExitWithNextState:](v9, "willExitWithNextState:", v4);
    objc_msgSend(v4, "willEnterWithPreviousState:", v9);
    -[MTStateMachine setCurrentState:](self, "setCurrentState:", v4);
    -[MTStateMachineState didExitWithNextState:](v9, "didExitWithNextState:", v4);
    objc_msgSend(v4, "didEnterWithPreviousState:", v9);
    -[MTStateMachine stateMachineLog](self, "stateMachineLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[MTStateMachine stateMachineName](self, "stateMachineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v11;
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did enter state %{public}@ with previous state %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (id)stateMachineLog
{
  return MTLogForCategory(0);
}

- (id)stateMachineName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTStateMachine;
  -[MTStateMachine description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  -[MTStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("; currentState: %@>"), v5);

  return (NSString *)v4;
}

- (MTStateMachineState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (MTStateMachineDelegate)delegate
{
  return (MTStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTStateMachineInfoProvider)infoProvider
{
  return (MTStateMachineInfoProvider *)objc_loadWeakRetained((id *)&self->_infoProvider);
}

- (void)setInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_infoProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_infoProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
