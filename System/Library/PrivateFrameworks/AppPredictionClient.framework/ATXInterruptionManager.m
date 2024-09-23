@implementation ATXInterruptionManager

- (ATXInterruptionManager)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXInterruptionManager *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  +[ATXDNDModeConfigurationClient sharedInstance](ATXDNDModeConfigurationClient, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXInterruptionManager initWithModesModels:notificationSettingsReader:modeConfigurationClient:](self, "initWithModesModels:notificationSettingsReader:modeConfigurationClient:", v3, v4, v5);

  return v6;
}

- (ATXInterruptionManager)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 modeConfigurationClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXInterruptionManager *v12;
  ATXInterruptionManager *v13;
  uint64_t v14;
  ATXNotificationManagementMAConstants *notificationManagementConstants;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXInterruptionManager;
  v12 = -[ATXInterruptionManager init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modesModels, a3);
    objc_storeStrong((id *)&v13->_notificationSettingsReader, a4);
    objc_storeStrong((id *)&v13->_modeConfigurationClient, a5);
    +[ATXNotificationManagementMAConstants sharedInstance](ATXNotificationManagementMAConstants, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    notificationManagementConstants = v13->_notificationManagementConstants;
    v13->_notificationManagementConstants = (ATXNotificationManagementMAConstants *)v14;

  }
  return v13;
}

- (id)recommendedAllowedAppsForMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 == 5)
    return MEMORY[0x1E0C9AA60];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[ATXModeEntityScorerProtocol rankedAppsForMode:](self->_modesModels, "rankedAppsForMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ATXInterruptionManager_recommendedAllowedAppsForMode___block_invoke;
  v9[3] = &unk_1E4D578E0;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v5, "_pas_filteredArrayWithTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *((_DWORD *)v11 + 6);
    *(_DWORD *)buf = 67109120;
    v15 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Number of allowed apps returned from Proactive for configuration suggestions = %d", buf, 8u);
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __56__ATXInterruptionManager_recommendedAllowedAppsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "scoreMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerRecommendationThresholdForApps");
  v8 = v7;

  if (v6 >= v8
    && (v9 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24),
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerMaxSuggestions") > v9)
    && objc_msgSend(*(id *)(a1 + 32), "appSatisfiesRelevanceCriteriaForAllowOrSilenceList:", v3))
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)recommendedDeniedAppsForMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 == 4)
    return MEMORY[0x1E0C9AA60];
  -[ATXModeEntityScorerProtocol rankedAppsForDenyListForMode:](self->_modesModels, "rankedAppsForDenyListForMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ATXInterruptionManager_recommendedDeniedAppsForMode___block_invoke;
  v9[3] = &unk_1E4D578E0;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v5, "_pas_filteredArrayWithTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *((_DWORD *)v11 + 6);
    *(_DWORD *)buf = 67109120;
    v15 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Number of apps returned from Proactive for deny list configuration suggestions = %d", buf, 8u);
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __55__ATXInterruptionManager_recommendedDeniedAppsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "scoreMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerRecommendationDenyListThresholdForApps");
  v8 = v7;

  if (v6 >= v8
    && (v9 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24),
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerMaxAppSuggestionsForDenyList") > v9)
    && objc_msgSend(*(id *)(a1 + 32), "appSatisfiesRelevanceCriteriaForAllowOrSilenceList:", v3))
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)appSatisfiesRelevanceCriteriaForAllowOrSilenceList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "scoreMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correlationEntitySpecificFeatures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notificationsReceivedInLastTwoWeeks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correlationNumGlobalOccurrences"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "integerValue") >= 3 && objc_msgSend(v7, "integerValue") <= 1)
  {
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2048;
      v16 = 0x4008000000000000;
      v17 = 2048;
      v18 = 0x4000000000000000;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "Suppressing silence list sugggestion for app: %@ since it does not meet relevance criteria: globalAppLaunches.integerValue < %f / minimumNumberOfNotificationsReceivedInPastTwoWeeks >= %f", (uint8_t *)&v13, 0x20u);

    }
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)recommendedDeniedContactsForMode:(unint64_t)a3
{
  return -[ATXInterruptionManager recommendedDeniedContactsForMode:options:](self, "recommendedDeniedContactsForMode:options:", a3, 0);
}

