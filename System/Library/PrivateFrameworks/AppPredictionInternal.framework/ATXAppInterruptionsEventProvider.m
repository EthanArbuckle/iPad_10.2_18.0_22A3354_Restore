@implementation ATXAppInterruptionsEventProvider

- (ATXAppInterruptionsEventProvider)initWithModeEventProvider:(id)a3
{
  id v5;
  ATXAppInterruptionsEventProvider *v6;
  ATXAppInterruptionsEventProvider *v7;
  uint64_t v8;
  ATXInterruptedAppSessionAccumulator *globalInterruptedAppSessionsAccumulator;
  uint64_t v10;
  ATXInterruptedAppSessionAccumulator *modeInterruptedAppSessionsAccumulator;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXAppInterruptionsEventProvider;
  v6 = -[ATXAppInterruptionsEventProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modeEventProvider, a3);
    v8 = objc_opt_new();
    globalInterruptedAppSessionsAccumulator = v7->_globalInterruptedAppSessionsAccumulator;
    v7->_globalInterruptedAppSessionsAccumulator = (ATXInterruptedAppSessionAccumulator *)v8;

    v10 = objc_opt_new();
    modeInterruptedAppSessionsAccumulator = v7->_modeInterruptedAppSessionsAccumulator;
    v7->_modeInterruptedAppSessionsAccumulator = (ATXInterruptedAppSessionAccumulator *)v10;

  }
  return v7;
}

- (BOOL)successfullyCalculatedAppSessionInterruptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLaunchesSinceDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "publisherFromStartTime:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stripStoreEvent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_modeEventProvider, "biomePublisherWithBookmark:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v11;
  v32[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke;
  v31[3] = &unk_1E82DBFF8;
  v31[4] = self;
  objc_msgSend(v12, "orderedMergeWithOthers:comparator:", v13, v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x3032000000;
  v29[2] = __Block_byref_object_copy__92;
  v29[3] = __Block_byref_object_dispose__92;
  v30 = 0;
  v26[4] = self;
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_13;
  v27[3] = &unk_1E82DB658;
  v27[4] = &v28;
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_2;
  v26[3] = &unk_1E82E7F50;
  v16 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", v27, v26);
  v17 = *(_QWORD *)(v29[0] + 40);
  if (v17)
  {
    __atxlog_handle_modes();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXAppInterruptionsEventProvider successfullyCalculatedAppSessionInterruptions].cold.1((uint64_t)v29, v18, v19, v20, v21, v22, v23, v24);

  }
  _Block_object_dispose(&v28, 8);

  return v17 == 0;
}

uint64_t __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateIntervalFromEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromNotificationEvent:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromAppLaunchEvent:", v5);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateIntervalFromEvent:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromNotificationEvent:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromAppLaunchEvent:", v6);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v18;

  }
  if (v9)
  {
    if (v15)
      goto LABEL_22;
    goto LABEL_19;
  }
  __atxlog_handle_modes();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_cold_1((uint64_t)v5, v19, v20, v21, v22, v23, v24, v25);

  if (!v15)
  {
LABEL_19:
    __atxlog_handle_modes();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_cold_1((uint64_t)v6, v26, v27, v28, v29, v30, v31, v32);

  }
LABEL_22:
  objc_msgSend(v9, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeIntervalSinceReferenceDate");
  v35 = v34;

  objc_msgSend(v15, "startDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "timeIntervalSinceReferenceDate");
  v38 = v37;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v39, "compare:", v40);

  return v41;
}

void __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aggregationEventsFromEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "trackNewModeEvent:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      objc_msgSend(*(id *)(a1 + 32), "trackAppSessionInterruption:", v3);
  }

}

- (id)dateIntervalFromNotificationEvent:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99D68];
    v5 = v3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "timestamp");
    v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    v8 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "timestamp");
    v10 = v9;

    v11 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:", v10);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)dateIntervalFromAppLaunchEvent:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3588];
    v5 = v3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)trackNewModeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentModeEvent, a3);
}

- (void)trackAppSessionInterruption:(id)a3
{
  ATXInterruptedAppSessionAccumulator *globalInterruptedAppSessionsAccumulator;
  void *v5;
  ATXInterruptedAppSessionAccumulator *modeInterruptedAppSessionsAccumulator;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ATXInterruptedAppSessionAccumulator handleNotificationEvent:](self->_globalInterruptedAppSessionsAccumulator, "handleNotificationEvent:", v8);
    if (-[ATXAppInterruptionsEventProvider notificationEventOccurredWhileInMode:modeTransitionEvent:](self, "notificationEventOccurredWhileInMode:modeTransitionEvent:", v8, self->_mostRecentModeEvent))
    {
      -[ATXInterruptedAppSessionAccumulator handleNotificationEvent:](self->_modeInterruptedAppSessionsAccumulator, "handleNotificationEvent:", v8);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      globalInterruptedAppSessionsAccumulator = self->_globalInterruptedAppSessionsAccumulator;
      v5 = (void *)objc_opt_new();
      -[ATXInterruptedAppSessionAccumulator handleNextAppLaunch:dimensionSet:](globalInterruptedAppSessionsAccumulator, "handleNextAppLaunch:dimensionSet:", v8, v5);

      if (-[ATXAppInterruptionsEventProvider appLaunchEventOccurredWhileInMode:modeTransitionEvent:](self, "appLaunchEventOccurredWhileInMode:modeTransitionEvent:", v8, self->_mostRecentModeEvent))
      {
        modeInterruptedAppSessionsAccumulator = self->_modeInterruptedAppSessionsAccumulator;
        v7 = (void *)objc_opt_new();
        -[ATXInterruptedAppSessionAccumulator handleNextAppLaunch:dimensionSet:](modeInterruptedAppSessionsAccumulator, "handleNextAppLaunch:dimensionSet:", v8, v7);

      }
    }
  }

}

