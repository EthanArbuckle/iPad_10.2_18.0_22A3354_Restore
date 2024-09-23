@implementation MapsSuggestionsActionCircuit

- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 conditions:(id)a4 action:(id)a5
{
  return -[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:](self, "initWithTriggers:conditions:type:action:", a3, a4, 0, a5);
}

- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 conditions:(id)a4 type:(unint64_t)a5 action:(id)a6
{
  id v10;
  id v11;
  id v12;
  MapsSuggestionsActionCircuit *v13;
  MapsSuggestionsActionCircuit *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *innerQueue;
  NSString *v21;
  NSString *name;
  id v23;
  MapsSuggestionsObservers *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *circuits;
  NSArray *triggers;
  NSArray *conditions;
  void *v35;
  void *v36;
  NSString *firedTriggerName;
  NSString *failedConditionName;
  NSError *lastError;
  OS_dispatch_queue *v40;
  OS_dispatch_queue *v41;
  MapsSuggestionsBlockCondition *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  MapsSuggestionsActionCircuit *v47;
  NSObject *v48;
  void *v50;
  uint64_t v51;
  OS_dispatch_queue *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  objc_super v59;
  _BYTE v60[128];
  _BYTE location[18];
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v12)
  {
    GEOFindOrCreateLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsActionCircuit.mm";
      *(_WORD *)&location[12] = 1024;
      *(_DWORD *)&location[14] = 99;
      v62 = 2082;
      v63 = "-[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:]";
      v64 = 2082;
      v65 = "nil == (action)";
      _os_log_impl(&dword_1A427D000, v48, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an action", location, 0x26u);
    }
    goto LABEL_24;
  }
  if (!v10)
  {
    GEOFindOrCreateLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsActionCircuit.mm";
      *(_WORD *)&location[12] = 1024;
      *(_DWORD *)&location[14] = 100;
      v62 = 2082;
      v63 = "-[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:]";
      v64 = 2082;
      v65 = "nil == (triggers)";
      _os_log_impl(&dword_1A427D000, v48, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one or more triggers", location, 0x26u);
    }
    goto LABEL_24;
  }
  if (!v11)
  {
    GEOFindOrCreateLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsActionCircuit.mm";
      *(_WORD *)&location[12] = 1024;
      *(_DWORD *)&location[14] = 101;
      v62 = 2082;
      v63 = "-[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:]";
      v64 = 2082;
      v65 = "nil == (conditions)";
      _os_log_impl(&dword_1A427D000, v48, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one or more Conditions", location, 0x26u);
    }
LABEL_24:

    v47 = 0;
    goto LABEL_25;
  }
  v59.receiver = self;
  v59.super_class = (Class)MapsSuggestionsActionCircuit;
  v13 = -[MapsSuggestionsActionCircuit init](&v59, sel_init);
  v14 = v13;
  if (v13)
  {
    *(_QWORD *)&v13->_anon_30[16] = a5;
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v12, "uniqueName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("MapsSuggestionsActionCircuitQueue{%@}"), v16);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)location, v17, v18);
    v19 = *(OS_dispatch_queue **)location;
    *(_QWORD *)location = 0;
    innerQueue = v14->_queue._innerQueue;
    v14->_queue._innerQueue = v19;

    v21 = *(NSString **)&location[8];
    *(_QWORD *)&location[8] = 0;
    name = v14->_queue._name;
    v14->_queue._name = v21;

    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v12, "uniqueName");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v23, "initWithFormat:", CFSTR("MapsSuggestionsActionCircuit{%@}"), v50);
    v24 = [MapsSuggestionsObservers alloc];
    v52 = v14->_queue._innerQueue;
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v12, "uniqueName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("MapsSuggestionsActionCircuitObservers{%@}"), v26);
    v28 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v24, "initWithCallbackQueue:name:", v52, v27);
    v29 = (NSArray *)v12;
    v30 = objc_msgSend(v10, "copy");
    v31 = objc_msgSend(v11, "copy");
    circuits = v14->_config.circuits;
    v14->_config.circuits = (NSArray *)v51;

    triggers = v14->_config.triggers;
    v14->_config.triggers = (NSArray *)v28;

    conditions = v14->_config.conditions;
    v14->_config.conditions = v29;

    v35 = *(void **)v14->_anon_30;
    *(_QWORD *)v14->_anon_30 = v30;

    v36 = *(void **)&v14->_anon_30[8];
    *(_QWORD *)&v14->_anon_30[8] = v31;

    *(_QWORD *)&v14->_anon_30[16] = 0;
    firedTriggerName = v14->_state.firedTriggerName;
    v14->_state.firedTriggerName = 0;

    failedConditionName = v14->_state.failedConditionName;
    v14->_state.failedConditionName = 0;

    lastError = v14->_state.lastError;
    v14->_state.lastError = 0;

    v14->_state.active = 0;
    if (*(_QWORD *)&v14->_anon_30[16] == 2)
    {
      objc_initWeak((id *)location, v14);
      v40 = v14->_queue._innerQueue;
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __72__MapsSuggestionsActionCircuit_initWithTriggers_conditions_type_action___block_invoke;
      v57[3] = &unk_1E4BD0638;
      objc_copyWeak(&v58, (id *)location);
      v41 = v40;
      v42 = -[MapsSuggestionsBlockCondition initWithName:queue:block:]([MapsSuggestionsBlockCondition alloc], "initWithName:queue:block:", CFSTR("MapsSuggestionsDroppingCircuit"), v41, v57);

      -[MapsSuggestionsActionCircuit addCondition:](v14, "addCondition:", v42);
      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)location);
    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v43 = *(id *)v14->_anon_30;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v54 != v45)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "registerObserver:", v14);
        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v44);
    }

  }
  self = v14;
  v47 = self;
