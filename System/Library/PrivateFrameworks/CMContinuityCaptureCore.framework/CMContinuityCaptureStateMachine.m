@implementation CMContinuityCaptureStateMachine

- (CMContinuityCaptureStateMachine)initWithActionDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  CMContinuityCaptureStateMachine *v8;
  NSMutableArray *v9;
  NSMutableArray *transactions;
  NSMutableArray *v11;
  NSMutableArray *previousStates;
  NSMutableArray *v13;
  NSMutableArray *deferredEvents;
  NSMutableDictionary *v15;
  NSMutableDictionary *events;
  NSMutableArray *v17;
  NSMutableArray *eventQueue;
  id v19;
  CMContinuityCaptureStateMachine *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CMContinuityCaptureStateMachine;
  v8 = -[CMContinuityCaptureStateMachine init](&v22, sel_init);
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  transactions = v8->_transactions;
  v8->_transactions = v9;

  if (!v8->_transactions)
    goto LABEL_10;
  objc_storeStrong((id *)&v8->_queue, a4);
  if (!v8->_queue)
    goto LABEL_10;
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  previousStates = v8->_previousStates;
  v8->_previousStates = v11;

  if (!v8->_previousStates)
    goto LABEL_10;
  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  deferredEvents = v8->_deferredEvents;
  v8->_deferredEvents = v13;

  if (!v8->_deferredEvents)
    goto LABEL_10;
  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  events = v8->_events;
  v8->_events = v15;

  if (!v8->_events)
    goto LABEL_10;
  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  eventQueue = v8->_eventQueue;
  v8->_eventQueue = v17;

  if (v8->_eventQueue
    && (v19 = objc_storeWeak((id *)&v8->_actionDelegate, v6), v6, v6))
  {
    v20 = v8;
  }
  else
  {
LABEL_10:
    v20 = 0;
  }

  return v20;
}

- (id)eventForName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_events, "objectForKeyedSubscript:", a3);
}

- (void)addStateTransitions:(id)a3
{
  id v4;
  CMContinuityCaptureStateMachine *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableArray addObjectsFromArray:](v5->_transactions, "addObjectsFromArray:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)addEvents:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__CMContinuityCaptureStateMachine_addEvents___block_invoke;
  v3[3] = &unk_24F06B9C0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

void __45__CMContinuityCaptureStateMachine_addEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

- (BOOL)postSameStateAction:(id)a3 transition:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *deferredEvents;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSMutableArray *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "action");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v10);

  }
  CMContinuityCaptureLog(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
    objc_msgSend(v8, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureStateMachine currentState](self, "currentState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureStateMachine currentState](self, "currentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pendingEvents");
    v22 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    deferredEvents = self->_deferredEvents;
    *(_DWORD *)buf = 138544642;
    v24 = WeakRetained;
    v25 = 2114;
    v26 = v15;
    v27 = 2114;
    v28 = v17;
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = v19;
    v33 = 2114;
    v34 = deferredEvents;
    _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition to state %{public}@ from %{public}@ on event %{public}@ state pendingEvents %{public}@ deferredEvents %{public}@", buf, 0x3Eu);

    v8 = v22;
  }

  return 1;
}

- (id)getDeferredEventsToPostForState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *deferredEvents;

  v4 = a3;
  if (!-[NSMutableArray count](self->_deferredEvents, "count"))
  {
    v5 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_23;
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("kCMContinuityCaptureStateStreaming"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "addObjectsFromArray:", self->_deferredEvents);
    goto LABEL_22;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_deferredEvents, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEntry");

  v10 = v9;
  v11 = 1;
  if ((unint64_t)-[NSMutableArray count](self->_deferredEvents, "count") >= 2)
  {
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_deferredEvents, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_deferredEvents, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CMContinuityCaptureSMValidSameStateEventName(v13, v15);

      if (!v16)
        break;
      -[NSMutableArray objectAtIndexedSubscript:](self->_deferredEvents, "objectAtIndexedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEntry");

      if (v18)
        ++v10;
      else
        v10 = 0;
      ++v11;
    }
    while (v11 < -[NSMutableArray count](self->_deferredEvents, "count"));
  }
  v19 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_deferredEvents, "objectAtIndexedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEntry");

    if (!v10)
      break;
    if ((v21 & 1) != 0)
      goto LABEL_18;
