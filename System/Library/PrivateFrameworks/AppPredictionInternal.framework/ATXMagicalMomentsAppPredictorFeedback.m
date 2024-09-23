@implementation ATXMagicalMomentsAppPredictorFeedback

- (id)clientModelIds
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 24);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v2, 0);

  return v3;
}

- (ATXMagicalMomentsAppPredictorFeedback)init
{
  void *v3;
  ATXMagicalMomentsAppPredictorFeedback *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXMagicalMomentsAppPredictorFeedback initWithTracker:](self, "initWithTracker:", v3);

  return v4;
}

- (ATXMagicalMomentsAppPredictorFeedback)initWithTracker:(id)a3
{
  id v5;
  ATXMagicalMomentsAppPredictorFeedback *v6;
  ATXMagicalMomentsAppPredictorFeedback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXMagicalMomentsAppPredictorFeedback;
  v6 = -[ATXMagicalMomentsAppPredictorFeedback init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tracker, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)receiveUIFeedbackResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_feedback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXMagicalMomentsAppPredictorFeedback receiveUIFeedbackResult:].cold.3();

  objc_msgSend(v4, "shownSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = objc_msgSend(v4, "consumerSubType");
    if ((_DWORD)v8)
    {
      v9 = v8;
      v10 = (void *)MEMORY[0x1CAA48B6C]();
      v11 = objc_alloc(MEMORY[0x1E0C99E60]);
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v10);
      v15 = (void *)MEMORY[0x1CAA48B6C]();
      v16 = (void *)MEMORY[0x1E0CB3710];
      objc_msgSend(v4, "clientCacheUpdate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "feedbackMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(v16, "unarchivedObjectOfClasses:fromData:error:", v14, v18, &v39);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v39;

      objc_autoreleasePoolPop(v15);
      if (!v19 || v20)
      {
        __atxlog_handle_feedback();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[ATXMagicalMomentsAppPredictorFeedback receiveUIFeedbackResult:].cold.2();
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v4, "shownSuggestions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v36 != v24)
                objc_enumerationMutation(v21);
              -[ATXMagicalMomentsAppPredictorFeedback _handleShownProactiveSuggestion:consumerSubType:bundleIdToAnchorType:](self, "_handleShownProactiveSuggestion:consumerSubType:bundleIdToAnchorType:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v9, v19);
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          }
          while (v23);
        }

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v4, "engagedSuggestions");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v32 != v29)
                objc_enumerationMutation(v26);
              -[ATXMagicalMomentsAppPredictorFeedback _handleEngagedProactiveSuggestion:consumerSubType:bundleIdToAnchorType:](self, "_handleEngagedProactiveSuggestion:consumerSubType:bundleIdToAnchorType:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), v9, v19);
            }
            v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          }
          while (v28);
        }
      }

    }
    else
    {
      __atxlog_handle_feedback();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXMagicalMomentsAppPredictorFeedback receiveUIFeedbackResult:].cold.1((uint64_t)self, v20);
    }

  }
}

- (void)_handleShownProactiveSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIdToAnchorType:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "bundleIdExecutableObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[ATXMagicalMomentsAppPredictorFeedback _anchorTypeFromBundleIdToAnchorTypeMap:bundleId:](self, "_anchorTypeFromBundleIdToAnchorTypeMap:bundleId:", v9, v10);
    if ((unint64_t)(v11 - 23) > 0xFFFFFFFFFFFFFFE9)
    {
      v15 = v11;
      -[ATXMagicalMomentsAppPredictorFeedback getCurrentABGroup](self, "getCurrentABGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scoreSpecification");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rawScore");
      -[ATXMagicalMomentsAppPredictorFeedback logShownMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:](self, "logShownMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:", v10, v6, v15, v16);

      goto LABEL_9;
    }
    __atxlog_handle_feedback();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v14;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_ERROR, "%@ - could not find anchor type for bundleId: %@ in map: %@", (uint8_t *)&v18, 0x20u);

    }
  }
  else
  {
    __atxlog_handle_feedback();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXMagicalMomentsAppPredictorFeedback _handleShownProactiveSuggestion:consumerSubType:bundleIdToAnchorType:].cold.1();
  }

