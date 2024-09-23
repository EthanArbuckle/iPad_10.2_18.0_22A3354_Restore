@implementation ATXWatchSmartStacksSender

- (ATXWatchSmartStacksSender)init
{
  ATXWatchSmartStacksSender *v2;
  ATXPowerThrottlingCreditPoolConfig *v3;
  ATXPowerThrottlingCreditPool *v4;
  ATXPowerThrottlingCreditPool *powerThrottlingCreditPool;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXWatchSmartStacksSender;
  v2 = -[ATXWatchSmartStacksSender init](&v7, sel_init);
  if (v2)
  {
    v3 = -[ATXPowerThrottlingCreditPoolConfig initWithIdentifier:maxCredits:secondsToReplenishOneCredit:loggingSubsystem:loggingCategory:]([ATXPowerThrottlingCreditPoolConfig alloc], "initWithIdentifier:maxCredits:secondsToReplenishOneCredit:loggingSubsystem:loggingCategory:", CFSTR("ATXWatchSmartStacksSender"), 20, 3600, CFSTR("com.apple.duetexpertd.atx"), CFSTR("watch"));
    v4 = -[ATXPowerThrottlingCreditPool initWithConfig:]([ATXPowerThrottlingCreditPool alloc], "initWithConfig:", v3);
    powerThrottlingCreditPool = v2->_powerThrottlingCreditPool;
    v2->_powerThrottlingCreditPool = v4;

  }
  return v2;
}

- (void)blendingLayerDidUpdateUICache:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  Class v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  ATXPowerThrottlingCreditPool *powerThrottlingCreditPool;
  id v53;
  int64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  NSObject *v61;
  id v62;
  id v63[3];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE buf[24];
  void *v69;
  uint64_t *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!NanoHomeScreenServicesLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E82E96C0;
    *(_QWORD *)&buf[16] = 0;
    NanoHomeScreenServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (NanoHomeScreenServicesLibraryCore_frameworkLibrary)
  {
    v64 = 0;
    v65 = &v64;
    v66 = 0x2050000000;
    v5 = (void *)getNHSSRelevantWidgetDefaultsClass_softClass;
    v67 = getNHSSRelevantWidgetDefaultsClass_softClass;
    if (!getNHSSRelevantWidgetDefaultsClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getNHSSRelevantWidgetDefaultsClass_block_invoke;
      v69 = &unk_1E82DA7D8;
      v70 = &v64;
      __getNHSSRelevantWidgetDefaultsClass_block_invoke((uint64_t)buf);
      v5 = (void *)v65[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v64, 8);
    v64 = 0;
    v65 = &v64;
    v66 = 0x2050000000;
    v7 = (void *)getNHSSRelevantWidgetClass_softClass;
    v67 = getNHSSRelevantWidgetClass_softClass;
    if (!getNHSSRelevantWidgetClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getNHSSRelevantWidgetClass_block_invoke;
      v69 = &unk_1E82DA7D8;
      v70 = &v64;
      __getNHSSRelevantWidgetClass_block_invoke((uint64_t)buf);
      v7 = (void *)v65[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v64, 8);
    if (v6 && v8)
    {
      objc_msgSend(v4, "allSuggestionsInLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (unint64_t)objc_msgSend(v9, "count") > 1;

      if (v10)
      {
        __atxlog_handle_watch();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:].cold.3(v11);

      }
      objc_msgSend(v4, "allSuggestionsInLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();

      -[NSObject executableSpecification](v13, "executableSpecification");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "executableObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = NSClassFromString(CFSTR("ATXInfoSuggestion"));
      v17 = v15;
      if (v16)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v33 = v18;

      -[ATXWatchSmartStacksSender _uniqueKeyForRememberingLastInfoSuggestion:](self, "_uniqueKeyForRememberingLastInfoSuggestion:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      -[ATXWatchSmartStacksSender _uniqueKeyForForLastInfoSuggestionSentToWatch](self, "_uniqueKeyForForLastInfoSuggestionSentToWatch");
      v35 = objc_claimAutoreleasedReturnValue();
      __atxlog_handle_watch();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "%s: UI cache updated with suggestion ID: %@", buf, 0x16u);
      }

      if (!(v34 | v35))
      {
        __atxlog_handle_watch();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v38 = "Current suggestions and previous suggestions are empty. No need to sync.";
          goto LABEL_31;
        }
LABEL_46:

        goto LABEL_47;
      }
      if (objc_msgSend((id)v34, "isEqualToString:", v35))
      {
        __atxlog_handle_watch();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v38 = "Not sending the same Watch Smart Stack suggestions";
LABEL_31:
          _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
          goto LABEL_46;
        }
        goto LABEL_46;
      }
      v39 = objc_alloc(MEMORY[0x1E0C99EA0]);
      v57 = (void *)objc_msgSend(v39, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v41 = v40;
      v58 = (void *)objc_opt_new();
      if (v33)
      {
        v42 = objc_alloc_init(MEMORY[0x1E0CF8EB8]);
        v43 = objc_msgSend(v42, "blendingConfidenceCategoryForInfoConfidenceLevel:", objc_msgSend(v33, "confidenceLevel"));

        v54 = -[ATXWatchSmartStacksSender ATXProactiveSuggestionConfidenceCategoryToNHSSRelevantWidgetConfidenceCategory:](self, "ATXProactiveSuggestionConfidenceCategoryToNHSSRelevantWidgetConfidenceCategory:", v43);
        v44 = [v8 alloc];
        objc_msgSend(v33, "widgetBundleIdentifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "appBundleIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "widgetKind");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "intent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v44, "initWithExtensionBundleIdentifier:appBundleIdentifier:widgetKind:confidenceCategory:intentIndexingHash:", v56, v55, v45, v54, objc_msgSend(v46, "atx_indexingHash"));

        objc_msgSend(v58, "addObject:", v47);
      }
      if (!v34 || v35)
      {
        if (v34 || !v35)
        {
          if (!v34 || !v35)
            goto LABEL_45;
          __atxlog_handle_watch();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v35;
            v49 = "Sending updated Watch Smart Stack suggestion: %@ (last one: %@)";
            v50 = v48;
            v51 = 22;
            goto LABEL_43;
          }
        }
        else
        {
          __atxlog_handle_watch();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v35;
            v49 = "Retracting Watch Smart Stack suggestion: %@";
            goto LABEL_42;
          }
        }
      }
      else
      {
        __atxlog_handle_watch();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v34;
          v49 = "Sending new Watch Smart Stack suggestion: %@";
LABEL_42:
          v50 = v48;
          v51 = 12;
LABEL_43:
          _os_log_impl(&dword_1C9A3B000, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
        }
      }

LABEL_45:
      objc_initWeak((id *)buf, self);
      powerThrottlingCreditPool = self->_powerThrottlingCreditPool;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __59__ATXWatchSmartStacksSender_blendingLayerDidUpdateUICache___block_invoke;
      v59[3] = &unk_1E82E96A0;
      v63[1] = v6;
      v53 = v58;
      v60 = v53;
      v37 = v57;
      v61 = v37;
      v63[2] = v41;
      objc_copyWeak(v63, (id *)buf);
      v62 = v33;
      -[ATXPowerThrottlingCreditPool consumeCredits:toRun:](powerThrottlingCreditPool, "consumeCredits:toRun:", 1, v59);

      objc_destroyWeak(v63);
      objc_destroyWeak((id *)buf);

      goto LABEL_46;
    }
    __atxlog_handle_watch();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:].cold.2(v13, v26, v27, v28, v29, v30, v31, v32);
  }
  else
  {
    __atxlog_handle_watch();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:].cold.1(v13, v19, v20, v21, v22, v23, v24, v25);
  }