- (id)recommendedDeniedContactsForMode:(unint64_t)a3 options:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[ATXModeEntityScorerProtocol rankedContactsForDenyListForMode:options:](self->_modesModels, "rankedContactsForDenyListForMode:options:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__ATXInterruptionManager_recommendedDeniedContactsForMode_options___block_invoke;
  v11[3] = &unk_1E4D57908;
  v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_management();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *((_DWORD *)v13 + 6);
    *(_DWORD *)buf = 67109120;
    v17 = v9;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Number of contacts returned from Proactive for deny list configuration suggestions = %d", buf, 8u);
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __67__ATXInterruptionManager_recommendedDeniedContactsForMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "scoreMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerRecommendationDenyListThresholdForContacts");
  v8 = v7;

  if (v6 < v8)
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v3;
      v13 = "%@: %@ Filtering out contact (%@) because affinity score is below threshold";
LABEL_8:
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 0x20u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v14 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerMaxContactSuggestionsForDenyList") <= v14)
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v3;
      v13 = "%@: %@ Suggestion limit has been reached, filtering out contact: %@";
      goto LABEL_8;
    }
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v15 = 1;
LABEL_10:

  return v15;
}

- (id)recommendedAllowedContactsForContactScores:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__ATXInterruptionManager_recommendedAllowedContactsForContactScores___block_invoke;
  v10[3] = &unk_1E4D57930;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __69__ATXInterruptionManager_recommendedAllowedContactsForContactScores___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "scoreMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "score");
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerRecommendationThresholdForContacts");
  v10 = v9;

  if (v8 >= v10)
  {
    objc_msgSend(v13, "cnContactId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
      v12 = objc_msgSend(*(id *)(a1 + 40), "count");
      if (v12 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerMaxSuggestions"))
        *a4 = 1;
    }
  }

}

- (void)recommendedAllowedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  ATXModeEntityScorerProtocol *modesModels;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = v6;
  if (a3 == 5)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__ATXInterruptionManager_recommendedAllowedContactsForMode_reply___block_invoke;
    v9[3] = &unk_1E4D57958;
    v9[4] = self;
    v10 = v6;
    -[ATXModeEntityScorerProtocol rankedContactsForMode:reply:](modesModels, "rankedContactsForMode:reply:", a3, v9);

  }
}

void __66__ATXInterruptionManager_recommendedAllowedContactsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "recommendedAllowedContactsForContactScores:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "Number of allowed contacts returned from Proactive for configuration suggestions = %lu", (uint8_t *)&v6, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)recommendedAllowedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAllowedContactsForMode:reply:](self, "recommendedAllowedContactsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDSemanticType:](modeConfigurationClient, "atxModeForDNDSemanticType:", a3), v7);

}

- (void)recommendedAndCandidateAllowedAppsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAndCandidateAllowedAppsForMode:reply:](self, "recommendedAndCandidateAllowedAppsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDSemanticType:](modeConfigurationClient, "atxModeForDNDSemanticType:", a3), v7);

}

- (void)recommendedAllowedContactsForDNDMode:(id)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAllowedContactsForMode:reply:](self, "recommendedAllowedContactsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigurationClient, "atxModeForDNDMode:", a3), v7);

}

- (void)recommendedAndCandidateAllowedAppsForDNDMode:(id)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAndCandidateAllowedAppsForMode:reply:](self, "recommendedAndCandidateAllowedAppsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigurationClient, "atxModeForDNDMode:", a3), v7);

}

- (void)recommendedDeniedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedDeniedContactsForMode:reply:](self, "recommendedDeniedContactsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDSemanticType:](modeConfigurationClient, "atxModeForDNDSemanticType:", a3), v7);

}

- (void)recommendedAndCandidateDeniedAppsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAndCandidateDeniedAppsForMode:reply:](self, "recommendedAndCandidateDeniedAppsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDSemanticType:](modeConfigurationClient, "atxModeForDNDSemanticType:", a3), v7);

}

- (void)recommendedDeniedContactsForDNDMode:(id)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedDeniedContactsForMode:reply:](self, "recommendedDeniedContactsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigurationClient, "atxModeForDNDMode:", a3), v7);

}

- (void)recommendedAndCandidateDeniedAppsForDNDMode:(id)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAndCandidateDeniedAppsForMode:reply:](self, "recommendedAndCandidateDeniedAppsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigurationClient, "atxModeForDNDMode:", a3), v7);

}

