@implementation ATXAnchorModelTrainingDatasetBuilder

- (ATXAnchorModelTrainingDatasetBuilder)init
{
  void *v3;
  void *v4;
  ATXAnchorModelTrainingDatasetBuilder *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXAnchorModelTrainingDatasetBuilder initWithXPCActivity:dataStoreWrapper:harvester:](self, "initWithXPCActivity:dataStoreWrapper:harvester:", 0, v3, v4);

  return v5;
}

- (ATXAnchorModelTrainingDatasetBuilder)initWithActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXAnchorModelTrainingDatasetBuilder *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXAnchorModelTrainingDatasetBuilder initWithXPCActivity:dataStoreWrapper:harvester:](self, "initWithXPCActivity:dataStoreWrapper:harvester:", v4, v5, v6);

  return v7;
}

- (ATXAnchorModelTrainingDatasetBuilder)initWithXPCActivity:(id)a3 dataStoreWrapper:(id)a4 harvester:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXAnchorModelTrainingDatasetBuilder *v12;
  ATXAnchorModelTrainingDatasetBuilder *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXAnchorModelTrainingDatasetBuilder;
  v12 = -[ATXAnchorModelTrainingDatasetBuilder init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_xpcActivity, a3);
    objc_storeStrong((id *)&v13->_dataStoreWrapper, a4);
    objc_storeStrong((id *)&v13->_harvester, a5);
  }

  return v13;
}

- (id)anchorsToIncludeInTrainingData
{
  void *v2;
  void *v3;
  void *v4;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledAnchors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_180);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__ATXAnchorModelTrainingDatasetBuilder_anchorsToIncludeInTrainingData__block_invoke(int a1, NSString *aClassName)
{
  NSClassFromString(aClassName);
  return (id)objc_opt_new();
}

- (unint64_t)cleanupDatasetForPrivacyPreservation
{
  void *v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)os_transaction_create();
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "AnchorModel: Cleaning up Anchor Model Database for Privacy Preservation...", (uint8_t *)&v11, 2u);
  }

  v5 = -[ATXAnchorModelDataStoreWrapperProtocol deleteSamplesThatAreMoreThan28DaysOld](self->_dataStoreWrapper, "deleteSamplesThatAreMoreThan28DaysOld");
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allInstalledAppsKnownToSpringBoard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v5 += -[ATXAnchorModelDataStoreWrapperProtocol deleteSamplesForBundleIdsNotInList:](self->_dataStoreWrapper, "deleteSamplesForBundleIdsNotInList:", v7);
  }
  else
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelTrainingDatasetBuilder cleanupDatasetForPrivacyPreservation].cold.1();

  }
  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = v5;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "AnchorModel: Done cleaning up Anchor Model Database for Privacy Preservation. Deleted %lu samples in total.", (uint8_t *)&v11, 0xCu);
  }

  return v5;
}

- (int64_t)addNewTrainingSamplesToDatabase
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)os_transaction_create();
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "AnchorModel: Harvesting new training samples for Anchor Model and adding them to the database.", buf, 2u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ATXAnchorModelTrainingDatasetBuilder anchorsToIncludeInTrainingData](self, "anchorsToIncludeInTrainingData", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v8 += -[ATXAnchorModelTrainingDatasetBuilder addNewTrainingSamplesToDatabaseForAnchor:](self, "addNewTrainingSamplesToDatabaseForAnchor:", v11);
        if (-[ATXXPCActivity didDefer](self->_xpcActivity, "didDefer"))
        {
          __atxlog_handle_anchor();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v11;
            _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Deferring adding new training samples right after processing anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
          }

          goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_16:

  return v8;
}

