@implementation ATXHomeScreenLogSystemEventDictionaries

- (ATXHomeScreenLogSystemEventDictionaries)init
{
  ATXHomeScreenLogSystemEventDictionaries *v2;
  uint64_t v3;
  NSMutableSet *unique3PWidgetsOnHS;
  uint64_t v5;
  NSMutableDictionary *systemLevelEventDictionary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXHomeScreenLogSystemEventDictionaries;
  v2 = -[ATXHomeScreenLogSystemEventDictionaries init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    unique3PWidgetsOnHS = v2->_unique3PWidgetsOnHS;
    v2->_unique3PWidgetsOnHS = (NSMutableSet *)v3;

    -[ATXHomeScreenLogSystemEventDictionaries _createNewSystemLevelDictionary](v2, "_createNewSystemLevelDictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    systemLevelEventDictionary = v2->_systemLevelEventDictionary;
    v2->_systemLevelEventDictionary = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (id)systemLevelDictionaryAccumulatorKeys
{
  if (systemLevelDictionaryAccumulatorKeys_onceToken != -1)
    dispatch_once(&systemLevelDictionaryAccumulatorKeys_onceToken, &__block_literal_global_77);
  return (id)systemLevelDictionaryAccumulatorKeys_array;
}

void __79__ATXHomeScreenLogSystemEventDictionaries_systemLevelDictionaryAccumulatorKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];

  v2[13] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("MeanWidgetsPerStack");
  v2[1] = CFSTR("NumberOfFirstPartyWidgets");
  v2[2] = CFSTR("NumberOfThirdPartyWidgets");
  v2[3] = CFSTR("NumberOfLockUnlockSessions");
  v2[4] = CFSTR("NumberOfLockUnlockSessionsWithWidgetDwell");
  v2[5] = CFSTR("NumberOfProactiveWidgetRotationsDueToShortcutConversion");
  v2[6] = CFSTR("NumberOfProactiveWidgetRotationsDueToWidgetHeuristic");
  v2[7] = CFSTR("NumberOfProactiveWidgetRotationsDueToStalenessRotation");
  v2[8] = CFSTR("NumberOfProactiveWidgetRotationsDueToTimelineDonationNonStaleness");
  v2[9] = CFSTR("NumberOfProactiveWidgetRotationsDueToTimelineDonationStaleness");
  v2[10] = CFSTR("NumberOfProactiveWidgetRotationsDueToSuggestionWidget");
  v2[11] = CFSTR("NumberOfProactiveWidgetRotationsDueToOtherReasons");
  v2[12] = CFSTR("NumberOfHomeScreenPages");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)systemLevelDictionaryAccumulatorKeys_array;
  systemLevelDictionaryAccumulatorKeys_array = v0;

}

+ (id)systemLevelDictionaryAccumulatorSplitByLocationKeys
{
  if (systemLevelDictionaryAccumulatorSplitByLocationKeys_onceToken != -1)
    dispatch_once(&systemLevelDictionaryAccumulatorSplitByLocationKeys_onceToken, &__block_literal_global_148);
  return (id)systemLevelDictionaryAccumulatorSplitByLocationKeys_array;
}

