@implementation MTCoreDuetMonitor

- (MTCoreDuetMonitor)initWithAlarmStorage:(id)a3
{
  id v5;
  MTCoreDuetMonitor *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  uint64_t v11;
  NSMutableDictionary *alarmStatesByAlarmID;
  uint64_t v13;
  NSMutableDictionary *alarmsByID;
  uint64_t v15;
  _CDClientContext *context;
  uint64_t v17;
  _DKKnowledgeStore *knowledgeStore;
  objc_super v20;
  uint8_t buf[4];
  MTCoreDuetMonitor *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTCoreDuetMonitor;
  v6 = -[MTCoreDuetMonitor init](&v20, sel_init);
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    objc_msgSend(v5, "registerObserver:", v6);
    objc_storeStrong((id *)&v6->_alarmStorage, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.mobiletimerd.MTCoreDuetMonitor", v8);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    alarmStatesByAlarmID = v6->_alarmStatesByAlarmID;
    v6->_alarmStatesByAlarmID = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    alarmsByID = v6->_alarmsByID;
    v6->_alarmsByID = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v15 = objc_claimAutoreleasedReturnValue();
    context = v6->_context;
    v6->_context = (_CDClientContext *)v15;

    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v17 = objc_claimAutoreleasedReturnValue();
    knowledgeStore = v6->_knowledgeStore;
    v6->_knowledgeStore = (_DKKnowledgeStore *)v17;

  }
  return v6;
}

- (void)handleSystemReady
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "alarmStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2048;
  v10 = objc_msgSend(v5, "count");
  OUTLINED_FUNCTION_6(&dword_19AC4E000, a2, v6, "[Triggers] %{public}@ handleSystemReadyWithAlarmStorage %lu alarms", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MTCoreDuetMonitor source:didAddAlarms:].cold.1();

  -[MTCoreDuetMonitor updateAlarmCaches:](self, "updateAlarmCaches:", v5);
  -[MTCoreDuetMonitor writeAlarmEventsToBiome:ofType:](self, "writeAlarmEventsToBiome:ofType:", v5, 3);

}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MTCoreDuetMonitor source:didUpdateAlarms:].cold.1();

  -[MTCoreDuetMonitor updateLastModifiedDateForAlarms:](self, "updateLastModifiedDateForAlarms:", v5);
  -[MTCoreDuetMonitor writeAlarmUpdatedEventForAlarms:](self, "writeAlarmUpdatedEventForAlarms:", v5);

}

