@implementation MapsSuggestionsCircuitBoard

- (MapsSuggestionsCircuitBoard)init
{
  MapsSuggestionsCircuitBoard *v2;
  void *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *innerQueue;
  NSString *v6;
  NSString *name;
  NSArray *v8;
  NSArray *circuits;
  NSArray *v10;
  NSArray *triggers;
  NSArray *v12;
  NSArray *conditions;
  dispatch_queue_t v15;
  NSString *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsCircuitBoard;
  v2 = -[MapsSuggestionsCircuitBoard init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue(&v15, CFSTR("MapsSuggestionsCircuitBoardQueue"), v3);
    v4 = v15;
    v15 = 0;
    innerQueue = v2->_queue._innerQueue;
    v2->_queue._innerQueue = (OS_dispatch_queue *)v4;

    v6 = v16;
    v16 = 0;
    name = v2->_queue._name;
    v2->_queue._name = v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    circuits = v2->_config.circuits;
    v2->_config.circuits = v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    triggers = v2->_config.triggers;
    v2->_config.triggers = v10;

    v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    conditions = v2->_config.conditions;
    v2->_config.conditions = v12;

  }
  return v2;
}

- (id)addTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__MapsSuggestionsCircuitBoard_addTrigger___block_invoke;
    v10[3] = &unk_1E4BCFC60;
    v6 = v4;
    v11 = v6;
    MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);
    v7 = v6;

  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v14 = 1024;
      v15 = 51;
      v16 = 2082;
      v17 = "-[MapsSuggestionsCircuitBoard addTrigger:]";
      v18 = 2082;
      v19 = "nil == (trigger)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a trigger", buf, 0x26u);
    }

  }
  return v5;
}

void __42__MapsSuggestionsCircuitBoard_addTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5[4], "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v5[4];
  v5[4] = (id)v3;

}

- (id)addCondition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__MapsSuggestionsCircuitBoard_addCondition___block_invoke;
    v10[3] = &unk_1E4BCFC60;
    v6 = v4;
    v11 = v6;
    MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);
    v7 = v6;

  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v14 = 1024;
      v15 = 60;
      v16 = 2082;
      v17 = "-[MapsSuggestionsCircuitBoard addCondition:]";
      v18 = 2082;
      v19 = "nil == (condition)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition", buf, 0x26u);
    }

  }
  return v5;
}

void __44__MapsSuggestionsCircuitBoard_addCondition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5[5], "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v5[5];
  v5[5] = (id)v3;

}

- (id)addCircuit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__MapsSuggestionsCircuitBoard_addCircuit___block_invoke;
    v10[3] = &unk_1E4BCFC60;
    v6 = v4;
    v11 = v6;
    MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);
    v7 = v6;

  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v14 = 1024;
      v15 = 69;
      v16 = 2082;
      v17 = "-[MapsSuggestionsCircuitBoard addCircuit:]";
      v18 = 2082;
      v19 = "nil == (circuit)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit", buf, 0x26u);
    }

  }
  return v5;
}

void __42__MapsSuggestionsCircuitBoard_addCircuit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5[3], "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v5[3];
  v5[3] = (id)v3;

}

- (id)addAction:(id)a3
{
  id v4;
  MapsSuggestionsActionCircuit *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[MapsSuggestionsActionCircuit initWithAction:]([MapsSuggestionsActionCircuit alloc], "initWithAction:", v4);
    -[MapsSuggestionsCircuitBoard addCircuit:](self, "addCircuit:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v11 = 1024;
      v12 = 78;
      v13 = 2082;
      v14 = "-[MapsSuggestionsCircuitBoard addAction:]";
      v15 = 2082;
      v16 = "nil == (action)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an action", (uint8_t *)&v9, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

- (void)connectTrigger:(id)a3 toCircuit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v15 = 1024;
      v16 = 85;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCircuitBoard connectTrigger:toCircuit:]";
      v19 = 2082;
      v20 = "nil == (trigger)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a trigger", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v15 = 1024;
      v16 = 86;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCircuitBoard connectTrigger:toCircuit:]";
      v19 = 2082;
      v20 = "nil == (circuit)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit", buf, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__MapsSuggestionsCircuitBoard_connectTrigger_toCircuit___block_invoke;
  v10[3] = &unk_1E4BCFC88;
  v11 = v7;
  v12 = v6;
  MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);

LABEL_10:
}

void __56__MapsSuggestionsCircuitBoard_connectTrigger_toCircuit___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3[3], "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v8 = 1024;
      v9 = 88;
      v10 = 2082;
      v11 = "-[MapsSuggestionsCircuitBoard connectTrigger:toCircuit:]_block_invoke";
      v12 = 2082;
      v13 = "! [strongSelf->_config.circuits containsObject:circuit]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that circuit";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v3[4], "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v8 = 1024;
      v9 = 89;
      v10 = 2082;
      v11 = "-[MapsSuggestionsCircuitBoard connectTrigger:toCircuit:]_block_invoke";
      v12 = 2082;
      v13 = "! [strongSelf->_config.triggers containsObject:trigger]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that trigger";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "addTrigger:", *(_QWORD *)(a1 + 40));
