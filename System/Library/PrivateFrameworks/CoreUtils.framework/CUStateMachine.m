@implementation CUStateMachine

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *eventQueue;
  NSPointerArray *lcaPath;
  objc_super v11;

  if (self->_currentState || self->_targetState)
    FatalErrorF((uint64_t)"State machine invalidate not called", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v11.receiver);
  -[NSMutableArray removeAllObjects](self->_eventQueue, "removeAllObjects");
  eventQueue = self->_eventQueue;
  self->_eventQueue = 0;

  -[NSPointerArray setCount:](self->_lcaPath, "setCount:", 0);
  lcaPath = self->_lcaPath;
  self->_lcaPath = 0;

  v11.receiver = self;
  v11.super_class = (Class)CUStateMachine;
  -[CUStateMachine dealloc](&v11, sel_dealloc);
}

- (void)start
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CUState *initialState;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  CUState *v21;
  void (**eventHandler)(id, void *);
  void *v23;
  CUState *currentState;
  void (**v25)(id, void *);
  void *v26;
  CUState *i;
  CUState *v28;
  CUState *v29;
  uint64_t v30;
  CUState *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  CUState *targetState;
  void (**v44)(id, void *);
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;

  if (self->_started)
    FatalErrorF((uint64_t)"Attempt to start an already-started state machine", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v48);
  -[CUStateMachine _firstTimeInit](self, "_firstTimeInit");
  initialState = self->_initialState;
  if (!initialState)
    FatalErrorF((uint64_t)"No initial state", v9, v10, v11, v12, v13, v14, v15, v48);
  v17 = initialState;
  v18 = -1;
  do
  {
    v19 = v18++;
    -[NSPointerArray replacePointerAtIndex:withPointer:](self->_lcaPath, "replacePointerAtIndex:withPointer:", v18, v17);
    v20 = (id *)v17[5];

    v17 = v20;
  }
  while (v20);
  self->_dispatching = 1;
  if (v19 != -2)
  {
    do
    {
      -[NSPointerArray pointerAtIndex:](self->_lcaPath, "pointerAtIndex:", v18);
      v21 = (CUState *)objc_claimAutoreleasedReturnValue();
      eventHandler = (void (**)(id, void *))v21->_eventHandler;
      +[CUStateEvent enterState](CUStateEvent, "enterState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      eventHandler[2](eventHandler, v23);

      currentState = self->_currentState;
      self->_currentState = v21;

      --v18;
    }
    while (v18 != -1);
  }
  v25 = (void (**)(id, void *))self->_currentState->_eventHandler;
  +[CUStateEvent initialTransition](CUStateEvent, "initialTransition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2](v25, v26);

  for (i = self->_targetState; i; i = self->_targetState)
  {
    v28 = i;
    v29 = v28;
    if (v28 == self->_currentState)
    {

LABEL_20:
      FatalErrorF((uint64_t)"Bad initial transition %@ -> %@", v33, v34, v35, v36, v37, v38, v39, (uint64_t)self->_currentState);
    }
    v30 = 0;
    do
    {
      v31 = v29;
      v32 = v30++;
      -[NSPointerArray replacePointerAtIndex:withPointer:](self->_lcaPath, "replacePointerAtIndex:withPointer:", v32, v29);
      v29 = v29->_parent;

    }
    while (v29 != self->_currentState);

    if (!v30)
      goto LABEL_20;
    do
    {
      -[NSPointerArray pointerAtIndex:](self->_lcaPath, "pointerAtIndex:", v32);
      v40 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v41 = v40[1];
      +[CUStateEvent enterState](CUStateEvent, "enterState");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v42);

      --v32;
    }
    while (v32 != -1);
    objc_storeStrong((id *)&self->_currentState, self->_targetState);
    targetState = self->_targetState;
    self->_targetState = 0;

    v44 = (void (**)(id, void *))self->_currentState->_eventHandler;
    +[CUStateEvent initialTransition](CUStateEvent, "initialTransition");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2](v44, v45);

  }
  self->_dispatching = 0;
  -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v49 = v46;
    v47 = v46;

    -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0);
    -[CUStateMachine dispatchEvent:](self, "dispatchEvent:", v47);
    v46 = v49;
  }

}

