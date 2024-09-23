@implementation ATXHeroAppSingleSuggestionLogger

- (ATXHeroAppSingleSuggestionLogger)initWithTracker:(id)a3
{
  id v5;
  ATXHeroAppSingleSuggestionLogger *v6;
  ATXHeroAppSingleSuggestionLogger *v7;
  uint64_t v8;
  NSMutableArray *positiveEventBuffer;
  uint64_t v10;
  NSMutableArray *negativeEventBuffer;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHeroAppSingleSuggestionLogger;
  v6 = -[ATXHeroAppSingleSuggestionLogger init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tracker, a3);
    v8 = objc_opt_new();
    positiveEventBuffer = v7->_positiveEventBuffer;
    v7->_positiveEventBuffer = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    negativeEventBuffer = v7->_negativeEventBuffer;
    v7->_negativeEventBuffer = (NSMutableArray *)v10;

  }
  return v7;
}

- (id)_heroAppEngagementMetricWithBundleId:(id)a3 interactionType:(int)a4 consumerSubType:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setBundleId:", v8);

  objc_msgSend(v9, "setInteractionType:", v5);
  objc_msgSend(v9, "setConsumerSubType:", v7);

  return v9;
}

- (void)_logHeroAppEngagementMetric:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[ATXPETEventTracker2Protocol trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v4);
  __atxlog_handle_metrics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXHeroAppSingleSuggestionLogger _logHeroAppEngagementMetric:].cold.1((uint64_t)self, v4, v5);

}

- (void)handleSingleSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  NSObject *v21;
  double v22;
  objc_class *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  _BYTE *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdExecutableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v4, "feedbackMetadata"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v8 = (void *)MEMORY[0x1CAA48B6C]();
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = objc_opt_class();
    objc_msgSend(v4, "feedbackMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", v10, v11, &v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v41;

    objc_autoreleasePoolPop(v8);
    if (v13 || !v12)
    {
      __atxlog_handle_metrics();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2112;
        v43 = (uint64_t (*)(uint64_t, uint64_t))v13;
        _os_log_error_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_ERROR, "%@ - not logging because could not retrieve location from completed session: %@. Unarchive error: %@", buf, 0x20u);

      }
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v43 = __Block_byref_object_copy__26;
      v44 = __Block_byref_object_dispose__26;
      v45 = (id)MEMORY[0x1E0C9AAA0];
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__26;
      v39 = __Block_byref_object_dispose__26;
      v40 = (id)MEMORY[0x1E0C9AAA0];
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke;
      v25[3] = &unk_1E82DE698;
      v29 = buf;
      v30 = &v31;
      v28 = &v35;
      v25[4] = self;
      v14 = v6;
      v26 = v14;
      v27 = v12;
      objc_msgSend(v4, "enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:", v25);
      if (objc_msgSend((id)v36[5], "isEqualToNumber:", MEMORY[0x1E0C9AAB0]))
      {
        -[ATXHeroAppSingleSuggestionLogger _heroAppEngagementMetricWithBundleId:interactionType:consumerSubType:](self, "_heroAppEngagementMetricWithBundleId:interactionType:consumerSubType:", v14, *((unsigned int *)v32 + 6), CFSTR("SingleSuggestionAnyConsumerSubType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeroAppSingleSuggestionLogger _logHeroAppEngagementMetric:](self, "_logHeroAppEngagementMetric:", v15);

      }
      +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cdnDownloaderTriggerManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "heroAppManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "heroFeedback");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isEqualToNumber:", MEMORY[0x1E0C9AAB0]))
      {
        LODWORD(v20) = 1.0;
        objc_msgSend(v19, "addConfirmForHeroAppPredictionWithBundleId:weight:", v14, v20);
      }
      else if (objc_msgSend((id)v36[5], "isEqualToNumber:", MEMORY[0x1E0C9AAB0]))
      {
        LODWORD(v22) = 1.0;
        objc_msgSend(v19, "addRejectForHeroAppPredictionWithBundleId:weight:", v14, v22);
      }

      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(buf, 8);
    }

  }
  else
  {
    __atxlog_handle_metrics();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXHeroAppSingleSuggestionLogger handleSingleSuggestion:].cold.1((uint64_t)self, (uint64_t)v4, v13);
  }

}

