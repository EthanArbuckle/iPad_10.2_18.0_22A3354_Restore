@implementation VSStateMachine

- (VSStateMachine)init
{
  VSStateMachine *v2;
  VSStateMachine *v3;
  NSString *name;
  NSOperationQueue *v5;
  NSOperationQueue *transitionQueue;
  VSOptional *v7;
  VSOptional *currentState;
  NSMutableArray *v9;
  NSMutableArray *enqueuedTransitions;
  NSMutableDictionary *v11;
  NSMutableDictionary *transitionTable;
  NSMutableDictionary *v13;
  NSMutableDictionary *ignoredEventsByState;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VSStateMachine;
  v2 = -[VSStateMachine init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_1E93A8CC0;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    transitionQueue = v3->_transitionQueue;
    v3->_transitionQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_transitionQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v3->_transitionQueue, "setName:", CFSTR("com.apple.VideoSubscriberAccount.StateMachine"));
    v7 = objc_alloc_init(VSOptional);
    currentState = v3->_currentState;
    v3->_currentState = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    enqueuedTransitions = v3->_enqueuedTransitions;
    v3->_enqueuedTransitions = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transitionTable = v3->_transitionTable;
    v3->_transitionTable = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    ignoredEventsByState = v3->_ignoredEventsByState;
    v3->_ignoredEventsByState = v13;

  }
  return v3;
}

- (void)_enteringState:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  VSStateMachine *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  char v17;
  _BOOL4 v18;
  uint8_t buf[4];
  VSStateMachine *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  -[NSString capitalizedString](v4, "capitalizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E93A8CC0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transitionTo%@State"), v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSSelectorFromString(v7);
  -[VSStateMachine delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v11)
      goto LABEL_20;
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v4;
    goto LABEL_18;
  }
  if (v11)
  {
    NSStringFromSelector(v8);
    v12 = (VSStateMachine *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1D2419000, v10, OS_LOG_TYPE_DEFAULT, "Checking transition selector %@", buf, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = objc_opt_respondsToSelector();
    VSDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((v17 & 1) != 0)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412546;
        v20 = self;
        v21 = 2112;
        v22 = v4;
      }

      objc_msgSend(v9, "stateMachine:transitionToState:", self, v4);
      VSDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v4;
    }
    else
    {
      if (!v18)
        goto LABEL_20;
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v4;
    }
LABEL_18:
    v15 = v10;
    v16 = 22;
    goto LABEL_19;
  }
  VSDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = self;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v4;
  }

  objc_msgSend(v9, v8, self);
  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = self;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v4;
    v15 = v10;
    v16 = 32;
LABEL_19:
    _os_log_impl(&dword_1D2419000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
  }
LABEL_20:

}

- (void)_exitingState:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  VSStateMachine *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  char v18;
  _BOOL4 v19;
  uint8_t buf[4];
  VSStateMachine *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = (void *)MEMORY[0x1D8236758]();
  -[NSString capitalizedString](v4, "capitalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E93A8CC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transitionFrom%@State"), v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSSelectorFromString(v8);
  -[VSStateMachine delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v12)
      goto LABEL_20;
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v4;
    goto LABEL_18;
  }
  if (v12)
  {
    NSStringFromSelector(v9);
    v13 = (VSStateMachine *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v13;
    _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Checking transition selector %@", buf, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v18 = objc_opt_respondsToSelector();
    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if ((v18 & 1) != 0)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412546;
        v21 = self;
        v22 = 2112;
        v23 = v4;
      }

      objc_msgSend(v10, "stateMachine:transitionFromState:", self, v4);
      VSDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v4;
    }
    else
    {
      if (!v19)
        goto LABEL_20;
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v4;
    }
LABEL_18:
    v16 = v11;
    v17 = 22;
    goto LABEL_19;
  }
  VSDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
  }

  objc_msgSend(v10, v9, self);
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
    v16 = v11;
    v17 = 32;
LABEL_19:
    _os_log_impl(&dword_1D2419000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
  }
LABEL_20:

  objc_autoreleasePoolPop(v5);
}

- (void)_handleEnqueuedTransitions
{
  char v3;
  VSStateMachine *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  VSStateMachine *v28;
  uint64_t v29;

  v3 = 0;
  v29 = *MEMORY[0x1E0C80C00];
  do
  {
    v4 = self;
    objc_sync_enter(v4);
    -[VSStateMachine enqueuedTransitions](v4, "enqueuedTransitions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "removeObjectAtIndex:", 0);
    v8 = objc_msgSend(v5, "count") != 0;
    objc_msgSend(v7, "forceUnwrapObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previousState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forceUnwrapObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "nextState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "forceUnwrapObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v11;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = self;
    }

    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStateMachine setCurrentState:](v4, "setCurrentState:", v15);

    -[VSStateMachine transitionQueue](v4, "transitionQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __44__VSStateMachine__handleEnqueuedTransitions__block_invoke;
    v20[3] = &unk_1E939F400;
    v20[4] = v4;
    v17 = v11;
    v21 = v17;
    v18 = v13;
    v22 = v18;
    objc_msgSend(v16, "addOperationWithBlock:", v20);

    objc_sync_exit(v4);
    v19 = v3 | v8;
    v3 = 1;
  }
  while ((v19 & 1) != 0);
}

void __44__VSStateMachine__handleEnqueuedTransitions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_exitingState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_enteringState:", *(_QWORD *)(a1 + 48));
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = v4;
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v5;
  }

}