void __94__ATXHomeScreenLogSystemEventDictionaries_systemLevelDictionaryAccumulatorSplitByLocationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[23];

  v2[22] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("NumberOfSmartStacksOn");
  v2[1] = CFSTR("NumberOfDegenerateSmartStacksOn");
  v2[2] = CFSTR("NumberOfRegularStacksOn");
  v2[3] = CFSTR("NumberOfPinnedWidgetsOn");
  v2[4] = CFSTR("NumberOfUserScrollsOn");
  v2[5] = CFSTR("NumberOfUserScrollPseudoTappedRotationsOn");
  v2[6] = CFSTR("NumberOfUserScrollTappedRotationsOn");
  v2[7] = CFSTR("NumberOfUserScrollFinalOutcomePseudoTappedOn");
  v2[8] = CFSTR("NumberOfProactiveRotationsOn");
  v2[9] = CFSTR("NumberOfProactiveViewedRotationsOn");
  v2[10] = CFSTR("NumberOfProactivePseudoTappedRotationsOn");
  v2[11] = CFSTR("NumberOfProactiveTappedRotationsOn");
  v2[12] = CFSTR("NumberOfProactiveViewsOn");
  v2[13] = CFSTR("NumberOfProactivePseudoTapsOn");
  v2[14] = CFSTR("NumberOfProactiveTapsByLocationOn");
  v2[15] = CFSTR("NumberOfViewsForStackWidgetsOn");
  v2[16] = CFSTR("NumberOfPseudoTapsForStackWidgetsOn");
  v2[17] = CFSTR("NumberOfTapsForStackWidgetsOn");
  v2[18] = CFSTR("NumberOfViewsForPinnedWidgetsOn");
  v2[19] = CFSTR("NumberOfPseudoTapsForPinnedWidgetsOn");
  v2[20] = CFSTR("NumberOfTapsForPinnedWidgetsOn");
  v2[21] = CFSTR("NumberOfLockUnlockSessionsWithWidgetDwellOn");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)systemLevelDictionaryAccumulatorSplitByLocationKeys_array;
  systemLevelDictionaryAccumulatorSplitByLocationKeys_array = v0;

}

- (id)_createNewSystemLevelDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  +[ATXHomeScreenLogUploaderUtilities abGroup](ATXHomeScreenLogUploaderUtilities, "abGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ABGroup"));

  -[ATXHomeScreenLogSystemEventDictionaries _populateSystemLevelDictionaryWithWidgetCohortAdoptionMetrics:](self, "_populateSystemLevelDictionaryWithWidgetCohortAdoptionMetrics:", v3);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend((id)objc_opt_class(), "systemLevelDictionaryAccumulatorKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E83CC7F0, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)objc_opt_class(), "systemLevelDictionaryAccumulatorSplitByLocationKeys", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = 0;
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        do
        {
          +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", v16, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E83CC7F0, v17);

          ++v15;
        }
        while (v15 != 6);
        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v12);
  }

  return v3;
}

- (id)_getOnboardingResultStringAndUpdateStackRemovedDateIfNeededWithDefaults:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  char v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  v3 = a3;
  if (!objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0CF9580]))
  {
    v8 = 0;
    goto LABEL_11;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
  v5 = objc_msgSend(v4, "numOnboardingStacksOnTheHomeScreen");

  if (v5 == 1)
  {
    objc_msgSend(v3, "stringForKey:", *MEMORY[0x1E0CF95A8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    v12 = CFSTR("_One");
LABEL_9:
    objc_msgSend(v11, "stringByAppendingString:", v12);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v5)
  {
    objc_msgSend(v3, "stringForKey:", *MEMORY[0x1E0CF95A8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    v12 = CFSTR("_Multiple");
    goto LABEL_9;
  }
  v6 = *MEMORY[0x1E0CF9520];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CF9520]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("rejected");
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("rejected"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("rejected"), v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x1E0CF95A0]);
LABEL_10:

  }
LABEL_11:

  return v8;
}

- (void)_populateSystemLevelDictionaryWithWidgetCohortAdoptionMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  const __CFString *v25;
  id v26;

  v26 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CF9588]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CF9528]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CF95A0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = v9;
  if (!v6)
  {
    objc_msgSend(v26, "setObject:forKeyedSubscript:", 0, CFSTR("skyUpdateDate"));
    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v26, "setObject:forKeyedSubscript:", 0, CFSTR("becameActiveDate"));
    goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "reduceGranularityToWeekOfYear:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v13, CFSTR("skyUpdateDate"));

  if (!v7)
    goto LABEL_5;
LABEL_3:
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "reduceGranularityToWeekOfYear:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v16, CFSTR("becameActiveDate"));

