@implementation CATTransition

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATTransition.m"), 21, CFSTR("%@ cannot call %@"), a1, v5);

  return 0;
}

- (CATTransition)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTransition.m"), 28, CFSTR("%@ cannot call %@"), v5, v6);

  return 0;
}

- (CATTransition)initWithState:(id)a3 action:(SEL)a4
{
  id v6;
  CATTransition *v7;
  CATTransition *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTransition;
  v7 = -[CATTransition init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_state, v6);
    v8->_action = a4;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  NSStringFromSelector(self->_action);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTransition state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { action = %@, state = %@ }>"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CATState)state
{
  return (CATState *)objc_loadWeakRetained((id *)&self->_state);
}

- (SEL)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_state);
}

@end
