@implementation ATXNotificationTelemetryLogger

- (ATXNotificationTelemetryLogger)initWithContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ATXNotificationTelemetryLogger *v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXNotificationTelemetryLogger initWithDatastore:featuresCorrelator:modeConfigClient:contactStore:](self, "initWithDatastore:featuresCorrelator:modeConfigClient:contactStore:", v5, v6, v7, v4);

  return v8;
}

- (ATXNotificationTelemetryLogger)initWithDatastore:(id)a3 featuresCorrelator:(id)a4 modeConfigClient:(id)a5 contactStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXNotificationTelemetryLogger *v15;
  ATXNotificationTelemetryLogger *v16;
  uint64_t v17;
  NSMutableDictionary *summaryMetrics;
  ATXContactRelationshipsCollector *v19;
  ATXContactRelationshipsCollector *contactRelationships;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ATXNotificationTelemetryLogger;
  v15 = -[ATXNotificationTelemetryLogger init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_datastore, a3);
    objc_storeStrong((id *)&v16->_featuresCorrelator, a4);
    objc_storeStrong((id *)&v16->_modeConfigClient, a5);
    v17 = objc_opt_new();
    summaryMetrics = v16->_summaryMetrics;
    v16->_summaryMetrics = (NSMutableDictionary *)v17;

    objc_storeStrong((id *)&v16->_contactStore, a6);
    v19 = -[ATXContactRelationshipsCollector initWithContactStore:]([ATXContactRelationshipsCollector alloc], "initWithContactStore:", v14);
    contactRelationships = v16->_contactRelationships;
    v16->_contactRelationships = v19;

  }
  return v16;
}

- (void)logNotificationMetricsFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withXPCActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  ATXNotificationAndSuggestionDatastore *datastore;
  double v14;
  double v15;
  double v16;
  void *v17;
  ATXBundleIdRedactor *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  ATXNotificationTelemetryLogger *v26;
  id v27;
  id v28;
  id v29;
  os_signpost_id_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  __atxlog_handle_metrics();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  -[ATXNotificationAndSuggestionDatastore updateDatabase](self->_datastore, "updateDatabase");
  datastore = self->_datastore;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  -[ATXNotificationAndSuggestionDatastore telemetryDataForNotificationsFromTimestamp:endTimestamp:](datastore, "telemetryDataForNotificationsFromTimestamp:endTimestamp:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(ATXBundleIdRedactor);
  objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_228);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __106__ATXNotificationTelemetryLogger_logNotificationMetricsFromStartTimestamp_toEndTimestamp_withXPCActivity___block_invoke_2;
  v24[3] = &unk_1E82EA290;
  v25 = v17;
  v26 = self;
  v27 = v10;
  v28 = v8;
  v29 = v9;
  v30 = v12;
  v20 = v9;
  v21 = v8;
  v22 = v10;
  v23 = v17;
  -[ATXBundleIdRedactor redactWithBundleIds:completionHandler:](v18, "redactWithBundleIds:completionHandler:", v19, v24);

}

uint64_t __106__ATXNotificationTelemetryLogger_logNotificationMetricsFromStartTimestamp_toEndTimestamp_withXPCActivity___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleId");
}

void __106__ATXNotificationTelemetryLogger_logNotificationMetricsFromStartTimestamp_toEndTimestamp_withXPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t i;
  void *v9;
  void *v10;
  ATXNotificationEventMetric *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = 0;
    do
    {
      if (v4 >= objc_msgSend(v3, "count"))
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setBundleId:", CFSTR("redacted-failed-count-mismatch"));
      }
      else
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBundleId:", v5);

      }
      ++v4;
    }
    while (v4 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  v37 = v3;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = *(id *)(a1 + 32);
  v39 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(v7);
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1CAA48B6C]();
        v11 = -[ATXNotificationEventMetric initWithQueryResult:]([ATXNotificationEventMetric alloc], "initWithQueryResult:", v9);
        -[_ATXCoreAnalyticsMetric logToCoreAnalytics](v11, "logToCoreAnalytics");
        objc_msgSend(v9, "receiveModeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
          v14 = v7;
          v15 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v9, "receiveModeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithUUIDString:", v16);
          objc_msgSend(v13, "atxModeForDNDMode:", v17);
          v18 = ATXActivityTypeFromMode();

          v7 = v14;
        }
        else
        {
          v18 = ATXActivityTypeFromMode();
        }

        objc_msgSend(*(id *)(a1 + 40), "summaryMetricsForActivityType:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleTelemetryResult:", v9);

        if (objc_msgSend(*(id *)(a1 + 48), "didDefer"))
        {
          __atxlog_handle_metrics();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v33;
            _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", buf, 0xCu);

          }
