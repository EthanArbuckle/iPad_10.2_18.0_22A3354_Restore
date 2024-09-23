@implementation ATXNotificationDeliverySuggestionManager

- (ATXNotificationDeliverySuggestionManager)init
{
  void *v3;
  void *v4;
  ATXNotificationDeliverySuggestionManager *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXNotificationDeliverySuggestionManager initWithDataStore:suggestionBiomeStream:](self, "initWithDataStore:suggestionBiomeStream:", v3, v4);

  return v5;
}

- (ATXNotificationDeliverySuggestionManager)initWithDataStore:(id)a3 suggestionBiomeStream:(id)a4
{
  id v7;
  id v8;
  ATXNotificationDeliverySuggestionManager *v9;
  ATXNotificationDeliverySuggestionManager *v10;
  ATXNotificationSmartPauseManager *v11;
  ATXNotificationSmartPauseManager *smartPauseManager;
  ATXSendMessagesToDigestManager *v13;
  ATXSendMessagesToDigestManager *sendMessagesToDigestManager;
  ATXSendToDigestManager *v15;
  ATXSendToDigestManager *sendToDigestManager;
  ATXTurnOffNotificationsForAppSuggestionManager *v17;
  ATXTurnOffNotificationsForAppSuggestionManager *turnOffNotificationsForAppManager;
  uint64_t v19;
  ATXNotificationManagementMAConstants *constants;
  ATXChinSuggestionThrottlingManager *v21;
  ATXChinSuggestionThrottlingManager *throttlingManager;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationDeliverySuggestionManager;
  v9 = -[ATXNotificationDeliverySuggestionManager init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataStore, a3);
    objc_storeStrong((id *)&v10->_biomeStream, a4);
    v11 = -[ATXNotificationSmartPauseManager initWithNotificationAndSuggestionDataStore:]([ATXNotificationSmartPauseManager alloc], "initWithNotificationAndSuggestionDataStore:", v10->_dataStore);
    smartPauseManager = v10->_smartPauseManager;
    v10->_smartPauseManager = v11;

    v13 = -[ATXSendMessagesToDigestManager initWithDataStore:]([ATXSendMessagesToDigestManager alloc], "initWithDataStore:", v10->_dataStore);
    sendMessagesToDigestManager = v10->_sendMessagesToDigestManager;
    v10->_sendMessagesToDigestManager = v13;

    v15 = -[ATXSendToDigestManager initWithDataStore:]([ATXSendToDigestManager alloc], "initWithDataStore:", v10->_dataStore);
    sendToDigestManager = v10->_sendToDigestManager;
    v10->_sendToDigestManager = v15;

    v17 = -[ATXTurnOffNotificationsForAppSuggestionManager initWithDataStore:]([ATXTurnOffNotificationsForAppSuggestionManager alloc], "initWithDataStore:", v10->_dataStore);
    turnOffNotificationsForAppManager = v10->_turnOffNotificationsForAppManager;
    v10->_turnOffNotificationsForAppManager = v17;

    objc_msgSend(MEMORY[0x1E0CF8FB0], "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    constants = v10->_constants;
    v10->_constants = (ATXNotificationManagementMAConstants *)v19;

    v21 = objc_alloc_init(ATXChinSuggestionThrottlingManager);
    throttlingManager = v10->_throttlingManager;
    v10->_throttlingManager = v21;

  }
  return v10;
}

- (unint64_t)currentMode
{
  void *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80E48], "currentModeSemanticType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "atxModeForDNDSemanticType:", objc_msgSend(v2, "integerValue"));

    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      ATXModeToString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Notification delivery suggestion manager: Current mode is %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Notification delivery suggestion manager: User is not currently in a mode", (uint8_t *)&v8, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (BOOL)digestHasBeenShownEnoughTimes
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("digestInstances")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2419200.0);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "publisherFromStartTime:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke;
    v13[3] = &unk_1E82DAF68;
    v13[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke_24;
    v12[3] = &unk_1E82E5828;
    v12[4] = &v14;
    v12[5] = 7;
    v9 = (id)objc_msgSend(v8, "drivableSinkWithBookmark:completion:shouldContinue:", 0, v13, v12);
    v10 = v15[3];
    v5 = v10 == 7;
    if (v10 == 7)
      objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("digestInstances"));
    _Block_object_dispose(&v14, 8);

  }
  return v5;
}

void __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke_cold_1(a1, v3, v5);

  }
}

BOOL __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke_24(uint64_t a1)
{
  return ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *(_QWORD *)(a1 + 40);
}

