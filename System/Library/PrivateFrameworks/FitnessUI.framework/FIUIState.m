@implementation FIUIState

- (FIUIState)initWithLabel:(id)a3
{
  id v5;
  FIUIState *v6;
  FIUIState *v7;
  uint64_t v8;
  NSMutableDictionary *transitions;
  NSMutableSet *v10;
  NSMutableSet *childStates;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FIUIState;
  v6 = -[FIUIState init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    transitions = v7->_transitions;
    v7->_transitions = (NSMutableDictionary *)v8;

    objc_storeWeak((id *)&v7->_parentState, 0);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    childStates = v7->_childStates;
    v7->_childStates = v10;

    objc_storeWeak((id *)&v7->_entryState, 0);
  }

  return v7;
}

- (void)registerTransition:(int64_t)a3 label:(id)a4 toState:(id)a5
{
  -[FIUIState registerTransition:label:toState:handler:gate:](self, "registerTransition:label:toState:handler:gate:", a3, a4, a5, 0, 0);
}

- (void)registerTransition:(int64_t)a3 label:(id)a4 toState:(id)a5 handler:(id)a6 gate:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *transitions;
  void *v18;
  NSMutableDictionary *v19;
  id v20;

  v20 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = self->_transitions;
  objc_sync_enter(v15);
  if (v12)
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setToState:", v12);
    objc_msgSend(v16, "setHandler:", v13);
    objc_msgSend(v16, "setGate:", v14);
    objc_msgSend(v16, "setEvent:", a3);
    objc_msgSend(v16, "setLabel:", v20);
    transitions = self->_transitions;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](transitions, "setObject:forKey:", v16, v18);

  }
  else
  {
    v19 = self->_transitions;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v16);
  }

  objc_sync_exit(v15);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)allTransitions
{
  return (id)-[NSMutableDictionary allValues](self->_transitions, "allValues");
}

- (void)setEntry:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setExit:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

+ (id)transitionalStateFromState:(id)a3 toState:(id)a4 entryEvent:(int64_t)a5 exitEvent:(int64_t)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FIUIState *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FIUIState *v22;

  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Entry.%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Exit.%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [FIUIState alloc];
  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Transitional.%@.%@"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[FIUIState initWithLabel:](v17, "initWithLabel:", v21);

  objc_msgSend(v11, "registerTransition:label:toState:handler:gate:", a5, v13, v22, 0, 0);
  -[FIUIState registerTransition:label:toState:handler:gate:](v22, "registerTransition:label:toState:handler:gate:", a6, v16, v10, 0, 0);

  -[FIUIState setTransitional:](v22, "setTransitional:", 1);
  return v22;
}

- (void)setTransitional:(BOOL)a3
{
  self->_transitional = a3;
}

- (id)transitionForEvent:(int64_t)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *transitions;
  void *v7;
  void *v8;

  v5 = self->_transitions;
  objc_sync_enter(v5);
  transitions = self->_transitions;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](transitions, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (id)exit
{
  return objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isTransitional
{
  return self->_transitional;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIUIState;
  -[FIUIState description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("(%@)"), self->_label);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entryState);
  objc_storeStrong((id *)&self->_childStates, 0);
  objc_destroyWeak((id *)&self->_parentState);
  objc_storeStrong(&self->_exit, 0);
  objc_storeStrong(&self->_entry, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
}

+ (id)stateWithLabel:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:", v3);

  return v4;
}

- (void)enumerateEvents:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, void *, _BYTE *);
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t, void *, _BYTE *))a3;
  v5 = self->_transitions;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableDictionary copy](self->_transitions, "copy");
  objc_sync_exit(v5);

  v20 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "event");
      objc_msgSend(v11, "label");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v13, "UTF8String");
      objc_msgSend(v11, "toState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v12, v14, v15, &v20);

      if (v20)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)addChildStates:(id)a3 withEntryState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "setParentState:", self);
        -[FIUIState childStates](self, "childStates");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  -[FIUIState setEntryState:](self, "setEntryState:", v7);

}

- (id)entry
{
  return objc_getProperty(self, a2, 32, 1);
}

- (FIUIState)parentState
{
  return (FIUIState *)objc_loadWeakRetained((id *)&self->_parentState);
}

- (void)setParentState:(id)a3
{
  objc_storeWeak((id *)&self->_parentState, a3);
}

- (NSMutableSet)childStates
{
  return self->_childStates;
}

- (FIUIState)entryState
{
  return (FIUIState *)objc_loadWeakRetained((id *)&self->_entryState);
}

- (void)setEntryState:(id)a3
{
  objc_storeWeak((id *)&self->_entryState, a3);
}

@end
