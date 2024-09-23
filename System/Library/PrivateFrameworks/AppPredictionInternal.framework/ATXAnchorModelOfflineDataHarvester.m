@implementation ATXAnchorModelOfflineDataHarvester

- (ATXAnchorModelOfflineDataHarvester)init
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  ATXAnchorModelOfflineDataHarvester *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXAnchorModelOfflineDataHarvester is being initialized.", (uint8_t *)&v10, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "getUserUUIDForDataCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "getSamplingGroupForDataCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      __atxlog_handle_default();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "AnchorModel: User is enrolled in Anchor Model data collection. Sampling group description: %@", (uint8_t *)&v10, 0xCu);

      }
      self = -[ATXAnchorModelOfflineDataHarvester initWithSamplingGroup:userId:](self, "initWithSamplingGroup:userId:", v5, v4);
      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getUserUUIDForDataCollection
{
  void *v2;
  void *v3;

  +[ATXEnrollmentManager getUserIdForScheme:enrollmentPeriod:enrollmentRate:](ATXEnrollmentManager, "getUserIdForScheme:enrollmentPeriod:enrollmentRate:", CFSTR("com.apple.duetexpertd.anchormodel.dataharvester.enrollmentmanager"), 7776000.0, 0.1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  else
    v3 = 0;

  return v3;
}

+ (id)getSamplingGroupForDataCollection
{
  return +[ATXAnchorModelSamplingGroup getSamplingGroupForDataCollection](ATXAnchorModelSamplingGroup, "getSamplingGroupForDataCollection");
}

+ (void)resetSamplingGroupAssignmentForUser
{
  +[ATXAnchorModelSamplingGroup resetSamplingGroupAssignmentForUser](ATXAnchorModelSamplingGroup, "resetSamplingGroupAssignmentForUser");
}

- (ATXAnchorModelOfflineDataHarvester)initWithSamplingGroup:(id)a3 userId:(id)a4
{
  id v7;
  id v8;
  ATXAnchorModelOfflineDataHarvester *v9;
  uint64_t v10;
  NSArray *anchorsToCollect;
  uint64_t v12;
  ATXAnchorModelEventFeaturizer *eventFeaturizer;
  uint64_t v14;
  ATXAnchorModelEventHarvester *harvester;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAnchorModelOfflineDataHarvester.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("samplingGroup"));

  }
  v18.receiver = self;
  v18.super_class = (Class)ATXAnchorModelOfflineDataHarvester;
  v9 = -[ATXAnchorModelOfflineDataHarvester init](&v18, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "anchorWhitelist");
    v10 = objc_claimAutoreleasedReturnValue();
    anchorsToCollect = v9->_anchorsToCollect;
    v9->_anchorsToCollect = (NSArray *)v10;

    v12 = objc_opt_new();
    eventFeaturizer = v9->_eventFeaturizer;
    v9->_eventFeaturizer = (ATXAnchorModelEventFeaturizer *)v12;

    v14 = objc_opt_new();
    harvester = v9->_harvester;
    v9->_harvester = (ATXAnchorModelEventHarvester *)v14;

    objc_storeStrong((id *)&v9->_userId, a4);
  }

  return v9;
}

- (void)harvestData
{
  void *v3;
  NSUUID *userId;
  NSObject *v5;
  _BOOL4 v6;
  NSUInteger v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSUInteger v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  NSUInteger v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)os_transaction_create();
  userId = self->_userId;
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (userId)
  {
    v17 = v3;
    if (v6)
    {
      v7 = -[NSArray count](self->_anchorsToCollect, "count");
      *(_DWORD *)buf = 134217984;
      v24 = v7;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "AnchorModel: User is enrolled in Anchor Model data collection. Beginning collection of %lu different types of anchors. [START HARVESTING DATA]", buf, 0xCu);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_anchorsToCollect;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1CAA48B6C]();
          __atxlog_handle_default();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v13;
            _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "AnchorModel: Harvesting data on %@ anchor.", buf, 0xCu);
          }

          -[ATXAnchorModelOfflineDataHarvester harvestDataForAnchor:](self, "harvestDataForAnchor:", v13);
          objc_autoreleasePoolPop(v14);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    v3 = v17;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "AnchorModel: Finished harvesting data. [DONE HARVESTING DATA]";
