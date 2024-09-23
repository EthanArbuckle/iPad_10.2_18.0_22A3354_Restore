@implementation ATXPartialIntentHandlingContext

- (id)handleAppLaunchAndReturnCompletedResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSString *v9;
  NSString *v10;
  NSDate *v11;
  void *v12;
  NSDate *currentAppSessionStartDate;
  double v14;
  NSString *currentApp;
  double v16;
  NSObject *v17;
  ATXAction *matchingAppSessionDonatedAction;
  NSDate *matchingAppSessionDonationDate;
  NSObject *v20;
  double v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  objc_class *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending_ecosystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:].cold.4((uint64_t)self, v4, v5);

  objc_msgSend(v4, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.springboard.today-view"));

  if (!objc_msgSend(v4, "starting") || (v8 & 1) != 0)
  {
    currentApp = self->_currentApp;
    v14 = 0.0;
    if (currentApp && self->_currentAppSessionStartDate)
    {
      objc_msgSend(v4, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", self->_currentAppSessionStartDate);
      v14 = v16;
      currentApp = self->_currentApp;
    }
    else
    {
      v12 = 0;
    }
    self->_currentApp = 0;

    currentAppSessionStartDate = self->_currentAppSessionStartDate;
    self->_currentAppSessionStartDate = 0;
  }
  else
  {
    objc_msgSend(v4, "bundleID");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_currentApp;
    self->_currentApp = v9;

    v11 = v6;
    v12 = 0;
    currentAppSessionStartDate = self->_currentAppSessionStartDate;
    self->_currentAppSessionStartDate = v11;
    v14 = 0.0;
  }

  __atxlog_handle_blending_ecosystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:].cold.3();

  if (self->_partiallyExecutedAction)
  {
    if (v12 && (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.shortcuts.runtime")) & 1) == 0 && v14 < 1.0)
    {
      matchingAppSessionDonatedAction = self->_matchingAppSessionDonatedAction;
      self->_matchingAppSessionDonatedAction = 0;

      matchingAppSessionDonationDate = self->_matchingAppSessionDonationDate;
      self->_matchingAppSessionDonationDate = 0;

      __atxlog_handle_blending_ecosystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412802;
        v31 = v29;
        v32 = 2112;
        v33 = v12;
        v34 = 2048;
        v35 = v14;
        _os_log_debug_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEBUG, "%@ - clearing any existing matching donations for short app session with bundleId %@, length: %f", (uint8_t *)&v30, 0x20u);

      }
    }
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_partiallyExecutedActionStartDate);
    if (v21 > 300.0)
    {
      -[ATXPartialIntentHandlingContext _tryUpdatePartialIntentSessionState](self, "_tryUpdatePartialIntentSessionState");
      v22 = (void *)-[NSMutableArray copy](self->_feedbackResults, "copy");
      -[ATXPartialIntentHandlingContext _resetInternalState](self, "_resetInternalState");
      __atxlog_handle_blending_ecosystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:].cold.1();
      goto LABEL_29;
    }
    objc_msgSend(v4, "bundleID");
    v23 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v23, "isEqualToString:", CFSTR("com.apple.shortcuts.runtime")) & 1) != 0)
    {
      v22 = 0;
LABEL_29:

      goto LABEL_30;
    }
    -[ATXAction bundleId](self->_partiallyExecutedAction, "bundleId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqualToString:", v25);

    if ((v26 & 1) == 0)
    {
      -[ATXPartialIntentHandlingContext _tryUpdatePartialIntentSessionState](self, "_tryUpdatePartialIntentSessionState");
      v22 = (void *)-[NSMutableArray copy](self->_feedbackResults, "copy");
      -[ATXPartialIntentHandlingContext _resetInternalState](self, "_resetInternalState");
      __atxlog_handle_blending_ecosystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:].cold.2();
      goto LABEL_29;
    }
  }
  v22 = 0;
LABEL_30:

  return v22;
}