LABEL_6:
  -[ATXHomeScreenLogSystemEventDictionaries _getOnboardingResultStringAndUpdateStackRemovedDateIfNeededWithDefaults:](self, "_getOnboardingResultStringAndUpdateStackRemovedDateIfNeededWithDefaults:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, CFSTR("onboardingResult"));

  if (v6 && v8)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "convertDate:toDeltaFromSkyUpdateDate:", v8, v6);
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v19, CFSTR("dateRemovedOnboardingStacks"));

  }
  else
  {
    objc_msgSend(v26, "setObject:forKeyedSubscript:", 0, CFSTR("dateRemovedOnboardingStacks"));
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CF9520]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v20, CFSTR("azulUsageStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0CF9580]));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, CFSTR("sawOnboarding"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0CF95B0]));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, CFSTR("onboardingWasPersonalized"));

  if (objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0CF9530]))
  {
    v23 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
    v24 = objc_msgSend(v23, "hasWidgetsOnTheHomeScreen");

    if (v24)
      v25 = CFSTR("active");
    else
      v25 = CFSTR("abandoned");
  }
  else
  {
    v25 = CFSTR("neverUsed");
  }
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("currentUsageStatus"));

}

- (void)sendToCoreAnalytics
{
  NSObject *v3;
  NSMutableDictionary *systemLevelEventDictionary;
  NSObject *v5;
  NSMutableDictionary *unlockSessionEngagementDictionary;
  int v7;
  NSMutableDictionary *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    systemLevelEventDictionary = self->_systemLevelEventDictionary;
    v7 = 138412290;
    v8 = systemLevelEventDictionary;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: System level dictionary: %@", (uint8_t *)&v7, 0xCu);
  }

  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unlockSessionEngagementDictionary = self->_unlockSessionEngagementDictionary;
    v7 = 138412290;
    v8 = unlockSessionEngagementDictionary;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: Engagement summary dictionary: %@", (uint8_t *)&v7, 0xCu);
  }

  AnalyticsSendEvent();
  AnalyticsSendEvent();
}

- (id)dryRunResult
{
  NSMutableDictionary *unlockSessionEngagementDictionary;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("System Level Dictionary");
  v4[1] = CFSTR("Engagement Summary Dictionary");
  unlockSessionEngagementDictionary = self->_unlockSessionEngagementDictionary;
  v5[0] = self->_systemLevelEventDictionary;
  v5[1] = unlockSessionEngagementDictionary;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateUnlockSessionEngagementSummaryFromManager:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *unlockSessionEngagementDictionary;
  void *v7;
  id v8;

  objc_msgSend(a3, "summarizeCompletedSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  unlockSessionEngagementDictionary = self->_unlockSessionEngagementDictionary;
  self->_unlockSessionEngagementDictionary = v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_systemLevelEventDictionary, "objectForKeyedSubscript:", CFSTR("NumberOfLockUnlockSessionsWithWidgetDwell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unlockSessionEngagementDictionary, "setObject:forKeyedSubscript:", v7, CFSTR("NumberOfLockUnlockSessionsWithWidgetDwell"));

  +[ATXHomeScreenLogUploaderUtilities abGroup](ATXHomeScreenLogUploaderUtilities, "abGroup");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unlockSessionEngagementDictionary, "setObject:forKeyedSubscript:", v8, CFSTR("ABGroup"));

}

- (void)updateSystemLevelSummaryTotalUnlockSessions:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemLevelEventDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("NumberOfLockUnlockSessions"));

}

