@implementation ATXAppClipSingleSuggestionLogger

- (ATXAppClipSingleSuggestionLogger)initWithTracker:(id)a3
{
  id v5;
  ATXAppClipSingleSuggestionLogger *v6;
  ATXAppClipSingleSuggestionLogger *v7;
  uint64_t v8;
  NSMutableArray *positiveEventBuffer;
  uint64_t v10;
  NSMutableArray *negativeEventBuffer;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXAppClipSingleSuggestionLogger;
  v6 = -[ATXAppClipSingleSuggestionLogger init](&v13, sel_init);
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

- (id)_appClipEngagementMetricWithBundleId:(id)a3 urlHash:(id)a4 interactionType:(int)a5 consumerSubType:(id)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;

  v6 = *(_QWORD *)&a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setBundleId:", v11);

  objc_msgSend(v12, "setUrlHash:", v10);
  objc_msgSend(v12, "setInteractionType:", v6);
  objc_msgSend(v12, "setConsumerSubType:", v9);

  return v12;
}

- (void)_logAppClipEngagementMetric:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[ATXPETEventTracker2Protocol trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v4);
  __atxlog_handle_metrics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXAppClipSingleSuggestionLogger _logAppClipEngagementMetric:].cold.1((uint64_t)self, v4, v5);

}

- (void)handleSingleSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  objc_class *v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  void *v34;
  NSObject *v35;
  id v36;
  ATXAppClipSingleSuggestionLogger *v37;
  id v38;
  uint64_t *v39;
  _BYTE *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  id v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = objc_opt_class();
  objc_msgSend(v4, "suggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executableSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v10, &v54);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (uint64_t (*)(uint64_t, uint64_t))v54;

  objc_autoreleasePoolPop(v5);
  if (v12 || !v11)
  {
    __atxlog_handle_metrics();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      v56 = v12;
      _os_log_error_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_ERROR, "%@ - not logging because could not retrieve bundleId from completed session: %@. Unarchive error: %@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v11, "bundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "urlHash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "latitudeAtPredictionTime");
    v16 = v15;
    objc_msgSend(v11, "longitudeAtPredictionTime");
    v18 = v17;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v56 = __Block_byref_object_copy__9;
    v57 = __Block_byref_object_dispose__9;
    v58 = (id)MEMORY[0x1E0C9AAA0];
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__9;
    v52 = __Block_byref_object_dispose__9;
    v53 = (id)MEMORY[0x1E0C9AAA0];
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke;
    v34 = &unk_1E82DCAB8;
    v39 = &v48;
    v40 = buf;
    v19 = v13;
    v35 = v19;
    v20 = v14;
    v42 = v16;
    v43 = v18;
    v36 = v20;
    v37 = self;
    v21 = v11;
    v38 = v21;
    v41 = &v44;
    objc_msgSend(v4, "enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:", &v31);
    if (objc_msgSend((id)v49[5], "isEqualToNumber:", MEMORY[0x1E0C9AAB0], v31, v32, v33, v34))
    {
      -[ATXAppClipSingleSuggestionLogger _appClipEngagementMetricWithBundleId:urlHash:interactionType:consumerSubType:](self, "_appClipEngagementMetricWithBundleId:urlHash:interactionType:consumerSubType:", v19, v20, *((unsigned int *)v45 + 6), CFSTR("SingleSuggestionAnyConsumerSubType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppClipSingleSuggestionLogger _logAppClipEngagementMetric:](self, "_logAppClipEngagementMetric:", v22);

    }
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cdnDownloaderTriggerManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "heroClipManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "feedback");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isEqualToNumber:", MEMORY[0x1E0C9AAB0]))
    {
      LODWORD(v27) = 1.0;
      objc_msgSend(v26, "addConfirmForAppClipWithHeroAppPrediction:weight:", v21, v27);
    }
    else if (objc_msgSend((id)v49[5], "isEqualToNumber:", MEMORY[0x1E0C9AAB0]))
    {
      LODWORD(v30) = 1.0;
      objc_msgSend(v26, "addRejectForAppClipWithHeroAppPrediction:weight:", v21, v30);
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(buf, 8);
  }

}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;

  if ((_DWORD)a2 == 21)
  {
    v6 = 2;
    if (a3)
      goto LABEL_5;
LABEL_25:
    __atxlog_handle_hero();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_2(v23);
    goto LABEL_29;
  }
  if ((_DWORD)a2 == 36 || (_DWORD)a2 == 39)
  {
    v6 = 3;
    if (a3)
    {
LABEL_5:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      v9 = MEMORY[0x1E0C9AAB0];
      *(_QWORD *)(v7 + 40) = MEMORY[0x1E0C9AAB0];

      if (a3 == 2)
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
      if (!*(_QWORD *)(a1 + 32)
        || !*(_QWORD *)(a1 + 40)
        || *(double *)(a1 + 88) == *MEMORY[0x1E0D2FC80]
        || *(double *)(a1 + 96) == *MEMORY[0x1E0D2FC80])
      {
        __atxlog_handle_hero();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_3(a1, v12, v16);
      }
      else
      {
        v12 = -[ATXAppOrClipLaunch initAppClipLaunchWithBundleId:urlHash:launchReason:latitude:longitude:]([ATXAppOrClipLaunch alloc], "initAppClipLaunchWithBundleId:urlHash:launchReason:latitude:longitude:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6, *(double *)(a1 + 88), *(double *)(a1 + 96));
        v13 = -[ATXHeroAndClipSessionLogSampledEvent initFromLaunch:]([ATXHeroAndClipSessionLogSampledEvent alloc], "initFromLaunch:", v12);
        __atxlog_handle_hero();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_4((uint64_t)v13, v14);

        v15 = 16;
        if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0)
          v15 = 24;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + v15), "addObject:", v13);

      }
      if (a3 == 2)
        v17 = 1;
      else
        v17 = 2 * (a3 == 3);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      if ((int)v17 > *(_DWORD *)(v18 + 24))
        *(_DWORD *)(v18 + 24) = v17;
      v20 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(a1 + 48);
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_appClipEngagementMetricWithBundleId:urlHash:interactionType:consumerSubType:", v21, v20, v17, v22);
      v23 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "_logAppClipEngagementMetric:", v23);
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  __atxlog_handle_hero();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_1(a2, v23);
LABEL_29:

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
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "Session logged %lu app clip launch events.", buf, 0xCu);
  }

  objc_msgSend(v7, "removeAllObjects");
}

- (void)flushEventBuffers
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Flushing app clip session log positive event buffer", a5, a6, a7, a8, 0);
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

- (void)_logAppClipEngagementMetric:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "urlHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "consumerSubType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a2, "interactionType");
  if (v10 > 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E82DCAD8[(int)v10];
  }
  *(_DWORD *)buf = 138413314;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  v16 = 2112;
  v17 = v8;
  v18 = 2112;
  v19 = v9;
  v20 = 2112;
  v21 = v11;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAppClipSessionEngagementTracker with bundleId: %@ urlHash: %@ consumerSubType: %@ interactionType: %@", buf, 0x34u);

}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_1(unsigned __int8 a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "Unknown consumer subtype for Location Based Dimsum received: %@", (uint8_t *)&v5);

}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "App Clip Prediction that was not shown reached the feedback path.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "BundleId or URL Hash or latitudeAtPredictionTime or longitudeAtPredictionTime missing while trying to log session for App Clip Prediction: %@", (uint8_t *)&v4);
}

void __59__ATXAppClipSingleSuggestionLogger_handleSingleSuggestion___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "Adding event %@ to the app clip session log buffer", (uint8_t *)&v2, 0xCu);
}

@end