LABEL_14:
    if (v11 == ++v19)
      goto LABEL_20;
  }
  if (v21)
    goto LABEL_14;
LABEL_18:
  -[NSMutableArray objectAtIndexedSubscript:](self->_deferredEvents, "objectAtIndexedSubscript:", v19);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v5, "addObject:", v22);

  }
LABEL_20:
  while (v11 < -[NSMutableArray count](self->_deferredEvents, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_deferredEvents, "objectAtIndexedSubscript:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

    ++v11;
  }
LABEL_22:
  v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  deferredEvents = self->_deferredEvents;
  self->_deferredEvents = v25;

LABEL_23:
  return v5;
}

- (id)getNewStateAfterPostingDeferredEvents:(id)a3 deferredEventsToPost:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char valid;
  NSObject *v18;
  CMContinuityCaptureStateMachine *WeakRetained;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  id v24;
  int v26;
  CMContinuityCaptureStateMachine *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[CMContinuityCaptureStateMachine getDeferredEventsToPostForState:](self, "getDeferredEventsToPostForState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Deferred to post %{public}@", (uint8_t *)&v26, 0x16u);
  }

  if (!v9 || !objc_msgSend(v9, "count"))
    goto LABEL_20;
  if (v6)
  {
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("kCMContinuityCaptureStateTerminated"));

    if (!v12)
    {
      objc_msgSend(v6, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("kCMContinuityCaptureStateStreaming"));

      if ((v14 & 1) != 0)
        goto LABEL_8;
      *a4 = objc_retainAutorelease(v9);
    }
LABEL_20:
    v24 = v6;
    goto LABEL_21;
  }
LABEL_8:
  objc_msgSend(v9, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEntry") & 1) != 0
    || (objc_msgSend(v15, "name"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        valid = CMContinuityCaptureSMIsValidExitEventForState(v16, CFSTR("kCMContinuityCaptureStateStreaming")),
        v16,
        (valid & 1) == 0))
  {
    *a4 = objc_retainAutorelease(v9);
  }
  else if (-[NSMutableArray count](self->_previousStates, "count"))
  {
    CMContinuityCaptureLog(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = (CMContinuityCaptureStateMachine *)objc_loadWeakRetained((id *)&self->_actionDelegate);
      -[NSMutableArray lastObject](self->_previousStates, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138544130;
      v27 = WeakRetained;
      v28 = 2114;
      v29 = v9;
      v30 = 2114;
      v31 = v6;
      v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Deferred exit event %{public}@ for state %{public}@ , move to previous state %{public}@", (uint8_t *)&v26, 0x2Au);

    }
    objc_msgSend(v6, "exitAction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v6, "exitAction");
      v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v22)[2](v22, v23);

    }
    -[NSMutableArray lastObject](self->_previousStates, "lastObject");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_previousStates, "removeLastObject");
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    *a4 = objc_retainAutorelease(v9);
    goto LABEL_18;
  }
  v24 = v6;
LABEL_18:

LABEL_21:
  return v24;
}