LABEL_25:

  return v47;
}

BOOL __72__MapsSuggestionsActionCircuit_initWithTriggers_conditions_type_action___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;
  NSObject *v4;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_BYTE *)WeakRetained + 96) == 0;
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsActionCircuit.mm";
      v8 = 1026;
      v9 = 119;
      v10 = 2082;
      v11 = "-[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    v3 = 0;
  }

  return v3;
}

- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 action:(id)a4
{
  return -[MapsSuggestionsActionCircuit initWithTriggers:conditions:action:](self, "initWithTriggers:conditions:action:", a3, MEMORY[0x1E0C9AA60], a4);
}

- (MapsSuggestionsActionCircuit)initWithAction:(id)a3
{
  return -[MapsSuggestionsActionCircuit initWithTriggers:action:](self, "initWithTriggers:action:", MEMORY[0x1E0C9AA60], a3);
}

- (void)dealloc
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)self->_anon_30;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "unregisterObserver:", self);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsActionCircuit;
  -[MapsSuggestionsActionCircuit dealloc](&v7, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  -[NSArray registerObserver:handler:](self->_config.triggers, "registerObserver:handler:", a3, 0);
}

- (void)unregisterObserver:(id)a3
{
  -[NSArray unregisterObserver:handler:](self->_config.triggers, "unregisterObserver:handler:", a3, 0);
}

- (void)addTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsActionCircuit uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    v13 = 2080;
    v14 = "-[MapsSuggestionsActionCircuit addTrigger:]";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__MapsSuggestionsActionCircuit_addTrigger___block_invoke;
  v9[3] = &unk_1E4BD0660;
  v8 = v4;
  v10 = v8;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v9);

}

void __43__MapsSuggestionsActionCircuit_addTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5[6], "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v5[6];
  v5[6] = (id)v3;

  objc_msgSend(*(id *)(a1 + 32), "registerObserver:", v5);
}