- (int64_t)addNewTrainingSamplesToDatabaseForAnchor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;
  int v10;
  int64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = (int64_t)v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "[START] ============= \nAnchorModel: Harvesting training data for %@.", (uint8_t *)&v10, 0xCu);
  }

  -[ATXAnchorModelTrainingDatasetBuilder fetchNewAnchorEventsForAnchor:](self, "fetchNewAnchorEventsForAnchor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAnchorModelTrainingDatasetBuilder addCandidateTrainingSamplesToDatabaseForAnchor:anchorEvents:](self, "addCandidateTrainingSamplesToDatabaseForAnchor:anchorEvents:", v4, v6);
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = v7;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "AnchorModel: Added %ld new samples for %@. \n============= [END]", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (int64_t)addCandidateTrainingSamplesToDatabaseForAnchor:(id)a3 anchorEvents:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1CAA48B6C]();
        if (-[ATXAnchorModelTrainingDatasetBuilder shouldCreateTrainingSamplesForAnchorEvent:anchor:](self, "shouldCreateTrainingSamplesForAnchorEvent:anchor:", v13, v6))
        {
          v10 += -[ATXAnchorModelTrainingDatasetBuilder addNewTrainingSamplesToDatabaseForAnchorEvent:anchor:](self, "addNewTrainingSamplesToDatabaseForAnchorEvent:anchor:", v13, v6);
          if (-[ATXXPCActivity shouldDefer](self->_xpcActivity, "shouldDefer"))
          {
            __atxlog_handle_anchor();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v24 = v6;
              v25 = 2048;
              v26 = v10;
              v27 = 2112;
              v28 = v13;
              _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Deferring adding new training samples while processing anchor %@ because XPC activity asked for deferral. Not going to finish processing this anchor or other anchors for now. We added %lu training samples for this anchor, and the last anchor event we processed was: %@.", buf, 0x20u);
            }

            objc_autoreleasePoolPop(v14);
            goto LABEL_19;
          }
        }
        else
        {
          __atxlog_handle_anchor();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v13;
            _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Anchor event does not qualify for producing training samples. Anchor event: %@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_19:

  return v10;
}

- (BOOL)anchorOccurredLongEnoughAgo:(id)a3 anchor:(id)a4
{
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;
  -[ATXAnchorModelTrainingDatasetBuilder secondsAfterAnchorToCollectPositiveSamples:](self, "secondsAfterAnchorToCollectPositiveSamples:", v7);
  v12 = v10 - v11;
  v13 = (void *)objc_opt_class();

  objc_msgSend(v13, "anchorOccurenceDateFromDuetEvent:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  return v16 < v12;
}

- (id)fetchNewAnchorEventsForAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ATXAnchorModelTrainingDatasetBuilder queryStartDateForAnchor:](self, "queryStartDateForAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAnchorEvents:startDate:endDate:", v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)addNewTrainingSamplesToDatabaseForAnchorEvent:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Adding new training samples based on anchor event %@", (uint8_t *)&v14, 0xCu);
  }

  v9 = -[ATXAnchorModelTrainingDatasetBuilder addActionEventsToDatabaseAfterAnchorEvent:anchor:](self, "addActionEventsToDatabaseAfterAnchorEvent:anchor:", v6, v7);
  v10 = -[ATXAnchorModelTrainingDatasetBuilder addAppEventsToDatabaseAfterAnchorEvent:anchor:](self, "addAppEventsToDatabaseAfterAnchorEvent:anchor:", v6, v7);
  v11 = -[ATXAnchorModelTrainingDatasetBuilder addModeEventsToDatabaseAfterAnchorEvent:anchor:](self, "addModeEventsToDatabaseAfterAnchorEvent:anchor:", v6, v7);
  v12 = -[ATXAnchorModelTrainingDatasetBuilder addLinkActionEventsToDatabaseAfterAnchorEvent:anchor:](self, "addLinkActionEventsToDatabaseAfterAnchorEvent:anchor:", v6, v7);
  -[ATXAnchorModelTrainingDatasetBuilder addAnchorEventToDatabase:anchor:](self, "addAnchorEventToDatabase:anchor:", v6, v7);

  return v10 + v9 + v11 + v12;
}

- (void)addAnchorEventToDatabase:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder addAnchorEventToDatabase:anchor:].cold.1();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "featurizeAnchorEvent:anchor:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAnchorModelDataStoreWrapperProtocol updateOrInsertAnchorEvent:anchor:featureMetadata:](self->_dataStoreWrapper, "updateOrInsertAnchorEvent:anchor:featureMetadata:", v6, v7, v10);
}

+ (id)fetchAnchorEvents:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "earlierDate:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    objc_msgSend((id)objc_opt_class(), "fetchAnchorOccurrencesBetweenStartDate:endDate:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_anchor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "Skipping operation to fetch anchor events since the query startDate (%@) occurred on or after the query endDate (%@).", (uint8_t *)&v14, 0x16u);
    }

    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)queryStartDateForAnchor:(id)a3
{
  id v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXAnchorModelDataStoreWrapperProtocol timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:](self->_dataStoreWrapper, "timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:", v4);
  if (v5 == 0.0)
  {
    __atxlog_handle_anchor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v4;
      v13 = 2048;
      v14 = 1296000;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "When computing the query start date for anchor %@, we were unable to fetch the most recent recorded anchor occurrence timestamp. Starting by adding anchor events that were at most %lu seconds ago.", (uint8_t *)&v11, 0x16u);
    }

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -1296000.0);
  }
  else
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v5 + 1.0);
  }
  v8 = (void *)v7;
  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = (uint64_t)v8;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Query start date for anchor %@ is %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (double)secondsAfterAnchorToCollectPositiveSamples:(id)a3
{
  id v3;
  double v4;
  double v5;
  NSObject *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  v5 = v4;
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder secondsAfterAnchorToCollectPositiveSamples:].cold.1((uint64_t)v3, v6, v7, v5);

  return v5;
}