- (void)recommendedAndCandidateAllowedContactsForDNDMode:(id)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAndCandidateAllowedContactsForMode:reply:](self, "recommendedAndCandidateAllowedContactsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigurationClient, "atxModeForDNDMode:", a3), v7);

}

- (void)recommendedAndCandidateDeniedContactsForDNDMode:(id)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAndCandidateDeniedContactsForMode:reply:](self, "recommendedAndCandidateDeniedContactsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigurationClient, "atxModeForDNDMode:", a3), v7);

}

- (void)recommendedAndCandidateAllowedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAndCandidateAllowedContactsForMode:reply:](self, "recommendedAndCandidateAllowedContactsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDSemanticType:](modeConfigurationClient, "atxModeForDNDSemanticType:", a3), v7);

}

- (void)recommendedAndCandidateDeniedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v7;

  modeConfigurationClient = self->_modeConfigurationClient;
  v7 = a4;
  -[ATXInterruptionManager recommendedAndCandidateDeniedContactsForMode:reply:](self, "recommendedAndCandidateDeniedContactsForMode:reply:", -[ATXDNDModeConfigurationClient atxModeForDNDSemanticType:](modeConfigurationClient, "atxModeForDNDSemanticType:", a3), v7);

}

- (void)recommendedDeniedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  void *v8;
  ATXModeEntityScorerProtocol *modesModels;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v7 = a4;
  v8 = v7;
  if (a3 == 4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__ATXInterruptionManager_recommendedDeniedContactsForMode_reply___block_invoke;
    v10[3] = &unk_1E4D57980;
    v10[4] = self;
    v11 = v7;
    v12 = a2;
    -[ATXModeEntityScorerProtocol rankedContactsForDenyListForMode:options:reply:](modesModels, "rankedContactsForDenyListForMode:options:reply:", a3, 0, v10);

  }
}

void __65__ATXInterruptionManager_recommendedDeniedContactsForMode_reply___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__ATXInterruptionManager_recommendedDeniedContactsForMode_reply___block_invoke_2;
    v11[3] = &unk_1E4D57908;
    v7 = a1[6];
    v11[5] = &v12;
    v11[6] = v7;
    v11[4] = a1[4];
    objc_msgSend(v5, "_pas_filteredArrayWithTest:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *((_DWORD *)v13 + 6);
      *(_DWORD *)buf = 67109120;
      v17 = v10;
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Number of allowed contacts returned from Proactive for deny list configuration suggestions = %d", buf, 8u);
    }

    (*(void (**)(void))(a1[5] + 16))();
    _Block_object_dispose(&v12, 8);
  }

}

uint64_t __65__ATXInterruptionManager_recommendedDeniedContactsForMode_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "scoreMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerRecommendationDenyListThresholdForContacts");
  v8 = v7;

  if (v6 < v8)
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ filtering out contact (%@) because affinity score is below threshold.", (uint8_t *)&v16, 0x20u);

    }
    goto LABEL_7;
  }
  v13 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerMaxContactSuggestionsForDenyList") <= v13)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v14 = 1;
LABEL_8:

  return v14;
}

- (void)recommendedAndCandidateAllowedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  ATXModeEntityScorerProtocol *modesModels;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = v6;
  if (a3 == 5)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke;
    v9[3] = &unk_1E4D57958;
    v9[4] = self;
    v10 = v6;
    -[ATXModeEntityScorerProtocol rankedAppsForMode:reply:](modesModels, "rankedAppsForMode:reply:", a3, v9);

  }
}