- (BOOL)postStateChangeAction:(id)a3 transition:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *deferredEvents;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD);
  int v28;
  NSMutableArray *previousStates;
  void *v30;
  BOOL v31;
  id v32;
  NSObject *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD);
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  NSMutableArray *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "isEntry") & 1) != 0)
    goto LABEL_4;
  if (!-[NSMutableArray count](self->_previousStates, "count"))
    goto LABEL_10;
  -[NSMutableArray lastObject](self->_previousStates, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {
LABEL_4:
    CMContinuityCaptureLog(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
      objc_msgSend(v8, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureStateMachine currentState](self, "currentState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v49 = v8;
      v19 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureStateMachine currentState](self, "currentState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pendingEvents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      deferredEvents = self->_deferredEvents;
      *(_DWORD *)buf = 138544642;
      v54 = WeakRetained;
      v55 = 2114;
      v56 = v17;
      v57 = 2114;
      v58 = v20;
      v59 = 2114;
      v60 = v10;
      v61 = 2114;
      v62 = v22;
      v63 = 2114;
      v64 = deferredEvents;
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition to state %{public}@ from %{public}@ on event %{public}@ state pendingEvents %{public}@ deferredEvents %{public}@", buf, 0x3Eu);

      v9 = v19;
      v8 = v49;

    }
    -[CMContinuityCaptureStateMachine currentState](self, "currentState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "exitAction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[CMContinuityCaptureStateMachine currentState](self, "currentState");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "exitAction");
      v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v27)[2](v27, v10);

    }
    v28 = objc_msgSend(v10, "isEntry");
    previousStates = self->_previousStates;
    if (v28)
    {
      -[CMContinuityCaptureStateMachine currentState](self, "currentState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](previousStates, "addObject:", v30);

    }
    else if (-[NSMutableArray count](self->_previousStates, "count"))
    {
      -[NSMutableArray removeLastObject](self->_previousStates, "removeLastObject");
    }
    else
    {
      CMContinuityCaptureLog(2);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        v47 = objc_loadWeakRetained((id *)&self->_actionDelegate);
        -[CMContinuityCaptureStateMachine currentState](self, "currentState");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v54 = v47;
        v55 = 2112;
        v56 = v10;
        v57 = 2112;
        v58 = v48;
        v59 = 2112;
        v60 = v8;
        _os_log_fault_impl(&dword_227C5D000, v33, OS_LOG_TYPE_FAULT, "%@ Unexpected SM event %@ current %@ dst %@", buf, 0x2Au);

      }
    }
    objc_msgSend(v9, "action");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v9, "action");
      v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v35)[2](v35, v10);

    }
    -[CMContinuityCaptureStateMachine willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentState"));
    v52 = 0;
    -[CMContinuityCaptureStateMachine getNewStateAfterPostingDeferredEvents:deferredEventsToPost:](self, "getNewStateAfterPostingDeferredEvents:deferredEventsToPost:", v8, &v52);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v52;
    -[CMContinuityCaptureStateMachine setCurrentState:](self, "setCurrentState:", v36);

    -[CMContinuityCaptureStateMachine didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentState"));
    -[CMContinuityCaptureStateMachine currentState](self, "currentState");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "entryAction");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[CMContinuityCaptureStateMachine currentState](self, "currentState");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "entryAction");
      v40 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v40)[2](v40, v10);

    }
    if (v32 && objc_msgSend(v32, "count"))
    {
      CMContinuityCaptureLog(2);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = objc_loadWeakRetained((id *)&self->_actionDelegate);
        -[CMContinuityCaptureStateMachine currentState](self, "currentState");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v42;
        v55 = 2114;
        v56 = v32;
        v57 = 2114;
        v58 = v43;
        _os_log_impl(&dword_227C5D000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ Post Deferred event %{public}@ on current state %{public}@", buf, 0x20u);

      }
      v44 = objc_loadWeakRetained((id *)&self->_actionDelegate);
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __74__CMContinuityCaptureStateMachine_postStateChangeAction_transition_event___block_invoke;
      v50[3] = &unk_24F06B9C0;
      v51 = v44;
      v45 = v44;
      objc_msgSend(v32, "enumerateObjectsUsingBlock:", v50);

    }
    v31 = 1;
  }
  else
  {
LABEL_10:
    v31 = 0;
    v32 = 0;
  }

  return v31;
}

void __74__CMContinuityCaptureStateMachine_postStateChangeAction_transition_event___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "postDeferredEvent:data:", v5, v4);
}

