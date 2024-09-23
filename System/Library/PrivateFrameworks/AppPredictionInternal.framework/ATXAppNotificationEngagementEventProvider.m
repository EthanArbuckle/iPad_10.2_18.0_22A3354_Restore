@implementation ATXAppNotificationEngagementEventProvider

- (ATXAppNotificationEngagementEventProvider)initWithModeEventProvider:(id)a3
{
  id v5;
  ATXAppNotificationEngagementEventProvider *v6;
  ATXAppNotificationEngagementEventProvider *v7;
  NSCountedSet *v8;
  NSCountedSet *modeCountOfNotificationsCleared;
  NSCountedSet *v10;
  NSCountedSet *globalCountOfNotificationsCleared;
  NSCountedSet *v12;
  NSCountedSet *modeCountOfNotificationsReceived;
  NSCountedSet *v14;
  NSCountedSet *globalCountOfNotificationsReceived;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXAppNotificationEngagementEventProvider;
  v6 = -[ATXAppNotificationEngagementEventProvider init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modeEventProvider, a3);
    v8 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    modeCountOfNotificationsCleared = v7->_modeCountOfNotificationsCleared;
    v7->_modeCountOfNotificationsCleared = v8;

    v10 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    globalCountOfNotificationsCleared = v7->_globalCountOfNotificationsCleared;
    v7->_globalCountOfNotificationsCleared = v10;

    v12 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    modeCountOfNotificationsReceived = v7->_modeCountOfNotificationsReceived;
    v7->_modeCountOfNotificationsReceived = v12;

    v14 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    globalCountOfNotificationsReceived = v7->_globalCountOfNotificationsReceived;
    v7->_globalCountOfNotificationsReceived = v14;

  }
  return v7;
}

- (BOOL)successfullyCalculatedNotificationEvents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allInstalledAppsKnownToSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Usage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v7, 0, 0, 0, 0);
  objc_msgSend(v10, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_modeEventProvider, "biomePublisherWithBookmark:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke;
  v33[3] = &unk_1E82DBFF8;
  v33[4] = self;
  objc_msgSend(v13, "orderedMergeWithOther:comparator:", v12, v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  v31[0] = &v30;
  v31[1] = 0x3032000000;
  v31[2] = __Block_byref_object_copy__18;
  v31[3] = __Block_byref_object_dispose__18;
  v32 = 0;
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_13;
  v29[3] = &unk_1E82DB658;
  v29[4] = &v30;
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_2;
  v27[3] = &unk_1E82DD4A0;
  v27[4] = self;
  v16 = v6;
  v28 = v16;
  v17 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", v29, v27);
  v18 = *(_QWORD *)(v31[0] + 40);
  if (v18)
  {
    __atxlog_handle_modes();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXAppNotificationEngagementEventProvider successfullyCalculatedNotificationEvents].cold.1((uint64_t)v31, v19, v20, v21, v22, v23, v24, v25);

  }
  _Block_object_dispose(&v30, 8);

  return v18 == 0;
}

uint64_t __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateIntervalFromEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromNotificationEvent:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateIntervalFromEvent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromNotificationEvent:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  if (v10)
  {
    if (v14)
      goto LABEL_16;
    goto LABEL_13;
  }
  __atxlog_handle_modes();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1((uint64_t)v5, v15, v16, v17, v18, v19, v20, v21);

  if (!v14)
  {
LABEL_13:
    __atxlog_handle_modes();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1((uint64_t)v6, v22, v23, v24, v25, v26, v27, v28);

  }
LABEL_16:
  objc_msgSend(v10, "startDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "timeIntervalSinceReferenceDate");
  v31 = v30;

  objc_msgSend(v14, "startDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
  v34 = v33;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v35, "compare:", v36);

  return v37;
}

void __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aggregationEventsFromEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "trackNewModeEvent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), (_QWORD)v12);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v5 = v3;
    objc_msgSend(v5, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "trackNewNotificationEvent:forInstalledApps:", v5, *(_QWORD *)(a1 + 40));
  }

