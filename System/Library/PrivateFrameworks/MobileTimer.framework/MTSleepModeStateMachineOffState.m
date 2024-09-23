@implementation MTSleepModeStateMachineOffState

- (void)didEnterWithPreviousState:(id)a3
{
  void *v4;
  id v5;

  if (self != a3)
  {
    if (a3)
    {
      -[MTStateMachineState stateMachine](self, "stateMachine");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[MTStateMachineState stateMachine](self, "stateMachine");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stateMachine:disengageSleepModeUserRequested:", v4, 0);

    }
  }
}

@end