LABEL_39:
          objc_autoreleasePoolPop(v10);
          v25 = v37;
          goto LABEL_40;
        }

        objc_autoreleasePoolPop(v10);
      }
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v39)
        continue;
      break;
    }
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "allValues");
  v7 = objc_claimAutoreleasedReturnValue();
  v20 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v7);
        v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        v10 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v24, "logToCoreAnalytics");
        if (objc_msgSend(*(id *)(a1 + 48), "didDefer"))
        {
          __atxlog_handle_metrics();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v36;
            _os_log_impl(&dword_1C9A3B000, v34, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", buf, 0xCu);

          }
          goto LABEL_39;
        }
        objc_autoreleasePoolPop(v10);
      }
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v21)
        continue;
      break;
    }
  }

  v25 = v37;
  if (objc_msgSend(MEMORY[0x1E0CF94B0], "isBreakthroughDataCollectionEnabled"))
  {
    __atxlog_handle_metrics();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = *(_QWORD *)(a1 + 72);
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v28, "FocusMetricsLogging.NotificationBreakthroughMetrics", " enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "logNotificationMetricsWithBreakthroughFeaturesFromStartTimestamp:toEndTimestamp:withTelemetryQueryResult:withXPCActivity:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    __atxlog_handle_metrics();
    v29 = objc_claimAutoreleasedReturnValue();
    v7 = v29;
    v30 = *(_QWORD *)(a1 + 72);
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v7, OS_SIGNPOST_INTERVAL_END, v30, "FocusMetricsLogging.NotificationBreakthroughMetrics", " enableTelemetry=YES ", buf, 2u);
    }
LABEL_40:

  }
}

- (id)summaryMetricsForActivityType:(unint64_t)a3
{
  ATXModeDimensionSet *v4;
  void *v5;
  ATXModeDimensionSet *v6;
  void *v7;
  ATXNotificationHandleSummaryMetrics *v8;
  void *v9;

  v4 = [ATXModeDimensionSet alloc];
  ATXActivityTypeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXModeDimensionSet initWithMode:](v4, "initWithMode:", v5);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[ATXNotificationHandleSummaryMetrics initWithDimensions:]([ATXNotificationHandleSummaryMetrics alloc], "initWithDimensions:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_summaryMetrics, "setObject:forKeyedSubscript:", v8, v6);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)logNotificationMetricsWithBreakthroughFeaturesFromStartTimestamp:(id)a3 toEndTimestamp:(id)a4 withTelemetryQueryResult:(id)a5 withXPCActivity:(id)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  ATXNotificationBreakthroughEventMetric *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  id obj;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v31 = a4;
  v10 = a5;
  v30 = a6;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v34;
    while (2)
    {
      v15 = 0;
      v16 = v13 + 1;
      v28 = v13 + v12;
      do
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
        v18 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v17, "notificationUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "receiveTimestamp");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceReferenceDate");
        -[ATXNotificationTelemetryLogger userNotificationWithUUID:withTimeStamp:urgency:fromNotificationStreamWithStartTime:endTime:](self, "userNotificationWithUUID:withTimeStamp:urgency:fromNotificationStreamWithStartTime:endTime:", v19, objc_msgSend(v17, "urgency"), v32, v31, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[ATXDynamicBreakthroughFeaturesCorrelator collectDynamicBreakthroughFeaturesForNotification:contactStore:withContactRelationships:](self->_featuresCorrelator, "collectDynamicBreakthroughFeaturesForNotification:contactStore:withContactRelationships:", v22, self->_contactStore, self->_contactRelationships);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[ATXNotificationBreakthroughEventMetric initWithQueryResult:featureCollectionSet:]([ATXNotificationBreakthroughEventMetric alloc], "initWithQueryResult:featureCollectionSet:", v17, v23);
        -[_ATXCoreAnalyticsMetric logToCoreAnalytics](v24, "logToCoreAnalytics");
        if ((unint64_t)(v16 + v15) > 0x63)
          goto LABEL_14;
        if (objc_msgSend(v30, "didDefer"))
        {
          __atxlog_handle_metrics();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v38 = v27;
            _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", buf, 0xCu);

          }
LABEL_14:

          objc_autoreleasePoolPop(v18);
          goto LABEL_15;
        }

        objc_autoreleasePoolPop(v18);
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      v13 = v28;
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

}