LABEL_10:
}

- (id)dateIntervalFromNotificationEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v7, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)trackNewModeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentModeEvent, a3);
}

- (void)trackNewNotificationEvent:(id)a3 forInstalledApps:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSCountedSet *globalCountOfNotificationsCleared;
  void *v10;
  NSCountedSet *modeCountOfNotificationsCleared;
  void *v12;
  NSCountedSet *globalCountOfNotificationsReceived;
  void *v14;
  NSCountedSet *modeCountOfNotificationsReceived;
  void *v16;
  id v17;

  v6 = a4;
  objc_msgSend(a3, "eventBody");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    if (objc_msgSend(v17, "usageType") == 4)
    {
      globalCountOfNotificationsCleared = self->_globalCountOfNotificationsCleared;
      objc_msgSend(v17, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCountedSet addObject:](globalCountOfNotificationsCleared, "addObject:", v10);

      if (-[ATXAppNotificationEngagementEventProvider notificationEventOccurredWhileInMode:modeTransitionEvent:](self, "notificationEventOccurredWhileInMode:modeTransitionEvent:", v17, self->_mostRecentModeEvent))
      {
        modeCountOfNotificationsCleared = self->_modeCountOfNotificationsCleared;
        objc_msgSend(v17, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCountedSet addObject:](modeCountOfNotificationsCleared, "addObject:", v12);

      }
    }
    if (objc_msgSend(v17, "usageType") == 17 || objc_msgSend(v17, "usageType") == 18)
    {
      globalCountOfNotificationsReceived = self->_globalCountOfNotificationsReceived;
      objc_msgSend(v17, "bundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCountedSet addObject:](globalCountOfNotificationsReceived, "addObject:", v14);

      if (-[ATXAppNotificationEngagementEventProvider notificationEventOccurredWhileInMode:modeTransitionEvent:](self, "notificationEventOccurredWhileInMode:modeTransitionEvent:", v17, self->_mostRecentModeEvent))
      {
        modeCountOfNotificationsReceived = self->_modeCountOfNotificationsReceived;
        objc_msgSend(v17, "bundleID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCountedSet addObject:](modeCountOfNotificationsReceived, "addObject:", v16);

      }
    }
  }

}

- (BOOL)notificationEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "absoluteTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  if (v9 <= v11)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v5, "absoluteTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;
    objc_msgSend(v6, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v14 < v16;

  }
  return v17;
}

- (unint64_t)globalCountOfNotificationsCleared
{
  NSCountedSet *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_globalCountOfNotificationsCleared;
  v4 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += -[NSCountedSet countForObject:](self->_globalCountOfNotificationsCleared, "countForObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v5 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)globalCountOfNotificationsClearedForBundleId:(id)a3
{
  return -[NSCountedSet countForObject:](self->_globalCountOfNotificationsCleared, "countForObject:", a3);
}

- (unint64_t)modeCountOfNotificationsClearedForBundleId:(id)a3
{
  return -[NSCountedSet countForObject:](self->_modeCountOfNotificationsCleared, "countForObject:", a3);
}

- (unint64_t)modeCountOfNotificationsCleared
{
  NSCountedSet *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_modeCountOfNotificationsCleared;
  v4 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += -[NSCountedSet countForObject:](self->_modeCountOfNotificationsCleared, "countForObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v5 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)localNotificationsClearedRateForBundleId:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsClearedForBundleId:](self, "modeCountOfNotificationsClearedForBundleId:", a3);
  v5 = -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsCleared](self, "modeCountOfNotificationsCleared");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)globalNotificationsClearedRateForBundleId:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsClearedForBundleId:](self, "globalCountOfNotificationsClearedForBundleId:", a3);
  v5 = -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsCleared](self, "globalCountOfNotificationsCleared");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)ratioOfLocalToGlobalNotificationsClearedRateForBundleId:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  v4 = a3;
  -[ATXAppNotificationEngagementEventProvider localNotificationsClearedRateForBundleId:](self, "localNotificationsClearedRateForBundleId:", v4);
  v6 = v5;
  -[ATXAppNotificationEngagementEventProvider globalNotificationsClearedRateForBundleId:](self, "globalNotificationsClearedRateForBundleId:", v4);
  v8 = v7;

  result = 0.0;
  if (v8 != 0.0 && v6 != 0.0)
    return v6 / v8;
  return result;
}