- (ATXPartialIntentHandlingContext)init
{
  void *v3;
  ATXPartialIntentHandlingContext *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXPartialIntentHandlingContext initWithFeedbackResults:partiallyExecutedAction:partiallyExecutedActionStartDate:currentApp:currentAppSessionStartDate:shortcutsRuntimeDonatedAction:shortcutsRuntimeDonationDate:matchingAppSessionDonatedAction:matchingAppSessionDonationDate:](self, "initWithFeedbackResults:partiallyExecutedAction:partiallyExecutedActionStartDate:currentApp:currentAppSessionStartDate:shortcutsRuntimeDonatedAction:shortcutsRuntimeDonationDate:matchingAppSessionDonatedAction:matchingAppSessionDonationDate:", v3, 0, 0, 0, 0, 0, 0, 0, 0);

  return v4;
}

- (ATXPartialIntentHandlingContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ATXPartialIntentHandlingContext *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  __atxlog_handle_blending_ecosystem();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("feedbackResults"), v4, 1, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_msgSend(v4, "error"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v14 = (void *)MEMORY[0x1E0D81610];
    v15 = objc_opt_class();
    __atxlog_handle_blending_ecosystem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v15, CFSTR("partialAction"), v4, 0, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v13 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0D81610];
      v20 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("partialActionStartDate"), v4, 0, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v13 = 0;
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0D81610];
        v25 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v25, CFSTR("currentApp"), v4, 0, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v13 = 0;
        }
        else
        {
          v29 = (void *)MEMORY[0x1E0D81610];
          v30 = objc_opt_class();
          __atxlog_handle_blending_ecosystem();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v30, CFSTR("currentAppStartDate"), v4, 0, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "error");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            v13 = 0;
          }
          else
          {
            v59 = v32;
            v34 = (void *)MEMORY[0x1E0D81610];
            v35 = objc_opt_class();
            __atxlog_handle_blending_ecosystem();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v35, CFSTR("shortcutsRuntimeDonatedAction"), v4, 0, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "error");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              v13 = 0;
              v32 = v59;
            }
            else
            {
              v58 = v37;
              v39 = (void *)MEMORY[0x1E0D81610];
              v40 = objc_opt_class();
              __atxlog_handle_blending_ecosystem();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v40, CFSTR("shortcutsRuntimeDonationDate"), v4, 0, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v41);
              v57 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "error");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                v13 = 0;
                v37 = v58;
                v32 = v59;
                v43 = (void *)v57;
              }
              else
              {
                v44 = (void *)MEMORY[0x1E0D81610];
                v45 = objc_opt_class();
                __atxlog_handle_blending_ecosystem();
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v45, CFSTR("matchingAppSessionAction"), v4, 0, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v46);
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v4, "error");
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                if (v47)
                {
                  v13 = 0;
                  v37 = v58;
                  v32 = v59;
                  v43 = (void *)v57;
                }
                else
                {
                  v48 = (void *)MEMORY[0x1E0D81610];
                  v49 = objc_opt_class();
                  __atxlog_handle_blending_ecosystem();
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v49, CFSTR("matchingAppSessionDonationDate"), v4, 0, CFSTR("com.apple.proactive.ATXPartialIntentHandlingContext"), -1, v50);
                  v51 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v4, "error");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();

                  v55 = (void *)v51;
                  if (v52)
                  {
                    v13 = 0;
                    v37 = v58;
                    v32 = v59;
                    v43 = (void *)v57;
                  }
                  else
                  {
                    v43 = (void *)v57;
                    v54 = v51;
                    v37 = v58;
                    v32 = v59;
                    self = -[ATXPartialIntentHandlingContext initWithFeedbackResults:partiallyExecutedAction:partiallyExecutedActionStartDate:currentApp:currentAppSessionStartDate:shortcutsRuntimeDonatedAction:shortcutsRuntimeDonationDate:matchingAppSessionDonatedAction:matchingAppSessionDonationDate:](self, "initWithFeedbackResults:partiallyExecutedAction:partiallyExecutedActionStartDate:currentApp:currentAppSessionStartDate:shortcutsRuntimeDonatedAction:shortcutsRuntimeDonationDate:matchingAppSessionDonatedAction:matchingAppSessionDonationDate:", v11, v17, v22, v27, v59, v58, v57, v56, v54, v55);
                    v13 = self;
                  }

                }
              }

            }
          }

        }
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (ATXPartialIntentHandlingContext)initWithFeedbackResults:(id)a3 partiallyExecutedAction:(id)a4 partiallyExecutedActionStartDate:(id)a5 currentApp:(id)a6 currentAppSessionStartDate:(id)a7 shortcutsRuntimeDonatedAction:(id)a8 shortcutsRuntimeDonationDate:(id)a9 matchingAppSessionDonatedAction:(id)a10 matchingAppSessionDonationDate:(id)a11
{
  id v18;
  ATXPartialIntentHandlingContext *v19;
  ATXPartialIntentHandlingContext *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)ATXPartialIntentHandlingContext;
  v19 = -[ATXPartialIntentHandlingContext init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_feedbackResults, a3);
    objc_storeStrong((id *)&v20->_partiallyExecutedAction, a4);
    objc_storeStrong((id *)&v20->_partiallyExecutedActionStartDate, a5);
    objc_storeStrong((id *)&v20->_currentApp, a6);
    objc_storeStrong((id *)&v20->_currentAppSessionStartDate, a7);
    objc_storeStrong((id *)&v20->_shortcutsRuntimeDonatedAction, a8);
    objc_storeStrong((id *)&v20->_shortcutsRuntimeDonationDate, a9);
    objc_storeStrong((id *)&v20->_matchingAppSessionDonatedAction, a10);
    objc_storeStrong((id *)&v20->_matchingAppSessionDonationDate, a11);
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *feedbackResults;
  id v5;

  feedbackResults = self->_feedbackResults;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", feedbackResults, CFSTR("feedbackResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partiallyExecutedAction, CFSTR("partialAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partiallyExecutedActionStartDate, CFSTR("partialActionStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentApp, CFSTR("currentApp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentAppSessionStartDate, CFSTR("currentAppStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortcutsRuntimeDonatedAction, CFSTR("shortcutsRuntimeDonatedAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortcutsRuntimeDonationDate, CFSTR("shortcutsRuntimeDonationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingAppSessionDonatedAction, CFSTR("matchingAppSessionAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingAppSessionDonationDate, CFSTR("matchingAppSessionDonationDate"));

}

- (id)handleNewFeedbackResultAndReturnCompletedResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  ATXProactiveSuggestionPartialIntentResultWrapper *v20;
  NSObject *v21;
  void *v22;
  NSDate *v23;
  NSDate *partiallyExecutedActionStartDate;
  NSObject *v25;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending_ecosystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXPartialIntentHandlingContext handleNewFeedbackResultAndReturnCompletedResults:].cold.4();

  -[ATXPartialIntentHandlingContext _partiallyExecutedSuggestionFromFeedbackResult:](self, "_partiallyExecutedSuggestionFromFeedbackResult:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atxActionExecutableObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    obj = (id)v7;
    v28 = v6;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = self->_feedbackResults;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "session");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "session");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if ((v17 & 1) == 0)
          {
            -[ATXPartialIntentHandlingContext _tryUpdatePartialIntentSessionState](self, "_tryUpdatePartialIntentSessionState");
            v18 = -[NSMutableArray copy](self->_feedbackResults, "copy");

            -[ATXPartialIntentHandlingContext _resetInternalState](self, "_resetInternalState");
            __atxlog_handle_blending_ecosystem();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              -[ATXPartialIntentHandlingContext handleNewFeedbackResultAndReturnCompletedResults:].cold.3(v33, (uint64_t)self, &v34, v19);

            v12 = (void *)v18;
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v20 = -[ATXProactiveSuggestionPartialIntentResultWrapper initWithUIFeedbackResult:]([ATXProactiveSuggestionPartialIntentResultWrapper alloc], "initWithUIFeedbackResult:", v4);
    v6 = v28;
    -[ATXProactiveSuggestionPartialIntentResultWrapper updatePartiallyExecutedActionWithProactiveSuggestion:](v20, "updatePartiallyExecutedActionWithProactiveSuggestion:", v28);
    -[NSMutableArray addObject:](self->_feedbackResults, "addObject:", v20);
    v8 = obj;
    objc_storeStrong((id *)&self->_partiallyExecutedAction, obj);
    objc_msgSend(v4, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sessionEndDate");
    v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
    partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
    self->_partiallyExecutedActionStartDate = v23;

    __atxlog_handle_blending_ecosystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[ATXPartialIntentHandlingContext handleNewFeedbackResultAndReturnCompletedResults:].cold.2();

  }
  else
  {
    -[ATXPartialIntentHandlingContext _tryUpdatePartialIntentSessionState](self, "_tryUpdatePartialIntentSessionState");
    v20 = (ATXProactiveSuggestionPartialIntentResultWrapper *)-[NSMutableArray mutableCopy](self->_feedbackResults, "mutableCopy");
    -[ATXPartialIntentHandlingContext _resetInternalState](self, "_resetInternalState");
    -[ATXProactiveSuggestionPartialIntentResultWrapper addObject:](v20, "addObject:", v4);
    __atxlog_handle_blending_ecosystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[ATXPartialIntentHandlingContext handleNewFeedbackResultAndReturnCompletedResults:].cold.1();

    v12 = (void *)-[ATXProactiveSuggestionPartialIntentResultWrapper copy](v20, "copy");
  }

  return v12;
}

- (id)handleNewIntentEventAndReturnCompletedResults:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSString *currentApp;
  _BOOL4 v20;
  NSString *v21;
  void *v22;
  _BOOL4 v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending_ecosystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413058;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - got intent event with bundleId: %@ class: %@ date: %@", (uint8_t *)&v25, 0x2Au);

  }
  objc_msgSend(v4, "absoluteTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_partiallyExecutedAction)
  {
    objc_msgSend(v11, "timeIntervalSinceDate:", self->_partiallyExecutedActionStartDate);
    if (v13 <= 18000.0)
    {
      -[ATXAction bundleId](self->_partiallyExecutedAction, "bundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if ((v18 & 1) != 0)
      {
        currentApp = self->_currentApp;
        v20 = -[NSString isEqualToString:](currentApp, "isEqualToString:", CFSTR("com.apple.shortcuts.runtime"));
        v21 = self->_currentApp;
        -[ATXAction bundleId](self->_partiallyExecutedAction, "bundleId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[NSString isEqualToString:](v21, "isEqualToString:", v22);

        -[ATXPartialIntentHandlingContext atxActionFromIntentEvent:](self, "atxActionFromIntentEvent:", v4);
        v15 = objc_claimAutoreleasedReturnValue();
        if (currentApp)
        {
          if (v20)
          {
            -[ATXPartialIntentHandlingContext _tryUpdateShortcutsRuntimeDonatedAction:eventDate:](self, "_tryUpdateShortcutsRuntimeDonatedAction:eventDate:", v15, v12);
          }
          else if (v23)
          {
            -[ATXPartialIntentHandlingContext _tryUpdateMatchingAppSessionDonatedAction:eventDate:](self, "_tryUpdateMatchingAppSessionDonatedAction:eventDate:", v15, v12);
          }
        }
        v14 = 0;
      }
      else
      {
        -[ATXPartialIntentHandlingContext _tryUpdatePartialIntentSessionState](self, "_tryUpdatePartialIntentSessionState");
        v14 = (void *)-[NSMutableArray copy](self->_feedbackResults, "copy");
        -[ATXPartialIntentHandlingContext _resetInternalState](self, "_resetInternalState");
        __atxlog_handle_blending_ecosystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[ATXPartialIntentHandlingContext handleNewIntentEventAndReturnCompletedResults:].cold.2();
      }
    }
    else
    {
      -[ATXPartialIntentHandlingContext _tryUpdatePartialIntentSessionState](self, "_tryUpdatePartialIntentSessionState");
      v14 = (void *)-[NSMutableArray copy](self->_feedbackResults, "copy");
      -[ATXPartialIntentHandlingContext _resetInternalState](self, "_resetInternalState");
      __atxlog_handle_blending_ecosystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ATXPartialIntentHandlingContext handleAppLaunchAndReturnCompletedResults:].cold.1();
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_resetInternalState
{
  ATXAction *partiallyExecutedAction;
  NSDate *partiallyExecutedActionStartDate;
  ATXAction *shortcutsRuntimeDonatedAction;
  NSDate *shortcutsRuntimeDonationDate;
  ATXAction *matchingAppSessionDonatedAction;
  NSDate *matchingAppSessionDonationDate;

  -[NSMutableArray removeAllObjects](self->_feedbackResults, "removeAllObjects");
  partiallyExecutedAction = self->_partiallyExecutedAction;
  self->_partiallyExecutedAction = 0;

  partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
  self->_partiallyExecutedActionStartDate = 0;

  shortcutsRuntimeDonatedAction = self->_shortcutsRuntimeDonatedAction;
  self->_shortcutsRuntimeDonatedAction = 0;

  shortcutsRuntimeDonationDate = self->_shortcutsRuntimeDonationDate;
  self->_shortcutsRuntimeDonationDate = 0;

  matchingAppSessionDonatedAction = self->_matchingAppSessionDonatedAction;
  self->_matchingAppSessionDonatedAction = 0;

  matchingAppSessionDonationDate = self->_matchingAppSessionDonationDate;
  self->_matchingAppSessionDonationDate = 0;

}

- (void)_tryUpdatePartialIntentSessionState
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

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%@ - partial intent was abandoned, no match with app intent", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_tryUpdateShortcutsRuntimeDonatedAction:(id)a3 eventDate:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSDate *shortcutsRuntimeDonationDate;
  ATXAction *shortcutsRuntimeDonatedAction;
  int v14;
  void *v15;
  __int16 v16;
  NSDate *v17;
  __int16 v18;
  ATXAction *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7 && !self->_shortcutsRuntimeDonatedAction)
  {
    objc_storeStrong((id *)&self->_shortcutsRuntimeDonatedAction, a3);
    objc_storeStrong((id *)&self->_shortcutsRuntimeDonationDate, a4);
    __atxlog_handle_feedback();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      shortcutsRuntimeDonatedAction = self->_shortcutsRuntimeDonatedAction;
      shortcutsRuntimeDonationDate = self->_shortcutsRuntimeDonationDate;
      v14 = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = shortcutsRuntimeDonationDate;
      v18 = 2112;
      v19 = shortcutsRuntimeDonatedAction;
      _os_log_debug_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEBUG, "%@ - updated shortcuts runtime donation with date: %@, action: %@", (uint8_t *)&v14, 0x20u);

    }
  }

}

