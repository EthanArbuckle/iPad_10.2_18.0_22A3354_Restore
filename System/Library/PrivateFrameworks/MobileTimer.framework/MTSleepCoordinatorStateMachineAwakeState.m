@implementation MTSleepCoordinatorStateMachineAwakeState

- (void)didEnterWithPreviousState:(id)a3
{
  void *v4;
  MTSleepCoordinatorStateMachineAwakeState *v5;
  char isKindOfClass;
  MTSleepCoordinatorStateMachineAwakeState *v7;

  v7 = (MTSleepCoordinatorStateMachineAwakeState *)a3;
  -[MTStateMachineState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disabledState");
  v5 = (MTSleepCoordinatorStateMachineAwakeState *)objc_claimAutoreleasedReturnValue();
  if (v7 == self || v5 == v7)
    goto LABEL_5;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v5 = (MTSleepCoordinatorStateMachineAwakeState *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stateMachineUserWokeUp:", v5);
LABEL_5:

  }
}

@end
