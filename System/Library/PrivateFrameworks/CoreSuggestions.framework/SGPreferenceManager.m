@implementation SGPreferenceManager

uint64_t __37__SGPreferenceManager_registerBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "synchronize");
  pthread_mutex_lock(&syncHistoryToCloudLock);
  syncHistoryToCloud = -1;
  pthread_mutex_unlock(&syncHistoryToCloudLock);
  pthread_mutex_lock(&shouldShowPastEventsLock);
  shouldShowPastEvents = -1;
  pthread_mutex_unlock(&shouldShowPastEventsLock);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int)registerBlock:(id)a3
{
  id v4;
  const char *v5;
  NSObject *settingsUpdateQueue;
  void (**v7)(_QWORD);
  uint32_t v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  _QWORD handler[5];
  id v14;
  int out_token;
  uint8_t buf[4];
  uint32_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  out_token = 0;
  v5 = (const char *)objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String");
  settingsUpdateQueue = self->_settingsUpdateQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __37__SGPreferenceManager_registerBlock___block_invoke;
  handler[3] = &unk_1E4762428;
  handler[4] = self;
  v14 = v4;
  v7 = (void (**)(_QWORD))v4;
  v8 = notify_register_dispatch(v5, &out_token, settingsUpdateQueue, handler);
  if (v8)
  {
    v9 = v8;
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v9;
      _os_log_impl(&dword_1A2267000, v10, OS_LOG_TYPE_DEFAULT, "notify_register_dispatch error: %i", buf, 8u);
    }

  }
  v7[2](v7);
  v11 = out_token;

  return v11;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_7010);
  return (id)defaultManager_sharedManager;
}

