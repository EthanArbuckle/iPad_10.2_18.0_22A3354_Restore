@implementation ATXDigestSetupFlowProvider

- (ATXDigestSetupFlowProvider)init
{
  void *v3;
  ATXDigestSetupFlowProvider *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXDigestSetupFlowProvider initWithDatastore:](self, "initWithDatastore:", v3);

  return v4;
}

- (ATXDigestSetupFlowProvider)initWithDatastore:(id)a3
{
  id v5;
  ATXDigestSetupFlowProvider *v6;
  ATXDigestSetupFlowProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDigestSetupFlowProvider;
  v6 = -[ATXDigestSetupFlowProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_datastore, a3);
    v7->_containsMessageAndTimeSensitiveData = 1;
    v7->_numDaysOfData = 0;
  }

  return v7;
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  -[ATXNotificationAndSuggestionDatastore numberOfActiveNotificationsWithCompletionHandler:](self->_datastore, "numberOfActiveNotificationsWithCompletionHandler:", a3);
}

- (id)appsSortedByNumOfNotificationsGivenNumOfDays:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  _BOOL4 v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ATXNotificationAndSuggestionDatastore receiveTimeStampOfFirstNotification](self->_datastore, "receiveTimeStampOfFirstNotification");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7 - (double)(86400 * a3);
  __atxlog_handle_notification_management();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 == 0.0)
  {
    if (v10)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Notifications database was empty", (uint8_t *)&v17, 2u);
    }

    v11 = 0;
  }
  else
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "First notification in the database was on: %@", (uint8_t *)&v17, 0xCu);

    }
    v11 = -[ATXDigestSetupFlowProvider numDaysSinceTimestamp:](self, "numDaysSinceTimestamp:", v6);
  }
  self->_numDaysOfData = v11;
  -[ATXNotificationAndSuggestionDatastore appSortedByNumOfNotificationsSinceTimestamp:](self->_datastore, "appSortedByNumOfNotificationsSinceTimestamp:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  -[ATXDigestSetupFlowProvider addRemainingAppsWithNoNotificationVolume:](self, "addRemainingAppsWithNoNotificationVolume:", v14);
  __atxlog_handle_notification_management();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ATXDigestSetupFlowProvider appsSortedByNumOfNotificationsGivenNumOfDays:].cold.1(v14, v15);

  return v14;
}

- (unint64_t)numDaysSinceTimestamp:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:toDate:options:", 16, v5, v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "day") + 1;
  return v8;
}

- (void)addRemainingAppsWithNoNotificationVolume:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "allAppsKnownToSpringBoard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "bundleId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "containsObject:", v14);

        if (v15)
        {
          objc_msgSend(v13, "bundleId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObject:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        v24 = objc_alloc(MEMORY[0x1E0CF8C90]);
        v25 = (void *)objc_msgSend(v24, "initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:", v23, 0, 0, 0, (_QWORD)v26);
        objc_msgSend(v17, "addObject:", v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  objc_msgSend(v8, "addObjectsFromArray:", v17);
}

- (BOOL)containsMessageAndTimeSensitiveData
{
  return self->_containsMessageAndTimeSensitiveData;
}

- (void)setContainsMessageAndTimeSensitiveData:(BOOL)a3
{
  self->_containsMessageAndTimeSensitiveData = a3;
}

- (unint64_t)numDaysOfData
{
  return self->_numDaysOfData;
}

- (void)setNumDaysOfData:(unint64_t)a3
{
  self->_numDaysOfData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastore, 0);
}

- (void)appsSortedByNumOfNotificationsGivenNumOfDays:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "Total number of apps being returned: %lu", (uint8_t *)&v3, 0xCu);
}

@end
