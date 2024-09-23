@implementation ATXDynamicBreakthroughFeaturesCorrelator

- (ATXDynamicBreakthroughFeaturesCorrelator)init
{
  ATXDynamicBreakthroughFeaturesCorrelator *v2;
  uint64_t v3;
  ATXNotificationResolutionAccumulator *resolutionAccumulator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXDynamicBreakthroughFeaturesCorrelator;
  v2 = -[ATXDynamicBreakthroughFeaturesCorrelator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    resolutionAccumulator = v2->_resolutionAccumulator;
    v2->_resolutionAccumulator = (ATXNotificationResolutionAccumulator *)v3;

  }
  return v2;
}

- (unint64_t)_contactRelationshipsFromNotification:(id)a3 contactStore:(id)a4 withRelationships:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "contactIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "cnContactIdsOfEmergencyContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v10);

    v13 = v12;
    objc_msgSend(v8, "cnContactIdsOfFavoriteContacts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v10);

    if (v15)
      v13 |= 2uLL;
    objc_msgSend(v8, "cnContactIdsOfICloudFamilyMembers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v10);

    if (v17)
      v18 = v13 | 4;
    else
      v18 = v13;
    v41[0] = *MEMORY[0x1E0C966A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", v10, v19, &v39);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v39;

    if (v21)
    {
      __atxlog_handle_notification_categorization();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ATXDynamicBreakthroughFeaturesCorrelator _contactRelationshipsFromNotification:contactStore:withRelationships:].cold.1((uint64_t)v21, v22, v23);
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v20, "emailAddresses");
      v22 = objc_claimAutoreleasedReturnValue();
      v24 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v24)
      {
        v25 = v24;
        v33 = v20;
        v34 = v7;
        v26 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v8, "vipContactEmailAddresses");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "value");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v29, "containsObject:", v30);

            if (v31)
              v18 |= 8uLL;
          }
          v25 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v25);
        v20 = v33;
        v7 = v34;
        v21 = 0;
      }
    }

  }
  else
  {
    v18 = 16;
  }

  return v18;
}

- (int)currentLocationSemanticForGivenDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = 0;
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Semantic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v3, 0, &unk_1E83CBBF0, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke_12;
  v14[3] = &unk_1E82DC1A0;
  v14[4] = &v15;
  v8 = (id)objc_msgSend(v7, "sinkWithCompletion:shouldContinue:", &__block_literal_global_20, v14);
  LODWORD(v4) = objc_msgSend((id)v16[5], "userSpecificPlaceType");
  LODWORD(v5) = objc_msgSend((id)v16[5], "userSpecificPlaceType");
  v9 = objc_msgSend((id)v16[5], "userSpecificPlaceType");
  v10 = objc_msgSend((id)v16[5], "userSpecificPlaceType");
  v11 = (_DWORD)v4 == 1;
  if ((_DWORD)v5 == 2)
    v11 = 2;
  if (v9 == 4)
    v11 = 3;
  if (v10 == 3)
    v12 = 4;
  else
    v12 = v11;

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_notification_categorization();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke_cold_1(v2, v4);

  }
}

uint64_t __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "starting");

  if (v5)
  {
    objc_msgSend(v3, "eventBody");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return 0;
}

- (double)appCategoryScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v5 = a3;
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v5, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appEntityForBundleId:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "affinityVector_v2");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scoreForMode:", a4);
      v13 = v12;

    }
    else
    {
      v13 = 0.0;
    }

  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (double)appModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rankedAppsForMode:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__ATXDynamicBreakthroughFeaturesCorrelator_appModeAffinityScoreForNotification_inCurrentMode___block_invoke;
  v11[3] = &unk_1E82DC1C8;
  v8 = v5;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __94__ATXDynamicBreakthroughFeaturesCorrelator_appModeAffinityScoreForNotification_inCurrentMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v11, "scoreMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "score");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;

    *a4 = 1;
  }

}

- (double)contactModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(v5, "contactIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rankedContactsForMode:options:", a4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__ATXDynamicBreakthroughFeaturesCorrelator_contactModeAffinityScoreForNotification_inCurrentMode___block_invoke;
    v12[3] = &unk_1E82DC1F0;
    v13 = v5;
    v14 = &v15;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __98__ATXDynamicBreakthroughFeaturesCorrelator_contactModeAffinityScoreForNotification_inCurrentMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v12, "scoreMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "score");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;

    *a4 = 1;
  }

}

