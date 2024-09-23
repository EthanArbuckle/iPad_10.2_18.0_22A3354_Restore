@implementation SGPreferenceStorage

+ (int)registerBlockOnSuggestionsSettingsChange:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  +[SGPreferenceManager defaultManager](SGPreferenceManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "registerBlock:", v3);

  return v5;
}

+ (void)setCloudKitPersistedState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("CloudKitPersistedState"));

}

+ (id)defaults
{
  id *v2;
  id v3;

  +[SGPreferenceManager defaultManager](SGPreferenceManager, "defaultManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[1];

  return v3;
}

+ (BOOL)showContactsFoundInMail
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("com.apple.MobileAddressBook")) ^ 1;

  return v3;
}

+ (void)setShowContactsFoundInMail:(BOOL)a3
{
  SGSetAppCanShowSiriSuggestions(CFSTR("com.apple.MobileAddressBook"), a3);
}

+ (BOOL)showEventsFoundInMail
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("com.apple.mobilecal")) ^ 1;

  return v3;
}

+ (void)setShowEventsFoundInMail:(BOOL)a3
{
  SGSetAppCanShowSiriSuggestions(CFSTR("com.apple.mobilecal"), a3);
}

+ (void)resetAllPreferences
{
  void *v3;
  void *v4;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SuggestionsAlwaysShowCancelledEvents"));

  objc_msgSend(a1, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("SuggestionsLoggingLevel"));

  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SuggestionsMessagesToProcessImmediately"));

  objc_msgSend(a1, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("SuggestionsOnlyShowSignificantPseudoContacts"));

  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("SuggestionsOnlyShowSignificantNLEvents"));

  objc_msgSend(a1, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("SuggestionsShowPastEvents"));

  objc_msgSend(a1, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("SuggestionsShowSuggestionsCalendar"));

  objc_msgSend(a1, "defaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", CFSTR("SuggestionsSuppressSyncHistoryToCloud"));

  objc_msgSend(a1, "defaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("SuggestionsAllowGeocode"));

  objc_msgSend(a1, "defaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", CFSTR("SuggestionsAllowUnverifiedSourceForMarkup"));

  objc_msgSend(a1, "defaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("SuggestionsAllowAnyDomainForMarkup"));

  objc_msgSend(a1, "defaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", CFSTR("SuggestionsUseMLModelForContacts"));

  objc_msgSend(a1, "defaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", CFSTR("SuggestionsUseMLModelForSelfId"));

  objc_msgSend(a1, "defaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", CFSTR("SuggestionsAllowAgeBasedPruning"));

  objc_msgSend(a1, "defaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectForKey:", CFSTR("SuggestionsDetectContacts"));

  objc_msgSend(a1, "defaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", CFSTR("SuggestionsShowNLEvents"));

  objc_msgSend(a1, "defaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObjectForKey:", CFSTR("SuggestionsShowMessageEventsML"));

  objc_msgSend(a1, "defaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", CFSTR("SuggestionsDetectStructuredEvents"));

  objc_msgSend(a1, "defaults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("SuggestionsDetectReminders"));

  objc_msgSend(a1, "defaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectForKey:", CFSTR("SuggestionsDetectStructuredsEventML"));

  objc_msgSend(a1, "defaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeObjectForKey:", CFSTR("SuggestionsDetectRemindersInMail"));

  objc_msgSend(a1, "defaults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObjectForKey:", CFSTR("SuggestionsDetectSalientMails"));

  objc_msgSend(a1, "defaults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeObjectForKey:", CFSTR("SuggestionsFollowUpTimeRangeForDebugging"));

  objc_msgSend(a1, "defaults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeObjectForKey:", CFSTR("SuggestionsFollowUpComputeCustomTimeRange"));

  objc_msgSend(a1, "defaults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeObjectForKey:", CFSTR("SuggestionsMailIntelligenceSPILogging"));

  objc_msgSend(a1, "defaults");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeObjectForKey:", CFSTR("SuggestionsHashedSessionsLogging"));

  objc_msgSend(a1, "defaults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeObjectForKey:", CFSTR("CloudKitPersistedState"));

  objc_msgSend(a1, "defaults");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "removeObjectForKey:", CFSTR("UserAccountsPersistedState"));

  objc_msgSend(a1, "defaults");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "removeObjectForKey:", CFSTR("SuggestionsUseMLModelForContactSharing"));

  objc_msgSend(a1, "defaults");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "removeObjectForKey:", CFSTR("SuggestionsContactSharingNegativeSamplingRate"));

  objc_msgSend(a1, "defaults");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeObjectForKey:", CFSTR("SuggestionsHarvestBudgetNumberOfOperations"));

  objc_msgSend(a1, "defaults");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "removeObjectForKey:", CFSTR("SuggestionsHarvestBudgetCPUTimeSeconds"));

  objc_msgSend(a1, "defaults");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeObjectForKey:", CFSTR("DisableEventUpdateCategories"));

  objc_msgSend(a1, "defaults");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeObjectForKey:", CFSTR("SuggestionsEventsMLRegexEnsembleExtractionEnabled"));

}