- (double)classConditionalOfNotificationsClearedForBundleId:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  double result;

  v4 = a3;
  v5 = -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsClearedForBundleId:](self, "modeCountOfNotificationsClearedForBundleId:", v4);
  v6 = -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsClearedForBundleId:](self, "globalCountOfNotificationsClearedForBundleId:", v4);

  result = 0.0;
  if (v5)
  {
    if (v6)
      return (double)v5 / (double)v6;
  }
  return result;
}

- (unint64_t)globalCountOfNotificationsReceived
{
  NSCountedSet *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_globalCountOfNotificationsReceived;
  v4 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += -[NSCountedSet countForObject:](self->_globalCountOfNotificationsReceived, "countForObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v5 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)modeCountOfNotificationsReceived
{
  NSCountedSet *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_modeCountOfNotificationsReceived;
  v4 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += -[NSCountedSet countForObject:](self->_modeCountOfNotificationsReceived, "countForObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v5 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)globalCountOfNotificationsReceivedForBundleId:(id)a3
{
  return -[NSCountedSet countForObject:](self->_globalCountOfNotificationsReceived, "countForObject:", a3);
}

- (unint64_t)modeCountOfNotificationsReceivedForBundleId:(id)a3
{
  return -[NSCountedSet countForObject:](self->_modeCountOfNotificationsReceived, "countForObject:", a3);
}

- (double)globalPopularityOfNotificationsReceivedForBundleId:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsReceivedForBundleId:](self, "globalCountOfNotificationsReceivedForBundleId:", a3);
  v5 = -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsReceived](self, "globalCountOfNotificationsReceived");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)localPopularityOfNotificationsReceivedForBundleId:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsReceivedForBundleId:](self, "modeCountOfNotificationsReceivedForBundleId:", a3);
  v5 = -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsReceived](self, "modeCountOfNotificationsReceived");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForBundleId:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  v4 = a3;
  -[ATXAppNotificationEngagementEventProvider localPopularityOfNotificationsReceivedForBundleId:](self, "localPopularityOfNotificationsReceivedForBundleId:", v4);
  v6 = v5;
  -[ATXAppNotificationEngagementEventProvider globalPopularityOfNotificationsReceivedForBundleId:](self, "globalPopularityOfNotificationsReceivedForBundleId:", v4);
  v8 = v7;

  result = 0.0;
  if (v8 != 0.0 && v6 != 0.0)
    return v6 / v8;
  return result;
}

- (double)classConditionalOfNotificationsReceivedForBundleId:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  double result;

  v4 = a3;
  v5 = -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsReceivedForBundleId:](self, "modeCountOfNotificationsReceivedForBundleId:", v4);
  v6 = -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsReceivedForBundleId:](self, "globalCountOfNotificationsReceivedForBundleId:", v4);

  result = 0.0;
  if (v5)
  {
    if (v6)
      return (double)v5 / (double)v6;
  }
  return result;
}

- (ATXModeEvent)mostRecentModeEvent
{
  return self->_mostRecentModeEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentModeEvent, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceived, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceived, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsCleared, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsCleared, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
}

- (void)successfullyCalculatedNotificationEvents
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXAppNotificationEngagementEventProvider: Error from merged publishers: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXAppNotificationEngagementEventProvider: During ordered merge, encountered unknown event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
