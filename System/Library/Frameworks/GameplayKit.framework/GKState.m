@implementation GKState

+ (GKState)state
{
  return (GKState *)objc_alloc_init((Class)objc_opt_class());
}

- (GKState)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKState;
  return -[GKState init](&v3, sel_init);
}

- (BOOL)isValidNextState:(Class)stateClass
{
  return -[objc_class isSubclassOfClass:](stateClass, "isSubclassOfClass:", objc_opt_class());
}

- (GKStateMachine)stateMachine
{
  return (GKStateMachine *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)_setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->_stateMachine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateMachine);
}

@end