- (void)updateSystemLevelUnlockSessionsWithWidgetDwell:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  NSMutableDictionary *systemLevelEventDictionary;
  void *v15;
  void *v16;
  ATXHomeScreenLogSystemEventDictionaries *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = self;
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", self->_systemLevelEventDictionary, CFSTR("NumberOfLockUnlockSessionsWithWidgetDwell"));
  v5 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "stackLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "containsObject:", v12);

        if ((v13 & 1) == 0)
        {
          systemLevelEventDictionary = v17->_systemLevelEventDictionary;
          +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", CFSTR("NumberOfLockUnlockSessionsWithWidgetDwellOn"), v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", systemLevelEventDictionary, v15);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (void)updateSystemLevelSummaryForHomeScreenEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableDictionary *systemLevelEventDictionary;
  const __CFString *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "stackKind") == 1)
  {
    objc_msgSend(v9, "eventTypeString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Unknown")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("StackChanged")) & 1) == 0)
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
      {

        v5 = objc_msgSend(v9, "stackLocation");
        systemLevelEventDictionary = self->_systemLevelEventDictionary;
        v7 = CFSTR("NumberOfTapsForPinnedWidgetsOn");
LABEL_8:
        +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", v7, v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", systemLevelEventDictionary, v8);

        goto LABEL_29;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceLocked")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) == 0)
      {
        if ((objc_msgSend(v4, "isEqualToString:", CFSTR("StackShown")) & 1) != 0)
        {

          v5 = objc_msgSend(v9, "stackLocation");
          systemLevelEventDictionary = self->_systemLevelEventDictionary;
          v7 = CFSTR("NumberOfViewsForPinnedWidgetsOn");
          goto LABEL_8;
        }
        if ((objc_msgSend(v4, "isEqualToString:", CFSTR("StackDisappeared")) & 1) == 0
          && (objc_msgSend(v4, "isEqualToString:", CFSTR("StackCreated")) & 1) == 0
          && (objc_msgSend(v4, "isEqualToString:", CFSTR("StackDeleted")) & 1) == 0
          && (objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) == 0
          && (objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) == 0
          && (objc_msgSend(v4, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) == 0
          && (objc_msgSend(v4, "isEqualToString:", CFSTR("AppAdded")) & 1) == 0)
        {
          objc_msgSend(v4, "isEqualToString:", CFSTR("AppRemoved"));
        }
      }
    }

    objc_msgSend(v9, "stackLocation");
  }
LABEL_29:

}

- (void)updateSystemLevelSummaryForHomeScreenPages:(id)a3 startDate:(id)a4
{
  id v6;
  id v7;
  ATXDegenerateStackAnalyzer *v8;
  ATXDegenerateStackAnalyzer *v9;
  id v10;
  unint64_t v11;
  void *v12;
  _QWORD v13[5];
  ATXDegenerateStackAnalyzer *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(ATXDegenerateStackAnalyzer);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__ATXHomeScreenLogSystemEventDictionaries_updateSystemLevelSummaryForHomeScreenPages_startDate___block_invoke;
  v13[3] = &unk_1E82E0470;
  v13[4] = self;
  v16 = &v22;
  v17 = &v18;
  v9 = v8;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  v11 = v23[3];
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)v19[3] / (double)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemLevelEventDictionary, "setObject:forKeyedSubscript:", v12, CFSTR("MeanWidgetsPerStack"));

  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

