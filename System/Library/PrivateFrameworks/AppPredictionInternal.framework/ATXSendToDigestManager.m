@implementation ATXSendToDigestManager

- (ATXSendToDigestManager)init
{
  void *v3;
  ATXSendToDigestManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXSendToDigestManager initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (ATXSendToDigestManager)initWithDataStore:(id)a3
{
  id v5;
  ATXSendToDigestManager *v6;
  ATXSendToDigestManager *v7;
  uint64_t v8;
  ATXNotificationSettingsReaderProtocol *notificationSettingsReader;
  uint64_t v10;
  ATXNotificationManagementMAConstants *notificationManagementMAConstants;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSendToDigestManager;
  v6 = -[ATXSendToDigestManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    v8 = objc_opt_new();
    notificationSettingsReader = v7->_notificationSettingsReader;
    v7->_notificationSettingsReader = (ATXNotificationSettingsReaderProtocol *)v8;

    objc_msgSend(MEMORY[0x1E0CF8FB0], "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    notificationManagementMAConstants = v7->_notificationManagementMAConstants;
    v7->_notificationManagementMAConstants = (ATXNotificationManagementMAConstants *)v10;

  }
  return v7;
}

- (BOOL)bundleIdEligibleForSendToDigestSuggestions:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  if ((-[ATXNotificationSettingsReaderProtocol doesAppSendNotificationsToDigest:](self->_notificationSettingsReader, "doesAppSendNotificationsToDigest:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &unk_1E83CDED0;
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E83D0700);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v10, "containsObject:", v9);

  }
  return v5;
}

- (id)currentSuggestionsGivenCandiateNotifications:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ATXNotificationAndSuggestionDatastore *dataStore;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  ATXSendToDigestManager *v17;

  v4 = a3;
  -[ATXNotificationSettingsReaderProtocol notificationDigestDeliveryTimes](self->_notificationSettingsReader, "notificationDigestDeliveryTimes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    dataStore = self->_dataStore;
    objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_222);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[ATXNotificationAndSuggestionDatastore getSmartPauseFeaturesForBundleIds:sinceTimestamp:](dataStore, "getSmartPauseFeaturesForBundleIds:sinceTimestamp:", v8, v9 + -2592000.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[ATXSmartPauseDatabaseQueryResult groupByBundleId:](ATXSmartPauseDatabaseQueryResult, "groupByBundleId:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__ATXSendToDigestManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2;
    v15[3] = &unk_1E82E9DA8;
    v16 = v11;
    v17 = self;
    v12 = v11;
    objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

uint64_t __71__ATXSendToDigestManager_currentSuggestionsGivenCandiateNotifications___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleID");
}

id __71__ATXSendToDigestManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_proposeSendToDigestForNotification:bundleData:", v3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)activeSuggestions
{
  void *v3;
  void *v4;

  -[ATXNotificationAndSuggestionDatastore getTopOfProminentStackNotificationsWithLimit:](self->_dataStore, "getTopOfProminentStackNotificationsWithLimit:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSendToDigestManager currentSuggestionsGivenCandiateNotifications:](self, "currentSuggestionsGivenCandiateNotifications:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_proposeSendToDigestForNotification:(id)a3 bundleData:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "countPositiveEngagements");
  v9 = objc_msgSend(v7, "countNotifications");

  objc_msgSend(v6, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isMessage") & 1) != 0
    || objc_msgSend(v6, "urgency") == 1
    || (-[ATXNotificationManagementMAConstants sendToDigestEngagementRateThreshold](self->_notificationManagementMAConstants, "sendToDigestEngagementRateThreshold"), v12 < (double)v8 / (double)v9)|| v9 - v8 <= -[ATXNotificationManagementMAConstants sendToDigestThresholdForNumNonEngagements](self->_notificationManagementMAConstants, "sendToDigestThresholdForNumNonEngagements")|| !-[ATXSendToDigestManager bundleIdEligibleForSendToDigestSuggestions:](self, "bundleIdEligibleForSendToDigestSuggestions:", v10))
  {
    v16 = 0;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CF8F90]);
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initSendToDigestSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", v14, v10, v15, v11);

  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementMAConstants, 0);
  objc_storeStrong((id *)&self->_notificationSettingsReader, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