- (void)logNotificationMetricsWithXPCActivity:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_metrics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v7;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "[%@] - Logging notification metrics", (uint8_t *)&v22, 0xCu);

  }
  v8 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v9 = (void *)objc_msgSend(v8, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v9, "doubleForKey:", CFSTR("notificationTelemetryLoggingTimestampKey"));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_metrics();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v16 = v15;
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v22 = 138412802;
    v23 = v14;
    v24 = 2048;
    v25 = v16;
    v26 = 2048;
    v27 = v17;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "[%@] - Start timestamp found: %f, End Timestamp: %f", (uint8_t *)&v22, 0x20u);

  }
  if (objc_msgSend(v10, "compare:", v11) == -1)
  {
    -[ATXNotificationTelemetryLogger logNotificationMetricsFromStartTimestamp:toEndTimestamp:withXPCActivity:](self, "logNotificationMetricsFromStartTimestamp:toEndTimestamp:withXPCActivity:", v10, v11, v4);
    __atxlog_handle_metrics();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v22 = 138412546;
      v23 = v20;
      v24 = 2048;
      v25 = v21;
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_INFO, "[%@] - Finished logging.  Setting stored timestamp to timestamp: %f", (uint8_t *)&v22, 0x16u);

    }
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "setDouble:forKey:", CFSTR("notificationTelemetryLoggingTimestampKey"));
  }

}

- (id)userNotificationWithUUID:(id)a3 withTimeStamp:(double)a4 urgency:(int64_t)a5 fromNotificationStreamWithStartTime:(id)a6 endTime:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  double v28;
  int64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  objc_msgSend(v11, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__100;
  v34 = __Block_byref_object_dispose__100;
  v35 = 0;
  BiomeLibrary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Notification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "Usage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v12, v13, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke_28;
  v24[3] = &unk_1E82EA2D8;
  v19 = v14;
  v25 = v19;
  v27 = &v30;
  v20 = v11;
  v26 = v20;
  v28 = a4;
  v29 = a5;
  v21 = (id)objc_msgSend(v18, "sinkWithCompletion:shouldContinue:", &__block_literal_global_27_1, v24);

  v22 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v22;
}

void __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_metrics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke_cold_1(v2, v4);

  }
}

uint64_t __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke_28(double *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *((_QWORD *)a1 + 4));

  if (v6)
  {
    objc_msgSend(v3, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0CF91D8]);
    v24 = *((_QWORD *)a1 + 5);
    v8 = a1[7];
    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "body");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v7, "badge");
    objc_msgSend(v7, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v7, "isGroupMessage");
    v13 = objc_msgSend(v23, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:", v24, v9, v22, v21, v20, 0, v8, v19, v18, v10, v11, v12, 0, v17, 0, *((_QWORD *)a1 + 8));
    v14 = *(_QWORD *)(*((_QWORD *)a1 + 6) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  return v6 ^ 1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactRelationships, 0);
  objc_storeStrong((id *)&self->_summaryMetrics, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
  objc_storeStrong((id *)&self->_featuresCorrelator, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

void __125__ATXNotificationTelemetryLogger_userNotificationWithUUID_withTimeStamp_urgency_fromNotificationStreamWithStartTime_endTime___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXNotificationTelemetryLogger: Error reading Notification.Usage stream: %@", (uint8_t *)&v4, 0xCu);

}

@end