- (BOOL)notificationEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  BOOL v20;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99D68];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "timestamp");
  v10 = v9;

  v11 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:", v10);
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;
  objc_msgSend(v5, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  if (v13 <= v15)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v11, "timeIntervalSince1970");
    v17 = v16;
    objc_msgSend(v5, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    v20 = v17 < v19;

  }
  return v20;
}

- (BOOL)appLaunchEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  if (v9 <= v11)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v5, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;
    objc_msgSend(v6, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v14 < v16;

  }
  return v17;
}

- (unint64_t)globalAppInterruptionsCountByEntity:(id)a3
{
  ATXInterruptedAppSessionAccumulator *globalInterruptedAppSessionsAccumulator;
  id v4;
  void *v5;
  unint64_t v6;

  globalInterruptedAppSessionsAccumulator = self->_globalInterruptedAppSessionsAccumulator;
  v4 = a3;
  -[ATXInterruptedAppSessionAccumulator countedSetContainingInterruptingAppBundleIds](globalInterruptedAppSessionsAccumulator, "countedSetContainingInterruptingAppBundleIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", v4);

  return v6;
}

- (unint64_t)modeAppInterruptionsCountByEntity:(id)a3
{
  ATXInterruptedAppSessionAccumulator *modeInterruptedAppSessionsAccumulator;
  id v4;
  void *v5;
  unint64_t v6;

  modeInterruptedAppSessionsAccumulator = self->_modeInterruptedAppSessionsAccumulator;
  v4 = a3;
  -[ATXInterruptedAppSessionAccumulator countedSetContainingInterruptingAppBundleIds](modeInterruptedAppSessionsAccumulator, "countedSetContainingInterruptingAppBundleIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", v4);

  return v6;
}

- (double)globalPopularityOfInterruptingEntity:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXAppInterruptionsEventProvider globalAppInterruptionsCountByEntity:](self, "globalAppInterruptionsCountByEntity:", a3);
  v5 = -[ATXInterruptedAppSessionAccumulator numberOfInterruptingAppSessions](self->_globalInterruptedAppSessionsAccumulator, "numberOfInterruptingAppSessions");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)modePopularityOfInterruptingEntity:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXAppInterruptionsEventProvider modeAppInterruptionsCountByEntity:](self, "modeAppInterruptionsCountByEntity:", a3);
  v5 = -[ATXInterruptedAppSessionAccumulator numberOfInterruptingAppSessions](self->_modeInterruptedAppSessionsAccumulator, "numberOfInterruptingAppSessions");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)modeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  double result;

  v4 = a3;
  v5 = -[ATXAppInterruptionsEventProvider globalAppInterruptionsCountByEntity:](self, "globalAppInterruptionsCountByEntity:", v4);
  v6 = -[ATXAppInterruptionsEventProvider modeAppInterruptionsCountByEntity:](self, "modeAppInterruptionsCountByEntity:", v4);

  result = 0.0;
  if (v6)
  {
    if (v5)
      return (double)v6 / (double)v5;
  }
  return result;
}

- (double)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  v4 = a3;
  -[ATXAppInterruptionsEventProvider modePopularityOfInterruptingEntity:](self, "modePopularityOfInterruptingEntity:", v4);
  v6 = v5;
  -[ATXAppInterruptionsEventProvider globalPopularityOfInterruptingEntity:](self, "globalPopularityOfInterruptingEntity:", v4);
  v8 = v7;

  result = 0.0;
  if (v8 != 0.0 && v6 != 0.0)
    return v6 / v8;
  return result;
}

- (ATXModeEvent)mostRecentModeEvent
{
  return self->_mostRecentModeEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentModeEvent, 0);
  objc_storeStrong((id *)&self->_modeInterruptedAppSessionsAccumulator, 0);
  objc_storeStrong((id *)&self->_globalInterruptedAppSessionsAccumulator, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
}

- (void)successfullyCalculatedAppSessionInterruptions
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXAppInterruptionsEventProvider: Error from merged publishers: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXAppInterruptionsEventProvider: During ordered merge, encountered unknown event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