+ (int64_t)suggestionsLogLevel
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("SuggestionsLoggingLevel"));

  return v3;
}

+ (BOOL)showPastEvents
{
  BOOL v3;
  int v4;
  void *v5;

  if (hidePastEventsForTests)
  {
    if ((objc_msgSend((id)hidePastEventsForTests, "BOOLValue") & 1) != 0)
      return 0;
    if (!objc_msgSend((id)hidePastEventsForTests, "BOOLValue"))
      return 1;
  }
  pthread_mutex_lock(&shouldShowPastEventsLock);
  v4 = shouldShowPastEvents;
  if (shouldShowPastEvents == 255)
  {
    objc_msgSend(a1, "defaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    shouldShowPastEvents = objc_msgSend(v5, "BOOLForKey:", CFSTR("SuggestionsShowPastEvents"));

    v4 = shouldShowPastEvents;
  }
  v3 = v4 != 0;
  pthread_mutex_unlock(&shouldShowPastEventsLock);
  return v3;
}

+ (void)setShowPastEvents:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  pthread_mutex_lock(&shouldShowPastEventsLock);
  objc_msgSend(a1, "updateBoolSettingKey:withValue:", CFSTR("SuggestionsShowPastEvents"), v3);
  shouldShowPastEvents = v3;
  pthread_mutex_unlock(&shouldShowPastEventsLock);
}

+ (BOOL)alwaysShowCancelledEvents
{
  void *v3;
  char v4;

  if (showCancelledEventsForTests)
    return objc_msgSend((id)showCancelledEventsForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsAlwaysShowCancelledEvents"));

  return v4;
}

+ (void)setAlwaysShowCancelledEvents:(BOOL)a3
{
  objc_msgSend(a1, "updateBoolSettingKey:withValue:", CFSTR("SuggestionsAlwaysShowCancelledEvents"), a3);
}

+ (void)updateBoolSettingKey:(id)a3 withValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

  objc_msgSend(a1, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (void)updateIntSettingKey:(id)a3 withValue:(int)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:", a4, v6);

  objc_msgSend(a1, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (BOOL)onlyShowSignificantPseudoContacts
{
  void *v3;
  char v4;

  if (onlyShowSignificantPseudoContactsForTests)
    return objc_msgSend((id)onlyShowSignificantPseudoContactsForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsOnlyShowSignificantPseudoContacts"));

  return v4;
}

+ (void)setOnlyShowSignificantPseudoContacts:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;

  v3 = a3;
  if (onlyShowSignificantPseudoContactsForTests)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGPreferenceStorage.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("onlyShowSignificantPseudoContactsForTests == nil"));

  }
  objc_msgSend(a1, "updateBoolSettingKey:withValue:", CFSTR("SuggestionsOnlyShowSignificantPseudoContacts"), v3);
}

+ (void)setOnlyShowSignificantPseudoContactsForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)onlyShowSignificantPseudoContactsForTests;
  onlyShowSignificantPseudoContactsForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (BOOL)onlyShowSignificantNLEvents
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsOnlyShowSignificantNLEvents"));

  return v3;
}