void __96__ATXHomeScreenLogSystemEventDictionaries_updateSystemLevelSummaryForHomeScreenPages_startDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __objc2_class **v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __objc2_class *v13;
  uint64_t v14;
  __objc2_class *v15;
  const __CFString *v16;
  void *v17;
  __objc2_class *v18;
  uint64_t v19;
  void *v20;
  int v21;
  __objc2_class *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __objc2_class *v30;
  void *v31;
  const __CFString *v32;
  int IsHomeScreen;
  void *v34;
  void *v35;
  __objc2_class **v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v42 = a2;
  v3 = ATXStackLocationForPageAndIndex();
  v4 = &off_1E82D7000;
  if (ATXStackLocationIsHomeScreen())
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("NumberOfHomeScreenPages"));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v5 = v42;
  objc_msgSend(v42, "stacks", v42);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "panels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v46 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v54;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v54 != v45)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v9);
        objc_msgSend(v10, "widgets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        v47 = v9;
        if (v12 == 1)
        {
          v13 = v4[271];
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v15 = v13;
          v16 = CFSTR("NumberOfPinnedWidgetsOn");
        }
        else
        {
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          objc_msgSend(v10, "widgets");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v20, "count");

          v21 = objc_msgSend(v10, "allowsSmartRotate");
          v22 = v4[271];
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          if (!v21)
          {
            -[__objc2_class keyByConcatenatingAccumulatorKey:withLocation:](v4[271], "keyByConcatenatingAccumulatorKey:withLocation:", CFSTR("NumberOfRegularStacksOn"), v3);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v22;
            v19 = v23;
            goto LABEL_15;
          }
          -[__objc2_class keyByConcatenatingAccumulatorKey:withLocation:](v4[271], "keyByConcatenatingAccumulatorKey:withLocation:", CFSTR("NumberOfSmartStacksOn"), v3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[__objc2_class incrementDictionary:forKey:](v22, "incrementDictionary:forKey:", v23, v24);

          if (!objc_msgSend(*(id *)(a1 + 40), "isSmartStackPossiblyDegenerate:onPage:usingTimelineEntriesSinceDate:", v10, v43, *(_QWORD *)(a1 + 48)))goto LABEL_16;
          v13 = v4[271];
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v15 = v13;
          v16 = CFSTR("NumberOfDegenerateSmartStacksOn");
        }
        -[__objc2_class keyByConcatenatingAccumulatorKey:withLocation:](v15, "keyByConcatenatingAccumulatorKey:withLocation:", v16, v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v13;
        v19 = v14;
LABEL_15:
        -[__objc2_class incrementDictionary:forKey:](v18, "incrementDictionary:forKey:", v19, v17);

LABEL_16:
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v10, "widgets");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v50 != v27)
                objc_enumerationMutation(v48);
              v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              v30 = v4[271];
              objc_msgSend(v29, "extensionBundleId");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v30) = -[__objc2_class isFirstPartyApp:](v30, "isFirstPartyApp:", v31);

              v32 = CFSTR("NumberOfFirstPartyWidgets");
              if ((v30 & 1) == 0)
              {
                IsHomeScreen = ATXStackLocationIsHomeScreen();
                v32 = CFSTR("NumberOfThirdPartyWidgets");
                if (IsHomeScreen)
                {
                  v34 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
                  v35 = (void *)MEMORY[0x1E0CF9220];
                  objc_msgSend(v29, "extensionBundleId");
                  v36 = v4;
                  v37 = v3;
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "widgetKind");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "stringRepresentationForExtensionBundleId:kind:", v38, v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "addObject:", v40);

                  v3 = v37;
                  v4 = v36;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v41, CFSTR("Num3PWidgetsOnHS"));

                  v32 = CFSTR("NumberOfThirdPartyWidgets");
                }
              }
              -[__objc2_class incrementDictionary:forKey:](v4[271], "incrementDictionary:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v32);
            }
            v26 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          }
          while (v26);
        }

        v9 = v47 + 1;
      }
      while (v47 + 1 != v46);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v46);
  }

}

- (void)updateNPlusOneLifetimeMetricsWithRotationSession:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "engagementStatus") != 5)
  {
    if (objc_msgSend(v6, "engagementStatus") != 6)
    {
      if (objc_msgSend(v6, "engagementStatus") != 7)
      {
        v5 = 0;
        goto LABEL_17;
      }
      v4 = *MEMORY[0x1E0CF9510];
      goto LABEL_14;
    }
    v4 = *MEMORY[0x1E0CF9510];
LABEL_7:
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v4);
    goto LABEL_8;
  }
  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = *MEMORY[0x1E0CF9510];
  v5 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v5, "integerForKey:", CFSTR("LifetimeNPlusOnesDismissed")) + 1, CFSTR("LifetimeNPlusOnesDismissed"));
  if (objc_msgSend(v6, "engagementStatus") != 6)
    goto LABEL_9;
  if (!v5)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v5, "integerForKey:", CFSTR("LifetimeNPlusOnesNeverShown")) + 1, CFSTR("LifetimeNPlusOnesNeverShown"));
