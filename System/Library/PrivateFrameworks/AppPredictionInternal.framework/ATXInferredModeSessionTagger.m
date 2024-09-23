@implementation ATXInferredModeSessionTagger

- (void)inferModesForLastDay
{
  -[ATXInferredModeSessionTagger inferModesForLastDayWithXPCActivity:](self, "inferModesForLastDayWithXPCActivity:", 0);
}

- (void)inferModesForLastDayWithXPCActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  ATXAppLaunchInferredModeSessionBiomeStream *v8;
  ATXModeScoringSessionRange *v9;
  void *v10;
  ATXModeScoringSessionRange *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Started app-based mode inference", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(ATXAppLaunchInferredModeSessionBiomeStream);
  v9 = [ATXModeScoringSessionRange alloc];
  v10 = (void *)objc_opt_new();
  v11 = -[ATXModeScoringSessionRange initWithStartDate:endDate:modeEntityStore:](v9, "initWithStartDate:endDate:modeEntityStore:", v6, v7, v10);

  -[ATXModeScoringSessionRange populateInitialSessionsFromScreenTransitions](v11, "populateInitialSessionsFromScreenTransitions");
  __atxlog_handle_modes();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Populated initial sessions from CoreDuet for app-based mode inference", buf, 2u);
  }

  if ((objc_msgSend(v4, "didDefer") & 1) == 0)
  {
    -[ATXModeScoringSessionRange attachAppLaunches](v11, "attachAppLaunches");
    __atxlog_handle_modes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Attached app launches to sessions for app-based mode inference", buf, 2u);
    }

    if ((objc_msgSend(v4, "didDefer") & 1) == 0)
    {
      -[ATXModeScoringSessionRange coalesceSessions](v11, "coalesceSessions");
      __atxlog_handle_modes();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Coalesced sessions for app-based mode inference", buf, 2u);
      }

      if ((objc_msgSend(v4, "didDefer") & 1) == 0)
      {
        -[ATXModeScoringSessionRange filterSessions](v11, "filterSessions");
        __atxlog_handle_modes();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Filtered out ineligible sessions for app-based mode inference", buf, 2u);
        }

        if ((objc_msgSend(v4, "didDefer") & 1) == 0)
        {
          v24 = v6;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          -[ATXModeScoringSessionRange sessions](v11, "sessions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v26 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                if (objc_msgSend(v21, "isLabeled"))
                {
                  -[ATXInferredModeSessionTagger biomeSessionFromScoredSession:](self, "biomeSessionFromScoredSession:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ATXAppLaunchInferredModeSessionBiomeStream sendEvent:](v8, "sendEvent:", v22);

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
            }
            while (v18);
          }

          __atxlog_handle_modes();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "Finished app-based mode inference", buf, 2u);
          }

          v6 = v24;
        }
      }
    }
  }

}

- (id)biomeSessionFromScoredSession:(id)a3
{
  id v3;
  ATXUnifiedInferredActivitySession *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "topMode");
  v4 = [ATXUnifiedInferredActivitySession alloc];
  objc_msgSend(v3, "startTimestamp");
  v6 = v5;
  objc_msgSend(v3, "endTimestamp");
  v8 = v7;

  return -[ATXUnifiedInferredActivitySession initFromStartTime:endTime:source:activityType:confidence:](v4, "initFromStartTime:endTime:source:activityType:confidence:", CFSTR("appLaunchInferredMode"), ATXActivityTypeFromMode(), v6, v8, 1.0);
}

@end