- (void)_setDestinationState:(id)a3 forEvent:(id)a4 inState:(id)a5 ignoringEvent:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  VSStateMachine *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v27;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v12)
  {
    if (v10)
      goto LABEL_3;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v13, CFSTR("The destinationState parameter must not be nil."));
    if (v11)
      goto LABEL_4;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The sourceState parameter must not be nil."));
  if (!v10)
    goto LABEL_23;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_24:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v13, CFSTR("The triggeringEvent parameter must not be nil."));
LABEL_4:
  v14 = (void *)objc_msgSend(v12, "copy");

  v27 = (id)objc_msgSend(v10, "copy");
  v15 = (void *)objc_msgSend(v11, "copy");

  if (atomic_load((unsigned int *)&self->_mode))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v13, CFSTR("Attempt to allow state transition after activation of state machine %@."), self);
  v17 = self;
  objc_sync_enter(v17);
  -[VSStateMachine ignoredEventsByState](v17, "ignoredEventsByState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v14);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v18, "setObject:forKey:", v19, v14);

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v13, CFSTR("The ignoredEventsOrNil parameter must not be nil."));
      v19 = 0;
    }
  }
  v20 = v19;
  -[VSStateMachine transitionTable](v17, "transitionTable");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", v14);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v21, "setObject:forKey:", v22, v14);

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The transitionsOrNil parameter must not be nil."));
      v22 = 0;
    }
  }
  v23 = v22;
  v24 = v23;
  if (v6)
  {
    objc_msgSend(v23, "objectForKey:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    objc_msgSend(v20, "addObject:", v15);

  }
  else
  {
    if (objc_msgSend(v20, "containsObject:", v15))
    objc_msgSend(v24, "setObject:forKey:", v27, v15);
  }

  objc_sync_exit(v17);
  if (atomic_load((unsigned int *)&self->_mode))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to allow state transition after activation of state machine %@."), v17);

}

- (void)setName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  void *v7;
  id v8;

  if (self->_name != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    name = self->_name;
    self->_name = v5;

    -[VSStateMachine transitionQueue](self, "transitionQueue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ State Machine Transition Queue"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setName:", v7);
  }
}

- (void)ignoreEvent:(id)a3 inState:(id)a4
{
  -[VSStateMachine _setDestinationState:forEvent:inState:ignoringEvent:](self, "_setDestinationState:forEvent:inState:ignoringEvent:", a4, a3, a4, 1);
}

- (void)setDestinationState:(id)a3 forEvent:(id)a4 inState:(id)a5
{
  -[VSStateMachine _setDestinationState:forEvent:inState:ignoringEvent:](self, "_setDestinationState:forEvent:inState:ignoringEvent:", a3, a4, a5, 0);
}

- (void)activateWithState:(id)a3
{
  NSObject *v4;
  int *p_mode;
  VSStateMachine *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  int *v34;
  void *v35;
  VSStateMachine *obj;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  VSStateMachine *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  if (!v38)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The initialState parameter must not be nil."));
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v53 = self;
    v54 = 2112;
    v55 = v38;
  }

  p_mode = &self->_mode;
  do
  {
    if (__ldaxr((unsigned int *)p_mode))
    {
      __clrex();
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to activate already-activated state machine %@."), self);
      goto LABEL_36;
    }
  }
  while (__stlxr(1u, (unsigned int *)p_mode));
  v34 = &self->_mode;
  v7 = self;
  objc_sync_enter(v7);
  obj = v7;
  -[VSStateMachine ignoredEventsByState](v7, "ignoredEventsByState");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSStateMachine transitionTable](v7, "transitionTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObjectsFromArray:", v10);

  objc_msgSend(v37, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObjectsFromArray:", v11);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v8, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "allValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObjectsFromArray:", v16);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v13);
  }

  objc_msgSend(v41, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObjectsFromArray:", v17);

  objc_msgSend(v9, "addObject:", v38);
  objc_msgSend(v39, "removeObject:", v38);
  objc_msgSend(v8, "objectForKey:", v38);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v18 = v35;
    objc_msgSend(v18, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObjectsFromArray:", v19);

    objc_msgSend(v40, "minusSet:", v9);
  }
  do
  {
    objc_msgSend(v39, "minusSet:", v40);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v21 = v40;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v43 != v23)
            objc_enumerationMutation(v21);
          v25 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v9, "addObject:", v25);
          objc_msgSend(v8, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            v28 = v26;
            objc_msgSend(v28, "allValues");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObjectsFromArray:", v29);

          }
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v22);
    }

    objc_msgSend(v20, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v30);

    objc_msgSend(v21, "minusSet:", v9);
  }
  while (objc_msgSend(v21, "count"));
  v31 = (void *)objc_msgSend(v41, "mutableCopy");
  objc_msgSend(v31, "minusSet:", v9);
  if (objc_msgSend(v31, "count"))
  {
  }
  else
  {
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStateMachine setCurrentState:](obj, "setCurrentState:", v32);

  }
  objc_sync_exit(obj);

  while (1)
  {
    v33 = __ldaxr((unsigned int *)v34);
    if (v33 != 1)
      break;
    if (!__stlxr(2u, (unsigned int *)v34))
      goto LABEL_36;
  }
  __clrex();
