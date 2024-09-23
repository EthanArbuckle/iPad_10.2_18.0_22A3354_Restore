@implementation CATStateMachine

+ (CATStateMachine)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATStateMachine.m"), 62, CFSTR("%@ cannot call %@"), a1, v5);

  return 0;
}

- (CATStateMachine)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 69, CFSTR("%@ cannot call %@"), v5, v6);

  return 0;
}

- (CATStateMachine)initWithTarget:(id)a3
{
  id v5;
  CATStateMachine *v6;
  uint64_t v7;
  NSMutableDictionary *mStateByName;
  uint64_t v9;
  NSString *name;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CATStateMachine;
  v6 = -[CATStateMachine init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    mStateByName = v6->mStateByName;
    v6->mStateByName = (NSMutableDictionary *)v7;

    v6->_logLevel = 0;
    objc_storeWeak(&v6->_target, v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), v5);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v9;

  }
  return v6;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->mCalloutReason)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 94, CFSTR("%@ cannot be deallocated because of '%@'"), self, self->mCalloutReason);

  }
  v5.receiver = self;
  v5.super_class = (Class)CATStateMachine;
  -[CATStateMachine dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATStateMachine name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { name = %@, currentState = %@ }>"), v4, self, v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CATStateMachine initialState](self, "initialState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { name = %@, currentState = %@ }>"), v4, self, v5, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)addStateWithName:(id)a3
{
  id v4;
  CATState *v5;

  v4 = a3;
  v5 = -[CATState initWithName:]([CATState alloc], "initWithName:", v4);

  -[CATStateMachine addState:](self, "addState:", v5);
  return v5;
}

- (void)addState:(id)a3
{
  void *v5;
  NSMutableDictionary *mStateByName;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[CATStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine currentState](self, "currentState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 118, CFSTR("%@ cannot call %@ when currentState is %@"), self, v13, v14);

  }
  mStateByName = self->mStateByName;
  objc_msgSend(v17, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mStateByName, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 119, CFSTR("%@ cannot add a duplicate state name (%@) to state machine."), self, v16);

  }
  v9 = self->mStateByName;
  objc_msgSend(v17, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v10);

  -[CATStateMachine initialState](self, "initialState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    -[CATStateMachine setInitialState:](self, "setInitialState:", v17);

}

- (id)stateWithName:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->mStateByName, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 132, CFSTR("%@ couldn't get a state for %@"), self, v5);

  }
  return v6;
}

- (void)start
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_209592000, a2, OS_LOG_TYPE_DEBUG, "%@ starting...", (uint8_t *)&v2, 0xCu);
}

- (BOOL)canTransitionWithTriggeringEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CATStateMachine eventForTriggeringEvent:](self, "eventForTriggeringEvent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionWithTriggeringEvent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (void)transitionWithTriggeringEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSString *mCalloutReason;
  NSObject *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  NSObject *v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  CATStateMachine *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[CATStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 161, CFSTR("%@ has not been started. The state machine should not receive events before it has started"), self);

  }
  -[CATStateMachine eventForTriggeringEvent:](self, "eventForTriggeringEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine currentState](self, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionWithTriggeringEvent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine currentState](self, "currentState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 166, CFSTR("%@ cannot transition from %@ with %@"), self, v35, v5);

  }
  if (self->mCalloutReason)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATStateMachine.m"), 168, CFSTR("%@ cannot call %@ with event '%@' because the receiver is already '%@'"), self, v37, v5, self->mCalloutReason);

  }
  if (-[CATStateMachine logLevel](self, "logLevel"))
  {
    _CATLogFSM();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[CATStateMachine currentState](self, "currentState");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "state");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trigger");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v39 = self;
      v40 = 2112;
      v41 = v27;
      v42 = 2112;
      v43 = v29;
      v44 = 2112;
      v45 = v30;
      _os_log_debug_impl(&dword_209592000, v11, OS_LOG_TYPE_DEBUG, "%@ transitioning from \"%@\" to \"%@\" because %@", buf, 0x2Au);

    }
  }
  objc_msgSend(v10, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    mCalloutReason = self->mCalloutReason;
    self->mCalloutReason = (NSString *)CFSTR("Calling Exit Action");

    if (-[CATStateMachine logLevel](self, "logLevel") >= 2)
    {
      _CATLogFSM();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[CATStateMachine currentState](self, "currentState");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = self;
        v40 = 2112;
        v41 = v32;
        _os_log_debug_impl(&dword_209592000, v14, OS_LOG_TYPE_DEBUG, "%@ leaving %@", buf, 0x16u);

      }
    }
    -[CATStateMachine currentState](self, "currentState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine delegateWillExitState:event:](self, "delegateWillExitState:event:", v15, v7);

    v16 = self->mCalloutReason;
    self->mCalloutReason = 0;

  }
  if (objc_msgSend(v10, "action"))
  {
    v17 = self->mCalloutReason;
    self->mCalloutReason = (NSString *)CFSTR("Calling Transition Action");

    if (-[CATStateMachine logLevel](self, "logLevel") >= 2)
    {
      _CATLogFSM();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CATStateMachine transitionWithTriggeringEvent:].cold.2((uint64_t)self, (uint64_t)v10, v18);

    }
    -[CATStateMachine invokeAction:event:](self, "invokeAction:event:", objc_msgSend(v10, "action"), v7);
    v19 = self->mCalloutReason;
    self->mCalloutReason = 0;

  }
  objc_msgSend(v10, "state");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v10, "state");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine setCurrentState:](self, "setCurrentState:", v21);

    if (-[CATStateMachine logLevel](self, "logLevel") >= 2)
    {
      _CATLogFSM();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        -[CATStateMachine currentState](self, "currentState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CATStateMachine transitionWithTriggeringEvent:].cold.1((uint64_t)self, v23, (uint64_t)buf, v22);
      }

    }
    -[CATStateMachine currentState](self, "currentState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine delegateDidEnterState:event:](self, "delegateDidEnterState:event:", v24, v7);

  }
  v25 = self->mCalloutReason;
  self->mCalloutReason = 0;

}

- (id)eventForTriggeringEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)delegateWillExitState:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "exitAction"))
  {
    if (-[CATStateMachine logLevel](self, "logLevel") >= 2)
    {
      _CATLogFSM();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[CATStateMachine delegateWillExitState:event:].cold.1((uint64_t)self, v6);

    }
    -[CATStateMachine invokeAction:event:](self, "invokeAction:event:", objc_msgSend(v6, "exitAction"), v7);
  }

}

- (void)delegateDidEnterState:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "enterAction"))
  {
    if (-[CATStateMachine logLevel](self, "logLevel") >= 2)
    {
      _CATLogFSM();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[CATStateMachine delegateDidEnterState:event:].cold.1((uint64_t)self, v6);

    }
    -[CATStateMachine invokeAction:event:](self, "invokeAction:event:", objc_msgSend(v6, "enterAction"), v7);
  }

}

- (void)invokeAction:(SEL)a3 event:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  if (a3)
  {
    v7 = (void *)MEMORY[0x20BD108A4]();
    -[CATStateMachine target](self, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine target](self, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTarget:", v11);

    objc_msgSend(v10, "setSelector:", a3);
    if ((unint64_t)objc_msgSend(v9, "numberOfArguments") >= 3)
    {
      objc_msgSend(v6, "context");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setArgument:atIndex:", &v12, 2);

    }
    objc_msgSend(v10, "invoke");

    objc_autoreleasePoolPop(v7);
  }

}

- (NSString)name
{
  return self->_name;
}

- (CATState)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(id)a3
{
  objc_storeStrong((id *)&self->_initialState, a3);
}

- (CATState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (unint64_t)logLevel
{
  return self->_logLevel;
}

- (void)setLogLevel:(unint64_t)a3
{
  self->_logLevel = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->mCalloutReason, 0);
  objc_storeStrong((id *)&self->mStateByName, 0);
}

- (void)transitionWithTriggeringEvent:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_209592000, a4, a3, "%@ entering %@", (uint8_t *)a3);

}

- (void)transitionWithTriggeringEvent:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_3(&dword_209592000, a3, (uint64_t)a3, "%@ invoking action for %@", (uint8_t *)&v3);
}

- (void)delegateWillExitState:(uint64_t)a1 event:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector((SEL)objc_msgSend(a2, "exitAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_209592000, v5, v6, "%@ invoking exit action (%@) for %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)delegateDidEnterState:(uint64_t)a1 event:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector((SEL)objc_msgSend(a2, "enterAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_209592000, v5, v6, "%@ invoking enter action (%@) for %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