- (void)activeSuggestionsWithReply:(id)a3
{
  id v4;
  ATXChinSuggestionThrottlingManager *throttlingManager;
  ATXChinSuggestionRequest *v6;
  uint64_t v7;
  id v8;
  ATXChinSuggestionRequest *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  throttlingManager = self->_throttlingManager;
  v6 = [ATXChinSuggestionRequest alloc];
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__ATXNotificationDeliverySuggestionManager_activeSuggestionsWithReply___block_invoke;
  v12[3] = &unk_1E82DA8E8;
  v12[4] = self;
  v13 = v4;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __71__ATXNotificationDeliverySuggestionManager_activeSuggestionsWithReply___block_invoke_2;
  v10[3] = &unk_1E82DA9F8;
  v11 = v13;
  v8 = v13;
  v9 = -[ATXChinSuggestionRequest initWithAcceptedBlock:rejectedBlock:](v6, "initWithAcceptedBlock:rejectedBlock:", v12, v10);
  -[ATXChinSuggestionThrottlingManager scheduleRequest:](throttlingManager, "scheduleRequest:", v9);

}

uint64_t __71__ATXNotificationDeliverySuggestionManager_activeSuggestionsWithReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activeSuggestionsWithReply:", *(_QWORD *)(a1 + 40));
}

void __71__ATXNotificationDeliverySuggestionManager_activeSuggestionsWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CF8960], 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_activeSuggestionsWithReply:(id)a3
{
  ATXNotificationManagementMAConstants *constants;
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  NSObject *v36;
  char *v37;
  NSObject *v38;
  void *v39;
  char *v40;
  NSObject *v41;
  char *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t spid;
  void *v49;
  void *v50;
  unint64_t v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  constants = self->_constants;
  v5 = a3;
  v6 = -[ATXNotificationManagementMAConstants chinSuggestionsAreDisabled](constants, "chinSuggestionsAreDisabled");
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[ATXNotificationDeliverySuggestionManager _activeSuggestionsWithReply:]";
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: Chin suggestions are disabled. Returning empty array.", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, MEMORY[0x1E0C9AA60], 0);
    v9 = v5;
  }
  else
  {
    v10 = os_signpost_id_generate(v7);

    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v51 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ATXNotificationDeliverySuggestionManager.activeSuggestionsWithReply", " enableTelemetry=YES ", buf, 2u);
    }

    __atxlog_handle_notification_management();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[ATXNotificationDeliverySuggestionManager _activeSuggestionsWithReply:]";
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%s called. Updating the datastore...", buf, 0xCu);
    }
    spid = v10;

    -[ATXNotificationAndSuggestionDatastore updateDatabase](self->_dataStore, "updateDatabase");
    __atxlog_handle_notification_management();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_INFO, "Querying sub-models...", buf, 2u);
    }

    -[ATXNotificationSmartPauseManager activeSuggestions](self->_smartPauseManager, "activeSuggestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v9, "count", spid);
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v16;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "Suggestion manager received %lu Smart Pause suggestions", buf, 0xCu);
    }

    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "activeNotificationSuggestionsForMode:", -[ATXNotificationDeliverySuggestionManager currentMode](self, "currentMode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_notification_management();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v20;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_INFO, "Suggestion manager received %lu Mode Configuration Tuning Suggestions", buf, 0xCu);
    }

    __atxlog_handle_notification_management();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v18;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "Suggestion manager received Mode Configuration Tuning Suggestions:%@", buf, 0xCu);
    }

    -[ATXSendMessagesToDigestManager activeSuggestions](self->_sendMessagesToDigestManager, "activeSuggestions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v24;
      _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_INFO, "Suggestion manager received %lu Send Messages To Digest Suggestions", buf, 0xCu);
    }

    -[ATXSendToDigestManager activeSuggestions](self->_sendToDigestManager, "activeSuggestions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v27;
      _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_INFO, "Suggestion manager received %lu Send To Digest Suggestions", buf, 0xCu);
    }

    -[ATXTurnOffNotificationsForAppSuggestionManager activeSuggestions](self->_turnOffNotificationsForAppManager, "activeSuggestions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(v28, "count");
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v30;
      _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_INFO, "Suggestion manager received %lu TurnOffNotificationsForApp suggestions", buf, 0xCu);
    }

    v31 = -[ATXNotificationDeliverySuggestionManager digestHasBeenShownEnoughTimes](self, "digestHasBeenShownEnoughTimes");
    v32 = (void *)objc_opt_new();
    v33 = v32;
    if (v9)
      objc_msgSend(v32, "addObjectsFromArray:", v9);
    if (v18)
      objc_msgSend(v33, "addObjectsFromArray:", v18);
    if (v22)
      v34 = v31;
    else
      v34 = 0;
    if (v34)
      objc_msgSend(v33, "addObjectsFromArray:", v22);
    if (v25)
      v35 = v31;
    else
      v35 = 0;
    if (v35)
      objc_msgSend(v33, "addObjectsFromArray:", v25);
    if (v28)
      objc_msgSend(v33, "addObjectsFromArray:", v28);
    v49 = v25;
    __atxlog_handle_notification_management();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v33;
      _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "All suggestions: %@", buf, 0xCu);
    }
    v50 = v22;

    -[ATXNotificationDeliverySuggestionManager filteredSuggestionsBasedOnFeedback:](self, "filteredSuggestionsBasedOnFeedback:", v33);
    v37 = (char *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v37;
      _os_log_impl(&dword_1C9A3B000, v38, OS_LOG_TYPE_DEFAULT, "Suggestions after removing recently shown: %@", buf, 0xCu);
    }
    v39 = v18;

    -[ATXNotificationDeliverySuggestionManager deduplicatedSuggestions:](self, "deduplicatedSuggestions:", v37);
    v40 = (char *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v40;
      _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_DEFAULT, "Suggestions after deduplicating: %@", buf, 0xCu);
    }

    -[ATXNotificationDeliverySuggestionManager maxOneSuggestionFromSuggestions:](self, "maxOneSuggestionFromSuggestions:", v40);
    v42 = (char *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v42;
      _os_log_impl(&dword_1C9A3B000, v43, OS_LOG_TYPE_DEFAULT, "Suggestions after thresholding: %@", buf, 0xCu);
    }

    -[ATXNotificationDeliverySuggestionManager logSuggestionsToBiome:](self, "logSuggestionsToBiome:", v42);
    __atxlog_handle_notification_management();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v42, "count");
      *(_DWORD *)buf = 136315394;
      v53 = "-[ATXNotificationDeliverySuggestionManager _activeSuggestionsWithReply:]";
      v54 = 2048;
      v55 = v45;
      _os_log_impl(&dword_1C9A3B000, v44, OS_LOG_TYPE_DEFAULT, "%s returning %lu suggestions", buf, 0x16u);
    }

    (*((void (**)(id, char *, _QWORD))v5 + 2))(v5, v42, 0);
    __atxlog_handle_notification_management();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v47, OS_SIGNPOST_INTERVAL_END, spid, "ATXNotificationDeliverySuggestionManager.activeSuggestionsWithReply", " enableTelemetry=YES ", buf, 2u);
    }

  }
}