- (SGPreferenceManager)init
{
  SGPreferenceManager *v2;
  uint64_t v3;
  NSUserDefaults *suggestionsDefaults;
  NSUserDefaults *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *settingsUpdateQueue;
  objc_super v14;
  _QWORD v15[33];
  _QWORD v16[34];

  v16[33] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SGPreferenceManager;
  v2 = -[SGPreferenceManager init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.suggestions"));
    suggestionsDefaults = v2->_suggestionsDefaults;
    v2->_suggestionsDefaults = (NSUserDefaults *)v3;

    v5 = v2->_suggestionsDefaults;
    v6 = MEMORY[0x1E0C9AAA0];
    v15[0] = CFSTR("SuggestionsShowPastEvents");
    v15[1] = CFSTR("SuggestionsAlwaysShowCancelledEvents");
    v15[2] = CFSTR("SuggestionsShowSuggestionsCalendar");
    v15[3] = CFSTR("SuggestionsMessagesToProcessImmediately");
    v16[2] = MEMORY[0x1E0C9AAA0];
    v16[3] = &unk_1E47813E8;
    v7 = MEMORY[0x1E0C9AAB0];
    v16[0] = MEMORY[0x1E0C9AAA0];
    v16[1] = MEMORY[0x1E0C9AAA0];
    v15[4] = CFSTR("SuggestionsOnlyShowSignificantPseudoContacts");
    v15[5] = CFSTR("SuggestionsOnlyShowSignificantNLEvents");
    v16[4] = MEMORY[0x1E0C9AAB0];
    v16[5] = MEMORY[0x1E0C9AAB0];
    v15[6] = CFSTR("SuggestionsAllowGeocode");
    v15[7] = CFSTR("SuggestionsAllowUnverifiedSourceForMarkup");
    v16[6] = MEMORY[0x1E0C9AAA0];
    v16[7] = MEMORY[0x1E0C9AAA0];
    v15[8] = CFSTR("SuggestionsAllowAnyDomainForMarkup");
    v15[9] = CFSTR("SuggestionsAllowAgeBasedPruning");
    v15[10] = CFSTR("SuggestionsUseMLModelForContacts");
    v15[11] = CFSTR("SuggestionsUseMLModelForSelfId");
    v16[8] = MEMORY[0x1E0C9AAA0];
    v16[9] = MEMORY[0x1E0C9AAB0];
    v15[12] = CFSTR("SuggestionsUseMLModelForContactSharing");
    v15[13] = CFSTR("SuggestionsContactSharingNegativeSamplingRate");
    v16[12] = MEMORY[0x1E0C9AAB0];
    v16[13] = &unk_1E47817C0;
    v16[10] = MEMORY[0x1E0C9AAB0];
    v16[11] = MEMORY[0x1E0C9AAB0];
    v15[14] = CFSTR("SuggestionsDetectContacts");
    v15[15] = CFSTR("SuggestionsShowNLEvents");
    v16[14] = MEMORY[0x1E0C9AAB0];
    v16[15] = MEMORY[0x1E0C9AAB0];
    v15[16] = CFSTR("SuggestionsShowMessageEventsML");
    v15[17] = CFSTR("SuggestionsDetectStructuredEvents");
    v16[16] = MEMORY[0x1E0C9AAB0];
    v16[17] = MEMORY[0x1E0C9AAB0];
    v15[18] = CFSTR("SuggestionsDetectReminders");
    v15[19] = CFSTR("SuggestionsDetectStructuredsEventML");
    v16[18] = MEMORY[0x1E0C9AAB0];
    v16[19] = MEMORY[0x1E0C9AAA0];
    v15[20] = CFSTR("SuggestionsDetectRemindersInMail");
    v15[21] = CFSTR("SuggestionsHashedSessionsLogging");
    v16[20] = MEMORY[0x1E0C9AAB0];
    v16[21] = &unk_1E4781400;
    v15[22] = CFSTR("CloudKitPersistedState");
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[22] = v8;
    v16[23] = CFSTR("babar-siri-intl-intelligence-babar-prod.usspk05.app.apple.com");
    v15[23] = CFSTR("SuggestionsParsecFlightCachingAPIBaseURL");
    v15[24] = CFSTR("UseManateeSaltForHistory");
    v15[25] = CFSTR("ShowOperatingSystemVersionInSnippets");
    v15[26] = CFSTR("SuggestionsHarvestBudgetNumberOfOperations");
    v16[26] = &unk_1E4781418;
    v16[27] = &unk_1E47817D0;
    v15[27] = CFSTR("SuggestionsHarvestBudgetCPUTimeSeconds");
    v15[28] = CFSTR("SuggestionsFollowUpTimeRangeForDebugging");
    v16[24] = v7;
    v16[25] = v6;
    v16[28] = MEMORY[0x1E0C9AA70];
    v16[29] = MEMORY[0x1E0C9AA70];
    v15[29] = CFSTR("SuggestionsFollowUpComputeCustomTimeRange");
    v15[30] = CFSTR("SuggestionsMailIntelligenceSPILogging");
    v16[30] = v6;
    v16[31] = v7;
    v15[31] = CFSTR("EnableDKIMEnforcement");
    v15[32] = CFSTR("SuggestionsEventsMLRegexEnsembleExtractionEnabled");
    v16[32] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults registerDefaults:](v5, "registerDefaults:", v9);

    -[NSUserDefaults synchronize](v2->_suggestionsDefaults, "synchronize");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.suggestions.settingMonitorQueue", v10);
    settingsUpdateQueue = v2->_settingsUpdateQueue;
    v2->_settingsUpdateQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)_suspendNotificationQueue
{
  NSObject *settingsUpdateQueue;
  _QWORD block[5];

  settingsUpdateQueue = self->_settingsUpdateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SGPreferenceManager__suspendNotificationQueue__block_invoke;
  block[3] = &unk_1E47627A0;
  block[4] = self;
  dispatch_barrier_sync(settingsUpdateQueue, block);
}

- (void)_resumeNotificationQueue
{
  dispatch_resume((dispatch_object_t)self->_settingsUpdateQueue);
  dispatch_barrier_sync((dispatch_queue_t)self->_settingsUpdateQueue, &__block_literal_global_12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsUpdateQueue, 0);
  objc_storeStrong((id *)&self->_suggestionsDefaults, 0);
}

void __48__SGPreferenceManager__suspendNotificationQueue__block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __37__SGPreferenceManager_defaultManager__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  v0 = objc_opt_new();
  v1 = (void *)defaultManager_sharedManager;
  defaultManager_sharedManager = v0;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
    return objc_msgSend((id)defaultManager_sharedManager, "registerBlock:", &__block_literal_global_10);
  return result;
}

void __37__SGPreferenceManager_defaultManager__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  sgLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1A2267000, v0, OS_LOG_TYPE_DEBUG, "Suggestions settings changed.", v1, 2u);
  }

}

@end