- (void)invalidate
{
  CUState *currentState;
  NSMutableArray *eventQueue;
  NSPointerArray *lcaPath;
  CUState *targetState;
  CUState *initialState;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *states;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  currentState = self->_currentState;
  self->_currentState = 0;

  -[NSMutableArray removeAllObjects](self->_eventQueue, "removeAllObjects");
  eventQueue = self->_eventQueue;
  self->_eventQueue = 0;

  -[NSPointerArray setCount:](self->_lcaPath, "setCount:", 0);
  lcaPath = self->_lcaPath;
  self->_lcaPath = 0;

  targetState = self->_targetState;
  self->_targetState = 0;

  -[CUState invalidate](self->_initialState, "invalidate");
  initialState = self->_initialState;
  self->_initialState = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_states;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "invalidate", (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  states = self->_states;
  self->_states = 0;

}

- (void)dispatchEvent:(id)a3
{
  id v4;
  id v5;
  CUState **p_currentState;
  CUState *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CUState *targetState;
  CUState *v26;
  CUState *i;
  void (**eventHandler)(id, void *);
  void *v29;
  CUState *v30;
  id *p_isa;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CUState *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  CUState *currentState;
  void (**v50)(id, void *);
  void *v51;
  void *v52;
  id v53;

  v4 = a3;
  v53 = v4;
  if (self->_dispatching)
  {
    -[NSMutableArray addObject:](self->_eventQueue, "addObject:", v4);
  }
  else
  {
    v5 = v4;
    p_currentState = &self->_currentState;
    v7 = self->_currentState;
    while (1)
    {
      v8 = (uint64_t)v7;
      while (1)
      {
        self->_dispatching = 1;
        v9 = (*(uint64_t (**)(void))(*(_QWORD *)(v8 + 8) + 16))();
        self->_dispatching = 0;
        if (v9 != 1)
          break;
        if (self->_targetState)
          FatalErrorF((uint64_t)"State %@ unhandled, but transitioned to state %@", v10, v11, v12, v13, v14, v15, v16, v8);
        v17 = *(id *)(v8 + 40);

        v8 = (uint64_t)v17;
        if (!v17)
          FatalErrorF((uint64_t)"Event %@ unhandled\n", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v5);
      }
      if (v9 != 2)
        FatalErrorF((uint64_t)"State %@ bad result %ld", v10, v11, v12, v13, v14, v15, v16, v8);
      self->_dispatching = 1;
      while (1)
      {
        targetState = self->_targetState;
        if (!targetState)
          break;
        objc_msgSend(*(id *)(v8 + 24), "pointerAtIndex:", targetState->_index);
        v26 = (CUState *)objc_claimAutoreleasedReturnValue();
        for (i = *p_currentState; *p_currentState != v26; i = *p_currentState)
        {
          eventHandler = (void (**)(id, void *))i->_eventHandler;
          +[CUStateEvent exitState](CUStateEvent, "exitState");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          eventHandler[2](eventHandler, v29);

          objc_storeStrong((id *)&self->_currentState, (*p_currentState)->_parent);
        }
        v30 = self->_targetState;
        if ((CUState *)v8 == v30)
        {
          v45 = *(_QWORD *)(v8 + 8);
          +[CUStateEvent exitState](CUStateEvent, "exitState");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v45 + 16))(v45, v46);

          v47 = *(_QWORD *)(v8 + 8);
          +[CUStateEvent enterState](CUStateEvent, "enterState");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v47 + 16))(v47, v48);

          objc_storeStrong((id *)&self->_currentState, (id)v8);
        }
        else
        {
          p_isa = v30;

          v8 = (uint64_t)v26;
          if (p_isa != (id *)v26)
          {
            v39 = 0;
            do
            {
              v40 = v39++;
              -[NSPointerArray replacePointerAtIndex:withPointer:](self->_lcaPath, "replacePointerAtIndex:withPointer:", v40, p_isa);
              v41 = (CUState *)p_isa[5];

              p_isa = (id *)&v41->super.isa;
            }
            while (v41 != v26);
            v42 = v26;
            v8 = (uint64_t)v26;
            if (v39)
            {
              do
              {
                -[NSPointerArray pointerAtIndex:](self->_lcaPath, "pointerAtIndex:", v40);
                v8 = objc_claimAutoreleasedReturnValue();

                v43 = *(_QWORD *)(v8 + 8);
                +[CUStateEvent enterState](CUStateEvent, "enterState");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v44);

                objc_storeStrong((id *)&self->_currentState, (id)v8);
                --v40;
                v42 = (void *)v8;
              }
              while (v40 != -1);
            }
          }
        }
        currentState = self->_currentState;
        if (currentState != self->_targetState)
          FatalErrorF((uint64_t)"Transitioned state %@ not target %@", v32, v33, v34, v35, v36, v37, v38, (uint64_t)self->_currentState);
        self->_targetState = 0;

        v50 = (void (**)(id, void *))self->_currentState->_eventHandler;
        +[CUStateEvent initialTransition](CUStateEvent, "initialTransition");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v50[2](v50, v51);

      }
      self->_dispatching = 0;
      v7 = self->_currentState;

      -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
        break;
      v5 = v52;

      -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0);
    }

  }
}