LABEL_10:

}

- (void)connectCondition:(id)a3 toCircuit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v15 = 1024;
      v16 = 97;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCircuitBoard connectCondition:toCircuit:]";
      v19 = 2082;
      v20 = "nil == (condition)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v15 = 1024;
      v16 = 98;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCircuitBoard connectCondition:toCircuit:]";
      v19 = 2082;
      v20 = "nil == (circuit)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit", buf, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__MapsSuggestionsCircuitBoard_connectCondition_toCircuit___block_invoke;
  v10[3] = &unk_1E4BCFC88;
  v11 = v7;
  v12 = v6;
  MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);

LABEL_10:
}

void __58__MapsSuggestionsCircuitBoard_connectCondition_toCircuit___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3[3], "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v8 = 1024;
      v9 = 100;
      v10 = 2082;
      v11 = "-[MapsSuggestionsCircuitBoard connectCondition:toCircuit:]_block_invoke";
      v12 = 2082;
      v13 = "! [strongSelf->_config.circuits containsObject:circuit]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that circuit";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v3[5], "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v8 = 1024;
      v9 = 101;
      v10 = 2082;
      v11 = "-[MapsSuggestionsCircuitBoard connectCondition:toCircuit:]_block_invoke";
      v12 = 2082;
      v13 = "! [strongSelf->_config.conditions containsObject:condition]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that condition";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "addCondition:", *(_QWORD *)(a1 + 40));
LABEL_10:

}

- (void)disconnectTrigger:(id)a3 fromCircuit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v15 = 1024;
      v16 = 109;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCircuitBoard disconnectTrigger:fromCircuit:]";
      v19 = 2082;
      v20 = "nil == (trigger)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a trigger", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v15 = 1024;
      v16 = 110;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCircuitBoard disconnectTrigger:fromCircuit:]";
      v19 = 2082;
      v20 = "nil == (circuit)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit", buf, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__MapsSuggestionsCircuitBoard_disconnectTrigger_fromCircuit___block_invoke;
  v10[3] = &unk_1E4BCFC88;
  v11 = v7;
  v12 = v6;
  MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);

LABEL_10:
}

void __61__MapsSuggestionsCircuitBoard_disconnectTrigger_fromCircuit___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3[3], "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v8 = 1024;
      v9 = 112;
      v10 = 2082;
      v11 = "-[MapsSuggestionsCircuitBoard disconnectTrigger:fromCircuit:]_block_invoke";
      v12 = 2082;
      v13 = "! [strongSelf->_config.circuits containsObject:circuit]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that circuit";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v3[4], "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v8 = 1024;
      v9 = 113;
      v10 = 2082;
      v11 = "-[MapsSuggestionsCircuitBoard disconnectTrigger:fromCircuit:]_block_invoke";
      v12 = 2082;
      v13 = "! [strongSelf->_config.triggers containsObject:trigger]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that trigger";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "removeTrigger:", *(_QWORD *)(a1 + 40));
LABEL_10:

}

- (void)disconnectCondition:(id)a3 fromCircuit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v15 = 1024;
      v16 = 121;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCircuitBoard disconnectCondition:fromCircuit:]";
      v19 = 2082;
      v20 = "nil == (condition)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v15 = 1024;
      v16 = 122;
      v17 = 2082;
      v18 = "-[MapsSuggestionsCircuitBoard disconnectCondition:fromCircuit:]";
      v19 = 2082;
      v20 = "nil == (circuit)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit", buf, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__MapsSuggestionsCircuitBoard_disconnectCondition_fromCircuit___block_invoke;
  v10[3] = &unk_1E4BCFC88;
  v11 = v7;
  v12 = v6;
  MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);

LABEL_10:
}

void __63__MapsSuggestionsCircuitBoard_disconnectCondition_fromCircuit___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3[3], "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v8 = 1024;
      v9 = 124;
      v10 = 2082;
      v11 = "-[MapsSuggestionsCircuitBoard disconnectCondition:fromCircuit:]_block_invoke";
      v12 = 2082;
      v13 = "[strongSelf->_config.circuits containsObject:circuit]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that circuit";
LABEL_7:
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x26u);
    }
  }
  else
  {
    if (!objc_msgSend(v3[5], "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeCondition:", *(_QWORD *)(a1 + 40));
      goto LABEL_10;
    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      v8 = 1024;
      v9 = 125;
      v10 = 2082;
      v11 = "-[MapsSuggestionsCircuitBoard disconnectCondition:fromCircuit:]_block_invoke";
      v12 = 2082;
      v13 = "[strongSelf->_config.conditions containsObject:condition]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that condition";
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (id)objectForJSON
{
  id result;

  result = (id)-[MapsSuggestionsCircuitBoard doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (id)uniqueName
{
  return (id)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)awaitQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue._innerQueue, &__block_literal_global_17);
}

void __41__MapsSuggestionsCircuitBoard_awaitQueue__block_invoke()
{
  NSLog(CFSTR("_queue ran"));
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