- (int64_t)addActionEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a4;
  __atxlog_handle_anchor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (uint64_t)v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Adding new action training samples based on anchor event %@", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "candidateQueryStartDateFromDuetEvent:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "anchorOccurenceDateFromDuetEvent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "durationOfAnchorEvent:", v6);
  v33 = (void *)v8;
  -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveActionEventsAfterAnchorDate:durationOfAnchorEvent:](self, "fetchPositiveActionEventsAfterAnchorDate:durationOfAnchorEvent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v48 = v12;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Inserting %lu positive action events after the anchor.", buf, 0xCu);
  }
  v13 = v6;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:](self, "featurizeActionEvent:anchorOccurrenceDate:", v19, v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v16 += -[ATXAnchorModelTrainingDatasetBuilder addFeaturizedActionToDatabase:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:](self, "addFeaturizedActionToDatabase:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:", v19, v21, 1, 0, v13, v36);

        objc_autoreleasePoolPop(v20);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeActionEventsAfterAnchorDate:anchor:positiveActionEvents:](self, "fetchNegativeActionEventsAfterAnchorDate:anchor:positiveActionEvents:", v33, v36, obj);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134217984;
    v48 = v24;
    _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "Inserting %lu negative action events after the anchor.", buf, 0xCu);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v34 = v22;
  v25 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(v34);
        v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        v30 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:](self, "featurizeActionEvent:anchorOccurrenceDate:", v29, v9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v16 += -[ATXAnchorModelTrainingDatasetBuilder addFeaturizedActionToDatabase:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:](self, "addFeaturizedActionToDatabase:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:", v29, v31, 0, 0, v13, v36);

        objc_autoreleasePoolPop(v30);
      }
      v26 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v26);
  }

  return v16;
}

- (int64_t)addFeaturizedActionToDatabase:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  -[ATXAnchorModelDataStoreWrapperProtocol updateOrInsertActionTrainingSample:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:](self->_dataStoreWrapper, "updateOrInsertActionTrainingSample:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:", a3, a4, a5, a6, a7, a8);
  return 1;
}