- (void)source:(id)a3 didChangeNextAlarm:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MTCoreDuetMonitor source:didChangeNextAlarm:].cold.1();

  -[MTCoreDuetMonitor updateStateForNextAlarm:](self, "updateStateForNextAlarm:", v5);
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  MTCoreDuetMonitor *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEBUG, "[Triggers] %{public}@ didSnoozeAlarm: %{public}@, snoozeAction: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_INFO, "[Triggers] %{public}@ Telling context store and knowledge store that alarm (%{public}@) has snoozed", (uint8_t *)&v12, 0x16u);
  }

  if (a5 == 1)
    v10 = 8;
  else
    v10 = 7;
  -[MTCoreDuetMonitor updateStateForAlarm:alarmEvent:](self, "updateStateForAlarm:alarmEvent:", v7, v10);
  -[MTCoreDuetMonitor writeAlarmToKnowledgeStore:alarmEvent:](self, "writeAlarmToKnowledgeStore:alarmEvent:", v7, v10);
  -[MTCoreDuetMonitor writeAlarmEventToBiome:ofType:](self, "writeAlarmEventToBiome:ofType:", v7, 2);

}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  MTCoreDuetMonitor *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = self;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEBUG, "[Triggers] %{public}@ didDismissAlarm: %{public}@, dismissAction: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_INFO, "[Triggers] %{public}@ Telling context store and knowledge store that alarm (%{public}@) has been dismissed", (uint8_t *)&v13, 0x16u);
  }

  if (a5 < 0xC && ((0xCE7u >> a5) & 1) != 0)
  {
    v11 = qword_19ACFEE20[a5];
    -[MTCoreDuetMonitor updateStateForAlarm:alarmEvent:](self, "updateStateForAlarm:alarmEvent:", v7, v11);
    -[MTCoreDuetMonitor writeAlarmToKnowledgeStore:alarmEvent:](self, "writeAlarmToKnowledgeStore:alarmEvent:", v7, v11);
    -[MTCoreDuetMonitor writeAlarmEventToBiome:ofType:](self, "writeAlarmEventToBiome:ofType:", v7, 1);
  }
  else
  {
    MTLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MTCoreDuetMonitor source:didDismissAlarm:dismissAction:].cold.1((uint64_t)self, a5, v10);

  }
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  MTCoreDuetMonitor *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = self;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEBUG, "[Triggers] %{public}@ didFireAlarm: %{public}@, triggerType: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_INFO, "[Triggers] %{public}@ Telling context store and knowledge store that alarm (%{public}@) has fired", (uint8_t *)&v13, 0x16u);
  }

  if (a5 >= 6)
  {
    MTLogForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[MTCoreDuetMonitor source:didFireAlarm:triggerType:].cold.1((uint64_t)self, a5, v11);

  }
  else
  {
    v10 = qword_19ACFEE80[a5];
    -[MTCoreDuetMonitor updateStateForAlarm:alarmEvent:](self, "updateStateForAlarm:alarmEvent:", v7, v10);
    -[MTCoreDuetMonitor writeAlarmToKnowledgeStore:alarmEvent:](self, "writeAlarmToKnowledgeStore:alarmEvent:", v7, v10);
    -[MTCoreDuetMonitor writeAlarmEventToBiome:ofType:](self, "writeAlarmEventToBiome:ofType:", v7, 0);
  }

}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MTCoreDuetMonitor *v11;

  v5 = a4;
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MTCoreDuetMonitor source:didRemoveAlarms:].cold.1();

  -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__MTCoreDuetMonitor_source_didRemoveAlarms___block_invoke;
  v9[3] = &unk_1E39CB7B0;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_async(v7, v9);

}

uint64_t __44__MTCoreDuetMonitor_source_didRemoveAlarms___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "alarmStatesByAlarmID", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alarmID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v9);

        objc_msgSend(*(id *)(a1 + 40), "alarmsByID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alarmID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObjectForKey:", v11);

        objc_msgSend(*(id *)(a1 + 40), "writeAlarmEventToBiome:ofType:", v7, 5);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_writeCurrentStateToContextStore");
}

- (void)updateStateForAlarm:(id)a3 alarmEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  if (v6)
  {
    -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MTCoreDuetMonitor_updateStateForAlarm_alarmEvent___block_invoke;
    block[3] = &unk_1E39CBA08;
    block[4] = self;
    v9 = v6;
    v10 = a4;
    dispatch_async(v7, block);

  }
}

uint64_t __52__MTCoreDuetMonitor_updateStateForAlarm_alarmEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  MTDictionaryRepresentationOfAlarm(*(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alarmStatesByAlarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 32), "_queue_writeCurrentStateToContextStore");
}

- (void)updateAlarmCaches:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MTCoreDuetMonitor *v9;

  v4 = a3;
  -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__MTCoreDuetMonitor_updateAlarmCaches___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__MTCoreDuetMonitor_updateAlarmCaches___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        MTDictionaryRepresentationOfAlarm(v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "alarmStatesByAlarmID", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alarmID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        v12 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(v7, "alarmID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, v13);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_writeCurrentStateToContextStore");
}

- (void)updateLastModifiedDateForAlarms:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MTCoreDuetMonitor *v9;

  v4 = a3;
  -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__MTCoreDuetMonitor_updateLastModifiedDateForAlarms___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__MTCoreDuetMonitor_updateLastModifiedDateForAlarms___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "alarmStatesByAlarmID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alarmID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        objc_msgSend(v7, "lastModifiedDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v1;
        }
        objc_msgSend(MEMORY[0x1E0D15C58], "modifiedDateKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setValue:forKey:", v13, v14);

        if (!v12)
        objc_msgSend(*(id *)(a1 + 40), "alarmStatesByAlarmID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alarmID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v16);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_writeCurrentStateToContextStore");
}

