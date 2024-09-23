@implementation ATXContactNotificationEngagementEventProvider

- (ATXContactNotificationEngagementEventProvider)initWithModeEventProvider:(id)a3
{
  id v5;
  ATXContactNotificationEngagementEventProvider *v6;
  ATXContactNotificationEngagementEventProvider *v7;
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
  v17.super_class = (Class)ATXContactNotificationEngagementEventProvider;
  v6 = -[ATXContactNotificationEngagementEventProvider init](&v17, sel_init);
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Usage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v3, 0, 0, 0, 0);
  objc_msgSend(v6, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityEventProviderProtocol biomePublisherWithBookmark:](self->_modeEventProvider, "biomePublisherWithBookmark:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke;
  v27[3] = &unk_1E82DBFF8;
  v27[4] = self;
  objc_msgSend(v9, "orderedMergeWithOther:comparator:", v8, v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25[0] = &v24;
  v25[1] = 0x3032000000;
  v25[2] = __Block_byref_object_copy__101;
  v25[3] = __Block_byref_object_dispose__101;
  v26 = 0;
  v22[4] = self;
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_11;
  v23[3] = &unk_1E82DB658;
  v23[4] = &v24;
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_2;
  v22[3] = &unk_1E82E7F50;
  v12 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", v23, v22);
  v13 = *(_QWORD *)(v25[0] + 40);
  if (v13)
  {
    __atxlog_handle_modes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXContactNotificationEngagementEventProvider successfullyCalculatedNotificationEvents].cold.1((uint64_t)v25, v14, v15, v16, v17, v18, v19, v20);

  }
  _Block_object_dispose(&v24, 8);

  return v13 == 0;
}

uint64_t __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke(uint64_t a1, void *a2, void *a3)
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
    __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1((uint64_t)v5, v15, v16, v17, v18, v19, v20, v21);

  if (!v14)
  {
LABEL_13:
    __atxlog_handle_modes();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1((uint64_t)v6, v22, v23, v24, v25, v26, v27, v28);

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

void __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_11(uint64_t a1, void *a2)
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

void __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_2(uint64_t a1, void *a2)
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
      objc_msgSend(*(id *)(a1 + 32), "trackNewNotificationEvent:", v5);
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

- (void)trackNewNotificationEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "usageType") == 4)
  {
    objc_msgSend(v4, "contactIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend(v4, "contactIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v40;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v40 != v9)
              objc_enumerationMutation(v6);
            -[NSCountedSet addObject:](self->_globalCountOfNotificationsCleared, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        }
        while (v8);
      }

      if (-[ATXContactNotificationEngagementEventProvider notificationEventOccurredWhileInMode:modeTransitionEvent:](self, "notificationEventOccurredWhileInMode:modeTransitionEvent:", v4, self->_mostRecentModeEvent))
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v4, "contactIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v36;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v36 != v14)
                objc_enumerationMutation(v11);
              -[NSCountedSet addObject:](self->_modeCountOfNotificationsCleared, "addObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          }
          while (v13);
        }

      }
    }
  }
  if (objc_msgSend(v4, "usageType") == 17 || objc_msgSend(v4, "usageType") == 18)
  {
    objc_msgSend(v4, "contactIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v4, "contactIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v17);
            -[NSCountedSet addObject:](self->_globalCountOfNotificationsReceived, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v21++));
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        }
        while (v19);
      }

      if (-[ATXContactNotificationEngagementEventProvider notificationEventOccurredWhileInMode:modeTransitionEvent:](self, "notificationEventOccurredWhileInMode:modeTransitionEvent:", v4, self->_mostRecentModeEvent))
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v4, "contactIDs", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v28;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v28 != v25)
                objc_enumerationMutation(v22);
              -[NSCountedSet addObject:](self->_modeCountOfNotificationsReceived, "addObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v26++));
            }
            while (v24 != v26);
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
          }
          while (v24);
        }

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