- (id)fetchPositiveActionEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4
{
  ATXAnchorModelEventHarvester *harvester;
  id v6;
  void *v7;

  harvester = self->_harvester;
  v6 = a3;
  -[ATXAnchorModelEventHarvester fetchEventsAfterAnchorOccurrenceDate:withDuetDataProviderClass:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:predicates:](harvester, "fetchEventsAfterAnchorOccurrenceDate:withDuetDataProviderClass:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:predicates:", v6, objc_opt_class(), 100000, 0, (uint64_t)a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchNegativeActionEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveActionEvents:(id)a5
{
  void *v5;
  NSObject *v6;

  -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:](self, "targetedNegativeActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:", a4, a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeActionEventsAfterAnchorDate:anchor:positiveActionEvents:].cold.1();

  return v5;
}

- (id)targetedNegativeActionSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  void *v12;
  void *v13;

  v8 = a4;
  -[ATXAnchorModelTrainingDatasetBuilder actionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromActions:](self, "actionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromActions:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:].cold.1();

  dataStoreWrapper = self->_dataStoreWrapper;
  objc_msgSend(v9, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol appIntentDuetEventsFromCandidateIds:date:](dataStoreWrapper, "appIntentDuetEventsFromCandidateIds:date:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)actionCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromActions:(id)a4
{
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;

  dataStoreWrapper = self->_dataStoreWrapper;
  v7 = a4;
  -[ATXAnchorModelDataStoreWrapperProtocol uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:](dataStoreWrapper, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:", a3, CFSTR("action"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  __atxlog_handle_anchor();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder actionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromActions:].cold.1(v9, v10);

  -[ATXAnchorModelTrainingDatasetBuilder candidateIdSetFromAppIntentEvents:](self, "candidateIdSetFromAppIntentEvents:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minusSet:", v11);
  return v9;
}

- (id)candidateIdSetFromAppIntentEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C](v6);
        +[ATXAnchorModelDataStoreWrapper candidateIdFromAppIntentDuetEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromAppIntentDuetEvent:", v10, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (id)candidateIdSetFromAppLaunchDuetEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C](v6);
        +[ATXAnchorModelDataStoreWrapper candidateIdFromAppLaunchDuetEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromAppLaunchDuetEvent:", v10, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (id)featurizeActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setShouldComputeLaunchHistoryForAppLaunches:", 0);
  objc_msgSend(v7, "setShouldComputeLaunchHistoryForActionKeyLaunches:", 0);
  objc_msgSend(v7, "setShouldComputeLaunchHistoryForActionUUIDLaunches:", 1);
  objc_msgSend(v7, "featurizeActionEvent:anchorOccurrenceDate:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.5();

  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.4(v8);

  __atxlog_handle_anchor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.3(v8);

  __atxlog_handle_anchor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.2(v8);

  __atxlog_handle_anchor();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.1();

  return v8;
}

- (int64_t)addAppEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v35;
  id obj;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v38 = v7;
  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = (uint64_t)v6;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Adding new app training samples based on anchor event %@", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "candidateQueryStartDateFromDuetEvent:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "anchorOccurenceDateFromDuetEvent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "durationOfAnchorEvent:", v6);
  v35 = (void *)v10;
  -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveAppEventsAfterAnchorDate:durationOfAnchorEvent:anchor:](self, "fetchPositiveAppEventsAfterAnchorDate:durationOfAnchorEvent:anchor:", v10, v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134217984;
    v50 = v14;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Inserting %lu positive app events after the anchor.", buf, 0xCu);
  }

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "warmLaunchHistoryForAppEvents:anchorOccurrenceDate:", v12, v11);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v12;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[ATXAnchorModelTrainingDatasetBuilder featurizeAppEvent:anchorOccurrenceDate:eventFeaturizer:](self, "featurizeAppEvent:anchorOccurrenceDate:eventFeaturizer:", v21, v11, v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v18 += -[ATXAnchorModelTrainingDatasetBuilder addFeaturizedAppToDatabase:featurizedApp:appWasLaunched:appEngaged:anchorEvent:anchor:](self, "addFeaturizedAppToDatabase:featurizedApp:appWasLaunched:appEngaged:anchorEvent:anchor:", v21, v22, 1, 0, v8, v38);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }
  v37 = v8;

  -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeAppEventsAfterAnchorDate:anchor:positiveAppEvents:](self, "fetchNegativeAppEventsAfterAnchorDate:anchor:positiveAppEvents:", v35, v38, obj);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 134217984;
    v50 = v25;
    _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "Inserting %lu negative app events after the anchor.", buf, 0xCu);
  }

  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "warmLaunchHistoryForAppEvents:anchorOccurrenceDate:", v23, v11);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v27 = v23;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        -[ATXAnchorModelTrainingDatasetBuilder featurizeAppEvent:anchorOccurrenceDate:eventFeaturizer:](self, "featurizeAppEvent:anchorOccurrenceDate:eventFeaturizer:", v32, v11, v26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v18 += -[ATXAnchorModelTrainingDatasetBuilder addFeaturizedAppToDatabase:featurizedApp:appWasLaunched:appEngaged:anchorEvent:anchor:](self, "addFeaturizedAppToDatabase:featurizedApp:appWasLaunched:appEngaged:anchorEvent:anchor:", v32, v33, 0, 0, v37, v38);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v29);
  }

  return v18;
}

- (int64_t)addFeaturizedAppToDatabase:(id)a3 featurizedApp:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  -[ATXAnchorModelDataStoreWrapperProtocol updateOrInsertAppTrainingSample:featurizedApp:appWasLaunched:appEngaged:anchorEvent:anchor:](self->_dataStoreWrapper, "updateOrInsertAppTrainingSample:featurizedApp:appWasLaunched:appEngaged:anchorEvent:anchor:", a3, a4, a5, a6, a7, a8);
  return 1;
}

- (id)fetchPositiveAppEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5
{
  id v8;
  ATXAnchorModelEventHarvester *harvester;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  harvester = self->_harvester;
  v10 = a5;
  -[ATXAnchorModelEventHarvester fetchAppLaunchEventsAfterAnchorOccurrenceDate:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:isIncluded:](harvester, "fetchAppLaunchEventsAfterAnchorOccurrenceDate:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:isIncluded:", v8, 100000, 0, (uint64_t)a4, &__block_literal_global_20_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelTrainingDatasetBuilder appLaunchEventsFromNowPlayingStreamForAnchor:anchorOccurrenceDate:](self, "appLaunchEventsFromNowPlayingStreamForAnchor:anchorOccurrenceDate:", v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "addObjectsFromArray:", v11);
  objc_msgSend(v13, "addObjectsFromArray:", v12);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v18 = (objc_class *)MEMORY[0x1E0C99D68];
  v19 = v8;
  v20 = (void *)objc_msgSend([v18 alloc], "initWithTimeInterval:sinceDate:", v19, a4);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v19, v20);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __107__ATXAnchorModelTrainingDatasetBuilder_fetchPositiveAppEventsAfterAnchorDate_durationOfAnchorEvent_anchor___block_invoke_2;
  v25[3] = &unk_1E82DC310;
  v26 = v21;
  v22 = v21;
  objc_msgSend(v17, "_pas_filteredArrayWithTest:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

BOOL __107__ATXAnchorModelTrainingDatasetBuilder_fetchPositiveAppEventsAfterAnchorDate_durationOfAnchorEvent_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 >= 2.0;

  return v6;
}