+ (void)setOnlyShowSignificantNLEvents:(BOOL)a3
{
  objc_msgSend(a1, "updateBoolSettingKey:withValue:", CFSTR("SuggestionsOnlyShowSignificantNLEvents"), a3);
}

+ (int64_t)hashedSessionsLogging
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("SuggestionsHashedSessionsLogging"));

  return v3;
}

+ (void)setHashedSessionsLogging:(int)a3
{
  objc_msgSend(a1, "updateIntSettingKey:withValue:", CFSTR("SuggestionsHashedSessionsLogging"), *(_QWORD *)&a3);
}

+ (BOOL)showSuggestionsCalendar
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsShowSuggestionsCalendar"));

  return v3;
}

+ (void)removeDeprecatedDefaults
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(&unk_1E4781798, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(&unk_1E4781798);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(a1, "defaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E4781798, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
}

+ (int64_t)messagesToProcessImmediately
{
  void *v3;
  int64_t v4;

  if (messagesToProcessImmediatelyForTests)
    return objc_msgSend((id)messagesToProcessImmediatelyForTests, "integerValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("SuggestionsMessagesToProcessImmediately"));

  return v4;
}

+ (void)setMessagesToProcessImmediately:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", a3, CFSTR("SuggestionsMessagesToProcessImmediately"));

  objc_msgSend(a1, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (BOOL)syncHistoryToCloud
{
  int v3;
  void *v4;
  BOOL v5;

  pthread_mutex_lock(&syncHistoryToCloudLock);
  v3 = syncHistoryToCloud;
  if (syncHistoryToCloud == 255)
  {
    objc_msgSend(a1, "defaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    syncHistoryToCloud = objc_msgSend(v4, "BOOLForKey:", CFSTR("SuggestionsSuppressSyncHistoryToCloud")) ^ 1;

    v3 = syncHistoryToCloud;
  }
  v5 = v3 != 0;
  pthread_mutex_unlock(&syncHistoryToCloudLock);
  return v5;
}

+ (void)setSyncHistoryToCloud:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  pthread_mutex_lock(&syncHistoryToCloudLock);
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", !v3, CFSTR("SuggestionsSuppressSyncHistoryToCloud"));

  syncHistoryToCloud = v3;
  pthread_mutex_unlock(&syncHistoryToCloudLock);
}

+ (BOOL)allowGeocode
{
  void *v2;

  if (allowGeocode)
    v2 = (void *)allowGeocode;
  else
    v2 = (void *)MEMORY[0x1E0C9AAB0];
  return objc_msgSend(v2, "BOOLValue");
}

+ (BOOL)allowUnverifiedSourceForMarkup
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsAllowUnverifiedSourceForMarkup"));

  return v3;
}

+ (void)setAllowUnverifiedSourceForMarkup:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("SuggestionsAllowUnverifiedSourceForMarkup"));

  objc_msgSend(a1, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (BOOL)allowAnyDomainForMarkup
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsAllowAnyDomainForMarkup"));

  return v3;
}

+ (void)setAllowAnyDomainForMarkup:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("SuggestionsAllowAnyDomainForMarkup"));

  objc_msgSend(a1, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (id)disabledEventUpdateCategories
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringArrayForKey:", CFSTR("DisableEventUpdateCategories"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

+ (void)setDisabledEventUpdateCategories:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("DisableEventUpdateCategories"));

}

+ (BOOL)allowAgeBasedPruning
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsAllowAgeBasedPruning"));

  return v3;
}

+ (void)setAllowAgeBasedPruning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("SuggestionsAllowAgeBasedPruning"));

  objc_msgSend(a1, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (BOOL)useMLModelForContacts
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsUseMLModelForContacts"));

  return v3;
}