- (void)_enqueueEventWithNameToPost:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  CMContinuityCaptureState *currentState;
  uint64_t v14;
  NSMutableArray *eventQueue;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  CMContinuityCaptureStateMachine *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  CMContinuityCaptureState *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((CMContinuityCaptureValidSMEvent(v6) & 1) != 0)
  {
    if (v7)
      v8 = v7;
    else
      v8 = (id)MEMORY[0x24BDBD1B8];
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    CMContinuityCaptureLog(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      currentState = self->_currentState;
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2114;
      v28 = v6;
      v29 = 2114;
      v30 = currentState;
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueEvent %{public}@ on current state %{public}@", buf, 0x20u);
    }

    v14 = -[NSMutableArray count](self->_eventQueue, "count");
    eventQueue = self->_eventQueue;
    if (v14)
    {
      v22[0] = v6;
      v19 = CFSTR("kCMContinuityCaptureEventName");
      v20 = CFSTR("kCMContinuityCaptureEventEnqueueTime");
      CMContinuityCaptureGetCurrentTimeString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("kCMContinuityCaptureEventData");
      v22[1] = v11;
      v22[2] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v19, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](eventQueue, "addObject:", v16, v19, v20);

    }
    else
    {
      v24[0] = v6;
      v23[0] = CFSTR("kCMContinuityCaptureEventName");
      v23[1] = CFSTR("kCMContinuityCaptureEventEnqueueTime");
      CMContinuityCaptureGetCurrentTimeString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = CFSTR("kCMContinuityCaptureEventData");
      v24[1] = v17;
      v24[2] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](eventQueue, "addObject:", v18);

      if (-[CMContinuityCaptureStateMachine postEventWithName:data:](self, "postEventWithName:data:", v6, v8))
      {
LABEL_17:

        goto LABEL_18;
      }
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
      -[CMContinuityCaptureStateMachine _notifyCompletion:](self, "_notifyCompletion:", v11);
    }
LABEL_16:

    goto LABEL_17;
  }
  CMContinuityCaptureLog(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CMContinuityCaptureStateMachine _enqueueEventWithNameToPost:data:].cold.1((uint64_t)self, (uint64_t)v6, v9);

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
      (*((void (**)(id, void *))v8 + 2))(v8, v11);
      goto LABEL_16;
    }
  }
LABEL_18:

}

- (void)enqueueEventWithNameToPost:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__CMContinuityCaptureStateMachine_enqueueEventWithNameToPost_data___block_invoke;
  v11[3] = &unk_24F06AF00;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __67__CMContinuityCaptureStateMachine_enqueueEventWithNameToPost_data___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_enqueueEventWithNameToPost:data:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)aggregateEvents
{
  id v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *eventQueue;
  id WeakRetained;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  objc_msgSend(WeakRetained, "aggregateEvents:", self->_eventQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableArray *)objc_msgSend(v3, "initWithArray:", v4);
  eventQueue = self->_eventQueue;
  self->_eventQueue = v5;

}