- (void)updateStateForNextAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MTCoreDuetMonitor_updateStateForNextAlarm___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __45__MTCoreDuetMonitor_updateStateForNextAlarm___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_writeNextAlarmStateToContextStore:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_writeCurrentStateToContextStore
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForCurrentAlarms");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MTCoreDuetMonitor alarmStatesByAlarmID](self, "alarmStatesByAlarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

- (void)_queue_writeNextAlarmStateToContextStore:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = 0x1E0D15000uLL;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0D15C58], "alarmIDKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v18;
    objc_msgSend(v7, "alarmID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0D15C58], "modifiedDateKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v9;
    objc_msgSend(v7, "lastModifiedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20[1] = v11;
    objc_msgSend(MEMORY[0x1E0D15C58], "expectedFireDateKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(v7, "nextFireDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)

    if (!v10)
    v6 = 0x1E0D15000;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(*(id *)(v6 + 3160), "keyPathForNextAlarm");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v16);

}

- (void)writeAlarmToKnowledgeStore:(id)a3 alarmEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  if (a4 <= 7 && ((1 << a4) & 0xA6) != 0)
  {
    -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MTCoreDuetMonitor_writeAlarmToKnowledgeStore_alarmEvent___block_invoke;
    block[3] = &unk_1E39CBA08;
    v10 = a4;
    block[4] = self;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

void __59__MTCoreDuetMonitor_writeAlarmToKnowledgeStore_alarmEvent___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  switch(a1[6])
  {
    case 1:
    case 2:
      v1 = (void *)a1[4];
      v2 = a1[5];
      objc_msgSend(MEMORY[0x1E0D15970], "firing");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 5:
      v1 = (void *)a1[4];
      v2 = a1[5];
      objc_msgSend(MEMORY[0x1E0D15970], "stopped");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 7:
      v1 = (void *)a1[4];
      v2 = a1[5];
      objc_msgSend(MEMORY[0x1E0D15970], "snoozed");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v4 = (id)v3;
      objc_msgSend(v1, "_queue_writeAlarmToKnowledgeStore:category:", v2);

      break;
    default:
      return;
  }
}

- (void)_queue_writeAlarmToKnowledgeStore:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "alarmStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoreDuetMonitor metadataForAlarm:](self, "metadataForAlarm:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D159F8], "eventWithStream:startDate:endDate:value:metadata:", v10, v9, v9, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTCoreDuetMonitor knowledgeStore](self, "knowledgeStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v13, "saveObjects:error:", v14, &v17);
  v15 = v17;

  if (v15)
  {
    MTLogForCategory(3);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MTCoreDuetMonitor _queue_writeAlarmToKnowledgeStore:category:].cold.1();

  }
}

- (id)metadataForAlarm:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", 2);
  objc_msgSend(v4, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15968], "alarmID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v4, "isSleepAlarm");

  objc_msgSend(v9, "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15968], "isSleep");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, v12);

  return v5;
}

- (void)writeAlarmUpdatedEventForAlarms:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MTCoreDuetMonitor *v9;

  v4 = a3;
  -[MTCoreDuetMonitor serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__MTCoreDuetMonitor_writeAlarmUpdatedEventForAlarms___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__MTCoreDuetMonitor_writeAlarmUpdatedEventForAlarms___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  id obj;
  uint8_t v23;
  _BYTE v24[7];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v26;
    v21 = v24;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        objc_msgSend(v6, "alarmID", v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:", v9, v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmLastModifiedDate")))
          {
            if (objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmEnabled")))
            {
              MTLogForCategory(3);
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v6, "alarmID");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v30 = v12;
                _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_INFO, "[Triggers writeAlarmUpdatedEventForAlarms] set isEnableDisableModification for alarm %@", buf, 0xCu);

              }
              v13 = 1;
            }
            else
            {
              v13 = 0;
            }
            if ((objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmHour")) & 1) != 0
              || objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmMinute")))
            {
              MTLogForCategory(3);
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v6, "alarmID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v30 = v17;
                _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_INFO, "[Triggers writeAlarmUpdatedEventForAlarms] set isTimeDifferenceModification for alarm %@", buf, 0xCu);

              }
LABEL_26:
              objc_msgSend(*(id *)(a1 + 40), "writeAlarmEventToBiome:ofType:", v6, 4);
              goto LABEL_27;
            }
          }
          else
          {
            v13 = 0;
          }

          if (v13)
            goto LABEL_26;
        }
        else
        {
          MTLogForCategory(3);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            __53__MTCoreDuetMonitor_writeAlarmUpdatedEventForAlarms___block_invoke_cold_1(&v23, v21, v14);

        }
        MTLogForCategory(3);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_INFO, "[Triggers writeAlarmUpdatedEventForAlarms] isTimeDifferenceModification and isEnableDisableModification are false", buf, 2u);
        }

