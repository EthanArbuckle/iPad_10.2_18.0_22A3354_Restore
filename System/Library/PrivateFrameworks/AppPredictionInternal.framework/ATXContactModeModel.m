@implementation ATXContactModeModel

- (ATXContactModeModel)initWithMode:(unint64_t)a3 contactStore:(id)a4
{
  id v7;
  ATXContactModeModel *v8;
  ATXContactModeModel *v9;
  uint64_t v10;
  MLModel *contactModeModel;
  uint64_t v12;
  NSSet *cnContactIdsOfFavoriteContacts;
  uint64_t v14;
  NSSet *vipContactEmailAddresses;
  uint64_t v16;
  NSSet *cnContactIdsOfEmergencyContacts;
  uint64_t v18;
  NSSet *cnContactIdsOfICloudFamilyMembers;
  uint64_t v20;
  ATXModeEntityEventProviderProtocol *modeEventProvider;
  uint64_t v22;
  ATXModeAffinityModelsConstants *modeAffinityModelsConstants;
  objc_super v25;

  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ATXContactModeModel;
  v8 = -[ATXContactModeModel init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    objc_storeStrong((id *)&v8->_contactStore, a4);
    -[ATXContactModeModel loadContactModeModel](v9, "loadContactModeModel");
    v10 = objc_claimAutoreleasedReturnValue();
    contactModeModel = v9->_contactModeModel;
    v9->_contactModeModel = (MLModel *)v10;

    objc_msgSend(MEMORY[0x1E0CF8D48], "cnContactIdsOfFavoriteContactsWithContactStore:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    cnContactIdsOfFavoriteContacts = v9->_cnContactIdsOfFavoriteContacts;
    v9->_cnContactIdsOfFavoriteContacts = (NSSet *)v12;

    objc_msgSend(MEMORY[0x1E0CF8D48], "vipContactEmailAddresses");
    v14 = objc_claimAutoreleasedReturnValue();
    vipContactEmailAddresses = v9->_vipContactEmailAddresses;
    v9->_vipContactEmailAddresses = (NSSet *)v14;

    objc_msgSend(MEMORY[0x1E0CF8D48], "cnContactIdsOfEmergencyContacts");
    v16 = objc_claimAutoreleasedReturnValue();
    cnContactIdsOfEmergencyContacts = v9->_cnContactIdsOfEmergencyContacts;
    v9->_cnContactIdsOfEmergencyContacts = (NSSet *)v16;

    objc_msgSend(MEMORY[0x1E0CF8D48], "cnContactIdsOfICloudFamilyMembers");
    v18 = objc_claimAutoreleasedReturnValue();
    cnContactIdsOfICloudFamilyMembers = v9->_cnContactIdsOfICloudFamilyMembers;
    v9->_cnContactIdsOfICloudFamilyMembers = (NSSet *)v18;

    +[ATXModeEntityModelTrainer eventProviderForMode:](ATXModeEntityModelTrainer, "eventProviderForMode:", v9->_mode);
    v20 = objc_claimAutoreleasedReturnValue();
    modeEventProvider = v9->_modeEventProvider;
    v9->_modeEventProvider = (ATXModeEntityEventProviderProtocol *)v20;

    v22 = objc_opt_new();
    modeAffinityModelsConstants = v9->_modeAffinityModelsConstants;
    v9->_modeAffinityModelsConstants = (ATXModeAffinityModelsConstants *)v22;

  }
  return v9;
}

- (id)scoredEntities
{
  void *v3;
  ATXInteractionEventProvider *v4;
  ATXModeEntityCorrelator *v5;
  ATXContactNotificationEngagementEventProvider *v6;
  ATXContactNotificationEngagementEventProvider *contactNotificationEngagementEventProvider;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  ATXStableContactRepresentationDatastore *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  ATXStableContactRepresentationDatastore *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  ATXContactModeModel *v25;
  ATXStableContactRepresentationDatastore *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = -[ATXInteractionEventProvider initWithContactStore:]([ATXInteractionEventProvider alloc], "initWithContactStore:", self->_contactStore);
  v5 = -[ATXModeEntityCorrelator initWithModeEventProvider:entityEventProvider:]([ATXModeEntityCorrelator alloc], "initWithModeEventProvider:entityEventProvider:", self->_modeEventProvider, v4);
  v6 = -[ATXContactNotificationEngagementEventProvider initWithModeEventProvider:]([ATXContactNotificationEngagementEventProvider alloc], "initWithModeEventProvider:", self->_modeEventProvider);
  contactNotificationEngagementEventProvider = self->_contactNotificationEngagementEventProvider;
  self->_contactNotificationEngagementEventProvider = v6;

  if (!-[ATXContactNotificationEngagementEventProvider successfullyCalculatedNotificationEvents](self->_contactNotificationEngagementEventProvider, "successfullyCalculatedNotificationEvents"))
  {
    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXContactModeModel scoredEntities].cold.1(v8);

  }
  -[ATXModeEntityCorrelator entityFeaturesForModeEntityScoring](v5, "entityFeaturesForModeEntityScoring");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_management();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    ATXModeToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v29 = "-[ATXContactModeModel scoredEntities]";
    v30 = 2112;
    v31 = v11;
    v32 = 2048;
    v33 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%s: mode: '%@' returned %ld contacts from featurizer", buf, 0x20u);

  }
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_253);
  -[ATXContactModeModel meContact](self, "meContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ATXStableContactRepresentationDatastore initWithContactStore:]([ATXStableContactRepresentationDatastore alloc], "initWithContactStore:", self->_contactStore);
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStableContactRepresentationDatastore stableContactRepresentationForCnContactId:rawIdentifier:](v13, "stableContactRepresentationForCnContactId:rawIdentifier:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stableContactIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __37__ATXContactModeModel_scoredEntities__block_invoke_19;
  v23[3] = &unk_1E82DB268;
  v24 = v16;
  v25 = self;
  v26 = v13;
  v17 = v3;
  v27 = v17;
  v18 = v13;
  v19 = v16;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v23);
  v20 = v27;
  v21 = v17;

  return v21;
}