- (unint64_t)globalCountOfNotificationsClearedForContactId:(id)a3
{
  return -[NSCountedSet countForObject:](self->_globalCountOfNotificationsCleared, "countForObject:", a3);
}

- (unint64_t)modeCountOfNotificationsClearedForContactId:(id)a3
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

- (double)localNotificationsClearedRateForContactId:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsClearedForContactId:](self, "modeCountOfNotificationsClearedForContactId:", a3);
  v5 = -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsCleared](self, "modeCountOfNotificationsCleared");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)globalNotificationsClearedRateForContactId:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsClearedForContactId:](self, "globalCountOfNotificationsClearedForContactId:", a3);
  v5 = -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsCleared](self, "globalCountOfNotificationsCleared");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)ratioOfLocalToGlobalNotificationsClearedRateForContactId:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  v4 = a3;
  -[ATXContactNotificationEngagementEventProvider localNotificationsClearedRateForContactId:](self, "localNotificationsClearedRateForContactId:", v4);
  v6 = v5;
  -[ATXContactNotificationEngagementEventProvider globalNotificationsClearedRateForContactId:](self, "globalNotificationsClearedRateForContactId:", v4);
  v8 = v7;

  result = 0.0;
  if (v8 != 0.0 && v6 != 0.0)
    return v6 / v8;
  return result;
}

- (double)classConditionalOfNotificationsClearedForContactId:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  double result;

  v4 = a3;
  v5 = -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsClearedForContactId:](self, "modeCountOfNotificationsClearedForContactId:", v4);
  v6 = -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsClearedForContactId:](self, "globalCountOfNotificationsClearedForContactId:", v4);

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

- (unint64_t)globalCountOfNotificationsReceivedForContactId:(id)a3
{
  return -[NSCountedSet countForObject:](self->_globalCountOfNotificationsReceived, "countForObject:", a3);
}

- (unint64_t)modeCountOfNotificationsReceivedForContactId:(id)a3
{
  return -[NSCountedSet countForObject:](self->_modeCountOfNotificationsReceived, "countForObject:", a3);
}

- (double)globalPopularityOfNotificationsReceivedForContactId:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsReceivedForContactId:](self, "globalCountOfNotificationsReceivedForContactId:", a3);
  v5 = -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsReceived](self, "globalCountOfNotificationsReceived");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)localPopularityOfNotificationsReceivedForContactId:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double result;

  v4 = -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsReceivedForContactId:](self, "modeCountOfNotificationsReceivedForContactId:", a3);
  v5 = -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsReceived](self, "modeCountOfNotificationsReceived");
  result = 0.0;
  if (v4)
  {
    if (v5)
      return (double)v4 / (double)v5;
  }
  return result;
}

- (double)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForContactId:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  v4 = a3;
  -[ATXContactNotificationEngagementEventProvider localPopularityOfNotificationsReceivedForContactId:](self, "localPopularityOfNotificationsReceivedForContactId:", v4);
  v6 = v5;
  -[ATXContactNotificationEngagementEventProvider globalPopularityOfNotificationsReceivedForContactId:](self, "globalPopularityOfNotificationsReceivedForContactId:", v4);
  v8 = v7;

  result = 0.0;
  if (v8 != 0.0 && v6 != 0.0)
    return v6 / v8;
  return result;
}

- (double)classConditionalOfNotificationsReceivedForContactId:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  double result;

  v4 = a3;
  v5 = -[ATXContactNotificationEngagementEventProvider modeCountOfNotificationsReceivedForContactId:](self, "modeCountOfNotificationsReceivedForContactId:", v4);
  v6 = -[ATXContactNotificationEngagementEventProvider globalCountOfNotificationsReceivedForContactId:](self, "globalCountOfNotificationsReceivedForContactId:", v4);

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
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXContactNotificationEngagementEventProvider: Error from merged publishers: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXContactNotificationEngagementEventProvider: During ordered merge, encountered unknown event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