- (double)notificationModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rankedNotificationsForMode:options:", a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__ATXDynamicBreakthroughFeaturesCorrelator_notificationModeAffinityScoreForNotification_inCurrentMode___block_invoke;
  v11[3] = &unk_1E82DC218;
  v8 = v5;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __103__ATXDynamicBreakthroughFeaturesCorrelator_notificationModeAffinityScoreForNotification_inCurrentMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "appEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "contactIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
      goto LABEL_5;
    objc_msgSend(v20, "contactEntity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v20, "contactEntity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "contactIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "isEqualToString:", v16);

      if (v17)
      {
LABEL_5:
        objc_msgSend(v20, "scoreMetadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "score");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;

        *a4 = 1;
      }
    }
  }

}

- (void)refreshMegadomeRelationshipsIfNeeded:(id)a3
{
  uint64_t v4;
  NSString *megadomeEntityIDFromLastNotification;
  BOOL v6;
  void *v7;
  NSArray *v8;
  NSArray *megadomeRelationshipsFromLastNotification;
  id obj;

  +[ATXNotificationCategorizationUtils megadomeEntityIDFromNotification:](ATXNotificationCategorizationUtils, "megadomeEntityIDFromNotification:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  megadomeEntityIDFromLastNotification = self->_megadomeEntityIDFromLastNotification;
  obj = (id)v4;
  if (!megadomeEntityIDFromLastNotification
    || (v6 = -[NSString isEqualToString:](megadomeEntityIDFromLastNotification, "isEqualToString:"), v7 = obj, !v6))
  {
    objc_storeStrong((id *)&self->_megadomeEntityIDFromLastNotification, obj);
    +[ATXNotificationCategorizationUtils megadomePersonRelationshipFromEntityID:](ATXNotificationCategorizationUtils, "megadomePersonRelationshipFromEntityID:", self->_megadomeEntityIDFromLastNotification);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    megadomeRelationshipsFromLastNotification = self->_megadomeRelationshipsFromLastNotification;
    self->_megadomeRelationshipsFromLastNotification = v8;

    v7 = obj;
  }

}

- (id)collectDynamicBreakthroughFeaturesForNotification:(id)a3 contactStore:(id)a4 withContactRelationships:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  int v43;
  NSArray *megadomeRelationshipsFromLastNotification;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  unint64_t v49;
  unsigned int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint8_t buf[16];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  __atxlog_handle_notification_categorization();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[ATXDynamicBreakthroughFeaturesCorrelator collectDynamicBreakthroughFeaturesForNotification:co"
                         "ntactStore:withContactRelationships:]";
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  v12 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v8, "timestamp");
  objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  v13 = objc_claimAutoreleasedReturnValue();
  +[ATXUnifiedComputedAndInferredModeStream currentUnifiedModeEventAtGivenTime:](ATXUnifiedComputedAndInferredModeStream, "currentUnifiedModeEventAtGivenTime:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "mode");

  -[ATXDynamicBreakthroughFeaturesCorrelator refreshMegadomeRelationshipsIfNeeded:](self, "refreshMegadomeRelationshipsIfNeeded:", v8);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "components:fromDate:", 512, v13);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v52, "weekday");
  v53 = v16;
  *(_QWORD *)buf = 0;
  objc_msgSend(v16, "getHour:minute:second:nanosecond:fromDate:", buf, 0, 0, 0, v13);
  if (*(_QWORD *)buf > 0x17uLL)
  {
    __atxlog_handle_notification_categorization();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[ATXDynamicBreakthroughFeaturesCorrelator collectDynamicBreakthroughFeaturesForNotification:contactStore:withContactRelationships:].cold.1(v19);

    v50 = 0;
  }
  else
  {
    if (*(_QWORD *)buf < 0x11uLL)
      v17 = 2;
    else
      v17 = 3;
    if (*(_QWORD *)buf >= 0xCuLL)
      v18 = v17;
    else
      v18 = 1;
    v50 = v18;
  }
  v20 = objc_msgSend(v8, "bodyLength");
  v21 = 10 * (v20 / 10);
  if (v20 % 10 >= 5)
    v21 += 10;
  if (v21 <= 0xA)
    v21 = 10;
  v49 = v21;
  -[ATXNotificationResolutionAccumulator computeFeaturesForNotification:mode:](self->_resolutionAccumulator, "computeFeaturesForNotification:mode:", v8, v15);
  v48 = objc_alloc(MEMORY[0x1E0CF8F80]);
  objc_msgSend(v8, "bundleID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v8, "urgency");
  v45 = -[ATXDynamicBreakthroughFeaturesCorrelator _contactRelationshipsFromNotification:contactStore:withRelationships:](self, "_contactRelationshipsFromNotification:contactStore:withRelationships:", v8, v10, v9);

  megadomeRelationshipsFromLastNotification = self->_megadomeRelationshipsFromLastNotification;
  v43 = -[ATXDynamicBreakthroughFeaturesCorrelator currentLocationSemanticForGivenDate:](self, "currentLocationSemanticForGivenDate:", v13);
  -[ATXDynamicBreakthroughFeaturesCorrelator appModeAffinityScoreForNotification:inCurrentMode:](self, "appModeAffinityScoreForNotification:inCurrentMode:", v8, v15);
  v23 = v22;
  -[ATXDynamicBreakthroughFeaturesCorrelator contactModeAffinityScoreForNotification:inCurrentMode:](self, "contactModeAffinityScoreForNotification:inCurrentMode:", v8, v15);
  v25 = v24;
  -[ATXDynamicBreakthroughFeaturesCorrelator notificationModeAffinityScoreForNotification:inCurrentMode:](self, "notificationModeAffinityScoreForNotification:inCurrentMode:", v8, v15);
  v27 = v26;
  -[ATXDynamicBreakthroughFeaturesCorrelator appCategoryScoreForNotification:inCurrentMode:](self, "appCategoryScoreForNotification:inCurrentMode:", v8, v15);
  v29 = v28;
  v40 = -[ATXNotificationResolutionAccumulator timeToLaunchApp](self->_resolutionAccumulator, "timeToLaunchApp");
  -[ATXNotificationResolutionAccumulator historicalResolutionsForNotification](self->_resolutionAccumulator, "historicalResolutionsForNotification");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "historicalVolumeByCountAndPercentage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationResolutionAccumulator historicalResolutionsForNotification](self->_resolutionAccumulator, "historicalResolutionsForNotification");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "modeConditionedHistoricalVolumeByCountAndPercentage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationResolutionAccumulator historicalResolutionsForNotification](self->_resolutionAccumulator, "historicalResolutionsForNotification");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "historicalResolutionByPercentage");
  v41 = (void *)v13;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationResolutionAccumulator historicalResolutionsForNotification](self->_resolutionAccumulator, "historicalResolutionsForNotification");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "modeConditionedHistoricalResolutionByPercentage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = v43;
  v37 = (void *)objc_msgSend(v48, "initWithBundleID:notificationDeliveryUrgency:contactRelationships:relationshipsFromMegadome:dayOfWeek:timeOfDay:locationSemantic:appModeAffinityScore:contactModeAffinityScore:notificationModeAffinityScore:appCategoryScoreInMode:urgencyScore:importanceScore:bucketizedLengthOfNotificationBody:currentMode:timeToLaunchApp:historicalVolumeByCountAndPercentage:modeConditionedHistoricalVolumeByCountAndPercentage:historicalResolutionByPercentage:modeConditionedHistoricalResolutionByPercentage:", v47, v46, v45, megadomeRelationshipsFromLastNotification, v51, v50, v23, v25, v27, v29, 0.0, 0.0, v39,
                  v49,
                  v15,
                  v40,
                  v30,
                  v32,
                  v34,
                  v36);

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionAccumulator, 0);
  objc_storeStrong((id *)&self->_megadomeRelationshipsFromLastNotification, 0);
  objc_storeStrong((id *)&self->_megadomeEntityIDFromLastNotification, 0);
}

- (void)_contactRelationshipsFromNotification:(uint64_t)a1 contactStore:(NSObject *)a2 withRelationships:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "ATXDynamicBreakthroughFeaturesCorrelator: Error fetching unified contact email addresses: %@", (uint8_t *)&v3);
}

void __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "ATXDynamicBreakthroughFeaturesCorrelator: Error fetching last location event: %@", (uint8_t *)&v5);

}

- (void)collectDynamicBreakthroughFeaturesForNotification:(os_log_t)log contactStore:withContactRelationships:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXDynamicBreakthroughFeaturesCorrelator: NSDateFormatter returned out of bounds hour for notification date", v1, 2u);
}

@end