LABEL_27:
        v18 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        v19 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(v6, "alarmID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v19, v20);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v3);
  }

}

- (void)writeAlarmEventToBiome:(id)a3 ofType:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (+[MTDeviceListener hasBeenUnlockedSinceBoot](MTDeviceListener, "hasBeenUnlockedSinceBoot"))
  {
    objc_msgSend(MEMORY[0x1E0D027B8], "alarmStream");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D025C0]);
    objc_msgSend(v5, "alarmID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithEventType:alarmID:isSleepAlarm:", a4, v8, objc_msgSend(v5, "isSleepAlarm"));

    -[NSObject source](v6, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendEvent:", v9);

  }
  else
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[MTCoreDuetMonitor writeAlarmEventToBiome:ofType:].cold.1(a4);
  }

}

- (void)writeAlarmEventsToBiome:(id)a3 ofType:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[MTDeviceListener hasBeenUnlockedSinceBoot](MTDeviceListener, "hasBeenUnlockedSinceBoot"))
  {
    objc_msgSend(MEMORY[0x1E0D027B8], "alarmStream");
    v6 = objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = objc_alloc(MEMORY[0x1E0D025C0]);
          objc_msgSend(v12, "alarmID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithEventType:alarmID:isSleepAlarm:", a4, v14, objc_msgSend(v12, "isSleepAlarm"));

          -[NSObject source](v6, "source");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sendEvent:", v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v5 = v17;
  }
  else
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[MTCoreDuetMonitor writeAlarmEventToBiome:ofType:].cold.1(a4);
  }

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (NSMutableDictionary)alarmStatesByAlarmID
{
  return self->_alarmStatesByAlarmID;
}

- (NSMutableDictionary)alarmsByID
{
  return self->_alarmsByID;
}

- (_CDClientContext)context
{
  return self->_context;
}

- (_DKKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_alarmStatesByAlarmID, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)source:didAddAlarms:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_19AC4E000, v0, (uint64_t)v0, "[Triggers] %{public}@ didAddAlarms: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)source:didUpdateAlarms:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_19AC4E000, v0, (uint64_t)v0, "[Triggers] %{public}@ didUpdateAlarms: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)source:didChangeNextAlarm:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_19AC4E000, v0, (uint64_t)v0, "[Triggers] %{public}@ didChangeNextAlarm: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)source:(uint64_t)a1 didDismissAlarm:(uint64_t)a2 dismissAction:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_19AC4E000, a3, v5, "[Triggers] %{public}@ Ignoring dismissAction (%{public}@)", v6);

  OUTLINED_FUNCTION_7();
}

- (void)source:(uint64_t)a1 didFireAlarm:(uint64_t)a2 triggerType:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_19AC4E000, a3, v5, "[Triggers] %{public}@ Ignoring triggerType (%{public}@)", v6);

  OUTLINED_FUNCTION_7();
}

- (void)source:didRemoveAlarms:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_19AC4E000, v0, (uint64_t)v0, "[Triggers] %{public}@ didRemoveAlarms: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_writeAlarmToKnowledgeStore:category:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_19AC4E000, v0, OS_LOG_TYPE_ERROR, "%{public}@ could not save objects to knowledge store with error: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __53__MTCoreDuetMonitor_writeAlarmUpdatedEventForAlarms___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_7_0(&dword_19AC4E000, a3, (uint64_t)a3, "[Triggers writeAlarmUpdatedEventForAlarms] could not find old alarm", a1);
}

- (void)writeAlarmEventToBiome:(uint64_t)a1 ofType:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1(&dword_19AC4E000, v2, v3, "Did NOT save alarm biome event of type: %@ because device is class c locked", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_2();
}

@end
