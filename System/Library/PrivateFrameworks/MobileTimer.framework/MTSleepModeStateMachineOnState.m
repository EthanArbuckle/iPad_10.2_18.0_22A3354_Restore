@implementation MTSleepModeStateMachineOnState

- (MTSleepModeStateMachineOnState)initWithSleepModeEndDate:(id)a3 stateMachine:(id)a4
{
  id v7;
  MTSleepModeStateMachineOnState *v8;
  MTSleepModeStateMachineOnState *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTSleepModeStateMachineOnState;
  v8 = -[MTStateMachineState initWithStateMachine:](&v11, sel_initWithStateMachine_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_sleepModeEndDate, a3);

  return v9;
}

- (BOOL)isEqualToState:(id)a3
{
  MTSleepModeStateMachineOnState *v4;
  MTSleepModeStateMachineOnState *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MTSleepModeStateMachineOnState *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4
         && -[MTSleepModeStateMachineOnState isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[MTSleepModeStateMachineOnState sleepModeEndDate](self, "sleepModeEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSleepModeStateMachineOnState sleepModeEndDate](v5, "sleepModeEndDate");
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
  id v6;

  if (!-[MTSleepModeStateMachineOnState isEqualToState:](self, "isEqualToState:", a3))
  {
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSleepModeStateMachineOnState sleepModeEndDate](self, "sleepModeEndDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stateMachine:engageSleepModeUntilDate:userEngaged:", v4, v5, 0);

  }
}

- (NSDate)sleepModeEndDate
{
  return self->_sleepModeEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepModeEndDate, 0);
}

@end