- (id)filteredSuggestionsBasedOnFeedback:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  ATXNotificationAndSuggestionDatastore *dataStore;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  ATXNotificationDeliverySuggestionManager *v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_136);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dataStore = self->_dataStore;
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationAndSuggestionDatastore feedbackHistoriesForKeys:](dataStore, "feedbackHistoriesForKeys:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__ATXNotificationDeliverySuggestionManager_filteredSuggestionsBasedOnFeedback___block_invoke_2;
  v14[3] = &unk_1E82E5890;
  v15 = v10;
  v16 = self;
  v11 = v10;
  objc_msgSend(v5, "_pas_filteredArrayWithTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __79__ATXNotificationDeliverySuggestionManager_filteredSuggestionsBasedOnFeedback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "feedbackKey");
}

uint64_t __79__ATXNotificationDeliverySuggestionManager_filteredSuggestionsBasedOnFeedback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "subtype") == 9)
  {
    v4 = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "feedbackKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v4 = objc_msgSend(*(id *)(a1 + 40), "shouldShowSuggestion:withFeedback:", v3, v7);
    else
      v4 = 1;

  }
  return v4;
}

- (BOOL)shouldShowSuggestion:(id)a3 withFeedback:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  double v28;
  long double v29;
  double v30;
  BOOL v31;
  double v32;
  uint64_t v33;
  ATXNotificationManagementMAConstants *constants;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v42;
  void *v43;
  const __CFString *v44;
  id v45;
  void *v46;
  ATXNotificationDeliverySuggestionManager *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  const __CFString *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v6 = a4;
  v47 = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[ATXNotificationManagementMAConstants numIgnoresToReject](self->_constants, "numIgnoresToReject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v16, "latestOutcome", v45) == 1 || objc_msgSend(v16, "latestOutcome") == 4)
        {
          ++v13;
          if (!v12)
          {
            objc_msgSend(v16, "createdTimestamp");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        else if (objc_msgSend(v16, "latestOutcome") == 6)
        {
          ++v11;
          v17 = objc_msgSend(v7, "count");
          if (v17 < -[ATXNotificationManagementMAConstants numIgnoresToReject](v47->_constants, "numIgnoresToReject"))
          {
            objc_msgSend(v16, "createdTimestamp");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v18);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }

  v19 = v11 % -[ATXNotificationManagementMAConstants numIgnoresToReject](v47->_constants, "numIgnoresToReject");
  if (v19 >= objc_msgSend(v7, "count"))
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast", v45);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v12)
  {
    objc_msgSend(v21, "laterDate:", v12);
    v23 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v23;
  }
  v24 = v46;
  if (v20)
  {
    objc_msgSend(v22, "laterDate:", v20);
    v25 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v25;
  }
  v26 = v11 / -[ATXNotificationManagementMAConstants numIgnoresToReject](v47->_constants, "numIgnoresToReject") + v13;
  if (v26)
  {
    v27 = (double)v26;
    if (objc_msgSend(v46, "subtype") == 4)
    {
      -[ATXNotificationManagementMAConstants smartPauseTimeoutScaleFactor](v47->_constants, "smartPauseTimeoutScaleFactor");
      v29 = v28;
      -[ATXNotificationManagementMAConstants smartPauseStartTimeoutSeconds](v47->_constants, "smartPauseStartTimeoutSeconds");
    }
    else if (objc_msgSend(v46, "subtype") == 5)
    {
      -[ATXNotificationManagementMAConstants interruptionManagementTimeoutScaleFactor](v47->_constants, "interruptionManagementTimeoutScaleFactor");
      v29 = v32;
      -[ATXNotificationManagementMAConstants interruptionManagementStartTimeoutSeconds](v47->_constants, "interruptionManagementStartTimeoutSeconds");
    }
    else
    {
      v33 = objc_msgSend(v46, "subtype");
      constants = v47->_constants;
      if (v33 == 6)
      {
        -[ATXNotificationManagementMAConstants sendToDigestTimeoutScaleFactor](constants, "sendToDigestTimeoutScaleFactor");
        v29 = v35;
        -[ATXNotificationManagementMAConstants sendToDigestStartTimeoutSeconds](v47->_constants, "sendToDigestStartTimeoutSeconds");
      }
      else
      {
        -[ATXNotificationManagementMAConstants backupTimeoutScaleFactor](constants, "backupTimeoutScaleFactor");
        v29 = v36;
        -[ATXNotificationManagementMAConstants backupStartTimeoutSeconds](v47->_constants, "backupStartTimeoutSeconds");
      }
    }
    objc_msgSend(v22, "dateByAddingTimeInterval:", (double)(v30 * pow(v29, v27 + -1.0)));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "compare:", v37);
    v31 = v39 == 1;

    __atxlog_handle_notification_management();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v53 = v43;
      v54 = 2112;
      if (v39 == 1)
        v44 = CFSTR("YES");
      v55 = v46;
      v56 = 2112;
      v57 = v37;
      v58 = 2112;
      v59 = v44;
      _os_log_debug_impl(&dword_1C9A3B000, v40, OS_LOG_TYPE_DEBUG, "%@ - Suggestion %@ has next eligible timestamp %@.  Should show is %@", buf, 0x2Au);

      v24 = v46;
    }

  }
  else
  {
    v31 = 1;
  }

  return v31;
}

