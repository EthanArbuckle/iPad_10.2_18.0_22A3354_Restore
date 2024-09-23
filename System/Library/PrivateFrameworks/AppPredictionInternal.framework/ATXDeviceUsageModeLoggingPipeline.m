@implementation ATXDeviceUsageModeLoggingPipeline

- (ATXDeviceUsageModeLoggingPipeline)initWithModeTransitionPublisher:(id)a3 displayIntervalPublisher:(id)a4 lastEventTimestamp:(double)a5 lastActivityType:(unint64_t)a6
{
  id v11;
  id v12;
  ATXDeviceUsageModeLoggingPipeline *v13;
  ATXDeviceUsageModeLoggingPipeline *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXDeviceUsageModeLoggingPipeline;
  v13 = -[ATXDeviceUsageModeLoggingPipeline init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_modeTransitionPublisher, a3);
    objc_storeStrong((id *)&v14->_displayIntervalPublisher, a4);
    v14->_lastEventTimestamp = a5;
    v14->_lastActivityType = a6;
  }

  return v14;
}

- (ATXDeviceUsageModeLoggingPipeline)init
{
  double v3;
  double v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXDeviceUsageModeLoggingPipeline *v11;

  -[ATXDeviceUsageModeLoggingPipeline lastPipelineRunTimestampFromStore](self, "lastPipelineRunTimestampFromStore");
  v4 = v3;
  v5 = -[ATXDeviceUsageModeLoggingPipeline lastKnownActivityFromStore](self, "lastKnownActivityFromStore");
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "transitionPublisherFromStartTime:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDeviceUsageModeLoggingPipeline displayIntervalsFromStartDate:endDate:](self, "displayIntervalsFromStartDate:endDate:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ATXDeviceUsageModeLoggingPipeline initWithModeTransitionPublisher:displayIntervalPublisher:lastEventTimestamp:lastActivityType:](self, "initWithModeTransitionPublisher:displayIntervalPublisher:lastEventTimestamp:lastActivityType:", v7, v10, v5, v4);
  return v11;
}

- (double)lastPipelineRunTimestampFromStore
{
  id v2;
  void *v3;
  double v4;
  double v5;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "doubleForKey:", CFSTR("modeDeviceUsagePipelineLastRunTimestampKey"));
  v5 = v4;

  return v5;
}

- (unint64_t)lastKnownActivityFromStore
{
  id v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "objectForKey:", CFSTR("modeDeviceUsagePipelineLastKnownModeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_7:
    v5 = 14;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_metrics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXAppSessionModeLoggingPipeline lastKnownActivityFromStore].cold.1();

    goto LABEL_7;
  }
  v5 = objc_msgSend(v4, "unsignedIntegerValue");
LABEL_8:

  return v5;
}

- (id)displayIntervalsFromStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_metrics();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v12 = v11;
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v19 = 138412802;
    v20 = v10;
    v21 = 2048;
    v22 = v12;
    v23 = 2048;
    v24 = v13;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "%@ - Retrieving display on intervals between timestamps %f and %f", (uint8_t *)&v19, 0x20u);

  }
  +[ATXDeviceBacklightHelper getScreenOnIntervalsBetweenStartDate:endDate:](ATXDeviceBacklightHelper, "getScreenOnIntervalsBetweenStartDate:endDate:", v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_208);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXDeviceUsageModeLoggingPipeline _coalesceAndFilterDisplayOnIntervals:](self, "_coalesceAndFilterDisplayOnIntervals:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bpsPublisher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

_ATXDisplayOnInterval *__75__ATXDeviceUsageModeLoggingPipeline_displayIntervalsFromStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _ATXDisplayOnInterval *v3;

  v2 = a2;
  v3 = -[_ATXDisplayOnInterval initWithOnInterval:]([_ATXDisplayOnInterval alloc], "initWithOnInterval:", v2);

  return v3;
}

- (id)_coalesceAndFilterDisplayOnIntervals:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  ATXDeviceUsageModeLoggingPipeline *v12;
  _ATXDisplayOnInterval *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  obj = v5;
  if (!v6)
    goto LABEL_15;
  v7 = v6;
  v5 = 0;
  v8 = *(_QWORD *)v28;
  do
  {
    v9 = 0;
    v25 = v7;
    do
    {
      if (*(_QWORD *)v28 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
      if (v5)
      {
        if (-[ATXDeviceUsageModeLoggingPipeline _shouldCoalesceOnInterval:nextInterval:](self, "_shouldCoalesceOnInterval:nextInterval:", v5, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v9)))
        {
          v11 = v8;
          v12 = self;
          v13 = [_ATXDisplayOnInterval alloc];
          v14 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v5, "onInterval");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "onInterval");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "endDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:", v16, v18);
          v20 = -[_ATXDisplayOnInterval initWithOnInterval:](v13, "initWithOnInterval:", v19);

          v5 = (id)v20;
          self = v12;
          v8 = v11;
          v7 = v25;
        }
        else
        {
          objc_msgSend(v24, "addObject:", v5);
          v21 = v10;

          v5 = v21;
        }
      }
      else
      {
        v5 = v10;
      }
      ++v9;
    }
    while (v7 != v9);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v7);

  if (v5)
  {
    objc_msgSend(v24, "addObject:", v5);
LABEL_15:

  }
  objc_msgSend(v24, "_pas_filteredArrayWithTest:", &__block_literal_global_20_2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

BOOL __74__ATXDeviceUsageModeLoggingPipeline__coalesceAndFilterDisplayOnIntervals___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend(a2, "onInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3 >= 3.0;

  return v4;
}

- (BOOL)_shouldCoalesceOnInterval:(id)a3 nextInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  BOOL v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "onInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(v5, "onInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  if (v10 <= v14)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v6, "onInterval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "onInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v18);
    v20 = v19 < 2.0;

  }
  return v20;
}