uint64_t __107__ATXAnchorModelTrainingDatasetBuilder_fetchPositiveAppEventsAfterAnchorDate_durationOfAnchorEvent_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsDate:", v3);

  return v4;
}

- (id)appLaunchEventsFromNowPlayingStreamForAnchor:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99D68];
  v8 = a3;
  v9 = [v7 alloc];
  -[ATXAnchorModelTrainingDatasetBuilder secondsAfterAnchorToCollectPositiveSamples:](self, "secondsAfterAnchorToCollectPositiveSamples:", v8);
  v11 = v10;

  v12 = (void *)objc_msgSend(v9, "initWithTimeInterval:sinceDate:", v6, v11);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "playbackEventsAfterSecondsOfInactivity:betweenStartDate:endDate:", v6, v12, 600.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertNowPlayingEventsToAppLaunchEvents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = 134217984;
    v19 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "Generated %lu App Launch Events from Now Playing Events.", (uint8_t *)&v18, 0xCu);
  }

  return v15;
}

- (id)fetchNegativeAppEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveAppEvents:(id)a5
{
  void *v5;
  NSObject *v6;

  -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeAppSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:](self, "targetedNegativeAppSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:", a4, a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeAppEventsAfterAnchorDate:anchor:positiveAppEvents:].cold.1();

  return v5;
}

- (id)targetedNegativeAppSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  void *v12;
  void *v13;

  v8 = a4;
  -[ATXAnchorModelTrainingDatasetBuilder appCandidateIdsToTargetForAnchor:excludeCandidateIdsFromAppLaunches:](self, "appCandidateIdsToTargetForAnchor:excludeCandidateIdsFromAppLaunches:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeAppSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:].cold.1();

  dataStoreWrapper = self->_dataStoreWrapper;
  objc_msgSend(v9, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol appLaunchDuetEventsFromCandidateIds:date:](dataStoreWrapper, "appLaunchDuetEventsFromCandidateIds:date:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)appCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromAppLaunches:(id)a4
{
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;

  dataStoreWrapper = self->_dataStoreWrapper;
  v7 = a4;
  -[ATXAnchorModelDataStoreWrapperProtocol uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:](dataStoreWrapper, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:", a3, CFSTR("app"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  __atxlog_handle_anchor();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder actionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromActions:].cold.1(v9, v10);

  -[ATXAnchorModelTrainingDatasetBuilder candidateIdSetFromAppLaunchDuetEvents:](self, "candidateIdSetFromAppLaunchDuetEvents:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minusSet:", v11);
  return v9;
}

- (id)featurizeAppEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "featurizeAppLaunchEvents:anchorOccurrenceDate:", v11, v9, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_anchor();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.5();

  __atxlog_handle_anchor();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeAppEvent:anchorOccurrenceDate:eventFeaturizer:].cold.2();

  __atxlog_handle_anchor();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.1();

  return v13;
}

- (int64_t)addModeEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  id obj;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a4;
  __atxlog_handle_anchor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (uint64_t)v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Adding new mode training samples based on anchor event %@", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "candidateQueryStartDateFromDuetEvent:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "anchorOccurenceDateFromDuetEvent:", v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "durationOfAnchorEvent:", v6);
  v32 = (void *)v8;
  -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveModeEventsAfterAnchorDate:durationOfAnchorEvent:anchor:](self, "fetchPositiveModeEventsAfterAnchorDate:durationOfAnchorEvent:anchor:", v8, v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v48 = v11;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Inserting %lu positive mode events after the anchor.", buf, 0xCu);
  }

  v12 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAnchorModelTrainingDatasetBuilder featurizeModeEvent:anchorOccurrenceDate:eventFeaturizer:](self, "featurizeModeEvent:anchorOccurrenceDate:eventFeaturizer:", v18, v35, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 += -[ATXAnchorModelTrainingDatasetBuilder addFeaturizedModeToDatabase:featurizedMode:modeOccurred:modeEngaged:anchorEvent:anchor:](self, "addFeaturizedModeToDatabase:featurizedMode:modeOccurred:modeEngaged:anchorEvent:anchor:", v18, v20, 1, 0, v6, v36);

        objc_autoreleasePoolPop(v19);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeModeEventsAfterAnchorDate:anchor:positiveModeEvents:](self, "fetchNegativeModeEventsAfterAnchorDate:anchor:positiveModeEvents:", v32, v36, obj);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134217984;
    v48 = v23;
    _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "Inserting %lu negative activity change events after the anchor.", buf, 0xCu);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v33 = v21;
  v24 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v33);
        v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAnchorModelTrainingDatasetBuilder featurizeModeEvent:anchorOccurrenceDate:eventFeaturizer:](self, "featurizeModeEvent:anchorOccurrenceDate:eventFeaturizer:", v28, v35, v12);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v15 += -[ATXAnchorModelTrainingDatasetBuilder addFeaturizedModeToDatabase:featurizedMode:modeOccurred:modeEngaged:anchorEvent:anchor:](self, "addFeaturizedModeToDatabase:featurizedMode:modeOccurred:modeEngaged:anchorEvent:anchor:", v28, v30, 0, 0, v6, v36);

        objc_autoreleasePoolPop(v29);
      }
      v25 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v25);
  }

  return v15;
}