- (void)transitionToState:(id)a3
{
  CUState *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (CUState *)a3;
  if (!self->_dispatching)
    FatalErrorF((uint64_t)"Transition to state %@ only allowed from a state handler", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  if (self->_targetState)
    FatalErrorF((uint64_t)"Transition to state %@ while transitioning to state %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  self->_targetState = v4;

}

- (void)_firstTimeInit
{
  NSUInteger v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id *v32;
  id *v33;
  id v34;
  id *v35;
  id *v36;
  id *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  unint64_t v54;
  NSMutableArray *v55;
  NSMutableArray *eventQueue;
  uint64_t v57;
  NSPointerArray *lcaPath;
  uint64_t v59;
  NSArray *obj;
  uint64_t v61;
  CUStateMachine *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSArray *v66;
  uint64_t v67;
  unint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_states, "count");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v62 = self;
  v4 = self->_states;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
  if (v5)
  {
    v13 = v5;
    v14 = 0;
    v15 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v78 != v15)
          objc_enumerationMutation(v4);
        v17 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
        if (*(_QWORD *)(v17 + 24))
          FatalErrorF((uint64_t)"Duplicate state %@", v6, v7, v8, v9, v10, v11, v12, *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
        *(_QWORD *)(v17 + 16) = v14 + i;
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 2);
        v19 = *(void **)(v17 + 24);
        *(_QWORD *)(v17 + 24) = v18;

        objc_msgSend(*(id *)(v17 + 24), "setCount:", v3);
      }
      v14 += i;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    }
    while (v13);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v62->_states;
  v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  v20 = 0;
  if (v63)
  {
    v61 = *(_QWORD *)v74;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v74 != v61)
          objc_enumerationMutation(obj);
        v64 = v21;
        v22 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v21);
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v23 = v62->_states;
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v70;
          v65 = *(_QWORD *)v70;
          v66 = v23;
          do
          {
            v27 = 0;
            v67 = v25;
            do
            {
              if (*(_QWORD *)v70 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v27);
              if (v28 == v22)
              {
                objc_msgSend(*(id *)(v22 + 24), "replacePointerAtIndex:withPointer:", *(_QWORD *)(v22 + 16), v22);
              }
              else
              {
                objc_msgSend(*(id *)(v28 + 24), "pointerAtIndex:", *(_QWORD *)(v22 + 16));
                v29 = objc_claimAutoreleasedReturnValue();
                if (v29)
                {
                  v30 = (void *)v29;
                  objc_msgSend(*(id *)(v22 + 24), "replacePointerAtIndex:withPointer:", *(_QWORD *)(v28 + 16), v29);
                }
                else
                {
                  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v32 = (id *)(id)v22;
                  do
                  {
                    objc_msgSend(v31, "insertObject:atIndex:", v32, 0);
                    v33 = (id *)v32[5];

                    v32 = v33;
                  }
                  while (v33);
                  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v35 = (id *)(id)v28;
                  v36 = v35;
                  if (v35)
                  {
                    do
                    {
                      objc_msgSend(v34, "insertObject:atIndex:", v36, 0);
                      v37 = (id *)v36[5];

                      v36 = v37;
                    }
                    while (v37);
                  }
                  v38 = objc_msgSend(v31, "count");
                  if (v38 >= objc_msgSend(v34, "count"))
                    v39 = v34;
                  else
                    v39 = v31;
                  v40 = objc_msgSend(v39, "count");
                  if (!v40)
                    goto LABEL_50;
                  v48 = v40;
                  v68 = v20;
                  v49 = 0;
                  v50 = 0;
                  while (1)
                  {
                    objc_msgSend(v31, "objectAtIndexedSubscript:", v49);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "objectAtIndexedSubscript:", v49);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v30 != v51)
                      break;

                    ++v49;
                    v50 = v30;
                    if (v48 == v49)
                      goto LABEL_36;
                  }

                  v30 = v50;
LABEL_36:
                  v20 = v68;
                  if (!v30)
LABEL_50:
                    FatalErrorF((uint64_t)"Find LCA failed...invalid state graph", v41, v42, v43, v44, v45, v46, v47, v59);
                  objc_msgSend(*(id *)(v22 + 24), "replacePointerAtIndex:withPointer:", v35[2], v30);
                  v52 = objc_msgSend(v31, "count");
                  if (v52 <= objc_msgSend(v34, "count"))
                    v53 = v34;
                  else
                    v53 = v31;
                  v54 = objc_msgSend(v53, "count");
                  if (v54 > v68)
                    v20 = v54;

                  v26 = v65;
                  v23 = v66;
                  v25 = v67;
                }

              }
              ++v27;
            }
            while (v27 != v25);
            v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
          }
          while (v25);
        }

        v21 = v64 + 1;
      }
      while (v64 + 1 != v63);
      v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v63);
  }

  v55 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  eventQueue = v62->_eventQueue;
  v62->_eventQueue = v55;

  v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 2);
  lcaPath = v62->_lcaPath;
  v62->_lcaPath = (NSPointerArray *)v57;

  -[NSPointerArray setCount:](v62->_lcaPath, "setCount:", v20);
  v62->_started = 1;
}

- (CUState)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(id)a3
{
  objc_storeStrong((id *)&self->_initialState, a3);
}

- (NSArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
  objc_storeStrong((id *)&self->_states, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_targetState, 0);
  objc_storeStrong((id *)&self->_lcaPath, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
