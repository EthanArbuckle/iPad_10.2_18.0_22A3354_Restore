@implementation NFStateMachineTransition

- (NFStateMachineTransition)initWithStateMachine:(id)a3 event:(id)a4 fromState:(id)a5 toState:(id)a6 context:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NFStateMachineTransition *v17;
  NFStateMachineTransition *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NFStateMachineTransition;
  v17 = -[NFStateMachineTransition init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_stateMachine, a3);
    objc_storeStrong((id *)&v18->_event, a4);
    objc_storeStrong((id *)&v18->_fromState, a5);
    objc_storeStrong((id *)&v18->_toState, a6);
    objc_storeStrong((id *)&v18->_context, a7);
  }

  return v18;
}

- (NFStateMachineState)toState
{
  return self->_toState;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NFStateMachineState)fromState
{
  return self->_fromState;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NFStateMachineTransition event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFStateMachineTransition fromState](self, "fromState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFStateMachineTransition toState](self, "toState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFStateMachineTransition context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%p event=%@, fromState=%@, toState=%@, context=%@}"), self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (NFStateMachineEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void)setFromState:(id)a3
{
  objc_storeStrong((id *)&self->_fromState, a3);
}

- (void)setToState:(id)a3
{
  objc_storeStrong((id *)&self->_toState, a3);
}

- (NFStateMachineContextType)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_toState, 0);
  objc_storeStrong((id *)&self->_fromState, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end