+ (void)setUseMLModelForContacts:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("SuggestionsUseMLModelForContacts"));

  objc_msgSend(a1, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (BOOL)useMLModelForSelfId
{
  void *v3;
  char v4;

  if (useMLModelForSelfId)
    return objc_msgSend((id)useMLModelForSelfId, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsUseMLModelForSelfId"));

  return v4;
}

+ (void)setUseMLModelForSelfId:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("SuggestionsUseMLModelForSelfId"));

  objc_msgSend(a1, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (BOOL)useMLModelForContactSharing
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsUseMLModelForContactSharing"));

  return v3;
}

+ (void)setUseMLModelForContactSharing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("SuggestionsUseMLModelForContactSharing"));

  objc_msgSend(a1, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (float)contactSharingNegativeSamplingRate
{
  void *v2;
  float v3;
  float v4;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", CFSTR("SuggestionsContactSharingNegativeSamplingRate"));
  v4 = v3;

  return v4;
}

+ (void)setContactSharingNegativeSamplingRate:(float)a3
{
  void *v5;
  double v6;
  void *v7;

  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("SuggestionsContactSharingNegativeSamplingRate"), v6);

  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (BOOL)detectContacts
{
  void *v3;
  char v4;

  if (contactsDetectionEnabledForTests)
    return objc_msgSend((id)contactsDetectionEnabledForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsDetectContacts"));

  return v4;
}

+ (BOOL)detectNLEvents
{
  void *v3;
  char v4;

  if (nlEventsDetectionEnabledForTests)
    return objc_msgSend((id)nlEventsDetectionEnabledForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsShowNLEvents"));

  return v4;
}

+ (BOOL)detectMessageEventsML
{
  void *v3;
  char v4;

  if (messageEventsMLDetectionEnabledForTests)
    return objc_msgSend((id)messageEventsMLDetectionEnabledForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsShowMessageEventsML"));

  return v4;
}

+ (BOOL)detectStructuredEvents
{
  void *v3;
  char v4;

  if (structuredEventsDetectionEnabledForTests)
    return objc_msgSend((id)structuredEventsDetectionEnabledForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsDetectStructuredEvents"));

  return v4;
}

+ (BOOL)detectReminders
{
  void *v3;
  char v4;

  if (remindersDetectionEnabledForTests)
    return objc_msgSend((id)remindersDetectionEnabledForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsDetectReminders"));

  return v4;
}

+ (BOOL)detectStructuredEventsML
{
  void *v3;
  char v4;

  if (structuredEventsMLDetectionEnabledForTests)
    return objc_msgSend((id)structuredEventsMLDetectionEnabledForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsDetectStructuredsEventML"));

  return v4;
}

+ (BOOL)detectRemindersInMail
{
  void *v3;
  char v4;

  if (remindersDetectionInMailEnabledForTests)
    return objc_msgSend((id)remindersDetectionInMailEnabledForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsDetectRemindersInMail"));

  return v4;
}

+ (id)detectSalientMails
{
  id v2;
  void *v3;

  if (mailSaliencyDetectionEnabledForTests)
  {
    v2 = (id)mailSaliencyDetectionEnabledForTests;
  }
  else
  {
    objc_msgSend(a1, "defaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("SuggestionsDetectSalientMails"));
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

+ (BOOL)EventMLRegexEnsembleExtractionEnabled
{
  void *v3;
  char v4;

  if (eventsMLRegexEnsembleExtractionEnabledForTests)
    return objc_msgSend((id)eventsMLRegexEnsembleExtractionEnabledForTests, "BOOLValue");
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SuggestionsEventsMLRegexEnsembleExtractionEnabled"));

  return v4;
}

+ (void)updateDetection:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

  objc_msgSend(a1, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronize");

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
}

+ (void)setDetectStructuredEvents:(BOOL)a3
{
  if (structuredEventsDetectionEnabledForTests)
    __assert_rtn("+[SGPreferenceStorage setDetectStructuredEvents:]", "SGPreferenceStorage.m", 662, "structuredEventsDetectionEnabledForTests == nil");
  objc_msgSend(a1, "updateDetection:forKey:", a3, CFSTR("SuggestionsDetectStructuredEvents"));
}

+ (void)setDetectNLEvents:(BOOL)a3
{
  if (nlEventsDetectionEnabledForTests)
    __assert_rtn("+[SGPreferenceStorage setDetectNLEvents:]", "SGPreferenceStorage.m", 669, "nlEventsDetectionEnabledForTests == nil");
  objc_msgSend(a1, "updateDetection:forKey:", a3, CFSTR("SuggestionsShowNLEvents"));
}

+ (void)setDetectMessageEventsML:(BOOL)a3
{
  if (messageEventsMLDetectionEnabledForTests)
    __assert_rtn("+[SGPreferenceStorage setDetectMessageEventsML:]", "SGPreferenceStorage.m", 675, "messageEventsMLDetectionEnabledForTests == nil");
  objc_msgSend(a1, "updateDetection:forKey:", a3, CFSTR("SuggestionsShowMessageEventsML"));
}

+ (void)setDetectContacts:(BOOL)a3
{
  if (contactsDetectionEnabledForTests)
    __assert_rtn("+[SGPreferenceStorage setDetectContacts:]", "SGPreferenceStorage.m", 682, "contactsDetectionEnabledForTests == nil");
  objc_msgSend(a1, "updateDetection:forKey:", a3, CFSTR("SuggestionsDetectContacts"));
}

+ (void)setDetectReminders:(BOOL)a3
{
  objc_msgSend(a1, "updateDetection:forKey:", a3, CFSTR("SuggestionsDetectReminders"));
}

+ (void)setDetectStructuredEventsML:(BOOL)a3
{
  objc_msgSend(a1, "updateDetection:forKey:", a3, CFSTR("SuggestionsDetectStructuredsEventML"));
}

+ (void)setDetectRemindersInMail:(BOOL)a3
{
  objc_msgSend(a1, "updateDetection:forKey:", a3, CFSTR("SuggestionsDetectRemindersInMail"));
}

+ (void)setEnableEventsMLRegexEnsembleExtraction:(BOOL)a3
{
  objc_msgSend(a1, "updateDetection:forKey:", a3, CFSTR("SuggestionsEventsMLRegexEnsembleExtractionEnabled"));
}

+ (void)setFirstPartyCalendarAppIsInstalled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (!firstPartyCalendarAppIsInstalled
    || objc_msgSend((id)firstPartyCalendarAppIsInstalled, "BOOLValue") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)firstPartyCalendarAppIsInstalled;
    firstPartyCalendarAppIsInstalled = v4;

    notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
  }
}

+ (void)setFirstPartyMailAppIsInstalled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (!firstPartyMailAppIsInstalled || objc_msgSend((id)firstPartyMailAppIsInstalled, "BOOLValue") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)firstPartyMailAppIsInstalled;
    firstPartyMailAppIsInstalled = v4;

    notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String"));
  }
}

+ (BOOL)shouldHarvestEvents
{
  int v2;

  if (!firstPartyCalendarAppIsInstalled || (v2 = objc_msgSend((id)firstPartyCalendarAppIsInstalled, "BOOLValue")) != 0)
    LOBYTE(v2) = 1;
  return v2;
}

+ (id)cloudKitPersistedState
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForKey:", CFSTR("CloudKitPersistedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)userAccountsPersistedState
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringArrayForKey:", CFSTR("UserAccountsPersistedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setUserAccountsPersistedState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("UserAccountsPersistedState"));

}

+ (BOOL)useManateeSaltForHistory
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("UseManateeSaltForHistory"));

  return v3;
}

+ (void)setUseManateeSaltForHistory:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("UseManateeSaltForHistory"));

}