LABEL_17:
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    v16 = "AnchorModel: User is not enrolled in Anchor Model data collection. Exiting early.";
    goto LABEL_17;
  }

}

- (void)harvestDataForAnchor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXAnchorModelOfflineDataHarvester fetchAnchorEvents:](self, "fetchAnchorEvents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "AnchorModel: Found %lu anchor events.", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        __atxlog_handle_default();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v12;
          _os_log_debug_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEBUG, "AnchorModel: Anchor description: %@", buf, 0xCu);
        }

        -[ATXAnchorModelOfflineDataHarvester processAnchorOccurrence:anchor:](self, "processAnchorOccurrence:anchor:", v12, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXAnchorModelDataAnonymizer anonymizeMessage:](ATXAnchorModelDataAnonymizer, "anonymizeMessage:", v14);
        objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:", v14);

        __atxlog_handle_default();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "AnchorModel: Logged message with PET2.", buf, 2u);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (id)fetchAnchorEvents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();

  objc_msgSend(v5, "dateByAddingTimeInterval:", -115200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -7200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAnchorOccurrencesBetweenStartDate:endDate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)processAnchorOccurrence:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_userId, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserId:", v9);

  -[ATXAnchorModelEventFeaturizer featurizeAnchorEvent:anchor:](self->_eventFeaturizer, "featurizeAnchorEvent:anchor:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnchor:", v10);

  v11 = (void *)objc_opt_class();
  objc_msgSend(v11, "anchorOccurenceDateFromDuetEvent:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAnchorModelOfflineDataHarvester addAppLaunchEventsFromAnchorOccurrenceDate:toMessage:](self, "addAppLaunchEventsFromAnchorOccurrenceDate:toMessage:", v12, v8);
  -[ATXAnchorModelOfflineDataHarvester addActionEventsFromAnchorOccurrenceDate:toMessage:](self, "addActionEventsFromAnchorOccurrenceDate:toMessage:", v12, v8);
  -[ATXAnchorModelOfflineDataHarvester addNegativeSamplesForAnchorOccurrenceDate:toMessage:](self, "addNegativeSamplesForAnchorOccurrenceDate:toMessage:", v12, v8);

  return v8;
}

- (void)addAppLaunchEventsFromAnchorOccurrenceDate:(id)a3 toMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXAnchorModelOfflineDataHarvester fetchEventsAfterAnchorOccurrenceDate:withDuetDataProviderClass:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:](self, "fetchEventsAfterAnchorOccurrenceDate:withDuetDataProviderClass:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:", v6, objc_opt_class(), 100, 300, 5400);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ATXAnchorModelEventFeaturizer featurizeAppLaunchEvents:anchorOccurrenceDate:](self->_eventFeaturizer, "featurizeAppLaunchEvents:anchorOccurrenceDate:", v8, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v7, "addPositiveAppLaunches:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)addActionEventsFromAnchorOccurrenceDate:(id)a3 toMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXAnchorModelOfflineDataHarvester fetchEventsAfterAnchorOccurrenceDate:withDuetDataProviderClass:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:](self, "fetchEventsAfterAnchorOccurrenceDate:withDuetDataProviderClass:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:", v6, objc_opt_class(), 100, 300, 5400);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[ATXAnchorModelEventFeaturizer featurizeActionEvent:anchorOccurrenceDate:](self->_eventFeaturizer, "featurizeActionEvent:anchorOccurrenceDate:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addPositiveActions:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)addNegativeSamplesForAnchorOccurrenceDate:(id)a3 toMessage:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[ATXAnchorModelOfflineDataHarvester setNegativeAppLaunchSamplesForAnchorOccurrenceDate:mainMessage:](self, "setNegativeAppLaunchSamplesForAnchorOccurrenceDate:mainMessage:", v7, v6);
  -[ATXAnchorModelOfflineDataHarvester setNegativeActionSamplesForAnchorOccurrenceDate:mainMessage:](self, "setNegativeActionSamplesForAnchorOccurrenceDate:mainMessage:", v7, v6);

}