void __37__ATXContactModeModel_scoredEntities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  __atxlog_handle_notification_management();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __37__ATXContactModeModel_scoredEntities__block_invoke_cold_1((uint64_t)v4, v5, v6);

}

void __37__ATXContactModeModel_scoredEntities__block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v26, "entitySpecificFeatures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_opt_new();
    v10 = v9;

    objc_msgSend(v26, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsVIPContact:", objc_msgSend(v11, "isVIPContactGivenVIPs:contactStore:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80)));

    v12 = *(void **)(a1 + 48);
    objc_msgSend(v26, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stableContactRepresentationForStableContactIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cnContactId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v10, "setIsICloudFamilyMember:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "containsObject:", v16));
      objc_msgSend(v10, "setIsEmergencyContact:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "containsObject:", v16));
      objc_msgSend(v10, "setIsFavoriteContact:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", v16));
      objc_msgSend(*(id *)(a1 + 40), "addNotificationsSignalsForIdentifier:toContactSpecificFeatures:", v16, v10);
    }
    objc_msgSend(v26, "setEntitySpecificFeatures:", v10);
    objc_msgSend(*(id *)(a1 + 40), "scoreFromContactFeatures:", v26);
    v18 = v17;
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setScore:", v18);
    objc_msgSend(v26, "jsonRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFeatureVector:", v20);

    objc_msgSend(v26, "entity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setScoreMetadata:", v19);

    v22 = *(void **)(a1 + 56);
    objc_msgSend(v26, "entity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "entity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, v25);

  }
}