- (void)_tryUpdateMatchingAppSessionDonatedAction:(id)a3 eventDate:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSDate *matchingAppSessionDonationDate;
  ATXAction *matchingAppSessionDonatedAction;
  int v14;
  void *v15;
  __int16 v16;
  NSDate *v17;
  __int16 v18;
  ATXAction *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7 && !self->_matchingAppSessionDonatedAction)
  {
    objc_storeStrong((id *)&self->_matchingAppSessionDonatedAction, a3);
    objc_storeStrong((id *)&self->_matchingAppSessionDonationDate, a4);
    __atxlog_handle_feedback();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      matchingAppSessionDonatedAction = self->_matchingAppSessionDonatedAction;
      matchingAppSessionDonationDate = self->_matchingAppSessionDonationDate;
      v14 = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = matchingAppSessionDonationDate;
      v18 = 2112;
      v19 = matchingAppSessionDonatedAction;
      _os_log_debug_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEBUG, "%@ - updated app session donation with date: %@, action: %@", (uint8_t *)&v14, 0x20u);

    }
  }

}

- (BOOL)_isPartialEngagementForATXAction:(id)a3 withMatchingDonatedAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "actionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", v7);
  return (char)v5;
}

- (BOOL)_isCompleteEngagementForATXAction:(id)a3 withMatchingDonatedAction:(id)a4
{
  return +[_ATXActionUtils isContainmentBetweenAction:other:](_ATXActionUtils, "isContainmentBetweenAction:other:", a3, a4);
}

