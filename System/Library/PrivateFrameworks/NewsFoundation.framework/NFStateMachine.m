@implementation NFStateMachine

- (void)addState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NFStateMachine states](self, "states");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NFStateMachine addState:].cold.1();
  -[NFStateMachine states](self, "states");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v4, v9);

}

- (NSMutableDictionary)states
{
  return self->_states;
}

- (void)addEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NFStateMachine events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NFStateMachine addEvent:].cold.1();
  -[NFStateMachine events](self, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v4, v9);

}

- (NSMutableDictionary)events
{
  return self->_events;
}

- (NFStateMachine)initWithState:(id)a3 withOwner:(id)a4
{
  id v7;
  id v8;
  NFStateMachine *v9;
  NFStateMachine *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *states;
  uint64_t v15;
  NSMutableDictionary *events;
  NFMutexLock *v17;
  NFMutexLock *lock;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NFStateMachine;
  v9 = -[NFStateMachine init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(&v9->_owner, v8);
    objc_storeStrong((id *)&v10->_state, a3);
    v10->_status = 0;
    v10->_statusToken = 0;
    v11 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v7, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObject:forKey:", v7, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    states = v10->_states;
    v10->_states = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    events = v10->_events;
    v10->_events = (NSMutableDictionary *)v15;

    v17 = -[NFMutexLock initWithOptions:]([NFMutexLock alloc], "initWithOptions:", 1);
    lock = v10->_lock;
    v10->_lock = v17;

  }
  return v10;
}

uint64_t __48__NFStateMachine_fireEventWithName_withContext___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEnter:withOwner:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)fireEventWithName:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NFStateMachineTransition *v18;
  void *v19;
  NFStateMachineTransition *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v34;
  NFStateMachineTransition *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NFStateMachineTransition *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  NFStateMachineTransition *v46;
  id v47;
  _QWORD v48[5];
  _QWORD v49[4];
  id v50;
  NFStateMachineTransition *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  NFStateMachineTransition *v55;
  id v56;
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[3];
  _QWORD v62[5];

  v62[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NFStateMachine owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    if (-[NFStateMachine status](self, "status") != 1)
    {
      v26 = *MEMORY[0x24BDD0FC8];
      v62[0] = CFSTR("cannot fire event when state machine is not active");
      v61[0] = v26;
      v61[1] = CFSTR("status");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NFStateMachine status](self, "status"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v62[1] = v27;
      v61[2] = CFSTR("statusToken");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NFStateMachine statusToken](self, "statusToken"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v62[2] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "fc_createStateMachineErrorForCode:userInfo:", -100, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NFPromise asVoid:](NFPromise, "asVoid:", v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_16;
    }
    -[NFStateMachine events](self, "events");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "states");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NFStateMachine state](self, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "containsObject:", v14);

      if ((v15 & 1) != 0)
      {
        -[NFStateMachine state](self, "state");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "destinationState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[NFStateMachineTransition initWithStateMachine:event:fromState:toState:context:]([NFStateMachineTransition alloc], "initWithStateMachine:event:fromState:toState:context:", self, v12, v16, v17, v7);
        if ((objc_msgSend(v17, "canTry:withOwner:", v18, v10) & 1) != 0)
        {
          -[NFStateMachine lock](self, "lock");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lock");

          objc_msgSend(v16, "willExit:withOwner:", v18, v10);
          objc_msgSend(v17, "willEnter:withOwner:", v18, v10);
          -[NFStateMachine setState:](self, "setState:", v17);
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_3;
          v53[3] = &unk_24CE71FB8;
          v54 = v16;
          v42 = v18;
          v20 = v18;
          v55 = v20;
          v21 = v10;
          v56 = v21;
          +[NFPromise firstly:](NFPromise, "firstly:", v53);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          zalgoIfMain();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v10;
          v49[0] = MEMORY[0x24BDAC760];
          v49[1] = 3221225472;
          v49[2] = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_4;
          v49[3] = &unk_24CE71FE0;
          v50 = v17;
          v35 = v20;
          v51 = v35;
          v34 = v21;
          v52 = v34;
          objc_msgSend(v43, "thenOn:then:", v40, v49);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          zalgoIfMain();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorOn:error:", v38, &__block_literal_global_37);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          zalgoIfMain();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = MEMORY[0x24BDAC760];
          v48[0] = MEMORY[0x24BDAC760];
          v48[1] = 3221225472;
          v48[2] = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_40;
          v48[3] = &unk_24CE72048;
          v48[4] = self;
          objc_msgSend(v37, "alwaysOn:always:", v36, v48);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          zalgoIfMain();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v22;
          v44[1] = 3221225472;
          v44[2] = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_2_42;
          v44[3] = &unk_24CE71FE0;
          v45 = v12;
          v46 = v35;
          v47 = v34;
          objc_msgSend(v23, "thenOn:then:", v24, v44);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v42;
          v10 = v41;

        }
        else
        {
          __48__NFStateMachine_fireEventWithName_withContext___block_invoke_2();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_14;
      }
      v31 = *MEMORY[0x24BDD0FC8];
      v58[0] = CFSTR("event does not allow transition from current state");
      v57[0] = v31;
      v57[1] = CFSTR("currentState");
      -[NFStateMachine state](self, "state");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v57[2] = CFSTR("event");
      v58[1] = v32;
      v58[2] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x24BDD1540];
      v30 = -102;
    }
    else
    {
      v59[0] = *MEMORY[0x24BDD0FC8];
      v59[1] = v6;
      v60[0] = CFSTR("event for name not found in state machine");
      v60[1] = CFSTR("eventName");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x24BDD1540];
      v30 = -101;
    }
    objc_msgSend(v29, "fc_createStateMachineErrorForCode:userInfo:", v30, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFPromise asVoid:](NFPromise, "asVoid:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  __48__NFStateMachine_fireEventWithName_withContext___block_invoke();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v25;
}

