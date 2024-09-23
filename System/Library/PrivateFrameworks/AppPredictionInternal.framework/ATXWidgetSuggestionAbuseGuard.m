@implementation ATXWidgetSuggestionAbuseGuard

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global);
  return (id)sharedInstance__pasExprOnceResult;
}

void __47__ATXWidgetSuggestionAbuseGuard_sharedInstance__block_invoke()
{
  void *v0;
  ATXWidgetSuggestionAbuseGuard *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = [ATXWidgetSuggestionAbuseGuard alloc];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXWidgetSuggestionAbuseGuard initWithConfig:store:](v1, "initWithConfig:store:", v2, v3);
  v5 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

- (ATXWidgetSuggestionAbuseGuard)initWithConfig:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  ATXWidgetSuggestionAbuseGuard *v9;
  ATXWidgetSuggestionAbuseGuard *v10;
  uint64_t v11;
  NSDate *scheduledRefreshDate;
  ATXInformationFilter *v13;
  ATXInformationFilter *filter;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXWidgetSuggestionAbuseGuard;
  v9 = -[ATXWidgetSuggestionAbuseGuard init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeStrong((id *)&v10->_store, a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v11 = objc_claimAutoreleasedReturnValue();
    scheduledRefreshDate = v10->_scheduledRefreshDate;
    v10->_scheduledRefreshDate = (NSDate *)v11;

    v13 = -[ATXInformationFilter initWithStore:abuseControlConfig:]([ATXInformationFilter alloc], "initWithStore:abuseControlConfig:", v10->_store, v10->_config);
    filter = v10->_filter;
    v10->_filter = v13;

  }
  return v10;
}

- (BOOL)shouldDemoteSuggestionsForWidget:(id)a3 kind:(id)a4 intent:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  ATXInformationStore *store;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  double v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
  {
    LOBYTE(v29) = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("ATXWidgetKitDeveloperModeSkipEntitlementCheck"), (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)&v29))
    {

LABEL_6:
      __atxlog_handle_relevant_shortcut();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "intentDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 136315906;
        v30 = "-[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:]";
        v31 = 2112;
        v32 = v11;
        v33 = 2112;
        v34 = v9;
        v35 = 2112;
        v36 = v14;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%s: NO (WidgetKit Developer Mode enabled) for widget %@:%@:%@", (uint8_t *)&v29, 0x2Au);

      }
      v15 = 0;
      goto LABEL_25;
    }
    v12 = objc_msgSend(MEMORY[0x1E0CF8CE0], "isDebuggingAllowedForExtensionBundleId:", v11);

    if (v12)
      goto LABEL_6;
  }
  else
  {

  }
  v16 = -[ATXInformationFilter numberOfSeenRotationsForWidget:kind:intent:filterByClientModelId:](self->_filter, "numberOfSeenRotationsForWidget:kind:intent:filterByClientModelId:", v11, v9, v10, 0);
  v17 = -[ATXTimelineAbuseControlConfig hardRotationQuotaForWidgetWithIdentifier:kind:](self->_config, "hardRotationQuotaForWidgetWithIdentifier:kind:", v11, v9);
  if ((v17 & 0x8000000000000000) != 0 || v16 < v17)
  {
    -[ATXInformationStore mostRecentRotationRecordForWidget:kind:intent:considerStalenessRotation:filterByClientModelId:](self->_store, "mostRecentRotationRecordForWidget:kind:intent:considerStalenessRotation:filterByClientModelId:", v11, v9, v10, 0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    store = self->_store;
    -[NSObject rotationDate](v13, "rotationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationStore firstEngagementOfWidget:kind:intent:sinceTimestamp:](store, "firstEngagementOfWidget:kind:intent:sinceTimestamp:", v11, v9, v10, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && v21)
    {
      objc_msgSend(v21, "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject coolDownInterval](v13, "coolDownInterval");
      objc_msgSend(v22, "dateByAddingTimeInterval:");
      v23 = objc_claimAutoreleasedReturnValue();

      -[NSObject timeIntervalSinceNow](v23, "timeIntervalSinceNow");
      if (v24 > 0.0)
      {
        -[ATXWidgetSuggestionAbuseGuard _scheduleRefreshNoLaterThanDate:](self, "_scheduleRefreshNoLaterThanDate:", v23);
        __atxlog_handle_relevant_shortcut();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "intentDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 136315906;
          v30 = "-[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:]";
          v31 = 2112;
          v32 = v11;
          v33 = 2112;
          v34 = v9;
          v35 = 2112;
          v36 = v27;
          _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "%s: YES (in cool down) for widget %@:%@:%@", (uint8_t *)&v29, 0x2Au);

        }
        v15 = 1;
        goto LABEL_24;
      }

    }
    __atxlog_handle_relevant_shortcut();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "intentDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315906;
      v30 = "-[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:]";
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "%s: NO for widget %@:%@:%@", (uint8_t *)&v29, 0x2Au);

    }
    v15 = 0;
LABEL_24:

    goto LABEL_25;
  }
  __atxlog_handle_relevant_shortcut();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "intentDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136315906;
    v30 = "-[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:]";
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v9;
    v35 = 2112;
    v36 = v18;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%s: YES (exceeds quota) for widget %@:%@:%@", (uint8_t *)&v29, 0x2Au);

  }
  v15 = 1;
LABEL_25:

  return v15;
}

- (void)_scheduleRefreshNoLaterThanDate:(id)a3
{
  id v5;
  NSDate *scheduledRefreshDate;
  NSDate *v7;
  NSObject *v8;
  xpc_object_t v9;
  const char *v10;
  double v11;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  scheduledRefreshDate = self->_scheduledRefreshDate;
  -[NSDate earlierDate:](scheduledRefreshDate, "earlierDate:", v5);
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();

  if (scheduledRefreshDate != v7)
  {
    objc_storeStrong((id *)&self->_scheduledRefreshDate, a3);
    __atxlog_handle_relevant_shortcut();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[ATXWidgetSuggestionAbuseGuard _scheduleRefreshNoLaterThanDate:]";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: Updated refresh date to %@.", buf, 0x16u);
    }

    v9 = xpc_dictionary_create(0, 0, 0);
    v10 = (const char *)*MEMORY[0x1E0C80760];
    -[NSDate timeIntervalSinceNow](self->_scheduledRefreshDate, "timeIntervalSinceNow");
    xpc_dictionary_set_int64(v9, v10, (uint64_t)v11);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x1E0C80790], 300);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E0C808B8], 1);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E0C80898], 0);
    xpc_dictionary_set_string(v9, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__ATXWidgetSuggestionAbuseGuard__scheduleRefreshNoLaterThanDate___block_invoke;
    v12[3] = &unk_1E82DA770;
    v12[4] = self;
    atxRegisterCTSJobHandler("com.apple.duetexpertd.AbuseGuardRefresh", v9, v12);

  }
}

uint64_t __65__ATXWidgetSuggestionAbuseGuard__scheduleRefreshNoLaterThanDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePreviousVerdicts");
}

- (void)_invalidatePreviousVerdicts
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_relevant_shortcut();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ATXWidgetSuggestionAbuseGuard _invalidatePreviousVerdicts]";
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ATXWidgetSuggestionAbuseGuardRefresh"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledRefreshDate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
