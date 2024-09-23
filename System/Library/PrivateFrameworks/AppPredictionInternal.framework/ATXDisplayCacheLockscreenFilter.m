@implementation ATXDisplayCacheLockscreenFilter

+ (BOOL)shouldPredictActionOnLockScreen:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "criteria");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lockScreenEligible");

  return v4;
}

+ (id)indicesOfLockScreenActionsForActionPredictions:(id)a3 criteria:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[ATXLockscreenBlacklist sharedInstance](ATXLockscreenBlacklist, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isPredictionGloballyDisabled"))
  {
    +[ATXNotificationsLoggingServer sharedInstance](ATXNotificationsLoggingServer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getLockscreenBundleIds");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "blacklist");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __91__ATXDisplayCacheLockscreenFilter_indicesOfLockScreenActionsForActionPredictions_criteria___block_invoke;
    v23[3] = &unk_1E82DE3E8;
    v28 = a1;
    v14 = v22;
    v24 = v14;
    v15 = v12;
    v25 = v15;
    v27 = v7;
    v16 = v13;
    v26 = v16;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v23);
    v17 = objc_msgSend(v6, "count");
    v18 = objc_msgSend(v16, "count");
    __atxlog_handle_default();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:criteria:].cold.2(buf, v17 - v18, objc_msgSend(v6, "count"), v19);

    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v6, "objectsAtIndexes:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1, "_getPredictionConfidenceForActions:", v20) == 1)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", objc_msgSend(v16, "firstIndex"));

LABEL_12:
        goto LABEL_13;
      }

    }
    v10 = (void *)objc_opt_new();
    goto LABEL_12;
  }
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:criteria:].cold.1(v9);

  v10 = (void *)objc_opt_new();
LABEL_13:

  return v10;
}

void __91__ATXDisplayCacheLockscreenFilter_indicesOfLockScreenActionsForActionPredictions_criteria___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "predictedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isHeuristic"))
    {
      v7 = objc_msgSend(*(id *)(a1 + 64), "shouldPredictActionOnLockScreen:", v6);
    }
    else
    {
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "allowBehavioralPredictionsOnLockscreen");

    }
    objc_msgSend(v6, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_intents_bundleIdForDisplay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v6, "bundleId");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v14 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13);
    v15 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v13);
    v16 = *(_QWORD *)(a1 + 56);
    if (v16)
      v17 = (*(uint64_t (**)(uint64_t, id, uint64_t))(v16 + 16))(v16, v18, a3);
    else
      v17 = 1;
    if (((v7 ^ 1 | v15 | v14) & 1) == 0 && v17)
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3);

  }
}

+ (id)indicesOfLockScreenActionsForActionPredictions:(id)a3
{
  objc_msgSend(a1, "indicesOfLockScreenActionsForActionPredictions:criteria:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)_getPredictionConfidenceForActions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int v17;
  int v18;
  void *v19;
  float v20;
  float v21;
  double v22;
  double v23;
  double v24;
  float v25;
  float v26;
  double v27;
  double v28;
  double v29;
  Boolean keyExistsAndHasValidFormat;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predictedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predictedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHeuristic");

  if (!v10)
  {
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "histogramForLaunchType:", 14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v32[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "totalLaunchesForBundleIds:", v14);
    v16 = v15;

    v17 = objc_msgSend(v4, "actionExperienceHighConfidenceAppActionCountThreshold");
    v18 = objc_msgSend(v4, "actionExperienceMediumConfidenceAppActionCountThreshold");
    objc_msgSend(v3, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "score");
    v21 = v20;
    objc_msgSend(v4, "actionExperienceHighConfidenceThreshold");
    v23 = v22;
    objc_msgSend(v4, "actionExperienceMediumConfidenceThreshold");
    v11 = ATXActionExperienceForActions(v21, v16, v23, v17, v24, v18);

LABEL_6:
    goto LABEL_7;
  }
  keyExistsAndHasValidFormat = 0;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("ForceHeuristicHighConfidence"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))
  {
    objc_msgSend(v3, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "score");
    v26 = v25;
    objc_msgSend(v4, "heuristicActionExperienceHighConfidenceThreshold");
    v28 = v27;
    objc_msgSend(v4, "heuristicActionExperienceMediumConfidenceThreshold");
    v11 = ATXActionExperienceForActions(v26, 0.0, v28, 0, v29, 0);
    goto LABEL_6;
  }
  v11 = 1;
LABEL_7:

  return v11;
}

+ (void)indicesOfLockScreenActionsForActionPredictions:(os_log_t)log criteria:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Suppressing all lockscreen actions due to user preference.", v1, 2u);
}

+ (void)indicesOfLockScreenActionsForActionPredictions:(uint64_t)a3 criteria:(os_log_t)log .cold.2(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Filtered %lu/%lu predictions due to lockscreen blacklist.", buf, 0x16u);
}

@end
