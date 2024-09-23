@implementation MTSleepCoordinatorStateMachine

- (MTSleepCoordinatorStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  MTSleepCoordinatorStateMachine *v4;
  MTSleepCoordinatorStateMachineAsleepState *v5;
  MTSleepCoordinatorStateMachineAsleepState *asleepState;
  MTSleepCoordinatorStateMachineAwakeState *v7;
  MTSleepCoordinatorStateMachineAwakeState *awakeState;
  MTSleepCoordinatorStateMachineDisabledState *v9;
  MTSleepCoordinatorStateMachineDisabledState *disabledState;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTSleepCoordinatorStateMachine;
  v4 = -[MTStateMachine initWithDelegate:infoProvider:](&v12, sel_initWithDelegate_infoProvider_, a3, a4);
  if (v4)
  {
    v5 = -[MTStateMachineState initWithStateMachine:]([MTSleepCoordinatorStateMachineAsleepState alloc], "initWithStateMachine:", v4);
    asleepState = v4->_asleepState;
    v4->_asleepState = v5;

    v7 = -[MTStateMachineState initWithStateMachine:]([MTSleepCoordinatorStateMachineAwakeState alloc], "initWithStateMachine:", v4);
    awakeState = v4->_awakeState;
    v4->_awakeState = v7;

    v9 = -[MTStateMachineState initWithStateMachine:]([MTSleepCoordinatorStateMachineDisabledState alloc], "initWithStateMachine:", v4);
    disabledState = v4->_disabledState;
    v4->_disabledState = v9;

    -[MTStateMachine enterState:](v4, "enterState:", v4->_disabledState);
  }
  return v4;
}

- (BOOL)isUserAsleep
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  -[MTStateMachine currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSleepCoordinatorStateMachine asleepState](self, "asleepState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[MTStateMachine currentState](self, "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSleepCoordinatorStateMachine asleepState](self, "asleepState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (id)stateMachineLog
{
  return MTLogForCategory(7);
}

- (void)updateState
{
  id v2;

  -[MTStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateState");

}

- (void)userWentToBed
{
  id v2;

  -[MTStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userWentToBed");

}

- (void)userWokeUp
{
  id v2;

  -[MTStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userWokeUp");

}

- (void)userBedTimeReached:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStateMachine currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userBedTimeReached:", v4);

}

- (void)userWakeTimeReached:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStateMachine currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userWakeTimeReached:", v4);

}

- (void)userWakeUpAlarmFired
{
  id v2;

  -[MTStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userWakeUpAlarmFired");

}

- (void)wakeUpAlarmTimedOut
{
  id v2;

  -[MTStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wakeUpAlarmTimedOut");

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

- (unint64_t)sleepTimeOutMinutes
{
  void *v2;
  unint64_t v3;

  -[MTStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepTimeOutMinutes");

  return v3;
}

- (void)stateMachineUserWokeUp:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateMachineUserWokeUp:", v4);

}

- (void)stateMachineUserWentToBed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateMachineUserWentToBed:", v4);

}

- (void)stateMachine:(id)a3 dismissWakeUpAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stateMachine:dismissWakeUpAlarm:dismissAction:", v9, v8, a5);

}

- (void)stateMachine:(id)a3 shouldScheduleAlarmTimeoutForSecondsFromNow:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[MTStateMachine delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stateMachine:shouldScheduleAlarmTimeoutForSecondsFromNow:", v6, a4);

}

- (MTSleepCoordinatorStateMachineAsleepState)asleepState
{
  return self->_asleepState;
}

- (void)setAsleepState:(id)a3
{
  objc_storeStrong((id *)&self->_asleepState, a3);
}

- (MTSleepCoordinatorStateMachineAwakeState)awakeState
{
  return self->_awakeState;
}

- (void)setAwakeState:(id)a3
{
  objc_storeStrong((id *)&self->_awakeState, a3);
}

- (MTSleepCoordinatorStateMachineDisabledState)disabledState
{
  return self->_disabledState;
}

- (void)setDisabledState:(id)a3
{
  objc_storeStrong((id *)&self->_disabledState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledState, 0);
  objc_storeStrong((id *)&self->_awakeState, 0);
  objc_storeStrong((id *)&self->_asleepState, 0);
}

@end