- (void)addCondition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsActionCircuit uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    v13 = 2080;
    v14 = "-[MapsSuggestionsActionCircuit addCondition:]";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MapsSuggestionsActionCircuit_addCondition___block_invoke;
  v9[3] = &unk_1E4BD0660;
  v8 = v4;
  v10 = v8;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v9);

}

void __45__MapsSuggestionsActionCircuit_addCondition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5[7], "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v5[7];
  v5[7] = (id)v3;

}

- (void)removeTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsActionCircuit uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = v6;
    v12 = 2080;
    v13 = "-[MapsSuggestionsActionCircuit removeTrigger:]";
    v14 = 2048;
    v15 = v4;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %p", buf, 0x20u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__MapsSuggestionsActionCircuit_removeTrigger___block_invoke;
  v8[3] = &unk_1E4BD0660;
  v7 = v4;
  v9 = v7;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v8);

}

void __46__MapsSuggestionsActionCircuit_removeTrigger___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unregisterObserver:", v3);
  v4 = (void *)v3[6];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MapsSuggestionsActionCircuit_removeTrigger___block_invoke_2;
  v7[3] = &unk_1E4BD0688;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "MSg_copyIf:", v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v3[6];
  v3[6] = v5;

}

BOOL __46__MapsSuggestionsActionCircuit_removeTrigger___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

- (void)removeCondition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsActionCircuit uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = v6;
    v12 = 2080;
    v13 = "-[MapsSuggestionsActionCircuit removeCondition:]";
    v14 = 2048;
    v15 = v4;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %p", buf, 0x20u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MapsSuggestionsActionCircuit_removeCondition___block_invoke;
  v8[3] = &unk_1E4BD0660;
  v7 = v4;
  v9 = v7;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v8);

}

void __48__MapsSuggestionsActionCircuit_removeCondition___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)a2[6];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MapsSuggestionsActionCircuit_removeCondition___block_invoke_2;
  v7[3] = &unk_1E4BD06B0;
  v8 = *(id *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "MSg_copyIf:", v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[7];
  v4[7] = v5;

}

BOOL __48__MapsSuggestionsActionCircuit_removeCondition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

- (void)_q_sendStateForStep:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  __CFString *v13;
  id v14;
  id v15;
  id location;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  objc_msgSend((id)a1, "objectForJSON");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, (id)a1);
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__MapsSuggestionsActionCircuit__q_sendStateForStep___block_invoke;
  v12[3] = &unk_1E4BD06D8;
  objc_copyWeak(&v15, &location);
  v7 = (__CFString *)v3;
  v13 = v7;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v5, "callBlock:", v12);
  if (v7 == CFSTR("didAct"))
  {
    v9 = *(void **)(a1 + 32);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __52__MapsSuggestionsActionCircuit__q_sendStateForStep___block_invoke_35;
    v10[3] = &unk_1E4BD0700;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v9, "callBlock:", v10);
    objc_destroyWeak(&v11);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __60__MapsSuggestionsActionCircuit__q_startRunBecauseOfTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)*((_QWORD *)WeakRetained + 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__MapsSuggestionsActionCircuit__q_startRunBecauseOfTrigger___block_invoke_31;
    v10[3] = &unk_1E4BCE618;
    v8 = v7;
    objc_copyWeak(&v12, v4);
    v11 = v3;
    dispatch_async(v8, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsActionCircuit.mm";
      v15 = 1026;
      v16 = 241;
      v17 = 2082;
      v18 = "-[MapsSuggestionsActionCircuit _q_startRunBecauseOfTrigger:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __60__MapsSuggestionsActionCircuit__q_startRunBecauseOfTrigger___block_invoke_31(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v4 = (void *)WeakRetained[11];
    WeakRetained[11] = v3;

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:]((uint64_t)WeakRetained, CFSTR("didAct"));
    *((_BYTE *)WeakRetained + 96) = 0;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsActionCircuit.mm";
      v8 = 1026;
      v9 = 243;
      v10 = 2082;
      v11 = "-[MapsSuggestionsActionCircuit _q_startRunBecauseOfTrigger:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)triggerFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsActionCircuit uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} fired TRIGGER{%@}!", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MapsSuggestionsActionCircuit_triggerFired___block_invoke;
  v9[3] = &unk_1E4BD0660;
  v8 = v4;
  v10 = v8;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v9);

}

