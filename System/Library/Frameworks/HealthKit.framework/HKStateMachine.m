@implementation HKStateMachine

+ (id)nameForOwner:(id)a3 UUID:(id)a4 tag:(id)a5
{
  id v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v6 = a5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a4;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_shortRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_%@_%@"), v10, v6, v11);
  else
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_%@"), v10, v11, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HKStateMachine)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKStateMachine)initWithName:(id)a3
{
  id v4;
  HKStateMachine *v5;
  uint64_t v6;
  NSString *name;
  NSMutableDictionary *v8;
  NSMutableDictionary *statesByIndex;
  NSMutableArray *v10;
  NSMutableArray *transitions;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKStateMachine;
  v5 = -[HKStateMachine init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    statesByIndex = v5->_statesByIndex;
    v5->_statesByIndex = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transitions = v5->_transitions;
    v5->_transitions = v10;

  }
  return v5;
}

- (id)addStateWithIndex:(int64_t)a3 label:(id)a4
{
  id v7;
  NSMutableDictionary *statesByIndex;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  HKStateMachineState *v15;
  NSMutableDictionary *v16;
  void *v18;

  v7 = a4;
  if (self->_currentState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateMachine.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_currentState == nil"));

  }
  statesByIndex = self->_statesByIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](statesByIndex, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_statesByIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateMachine.m"), 154, CFSTR("%@: Attempt to add a state (%@) with the same index as an existing state (%@)."), self, v7, v14);

    v15 = 0;
  }
  else
  {
    v15 = -[HKStateMachineState initWithIndex:label:]([HKStateMachineState alloc], "initWithIndex:label:", a3, v7);
    v16 = self->_statesByIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v11);
  }

  return v15;
}

- (id)addStateTransitionFrom:(id)a3 to:(id)a4 event:(int64_t)a5 label:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *statesByIndex;
  void *v14;
  id v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  HKStateMachineTransition *v32;
  void *v34;
  void *v35;
  void *v36;
  SEL v37;
  HKStateMachine *v38;
  id v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (self->_currentState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateMachine.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_currentState == nil"));

  }
  statesByIndex = self->_statesByIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "index"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](statesByIndex, "objectForKeyedSubscript:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateMachine.m"), 167, CFSTR("Invalid state %@ does not appear to be part of this state machine."), v10);

  }
  v39 = v12;
  v16 = self->_statesByIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "index"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 != v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateMachine.m"), 168, CFSTR("Invalid state %@ does not appear to be part of this state machine."), v11);

  }
  v37 = a2;
  v38 = self;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v19 = self->_transitions;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v20)
    goto LABEL_20;
  v21 = v20;
  v22 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v42 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend(v24, "fromState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "index");
      if (v26 != objc_msgSend(v10, "index"))
        goto LABEL_17;
      objc_msgSend(v24, "toState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "index");
      if (v28 != objc_msgSend(v11, "index"))
      {

LABEL_17:
        continue;
      }
      v29 = objc_msgSend(v24, "event");

      if (v29 == a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v39;
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v37, v38, v39, v10, v11, v24);

        v32 = 0;
        goto LABEL_21;
      }
    }
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v21);
LABEL_20:

  v31 = v39;
  v32 = -[HKStateMachineTransition initWithEvent:label:from:to:]([HKStateMachineTransition alloc], "initWithEvent:label:from:to:", a5, v39, v10, v11);
  -[NSMutableArray addObject:](v38->_transitions, "addObject:", v32);
LABEL_21:

  return v32;
}