- (id)_partiallyExecutedSuggestionFromFeedbackResult:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a3, "engagedSuggestions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "atxActionExecutableObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "intent");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            objc_msgSend(v9, "intent");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "atx_supportsBackgroundExecution");

            if (!v13)
            {
              v4 = v7;

              goto LABEL_13;
            }
          }
        }

      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)atxActionFromIntentEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = objc_opt_class();
  objc_msgSend(v4, "interaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v8, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  objc_autoreleasePoolPop(v5);
  if (v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0CF8C20]);
    objc_msgSend(v9, "intent");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    objc_msgSend(v4, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = 0;
    v15 = (void *)objc_msgSend(v11, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v12, v13, v14, 0, 0, 0, v17, 0, 0);

  }
  else
  {
    __atxlog_handle_feedback();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXPartialIntentHandlingContext atxActionFromIntentEvent:].cold.1((uint64_t)self, (uint64_t)v10, v12);
    v15 = 0;
  }

  return v15;
}

- (NSArray)feedbackResults
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_feedbackResults, "copy");
}

- (BOOL)isEqual:(id)a3
{
  ATXPartialIntentHandlingContext *v4;
  ATXPartialIntentHandlingContext *v5;
  BOOL v6;

  v4 = (ATXPartialIntentHandlingContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPartialIntentHandlingContext isEqualToATXPartialIntentHandlingContext:](self, "isEqualToATXPartialIntentHandlingContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXPartialIntentHandlingContext:(id)a3
{
  id *v4;
  NSMutableArray *feedbackResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char v9;
  ATXAction *partiallyExecutedAction;
  ATXAction *v11;
  ATXAction *v12;
  ATXAction *v13;
  char v14;
  NSDate *partiallyExecutedActionStartDate;
  NSDate *v16;
  NSDate *v17;
  NSDate *v18;
  char v19;
  NSString *currentApp;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSDate *currentAppSessionStartDate;
  NSDate *v26;
  NSDate *v27;
  NSDate *v28;
  char v29;
  ATXAction *shortcutsRuntimeDonatedAction;
  ATXAction *v31;
  ATXAction *v32;
  ATXAction *v33;
  char v34;
  NSDate *shortcutsRuntimeDonationDate;
  NSDate *v36;
  NSDate *v37;
  NSDate *v38;
  char v39;
  ATXAction *matchingAppSessionDonatedAction;
  ATXAction *v41;
  ATXAction *v42;
  ATXAction *v43;
  char v44;
  char v45;
  NSDate *v47;
  NSDate *v48;

  v4 = (id *)a3;
  feedbackResults = self->_feedbackResults;
  v6 = (NSMutableArray *)v4[1];
  if (feedbackResults == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = feedbackResults;
    v9 = -[NSMutableArray isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_31;
  }
  partiallyExecutedAction = self->_partiallyExecutedAction;
  v11 = (ATXAction *)v4[2];
  if (partiallyExecutedAction == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = partiallyExecutedAction;
    v14 = -[ATXAction isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_31;
  }
  partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
  v16 = (NSDate *)v4[3];
  if (partiallyExecutedActionStartDate == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = partiallyExecutedActionStartDate;
    v19 = -[NSDate isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_31;
  }
  currentApp = self->_currentApp;
  v21 = (NSString *)v4[4];
  if (currentApp == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = currentApp;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_31;
  }
  currentAppSessionStartDate = self->_currentAppSessionStartDate;
  v26 = (NSDate *)v4[5];
  if (currentAppSessionStartDate == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = currentAppSessionStartDate;
    v29 = -[NSDate isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_31;
  }
  shortcutsRuntimeDonatedAction = self->_shortcutsRuntimeDonatedAction;
  v31 = (ATXAction *)v4[6];
  if (shortcutsRuntimeDonatedAction == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = shortcutsRuntimeDonatedAction;
    v34 = -[ATXAction isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_31;
  }
  shortcutsRuntimeDonationDate = self->_shortcutsRuntimeDonationDate;
  v36 = (NSDate *)v4[7];
  if (shortcutsRuntimeDonationDate == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = shortcutsRuntimeDonationDate;
    v39 = -[NSDate isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
      goto LABEL_31;
  }
  matchingAppSessionDonatedAction = self->_matchingAppSessionDonatedAction;
  v41 = (ATXAction *)v4[8];
  if (matchingAppSessionDonatedAction == v41)
  {

  }
  else
  {
    v42 = v41;
    v43 = matchingAppSessionDonatedAction;
    v44 = -[ATXAction isEqual:](v43, "isEqual:", v42);

    if ((v44 & 1) == 0)
    {
LABEL_31:
      v45 = 0;
      goto LABEL_32;
    }
  }
  v47 = self->_matchingAppSessionDonationDate;
  v48 = v47;
  if (v47 == v4[9])
    v45 = 1;
  else
    v45 = -[NSDate isEqual:](v47, "isEqual:");

LABEL_32:
  return v45;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSMutableArray hash](self->_feedbackResults, "hash");
  v4 = -[ATXAction hash](self->_partiallyExecutedAction, "hash") - v3 + 32 * v3;
  v5 = -[NSDate hash](self->_partiallyExecutedActionStartDate, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_currentApp, "hash") - v5 + 32 * v5;
  v7 = -[NSDate hash](self->_currentAppSessionStartDate, "hash") - v6 + 32 * v6;
  v8 = -[ATXAction hash](self->_shortcutsRuntimeDonatedAction, "hash") - v7 + 32 * v7;
  v9 = -[NSDate hash](self->_shortcutsRuntimeDonationDate, "hash") - v8 + 32 * v8;
  v10 = -[ATXAction hash](self->_matchingAppSessionDonatedAction, "hash") - v9 + 32 * v9;
  return -[NSDate hash](self->_matchingAppSessionDonationDate, "hash") - v10 + 32 * v10;
}

- (ATXAction)partiallyExecutedAction
{
  return self->_partiallyExecutedAction;
}

- (NSDate)partiallyExecutedActionStartDate
{
  return self->_partiallyExecutedActionStartDate;
}

- (NSString)currentApp
{
  return self->_currentApp;
}

- (NSDate)currentAppSessionStartDate
{
  return self->_currentAppSessionStartDate;
}

- (ATXAction)shortcutsRuntimeDonatedAction
{
  return self->_shortcutsRuntimeDonatedAction;
}

- (NSDate)shortcutsRuntimeDonationDate
{
  return self->_shortcutsRuntimeDonationDate;
}

- (ATXAction)matchingAppSessionDonatedAction
{
  return self->_matchingAppSessionDonatedAction;
}

- (NSDate)matchingAppSessionDonationDate
{
  return self->_matchingAppSessionDonationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingAppSessionDonationDate, 0);
  objc_storeStrong((id *)&self->_matchingAppSessionDonatedAction, 0);
  objc_storeStrong((id *)&self->_shortcutsRuntimeDonationDate, 0);
  objc_storeStrong((id *)&self->_shortcutsRuntimeDonatedAction, 0);
  objc_storeStrong((id *)&self->_currentAppSessionStartDate, 0);
  objc_storeStrong((id *)&self->_currentApp, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedActionStartDate, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedAction, 0);
  objc_storeStrong((id *)&self->_feedbackResults, 0);
}

- (void)handleNewFeedbackResultAndReturnCompletedResults:.cold.1()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%@ - new session didn't have partial intent engagement - ending all currently tracked partial sessions", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)handleNewFeedbackResultAndReturnCompletedResults:.cold.2()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%@ - adding new partial intent engagement session to currently tracked partial sessions", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)handleNewFeedbackResultAndReturnCompletedResults:(_QWORD *)a3 .cold.3(uint8_t *a1, uint64_t a2, _QWORD *a3, NSObject *a4)
{
  objc_class *v7;
  void *v8;

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl(&dword_1C9A3B000, a4, OS_LOG_TYPE_DEBUG, "%@ - new partial intent engagement session does not match currently tracked partial intent session - ending all currently tracked partial sessions", a1, 0xCu);

}

- (void)handleNewFeedbackResultAndReturnCompletedResults:.cold.4()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - new feedback result event of: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)handleAppLaunchAndReturnCompletedResults:.cold.1()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%@ - ending currently tracked partial sessions due to > 5 minute expiration", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)handleAppLaunchAndReturnCompletedResults:.cold.2()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%@ - ending currently tracked partial sessions due to different app launch", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)handleAppLaunchAndReturnCompletedResults:.cold.3()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - set new _currentApp to: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)handleAppLaunchAndReturnCompletedResults:(NSObject *)a3 .cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "absoluteTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413314;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  v15 = 1024;
  v16 = objc_msgSend(a2, "starting");
  v17 = 1024;
  v18 = objc_msgSend(a2, "type");
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "%@ - got app launch event of: %@ at %@, starting: %{BOOL}d type: %d", (uint8_t *)&v9, 0x2Cu);

}

- (void)handleNewIntentEventAndReturnCompletedResults:.cold.2()
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

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%@ - ending currently tracked partial sessions due to intent donation from different bundleId", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)atxActionFromIntentEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint8_t v6[24];

  v4 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - IntentEventIsCompleteEngagement - Error unarchiving intent: %@", v6, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