void __45__MapsSuggestionsActionCircuit_triggerFired___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[24];
  void *v43;
  id v44[12];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = *(id *)(a1 + 32);
  if (a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    objc_msgSend(v3, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(void **)(a2 + 72);
    *(_QWORD *)(a2 + 72) = v5;

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, CFSTR("didFireTrigger"));
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a2, "uniqueName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v8;
      v47 = 2080;
      v48 = "-[MapsSuggestionsActionCircuit _q_passedAllConditions]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{%@} %s", buf, 0x16u);

    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    v9 = *(void **)(a2 + 80);
    *(_QWORD *)(a2 + 80) = 0;

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, CFSTR("willCheckConditions"));
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Checking all Conditions...", buf, 2u);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v11 = *(id *)(a2 + 56);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isTrue", (_QWORD)v38) & 1) == 0)
          {
            GEOFindOrCreateLog();
            v28 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v15, "uniqueName");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v46 = v29;
              _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "RUNCONDITION{%@} failed", buf, 0xCu);

            }
            objc_msgSend(v15, "uniqueName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "copy");
            v32 = *(void **)(a2 + 80);
            *(_QWORD *)(a2 + 80) = v31;

            -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, CFSTR("didFailConditions"));
            GEOFindOrCreateLog();
            v33 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)a2, "uniqueName");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v42 = 138412290;
              *(_QWORD *)&v42[4] = v34;
              _os_log_impl(&dword_1A427D000, v33, OS_LOG_TYPE_DEBUG, "{%@} failed at least one Condition. Continuing sleep.", v42, 0xCu);

            }
            v35 = *(void **)(a2 + 72);
            *(_QWORD *)(a2 + 72) = 0;

            v36 = *(void **)(a2 + 80);
            *(_QWORD *)(a2 + 80) = 0;

            v37 = *(void **)(a2 + 88);
            *(_QWORD *)(a2 + 88) = 0;

            goto LABEL_26;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v12)
          continue;
        break;
      }
    }

    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Passed all Conditions!", buf, 2u);
    }

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, CFSTR("didPassConditions"));
    *(_BYTE *)(a2 + 96) = 1;
    GEOFindOrCreateLog();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a2, "uniqueName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138412290;
      *(_QWORD *)&v42[4] = v18;
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{%@} is allowed to run!", v42, 0xCu);

    }
    v19 = v3;
    GEOFindOrCreateLog();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a2, "uniqueName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138412802;
      *(_QWORD *)&v42[4] = v21;
      *(_WORD *)&v42[12] = 2080;
      *(_QWORD *)&v42[14] = "-[MapsSuggestionsActionCircuit _q_startRunBecauseOfTrigger:]";
      *(_WORD *)&v42[22] = 2112;
      v43 = v22;
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "{%@} %s %@", v42, 0x20u);

    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    objc_msgSend(v19, "uniqueName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    v25 = *(void **)(a2 + 72);
    *(_QWORD *)(a2 + 72) = v24;

    v26 = *(void **)(a2 + 88);
    *(_QWORD *)(a2 + 88) = 0;

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, CFSTR("willAct"));
    objc_initWeak((id *)&v38, (id)a2);
    v27 = *(void **)(a2 + 40);
    *(_QWORD *)v42 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v42[8] = 3221225472;
    *(_QWORD *)&v42[16] = __60__MapsSuggestionsActionCircuit__q_startRunBecauseOfTrigger___block_invoke;
    v43 = &unk_1E4BCF948;
    objc_copyWeak(v44, (id *)&v38);
    objc_msgSend(v27, "actWithHandler:", v42);
    objc_destroyWeak(v44);
    objc_destroyWeak((id *)&v38);

  }