- (void)addNotificationsSignalsForIdentifier:(id)a3 toContactSpecificFeatures:(id)a4
{
  void *v6;
  ATXContactNotificationEngagementEventProvider *contactNotificationEngagementEventProvider;
  id v8;
  id v9;
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
  double v29;
  double v30;
  id v31;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  contactNotificationEngagementEventProvider = self->_contactNotificationEngagementEventProvider;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsClearedForContactId:](contactNotificationEngagementEventProvider, "globalCountOfNotificationsClearedForContactId:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalCountOfNotificationsClearedForEntity:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsClearedForContactId:](self->_contactNotificationEngagementEventProvider, "modeCountOfNotificationsClearedForContactId:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeCountOfNotificationsClearedForEntity:", v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXContactNotificationEngagementEventProvider localNotificationsClearedRateForContactId:](self->_contactNotificationEngagementEventProvider, "localNotificationsClearedRateForContactId:", v9);
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalNotificationsClearedRateForEntity:", v13);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXContactNotificationEngagementEventProvider globalNotificationsClearedRateForContactId:](self->_contactNotificationEngagementEventProvider, "globalNotificationsClearedRateForContactId:", v9);
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalNotificationsClearedRateForEntity:", v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXContactNotificationEngagementEventProvider ratioOfLocalToGlobalNotificationsClearedRateForContactId:](self->_contactNotificationEngagementEventProvider, "ratioOfLocalToGlobalNotificationsClearedRateForContactId:", v9);
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRatioOfLocalToGlobalNotificationsClearedRateForEntity:", v17);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXContactNotificationEngagementEventProvider classConditionalOfNotificationsClearedForContactId:](self->_contactNotificationEngagementEventProvider, "classConditionalOfNotificationsClearedForContactId:", v9);
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClassConditionalOfNotificationsClearedForEntity:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsReceivedForContactId:](self->_contactNotificationEngagementEventProvider, "globalCountOfNotificationsReceivedForContactId:", v9));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalCountOfNotificationsReceivedForEntity:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsReceivedForContactId:](self->_contactNotificationEngagementEventProvider, "modeCountOfNotificationsReceivedForContactId:", v9));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeCountOfNotificationsReceivedForEntity:", v21);

  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXContactNotificationEngagementEventProvider localPopularityOfNotificationsReceivedForContactId:](self->_contactNotificationEngagementEventProvider, "localPopularityOfNotificationsReceivedForContactId:", v9);
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalPopularityOfNotificationsReceivedForEntity:", v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXContactNotificationEngagementEventProvider globalPopularityOfNotificationsReceivedForContactId:](self->_contactNotificationEngagementEventProvider, "globalPopularityOfNotificationsReceivedForContactId:", v9);
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalPopularityOfNotificationsReceivedForEntity:", v25);

  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXContactNotificationEngagementEventProvider ratioOfLocalToGlobalPopularityOfNotificationsReceivedForContactId:](self->_contactNotificationEngagementEventProvider, "ratioOfLocalToGlobalPopularityOfNotificationsReceivedForContactId:", v9);
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:", v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXContactNotificationEngagementEventProvider classConditionalOfNotificationsReceivedForContactId:](self->_contactNotificationEngagementEventProvider, "classConditionalOfNotificationsReceivedForContactId:", v9);
  v30 = v29;

  objc_msgSend(v28, "numberWithDouble:", v30);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClassConditionalOfNotificationsReceivedForEntity:", v31);

}

