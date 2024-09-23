@implementation ATXAppSessionModeLoggingPipeline

- (ATXAppSessionModeLoggingPipeline)init
{
  double v3;
  double v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXAppSessionModeLoggingPipeline *v15;

  -[ATXAppSessionModeLoggingPipeline lastPipelineRunTimestampFromStore](self, "lastPipelineRunTimestampFromStore");
  v4 = v3;
  v5 = -[ATXAppSessionModeLoggingPipeline lastKnownActivityFromStore](self, "lastKnownActivityFromStore");
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "transitionPublisherFromStartTime:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appLaunchesSinceDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "publisherFromStartTime:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stripStoreEvent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ATXAppSessionModeLoggingPipeline initWithModeTransitionPublisher:appLaunchPublisher:notificationEventPublisher:lastEventTimestamp:lastActivityType:](self, "initWithModeTransitionPublisher:appLaunchPublisher:notificationEventPublisher:lastEventTimestamp:lastActivityType:", v7, v10, v14, v5, v4);
  return v15;
}

- (ATXAppSessionModeLoggingPipeline)initWithModeTransitionPublisher:(id)a3 appLaunchPublisher:(id)a4 notificationEventPublisher:(id)a5 lastEventTimestamp:(double)a6 lastActivityType:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  ATXAppSessionModeLoggingPipeline *v16;
  ATXAppSessionModeLoggingPipeline *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXAppSessionModeLoggingPipeline;
  v16 = -[ATXAppSessionModeLoggingPipeline init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_modeTransitionPublisher, a3);
    objc_storeStrong((id *)&v17->_appLaunchPublisher, a4);
    objc_storeStrong((id *)&v17->_notificationEventPublisher, a5);
    v17->_lastEventTimestamp = a6;
    v17->_lastActivityType = a7;
  }

  return v17;
}

- (double)lastPipelineRunTimestampFromStore
{
  id v2;
  void *v3;
  double v4;
  double v5;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "doubleForKey:", CFSTR("modeAppSessionPipelineLastRunTimestampKey"));
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
  objc_msgSend(v3, "objectForKey:", CFSTR("modeAppSessionPipelineLastKnownModeKey"));
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

- (void)logAppSessionMetricsWithXPCActivity:(id)a3
{
  id v4;
  BPSPublisher *notificationEventPublisher;
  void *v6;
  void *v7;
  double lastEventTimestamp;
  BPSPublisher *modeTransitionPublisher;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[3];
  char v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  notificationEventPublisher = self->_notificationEventPublisher;
  v30[0] = self->_appLaunchPublisher;
  v30[1] = notificationEventPublisher;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v7 = (void *)objc_opt_new();
  v27[0] = 0;
  v27[1] = v27;
  lastEventTimestamp = self->_lastEventTimestamp;
  v27[2] = 0x2020000000;
  *(double *)&v27[3] = lastEventTimestamp;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  modeTransitionPublisher = self->_modeTransitionPublisher;
  v26[3] = self->_lastActivityType;
  -[ATXAppSessionModeLoggingPipeline timeMergedPublisherFromEventPublishers:modeTransitionPublisher:](self, "timeMergedPublisherFromEventPublishers:modeTransitionPublisher:", v6, modeTransitionPublisher);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke;
  v21[3] = &unk_1E82DCCC8;
  v21[4] = self;
  v23 = v28;
  v22 = v7;
  v24 = v27;
  v25 = v26;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_19;
  v15[3] = &unk_1E82DCCF0;
  v15[4] = self;
  v18 = v27;
  v19 = v26;
  v12 = v22;
  v16 = v12;
  v13 = v4;
  v17 = v13;
  v20 = v28;
  v14 = (id)objc_msgSend(v10, "sinkWithCompletion:shouldContinue:", v21, v15);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(v28, 8);
}

void __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke(uint64_t a1, void *a2)
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

uint64_t __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  ATXModeDimensionSet *v9;
  void *v10;
  NSObject *v11;

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
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "handleNotificationEvent:", v4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = [ATXModeDimensionSet alloc];
          ATXActivityTypeToString();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[ATXModeDimensionSet initWithMode:](v9, "initWithMode:", v10);

          objc_msgSend(*(id *)(a1 + 40), "handleNextAppLaunch:dimensionSet:", v4, v11);
        }
        else
        {
          __atxlog_handle_metrics();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_19_cold_2();
        }

      }
    }
    v8 = 1;
    if (objc_msgSend(*(id *)(a1 + 48), "didDefer"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v8 = 0;
    }
  }
  else
  {
    __atxlog_handle_metrics();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_19_cold_1(a1, v7);

    v8 = 1;
  }

  return v8;
}

- (void)logAppSessionMetrics
{
  -[ATXAppSessionModeLoggingPipeline logAppSessionMetricsWithXPCActivity:](self, "logAppSessionMetricsWithXPCActivity:", 0);
}

- (void)persistState
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (id)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v5, "setDouble:forKey:", CFSTR("modeAppSessionPipelineLastRunTimestampKey"), self->_lastEventTimestamp);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lastActivityType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("modeAppSessionPipelineLastKnownModeKey"));

}

- (id)timeMergedPublisherFromEventPublishers:(id)a3 modeTransitionPublisher:(id)a4
{
  return (id)objc_msgSend(a4, "orderedMergeWithOthers:comparator:", a3, &__block_literal_global_27);
}

uint64_t __99__ATXAppSessionModeLoggingPipeline_timeMergedPublisherFromEventPublishers_modeTransitionPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BPSPublisher)modeTransitionPublisher
{
  return self->_modeTransitionPublisher;
}

- (BPSPublisher)appLaunchPublisher
{
  return self->_appLaunchPublisher;
}

- (BPSPublisher)notificationEventPublisher
{
  return self->_notificationEventPublisher;
}

- (NSString)bookmarkFilepath
{
  return self->_bookmarkFilepath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkFilepath, 0);
  objc_storeStrong((id *)&self->_notificationEventPublisher, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_modeTransitionPublisher, 0);
}

- (void)lastKnownActivityFromStore
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v4, v5, "%@ - Received unexpected saved mode type: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_cold_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v6, v7, "%@ - Completion had an error: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

void __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_19_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%@ - Received unexpected nil event", (uint8_t *)&v5, 0xCu);

}

void __72__ATXAppSessionModeLoggingPipeline_logAppSessionMetricsWithXPCActivity___block_invoke_19_cold_2()
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v4, v5, "%@ - Received event of unexpected type %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

@end