LABEL_9:
  if (objc_msgSend(v6, "engagementStatus") == 7)
  {
    if (v5)
    {
LABEL_15:
      objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v5, "integerForKey:", CFSTR("LifetimeNPlusOnesAddedToStack")) + 1, CFSTR("LifetimeNPlusOnesAddedToStack"));
      goto LABEL_17;
    }
LABEL_14:
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v4);
    goto LABEL_15;
  }
LABEL_17:

}

- (void)populateLifetimeNPlusOneStatistics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v7 = (id)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "integerForKey:", CFSTR("LifetimeNPlusOnesDismissed")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemLevelEventDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("LifetimeNPlusOnesDismissed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "integerForKey:", CFSTR("LifetimeNPlusOnesNeverShown")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemLevelEventDictionary, "setObject:forKeyedSubscript:", v5, CFSTR("LifetimeNPlusOnesNeverShown"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "integerForKey:", CFSTR("LifetimeNPlusOnesAddedToStack")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemLevelEventDictionary, "setObject:forKeyedSubscript:", v6, CFSTR("LifetimeNPlusOnesAddedToStack"));

}

- (void)updateSystemLevelSummaryWithRotationSession:(id)a3
{
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  BOOL v8;
  NSMutableDictionary *systemLevelEventDictionary;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[6];
  BOOL v23;
  BOOL v24;

  v21 = a3;
  objc_msgSend(v21, "startingStackChangeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stackLocation");

  v6 = +[ATXHomeScreenLogUploaderUtilities isRotationSessionDueToProactive:](ATXHomeScreenLogUploaderUtilities, "isRotationSessionDueToProactive:", v21);
  v7 = +[ATXHomeScreenLogUploaderUtilities isRotationSessionDueToUserScroll:](ATXHomeScreenLogUploaderUtilities, "isRotationSessionDueToUserScroll:", v21);
  v8 = v7;
  if (v6)
  {
    systemLevelEventDictionary = self->_systemLevelEventDictionary;
    +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", CFSTR("NumberOfProactiveRotationsOn"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", systemLevelEventDictionary, v10);

    v11 = (void *)objc_opt_class();
    objc_msgSend(v21, "systemSuggestSuggestionLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_suggestionReasonToWidgetEventDictionariesProactiveWidgetRotationsKey:", +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:](ATXHomeScreenLogUploaderUtilities, "suggestionReasonForSuggestionLayout:", v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = self->_systemLevelEventDictionary;
  }
  else
  {
    if (!v7)
      goto LABEL_6;
    v15 = self->_systemLevelEventDictionary;
    +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", CFSTR("NumberOfUserScrollsOn"), v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
  }
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v14, v13);