- (id)fetchPositiveModeEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UserFocus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ComputedMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "atx_publisherFromStartDate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAnchorModelEventHarvester fetchEventsAfterAnchorOccurenceDate:withBiomePublisher:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:](self->_harvester, "fetchEventsAfterAnchorOccurenceDate:withBiomePublisher:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:", v7, v11, 5, (uint64_t)a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)featurizeModeEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  objc_msgSend(a5, "featurizeModeEvent:anchorOccurrenceDate:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.5();

  __atxlog_handle_anchor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeModeEvent:anchorOccurrenceDate:eventFeaturizer:].cold.2();

  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.1();

  return v5;
}

- (int64_t)addFeaturizedModeToDatabase:(id)a3 featurizedMode:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  -[ATXAnchorModelDataStoreWrapperProtocol updateOrInsertModeTrainingSample:featurizedMode:modeOccurred:modeEngaged:anchorEvent:anchor:](self->_dataStoreWrapper, "updateOrInsertModeTrainingSample:featurizedMode:modeOccurred:modeEngaged:anchorEvent:anchor:", a3, a4, a5, a6, a7, a8);
  return 1;
}

- (id)fetchNegativeModeEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveModeEvents:(id)a5
{
  void *v5;
  NSObject *v6;

  -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeModeSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:](self, "targetedNegativeModeSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:", a4, a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeModeEventsAfterAnchorDate:anchor:positiveModeEvents:].cold.1();

  return v5;
}

