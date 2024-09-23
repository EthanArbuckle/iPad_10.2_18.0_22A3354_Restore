@implementation MTStateMachineState

- (MTStateMachineState)initWithStateMachine:(id)a3
{
  id v4;
  MTStateMachineState *v5;
  MTStateMachineState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTStateMachineState;
  v5 = -[MTStateMachineState init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_stateMachine, v4);

  return v6;
}

- (MTStateMachine)stateMachine
{
  return (MTStateMachine *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->_stateMachine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateMachine);
}

@end