LABEL_9:
}

- (void)_handleEngagedProactiveSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIdToAnchorType:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "bundleIdExecutableObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    __atxlog_handle_feedback();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ATXMagicalMomentsAppPredictorFeedback _handleShownProactiveSuggestion:consumerSubType:bundleIdToAnchorType:].cold.1();
    goto LABEL_8;
  }
  v11 = -[ATXMagicalMomentsAppPredictorFeedback _anchorTypeFromBundleIdToAnchorTypeMap:bundleId:](self, "_anchorTypeFromBundleIdToAnchorTypeMap:bundleId:", v9, v10);
  if (!v11)
  {
    __atxlog_handle_feedback();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v17;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_ERROR, "%@ - could not find anchor type for bundleId: %@ in map: %@", (uint8_t *)&v18, 0x20u);

    }
LABEL_8:

    goto LABEL_9;
  }
  v12 = v11;
  -[ATXMagicalMomentsAppPredictorFeedback getCurrentABGroup](self, "getCurrentABGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scoreSpecification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rawScore");
  -[ATXMagicalMomentsAppPredictorFeedback logEngagedMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:](self, "logEngagedMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:", v10, v6, v12, v13);

LABEL_9:
}

- (void)logShownMMMetricsEntryForBundle:(id)a3 consumerSubType:(unsigned __int8)a4 anchorType:(int64_t)a5 abGroup:(id)a6 score:(double)a7
{
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v9 = a4;
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setBundleId:", v13);

  objc_msgSend(v14, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a5));
  objc_msgSend(v14, "setAbGroup:", v12);

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConsumerSubType:", v15);

  -[ATXPETEventTracker2Protocol trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v14, a7);
  __atxlog_handle_metrics();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[ATXMagicalMomentsAppPredictorFeedback logShownMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:].cold.1();

}

- (void)logEngagedMMMetricsEntryForBundle:(id)a3 consumerSubType:(unsigned __int8)a4 anchorType:(int64_t)a5 abGroup:(id)a6 score:(double)a7
{
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v9 = a4;
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a5));
  objc_msgSend(v14, "setBundleId:", v13);

  objc_msgSend(v14, "setAbGroup:", v12);
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConsumerSubType:", v15);

  -[ATXPETEventTracker2Protocol trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v14, a7);
  __atxlog_handle_metrics();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[ATXMagicalMomentsAppPredictorFeedback logEngagedMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:].cold.1();

}

- (id)getCurrentABGroup
{
  void *v2;
  void *v3;
  void *v4;

  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "abGroupIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_anchorTypeFromBundleIdToAnchorTypeMap:(id)a3 bundleId:(id)a4
{
  void *v4;
  void *v5;
  unint64_t v6;
  int64_t v7;

  objc_msgSend(a3, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
    if (v6 <= 0x16)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)receiveUIFeedbackResult:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%@ - receiveUIFeedbackResult received an invalid unknown consumer", (uint8_t *)&v5, 0xCu);

}

- (void)receiveUIFeedbackResult:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - could not unarchive feedback metadata, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)receiveUIFeedbackResult:.cold.3()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "%@ - receiveUIFeedbackResult got result: %@", v3, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_handleShownProactiveSuggestion:consumerSubType:bundleIdToAnchorType:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - could not unarchive bundleId from proactive suggestion: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)logShownMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:.cold.1()
{
  void *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_0();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleId");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_6_6(&dword_1C9A3B000, v4, v5, "LOGGED: %@ - ATXMagicalMomentsPBMMShownTracker with bundleId: %@ and anchorType: %d", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_16();
}

- (void)logEngagedMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:.cold.1()
{
  void *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_0();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleId");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_6_6(&dword_1C9A3B000, v4, v5, "LOGGED: %@ - ATXMagicalMomentsPBMMEngagedTracker with bundleId: %@ and anchorType: %d", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_16();
}

@end