- (id)fetchEventsAfterAnchorOccurrenceDate:(id)a3 withDuetDataProviderClass:(Class)a4 limit:(unint64_t)a5 maxSecondsBeforeAnchor:(int64_t)a6 maxSecondsAfterAnchor:(int64_t)a7
{
  return -[ATXAnchorModelEventHarvester fetchEventsAfterAnchorOccurrenceDate:withDuetDataProviderClass:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:predicates:](self->_harvester, "fetchEventsAfterAnchorOccurrenceDate:withDuetDataProviderClass:limit:maxSecondsBeforeAnchor:maxSecondsAfterAnchor:predicates:", a3, a4, a5, a6, a7, 0);
}

- (id)allInstalledAppsKnownToSpringBoard
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v2, "allInstalledAppsKnownToSpringBoard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return v5;
}

- (void)setNegativeAppLaunchSamplesForAnchorOccurrenceDate:(id)a3 mainMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ATXAppLaunchDuetEvent *v16;
  void *v17;
  ATXAppLaunchDuetEvent *v18;
  ATXAnchorModelEventFeaturizer *eventFeaturizer;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  ATXAppLaunchDuetEvent *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXAnchorModelOfflineDataHarvester allInstalledAppsKnownToSpringBoard](self, "allInstalledAppsKnownToSpringBoard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchorModelOfflineDataHarvester bundleIdsFromAppLaunchesInMessage:](ATXAnchorModelOfflineDataHarvester, "bundleIdsFromAppLaunchesInMessage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchorModelEventHarvester negativeAppsGivenAllAppIds:positiveAppIds:](ATXAnchorModelEventHarvester, "negativeAppsGivenAllAppIds:positiveAppIds:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v10;
  objc_msgSend(v10, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchorModelEventHarvester randomSampleFromArray:sampleSize:](ATXAnchorModelEventHarvester, "randomSampleFromArray:sampleSize:");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14);
        v16 = [ATXAppLaunchDuetEvent alloc];
        objc_msgSend(v6, "dateByAddingTimeInterval:", 1.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[ATXAppLaunchDuetEvent initWithBundleId:startDate:endDate:](v16, "initWithBundleId:startDate:endDate:", v15, v6, v17);

        eventFeaturizer = self->_eventFeaturizer;
        v30 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAnchorModelEventFeaturizer featurizeAppLaunchEvents:anchorOccurrenceDate:](eventFeaturizer, "featurizeAppLaunchEvents:anchorOccurrenceDate:", v20, v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addNegativeAppLaunches:", v22);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

}

- (void)setNegativeActionSamplesForAnchorOccurrenceDate:(id)a3 mainMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[ATXAnchorModelOfflineDataHarvester actionIdentifiersFromActionsInMessage:](ATXAnchorModelOfflineDataHarvester, "actionIdentifiersFromActionsInMessage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelEventHarvester negativeActionsOnAnchorOccurrenceDate:positiveActionIds:](self->_harvester, "negativeActionsOnAnchorOccurrenceDate:positiveActionIds:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchorModelEventHarvester randomSampleFromArray:sampleSize:](ATXAnchorModelEventHarvester, "randomSampleFromArray:sampleSize:", v9, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[ATXAnchorModelEventFeaturizer featurizeActionEvent:anchorOccurrenceDate:](self->_eventFeaturizer, "featurizeActionEvent:anchorOccurrenceDate:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14), v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addNegativeActions:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

+ (id)bundleIdsFromAppLaunchesInMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "positiveAppLaunches", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasBundleId"))
        {
          objc_msgSend(v10, "bundleId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)actionIdentifiersFromActionsInMessage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = (id)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v18, "positiveActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasAppLaunchMetadata"))
        {
          objc_msgSend(v8, "appLaunchMetadata");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "hasBundleId") && objc_msgSend(v8, "hasActionKeyMetadata"))
          {
            objc_msgSend(v8, "actionKeyMetadata");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "hasActionType"))
            {
              v11 = objc_msgSend(v8, "actionUUIDMetadatasCount");

              if (v11 != 1)
                continue;
              v12 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v8, "appLaunchMetadata");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "bundleId");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "actionKeyMetadata");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "actionType");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "actionUUIDMetadatas");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@:%@:%lld"), v10, v13, objc_msgSend(v15, "actionUUID"));
              objc_msgSend(v19, "addObject:", v16);

            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_harvester, 0);
  objc_storeStrong((id *)&self->_eventFeaturizer, 0);
  objc_storeStrong((id *)&self->_anchorsToCollect, 0);
}

@end