LABEL_36:

}

- (BOOL)enqueueEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  VSStateMachine *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  VSStateMachine *v15;
  void *v16;
  void *v17;
  void *v18;
  VSStateTransition *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  BOOL v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  VSStateMachine *v34;
  __int16 v35;
  VSStateMachine *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The event parameter must not be nil."));
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v4;
    v33 = 2112;
    v34 = self;
  }

  v6 = (void *)objc_msgSend(v4, "copy");
  v7 = atomic_load((unsigned int *)&self->_mode);
  if (v7 != 2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to enqueue an event prior to activation of state machine %@."), self);
  v8 = self;
  objc_sync_enter(v8);
  -[VSStateMachine currentState](v8, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSStateMachine enqueuedTransitions](v8, "enqueuedTransitions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = v11 == 0;
  if (v11)
  {
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v10, "count") - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nextState");
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  objc_msgSend(v9, "forceUnwrapObject");
  v15 = (VSStateMachine *)objc_claimAutoreleasedReturnValue();
  v29 = v12;
  -[VSStateMachine transitionTable](v8, "transitionTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKey:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v18 != 0;
  if (v18)
  {
    v19 = objc_alloc_init(VSStateTransition);
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStateTransition setPreviousState:](v19, "setPreviousState:", v20);

    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStateTransition setTriggeringEvent:](v19, "setTriggeringEvent:", v21);

    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStateTransition setNextState:](v19, "setNextState:", v22);

    objc_msgSend(v10, "addObject:", v19);
    goto LABEL_11;
  }
  -[VSStateMachine ignoredEventsByState](v8, "ignoredEventsByState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "containsObject:", v6);

  if (v27)
  {
    VSDefaultLogObject();
    v19 = (VSStateTransition *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 0;
      v29 = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412802;
    v32 = v6;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v8;
    v29 = 0;
LABEL_11:
    v23 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (-[VSStateMachine ignoresUnassignedEvents](v8, "ignoresUnassignedEvents"))
  {
    VSDefaultLogObject();
    v19 = (VSStateTransition *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v6;
      v33 = 2112;
      v34 = v15;
      v35 = 2112;
      v36 = v8;
    }
    v23 = 1;
    goto LABEL_12;
  }
  VSErrorLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v32 = v6;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v8;
  }

  v23 = 0;
LABEL_13:

  objc_sync_exit(v8);
  if (((v23 | !v29) & 1) != 0)
    v30 = (v18 != 0) & (v23 ^ 1);
  else
    -[VSStateMachine _handleEnqueuedTransitions](v8, "_handleEnqueuedTransitions");

  return v30;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VSStateMachine;
  -[VSStateMachine description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSStateMachine name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ name=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (VSOptional)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (VSStateMachineDelegate)delegate
{
  return (VSStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)ignoresUnassignedEvents
{
  return self->_ignoresUnassignedEvents;
}

- (void)setIgnoresUnassignedEvents:(BOOL)a3
{
  self->_ignoresUnassignedEvents = a3;
}

- (NSOperationQueue)transitionQueue
{
  return self->_transitionQueue;
}

- (void)setTransitionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transitionQueue, a3);
}

- (NSMutableArray)enqueuedTransitions
{
  return self->_enqueuedTransitions;
}

- (void)setEnqueuedTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_enqueuedTransitions, a3);
}

- (NSMutableDictionary)transitionTable
{
  return self->_transitionTable;
}

- (void)setTransitionTable:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTable, a3);
}

- (NSMutableDictionary)ignoredEventsByState
{
  return self->_ignoredEventsByState;
}

- (void)setIgnoredEventsByState:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredEventsByState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredEventsByState, 0);
  objc_storeStrong((id *)&self->_transitionTable, 0);
  objc_storeStrong((id *)&self->_enqueuedTransitions, 0);
  objc_storeStrong((id *)&self->_transitionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