LABEL_47:

}

void __59__ATXWatchSmartStacksSender_blendingLayerDidUpdateUICache___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 64), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelevantWidgets:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "setDouble:forKey:", CFSTR("LastWatchSmartStackSuggestionSyncTimestampKey"), *(double *)(a1 + 72));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_saveUniqueKeyForLastInfoSuggestionSentToWatch:", *(_QWORD *)(a1 + 48));

}

- (id)_uniqueKeyForRememberingLastInfoSuggestion:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3940];
    v4 = a3;
    v5 = [v3 alloc];
    objc_msgSend(v4, "appBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@-%@-%@-%lld"), v6, v7, v8, objc_msgSend(v9, "atx_indexingHash"));
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_uniqueKeyForForLastInfoSuggestionSentToWatch
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "stringForKey:", CFSTR("LastWatchSmartStackSuggestionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_saveUniqueKeyForLastInfoSuggestionSentToWatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v6 = v5;
  if (v8)
  {
    -[ATXWatchSmartStacksSender _uniqueKeyForRememberingLastInfoSuggestion:](self, "_uniqueKeyForRememberingLastInfoSuggestion:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("LastWatchSmartStackSuggestionIdentifier"));

  }
  else
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("LastWatchSmartStackSuggestionIdentifier"));
  }

}

- (int64_t)ATXProactiveSuggestionConfidenceCategoryToNHSSRelevantWidgetConfidenceCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    return 0;
  else
    return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerThrottlingCreditPool, 0);
}

- (void)blendingLayerDidUpdateUICache:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "NanoHomeScreenServices failed to softlink on iOS. This should never happen on iOS. Unable to sync.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)blendingLayerDidUpdateUICache:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Changes haven't landed in NanoHomeScreenServices yet. Unable to sync.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)blendingLayerDidUpdateUICache:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Unexpected number of Watch Smart Stack suggestions; the layout selector should only yield up to one",
    v1,
    2u);
  OUTLINED_FUNCTION_4();
}

@end