- (NFStateMachineState)state
{
  return self->_state;
}

- (NFMutexLock)lock
{
  return self->_lock;
}

uint64_t __48__NFStateMachine_fireEventWithName_withContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didExit:withOwner:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (id)owner
{
  return objc_loadWeakRetained(&self->_owner);
}

- (void)activate
{
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NFStateMachine setStatusToken:](self, "setStatusToken:", -[NFStateMachine statusToken](self, "statusToken") + 1);
  if ((-[NFStateMachine statusToken](self, "statusToken") & 0x8000000000000000) == 0)
    -[NFStateMachine setStatus:](self, "setStatus:", 1);
}

- (int64_t)statusToken
{
  return self->_statusToken;
}

- (void)setStatusToken:(int64_t)a3
{
  self->_statusToken = a3;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NFStateMachine state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%p state=%@, status=%ld, statusToken=%ld}"), self, v4, -[NFStateMachine status](self, "status"), -[NFStateMachine statusToken](self, "statusToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NFStateMachine state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NFStateMachine status](self, "status");
  v6 = -[NFStateMachine statusToken](self, "statusToken");
  -[NFStateMachine states](self, "states");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFStateMachine events](self, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%p state=%@, status=%ld, statusToken=%ld, states=%@, events=%@}"), self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)activateIfNeeded
{
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (-[NFStateMachine status](self, "status") != 1)
    -[NFStateMachine activate](self, "activate");
}

- (void)deactivate
{
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NFStateMachine setStatusToken:](self, "setStatusToken:", -[NFStateMachine statusToken](self, "statusToken") - 1);
  if (-[NFStateMachine statusToken](self, "statusToken") <= 0)
    -[NFStateMachine setStatus:](self, "setStatus:", 2);
}

- (void)deactivateIfNeeded
{
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  if (-[NFStateMachine status](self, "status") != 2)
    -[NFStateMachine deactivate](self, "deactivate");
}

id __48__NFStateMachine_fireEventWithName_withContext___block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1540], "fc_createStateMachineErrorForCode:userInfo:", -104, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFPromise asVoid:](NFPromise, "asVoid:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id __48__NFStateMachine_fireEventWithName_withContext___block_invoke_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1540], "fc_createStateMachineErrorForCode:userInfo:", -103, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFPromise asVoid:](NFPromise, "asVoid:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void __48__NFStateMachine_fireEventWithName_withContext___block_invoke_5()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __48__NFStateMachine_fireEventWithName_withContext___block_invoke_5_cold_1();
}

void __48__NFStateMachine_fireEventWithName_withContext___block_invoke_40(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unlock");

}

uint64_t __48__NFStateMachine_fireEventWithName_withContext___block_invoke_2_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fired:withOwner:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setOwner:(id)a3
{
  objc_storeWeak(&self->_owner, a3);
}

- (void)setStates:(id)a3
{
  objc_storeStrong((id *)&self->_states, a3);
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_destroyWeak(&self->_owner);
  objc_storeStrong((id *)&self->_state, 0);
}

- (void)addState:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Attempting to register a state that already exists"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)addEvent:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Attempting to register an event that already exists"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

void __48__NFStateMachine_fireEventWithName_withContext___block_invoke_5_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("state machine did enter/exit is not allowed to throw errors as the state has already been alerted"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

@end
