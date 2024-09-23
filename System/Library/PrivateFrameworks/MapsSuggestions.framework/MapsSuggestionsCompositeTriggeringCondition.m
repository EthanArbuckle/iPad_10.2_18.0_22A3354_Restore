@implementation MapsSuggestionsCompositeTriggeringCondition

- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5 triggers:(id)a6 conditions:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  MapsSuggestionsCompositeTriggeringCondition *v15;
  MapsSuggestionsCompositeTriggeringCondition *v16;
  void *v17;
  NSObject *v18;
  OS_dispatch_queue *innerQueue;
  NSString *v20;
  NSString *name;
  uint64_t v22;
  NSArray *triggers;
  uint64_t v24;
  NSArray *conditions;
  NSObject *v27;
  NSString *v28;
  objc_super v29;

  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MapsSuggestionsCompositeTriggeringCondition;
  v15 = -[MapsSuggestionsTriggeringToggle initWithName:startState:behavior:](&v29, sel_initWithName_startState_behavior_, v12, v10, a5);
  v16 = v15;
  if (v15)
  {
    -[MapsSuggestionsBaseTrigger dispatchQueue](v15, "dispatchQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue(&v27, v17);
    v18 = v27;
    v27 = 0;
    innerQueue = v16->_queue._innerQueue;
    v16->_queue._innerQueue = (OS_dispatch_queue *)v18;

    v20 = v28;
    v28 = 0;
    name = v16->_queue._name;
    v16->_queue._name = v20;

    v22 = objc_msgSend(v13, "copy");
    triggers = v16->_triggers;
    v16->_triggers = (NSArray *)v22;

    v24 = objc_msgSend(v14, "copy");
    conditions = v16->_conditions;
    v16->_conditions = (NSArray *)v24;

  }
  return v16;
}

- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 triggers:(id)a5 conditions:(id)a6
{
  return -[MapsSuggestionsCompositeTriggeringCondition initWithName:startState:behavior:triggers:conditions:](self, "initWithName:startState:behavior:triggers:conditions:", a3, a4, 3, a5, a6);
}

- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5
{
  return -[MapsSuggestionsCompositeTriggeringCondition initWithName:startState:behavior:triggers:conditions:](self, "initWithName:startState:behavior:triggers:conditions:", a3, a4, a5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4
{
  return -[MapsSuggestionsCompositeTriggeringCondition initWithName:startState:behavior:](self, "initWithName:startState:behavior:", a3, a4, 3);
}

- (void)addConditions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
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
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__MapsSuggestionsCompositeTriggeringCondition_addConditions___block_invoke;
    v7[3] = &unk_1E4BCF9B8;
    v7[4] = self;
    v8 = v4;
    dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, v7);

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeTriggeringCondition.mm";
      v11 = 1024;
      v12 = 78;
      v13 = 2082;
      v14 = "-[MapsSuggestionsCompositeTriggeringCondition addConditions:]";
      v15 = 2082;
      v16 = "nil == (conditions)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires conditions", buf, 0x26u);
    }

  }
}

void __61__MapsSuggestionsCompositeTriggeringCondition_addConditions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

- (void)addCondition:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsCompositeTriggeringCondition addConditions:](self, "addConditions:", v5);

}

- (void)addTriggers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
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
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__MapsSuggestionsCompositeTriggeringCondition_addTriggers___block_invoke;
    v7[3] = &unk_1E4BCF9E0;
    v7[4] = self;
    v8 = v4;
    MSg::Queue::async<MapsSuggestionsCompositeTriggeringCondition>((NSObject **)&self->_queue, self, v7);

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeTriggeringCondition.mm";
      v11 = 1024;
      v12 = 92;
      v13 = 2082;
      v14 = "-[MapsSuggestionsCompositeTriggeringCondition addTriggers:]";
      v15 = 2082;
      v16 = "nil == (triggers)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires triggers", buf, 0x26u);
    }

  }
}

void __59__MapsSuggestionsCompositeTriggeringCondition_addTriggers___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[9];
  v3[9] = v4;

  if (objc_msgSend(v3, "hasObservers"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE71A890, (_QWORD)v13) & 1) == 0)
          {
            GEOFindOrCreateLog();
            v11 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v10, "uniqueName");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136447234;
              v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeTriggeringCondition.mm";
              v19 = 1024;
              v20 = 99;
              v21 = 2082;
              v22 = "-[MapsSuggestionsCompositeTriggeringCondition addTriggers:]_block_invoke";
              v23 = 2082;
              v24 = "! [trigger conformsToProtocol:@protocol(MapsSuggestionsTrigger)]";
              v25 = 2112;
              v26 = v12;
              _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. %@ is not a Trigger", buf, 0x30u);

            }
            goto LABEL_14;
          }
          objc_msgSend(v10, "registerObserver:", v3);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v27, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)addTrigger:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsCompositeTriggeringCondition addTriggers:](self, "addTriggers:", v5);

}