- (id)stateWithIndex:(int64_t)a3
{
  NSMutableDictionary *statesByIndex;
  void *v4;
  void *v5;

  statesByIndex = self->_statesByIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](statesByIndex, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enterAtState:(int64_t)a3
{
  NSMutableDictionary *statesByIndex;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  id v29;
  char v30;
  id v31;
  id v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  HKStateMachineState **p_currentState;
  void *v38;
  NSMutableDictionary *obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  HKStateMachine *v43;
  id to;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  p_currentState = &self->_currentState;
  if (self->_currentState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateMachine.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_currentState == nil"));

  }
  v43 = self;
  statesByIndex = self->_statesByIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](statesByIndex, "objectForKeyedSubscript:", v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateMachine.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialState != nil"));

  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = self->_statesByIndex;
  v41 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v50;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v50 != v40)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v42 = v8;
        -[NSMutableDictionary objectForKeyedSubscript:](v43->_statesByIndex, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v13 = v43->_transitions;
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v46 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v17, "fromState");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18 == v10;

              if (v19)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "event"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v20);

              }
              objc_msgSend(v17, "toState");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21 == v10;

              if (v22)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "event"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v23);

              }
            }
            v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          }
          while (v14);
        }

        v24 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(v10, "setIncomingTransitions:", v24);

        v25 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v10, "setOutgoingTransitions:", v25);

        v8 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v41);
  }

  objc_copyWeak(&to, (id *)&v43->_delegate);
  v26 = objc_loadWeakRetained(&to);
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    v28 = objc_loadWeakRetained(&to);
    objc_msgSend(v28, "stateMachine:willEnterState:date:error:", v43, v38, 0, 0);

  }
  objc_storeStrong((id *)p_currentState, v38);
  v29 = objc_loadWeakRetained(&to);
  v30 = objc_opt_respondsToSelector();

  if ((v30 & 1) != 0)
  {
    v31 = objc_loadWeakRetained(&to);
    objc_msgSend(v31, "stateMachine:didEnterState:date:error:", v43, v38, 0, 0);

  }
  v32 = objc_loadWeakRetained(&to);
  v33 = objc_opt_respondsToSelector();

  if ((v33 & 1) != 0)
  {
    v34 = objc_loadWeakRetained(&to);
    objc_msgSend(v34, "stateMachine:didTransition:fromState:toState:date:error:", v43, 0, 0, v38, 0, 0);

  }
  objc_destroyWeak(&to);

}

- (void)enqueueEvent:(int64_t)a3 date:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableArray *pendingEvents;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  HKStateMachinePendingEvent *v18;

  if (self->_isProcessingEvent)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v18 = objc_alloc_init(HKStateMachinePendingEvent);
    -[HKStateMachinePendingEvent setEvent:](v18, "setEvent:", a3);
    -[HKStateMachinePendingEvent setDate:](v18, "setDate:", v12);

    -[HKStateMachinePendingEvent setError:](v18, "setError:", v11);
    -[HKStateMachinePendingEvent setCompletion:](v18, "setCompletion:", v10);

    pendingEvents = self->_pendingEvents;
    if (!pendingEvents)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = self->_pendingEvents;
      self->_pendingEvents = v14;

      pendingEvents = self->_pendingEvents;
    }
    -[NSMutableArray addObject:](pendingEvents, "addObject:", v18);
  }
  else
  {
    v16 = a6;
    v17 = a5;
    v18 = (HKStateMachinePendingEvent *)a4;
    -[HKStateMachine _handleEvent:date:error:completion:](self, "_handleEvent:date:error:completion:", a3, v18, v17, v16);

  }
}

