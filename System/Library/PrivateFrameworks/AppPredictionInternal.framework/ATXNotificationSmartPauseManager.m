@implementation ATXNotificationSmartPauseManager

- (ATXNotificationSmartPauseManager)init
{
  void *v3;
  ATXNotificationSmartPauseManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXNotificationSmartPauseManager initWithNotificationAndSuggestionDataStore:](self, "initWithNotificationAndSuggestionDataStore:", v3);

  return v4;
}

- (ATXNotificationSmartPauseManager)initWithNotificationAndSuggestionDataStore:(id)a3
{
  id v5;
  ATXNotificationSmartPauseManager *v6;
  ATXNotificationSmartPauseManager *v7;
  uint64_t v8;
  ATXNotificationManagementMAConstants *notificationManagementMAConstants;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationSmartPauseManager;
  v6 = -[ATXNotificationSmartPauseManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    objc_msgSend(MEMORY[0x1E0CF8FB0], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    notificationManagementMAConstants = v7->_notificationManagementMAConstants;
    v7->_notificationManagementMAConstants = (ATXNotificationManagementMAConstants *)v8;

  }
  return v7;
}

- (id)_queryResultIdentifierForBundleId:(id)a3 threadId:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), a3, a4);
}

- (id)_dictionaryForQueryResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "bundleId", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "threadId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXNotificationSmartPauseManager _queryResultIdentifierForBundleId:threadId:](self, "_queryResultIdentifierForBundleId:threadId:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_proposeSmartPauseForNotification:(id)a3 threadData:(id)a4 bundleData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  NSObject *v40;
  unint64_t v41;
  double v42;
  void *v43;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  int v58;
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  double v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "threadID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v9)
    {
      v12 = (double)(unint64_t)objc_msgSend(v9, "countLastFiveMinutesPositiveEngagements");
      v13 = v12 / (double)(unint64_t)objc_msgSend(v9, "countLastFiveMinutesNotifications");
      __atxlog_handle_notification_management();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "threadID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 136315906;
        v59 = "-[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:]";
        v60 = 2112;
        v61 = v57;
        v62 = 2048;
        v63 = objc_msgSend(v9, "countLastFiveMinutesNotifications");
        v64 = 2048;
        v65 = v13;
        _os_log_debug_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEBUG, "%s: Considering SmartPause suggestion for thread: %@ countLastFiveMinutesNotifications: %ld lastFiveMinutesEngagementRate: %f", (uint8_t *)&v58, 0x2Au);

      }
      v15 = objc_msgSend(v9, "countLastFiveMinutesNotifications");
      if (v15 > -[ATXNotificationManagementMAConstants smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForThread](self->_notificationManagementMAConstants, "smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForThread"))
      {
        -[ATXNotificationManagementMAConstants smartPauseManagerEngagementRateThresholdForThread](self->_notificationManagementMAConstants, "smartPauseManagerEngagementRateThresholdForThread");
        if (v13 <= v16)
        {
          __atxlog_handle_notification_management();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:].cold.3(v17, v18, v19, v20, v21, v22, v23, v24);

          v25 = objc_alloc(MEMORY[0x1E0CF8FF8]);
          v26 = (void *)MEMORY[0x1E0C99D68];
          -[ATXNotificationManagementMAConstants smartPauseManagerExpirationSeconds](self->_notificationManagementMAConstants, "smartPauseManagerExpirationSeconds");
          objc_msgSend(v26, "dateWithTimeIntervalSinceNow:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXNotificationManagementMAConstants smartPauseManagerPauseDurationSeconds](self->_notificationManagementMAConstants, "smartPauseManagerPauseDurationSeconds");
          v28 = (void *)objc_msgSend(v25, "initWithSuggestionExpiration:pauseDuration:", v27);

          v29 = objc_alloc(MEMORY[0x1E0CF8F90]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "threadID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uuid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v29;
          v35 = v28;
          v36 = v30;
          v37 = 2;
LABEL_20:
          v43 = (void *)objc_msgSend(v34, "initWithSmartPauseSuggestion:uuid:scope:entityIdentifier:timestamp:triggerNotificationUUID:", v35, v36, v37, v31, v32, v33);

          goto LABEL_16;
        }
      }
    }
  }
  else if (v10)
  {
    v38 = (double)(unint64_t)objc_msgSend(v10, "countLastFiveMinutesPositiveEngagements");
    v39 = v38 / (double)(unint64_t)objc_msgSend(v10, "countLastFiveMinutesNotifications");
    __atxlog_handle_notification_management();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      -[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:].cold.2(v10, v40, v39);

    v41 = objc_msgSend(v10, "countLastFiveMinutesNotifications");
    if (v41 > -[ATXNotificationManagementMAConstants smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForApp](self->_notificationManagementMAConstants, "smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForApp"))
    {
      -[ATXNotificationManagementMAConstants smartPauseManagerEngagementRateThresholdForApp](self->_notificationManagementMAConstants, "smartPauseManagerEngagementRateThresholdForApp");
      if (v39 <= v42)
      {
        __atxlog_handle_notification_management();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          -[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:].cold.1(v45, v46, v47, v48, v49, v50, v51, v52);

        v53 = objc_alloc(MEMORY[0x1E0CF8FF8]);
        v54 = (void *)MEMORY[0x1E0C99D68];
        -[ATXNotificationManagementMAConstants smartPauseManagerExpirationSeconds](self->_notificationManagementMAConstants, "smartPauseManagerExpirationSeconds");
        objc_msgSend(v54, "dateWithTimeIntervalSinceNow:");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXNotificationManagementMAConstants smartPauseManagerPauseDurationSeconds](self->_notificationManagementMAConstants, "smartPauseManagerPauseDurationSeconds");
        v28 = (void *)objc_msgSend(v53, "initWithSuggestionExpiration:pauseDuration:", v55);

        v56 = objc_alloc(MEMORY[0x1E0CF8F90]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v56;
        v35 = v28;
        v36 = v30;
        v37 = 1;
        goto LABEL_20;
      }
    }
  }
  v43 = 0;