- (void)didAddFirstObserver
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[MapsSuggestionsCompositeTriggeringCondition didAddFirstObserver]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue._innerQueue);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = self->_triggers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "registerObserver:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)didRemoveLastObserver
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[MapsSuggestionsCompositeTriggeringCondition didRemoveLastObserver]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue._innerQueue);
  -[MapsSuggestionsCompositeTriggeringCondition _q_unsubscribeAll]((uint64_t)self);
}

- (void)_q_unsubscribeAll
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v2 = *(id *)(a1 + 72);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "unregisterObserver:", a1, (_QWORD)v6);
        }
        while (v3 != v5);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[MapsSuggestionsCompositeTriggeringCondition dealloc]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[MapsSuggestionsCompositeTriggeringCondition _q_unsubscribeAll]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsCompositeTriggeringCondition;
  -[MapsSuggestionsCompositeTriggeringCondition dealloc](&v4, sel_dealloc);
}

- (void)triggerFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v9 = "-[MapsSuggestionsCompositeTriggeringCondition triggerFired:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "%s: Trigger{%@}", buf, 0x16u);

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MapsSuggestionsCompositeTriggeringCondition_triggerFired___block_invoke;
  v7[3] = &unk_1E4BCFA08;
  v7[4] = self;
  MSg::Queue::async<MapsSuggestionsCompositeTriggeringCondition>((NSObject **)&self->_queue, self, v7);

}

void __60__MapsSuggestionsCompositeTriggeringCondition_triggerFired___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[4];
  void *v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "BOOL _passedConditions(NSArray<id<MapsSuggestionsCondition>> *__strong)";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, buf, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "isTrue", (_QWORD)v17) & 1) == 0)
        {
          GEOFindOrCreateLog();
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "nameForJSON");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v21 = 138412290;
            v22 = v14;
            _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "Condition{%@} said NO", v21, 0xCu);

          }
          v12 = 0;
          v11 = v6;
          goto LABEL_17;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, buf, 16);
      if (v7)
        continue;
      break;
    }
  }

  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "All Conditions passed", v21, 2u);
  }
  v12 = 1;
LABEL_17:

  objc_msgSend(v3, "setState:", v12);
  GEOFindOrCreateLog();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromMapsSuggestionsJSON(v3, 0);
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v16;
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "Internal state: %@", buf, 0xCu);

  }
}

- (BOOL)isTrue
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[4];
  void *v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__MapsSuggestionsCompositeTriggeringCondition_isTrue__block_invoke;
  v14[3] = &unk_1E4BCE848;
  v14[4] = self;
  v14[5] = &v15;
  MSg::Queue::syncIfDifferent((NSObject **)&self->_queue, v14);
  v2 = (id)v16[5];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "BOOL _passedConditions(NSArray<id<MapsSuggestionsCondition>> *__strong)";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v2;
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        v8 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isTrue") & 1) == 0)
        {
          GEOFindOrCreateLog();
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v8, "nameForJSON");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v25 = 138412290;
            v26 = v12;
            _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Condition{%@} said NO", v25, 0xCu);

          }
          v10 = 0;
          v9 = v4;
          goto LABEL_17;
        }

      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
      if (v5)
        continue;
      break;
    }
  }

  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "All Conditions passed", v25, 2u);
  }
  v10 = 1;
LABEL_17:

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __53__MapsSuggestionsCompositeTriggeringCondition_isTrue__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (id)objectForJSON
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__MapsSuggestionsCompositeTriggeringCondition_objectForJSON__block_invoke;
  v14[3] = &unk_1E4BCE848;
  v14[4] = self;
  v14[5] = &v15;
  MSg::Queue::syncIfDifferent((NSObject **)&self->_queue, v14);
  v2 = (id)v16[5];
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v4);
          v8 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v9 = v8;
          if (v8)
            objc_msgSend(v8, "objectForJSON");
          else
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "nameForJSON");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v5);
    }

    v12 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __60__MapsSuggestionsCompositeTriggeringCondition_objectForJSON__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void).cxx_destruct
{
  MapsSuggestionsCompositeTriggeringCondition *v2;

  v2 = self;
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&v2->_triggers, 0);
  v2 = (MapsSuggestionsCompositeTriggeringCondition *)((char *)v2 + 56);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