LABEL_26:

}

- (NSString)uniqueName
{
  return (NSString *)self->_config.circuits;
}

- (id)nameForJSON
{
  return self->_config.circuits;
}

void __52__MapsSuggestionsActionCircuit__q_sendStateForStep___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v3, "actionCircuit:step:jsonDict:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsActionCircuit.mm";
      v8 = 1026;
      v9 = 318;
      v10 = 2082;
      v11 = "-[MapsSuggestionsActionCircuit _q_sendStateForStep:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __52__MapsSuggestionsActionCircuit__q_sendStateForStep___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "actionCircuitDidAct:", WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsActionCircuit.mm";
      v8 = 1026;
      v9 = 327;
      v10 = 2082;
      v11 = "-[MapsSuggestionsActionCircuit _q_sendStateForStep:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (id)objectForJSON
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__MapsSuggestionsActionCircuit_objectForJSON__block_invoke;
  v3[3] = &unk_1E4BCDE20;
  v3[4] = self;
  MSg::Queue::syncIfDifferent<NSDictionary<NSString *,objc_object  {objcproto22MapsSuggestionsAnyJSON}*> * {__strong}>((NSObject **)&self->_queue, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__MapsSuggestionsActionCircuit_objectForJSON__block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  NSDate *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  MSg *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _BYTE v49[128];
  void *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  v32 = (void *)objc_msgSend(v2[3], "copy");
  v33 = v2[4];
  v34 = v2[5];
  v42 = (void *)objc_msgSend(v2[6], "copy");
  v37 = (void *)objc_msgSend(v2[7], "copy");
  v3 = *(id **)(a1 + 32);
  v40 = (void *)objc_msgSend(v3[9], "copy");
  v39 = (void *)objc_msgSend(v3[10], "copy");
  v31 = (void *)objc_msgSend(v3[11], "copy");
  v47[0] = CFSTR("now");
  MapsSuggestionsNow();
  v35 = (MSg *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v35, v4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v36;
  v47[1] = CFSTR("triggers");
  v41 = v42;
  if (v41)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v41, "count"));
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = v41;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(v6);
          v10 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "nameForJSON");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v12;
            objc_msgSend(v11, "objectForJSON");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v51[0] = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v5, "addObject:", v14);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v7);
    }

    v38 = (void *)objc_msgSend(v5, "copy");
    v15 = v41;
  }
  else
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v48[1] = v38;
  v47[2] = CFSTR("conditions");
  v16 = v37;
  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v16, "count"));
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(v18);
          v22 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * j);
          v23 = v22;
          if (v22)
            objc_msgSend(v22, "objectForJSON");
          else
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "nameForJSON");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v25);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v19);
    }

    v26 = (void *)objc_msgSend(v17, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v48[2] = v26;
  v47[3] = CFSTR("firedTriggerName");
  MSg::jsonFor(v40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v27;
  v47[4] = CFSTR("failedConditionName");
  MSg::jsonFor(v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (NSString)description
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)awaitQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue._innerQueue, &__block_literal_global_24);
}

void __42__MapsSuggestionsActionCircuit_awaitQueue__block_invoke()
{
  NSLog(CFSTR("_queue ran"));
}

- (Queue)dispatchQueue
{
  _QWORD *v2;
  _QWORD *v4;
  NSString *v5;
  NSString *v6;
  Queue result;

  v4 = v2;
  *v2 = self->_dispatchQueue._innerQueue;
  v5 = self->_dispatchQueue._name;
  v4[1] = v5;
  result._name = v6;
  result._innerQueue = (OS_dispatch_queue *)v5;
  return result;
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 81) = 0u;
  return self;
}

@end