+ (id)didKVSMigrationTokenForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("DidKVSMigrationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

+ (void)setDidKVSMigrationToken:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_sync_enter(v8);
  objc_msgSend(v8, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryForKey:", CFSTR("DidKVSMigrationToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = (void *)MEMORY[0x1E0C9AA70];
  v12 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v7);
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543874;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1A2267000, v13, OS_LOG_TYPE_DEFAULT, "setDidKVSMigrationToken:%{public}@ forIdentifier:%{public}@, new dict: %{public}@", (uint8_t *)&v15, 0x20u);
  }

  objc_msgSend(v8, "defaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("DidKVSMigrationToken"));

  objc_sync_exit(v8);
}

+ (BOOL)showOperatingSystemVersionInSnippets
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ShowOperatingSystemVersionInSnippets"));

  return v3;
}

+ (void)setShowOperatingSystemVersionInSnippets:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ShowOperatingSystemVersionInSnippets"));

}

+ (int64_t)harvestBudgetNumberOfOperations
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("SuggestionsHarvestBudgetNumberOfOperations"));

  return v3;
}

+ (void)setHarvestBudgetNumberOfOperations:(int64_t)a3
{
  id v4;

  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("SuggestionsHarvestBudgetNumberOfOperations"));

}

+ (double)harvestBudgetCPUTimeSeconds
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("SuggestionsHarvestBudgetCPUTimeSeconds"));
  v4 = v3;

  return v4;
}

