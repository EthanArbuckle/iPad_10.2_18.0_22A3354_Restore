@implementation CATStateMachineEvent

- (id)description
{
  void *v2;
  void *v3;

  -[CATStateMachineEvent trigger](self, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)eventWithTrigger:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventTrigger:context:", v7, v6);

  return v8;
}

- (CATStateMachineEvent)initWithEventTrigger:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  CATStateMachineEvent *v9;
  uint64_t v10;
  id trigger;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trigger"));

  }
  v14.receiver = self;
  v14.super_class = (Class)CATStateMachineEvent;
  v9 = -[CATStateMachineEvent init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    trigger = v9->_trigger;
    v9->_trigger = (id)v10;

    objc_storeStrong(&v9->_context, a4);
  }

  return v9;
}

- (id)trigger
{
  return self->_trigger;
}

- (id)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_trigger, 0);
}

@end