void __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  ATXAppOrClipLaunch *v18;
  uint64_t v19;
  double v20;
  double v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;

  if (a3 == 2)
    v3 = 1;
  else
    v3 = 2 * (a3 == 3);
  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    v9 = MEMORY[0x1E0C9AAB0];
    *(_QWORD *)(v7 + 40) = MEMORY[0x1E0C9AAB0];

    if (a3 == 2)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if ((int)v3 > *(_DWORD *)(v12 + 24))
      *(_DWORD *)(v12 + 24) = v3;
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_heroAppEngagementMetricWithBundleId:interactionType:consumerSubType:", v14, v3, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_logHeroAppEngagementMetric:", v16);
    if (a2 <= 0x28)
    {
      if (((1 << a2) & 0x1B000000000) != 0)
      {
        v17 = 3;
LABEL_16:
        v18 = [ATXAppOrClipLaunch alloc];
        v19 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "coordinate");
        v21 = v20;
        objc_msgSend(*(id *)(a1 + 48), "coordinate");
        v22 = -[ATXAppOrClipLaunch initAppLaunchWithBundleId:launchReason:latitude:longitude:](v18, "initAppLaunchWithBundleId:launchReason:latitude:longitude:", v19, v17, v21);
        v23 = -[ATXHeroAndClipSessionLogSampledEvent initFromLaunch:]([ATXHeroAndClipSessionLogSampledEvent alloc], "initFromLaunch:", v22);
        __atxlog_handle_hero();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_3((uint64_t)v23, v24);

        v25 = 24;
        if (a3 == 2)
          v25 = 16;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v25), "addObject:", v23);

LABEL_21:
        goto LABEL_22;
      }
      if (a2 == 9)
      {
        v17 = 2;
        goto LABEL_16;
      }
    }
    __atxlog_handle_hero();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_2(a2, v22);
    goto LABEL_21;
  }
  __atxlog_handle_hero();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_1(v16);
LABEL_22:

}

- (void)_flushEventBuffer:(id)a3 numEventsToSample:(int64_t)a4 isNegative:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[ATXHeroAndClipEventSamplers defaultSampler](ATXHeroAndClipEventSamplers, "defaultSampler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleEvents:numToSample:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "launch");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXLaunchAndLocationHarvester logAppOrClipLaunch:isNegativeSession:](ATXLaunchAndLocationHarvester, "logAppOrClipLaunch:isNegativeSession:", v14, v5);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }
  __atxlog_handle_hero();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v22 = v16;
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "Session logged %lu hero app launch events.", buf, 0xCu);
  }

  objc_msgSend(v7, "removeAllObjects");
}

- (void)flushEventBuffers
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Flushing hero app session log positive event buffer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (ATXPETEventTracker2Protocol)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
  objc_storeStrong((id *)&self->_tracker, a3);
}

- (NSMutableArray)positiveEventBuffer
{
  return self->_positiveEventBuffer;
}

- (void)setPositiveEventBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_positiveEventBuffer, a3);
}

- (NSMutableArray)negativeEventBuffer
{
  return self->_negativeEventBuffer;
}

- (void)setNegativeEventBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_negativeEventBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeEventBuffer, 0);
  objc_storeStrong((id *)&self->_positiveEventBuffer, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)_logHeroAppEngagementMetric:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "consumerSubType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a2, "interactionType");
  if (v9 > 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E82DE6B8[(int)v9];
  }
  *(_DWORD *)buf = 138413058;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2112;
  v16 = v8;
  v17 = 2112;
  v18 = v10;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBHeroAppEngagementTracker with bundleId: %@ consumerSubType: %@ interactionType: %@", buf, 0x2Au);

}

- (void)handleSingleSuggestion:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - not logging because invalid bundleId or invalid feedbackMetadata from completed session: %@", (uint8_t *)&v7, 0x16u);

}

void __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Hero App Prediction that was not shown reached the feedback path.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_2(unsigned __int8 a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Unknown consumer subtype for Hero app received: %@", (uint8_t *)&v4, 0xCu);

}

void __59__ATXHeroAppSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "Adding event %@ to the hero app session log buffer", (uint8_t *)&v2, 0xCu);
}

@end
