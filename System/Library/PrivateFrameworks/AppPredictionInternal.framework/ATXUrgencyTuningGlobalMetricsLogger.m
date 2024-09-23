@implementation ATXUrgencyTuningGlobalMetricsLogger

- (ATXUrgencyTuningGlobalMetricsLogger)init
{
  ATXUrgencyTuningGlobalMetricsLogger *v2;
  uint64_t v3;
  ATXPETEventTracker2Logger *eventTrackerLogger;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXUrgencyTuningGlobalMetricsLogger;
  v2 = -[ATXUrgencyTuningGlobalMetricsLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    eventTrackerLogger = v2->_eventTrackerLogger;
    v2->_eventTrackerLogger = (ATXPETEventTracker2Logger *)v3;

  }
  return v2;
}

- (void)logUrgencyTuningGlobalMetrics
{
  -[ATXUrgencyTuningGlobalMetricsLogger logUrgencyTuningGlobalMetricsWithXPCActivity:](self, "logUrgencyTuningGlobalMetricsWithXPCActivity:", 0);
}

- (void)logUrgencyTuningGlobalMetricsWithXPCActivity:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4 + -86400.0;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "engagementStatusOfActiveAndProminentNotificationsWithUrgency:sinceTimestamp:", 1, v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "didDefer"))
  {
    __atxlog_handle_metrics();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v9;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v6, "totalNotificationsPerAppFromStartTime:toEndTime:", v5, CFAbsoluteTimeGetCurrent());
    v7 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "didDefer"))
    {
      __atxlog_handle_metrics();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v12;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", buf, 0xCu);

      }
      v13 = v10;
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v13 = v7;
      v32 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v32)
      {
        v27 = v7;
        v28 = v6;
        v29 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v34 != v29)
              objc_enumerationMutation(v13);
            v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v31, "objectForKeyedSubscript:", v15, v27, v28);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "second");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntegerValue");

            if (v17)
            {
              objc_msgSend(v17, "first");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v13;
              v22 = objc_msgSend(v20, "unsignedIntegerValue");
              objc_msgSend(v17, "second");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "unsignedIntegerValue") + v22;

              objc_msgSend(v17, "first");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "unsignedIntegerValue");

              v13 = v21;
            }
            else
            {
              v24 = 0;
              v26 = 0;
            }
            -[ATXUrgencyTuningGlobalMetricsLogger logCountForNotificationWithBundleId:isTimeSensitiveNotification:isEngagedTimeSensitiveNotification:count:xpcActivity:](self, "logCountForNotificationWithBundleId:isTimeSensitiveNotification:isEngagedTimeSensitiveNotification:count:xpcActivity:", v15, 1, 1, v3, (double)v26);
            -[ATXUrgencyTuningGlobalMetricsLogger logCountForNotificationWithBundleId:isTimeSensitiveNotification:isEngagedTimeSensitiveNotification:count:xpcActivity:](self, "logCountForNotificationWithBundleId:isTimeSensitiveNotification:isEngagedTimeSensitiveNotification:count:xpcActivity:", v15, 1, 0, v3, (double)v24);
            -[ATXUrgencyTuningGlobalMetricsLogger logCountForNotificationWithBundleId:isTimeSensitiveNotification:isEngagedTimeSensitiveNotification:count:xpcActivity:](self, "logCountForNotificationWithBundleId:isTimeSensitiveNotification:isEngagedTimeSensitiveNotification:count:xpcActivity:", v15, 0, 0, v3, (double)(v19 - v24));

          }
          v32 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v32);
        v7 = v27;
        v6 = v28;
      }
    }

  }
}

- (void)logCountForNotificationWithBundleId:(id)a3 isTimeSensitiveNotification:(BOOL)a4 isEngagedTimeSensitiveNotification:(BOOL)a5 count:(double)a6 xpcActivity:(id)a7
{
  uint64_t v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v8 = a5;
  v9 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setBundleId:", v13);

  objc_msgSend(v14, "setIsTimeSensitiveNotification:", v9);
  objc_msgSend(v14, "setIsTimeSensitiveAndEngagedNotification:", v8);
  -[ATXPETEventTracker2Logger trackScalarForMessage:count:](self->_eventTrackerLogger, "trackScalarForMessage:count:", v14, (int)a6);
  LODWORD(v8) = objc_msgSend(v12, "didDefer");

  if ((_DWORD)v8)
  {
    __atxlog_handle_metrics();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", (uint8_t *)&v18, 0xCu);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTrackerLogger, 0);
}

@end
