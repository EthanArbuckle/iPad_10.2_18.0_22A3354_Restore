@implementation ATXUrgencyTuningManager

- (ATXUrgencyTuningManager)init
{
  void *v3;
  ATXUrgencyTuningManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXUrgencyTuningManager initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (ATXUrgencyTuningManager)initWithDataStore:(id)a3
{
  id v5;
  ATXUrgencyTuningManager *v6;
  ATXUrgencyTuningManager *v7;
  uint64_t v8;
  ATXNotificationManagementMAConstants *notificationManagementMAConstants;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXUrgencyTuningManager;
  v6 = -[ATXUrgencyTuningManager init](&v11, sel_init);
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

- (id)activeSuggestions
{
  ATXNotificationAndSuggestionDatastore *dataStore;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  dataStore = self->_dataStore;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[ATXNotificationAndSuggestionDatastore engagementStatusOfActiveAndProminentNotificationsWithUrgency:sinceTimestamp:](dataStore, "engagementStatusOfActiveAndProminentNotificationsWithUrgency:sinceTimestamp:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__ATXUrgencyTuningManager_activeSuggestions__block_invoke;
  v11[3] = &unk_1E82E6BB0;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

void __44__ATXUrgencyTuningManager_activeSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v6, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "urgencyTuningSuggestion:uuid:engagementStatus:", v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    v10 = v11;
  }

}

- (id)urgencyTuningSuggestion:(id)a3 uuid:(id)a4 engagementStatus:(id)a5
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
    || v14 <= -[ATXNotificationManagementMAConstants urgencyTuningManagerMaxNumNonEngagementsAllowedForUrgentNotifications](self->_notificationManagementMAConstants, "urgencyTuningManagerMaxNumNonEngagementsAllowedForUrgentNotifications"))
  {
    v18 = 0;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CF8F90]);
    v16 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initUrgencyTuningSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", v16, v8, v17, v9);

  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementMAConstants, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