- (id)deduplicatedSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXNotificationDeliverySuggestionManager currentActiveSuggestions](self, "currentActiveSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v7;
    objc_msgSend(v7, "entityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "entityIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v8);

          if ((v16 & 1) != 0)
          {
            v24 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
            v17 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  v17 = v4;
LABEL_13:

  return v17;
}

- (unint64_t)getScoreForSuggestion:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "subtype");
  if (v3 > 0xA)
    return 9;
  else
    return qword_1C9E804A0[v3];
}

- (id)maxOneSuggestionFromSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (!v5)
    goto LABEL_12;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      v12 = -[ATXNotificationDeliverySuggestionManager getScoreForSuggestion:](self, "getScoreForSuggestion:", v11);
      if (v12 > v7)
      {
        v13 = v12;
        v14 = v11;

        v7 = v13;
        v8 = v14;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  }
  while (v6);
  if (v8)
  {
    v21 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (id)currentActiveSuggestions
{
  return -[ATXNotificationAndSuggestionDatastore currentActiveSuggestions](self->_dataStore, "currentActiveSuggestions");
}

- (void)logSuggestionsToBiome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_notification_management();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Replying with notification adjacent suggestions: %lu suggestions", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1CAA48B6C]();
        __atxlog_handle_notification_management();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v11;
          _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "notification adjacent suggestion: %@", buf, 0xCu);
        }

        -[ATXNotificationSuggestionBiomeStream source](self->_biomeStream, "source");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sendEvent:", v11);

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlingManager, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_biomeStream, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_turnOffNotificationsForAppManager, 0);
  objc_storeStrong((id *)&self->_sendToDigestManager, 0);
  objc_storeStrong((id *)&self->_sendMessagesToDigestManager, 0);
  objc_storeStrong((id *)&self->_smartPauseManager, 0);
}

void __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "[%@] Error while sinking Biome stream: %@.", (uint8_t *)&v8, 0x16u);

}

@end
