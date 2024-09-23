@implementation ATXSendMessagesToDigestManager

- (ATXSendMessagesToDigestManager)init
{
  void *v3;
  ATXSendMessagesToDigestManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXSendMessagesToDigestManager initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (ATXSendMessagesToDigestManager)initWithDataStore:(id)a3
{
  id v5;
  ATXSendMessagesToDigestManager *v6;
  ATXSendMessagesToDigestManager *v7;
  uint64_t v8;
  ATXNotificationSettingsReaderProtocol *notificationSettingsReader;
  uint64_t v10;
  ATXNotificationManagementMAConstants *notificationManagementMAConstants;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSendMessagesToDigestManager;
  v6 = -[ATXSendMessagesToDigestManager init](&v13, sel_init);
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

- (BOOL)bundleIdIsEligibleForSendMessagesToDigestSuggestions:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[ATXNotificationSettingsReaderProtocol doesAppSendNotificationsToDigest:](self->_notificationSettingsReader, "doesAppSendNotificationsToDigest:", v4))v5 = -[ATXNotificationSettingsReaderProtocol doesAppAllowMessageBreakthrough:](self->_notificationSettingsReader, "doesAppAllowMessageBreakthrough:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)activeSuggestions
{
  ATXNotificationAndSuggestionDatastore *dataStore;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  dataStore = self->_dataStore;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[ATXNotificationAndSuggestionDatastore engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:](dataStore, "engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  v14 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ATXSendMessagesToDigestManager_activeSuggestions__block_invoke;
  v8[3] = &unk_1E82DD1A0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__ATXSendMessagesToDigestManager_activeSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "bundleIdIsEligibleForSendMessagesToDigestSuggestions:", v10))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "first");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "second");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessagesToDigestSuggestion:uuid:engagementStatus:", v10, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v9);

  }
}

- (id)sendMessagesToDigestSuggestion:(id)a3 uuid:(id)a4 engagementStatus:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "first");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v10, "second");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "unsignedIntegerValue");
  if (v12
    || v14 <= -[ATXNotificationManagementMAConstants sendMessagesToDigestManagerMaxNumNonEngagementsAllowedForMessageNotifications](self->_notificationManagementMAConstants, "sendMessagesToDigestManagerMaxNumNonEngagementsAllowedForMessageNotifications"))
  {
    v18 = 0;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CF8F90]);
    v16 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initSendToMessagesDigestSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", v16, v8, v17, v9);

  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementMAConstants, 0);
  objc_storeStrong((id *)&self->_notificationSettingsReader, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