- (void)logDeviceUsage
{
  -[ATXDeviceUsageModeLoggingPipeline logDeviceUsageWithXPCActivity:](self, "logDeviceUsageWithXPCActivity:", 0);
}

- (void)logDeviceUsageWithXPCActivity:(id)a3
{
  id v4;
  void *v5;
  double lastEventTimestamp;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  double v33;
  _QWORD v34[3];
  char v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42[0] = self->_displayIntervalPublisher;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v30 = 0;
  v31 = &v30;
  lastEventTimestamp = self->_lastEventTimestamp;
  v32 = 0x2020000000;
  v33 = lastEventTimestamp;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = self->_lastActivityType;
  v7 = (void *)objc_opt_new();
  -[ATXDeviceUsageModeLoggingPipeline timeMergedPublisherFromEventPublishers:modeTransitionPublisher:](self, "timeMergedPublisherFromEventPublishers:modeTransitionPublisher:", v5, self->_modeTransitionPublisher);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v31[3];
    ATXActivityTypeToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = v11;
    v38 = 2048;
    v39 = v12;
    v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging Device Usage starting from timestamp %f with most recent transition %@", buf, 0x20u);

  }
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__ATXDeviceUsageModeLoggingPipeline_logDeviceUsageWithXPCActivity___block_invoke;
  v24[3] = &unk_1E82DCCC8;
  v24[4] = self;
  v26 = v34;
  v25 = v7;
  v27 = &v30;
  v28 = v29;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __67__ATXDeviceUsageModeLoggingPipeline_logDeviceUsageWithXPCActivity___block_invoke_24;
  v18[3] = &unk_1E82DCCF0;
  v18[4] = self;
  v21 = &v30;
  v22 = v29;
  v15 = v25;
  v19 = v15;
  v16 = v4;
  v20 = v16;
  v23 = v34;
  v17 = (id)objc_msgSend(v8, "sinkWithCompletion:shouldContinue:", v24, v18);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(v34, 8);

}

void __67__ATXDeviceUsageModeLoggingPipeline_logDeviceUsageWithXPCActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_cold_1(a1, v3);

  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      __atxlog_handle_metrics();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v9, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "logToCoreAnalytics");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "persistState");
  }

}

uint64_t __67__ATXDeviceUsageModeLoggingPipeline_logDeviceUsageWithXPCActivity___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  ATXModeDimensionSet *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  ATXModeDimensionSet *v15;
  void *v16;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "eventTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v4, "activityTypeAfterTransition");
      v7 = [ATXModeDimensionSet alloc];
      ATXActivityTypeToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ATXModeDimensionSet initWithMode:](v7, "initWithMode:", v8);

      v10 = *(void **)(a1 + 40);
      objc_msgSend(v4, "eventTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleModeDimensionSetChange:changeTime:", v9, v11);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v4;
        v15 = [ATXModeDimensionSet alloc];
        ATXActivityTypeToString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[ATXModeDimensionSet initWithMode:](v15, "initWithMode:", v16);

        objc_msgSend(*(id *)(a1 + 40), "handleNextOnInterval:dimensionSet:", v14, v9);
      }
      else
      {
        __atxlog_handle_metrics();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_19_cold_2();
      }
    }

    v13 = 1;
    if (objc_msgSend(*(id *)(a1 + 48), "didDefer"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v13 = 0;
    }
  }
  else
  {
    __atxlog_handle_metrics();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_19_cold_1(a1, v12);

    v13 = 1;
  }

  return v13;
}

- (id)timeMergedPublisherFromEventPublishers:(id)a3 modeTransitionPublisher:(id)a4
{
  return (id)objc_msgSend(a4, "orderedMergeWithOthers:comparator:", a3, &__block_literal_global_29_3);
}

uint64_t __100__ATXDeviceUsageModeLoggingPipeline_timeMergedPublisherFromEventPublishers_modeTransitionPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "eventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)persistState
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (id)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v5, "setDouble:forKey:", CFSTR("modeDeviceUsagePipelineLastRunTimestampKey"), self->_lastEventTimestamp);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lastActivityType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("modeDeviceUsagePipelineLastKnownModeKey"));

}

- (BPSPublisher)modeTransitionPublisher
{
  return self->_modeTransitionPublisher;
}

- (BPSPublisher)displayIntervalPublisher
{
  return self->_displayIntervalPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIntervalPublisher, 0);
  objc_storeStrong((id *)&self->_modeTransitionPublisher, 0);
}

@end
