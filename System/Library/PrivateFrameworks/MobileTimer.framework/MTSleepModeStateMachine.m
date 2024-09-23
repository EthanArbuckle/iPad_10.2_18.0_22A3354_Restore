@implementation MTSleepModeStateMachine

- (MTSleepModeStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  MTSleepModeStateMachine *v4;
  MTSleepModeStateMachineInitialState *v5;
  MTSleepModeStateMachineInitialState *initialState;
  MTSleepModeStateMachineOffState *v7;
  MTSleepModeStateMachineOffState *offState;
  MTSleepModeStateMachineWaitingState *v9;
  MTSleepModeStateMachineWaitingState *waitingState;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTSleepModeStateMachine;
  v4 = -[MTStateMachine initWithDelegate:infoProvider:](&v12, sel_initWithDelegate_infoProvider_, a3, a4);
  if (v4)
  {
    v5 = -[MTStateMachineState initWithStateMachine:]([MTSleepModeStateMachineInitialState alloc], "initWithStateMachine:", v4);
    initialState = v4->_initialState;
    v4->_initialState = v5;

    v7 = -[MTStateMachineState initWithStateMachine:]([MTSleepModeStateMachineOffState alloc], "initWithStateMachine:", v4);
    offState = v4->_offState;
    v4->_offState = v7;

    v9 = -[MTStateMachineState initWithStateMachine:]([MTSleepModeStateMachineWaitingState alloc], "initWithStateMachine:", v4);
    waitingState = v4->_waitingState;
    v4->_waitingState = v9;

    -[MTStateMachine enterState:](v4, "enterState:", v4->_initialState);
  }
  return v4;
}

- (id)onStateWithSleepModeEndDate:(id)a3
{
  id v4;
  MTSleepModeStateMachineOnState *v5;

  v4 = a3;
  v5 = -[MTSleepModeStateMachineOnState initWithSleepModeEndDate:stateMachine:]([MTSleepModeStateMachineOnState alloc], "initWithSleepModeEndDate:stateMachine:", v4, self);

  return v5;
}

- (id)userRequestedOffStateWithKeepOffUntilDate:(id)a3
{
  id v4;
  MTSleepModeStateMachineUserRequestedOffState *v5;

  v4 = a3;
  v5 = -[MTSleepModeStateMachineUserRequestedOffState initWithKeepOffUntilDate:stateMachine:]([MTSleepModeStateMachineUserRequestedOffState alloc], "initWithKeepOffUntilDate:stateMachine:", v4, self);

  return v5;
}

- (id)stateMachineLog
{
  return MTLogForCategory(7);
}

- (void)updateState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MTStateMachine currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateState:", v3);

}

- (void)sleepModeEnabled:(BOOL)a3 userRequested:(BOOL)a4 date:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[MTStateMachine currentState](self, "currentState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sleepModeEnabled:userRequested:date:", v6, v5, v8);

}

- (void)userWokeUp
{
  id v2;

  -[MTStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userWokeUp");

}

- (id)sleepAlarm
{
  void *v2;
  void *v3;

  -[MTStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentDate
{
  void *v2;
  void *v3;

  -[MTStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isSleepModeEnabled:(BOOL *)a3
{
  void *v4;

  -[MTStateMachine infoProvider](self, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "isSleepModeEnabled:", a3);

  return (char)a3;
}

- (id)keepOffUntilDate
{
  void *v2;
  void *v3;

  -[MTStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keepOffUntilDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isUserAsleep
{
  void *v2;
  char v3;

  -[MTStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserAsleep");

  return v3;
}

- (BOOL)stateMachine:(id)a3 engageSleepModeUntilDate:(id)a4 userEngaged:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "stateMachine:engageSleepModeUntilDate:userEngaged:", v9, v8, v5);

  return v5;
}

- (BOOL)stateMachine:(id)a3 disengageSleepModeUserRequested:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "stateMachine:disengageSleepModeUserRequested:", v6, v4);

  return v4;
}

- (void)stateMachine:(id)a3 keepSleepModeOffUntilDate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateMachine:keepSleepModeOffUntilDate:", v7, v6);

}

- (void)stateMachineClearKeepSleepModeOff:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateMachineClearKeepSleepModeOff:", v4);

}

- (void)stateMachine:(id)a3 scheduleUpdateForSecondsFromNow:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stateMachine:scheduleUpdateForSecondsFromNow:", v6, a4);

}

- (MTSleepModeStateMachineInitialState)initialState
{
  return self->_initialState;
}

- (MTSleepModeStateMachineOffState)offState
{
  return self->_offState;
}

- (MTSleepModeStateMachineWaitingState)waitingState
{
  return self->_waitingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingState, 0);
  objc_storeStrong((id *)&self->_offState, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
}

@end
