@implementation CATState

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATState.m"), 23, CFSTR("%@ cannot call %@"), a1, v5);

  return 0;
}

- (CATState)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATState.m"), 30, CFSTR("%@ cannot call %@"), v5, v6);

  return 0;
}

- (CATState)initWithName:(id)a3
{
  id v5;
  CATState *v6;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  NSMutableDictionary *mTransitionByTriggeringEvent;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATState.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CATState;
  v6 = -[CATState init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v7;

    v9 = objc_opt_new();
    mTransitionByTriggeringEvent = v6->mTransitionByTriggeringEvent;
    v6->mTransitionByTriggeringEvent = (NSMutableDictionary *)v9;

  }
  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATState name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { name = %@ }>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addTransitionToState:(id)a3 triggeringEvent:(id)a4
{
  -[CATState addTransitionToState:triggeringEvent:action:](self, "addTransitionToState:triggeringEvent:action:", a3, a4, 0);
}

- (void)addTransitionToState:(id)a3 triggeringEvent:(id)a4 action:(SEL)a5
{
  id v9;
  void *v10;
  CATTransition *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATState.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggeringEvent"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->mTransitionByTriggeringEvent, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATState.m"), 69, CFSTR("%@ cannot add duplicate transition for %@"), self, v9);

  }
  v11 = -[CATTransition initWithState:action:]([CATTransition alloc], "initWithState:action:", v14, a5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mTransitionByTriggeringEvent, "setObject:forKeyedSubscript:", v11, v9);

}

- (id)transitionWithTriggeringEvent:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->mTransitionByTriggeringEvent, "objectForKeyedSubscript:", a3);
}

- (NSString)name
{
  return self->_name;
}

- (SEL)enterAction
{
  return self->_enterAction;
}

- (void)setEnterAction:(SEL)a3
{
  self->_enterAction = a3;
}

- (SEL)exitAction
{
  return self->_exitAction;
}

- (void)setExitAction:(SEL)a3
{
  self->_exitAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->mTransitionByTriggeringEvent, 0);
}

@end