- (id)targetedNegativeModeSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  void *v12;
  void *v13;

  v8 = a4;
  -[ATXAnchorModelTrainingDatasetBuilder modeCandidateIdsToTargetForAnchor:excludeCandidateIdsFromModes:](self, "modeCandidateIdsToTargetForAnchor:excludeCandidateIdsFromModes:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeModeSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:].cold.1();

  dataStoreWrapper = self->_dataStoreWrapper;
  objc_msgSend(v9, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol modeBiomeEventsFromCandidateIds:date:](dataStoreWrapper, "modeBiomeEventsFromCandidateIds:date:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)modeCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromModes:(id)a4
{
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;

  dataStoreWrapper = self->_dataStoreWrapper;
  v7 = a4;
  -[ATXAnchorModelDataStoreWrapperProtocol uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:](dataStoreWrapper, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:", a3, CFSTR("mode"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  __atxlog_handle_anchor();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder modeCandidateIdsToTargetForAnchor:excludeCandidateIdsFromModes:].cold.1(v9, v10);

  -[ATXAnchorModelTrainingDatasetBuilder candidateIdSetFromModeEvents:](self, "candidateIdSetFromModeEvents:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minusSet:", v11);
  return v9;
}

- (id)candidateIdSetFromModeEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C](v6);
        +[ATXAnchorModelDataStoreWrapper candidateIdFromModeBiomeEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromModeBiomeEvent:", v10, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (int64_t)addLinkActionEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  id obj;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a4;
  __atxlog_handle_anchor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (uint64_t)v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Adding new Link action training samples based on anchor event %@", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "candidateQueryStartDateFromDuetEvent:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "anchorOccurenceDateFromDuetEvent:", v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "durationOfAnchorEvent:", v6);
  v32 = (void *)v8;
  -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveLinkActionEventsAfterAnchorDate:durationOfAnchorEvent:anchor:](self, "fetchPositiveLinkActionEventsAfterAnchorDate:durationOfAnchorEvent:anchor:", v8, v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v48 = v11;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Inserting %lu positive Link action events after the anchor.", buf, 0xCu);
  }

  v12 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAnchorModelTrainingDatasetBuilder featurizeLinkActionEvent:anchorOccurrenceDate:eventFeaturizer:](self, "featurizeLinkActionEvent:anchorOccurrenceDate:eventFeaturizer:", v18, v35, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 += -[ATXAnchorModelTrainingDatasetBuilder addFeaturizedLinkActionToDatabase:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:](self, "addFeaturizedLinkActionToDatabase:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:", v18, v20, 1, 0, v6, v36);

        objc_autoreleasePoolPop(v19);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeLinkActionEventsAfterAnchorDate:anchor:positiveLinkActionEvents:](self, "fetchNegativeLinkActionEventsAfterAnchorDate:anchor:positiveLinkActionEvents:", v32, v36, obj);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134217984;
    v48 = v23;
    _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "Inserting %lu negative activity change events after the anchor.", buf, 0xCu);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v33 = v21;
  v24 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v33);
        v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAnchorModelTrainingDatasetBuilder featurizeLinkActionEvent:anchorOccurrenceDate:eventFeaturizer:](self, "featurizeLinkActionEvent:anchorOccurrenceDate:eventFeaturizer:", v28, v35, v12);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v15 += -[ATXAnchorModelTrainingDatasetBuilder addFeaturizedLinkActionToDatabase:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:](self, "addFeaturizedLinkActionToDatabase:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:", v28, v30, 0, 0, v6, v36);

        objc_autoreleasePoolPop(v29);
      }
      v25 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v25);
  }

  return v15;
}

- (id)fetchPositiveLinkActionEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v7 = a3;
  v13 = 0;
  +[ATXLinkTranscriptUtil systemLinkTranscriptPublisherFromDate:toDate:error:](ATXLinkTranscriptUtil, "systemLinkTranscriptPublisherFromDate:toDate:error:", v7, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    __atxlog_handle_anchor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveLinkActionEventsAfterAnchorDate:durationOfAnchorEvent:anchor:].cold.1();

    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[ATXAnchorModelEventHarvester fetchEventsAfterAnchorOccurenceDate:withBiomePublisher:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:isIncluded:](self->_harvester, "fetchEventsAfterAnchorOccurenceDate:withBiomePublisher:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:isIncluded:", v7, v8, 5, (uint64_t)a4, &__block_literal_global_30_1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

BOOL __114__ATXAnchorModelTrainingDatasetBuilder_fetchPositiveLinkActionEventsAfterAnchorDate_durationOfAnchorEvent_anchor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)featurizeLinkActionEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  objc_msgSend(a5, "featurizeLinkActionEvent:anchorOccurrenceDate:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.5();

  __atxlog_handle_anchor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeLinkActionEvent:anchorOccurrenceDate:eventFeaturizer:].cold.2();

  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.1();

  return v5;
}

- (int64_t)addFeaturizedLinkActionToDatabase:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  -[ATXAnchorModelDataStoreWrapperProtocol updateOrInsertLinkActionTrainingSample:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:](self->_dataStoreWrapper, "updateOrInsertLinkActionTrainingSample:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:", a3, a4, a5, a6, a7, a8);
  return 1;
}

- (id)fetchNegativeLinkActionEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveLinkActionEvents:(id)a5
{
  void *v5;
  NSObject *v6;

  -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeLinkActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:](self, "targetedNegativeLinkActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:", a4, a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeLinkActionEventsAfterAnchorDate:anchor:positiveLinkActionEvents:].cold.1();

  return v5;
}

- (id)targetedNegativeLinkActionSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  void *v12;
  void *v13;

  v8 = a4;
  -[ATXAnchorModelTrainingDatasetBuilder linkActionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromLinkActions:](self, "linkActionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromLinkActions:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeLinkActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:].cold.1();

  dataStoreWrapper = self->_dataStoreWrapper;
  objc_msgSend(v9, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol linkActionBiomeEventsFromCandidateIds:date:](dataStoreWrapper, "linkActionBiomeEventsFromCandidateIds:date:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)linkActionCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromLinkActions:(id)a4
{
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  id v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;

  dataStoreWrapper = self->_dataStoreWrapper;
  v7 = a4;
  -[ATXAnchorModelDataStoreWrapperProtocol uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:](dataStoreWrapper, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:", a3, CFSTR("linkaction"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  __atxlog_handle_anchor();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelTrainingDatasetBuilder linkActionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromLinkActions:].cold.1(v9, v10);

  -[ATXAnchorModelTrainingDatasetBuilder candidateIdSetFromLinkActionEvents:](self, "candidateIdSetFromLinkActionEvents:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minusSet:", v11);
  return v9;
}

- (id)candidateIdSetFromLinkActionEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C](v6);
        +[ATXAnchorModelDataStoreWrapper candidateIdFromLinkActionBiomeEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromLinkActionBiomeEvent:", v10, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_harvester, 0);
  objc_storeStrong((id *)&self->_dataStoreWrapper, 0);
}

- (void)cleanupDatasetForPrivacyPreservation
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "Not deleting samples for uninstalled apps in Anchor Model because list of installed apps known to SpringBoard was empty.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)addAnchorEventToDatabase:anchor:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_3_9(&dword_1C9A3B000, v1, (uint64_t)v1, "AnchorModel: Adding anchor event to database %@ for anchor %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)secondsAfterAnchorToCollectPositiveSamples:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = a4;
  OUTLINED_FUNCTION_3_9(&dword_1C9A3B000, a2, a3, "Seconds of influence for anchor %@ is %.02f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchNegativeActionEventsAfterAnchorDate:anchor:positiveActionEvents:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9_3();
  +[ATXAnchorModelEventHarvester idsFromDuetEvents:](ATXAnchorModelEventHarvester, "idsFromDuetEvents:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "Selected negative action events: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)targetedNegativeActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Candidate Ids that didn't happen after this anchor occurrence: %@. Going to generate negative samples for these actions.", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)actionCandidateIdsToTargetForAnchor:(void *)a1 excludeCandidateIdsFromActions:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_3(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%lu action events have happened after the anchor historically.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

- (void)featurizeActionEvent:anchorOccurrenceDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "========================================================================== (end)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)featurizeActionEvent:(void *)a1 anchorOccurrenceDate:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "appLaunchMetadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "Featurized action - app launch: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)featurizeActionEvent:(void *)a1 anchorOccurrenceDate:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "actionKeyMetadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "Featurized action - action key: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)featurizeActionEvent:(void *)a1 anchorOccurrenceDate:.cold.4(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "actionUUIDMetadatas");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v3, v4, "Featurized action - action UUID: %@", v5, v6, v7, v8, v9);

}

- (void)featurizeActionEvent:anchorOccurrenceDate:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "========================================================================== (start)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)fetchNegativeAppEventsAfterAnchorDate:anchor:positiveAppEvents:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9_3();
  +[ATXAnchorModelEventHarvester idsFromDuetEvents:](ATXAnchorModelEventHarvester, "idsFromDuetEvents:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "Selected negative app events: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)targetedNegativeAppSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Candidate Ids that didn't happen after this anchor occurrence: %@. Going to generate negative samples for these apps.", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)featurizeAppEvent:anchorOccurrenceDate:eventFeaturizer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Featurized app - app launch: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)featurizeModeEvent:anchorOccurrenceDate:eventFeaturizer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Featurized mode event: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchNegativeModeEventsAfterAnchorDate:anchor:positiveModeEvents:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9_3();
  +[ATXAnchorModelEventHarvester idsFromBiomeEvents:](ATXAnchorModelEventHarvester, "idsFromBiomeEvents:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "Selected negative mode events: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)targetedNegativeModeSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Candidate Ids that didn't happen after this anchor occurrence: %@. Going to generate negative samples for these modes.", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)modeCandidateIdsToTargetForAnchor:(void *)a1 excludeCandidateIdsFromModes:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_3(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%lu mode events have happened after the anchor historically.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

- (void)fetchPositiveLinkActionEventsAfterAnchorDate:durationOfAnchorEvent:anchor:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "Error when fetching Link transcript publisher: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)featurizeLinkActionEvent:anchorOccurrenceDate:eventFeaturizer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Featurized Link action event: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchNegativeLinkActionEventsAfterAnchorDate:anchor:positiveLinkActionEvents:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9_3();
  +[ATXAnchorModelEventHarvester idsFromBiomeEvents:](ATXAnchorModelEventHarvester, "idsFromBiomeEvents:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "Selected negative Link action events: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)targetedNegativeLinkActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Candidate Ids that didn't happen after this anchor occurrence: %@. Going to generate negative samples for these Link actions.", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)linkActionCandidateIdsToTargetForAnchor:(void *)a1 excludeCandidateIdsFromLinkActions:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_3(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "%lu Link action events have happened after the anchor historically.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

@end