- (id)meContact
{
  CNContactStore *contactStore;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  contactStore = self->_contactStore;
  -[ATXContactModeModel contactKeysToFetch](self, "contactKeysToFetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](contactStore, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXContactModeModel meContact].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (id)contactKeysToFetch
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C967C0];
  v4[0] = *MEMORY[0x1E0C966E8];
  v4[1] = v2;
  v4[2] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)featuresToModel:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = a3;
  objc_msgSend(v4, "entitySpecificFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXContactModeDenyListModel featuresToModel:].cold.1(v7);

  }
  objc_msgSend(v4, "entitySpecificFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "classConditionalProbability");
  objc_msgSend(v9, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "posteriorProbability");
  objc_msgSend(v10, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "globalPopularity");
  objc_msgSend(v11, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "modePopularity");
  objc_msgSend(v12, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "entityOccurredGloballyOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeaturesForContacts](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeaturesForContacts")));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "entityOccurredInModeOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeaturesForContacts](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeaturesForContacts")));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isFavoriteContact"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isVIPContact"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isEmergencyContact"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isICloudFamilyMember"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "ratioModeAndGlobalPopularity");
  v15 = v14;

  objc_msgSend(v13, "numberWithDouble:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalCountOfNotificationsReceivedForEntity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeCountOfNotificationsReceivedForEntity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localPopularityOfNotificationsReceivedForEntity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalPopularityOfNotificationsReceivedForEntity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "classConditionalOfNotificationsReceivedForEntity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalCountOfNotificationsClearedForEntity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeCountOfNotificationsClearedForEntity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localNotificationsClearedRateForEntity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalNotificationsClearedRateForEntity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratioOfLocalToGlobalNotificationsClearedRateForEntity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "classConditionalOfNotificationsClearedForEntity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setObject:forKey:", v39, CFSTR("classConditionalProbability"));
  objc_msgSend(v21, "setObject:forKey:", v40, CFSTR("posteriorProbability"));
  objc_msgSend(v21, "setObject:forKey:", v37, CFSTR("globalPopularity"));
  objc_msgSend(v21, "setObject:forKey:", v38, CFSTR("modePopularity"));
  objc_msgSend(v21, "setObject:forKey:", v28, CFSTR("contactEngagedGloballyOverLastNDays"));
  objc_msgSend(v21, "setObject:forKey:", v27, CFSTR("contactEngagedInModeOverLastNDays"));
  objc_msgSend(v21, "setObject:forKey:", v36, CFSTR("contactIsFavorite"));
  objc_msgSend(v21, "setObject:forKey:", v35, CFSTR("contactIsVIP"));
  objc_msgSend(v21, "setObject:forKey:", v34, CFSTR("contactIsEmergency"));
  objc_msgSend(v21, "setObject:forKey:", v33, CFSTR("contactIsICloudFamilyMember"));
  objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("ratioOfModePopularityToGlobalPopularityOfEntity"));
  objc_msgSend(v21, "setObject:forKey:", v32, CFSTR("globalCountOfNotificationsReceivedForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v31, CFSTR("modeCountOfNotificationsReceivedForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v30, CFSTR("localPopularityOfNotificationsReceivedForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v29, CFSTR("globalPopularityOfNotificationsReceivedForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v16, CFSTR("ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v17, CFSTR("classConditionalOfNotificationsReceivedForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v18, CFSTR("globalCountOfNotificationsClearedForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v19, CFSTR("modeCountOfNotificationsClearedForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v24, CFSTR("localNotificationsClearedRateForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("globalNotificationsClearedRateForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v26, CFSTR("ratioOfLocalToGlobalNotificationsClearedRateForEntity"));
  objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("classConditionalOfNotificationsClearedForEntity"));

  return v21;
}

- (id)modelName
{
  return CFSTR("ATXContactModeAllowListModel");
}

- (id)loadContactModeModel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[ATXContactModeModel modelName](self, "modelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadCoreMLModelFromTrialWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[ATXContactModeModel modelName](self, "modelName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreMLUtilities loadCoreMLModelWithName:](ATXCoreMLUtilities, "loadCoreMLModelWithName:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (double)scoreFromContactFeatures:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  MLModel *contactModeModel;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "uniqueOccurrencesInMode") > 2)
  {
    if (!self->_contactModeModel)
    {
      v6 = 0.0;
      goto LABEL_16;
    }
    v10 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    -[ATXContactModeModel featuresToModel:](self, "featuresToModel:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v7 = (void *)objc_msgSend(v10, "initWithDictionary:error:", v11, &v32);
    v12 = v32;

    if (v12)
    {
      __atxlog_handle_modes();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXContactModeModel scoreFromContactFeatures:].cold.2((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

    }
    contactModeModel = self->_contactModeModel;
    v31 = v12;
    -[MLModel predictionFromFeatures:error:](contactModeModel, "predictionFromFeatures:error:", v7, &v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v31;

    if (v5)
    {
      __atxlog_handle_modes();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ATXContactModeModel scoreFromContactFeatures:].cold.1((uint64_t)v5, v21, v22, v23, v24, v25, v26, v27);

    }
    objc_msgSend(v9, "featureValueForName:", CFSTR("classProbability"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreMLUtilities scoreForModelOutputValue:outputIndexedSubscript:](ATXCoreMLUtilities, "scoreForModelOutputValue:outputIndexedSubscript:", v28, 1);
    v6 = v29;

    goto LABEL_14;
  }
  __atxlog_handle_notification_management();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "entityDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "uniqueOccurrencesInMode");
    ATXModeToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315907;
    v34 = "-[ATXContactModeModel scoreFromContactFeatures:]";
    v35 = 2117;
    v36 = v7;
    v37 = 2048;
    v38 = v8;
    v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: contact '%{sensitive}@' only had %ld < 3 unique occurrences in mode: '%@' so setting score to zero", buf, 0x2Au);
LABEL_14:

  }
LABEL_16:

  return v6;
}

- (id)purgeDeletedContacts:(id)a3
{
  id v4;
  void *v5;
  ATXStableContactRepresentationDatastore *v6;
  CNContactStore *contactStore;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  ATXStableContactRepresentationDatastore *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  ATXStableContactRepresentationDatastore *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXStableContactRepresentationDatastore initWithContactStore:]([ATXStableContactRepresentationDatastore alloc], "initWithContactStore:", self->_contactStore);
  contactStore = self->_contactStore;
  v8 = objc_alloc(MEMORY[0x1E0C97210]);
  v23[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKeysToFetch:", v9);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__ATXContactModeModel_purgeDeletedContacts___block_invoke;
  v19[3] = &unk_1E82DE848;
  v20 = v6;
  v11 = v4;
  v21 = v11;
  v12 = v5;
  v22 = v12;
  v13 = v6;
  -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, 0, v19);

  v14 = objc_msgSend(v12, "count");
  if (v14 != objc_msgSend(v11, "count"))
  {
    __atxlog_handle_notification_management();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ATXContactModeModel purgeDeletedContacts:].cold.1(v11, v12, v15);

  }
  v16 = v22;
  v17 = v12;

  return v17;
}

void __44__ATXContactModeModel_purgeDeletedContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stableContactRepresentationForCnContactId:rawIdentifier:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stableContactIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
  objc_storeStrong((id *)&self->_contactNotificationEngagementEventProvider, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfICloudFamilyMembers, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfEmergencyContacts, 0);
  objc_storeStrong((id *)&self->_vipContactEmailAddresses, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfFavoriteContacts, 0);
  objc_storeStrong((id *)&self->_contactModeModel, 0);
}

- (void)scoredEntities
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXContactModeModel: There was an error in calculating notification events from ATXContactNotificationEngagementEventProvider", v1, 2u);
}

void __37__ATXContactModeModel_scoredEntities__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E82FDC98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315651;
  v8 = "-[ATXContactModeModel scoredEntities]_block_invoke";
  v9 = 2117;
  v10 = a1;
  v11 = 2117;
  v12 = v6;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "  %s: contactId: '%{sensitive}@' features: '%{sensitive}@'", (uint8_t *)&v7, 0x20u);

}

- (void)meContact
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error when fetching me contact: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)scoreFromContactFeatures:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXContactModeModel - Error during inference on the CoreMLModel: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)scoreFromContactFeatures:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXContactModeModel - Error initializing MLDictionaryFeatureProvider for inference on the CoreMLModel: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)purgeDeletedContacts:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = 136315394;
  v7 = "-[ATXContactModeModel purgeDeletedContacts:]";
  v8 = 2048;
  v9 = v5 - objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "%s: Filtered out %ld deleted contacts", (uint8_t *)&v6, 0x16u);
}

@end