LABEL_6:
  if (objc_msgSend(v21, "isNPlusOneRotation"))
    -[ATXHomeScreenLogSystemEventDictionaries updateNPlusOneLifetimeMetricsWithRotationSession:](self, "updateNPlusOneLifetimeMetricsWithRotationSession:", v21);
  +[ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker keyTrackerForRotationSessionStackEngagementStatus:](ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker, "keyTrackerForRotationSessionStackEngagementStatus:", objc_msgSend(v21, "engagementStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_systemLevelEventDictionary;
  objc_msgSend(v16, "userScrollFinalOutcomeKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", v18, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v17, v19);

  +[ATXHomeScreenLogUploaderUtilities countsForRotationEngagementStatusHistory:](ATXHomeScreenLogUploaderUtilities, "countsForRotationEngagementStatusHistory:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__ATXHomeScreenLogSystemEventDictionaries_updateSystemLevelSummaryWithRotationSession___block_invoke;
  v22[3] = &unk_1E82E0498;
  v22[4] = self;
  v22[5] = v5;
  v23 = v6;
  v24 = v8;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v22);

}

void __87__ATXHomeScreenLogSystemEventDictionaries_updateSystemLevelSummaryWithRotationSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntValue");
  v7 = objc_msgSend(v5, "unsignedIntValue");

  +[ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker keyTrackerForRotationSessionStackEngagementStatus:](ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker, "keyTrackerForRotationSessionStackEngagementStatus:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v20 = v8;
    objc_msgSend(v8, "statusAggregationKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", v11, *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", v7, v10, v12);

    if (*(_BYTE *)(a1 + 48))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(v20, "proactiveStatusAggregationKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", v14, *(_QWORD *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", v7, v13, v15);

      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(v20, "proactiveStatusBooleanKey");
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v18 = (void *)v17;
      +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", v17, *(_QWORD *)(a1 + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v16, v19);

      v8 = v20;
      goto LABEL_10;
    }
    v8 = v20;
    if (*(_BYTE *)(a1 + 49))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(v20, "userScrollStatusBooleanKey");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)updateSystemLevelSummaryForWidgetPseudoTapWithStackShownEvent:(id)a3
{
  uint64_t v4;
  NSMutableDictionary *systemLevelEventDictionary;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "stackKind") == 1)
  {
    v4 = objc_msgSend(v7, "stackLocation");
    systemLevelEventDictionary = self->_systemLevelEventDictionary;
    +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", CFSTR("NumberOfPseudoTapsForPinnedWidgetsOn"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", systemLevelEventDictionary, v6);

  }
}

+ (id)_suggestionReasonToWidgetEventDictionariesProactiveWidgetRotationsKey:(int)a3
{
  if ((a3 - 1) > 7)
    return CFSTR("NumberOfProactiveWidgetRotationsDueToStalenessRotation");
  else
    return off_1E82E04D8[a3 - 1];
}

- (void)_addKey:(id)a3 splitByLocation:(unint64_t)a4 toAggregateKey:(id)a5
{
  NSMutableDictionary *systemLevelEventDictionary;
  id v9;
  void *v10;
  id v11;

  systemLevelEventDictionary = self->_systemLevelEventDictionary;
  v9 = a5;
  +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](systemLevelEventDictionary, "objectForKeyedSubscript:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", objc_msgSend(v11, "unsignedIntValue"), self->_systemLevelEventDictionary, v9);
}

- (void)populateHasBehavioralData
{
  void *v3;
  double v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "uniqueAppsLaunchedOverLast28Days");
  objc_msgSend(v3, "numberWithInt:", v4 > 15.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemLevelEventDictionary, "setObject:forKeyedSubscript:", v5, CFSTR("HasBehavioralData"));

}

- (void)populateUsedKettle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, -28, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UserFocus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ComputedMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "atx_publisherFromStartDate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__ATXHomeScreenLogSystemEventDictionaries_populateUsedKettle__block_invoke_2;
  v13[3] = &unk_1E82DC1A0;
  v13[4] = &v14;
  v11 = (id)objc_msgSend(v10, "sinkWithCompletion:shouldContinue:", &__block_literal_global_182_0, v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v15 + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemLevelEventDictionary, "setObject:forKeyedSubscript:", v12, CFSTR("UsedKettle"));

  _Block_object_dispose(&v14, 8);
  objc_autoreleasePoolPop(v3);
}

uint64_t __61__ATXHomeScreenLogSystemEventDictionaries_populateUsedKettle__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "semanticType") == 2 || !objc_msgSend(v3, "updateReason"))
  {
    v4 = 1;
  }
  else
  {
    v4 = 1;
    if (objc_msgSend(v3, "updateSource"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v4 = 0;
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unique3PWidgetsOnHS, 0);
  objc_storeStrong((id *)&self->_unlockSessionEngagementDictionary, 0);
  objc_storeStrong((id *)&self->_systemLevelEventDictionary, 0);
}

@end