- (void)notifyCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CMContinuityCaptureStateMachine_notifyCompletion___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__CMContinuityCaptureStateMachine_notifyCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_notifyCompletion:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_notifyCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  NSMutableArray **p_eventQueue;
  NSObject *v7;
  id v8;
  CMContinuityCaptureState *currentState;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  id v28;
  CMContinuityCaptureState *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  id v37;
  CMContinuityCaptureStateMachine *v38;
  id v39;
  NSMutableArray **v40;
  id *location;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  CMContinuityCaptureState *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  location = (id *)&self->_actionDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  p_eventQueue = &self->_eventQueue;
  if (-[NSMutableArray count](self->_eventQueue, "count"))
  {
    CMContinuityCaptureLog(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v40 = &self->_eventQueue;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained(location);
      currentState = self->_currentState;
      -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventEnqueueTime"));
      v13 = WeakRetained;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v48 = v8;
      v49 = 2114;
      v50 = currentState;
      v51 = 2114;
      v52 = v11;
      v53 = 2114;
      v54 = v14;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ currentState: %{public}@ completedEvent Name:%{public}@ EnqueueTime:%{public}@", buf, 0x2Au);

      WeakRetained = v13;
      p_eventQueue = &self->_eventQueue;
    }

    if (WeakRetained)
    {
      v15 = objc_loadWeakRetained(location);
      -[NSMutableArray firstObject](*p_eventQueue, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray firstObject](*p_eventQueue, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventData"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postActionCompletionForEventName:eventData:error:", v17, v19, v4);

      p_eventQueue = &self->_eventQueue;
    }
    -[NSMutableArray removeObjectAtIndex:](*p_eventQueue, "removeObjectAtIndex:", 0);
    if (CMContinityCaptureDebugLogEnabled())
    {
      CMContinuityCaptureLog(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[CMContinuityCaptureStateMachine _notifyCompletion:].cold.1(location, (uint64_t *)p_eventQueue, v20);

    }
    if (-[NSMutableArray count](*p_eventQueue, "count"))
    {
      v37 = WeakRetained;
      v38 = self;
      v39 = v4;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v21 = *p_eventQueue;
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v43 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            CMContinuityCaptureLog(0);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = objc_loadWeakRetained(location);
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
              v29 = (CMContinuityCaptureState *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventEnqueueTime"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v48 = v28;
              v49 = 2114;
              v50 = v29;
              v51 = 2114;
              v52 = v30;
              _os_log_impl(&dword_227C5D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ pendingEvent Name:%{public}@ EnqueueTime:%{public}@", buf, 0x20u);

            }
          }
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v23);
      }

      self = v38;
      -[CMContinuityCaptureStateMachine aggregateEvents](v38, "aggregateEvents");
      v4 = v39;
      p_eventQueue = v40;
    }
    if (-[NSMutableArray count](*p_eventQueue, "count", v37))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_eventQueue, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_eventQueue, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventData"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[CMContinuityCaptureStateMachine postEventWithName:data:](self, "postEventWithName:data:", v32, v34);

      if (!v35)
      {
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
        -[CMContinuityCaptureStateMachine _notifyCompletion:](self, "_notifyCompletion:", v36);

      }
    }
  }

}

- (BOOL)postEventWithName:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  CMContinuityCaptureStateMachine *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  id v20;
  BOOL v21;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v8->_transactions);
  objc_sync_exit(v8);

  if (v9
    && (-[CMContinuityCaptureStateMachine currentState](v8, "currentState"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = v10 == 0,
        v10,
        !v11)
    && (-[NSMutableDictionary objectForKeyedSubscript:](v8->_events, "objectForKeyedSubscript:", v6),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        (v13 = v12) != 0))
  {
    objc_msgSend(v12, "setData:", v7);
    CMContinuityCaptureLog(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v8->_actionDelegate);
      -[CMContinuityCaptureStateMachine currentState](v8, "currentState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = WeakRetained;
      v32 = 2114;
      v33 = v13;
      v34 = 2114;
      v35 = v17;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Post event %{public}@ on currentState %{public}@", buf, 0x20u);

    }
    objc_msgSend(v13, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v13, "action");
      v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v19[2]();

    }
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__CMContinuityCaptureStateMachine_postEventWithName_data___block_invoke;
    v23[3] = &unk_24F06B9E8;
    v23[4] = v8;
    v20 = v13;
    v24 = v20;
    v25 = &v26;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);
    v21 = *((_BYTE *)v27 + 24) != 0;

  }
  else
  {
    v21 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v21;
}

void __58__CMContinuityCaptureStateMachine_postEventWithName_data___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transactionFromStateOnEvent:event:", v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    if (v11)
      v14 = objc_msgSend(v12, "postSameStateAction:transition:event:", v7, v15, v13);
    else
      v14 = objc_msgSend(v12, "postStateChangeAction:transition:event:", v7, v15, v13);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v14;
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

- (id)description
{
  void *v3;
  id WeakRetained;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p> %@"), self, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CMContinuityCaptureState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)deferredEvents
{
  return self->_deferredEvents;
}

- (void)setDeferredEvents:(id)a3
{
  objc_storeStrong((id *)&self->_deferredEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_previousStates, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

- (void)_enqueueEventWithNameToPost:(os_log_t)log data:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "%@ Invalid SM EventName %@", (uint8_t *)&v3, 0x16u);
}

- (void)_notifyCompletion:(NSObject *)a3 .cold.1(id *a1, uint64_t *a2, NSObject *a3)
{
  id WeakRetained;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  v6 = *a2;
  v7 = 138543618;
  v8 = WeakRetained;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_227C5D000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ pendingActions %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
