@implementation MTSleepModeStateMachineWaitingState

- (void)didEnterWithPreviousState:(id)a3
{
  void *v4;
  id v5;

  if (self != a3)
  {
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MTStateMachineState stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateMachine:scheduleUpdateForSecondsFromNow:", v4, 60.0);

  }
}

@end
