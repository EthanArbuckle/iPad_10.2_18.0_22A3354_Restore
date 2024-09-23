@implementation ATXMFeedbackConversionLogger

+ (void)logUserInteractionFeedbackWithEngagementType:(int)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  __CFString *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CF9508];
  v9 = a5;
  objc_msgSend(v8, "stringForConsumerSubtype:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setEngagementType:", v6);
  objc_msgSend(v11, "setConsumerSubType:", v10);
  objc_msgSend(v9, "trackScalarForMessage:", v11);

  __atxlog_handle_metrics();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromClass((Class)a1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v6)
    {
      if ((_DWORD)v6 == 1)
      {
        v14 = CFSTR("Rejection");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = CFSTR("Engagement");
    }
    *(_DWORD *)buf = 138412802;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMFeedbackUIInteractionsTracker with engagementType: %@ and consumerSubType: %@", buf, 0x20u);

  }
}

+ (void)logRecordedFeedbackWithEngagementType:(int)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  __CFString *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CF9508];
  v9 = a5;
  objc_msgSend(v8, "stringForConsumerSubtype:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setEngagementType:", v6);
  objc_msgSend(v11, "setConsumerSubType:", v10);
  objc_msgSend(v9, "trackScalarForMessage:", v11);

  __atxlog_handle_metrics();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromClass((Class)a1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v6)
    {
      if ((_DWORD)v6 == 1)
      {
        v14 = CFSTR("Rejection");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = CFSTR("Engagement");
    }
    *(_DWORD *)buf = 138412802;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMFeedbackRecordedTracker with engagementType: %@ and consumerSubType: %@", buf, 0x20u);

  }
}

@end