- (void)_handleEvent:(int64_t)a3 date:(id)a4 error:(id)a5 completion:(id)a6
{
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  HKStateMachineState **p_currentState;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKStateMachineState *v18;
  id v19;
  char v20;
  id v21;
  id v22;
  char v23;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  char v29;
  id v30;
  id v31;
  char v32;
  id v33;
  id v34;
  char v35;
  id v36;
  id v37;
  char v38;
  id v39;
  void *v40;
  uint64_t v41;
  HKStateMachineState *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id to;

  v46 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  p_currentState = &self->_currentState;
  if (!self->_currentState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateMachine.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_currentState != nil"));

  }
  objc_copyWeak(&to, (id *)&self->_delegate);
  -[HKStateMachineState outgoingTransitions](self->_currentState, "outgoingTransitions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    self->_isProcessingEvent = 1;
    objc_msgSend(v16, "toState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *p_currentState;
    v19 = objc_loadWeakRetained(&to);
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      v21 = objc_loadWeakRetained(&to);
      objc_msgSend(v21, "stateMachine:willLeaveState:date:error:", self, v18, v46, v11);

    }
    v22 = objc_loadWeakRetained(&to);
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      v24 = objc_loadWeakRetained(&to);
      objc_msgSend(v24, "stateMachine:willEnterState:date:error:", self, v17, v46, v11);

    }
    v25 = objc_loadWeakRetained(&to);
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      v27 = objc_loadWeakRetained(&to);
      objc_msgSend(v27, "stateMachine:persistTransition:", self, v16);

    }
    objc_storeStrong((id *)&self->_currentState, v17);
    v28 = objc_loadWeakRetained(&to);
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
    {
      v30 = objc_loadWeakRetained(&to);
      objc_msgSend(v30, "stateMachine:didEnterState:date:error:", self, v17, v46, v11);

    }
    v31 = objc_loadWeakRetained(&to);
    v32 = objc_opt_respondsToSelector();

    if ((v32 & 1) != 0)
    {
      v33 = objc_loadWeakRetained(&to);
      objc_msgSend(v33, "stateMachine:didLeaveState:date:error:", self, v18, v46, v11);

    }
    v34 = objc_loadWeakRetained(&to);
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      v36 = objc_loadWeakRetained(&to);
      objc_msgSend(v36, "stateMachine:didTransition:fromState:toState:date:error:", self, v16, v18, v17, v46, v11);

    }
    v12[2](v12, 1, 0);
    self->_isProcessingEvent = 0;
    -[HKStateMachine _dequeueEvent](self, "_dequeueEvent");

  }
  else
  {
    v37 = objc_loadWeakRetained(&to);
    v38 = objc_opt_respondsToSelector();

    if ((v38 & 1) != 0)
    {
      v39 = objc_loadWeakRetained(&to);
      objc_msgSend(v39, "stateMachine:didIgnoreEvent:state:", self, a3, self->_currentState);

    }
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = objc_opt_class();
    v42 = *p_currentState;
    -[HKStateMachineState outgoingTransitions](*p_currentState, "outgoingTransitions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v41, a2, CFSTR("Unable to transition to the desired state from the %@ state (event %ld). Allowed transitions from the current state are: %@"), v42, a3, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v44);

    -[HKStateMachine _dequeueEvent](self, "_dequeueEvent");
  }

  objc_destroyWeak(&to);
}

- (void)_dequeueEvent
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NSMutableArray firstObject](self->_pendingEvents, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_pendingEvents, "removeObjectAtIndex:", 0);
    v3 = objc_msgSend(v7, "event");
    objc_msgSend(v7, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStateMachine _handleEvent:date:error:completion:](self, "_handleEvent:date:error:completion:", v3, v4, v5, v6);

  }
}

- (id)graphDescription
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NSMutableDictionary allValues](self->_statesByIndex, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString stringByReplacingOccurrencesOfString:withString:](self->_name, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("state_machine");
  -[HKStateMachineState label](self->_currentState, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v3;
  objc_msgSend(v3, "appendFormat:", CFSTR("digraph %@ {\n   rankdir=LR;\n   node [shape=doublecircle width=1]; \"%@\"\n   node [shape=circle width=1];\n"),
    v8,
    v9);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v29 = v10;
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
        objc_msgSend(v11, "outgoingTransitions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_142);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v32 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(v11, "label");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "toState");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "label");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "label");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "appendFormat:", CFSTR("   \"%@\" -> \"%@\" [ label = \"%@ (%ld)\" ];\n"),
                v21,
                v23,
                v24,
                objc_msgSend(v20, "event"));

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v17);
        }

        v10 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v28);
  }

  objc_msgSend(v30, "appendString:", CFSTR("}"));
  return v30;
}

uint64_t __34__HKStateMachine_graphDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __34__HKStateMachine_graphDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (HKStateMachineDelegate)delegate
{
  return (HKStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKStateMachineState)currentState
{
  return self->_currentState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_statesByIndex, 0);
}

@end
