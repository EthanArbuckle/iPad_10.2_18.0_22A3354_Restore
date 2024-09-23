@implementation GKStateMachine

- (GKStateMachine)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GKInitNotAllowedException"), CFSTR("initWithStates is the destignated initialize for GKStateMachine.  Use that instead"));
  return -[GKStateMachine initWithStates:](self, "initWithStates:", MEMORY[0x24BDBD1A8]);
}

+ (GKStateMachine)stateMachineWithStates:(NSArray *)states
{
  NSArray *v4;
  void *v5;

  v4 = states;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStates:", v4);

  return (GKStateMachine *)v5;
}

- (GKStateMachine)initWithStates:(NSArray *)states
{
  NSArray *v4;
  GKStateMachine *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *v14;
  GKState *currentState;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = states;
  v21.receiver = self;
  v21.super_class = (Class)GKStateMachine;
  v5 = -[GKStateMachine init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v4;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          objc_msgSend(v6, "setObject:forKey:", v12, objc_opt_class(), (_QWORD)v17);
          objc_msgSend(v12, "_setStateMachine:", v5);
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v5->_states;
    v5->_states = (NSDictionary *)v13;

    currentState = v5->_currentState;
    v5->_currentState = 0;

  }
  return v5;
}

- (void)updateWithDeltaTime:(NSTimeInterval)sec
{
  id v4;

  -[GKStateMachine currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithDeltaTime:", sec);

}

- (void)forceEnterState:(Class)a3
{
  GKState *v4;
  void *v5;
  GKState *currentState;
  GKState *v7;
  id v8;

  -[GKStateMachine stateForClass:](self, "stateForClass:", a3);
  v4 = (GKState *)objc_claimAutoreleasedReturnValue();
  -[GKStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willExitWithNextState:", v4);

  -[GKStateMachine currentState](self, "currentState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  currentState = self->_currentState;
  self->_currentState = v4;
  v7 = v4;

  -[GKState didEnterWithPreviousState:](self->_currentState, "didEnterWithPreviousState:", v8);
}

- (BOOL)enterState:(Class)stateClass
{
  _BOOL4 v5;

  v5 = -[GKStateMachine canEnterState:](self, "canEnterState:");
  if (v5)
    -[GKStateMachine forceEnterState:](self, "forceEnterState:", stateClass);
  return v5;
}

- (BOOL)canEnterState:(Class)stateClass
{
  void *v5;
  void *v6;
  char v7;

  -[GKStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  -[GKStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValidNextState:", stateClass);

  return v7;
}

- (GKState)stateForClass:(Class)stateClass
{
  return (GKState *)-[NSDictionary objectForKeyedSubscript:](self->_states, "objectForKeyedSubscript:", stateClass);
}

- (id)_instanceData
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *states;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  GKStateMachine *v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24F059328, CFSTR("__version"));
  -[GKStateMachine currentState](self, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKStateMachine currentState](self, "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("__currentstate"));

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  states = self->_states;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __31__GKStateMachine__instanceData__block_invoke;
  v15[3] = &unk_24F04F4E8;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v11 = v8;
  v12 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](states, "enumerateKeysAndObjectsUsingBlock:", v15);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("__allstates"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("__transitions"));
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __31__GKStateMachine__instanceData__block_invoke(uint64_t a1, objc_class *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_class *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  NSStringFromClass(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 == v11)
        {
          v13 = *(objc_class **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (!objc_msgSend(v5, "isValidNextState:", v13))
            continue;
        }
        else
        {
          objc_enumerationMutation(v8);
          v13 = *(objc_class **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (!objc_msgSend(v5, "isValidNextState:", v13))
            continue;
        }
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v7, v6);

}

- (id)_dotStringInstanceData
{
  void *v3;
  NSDictionary *states;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  GKStateMachine *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("digraph GK_state_machine {\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  states = self->_states;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __40__GKStateMachine__dotStringInstanceData__block_invoke;
  v13 = &unk_24F04F510;
  v14 = self;
  v15 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](states, "enumerateKeysAndObjectsUsingBlock:", &v10);
  objc_msgSend(v5, "appendString:", CFSTR("}"), v10, v11, v12, v13, v14);
  v6 = (void *)MEMORY[0x24BDD1618];
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __40__GKStateMachine__dotStringInstanceData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 == v10)
        {
          v12 = *(objc_class **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!objc_msgSend(v6, "isValidNextState:", v12))
            continue;
        }
        else
        {
          objc_enumerationMutation(v7);
          v12 = *(objc_class **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!objc_msgSend(v6, "isValidNextState:", v12))
            continue;
        }
        v13 = *(void **)(a1 + 40);
        NSStringFromClass(v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@ -> %@\n"), v14, v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (GKState)currentState
{
  return self->_currentState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_states, 0);
}

@end