void __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke_2;
    v16 = &unk_1E4D579A8;
    v17 = *(_QWORD *)(a1 + 32);
    v7 = v6;
    v18 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v13);
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "recommendedApps", v13, v14, v15, v16, v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      objc_msgSend(v7, "candidateApps");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 136315650;
      v20 = "-[ATXInterruptionManager recommendedAndCandidateAllowedAppsForMode:reply:]_block_invoke";
      v21 = 2048;
      v22 = v10;
      v23 = 2048;
      v24 = v12;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s: Recommended app count: %ld Candidate app count: %ld", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;

  v6 = a2;
  v7 = a1 + 32;
  if (objc_msgSend(*(id *)(a1 + 32), "appSatisfiesRelevanceCriteriaForAllowOrSilenceList:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "recommendedApps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(*(id *)(a1 + 40), "candidateApps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") + v9;
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForAllowList");

    if (v11 >= v12)
    {
      __atxlog_handle_notification_management();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke_2_cold_1(v7);

      *a4 = 1;
    }
    else
    {
      objc_msgSend(v6, "scoreMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "score");
      v15 = v14;
      objc_msgSend(*(id *)(*(_QWORD *)v7 + 32), "interruptionManagerThresholdForRecommendedAppSuggestionForAllowList");
      v17 = v16;

      if (v15 >= v17)
      {
        objc_msgSend(*(id *)(a1 + 40), "addRecommendedApp:", v6);
      }
      else
      {
        objc_msgSend(v6, "scoreMetadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "score");
        v20 = v19;
        objc_msgSend(*(id *)(*(_QWORD *)v7 + 32), "interruptionManagerThresholdForCandidateAppSuggestionForAllowList");
        v22 = v21;

        if (v20 >= v22)
          objc_msgSend(*(id *)(a1 + 40), "addCandidateApp:", v6);
      }
    }
  }

}

- (void)recommendedAndCandidateDeniedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  ATXModeEntityScorerProtocol *modesModels;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = v6;
  if (a3 == 4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    if (a3 == 5)
      a3 = 1;
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke;
    v9[3] = &unk_1E4D57958;
    v9[4] = self;
    v10 = v6;
    -[ATXModeEntityScorerProtocol rankedAppsForDenyListForMode:reply:](modesModels, "rankedAppsForDenyListForMode:reply:", a3, v9);

  }
}

void __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_27;
    v18 = &unk_1E4D579A8;
    v19 = *(_QWORD *)(a1 + 32);
    v9 = v8;
    v20 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v15);
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "recommendedApps", v15, v16, v17, v18, v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      objc_msgSend(v9, "candidateApps");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 136315650;
      v22 = "-[ATXInterruptionManager recommendedAndCandidateDeniedAppsForMode:reply:]_block_invoke";
      v23 = 2048;
      v24 = v12;
      v25 = 2048;
      v26 = v14;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "%s: Returning %ld recommended apps and %ld candidate contacts", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_27(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;

  v6 = a2;
  v7 = a1 + 32;
  if (objc_msgSend(*(id *)(a1 + 32), "appSatisfiesRelevanceCriteriaForAllowOrSilenceList:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "recommendedApps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(*(id *)(a1 + 40), "candidateApps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") + v9;
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForDenyList");

    if (v11 >= v12)
    {
      __atxlog_handle_notification_management();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_27_cold_1(v7);

      *a4 = 1;
    }
    else
    {
      objc_msgSend(v6, "scoreMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "score");
      v15 = v14;
      objc_msgSend(*(id *)(*(_QWORD *)v7 + 32), "interruptionManagerThresholdForRecommendedAppSuggestionForDenyList");
      v17 = v16;

      if (v15 >= v17)
      {
        objc_msgSend(*(id *)(a1 + 40), "addRecommendedApp:", v6);
      }
      else
      {
        objc_msgSend(v6, "scoreMetadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "score");
        v20 = v19;
        objc_msgSend(*(id *)(*(_QWORD *)v7 + 32), "interruptionManagerThresholdForCandidateAppSuggestionForDenyList");
        v22 = v21;

        if (v20 >= v22)
          objc_msgSend(*(id *)(a1 + 40), "addCandidateApp:", v6);
      }
    }
  }

}

- (void)recommendedAndCandidateAllowedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  ATXModeEntityScorerProtocol *modesModels;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = v6;
  if (a3 == 5)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke;
    v9[3] = &unk_1E4D57958;
    v9[4] = self;
    v10 = v6;
    -[ATXModeEntityScorerProtocol rankedContactsForMode:reply:](modesModels, "rankedContactsForMode:reply:", a3, v9);

  }
}

void __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2;
    v17 = &unk_1E4D57930;
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 32);
    v18 = v7;
    v19 = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v14);
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "recommendedContacts", v14, v15, v16, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      objc_msgSend(v7, "candidateContacts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 136315650;
      v21 = "-[ATXInterruptionManager recommendedAndCandidateAllowedContactsForMode:reply:]_block_invoke";
      v22 = 2048;
      v23 = v11;
      v24 = 2048;
      v25 = v13;
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "%s: Returning %ld recommended contacts and %ld candidate contacts", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  NSObject *v25;

  v6 = a2;
  objc_msgSend(v6, "cnContactId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "recommendedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(*(id *)(a1 + 32), "candidateContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") + v9;
    v12 = a1 + 40;
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForAllowList");

    if (v11 >= v13)
    {
      __atxlog_handle_notification_management();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2_cold_2(v12);

      *a4 = 1;
    }
    else
    {
      objc_msgSend(v6, "scoreMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "score");
      v16 = v15;
      objc_msgSend(*(id *)(*(_QWORD *)v12 + 32), "interruptionManagerThresholdForRecommendedContactSuggestionForAllowList");
      v18 = v17;

      if (v16 >= v18)
      {
        objc_msgSend(*(id *)(a1 + 32), "addRecommendedContact:", v6);
      }
      else
      {
        objc_msgSend(v6, "scoreMetadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "score");
        v21 = v20;
        objc_msgSend(*(id *)(*(_QWORD *)v12 + 32), "interruptionManagerThresholdForCandidateContactSuggestionForAllowList");
        v23 = v22;

        if (v21 >= v23)
          objc_msgSend(*(id *)(a1 + 32), "addCandidateContact:", v6);
      }
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2_cold_1();

  }
}

- (void)recommendedAndCandidateDeniedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  ATXModeEntityScorerProtocol *modesModels;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = v6;
  if (a3 == 4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke;
    v9[3] = &unk_1E4D57958;
    v9[4] = self;
    v10 = v6;
    -[ATXModeEntityScorerProtocol rankedContactsForDenyListForMode:options:reply:](modesModels, "rankedContactsForDenyListForMode:options:reply:", a3, 0, v9);

  }
}

void __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2;
    v17 = &unk_1E4D57930;
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 32);
    v18 = v7;
    v19 = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v14);
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "recommendedContacts", v14, v15, v16, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      objc_msgSend(v7, "candidateContacts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 136315650;
      v21 = "-[ATXInterruptionManager recommendedAndCandidateDeniedContactsForMode:reply:]_block_invoke";
      v22 = 2048;
      v23 = v11;
      v24 = 2048;
      v25 = v13;
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "%s: Returning %ld recommended contacts and %ld candidate contacts", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  NSObject *v25;

  v6 = a2;
  objc_msgSend(v6, "cnContactId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "recommendedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(*(id *)(a1 + 32), "candidateContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") + v9;
    v12 = a1 + 40;
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForDenyList");

    if (v11 >= v13)
    {
      __atxlog_handle_notification_management();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2_cold_2(v12);

      *a4 = 1;
    }
    else
    {
      objc_msgSend(v6, "scoreMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "score");
      v16 = v15;
      objc_msgSend(*(id *)(*(_QWORD *)v12 + 32), "interruptionManagerThresholdForRecommendedContactSuggestionForDenyList");
      v18 = v17;

      if (v16 >= v18)
      {
        objc_msgSend(*(id *)(a1 + 32), "addRecommendedContact:", v6);
      }
      else
      {
        objc_msgSend(v6, "scoreMetadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "score");
        v21 = v20;
        objc_msgSend(*(id *)(*(_QWORD *)v12 + 32), "interruptionManagerThresholdForCandidateContactSuggestionForDenyList");
        v23 = v22;

        if (v21 >= v23)
          objc_msgSend(*(id *)(a1 + 32), "addCandidateContact:", v6);
      }
    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2_cold_1();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementConstants, 0);
  objc_storeStrong((id *)&self->_modeConfigurationClient, 0);
  objc_storeStrong((id *)&self->_notificationSettingsReader, 0);
  objc_storeStrong((id *)&self->_modesModels, 0);
}

void __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_4(a1), "interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForAllowList");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v1, v2, "%s: Reached max count %ld for app suggestions, not suggesting any more.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

void __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "%s: error fetching ranked apps for deny list: %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_27_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_4(a1), "interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForDenyList");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v1, v2, "%s: Reached max count %ld for app suggestions, not suggesting any more.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

void __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1A49EF000, v0, v1, "%s: Contact does not have cnContactId %@. Skipping", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_4(a1), "interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForAllowList");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v1, v2, "%s: Reached max count %ld for contact suggestions, not suggesting any more.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

void __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1A49EF000, v0, v1, "%s: Contact does not have cnContactId %@. Skipping", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_4(a1), "interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForDenyList");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_7(&dword_1A49EF000, v1, v2, "%s: Reached max count %ld for contact suggestions, not suggesting any more.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

@end
