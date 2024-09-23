@implementation FIUIStateMachine

- (FIUIStateMachine)initWithLabel:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  FIUIStateMachine *v9;
  FIUIStateMachine *v10;
  uint64_t v11;
  NSMutableSet *states;
  uint64_t v13;
  NSMutableArray *pendingEvents;
  NSMutableSet *v15;
  NSMutableSet *parentStates;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FIUIStateMachine;
  v9 = -[FIUIStateMachine init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_label, a3);
    v11 = objc_opt_new();
    states = v10->_states;
    v10->_states = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    pendingEvents = v10->_pendingEvents;
    v10->_pendingEvents = (NSMutableArray *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    parentStates = v10->_parentStates;
    v10->_parentStates = v15;

  }
  return v10;
}

- (void)setDiagnosticHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)addState:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableSet addObject:](self->_states, "addObject:", v5);
  -[FIUIStateMachine _queue_setInitialStateIfNeeded:](self, "_queue_setInitialStateIfNeeded:", v5);

}

- (void)_queue_setInitialStateIfNeeded:(id)a3
{
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_state)
  {
    objc_storeStrong((id *)&self->_state, a3);
    objc_storeStrong((id *)&self->_initialState, a3);
  }

}

- (id)graphDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  FIUIStateMachine *v58;
  id v59;
  NSMutableSet *obj;
  id obja;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[NSMutableSet allObjects](self->_states, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIStateMachine label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("state_machine");
  -[FIUIState label](self->_initialState, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("digraph %@ {\n   rankdir=LR;\n compound=true; \n   node [shape=doublecircle width=1]; \"%@\";\n   node [shape=circle width=1];\n"),
    v8,
    v9);

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v58 = self;
  obj = self->_parentStates;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v75 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend(v14, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("subgraph cluster%@ {\n"), v15);

        objc_msgSend(v14, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("label = <<font color=\"blue\">%@</font>>; \n"), v16);

        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        objc_msgSend(v14, "childStates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v71;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v71 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "label");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendFormat:", CFSTR("%@ ;\n"), v22);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          }
          while (v19);
        }

        objc_msgSend(v3, "appendString:", CFSTR("}\n"));
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    }
    while (v11);
  }

  -[NSMutableSet allObjects](v58->_parentStates, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "arrayByAddingObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v53 = v24;
  v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v67;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v67 != v54)
          objc_enumerationMutation(v53);
        v57 = v25;
        v26 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v25);
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        objc_msgSend(v26, "allTransitions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_218);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = v28;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
        if (v29)
        {
          v30 = v29;
          obja = *(id *)v63;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(id *)v63 != obja)
                objc_enumerationMutation(v59);
              v32 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
              objc_msgSend(v26, "childStates");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v33, "count"))
              {
                objc_msgSend(v26, "childStates");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "allObjects");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "firstObject");
                v36 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v36 = v26;
              }

              objc_msgSend(v32, "toState");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "entryState");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "toState");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39;
              if (v38)
              {
                objc_msgSend(v39, "entryState");
                v41 = objc_claimAutoreleasedReturnValue();

                v40 = (void *)v41;
              }

              objc_msgSend(v36, "label");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "label");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "label");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendFormat:", CFSTR("   \"%@\" -> \"%@\" [ label = \"%@ (%ld)\" "), v42, v43, v44, objc_msgSend(v32, "event"));

              objc_msgSend(v26, "childStates");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "count");

              if (v46)
              {
                objc_msgSend(v26, "label");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR(", ltail = cluster%@ "), v47);

              }
              objc_msgSend(v32, "toState");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "entryState");
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if (v49)
              {
                objc_msgSend(v32, "toState");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "label");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR(", lhead = cluster%@ "), v51);

              }
              objc_msgSend(v3, "appendString:", CFSTR("];\n"));

            }
            v30 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
          }
          while (v30);
        }

        v25 = v57 + 1;
      }
      while (v57 + 1 != v55);
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    }
    while (v55);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

uint64_t __36__FIUIStateMachine_graphDescription__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (NSString)label
{
  return self->_label;
}

uint64_t __36__FIUIStateMachine_graphDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)addStates:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableSet addObject:](self->_states, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIStateMachine _queue_setInitialStateIfNeeded:](self, "_queue_setInitialStateIfNeeded:", v10);

}

- (id)state
{
  return self->_state;
}

- (void)event:(int64_t)a3
{
  NSMutableArray *pendingEvents;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pendingEvents = self->_pendingEvents;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](pendingEvents, "addObject:", v6);

  -[FIUIStateMachine _queue_handleEvents](self, "_queue_handleEvents");
}

- (void)_queue_handleEvents
{
  void *v3;
  uint64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_handlingEvent)
  {
    self->_handlingEvent = 1;
    while (-[NSMutableArray count](self->_pendingEvents, "count"))
    {
      -[NSMutableArray firstObject](self->_pendingEvents, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "longValue");

      -[NSMutableArray removeObjectAtIndex:](self->_pendingEvents, "removeObjectAtIndex:", 0);
      -[FIUIStateMachine _queue_processEvent:](self, "_queue_processEvent:", v4);
    }
    self->_handlingEvent = 0;
  }
}