LABEL_16:

  return v43;
}

- (id)currentSuggestionsGivenCandiateNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  ATXNotificationAndSuggestionDatastore *dataStore;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  void *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  ATXNotificationSmartPauseManager *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v4 = a3;
  __atxlog_handle_notification_management();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:].cold.2(v4, v5);

  dataStore = self->_dataStore;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_107);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[ATXNotificationAndSuggestionDatastore getSmartPauseFeaturesForBundleIds:sinceTimestamp:](dataStore, "getSmartPauseFeaturesForBundleIds:sinceTimestamp:", v7, v8 + -2592000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXNotificationSmartPauseManager _dictionaryForQueryResults:](self, "_dictionaryForQueryResults:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSmartPauseDatabaseQueryResult groupByBundleId:](ATXSmartPauseDatabaseQueryResult, "groupByBundleId:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:", v12 + -300.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v13, 0, 0, 0, 0);
  BiomeLibrary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "App");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "InFocus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2;
  v35[3] = &unk_1E82DB658;
  v35[4] = &v36;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_21;
  v33[3] = &unk_1E82DB0C8;
  v20 = v10;
  v34 = v20;
  v21 = (id)objc_msgSend(v18, "sinkWithCompletion:receiveInput:", v35, v33);
  if (*((_BYTE *)v37 + 24))
  {
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_23;
    v28[3] = &unk_1E82E3AD8;
    v29 = v20;
    v22 = v26;
    v30 = v26;
    v31 = self;
    v32 = v27;
    objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v29;
  }
  else
  {
    __atxlog_handle_notification_management();
    v24 = objc_claimAutoreleasedReturnValue();
    v22 = v26;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:].cold.1(v24);
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  _Block_object_dispose(&v36, 8);
  return v23;
}

uint64_t __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleID");
}

void __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (v4)
  {
    if (v4 == 1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      __atxlog_handle_notification_management();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2_cold_1(v3, v5);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

void __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "bundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

    v3 = v5;
  }

}

id __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4))
    {
      v7 = *(void **)(a1 + 40);
      v8 = *(void **)(a1 + 48);
      objc_msgSend(v3, "threadID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_queryResultIdentifierForBundleId:threadId:", v4, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "_proposeSmartPauseForNotification:threadData:bundleData:", v3, v11, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "-[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:]_block_invoke";
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: Found app launch for bundleId: %@ in the last five minutes so not showing SmartPause for notification: %@", (uint8_t *)&v14, 0x20u);
    }

  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (id)activeSuggestions
{
  void *v3;
  void *v4;

  -[ATXNotificationAndSuggestionDatastore getTopOfProminentStackNotificationsWithLimit:](self->_dataStore, "getTopOfProminentStackNotificationsWithLimit:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:](self, "currentSuggestionsGivenCandiateNotifications:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementMAConstants, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_currentSuggestions, 0);
}

- (void)_proposeSmartPauseForNotification:(uint64_t)a3 threadData:(uint64_t)a4 bundleData:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a1, a3, "%s: Sending SmartPause suggestion for app", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_proposeSmartPauseForNotification:(void *)a1 threadData:(NSObject *)a2 bundleData:(double)a3 .cold.2(void *a1, NSObject *a2, double a3)
{
  __int16 v5;
  int v6[5];
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "countLastFiveMinutesNotifications");
  v6[0] = 136315650;
  OUTLINED_FUNCTION_3_10();
  v7 = v5;
  v8 = a3;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "%s: Considering SmartPause suggestion for app, countLastFiveMinutesNotifications: %ld lastFiveMinutesEngagementRate: %f", (uint8_t *)v6, 0x20u);
}

- (void)_proposeSmartPauseForNotification:(uint64_t)a3 threadData:(uint64_t)a4 bundleData:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a1, a3, "%s: Sending SmartPause suggestion for notification", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)currentSuggestionsGivenCandiateNotifications:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:]";
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "%s: Not returning any SmartPause suggestions because reading app launch events from Biome failed", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)currentSuggestionsGivenCandiateNotifications:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  int v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  v3[0] = 136315394;
  OUTLINED_FUNCTION_3_10();
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "%s: Fetching SmartPause suggestions for %ld candidate notifications", (uint8_t *)v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:]_block_invoke_2";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: Error while reading from biome: %@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_1();
}

@end