+ (void)setHarvestBudgetCPUTimeSeconds:(double)a3
{
  id v4;

  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("SuggestionsHarvestBudgetCPUTimeSeconds"), a3);

}

+ (id)followUpTimeRangeForDebugging
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("SuggestionsFollowUpTimeRangeForDebugging"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)followUpComputeCustomTimeRangeForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("SuggestionsFollowUpComputeCustomTimeRange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)mailIntelligenceSPILogging
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsMailIntelligenceSPILogging"));

  return v3;
}

+ (BOOL)enableDKIMEnforcement
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("EnableDKIMEnforcement"));

  return v3;
}

+ (void)setEnableDKIMEnforcement:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("EnableDKIMEnforcement"));

}

+ (BOOL)hidePastEventsForTests
{
  return objc_msgSend((id)hidePastEventsForTests, "BOOLValue");
}

+ (void)setHidePastEventsForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)hidePastEventsForTests;
  hidePastEventsForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setShowCancelledEventsForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)showCancelledEventsForTests;
  showCancelledEventsForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setNLEventsDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)nlEventsDetectionEnabledForTests;
  nlEventsDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setMessageEventsMLDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)messageEventsMLDetectionEnabledForTests;
  messageEventsMLDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setStructuredEventsDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)structuredEventsDetectionEnabledForTests;
  structuredEventsDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setRemindersDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)remindersDetectionEnabledForTests;
  remindersDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setStructuredEventsMLDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)structuredEventsMLDetectionEnabledForTests;
  structuredEventsMLDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setRemindersDetectionInMailEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)remindersDetectionInMailEnabledForTests;
  remindersDetectionInMailEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setMailSaliencyDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)mailSaliencyDetectionEnabledForTests;
  mailSaliencyDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setContactsDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)contactsDetectionEnabledForTests;
  contactsDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setAllowGeocodeForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)allowGeocode;
  allowGeocode = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setSyncHistoryToCloudForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)syncHistoryToCloudForTests;
  syncHistoryToCloudForTests = v3;

}

+ (void)setMessagesToProcessImmediatelyForTests:(int64_t)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)messagesToProcessImmediatelyForTests;
  messagesToProcessImmediatelyForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setUseMLModelForSelfIdForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)useMLModelForSelfId;
  useMLModelForSelfId = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setEventsMLRegexEnsembleExtractionEnabledForTests:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)eventsMLRegexEnsembleExtractionEnabledForTests;
  eventsMLRegexEnsembleExtractionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)suspendNotificationQueue
{
  id v2;

  notificationQueueSuspended = 1;
  +[SGPreferenceManager defaultManager](SGPreferenceManager, "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_suspendNotificationQueue");

}

+ (void)resumeNotificationQueue
{
  void *v2;

  +[SGPreferenceManager defaultManager](SGPreferenceManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resumeNotificationQueue");

  notificationQueueSuspended = 0;
}

@end
