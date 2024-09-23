@implementation VSStateTransition

- (VSStateTransition)init
{
  VSStateTransition *v2;
  VSOptional *v3;
  VSOptional *previousState;
  VSOptional *v5;
  VSOptional *triggeringEvent;
  VSOptional *v7;
  VSOptional *nextState;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSStateTransition;
  v2 = -[VSStateTransition init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    previousState = v2->_previousState;
    v2->_previousState = v3;

    v5 = objc_alloc_init(VSOptional);
    triggeringEvent = v2->_triggeringEvent;
    v2->_triggeringEvent = v5;

    v7 = objc_alloc_init(VSOptional);
    nextState = v2->_nextState;
    v2->_nextState = v7;

  }
  return v2;
}

- (VSOptional)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
  objc_storeStrong((id *)&self->_previousState, a3);
}

- (VSOptional)triggeringEvent
{
  return self->_triggeringEvent;
}

- (void)setTriggeringEvent:(id)a3
{
  objc_storeStrong((id *)&self->_triggeringEvent, a3);
}

- (VSOptional)nextState
{
  return self->_nextState;
}

- (void)setNextState:(id)a3
{
  objc_storeStrong((id *)&self->_nextState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_triggeringEvent, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
}

@end