- (void)_queue_processEvent:(int64_t)a3
{
  FIUIState *v5;
  uint64_t v6;
  uint64_t v7;
  FIUIState *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (**v17)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSMutableArray *transitionalEvents;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  void *v22;
  id v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  FIUIState *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = self->_state;
  if (v5)
  {
    while (1)
    {
      -[FIUIState transitionForEvent:](v5, "transitionForEvent:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
        break;
      -[FIUIState parentState](v5, "parentState");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (FIUIState *)v7;
      if (!v7)
        goto LABEL_4;
    }
    v33 = (id)v6;
  }
  else
  {
LABEL_4:
    v33 = 0;
  }
  v8 = self->_state;
  objc_msgSend(v33, "toState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "toState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entryState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v33, "toState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entryState");
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  -[FIUIStateMachine diagnosticHandler](self, "diagnosticHandler");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[FIUIStateMachine errorHandler](self, "errorHandler");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entry");
  v31 = objc_claimAutoreleasedReturnValue();
  -[FIUIState exit](self->_state, "exit");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handler");
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[FIUIStateMachine transitionalEventFilter](self, "transitionalEventFilter");
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "gate");
  v17 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!v33 && -[FIUIState isTransitional](v8, "isTransitional"))
  {
    v29 = v8;
    transitionalEvents = self->_transitionalEvents;
    if (!transitionalEvents)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v20 = self->_transitionalEvents;
      self->_transitionalEvents = v19;

      transitionalEvents = self->_transitionalEvents;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](transitionalEvents, "addObject:", v21);
    v22 = (void *)v30;
LABEL_34:

    v8 = v29;
    v24 = (void *)v31;
    goto LABEL_35;
  }
  if (v17
    && (((uint64_t (**)(_QWORD, FIUIStateMachine *, FIUIState *, void *, int64_t, _QWORD))v17)[2](v17, self, self->_state, v9, a3, 0) & 1) == 0)
  {

    v9 = 0;
  }
  v23 = v33;
  if (v14)
  {
    ((void (**)(_QWORD, FIUIStateMachine *, FIUIState *, void *, int64_t, _QWORD))v14)[2](v14, self, self->_state, v9, a3, 0);
    v23 = v33;
  }
  if (!v23 && v15)
    ((void (**)(_QWORD, FIUIStateMachine *, FIUIState *, int64_t, _QWORD))v15)[2](v15, self, self->_state, a3, 0);
  if (!v9)
  {
    v24 = (void *)v31;
LABEL_37:
    v28 = (void *)v32;
    v22 = (void *)v30;
    goto LABEL_38;
  }
  if (v32)
    (*(void (**)(void))(v32 + 16))();
  objc_storeStrong((id *)&self->_state, v9);
  if (v16)
    ((void (**)(_QWORD, FIUIStateMachine *, FIUIState *, void *, int64_t, _QWORD))v16)[2](v16, self, v8, v9, a3, 0);
  v24 = (void *)v31;
  if (v31)
    (*(void (**)(uint64_t, FIUIStateMachine *, FIUIState *, void *, int64_t, _QWORD))(v31 + 16))(v31, self, v8, v9, a3, 0);
  if ((objc_msgSend(v9, "isTransitional") & 1) != 0)
    goto LABEL_37;
  v22 = (void *)v30;
  if (-[NSMutableArray count](self->_transitionalEvents, "count"))
  {
    v29 = v8;
    v21 = self->_transitionalEvents;
    v25 = self->_transitionalEvents;
    self->_transitionalEvents = 0;

    if (v30)
    {
      (*(void (**)(uint64_t, FIUIStateMachine *, void *, NSMutableArray *, _QWORD))(v30 + 16))(v30, self, v9, v21, 0);
      v26 = objc_claimAutoreleasedReturnValue();

      v21 = (NSMutableArray *)v26;
    }
    if (-[NSMutableArray count](v21, "count"))
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", 0, -[NSMutableArray count](v21, "count"));
      -[NSMutableArray insertObjects:atIndexes:](self->_pendingEvents, "insertObjects:atIndexes:", v21, v27);

    }
    goto LABEL_34;
  }
LABEL_35:
  v28 = (void *)v32;
LABEL_38:

}

- (id)diagnosticHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (id)transitionalEventFilter
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)dealloc
{
  objc_super v3;

  dispatch_queue_set_specific((dispatch_queue_t)self->_queue, self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)FIUIStateMachine;
  -[FIUIStateMachine dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionalEventFilter, 0);
  objc_storeStrong(&self->_diagnosticHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_parentStates, 0);
  objc_storeStrong((id *)&self->_transitionalEvents, 0);
  objc_storeStrong((id *)&self->_queueKey, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)eventAsync:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__FIUIStateMachine_eventAsync___block_invoke;
  block[3] = &unk_24CF31A40;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __31__FIUIStateMachine_eventAsync___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "event:", *(_QWORD *)(a1 + 40));

}

- (id)queue
{
  return self->_queue;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIUIStateMachine;
  -[FIUIStateMachine description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("(%s)"), dispatch_queue_get_label((dispatch_queue_t)self->_queue));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)export
{
  void *v3;
  id v4;

  -[FIUIStateMachine label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIStateMachine graphDescription](self, "graphDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIUIStateMachineExporter exportWithName:graphDescription:](FIUIStateMachineExporter, "exportWithName:graphDescription:", v4, v3);

}

- (void)addChildStates:(id)a3 toState:(id)a4 withEntryState:(id)a5
{
  NSMutableSet *parentStates;
  id v8;
  id v9;
  id v10;

  parentStates = self->_parentStates;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSMutableSet addObject:](parentStates, "addObject:", v9);
  objc_msgSend(v9, "addChildStates:withEntryState:", v10, v8);

}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setTransitionalEventFilter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (int64_t)pendingEvent
{
  return self->_pendingEvent;
}

- (void)setPendingEvent:(int64_t)a3
{
  self->_pendingEvent = a3;
}

@end
